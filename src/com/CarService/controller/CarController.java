package com.CarService.controller;

import com.CarService.domain.Car;
import com.CarService.domain.Parts;
import com.CarService.domain.Worker;
import com.CarService.service.CarService;
import com.CarService.service.ListService;
import com.CarService.service.PartsService;
import com.CarService.service.WorkerService;
import com.CarService.utils.UseParts;
import com.CarService.utils.UsePartsModel;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/car")
public class CarController {
	@Autowired
	private CarService carService;

	@Autowired
	private ListService listService;

	@Autowired
	private PartsService partsService;

	@Autowired
	private WorkerService workerService;

	/**
	 * 格式化日期，将Time类型转换为String
	 * 
	 * @param time 传入一个Date类型，用于获取今天的日期
	 * @return
	 */
	public String getTime(Date time) {
		// 设置日期格式
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return df.format(time);
	}

	/**
	 * 生成总费用，存入数据库 封装成一个函数的原因是，由于本项目的逻辑是一个页面一次对数据库的操作
	 * 而分页操作的中途若是退出操作的话，在没有设置回滚的操作时，有可能会出现总费用异常的BUG 所以需要在有分布操作的函数末尾调用这个函数
	 * 
	 * @param recordID
	 */
	public void generateTotalCount(int recordID) {
		// 需要的信息 总费用 = 配件价格 + 工时费
		// 根据ID和数量调用carDao中的方法计算配件价钱
		List<Integer> partsIDs = listService.findParts(recordID);
		List<Integer> partsNum = new ArrayList<Integer>();
		for (int id : partsIDs) {
			partsNum.add(listService.findCount(recordID, id));
		}
		Double money = 0.0;
		for (int i = 0; i < partsIDs.size(); i++) {
			money += partsService.findParts(partsIDs.get(i)).getPartsPrice() * partsNum.get(i);
		}

		// 把工时费添加进去
		money += carService.findRecord(recordID).getLaborCost();

		// 订单总费用加到数据库
		carService.addCarTotalPrice(recordID, money);
	}

	/**
	 * 测试方法 先保留 最终版需要删除！！！
	 * 
	 * @RequestMapping("test") public String test(Model model) { int recordID = 82;
	 * // 配件信息 找到配件ID 通过配件ID查询配件表 和查询配件数量 List<Integer> partsIDs =
	 * listService.findParts(recordID); List<Integer> partsNum = new
	 * ArrayList<Integer>(); // 需要的信息 配件编号 配件名称 配件单价 使用数量 List<Parts> parts = new
	 * ArrayList<Parts>(); for (int id : partsIDs) {
	 * partsNum.add(listService.findCount(recordID, id));
	 * parts.add(partsService.findParts(id)); } model.addAttribute("parts", parts);
	 * model.addAttribute("partsNum", partsNum);
	 * 
	 * // 员工信息 找到工号 通过工号查询 List<Integer> workerIDs =
	 * listService.findWorker(recordID); // 需要的信息 维修人员 List<Worker> worker = new
	 * ArrayList<Worker>(); for (int id : workerIDs) {
	 * worker.add(workerService.findWorker(id)); } model.addAttribute("worker",
	 * worker);
	 * 
	 * // 车辆信息 直接通过recordID查询 // 需要的信息 编号 车牌号 型号 里程 客户名 客户电话 工时费 进厂时间 出厂时间 Car car =
	 * carService.findRecord(recordID); model.addAttribute("car", car);
	 * 
	 * // 需要的信息 总费用 = 配件价格 + 工时费 // 根据ID和数量调用carDao中的方法计算配件价钱 Double money = 0.0;
	 * for (int i = 0; i < partsIDs.size(); i++) { money +=
	 * partsService.findParts(partsIDs.get(i)).getPartsPrice() * partsNum.get(i); }
	 * model.addAttribute("money", money); return "/showBill"; }
	 */
	/*
	 * 登陆
	 */
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(@RequestParam("Account") String Account, @RequestParam("Password") String Password,
			Model model) {
		if (Account.equals("admin") && Password.equals("admin")) {
			return "index";
		} else
			return "/login";
	}

