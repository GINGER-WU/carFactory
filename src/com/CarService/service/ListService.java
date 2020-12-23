package com.CarService.service;

import java.util.List;

public interface ListService {

    public List<Integer> findParts(int recordID);

    public List<Integer> findWorker(int recordID);

    public int findCount(int recordID,int partsID);

    public void addRecordWorker(int recordID,int workerID);

    public void addRecordParts(int recordID,int partsID,int n);

    public void changeRecordPartsNumber(int recordID,  int partsID, int n);

    public void deleteRecord(int recordID);

    public void deleteRecordWorker(int recordID,int workerID);

    public void deleteRecordParts(int recordID,int partsID);

}
