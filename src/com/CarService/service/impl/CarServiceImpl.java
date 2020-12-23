package com.CarService.service.impl;

import com.CarService.dao.CarDao;
import com.CarService.domain.Car;
import com.CarService.service.CarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("CarService")
public class CarServiceImpl implements CarService {

    @Autowired
    private CarDao carDao;

    @Override
    public Car findRecord(int recordID) {
        return carDao.findRecord(recordID);
    }

    @Override
    public List<Car> findAllRecords() {
        return carDao.findAllRecords();
    }

    @Override
    public void addRecord(Car car) {
        carDao.addRecord(car);
    }

    @Override
    public void changeRecord(int recordID,Car car) {
        carDao.changeRecord(recordID,car);
    }

    @Override
    public void deleteRecord(int carID) {
        carDao.deleteRecord(carID);
    }

    @Override
    public Car findBiggestRecord() {
        return carDao.findBiggestRecord();
    }

    @Override
    public Car findFirstRecord() {
        return carDao.findFirstRecord();
    }

    @Override
    public void addCarTotalPrice(int recordID, Double totalPrice) {
        carDao.addCarTotalPrice(recordID, totalPrice);
    }

    @Override
    public void addCarFinishTime(int recordID, String finishService) {
        carDao.addCarFinishTime(recordID, finishService);
    }

}