	@RequestMapping(value = "/login1")
	public String login() {
		return "/login";
	}

	/**
	 * 寻找全部订单信息，用于显示在首页
	 * 
	 * @param model 用于存储全部订单信息
	 * @return
	 */
	@RequestMapping("/findAllCar")
	public String findAllCar(Model model) {
		List<Car> cars = carService.findAllRecords();

		// 获取的时候直接${cars} 也就是${} 中间加入前面双引号内的内容 可以取到后面的值
		// 记得注意类型 像这个类型是 List<Car>
		model.addAttribute("cars", cars);
		return "cars";
	}

	/**
	 * 添加档案 分为两部分
	 * 
	 * @param car   传入car实体，存入数据库
	 * @param id1   员工1的ID
	 * @param id2   员工2的ID
	 * @param id3   员工3的ID
	 * @param model 用于传入成功或失败信息
	 * @return
	 */
	@RequestMapping("addRecord_part1")
	public String addRecord_part1(@ModelAttribute("car") Car car, @RequestParam("id1") String id1,
			@RequestParam("id2") String id2, @RequestParam("id3") String id3, Model model) {
		car.setStartService(getTime(new Date()));
		carService.addRecord(car);
		// 通过调用数据库找到最新的一条记录
		int recordID = carService.findBiggestRecord().getRecordID();

		List<Worker> workers = new ArrayList<Worker>();
		// 通过过传来的ID找到员工信息
		// 检测任何一种为空的情况 避免空的ID被加入到数组中
		// 加入数组首先需要转换成int型 （wjz改）
		if (!id1.isEmpty()) {
			int ID1 = Integer.parseInt(id1);
			workers.add(workerService.findWorker(ID1));
		}
		if (!id2.isEmpty()) {
			int ID2 = Integer.parseInt(id2);
			workers.add(workerService.findWorker(ID2));
		}
		if (!id3.isEmpty()) {
			int ID3 = Integer.parseInt(id3);
			workers.add(workerService.findWorker(ID3));
		}
		for (Worker worker : workers) {
			System.out.println(worker.getWorkerID());
		}
		// 若有一个员工正在修车数不为0，就都不通过
		for (Worker worker : workers) {
			if (workerService.findWorker(worker.getWorkerID()).getWorkingNumber() != 0) {
				// 因为不通过，所以要把这个删除掉
				carService.deleteRecord(recordID);
				model.addAttribute("errMsg", worker.getWorkerName() + "员工已达修车数上限，请重新选择");
			}
		}
		// 经过上面的检测，下面就不用执行逻辑判断，直接添加
		for (Worker worker : workers) {
			listService.addRecordWorker(recordID, worker.getWorkerID());
			// 让该名员工的workingNumber变为1
			workerService.changeWorkingNumber(worker.getWorkerID(), 1);
		}
		// 把ID传过去，给下面的方法用
		model.addAttribute("recordID", recordID);

		return "/insertfittings";
	}

	/**
	 * 添加档案 第二部分
	 * 
	 * @param usePartsModel 传入工具类，用于计算和记录配件的使用数量
	 * @param model         用于显示成功或失败信息
	 * @return
	 */
	@RequestMapping("addRecord_part2")
	public String addRecord_part2(UsePartsModel usePartsModel, Model model) {
		int recordID = carService.findBiggestRecord().getRecordID();
		for (UseParts useParts : usePartsModel.getUseParts()) {
			if (useParts.getUseNumber() == 0 && useParts.getPartsIDs() == 0) {
				if (usePartsModel.getUseParts().size() == 1) {
					model.addAttribute("recordID", recordID);
					return "/insertfittings";
				}
			}
		}
		// 检测库存是否充足
		for (UseParts useParts : usePartsModel.getUseParts()) {
			if (useParts.getUseNumber() > partsService.findParts(useParts.getPartsIDs()).getPartsNumber()) {
				model.addAttribute("errMsg", "编号为" + useParts.getPartsIDs() + "的配件库存不足，请全部重新输入");
				return "/insertfittings";
			}
		}
		// 经过上面的检测，下面直接添加
		for (UseParts useParts : usePartsModel.getUseParts()) {
			if (useParts.getPartsIDs() != 0 || useParts.getUseNumber() != 0) {
				listService.addRecordParts(recordID, useParts.getPartsIDs(), useParts.getUseNumber());
				partsService.useParts(useParts.getPartsIDs(), useParts.getUseNumber());
				Parts parts = partsService.findParts(useParts.getPartsIDs());
				partsService.updateOprationLog(useParts.getPartsIDs(), getTime(new Date()) + "  :  取出数量 "
						+ useParts.getUseNumber() + "    目前数量 " + parts.getPartsNumber());
			}
		}

		// 生成总费用并存入数据库
		generateTotalCount(recordID);

		model.addAttribute("success", "添加成功");
		return "/carfiles";
	}

