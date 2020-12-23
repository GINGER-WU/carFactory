package com.CarService.service;

import com.CarService.domain.Worker;


import java.util.List;


public interface WorkerService {

    public Worker findWorker(int workerID);

    public List<Worker> findAllWorker();

    public void changeWorkingNumber(int workerID,int n);

    public void addWorker(Worker worker);

    public void changeWorker(Worker worker,int workerID);

    public void deleteWorker(int workerID);



}
