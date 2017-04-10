package com.bsuir.rw.model.dao.factory;


import com.bsuir.rw.model.dao.StationsOfTrainDaoImpl;
import com.bsuir.rw.model.dao.TrainsDao;
import com.bsuir.rw.model.dao.TrainsDaoImpl;
import com.bsuir.rw.model.dao.StationsOfTrainDao;

/**
 * Created by USER on 03.04.2017.
 */
public class MySqlDAOFactory extends DAOFactory {

    MySqlDAOFactory() {
        super();
    }

    @Override
    public TrainsDao getTrainsDao() {
        return new TrainsDaoImpl();
    }

    @Override
    public StationsOfTrainDao getStationsOfTrainDao() {
        return new StationsOfTrainDaoImpl();
    }

}