	/**
	 * 更新档案 分为三部分 先是修改车辆信息
	 * 
	 * @param recordID 传入订单ID，用于锁定数据库中某订单
	 * @param car      传入car实体，存入数据库
	 */
	@RequestMapping("changeRecord_part1")
	public String changeRecord_part1(@RequestParam("recordID") int recordID, @ModelAttribute("car") Car car,
			Model model) {
		// 判断前后工时费有无差异
		Double num1 = carService.findRecord(recordID).getLaborCost();
		carService.changeRecord(recordID, car);
		Double num2 = carService.findRecord(recordID).getLaborCost();

		// 避免用户直接在这一步退出，导致利润和总价钱计算BUG
		if (num1 != num2) {
			// 生成总费用并存入数据库
			generateTotalCount(recordID);
		}

		model.addAttribute("recordID", recordID);
		return "/modifyfile2";
	}

	/**
	 * 更新档案 第二部分 修改订单绑定的工人信息
	 * 
	 * @param recordID 传入订单ID，用于锁定数据库中某订单
	 * @param id1      员工1的ID
	 * @param id2      员工2的ID
	 * @param id3      员工3的ID
	 * @param model    用于传入成功或失败信息
	 * @return
	 */
	@RequestMapping("changeRecord_part2")
	public String changeRecord_part2(@RequestParam("recordID") int recordID, @RequestParam("id1") String id1,
			@RequestParam("id2") String id2, @RequestParam("id3") String id3, Model model) {
		if (id3 == "" && id2 == "" && id1 == "") {
			model.addAttribute("recordID", recordID);
			return "/modifyfile3";
		} else {
			List<Worker> workers = new ArrayList<Worker>();
			// 通过过传来的ID找到员工信息
			// 检测任何一种为空的情况 避免空的ID被加入到数组中
			// 加入数组首先需要转换成int型
			if (id1 != "") {
				int ID1 = Integer.parseInt(id1);
				workers.add(workerService.findWorker(ID1));
			}
			if (id2 != "") {
				int ID2 = Integer.parseInt(id2);
				workers.add(workerService.findWorker(ID2));
			}
			if (id3 != "") {
				int ID3 = Integer.parseInt(id3);
				workers.add(workerService.findWorker(ID3));
			}
			// 判断新添加的人员是否已经在订单列表中
			for (Worker worker : workers) {
				for (int id : listService.findWorker(recordID)) {
					if (worker.getWorkerID() == id) {
						model.addAttribute("errMsg", "员工" + worker.getWorkerName() + "已经在订单列表中了，不能再次添加");
						model.addAttribute("recordID", recordID);
						return "/modifyfile2";
					}
				}
			}

			// 判断订单人员是否超出人数上限
			int num1 = listService.findWorker(recordID).size();
			int num2 = workers.size();
			if (num1 + num2 > 3) {
				model.addAttribute("errMsg", "一个订单的员工上限为3人，请重新输入");
				model.addAttribute("recordID", recordID);
				return "/modifyfile2";
			} else {
				for (Worker worker : workers) {
					if (workerService.findWorker(worker.getWorkerID()).getWorkingNumber() != 0) {
						model.addAttribute("errMsg", worker.getWorkerName() + "员工已达修车数上限，请重新选择");
					}
				}
				// 经过上面的检测，下面就不用执行逻辑判断，直接添加
				for (Worker worker : workers) {
					listService.addRecordWorker(recordID, worker.getWorkerID());
					// 让该名员工的workingNumber变为1
					if (carService.findRecord(recordID).getFinishService() == null) {
						workerService.changeWorkingNumber(worker.getWorkerID(), 1);
					}
				}
				model.addAttribute("recordID", recordID);
				return "/modifyfile3";
			}
		}
	}

