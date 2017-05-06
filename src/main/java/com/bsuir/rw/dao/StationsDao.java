package com.bsuir.rw.dao;

import com.bsuir.rw.model.domain.Stations;
import com.bsuir.rw.model.domain.Stationsoftrain;

import java.util.List;

/**
 * Created by USER on 04.05.2017.
 */
public interface StationsDao {


public void insert(Stationsoftrain ob);
    public List<Stations> getAllStations();
    public Stations getStationByName(String name);
}
