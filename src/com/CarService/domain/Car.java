package com.CarService.domain;

import java.io.Serializable;

public class Car implements Serializable {
    private int recordID;
    private String carID;
    private String userName;
    private String userPhoneNumber;
    private String carType;
    private Double carMileage;   // 里程表数
    private Double laborCost;   // 工时费
    private String startService;    // 进厂时间
    private String finishService;   // 出厂时间
    private Double totalCost;    // 总费用

    public int getRecordID() {
        return recordID;
    }

    public void setRecordID(int recordID) {
        this.recordID = recordID;
    }

    public String getCarID() {
        return carID;
    }

    public void setCarID(String carID) {
        this.carID = carID;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserPhoneNumber() {
        return userPhoneNumber;
    }

    public void setUserPhoneNumber(String userPhoneNumber) {
        this.userPhoneNumber = userPhoneNumber;
    }

    public String getCarType() {
        return carType;
    }

    public void setCarType(String carType) {
        this.carType = carType;
    }

    public Double getCarMileage() {
        return carMileage;
    }

    public void setCarMileage(Double carMileage) {
        this.carMileage = carMileage;
    }

    public Double getLaborCost() {
        return laborCost;
    }

    public void setLaborCost(Double laborCost) {
        this.laborCost = laborCost;
    }

    public String getStartService() {
        return startService;
    }

    public void setStartService(String startService) {
        this.startService = startService;
    }

    public String getFinishService() {
        return finishService;
    }

    public void setFinishService(String finishService) {
        this.finishService = finishService;
    }

    public Double getTotalCost() {
        return totalCost;
    }

    public void setTotalCost(Double totalCost) {
        this.totalCost = totalCost;
    }

    @Override
    public String toString() {
        return "Car{" +
                "recordID=" + recordID +
                ", carID='" + carID + '\'' +
                ", userName='" + userName + '\'' +
                ", userPhoneNumber='" + userPhoneNumber + '\'' +
                ", carType='" + carType + '\'' +
                ", carMileage=" + carMileage +
                ", laborCost=" + laborCost +
                ", startService='" + startService + '\'' +
                ", finishService='" + finishService + '\'' +
                ", totalCost='" + totalCost + '\'' +
                '}';
    }
}
