 package com.CarService.dao;

import com.CarService.domain.Car;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CarDao {

    // 根据档案ID来查询某个档案
    // 别忘记出厂日期也要查
    @Select("select * from car where recordID =#{recordID}")
    public Car findRecord(int recordID);

    // 查询全部档案
    @Select("select * from car")
    public List<Car> findAllRecords();

    // 添加档案  出厂日期为空
    @Insert("insert into car (carID,userName,userPhoneNumber,carType,carMileage,laborCost,startService) values (#{carID},#{userName},#{userPhoneNumber},#{carType},#{carMileage},#{laborCost},#{startService}) ")
    public void addRecord(Car car);

    // 车辆出厂  插入出厂日期
    @Update("update car set finishService=#{finishService} where recordID=#{recordID}")
    public void addCarFinishTime(@Param("recordID") int recordID, @Param("finishService") String finishService);

    // 修改档案
    @Update("update car set carID=#{car.carID},userName=#{car.userName},userPhoneNumber=#{car.userPhoneNumber},carType=#{car.carType},carMileage=#{car.carMileage},laborCost=#{car.laborCost} where recordID=#{recordID}")
    public void changeRecord(@Param("recordID") int recordID,@Param("car") Car car);

    // 删除档案
    @Delete("delete from car where recordID=#{recordID}")
    public void deleteRecord(int recordID);

    // 查询最新添加的档案  也就是查询recordID最大的档案
    @Select("select * from car order by recordID DESC limit 1")
    public Car findBiggestRecord();

    // 查询日期最早的一张结账了的订单
    @Select("select * from car where finishService in (select min(finishService) from car)")
    public Car findFirstRecord();

 // 结账后，给车辆价格总价格
    @Update("update car set totalCost=#{totalCost} where recordID=#{recordID}")
    public void addCarTotalPrice(@Param("recordID") int recordID,@Param("totalCost") Double totalCost);
}
