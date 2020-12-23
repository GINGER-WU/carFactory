package com.CarService.domain;

import java.io.Serializable;

public class Worker implements Serializable {
    private int workerID;
    private String workerName;
    private String workerPhoneNumber;
    private int workingNumber;        // 正在同时修的车数

    public int getWorkerID() {
        return workerID;
    }

    public void setWorkerID(int workerID) {
        this.workerID = workerID;
    }

    public String getWorkerName() {
        return workerName;
    }

    public void setWorkerName(String workerName) {
        this.workerName = workerName;
    }

    public String getWorkerPhoneNumber() {
        return workerPhoneNumber;
    }

    public void setWorkerPhoneNumber(String workerPhoneNumber) {
        this.workerPhoneNumber = workerPhoneNumber;
    }

    public int getWorkingNumber() {
        return workingNumber;
    }

    public void setWorkingNumber(int workingNumber) {
        this.workingNumber = workingNumber;
    }

    @Override
    public String toString() {
        return "Worker{" +
                "workerID='" + workerID + '\'' +
                ", workerName='" + workerName + '\'' +
                ", workerPhoneNumber='" + workerPhoneNumber + '\'' +
                ", workingNumber=" + workingNumber +
                '}';
    }
}
