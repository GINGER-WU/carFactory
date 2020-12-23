package com.CarService.service;

import com.CarService.domain.Parts;

import java.util.List;


public interface PartsService {

    public Parts findParts(int partsID);

    public List<Parts> findAllParts();

    public void useParts(int partsID,int n);

    public void addParts(Parts parts);

    public void changeParts(Parts parts,int partsID);

    public void deleteParts(int partsID);

    public void updateOprationLog(int partsID, String oprationLog);


}