	/**
	 * 更新档案 第三部分 修改订单绑定的配件信息
	 * 
	 * @param recordID      传入订单id，用于锁定list表中的某订单
	 * @param usePartsModel 传入工具类，用于计算和记录配件的使用数量
	 * @param model         用于显示成功或失败信息
	 * @return
	 */
	@RequestMapping("changeRecord_part3")
	public String changeRecord_part3(@RequestParam("recordID") Integer recordID, UsePartsModel usePartsModel,
			Model model) {
		for (UseParts useParts : usePartsModel.getUseParts()) {
			if (useParts.getUseNumber() == 0 && useParts.getPartsIDs() == 0) {
				if (usePartsModel.getUseParts().size() == 1)
					return "/carfiles";
			}
		}
		// 检测库存是否充足 且 判断新添加的配件是否已经在订单列表中
		for (UseParts useParts : usePartsModel.getUseParts()) {
			if (useParts.getUseNumber() > partsService.findParts(useParts.getPartsIDs()).getPartsNumber()) {
				model.addAttribute("errMsg", "编号为" + useParts.getPartsIDs() + "的配件库存不足，请全部重新输入");
				model.addAttribute("recordID", recordID);
				return "/modifyfile3";
			}
			for (int id : listService.findParts(recordID)) {
				if (useParts.getPartsIDs() == id) {
					model.addAttribute("errMsg", "编号为" + id + "的配件已经在订单列表中了，不能再次添加");
				}
			}
		}
		// 经过上面的检测，下面直接添加
		for (UseParts useParts : usePartsModel.getUseParts()) {
			if (useParts.getPartsIDs() != 0) {
				listService.addRecordParts(recordID, useParts.getPartsIDs(), useParts.getUseNumber());
				partsService.useParts(useParts.getPartsIDs(), useParts.getUseNumber());

				Parts parts = partsService.findParts(useParts.getPartsIDs());
				partsService.updateOprationLog(useParts.getPartsIDs(), getTime(new Date()) + "  :  取出数量 "
						+ useParts.getUseNumber() + "    目前数量 " + parts.getPartsNumber());
			}
		}
		for (UseParts useParts : usePartsModel.getUseParts()) {
			if (useParts.getPartsIDs() == 0 && useParts.getUseNumber() != 0) {
				listService.addRecordParts(recordID, useParts.getPartsIDs(), useParts.getUseNumber());
				partsService.useParts(useParts.getPartsIDs(), useParts.getUseNumber());

				Parts parts = partsService.findParts(useParts.getPartsIDs());
				partsService.updateOprationLog(useParts.getPartsIDs(), getTime(new Date()) + "  :  取出数量 "
						+ useParts.getUseNumber() + "    目前数量 " + parts.getPartsNumber());
			}
		}

		// 这部分是算出总费用加到数据库，以免造成利润和总价格冲突出错
		// 在已经结账的情况下，也就是有最终价格的情况下，才需要这一步
		if (carService.findRecord(recordID).getTotalCost() != null) {
			// 生成总费用并存入数据库
			generateTotalCount(recordID);
		}

		model.addAttribute("recordID", recordID);
		model.addAttribute("success", "添加成功");
		return "/carfiles";
	}

	/**
	 * 删除List表中的某个订单的某个worker
	 * 
	 * @param recordID
	 * @param workerID
	 * @param model
	 * @return
	 */
	@RequestMapping("deleteListWorker")
	public String deleteListWorker(@RequestParam("recordID") Integer recordID, @RequestParam("workerID") int workerID,
			Model model) {
		listService.deleteRecordWorker(recordID, workerID);

		// 订单完成的状态下，如果改变该订单的员工，则需要判断改员工是否正在别的订单工作中
		// 工人已经在别的订单工作时，不可以把工人变成空闲状态
		// 而当工人并没有开始新的工作时 才需要改动

		// 订单未结账的状态下
		if (carService.findRecord(recordID).getFinishService() == null) {
			workerService.changeWorkingNumber(workerID, 0);
		}

		model.addAttribute("recordID", recordID);
		model.addAttribute("success", "工人与订单解除绑定成功");
		return "/modifyfile2";
	}

