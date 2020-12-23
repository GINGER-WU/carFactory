package com.CarService.dao;

import com.CarService.domain.Worker;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface WorkerDao {
    /**
     * 通用部分
     */
    // 查询员工信息
    @Select("select * from worker where workerID =#{workerID}")
    public Worker findWorker(int workerID);

    // 查询全部员工信息
    @Select("select * from worker")
    public List<Worker> findAllWorker();

    /**
     * 修车部分
     */
    // 改变某个员工的正在修车状态  n为1则正在修车  0则不在修车
    @Update("update worker set workingNumber=#{n} where workerID=#{workerID}")
    public void changeWorkingNumber(@Param("workerID") int workerID, @Param("n") int n);


    /**
     * 管理员工部分
     */
    // 添加员工
    @Insert("insert into worker (workerName,workerPhoneNumber,workingNumber) values(#{workerName},#{workerPhoneNumber},#{workingNumber}) ")
    public void addWorker(Worker worker);

    // 修改员工
    @Update("update worker set workerName=#{worker.workerName},workerPhoneNumber=#{worker.workerPhoneNumber} where workerID=#{workerID}")
    public void changeWorker(@Param("worker") Worker worker,@Param("workerID") int workerID);

    // 删除员工
    @Delete("delete from worker where workerID=#{workerID}")
    public void deleteWorker(int workerID);
}
