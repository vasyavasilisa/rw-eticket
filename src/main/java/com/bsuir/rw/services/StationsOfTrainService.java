package com.bsuir.rw.services;




import com.bsuir.rw.beans.StationsOfTrainBean;
import com.bsuir.rw.dao.StationsOfTrainDao;
import com.bsuir.rw.dao.StationsOfTrainDaoImpl;
import com.bsuir.rw.model.domain.Stationsoftrain;

import java.util.List;

/**
 * Created by USER on 31.03.2017.
 */
public class StationsOfTrainService {

    public List<StationsOfTrainBean> getAllStationsOfTrain(String ahref) {
        StationsOfTrainDao dao = new StationsOfTrainDaoImpl();

        List<StationsOfTrainBean> beans = dao.loadStationsForTrain(ahref);

        return beans;
    }


    public List<StationsOfTrainBean> loadAllStationsOfTrain() {
        StationsOfTrainDao dao = new StationsOfTrainDaoImpl();
        List<StationsOfTrainBean> beans = dao.loadAllStationsOfTrain();
        return beans;
    }

    public void insert(Stationsoftrain ob){
        StationsOfTrainDao dao = new StationsOfTrainDaoImpl();
        dao.insert(ob);
    }



}