	/**
	 * 删除List表中的某个订单的某个parts
	 * 
	 * @param recordID
	 * @param partsID
	 * @param model
	 * @return
	 */
	@RequestMapping("deleteListParts")
	public String deleteListParts(@RequestParam("recordID") int recordID, @RequestParam("partsID") int partsID,
			Model model) {
		int num = listService.findCount(recordID, partsID);
		listService.deleteRecordParts(recordID, partsID);

		// 把使用了的配件数量返还到配件仓库中
		partsService.useParts(partsID, -num);

		Parts parts = partsService.findParts(partsID);
		partsService.updateOprationLog(partsID,
				getTime(new Date()) + "  :  存入数量 " + num + "    目前数量 " + parts.getPartsNumber());

		generateTotalCount(recordID);

		model.addAttribute("recordID", recordID);
		model.addAttribute("success", "删除使用的配件信息成功");
		return "/modifyfile3";
	}

	/**
	 * 改变List表中某个订单的某个配件的数量
	 * 
	 * @param recordID
	 * @param partsID
	 * @param n
	 * @param model
	 * @return
	 */
	@RequestMapping("changeListPartsNumber")
	public String changeListPartsNumber(@RequestParam("recordID") int recordID, @RequestParam("partsID") int partsID,
			@RequestParam("n") int n, Model model) {
		// 先判断是减少数量还是增加数量
		int num_before = listService.findCount(recordID, partsID);
		if (num_before < n) {
			// 增加使用数量的情况 要判断库存中是否有足够的数量
			int num_sum = partsService.findParts(partsID).getPartsNumber();
			// 数量足够的情况
			if (num_sum >= n - num_before) {
				partsService.useParts(partsID, n);

				Parts parts = partsService.findParts(partsID);
				partsService.updateOprationLog(partsID,
						getTime(new Date()) + "  :  取出数量 " + n + "    目前数量 " + parts.getPartsNumber());

				generateTotalCount(recordID);

				listService.changeRecordPartsNumber(recordID, partsID, n);
			} else {
				model.addAttribute("errMsg", "库存数量不足，请重新操作");
				model.addAttribute("recordID", recordID);
				return "/modifyfile3";
			}
		} else {
			listService.changeRecordPartsNumber(recordID, partsID, n);
			model.addAttribute("recordID", recordID);
			model.addAttribute("success", "改变配件使用数量成功");
		}

		return "/modifyfile3";
	}

	/**
	 * 删除账单
	 * 
	 * @param recordID 传入订单ID，用于锁定数据库中某订单
	 * @param model    用于显示成功信息
	 * @return
	 */
	@RequestMapping("deleteRecord")
	public String deleteRecord(@RequestParam("recordID") int recordID, Model model) {
		// 还未出厂 需要返还材料 而且要把这个档案的工人变成为修车状态
		if (carService.findRecord(recordID).getFinishService() == null) {
			List<Integer> partsIDs = listService.findParts(recordID);
			List<Integer> workerIDs = listService.findWorker(recordID);
			for (int partsID : partsIDs) {
				int num = listService.findCount(recordID, partsID);
				partsService.useParts(partsID, -num);

				Parts parts = partsService.findParts(partsID);
				partsService.updateOprationLog(partsID,
						getTime(new Date()) + "  :  存入数量 " + num + "    目前数量 " + parts.getPartsNumber());
			}
			for (int workerID : workerIDs) {
				workerService.changeWorkingNumber(workerID, 0);
			}
		}
		// 返还完毕 可以删除记录了
		// 或者说已经出厂了 不需要返还材料 工人也已经处于未修车状态 也可以直接删除记录
		listService.deleteRecord(recordID);
		carService.deleteRecord(recordID);
		model.addAttribute("success", "删除档案成功");
		return "/carfiles";
	}

