package com.CarService.controller;

import com.CarService.domain.Worker;
import com.CarService.service.WorkerService;
import com.CarService.utils.WorkerModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/worker")
public class WorkerController {

    @Autowired
    private WorkerService workerService;

    /**
     * 查询所有的工人信息
     * @param model   用于存储工人列表的信息
     * @return
     */
    @RequestMapping("/findAllWorker")
    public String findAllWorker(Model model){
        List<Worker> workers=workerService.findAllWorker();

        // 获取的时候直接${workers}
        model.addAttribute("workers",workers);
        return "workers";
    }

    /**
     * 录入工人信息
     * @param workerModel   传入一个工人实体列表
     * @param model         用于显示成功信息
     * @return
     */
    @RequestMapping("addWorker")
    public String addWorker(WorkerModel workerModel, Model model){
        for(Worker worker:workerModel.getWorkers()){
            workerService.addWorker(worker);
        }
        model.addAttribute("success","录入员工信息完成");

        // 要变
        return "/worker";
    }

    /**
     * 更新工人信息
     * @param worker   传入工人实体，存入数据库
     * @param model    用于显示成功信息
     * @return
     */
    @RequestMapping("changeWorker")
    public String changeWorker(@ModelAttribute("worker") Worker worker,Model model){
        // 页面的话  这里可以把id一栏设置为不可修改，其他都可以改，这样就可以避免工号重复出错
        workerService.changeWorker(worker,worker.getWorkerID());
        model.addAttribute("success","修改员工信息成功");

        // 要变
        return "/worker";

    }

    /**
     * 删除工人信息
     * @param workerID  传入工人ID，用于锁定工人信息在数据库中的某行
     * @param model     用于显示成功信息
     * @return
     */
    @RequestMapping("/deleteWorker")
    public String deleteWorker(@RequestParam("workerID") int workerID,Model model){
        workerService.deleteWorker(workerID);
        model.addAttribute("success","删除员工信息成功");

        // 要变
        return "/worker";
    }
    @RequestMapping(value = "/modifyworker")
    public String tomodifyworker() {
        return "modifyworker";
    }
    @RequestMapping(value = "/worker")
    public String toworker() {
        return "worker";
    }
    @RequestMapping(value = "/addworker")
    public String toaddworker() {
        return "addworker";
    }
}
