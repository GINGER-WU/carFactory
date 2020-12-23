package com.CarService.service;

import com.CarService.domain.Car;

import java.util.List;

public interface CarService {

    public Car findRecord(int recordID);

    public List<Car> findAllRecords();

    public void addRecord(Car car);

    public void addCarFinishTime(int recordID, String finishService);

    public void changeRecord(int recordID,Car car);

    public void deleteRecord(int carID);

    public Car findBiggestRecord();

    public Car findFirstRecord();

    public void addCarTotalPrice(int recordID,Double totalPrice);

}
