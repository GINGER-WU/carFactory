package com.CarService.dao;

import com.CarService.domain.Parts;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PartsDao {
    /**
     * 查询功能
     */
    // 查询配件信息
    @Select("select * from parts where partsID=#{partsID}")
    public Parts findParts(int partsID);

    // 查询全部配件信息
    @Select("select * from parts")
    public List<Parts> findAllParts();


    /**
     * 车辆维修需求配件部分
     */
    // 把某个id的配件库存数量减n
    @Update("update parts set partsNumber=partsNumber-#{n} where partsID=#{partsID}")
    public void useParts(@Param("partsID") int partsID, @Param("n") int n);

    // 修改某个配件的操作日志
    @Update("update parts set oprationLog=#{oprationLog} where partsID=#{partsID}")
    public void updateOprationLog(@Param("partsID") int partsID,@Param("oprationLog") String oprationLog);


    /**
     * 配件进货部分
     */
    // 添加配件
    @Insert("insert into parts (partsName,partsPrice,buyingPrice,partsNumber,venderInfo,oprationLog) values (#{partsName},#{partsPrice},#{buyingPrice},#{partsNumber},#{venderInfo},#{oprationLog})")
    public void addParts(Parts parts);

    // 修改配件
    @Update("update parts set partsName=#{parts.partsName},partsPrice=#{parts.partsPrice},buyingPrice=#{parts.buyingPrice},partsNumber=#{parts.partsNumber},venderInfo=#{parts.venderInfo},oprationLog=#{parts.oprationLog} where partsID=#{partsID}")
    public void changeParts(@Param("parts") Parts parts,@Param("partsID") int partsID);

    // 删除配件
    @Delete("delete from parts where partsID=#{partsID}")
    public void deleteParts(int partsID);
}
