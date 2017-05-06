package com.bsuir.rw.dao.factory;


import com.bsuir.rw.dao.*;

/**
 * Created by USER on 03.04.2017.
 */
public abstract class DAOFactory {

    public abstract TrainsDao getTrainsDao();

    public abstract StationsOfTrainDao getStationsOfTrainDao();

    public abstract UsersDao getUsersDao();

    public abstract CarriageoftrainDao getCarriageostrainDao();

    public abstract PlacesDao getPlacesDao();

    public abstract TicketsDao getTicketsDao();

    public static DAOFactory getFactory() {
        return getFactory(StoradgeTypes.MySql);
    }

    public static DAOFactory getFactory(StoradgeTypes type) {
        switch (type) {
            case MySql: {
                return new MySqlDAOFactory();
            }
            case Xml: {
                return new XmlDAOFactory();
            }
        }

        throw new RuntimeException();
    }
}
