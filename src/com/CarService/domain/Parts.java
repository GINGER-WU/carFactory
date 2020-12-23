package com.CarService.domain;

import java.io.Serializable;

public class Parts implements Serializable {
    private int partsID;
    private String partsName;
    private Double partsPrice;
    private Double buyingPrice;   // 进货价
    private int partsNumber;   // 配件数量
    private String venderInfo;    // 供应商信息
    private String oprationLog;   // 操作日志

    public int getPartsID() {
        return partsID;
    }

    public void setPartsID(int partsID) {
        this.partsID = partsID;
    }

    public String getPartsName() {
        return partsName;
    }

    public void setPartsName(String partsName) {
        this.partsName = partsName;
    }

    public Double getPartsPrice() {
        return partsPrice;
    }

    public void setPartsPrice(Double partsPrice) {
        this.partsPrice = partsPrice;
    }

    public Double getBuyingPrice() {
        return buyingPrice;
    }

    public void setBuyingPrice(Double buyingPrice) {
        this.buyingPrice = buyingPrice;
    }

    public int getPartsNumber() {
        return partsNumber;
    }

    public void setPartsNumber(int partsNumber) {
        this.partsNumber = partsNumber;
    }

    public String getVenderInfo() {
        return venderInfo;
    }

    public void setVenderInfo(String venderInfo) {
        this.venderInfo = venderInfo;
    }

    public String getOprationLog() {
        return oprationLog;
    }

    public void setOprationLog(String oprationLog) {
        this.oprationLog = oprationLog;
    }

    @Override
    public String toString() {
        return "Parts{" +
                "partsID=" + partsID +
                ", partsName='" + partsName + '\'' +
                ", partsPrice=" + partsPrice +
                ", buyingPrice=" + buyingPrice +
                ", partsNumber=" + partsNumber +
                ", venderInfo='" + venderInfo + '\'' +
                ", oprationLog='" + oprationLog + '\'' +
                '}';
    }
}
