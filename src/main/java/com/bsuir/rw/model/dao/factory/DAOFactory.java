package com.bsuir.rw.model.dao.factory;


import com.bsuir.rw.model.dao.StationsOfTrainDao;
import com.bsuir.rw.model.dao.TrainsDao;
import com.bsuir.rw.model.dao.UsersDao;

/**
 * Created by USER on 03.04.2017.
 */
public abstract class DAOFactory {

    public abstract TrainsDao getTrainsDao();

    public abstract StationsOfTrainDao getStationsOfTrainDao();

    public abstract UsersDao getUsersDao();

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
