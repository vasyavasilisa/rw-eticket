package com.bsuir.rw.services;

import com.bsuir.rw.dao.StationsDao;
import com.bsuir.rw.dao.StationsDaoImpl;
import com.bsuir.rw.model.domain.Stations;

import java.util.List;

/**
 * Created by USER on 04.05.2017.
 */
public class StationsService {

    public List<Stations> getAllStations(){
        StationsDao dao= new StationsDaoImpl();
        List<Stations> list= dao.getAllStations();
        return  list;
    }

    public Stations getStationBtName(String name){
        StationsDao dao= new StationsDaoImpl();
        Stations station= dao.getStationByName(name);
        return  station;
    }
}
