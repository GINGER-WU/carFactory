package com.CarService.dao;

import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Repository
public interface ListDao {

    // 查询某个账单所需的配件ID列表
    @Select("select  partsID from list where recordID=#{recordID} and workerID is null")
    public List<Integer> findParts(int recordID);

    // 查询某个账单所需的员工ID列表
    @Select("select  workerID from list where recordID=#{recordID} and partsID is null")
    public List<Integer> findWorker(int recordID);

    // 查询某个配件ID在某个账单中的 使用数量 属性
    @Select("select useNumber from list where recordID=#{recordID} and partsID=#{partsID}")
    public int findCount(@Param("recordID") int recordID,@Param("partsID") int partsID);

    // 增加某个订单的工人
    @Insert("insert into list (recordID,workerID) values(#{recordID},#{workerID})")
    public void addRecordWorker(@Param("recordID") int recordID, @Param("workerID") int workerID);

    // 增加某个订单的配件ID和配件数量
    @Insert("insert into list(recordID,partsID,useNumber) values(#{recordID},#{partsID},#{n})")
    public void addRecordParts(@Param("recordID") int recordID,@Param("partsID") int partsID,@Param("n") int n);

    // 改变某个订单的某个配件的数量
    @Update("update list set useNumber=#{n} where recordID=#{recordID} and partsID=#{partsID}")
    public void changeRecordPartsNumber(@Param("recordID") int recordID,@Param("partsID") int partsID,@Param("n") int n);

    // 删除某个订单全部信息
    @Delete("delete from list where recordID=#{recordID}")
    public void deleteRecord(int recordID);

    // 删除某个订单中的某个工人信息
    @Delete("delete from list where recordID=#{recordID} and workerID=#{workerID}")
    public void deleteRecordWorker(@Param("recordID") int recordID,@Param("workerID") int workerID);

    // 删除某个订单中的某个配件信息
    @Delete("delete from list where recordID=#{recordID} and partsID=#{partsID}")
    public void deleteRecordParts(@Param("recordID") int recordID,@Param("partsID") int partsID);

}
