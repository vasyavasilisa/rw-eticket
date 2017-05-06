package com.bsuir.rw.dao;



import com.bsuir.rw.beans.TrainsBean;
import com.bsuir.rw.model.domain.Trains;

import java.util.List;

/**
 * Created by USER on 03.04.2017.
 */
public class XmlTrainsDao implements TrainsDao{
   // @Override
    public void insert(Trains ob) {

    }

  //  @Override
    public void update(Trains ob) {

    }

   // @Override
    public void delete(Trains ob) {

    }

  //  @Override
    public List<TrainsBean> loadTrainsByDateStations(String date, String stationDep, String stationArr) {
        return null;
    }

   // @Override
    public boolean isRoutExist(String date, String stationDep, String stationArr) {
        return false;
    }

  //  @Override
    public List<TrainsBean> loadTrainsOrderByTimeDep(String date, String stationDep, String stationArr) {
        return null;
    }

   // @Override
    public List<Trains> loadInformationForTrain(int id) {
        return null;
    }

    public TrainsBean loadParamForTicket(int id, String dep, String arr) {
        return null;
    }

    @Override
    public List<Trains> loadAllTrains() {
        return null;
    }

    @Override
    public Trains getTrainByNumber(String num) {
        return null;
    }
}
