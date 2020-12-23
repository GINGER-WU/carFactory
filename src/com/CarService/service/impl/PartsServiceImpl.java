package com.CarService.service.impl;

import com.CarService.dao.PartsDao;
import com.CarService.domain.Parts;
import com.CarService.service.PartsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("PartsService")
public class PartsServiceImpl implements PartsService {

    @Autowired
    private PartsDao partsDao;

    @Override
    public Parts findParts(int partsID) {
        return partsDao.findParts(partsID);
    }

    @Override
    public List<Parts> findAllParts() {
        return partsDao.findAllParts();
    }

    @Override
    public void useParts(int partsID, int n) {
        partsDao.useParts(partsID,n);
    }

    @Override
    public void addParts(Parts parts) {
        partsDao.addParts(parts);
    }

    @Override
    public void changeParts(Parts parts, int partsID) {
        partsDao.changeParts(parts,partsID);
    }

    @Override
    public void deleteParts(int partsID) {
        partsDao.deleteParts(partsID);
    }

    @Override
    public void updateOprationLog(int partsID, String oprationLog) {
        partsDao.updateOprationLog(partsID, oprationLog);
    }

}