	/**
	 * 支付账单，对应 结账 按钮
	 * 
	 * @param recordID 传入订单ID，用于锁定数据库中某订单
	 * @param model    用于显示成功信息
	 * @return
	 */
	@RequestMapping("payMoney")
	public String payMoney(@RequestParam("recordID") int recordID, Model model) {
		String finishService = getTime(new Date());
		carService.addCarFinishTime(recordID, finishService);

		// 生成总费用并存入数据库
		generateTotalCount(recordID);

		List<Integer> worksIDs = listService.findWorker(recordID);
		for (int id : worksIDs) {
			workerService.changeWorkingNumber(id, 0);
		}
		model.addAttribute("success", "结账成功");
		model.addAttribute("recordID", recordID);
		return "/carfiles";
	}

	/**
	 * 查询指定月的利润 昨天 和 今天 利润对比 这个月 和 上个月 利润对比 今年 和 上一年 利润对比
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping("showProfit")
	public String showProfit(@RequestParam("year") String year, Model model) {
		// 先获取全部车的信息，然后根据finishService来判断，把已经结账的账单存到另一个列表中
		List<Car> allCars = carService.findAllRecords();
		List<Car> paiedCars = new ArrayList<Car>();
		for (Car car : allCars) {
			// 已结账 也就是有总金额的 才能算进利润范围
			if (car.getFinishService() != null) {
				paiedCars.add(car);
			}
		}

		// 先找到最早的一张订单的日期 以此开始计算每月利润
		String firstTime = carService.findFirstRecord().getFinishService(); // 首日完整时间
		String firstYear = firstTime.substring(0, 4); // 首年
		String firstMonth = firstTime.substring(5, 7); // 首月
		String firstDate = firstTime.substring(8, 10); // 首日

		String today = getTime(new Date()); // 今天完整时间
		String todayYear = today.substring(0, 4); // 今年
		String todayMonth = today.substring(5, 7); // 今月
		String todayDate = today.substring(8, 10); // 今日

		// 寻找指定年份的月利润
		Double profit[] = new Double[12];
		// 初始化数组，全0
		for (int j = 0; j < profit.length; j++) {
			profit[j] = 0.0;
		}
		// 全部账单中，按每个月分好
		for (Car car : paiedCars) {
			// 匹配年份，排除不是 i 年份的订单
			if (car.getFinishService().substring(0, 4).compareTo(year) == 0) {
				// 循环把每个订单的利润都分别加到对应月数的位置，这个位置是根据月份来排的

				// 先计算配件成本，总费用减去配件总成本就是利润
				List<Integer> partsIDs = listService.findParts(car.getRecordID());
				Double money = 0.0; // 利润
				Double sum = 0.0; // 成本
				for (int partsID : partsIDs) {
					// 获取数量和成本 for出一个整体的配件成本
					int count = listService.findCount(car.getRecordID(), partsID);
					Double buyingPrice = partsService.findParts(partsID).getBuyingPrice();
					sum += count * buyingPrice;
				}
				// 利润=总费用-配件总成本
				money += car.getTotalCost() - sum;
				profit[Integer.parseInt(car.getFinishService().substring(5, 7)) - 1] += money;
			}
		}
		// 取值的时候直接取年份
		model.addAttribute("year", profit);

		// 前一天的利润和今天的利润对比
		// 要考虑今天是不是1号的问题
		if (todayDate.compareTo("01") == 0) {
			model.addAttribute("errMsg", "今天是1号，跨月的日利润请自行查询");
		} else {
			Double profit1 = 0.0; // 前一天的利润
			Double profit2 = 0.0; // 今天的利润
			for (Car car : paiedCars) {
				// 前一天
				if (car.getFinishService().substring(0, 4).compareTo(todayYear) == 0
						&& car.getFinishService().substring(5, 7).compareTo(todayMonth) == 0 && Integer
								.parseInt(car.getFinishService().substring(8, 10)) == Integer.parseInt(todayDate) - 1) {

					// 先计算配件成本，总费用减去配件总成本就是利润
					List<Integer> partsIDs = listService.findParts(car.getRecordID());

					Double sum = 0.0; // 成本
					for (int partsID : partsIDs) {
						// 获取数量和成本 for出一个整体的配件成本
						int count = listService.findCount(car.getRecordID(), partsID);
						Double buyingPrice = partsService.findParts(partsID).getBuyingPrice();
						sum += count * buyingPrice;
					}
					// 利润=总费用-配件总成本
					profit1 += car.getTotalCost() - sum;
				}
				// 今天
				else if (car.getFinishService().substring(0, 4).compareTo(todayYear) == 0
						&& car.getFinishService().substring(5, 7).compareTo(todayMonth) == 0
						&& car.getFinishService().substring(8, 10).compareTo(todayDate) == 0) {

					// 先计算配件成本，总费用减去配件总成本就是利润
					List<Integer> partsIDs = listService.findParts(car.getRecordID());

					Double sum = 0.0; // 成本
					for (int partsID : partsIDs) {
						// 获取数量和成本 for出一个整体的配件成本
						int count = listService.findCount(car.getRecordID(), partsID);
						Double buyingPrice = partsService.findParts(partsID).getBuyingPrice();
						sum += count * buyingPrice;
					}
					// 利润=总费用-配件总成本
					profit2 += car.getTotalCost() - sum;
				}
			}
			// 今天与昨天的利润差
			Double Profit = profit2 - profit1;
			if (Profit > 0)
				model.addAttribute("dayCompare", String.valueOf("+" + Profit));
			else
				model.addAttribute("dayCompare", String.valueOf(Profit));
		}

		// 上个月利润和这个月利润对比
		// 要考虑到这个月是不是1月的问题
		if (todayMonth.compareTo("01") == 0) {
			model.addAttribute("errMsg", "这个月是1月，跨年的月利润请自行查询");
		} else {
			Double profit1 = 0.0; // 上个月的利润
			Double profit2 = 0.0; // 这个月的利润
			for (Car car : paiedCars) {
				// 上个月
				if (car.getFinishService().substring(0, 4).compareTo(todayYear) == 0 && Integer
						.parseInt(car.getFinishService().substring(5, 7)) == Integer.parseInt(todayMonth) - 1) {

					// 先计算配件成本，总费用减去配件总成本就是利润
					List<Integer> partsIDs = listService.findParts(car.getRecordID());

					Double sum = 0.0; // 成本
					for (int partsID : partsIDs) {
						// 获取数量和成本 for出一个整体的配件成本
						int count = listService.findCount(car.getRecordID(), partsID);
						Double buyingPrice = partsService.findParts(partsID).getBuyingPrice();
						sum += count * buyingPrice;
					}
					// 利润=总费用-配件总成本
					profit1 += car.getTotalCost() - sum;
				}
				// 这个月
				else if (car.getFinishService().substring(0, 4).compareTo(todayYear) == 0
						&& car.getFinishService().substring(5, 7).compareTo(todayMonth) == 0) {

					// 先计算配件成本，总费用减去配件总成本就是利润
					List<Integer> partsIDs = listService.findParts(car.getRecordID());

					Double sum = 0.0; // 成本
					for (int partsID : partsIDs) {
						// 获取数量和成本 for出一个整体的配件成本
						int count = listService.findCount(car.getRecordID(), partsID);
						Double buyingPrice = partsService.findParts(partsID).getBuyingPrice();
						sum += count * buyingPrice;
					}
					// 利润=总费用-配件总成本
					profit2 += car.getTotalCost() - sum;
				}
			}
			// 这个月和上个月的利润差
			Double Profit = profit2 - profit1;
			if (Profit > 0)
				model.addAttribute("monthCompare", String.valueOf("+" + Profit));
			else
				model.addAttribute("monthCompare", String.valueOf(Profit));
		}

		Double profit1 = 0.0; // 上一年的利润
		Double profit2 = 0.0; // 今年的利润
		// 上一年的利润和今年的利润对比
		for (Car car : paiedCars) {
			// 上一年
			if (Integer.parseInt(car.getFinishService().substring(0, 4)) == Integer.parseInt(todayYear) - 1) {

				// 先计算配件成本，总费用减去配件总成本就是利润
				List<Integer> partsIDs = listService.findParts(car.getRecordID());

				Double sum = 0.0; // 成本
				for (int partsID : partsIDs) {
					// 获取数量和成本 for出一个整体的配件成本
					int count = listService.findCount(car.getRecordID(), partsID);
					Double buyingPrice = partsService.findParts(partsID).getBuyingPrice();
					sum += count * buyingPrice;
				}
				// 利润=总费用-配件总成本
				profit1 += car.getTotalCost() - sum;
			}
			// 今年
			else if (car.getFinishService().substring(0, 4).compareTo(todayYear) == 0) {

				// 先计算配件成本，总费用减去配件总成本就是利润
				List<Integer> partsIDs = listService.findParts(car.getRecordID());

				Double sum = 0.0; // 成本
				for (int partsID : partsIDs) {
					// 获取数量和成本 for出一个整体的配件成本
					int count = listService.findCount(car.getRecordID(), partsID);
					Double buyingPrice = partsService.findParts(partsID).getBuyingPrice();
					sum += count * buyingPrice;
				}
				// 利润=总费用-配件总成本
				profit2 += car.getTotalCost() - sum;
			}
		}
		// 今年与上一年的利润差
		Double Profit = profit2 - profit1;
		if (Profit > 0)
			model.addAttribute("yearCompare", String.valueOf("+" + Profit));
		else
			model.addAttribute("yearCompare", String.valueOf(Profit));
		return "/statistics";
	}

	/**
	 * 用于显示账单某账单的详细信息，对应more按钮
	 * 
	 * @param recordID 传入订单ID，用于在数据库中锁定某订单
	 * @param model    用于获取各种在订单详情上需要显示的信息
	 * @return
	 */
	@RequestMapping("showBill")
	public String showBill(@RequestParam("recordID") int recordID, Model model) {
		// 配件信息 找到配件ID 通过配件ID查询配件表 和查询配件数量
		List<Integer> partsIDs = listService.findParts(recordID);
		List<Integer> partsNum = new ArrayList<Integer>();
		// 需要的信息 配件编号 配件名称 配件单价 使用数量
		List<Parts> parts = new ArrayList<Parts>();
		for (int id : partsIDs) {
			partsNum.add(listService.findCount(recordID, id));
			parts.add(partsService.findParts(id));
		}
		model.addAttribute("parts", parts);
		model.addAttribute("partsNum", partsNum);

		// 员工信息 找到工号 通过工号查询
		List<Integer> workerIDs = listService.findWorker(recordID);
		// 需要的信息 维修人员
		List<Worker> worker = new ArrayList<Worker>();
		for (int id : workerIDs) {
			worker.add(workerService.findWorker(id));
		}
		model.addAttribute("worker", worker);

		// 车辆信息 直接通过recordID查询
		// 需要的信息 编号 车牌号 型号 里程 客户名 客户电话 工时费 进厂时间 出厂时间
		Car car = carService.findRecord(recordID);

		// 需要的信息 总费用 = 配件价格 + 工时费
		// 根据ID和数量调用carDao中的方法计算配件价钱
		Double money = 0.0;
		for (int i = 0; i < partsIDs.size(); i++) {
			money += partsService.findParts(partsIDs.get(i)).getPartsPrice() * partsNum.get(i);
		}

		// 把订单总费用添加进去
		money += carService.findRecord(recordID).getLaborCost();

		model.addAttribute("money", money);
		model.addAttribute("car", car);

		return "/details_carfile";
	}

	@RequestMapping(value = "/details_carfile")
	public String todetails_file() {
		return "details_carfile";
	}

	@RequestMapping(value = "/carfiles")
	public String tocarfiles() {
		return "carfiles";
	}

	@RequestMapping(value = "/index")
	public String toindex() {
		return "index";
	}

	@RequestMapping(value = "/Insertfile")
	public String toInsertfile() {
		return "Insertfile";
	}

	@RequestMapping(value = "/modifyfile1")
	public String tomodifyfile1() {
		return "modifyfile1";
	}

	@RequestMapping(value = "/modifyfile2")
	public String tomodifyfile2() {
		return "modifyfile2";
	}

	@RequestMapping(value = "/modifyfile3")
	public String tomodifyfile3() {
		return "modifyfile3";
	}

}
