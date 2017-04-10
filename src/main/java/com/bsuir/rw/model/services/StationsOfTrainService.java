package com.bsuir.rw.model.services;




import com.bsuir.rw.model.beans.StationsOfTrainBean;
import com.bsuir.rw.model.dao.StationsOfTrainDao;
import com.bsuir.rw.model.dao.StationsOfTrainDaoImpl;

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
}
