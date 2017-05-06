package com.bsuir.rw.dao.factory;


import com.bsuir.rw.dao.*;

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
        return new XmlUsersDao();
    }

    public CarriageoftrainDao getCarriageostrainDao() {
        return new XmlCarriageoftrainDao();
    }

    public PlacesDao getPlacesDao() {
        return new XmlPlacesDao();
    }

    public TicketsDao getTicketsDao() {
        return new XmlTicketsDao();
    }
}
