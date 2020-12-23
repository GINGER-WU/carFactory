package com.CarService.controller;

import com.CarService.domain.Car;
import com.CarService.domain.Parts;
import com.CarService.service.CarService;
import com.CarService.service.ListService;
import com.CarService.service.PartsService;
import com.CarService.utils.PartsModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/parts")
public class PartsController {

    @Autowired
    private PartsService partsService;

    @Autowired
    private ListService listService;

    @Autowired
    private CarService carService;

    /**
     * 格式化日期，将Time类型转换为String
     * @param time  传入一个Date类型，用于获取今天的日期
     * @return
     */
    public String getTime(Date time){
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
        return df.format(time);
    }

    /**
     * 本函数应用于——改动了配件售价和进货价的时候，总价并不会变的BUG
     * 暂不考虑效率和数据库负载的问题
     */
    public void generateAllTotalCount(){
        // 获取全部订单的订单ID
        List<Car> cars=carService.findAllRecords();
        List<Integer> recordIDs=new ArrayList<Integer>();
        for(Car car:cars){
            recordIDs.add(car.getRecordID());
        }

        // 遍历一次这些订单，全部更新一次总费用
        // 需要的信息  总费用  = 配件价格 + 工时费
        // 根据ID和数量调用carDao中的方法计算配件价钱
        for (int recordID:recordIDs){
            List<Integer> partsIDs=listService.findParts(recordID);
            List<Integer> partsNum=new ArrayList<Integer>();
            for(int id : partsIDs){
                partsNum.add(listService.findCount(recordID,id));
            }
            Double money=0.0;
            for (int i=0;i<partsIDs.size();i++){
                money+=partsService.findParts(partsIDs.get(i)).getPartsPrice()*partsNum.get(i);
            }

            // 把工时费添加进去
            money+=carService.findRecord(recordID).getLaborCost();

            // 订单总费用加到数据库
            carService.addCarTotalPrice(recordID,money);
        }
    }

    /**
     * 查询所有的配件信息
     * @param model         用于存储配件列表的信息
     * @return
     */
    @RequestMapping("/findAllParts")
    public String findAllParts(Model model){
        List<Parts> parts=partsService.findAllParts();

        // 获取的时候直接${parts}
        model.addAttribute("parts",parts);

        // 要变
        return "/";
    }

    /**
     * 录入配件信息
     * @param partsModel   传入一个配件实体列表
     * @param model        用于显示成功信息
     * @return
     */
    @RequestMapping("/addParts")
    public String addParts(PartsModel partsModel, Model model){
        for (Parts parts:partsModel.getParts()){
            partsService.addParts(parts);
            partsService.updateOprationLog(parts.getPartsID(),getTime(new Date())+"  :  新商品入库，目前数量 "+parts.getPartsNumber());
        }

        model.addAttribute("success","添加配件信息成功");

        // 要变
        return "/Warehouse";
    }

    /**
     * 更新配件信息
     * @param parts   传入一个配件实体，存入数据库
     * @param model   用于显示成功信息
     * @return
     */
    @RequestMapping("changeParts")
    public String changeParts(@ModelAttribute("parts") Parts parts, Model model){
        // 页面的话  这里可以把id一栏设置为不可修改，其他都可以改，这样就可以避免ID重复出错

        // 取前后对比写进操作日志
        int num1=partsService.findParts(parts.getPartsID()).getPartsNumber();
        String bPN=partsService.findParts(parts.getPartsID()).getPartsName();
        String bVI=partsService.findParts(parts.getPartsID()).getVenderInfo();
        String bOL=partsService.findParts(parts.getPartsID()).getOprationLog();
        Double bPP=partsService.findParts(parts.getPartsID()).getPartsPrice();
        Double bBP=partsService.findParts(parts.getPartsID()).getBuyingPrice();
        String aOL="";
        partsService.changeParts(parts,parts.getPartsID());
        int num2=partsService.findParts(parts.getPartsID()).getPartsNumber();
        int num=num2-num1;
        if(num>0){
            aOL="  :  存入数量 "+num+"    目前数量 "+parts.getPartsNumber();
            partsService.updateOprationLog(parts.getPartsID(),getTime(new Date())+aOL);
        }
        else if (num<0){
        	aOL="  :  取出数量 "+num+"    目前数量 "+parts.getPartsNumber();
        	partsService.updateOprationLog(parts.getPartsID(),getTime(new Date())+aOL);
        }
        else{
        	 partsService.updateOprationLog(parts.getPartsID(),bOL);
        }

        // 更新总费用
        generateAllTotalCount();
       
        model.addAttribute("success","修改配件信息成功");

        // 要变
        return "/Warehouse";
    }

    /**
     * 删除配件信息
     * @param partsID   传入配件ID，用于锁定工人信息在数据库中的某行
     * @param model     用于显示成功信息
     * @return
     */
    @RequestMapping("/deleteParts")
    public String deleteParts(@RequestParam("partsID") int partsID, Model model){
        partsService.deleteParts(partsID);
        model.addAttribute("success","删除配件信息成功");

        // 要变
        return "/Warehouse";
    }
    @RequestMapping(value = "search")
    public String toSearch() {
        return "/search";
    }
    @RequestMapping(value = "/addfittings")
    public String toaddfittings() {
        return "addfittings";
    }
    @RequestMapping(value = "/Warehouse")
    public String toWarehouse() {
        return "Warehouse";
    }
    @RequestMapping(value = "/modifyfittings")
    public String tomodifyfittings() {
        return "modifyfittings";
    }
}
