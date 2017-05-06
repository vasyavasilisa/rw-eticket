package com.bsuir.rw.dao.factory;


import com.bsuir.rw.dao.*;

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

    public CarriageoftrainDao getCarriageostrainDao() {

            return new CarriageoftrainDaoImpl();
    }

    public PlacesDao getPlacesDao() {
        return new PlacesDaoImpl();
    }

    public TicketsDao getTicketsDao() {
        return new TicketsDaoImpl();
    }
}