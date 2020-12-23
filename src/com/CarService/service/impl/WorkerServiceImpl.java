package com.CarService.service.impl;

import com.CarService.dao.WorkerDao;
import com.CarService.domain.Worker;
import com.CarService.service.WorkerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("WorkerService")
public class WorkerServiceImpl implements WorkerService {

    @Autowired
    private WorkerDao workerDao;

    @Override
    public Worker findWorker(int workerID) {
        return workerDao.findWorker(workerID);
    }

    @Override
    public List<Worker> findAllWorker() {
        return workerDao.findAllWorker();
    }

    @Override
    public void addWorker(Worker worker) {
        workerDao.addWorker(worker);
    }

    @Override
    public void changeWorker(Worker worker, int workerID) {
        workerDao.changeWorker(worker,workerID);
    }

    @Override
    public void deleteWorker(int workerID) {
        workerDao.deleteWorker(workerID);
    }

    @Override
    public void changeWorkingNumber(int workerID, int n) {
        workerDao.changeWorkingNumber(workerID,n);
    }
}
