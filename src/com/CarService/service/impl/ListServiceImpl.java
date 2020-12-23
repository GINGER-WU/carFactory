package com.CarService.service.impl;

import com.CarService.dao.ListDao;
import com.CarService.service.ListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("CarToPartsService")
public class ListServiceImpl implements ListService {

    @Autowired
    private ListDao listDao;


    @Override
    public List<Integer> findParts(int recordID) {
        return listDao.findParts(recordID);
    }

    @Override
    public List<Integer> findWorker(int recordID) {
        return listDao.findWorker(recordID);
    }

    @Override
    public int findCount(int recordID, int partsID) {
        return listDao.findCount(recordID,partsID);
    }

    @Override
    public void addRecordWorker(int recordID, int workerID) {
        listDao.addRecordWorker(recordID,workerID);
    }

    @Override
    public void addRecordParts(int recordID, int partsID,int n) {
        listDao.addRecordParts(recordID, partsID,n);
    }

    @Override
    public void changeRecordPartsNumber(int recordID, int partsID, int n) {
        listDao.changeRecordPartsNumber(recordID,partsID,n);
    }

    @Override
    public void deleteRecord(int recordID) {
        listDao.deleteRecord(recordID);
    }

    @Override
    public void deleteRecordWorker(int recordID, int workerID) {
        listDao.deleteRecordWorker(recordID,workerID);
    }

    @Override
    public void deleteRecordParts(int recordID, int partsID) {
        listDao.deleteRecordParts(recordID, partsID);
    }
}
