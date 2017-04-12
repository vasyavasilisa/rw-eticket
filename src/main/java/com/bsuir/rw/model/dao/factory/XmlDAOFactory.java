package com.bsuir.rw.model.dao.factory;


import com.bsuir.rw.model.dao.*;

/**
 * Created by USER on 03.04.2017.
 */
public class XmlDAOFactory extends DAOFactory {

    XmlDAOFactory() {
        super();
    }

    @Override
    public TrainsDao getTrainsDao() {
        return new XmlTrainsDao();
    }

    @Override
    public StationsOfTrainDao getStationsOfTrainDao() {
        return new XmlStationsOfTrainDao();
    }

    public UsersDao getUsersDao() {
        return null;
    }
}
