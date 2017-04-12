package com.bsuir.rw.model.dao.factory;


import com.bsuir.rw.model.dao.*;

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

    public UsersDao getUsersDao() {
        return new UserDaoImpl();
    }
}