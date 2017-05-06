package com.bsuir.rw.dao;



import com.bsuir.rw.model.domain.Stationsoftrain;
import com.bsuir.rw.beans.StationsOfTrainBean;
import com.bsuir.rw.utils.HibernateSessionFactory;
import org.hibernate.HibernateException;
import org.hibernate.Session;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by USER on 27.03.2017.
 */
public class StationsOfTrainDaoImpl implements StationsOfTrainDao {

    private static final String PERSISTENCE_UNIT_NAME = "bachelordebug";

    public void insert(Stationsoftrain ob) {
        Session session = null;
        try {
            session = HibernateSessionFactory.getSessionFactory().getCurrentSession();
            session.beginTransaction();
            session.save(ob);
            session.getTransaction().commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        }
    }

    public void update(Stationsoftrain ob) {

    }

    public void delete(Stationsoftrain ob) {

    }

    public List<StationsOfTrainBean> loadStationsForTrain(String ahref) {

        EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT_NAME);

        EntityManager entityManager = factory.createEntityManager();
        List<StationsOfTrainBean> beans= new ArrayList<StationsOfTrainBean>();
        List<Object[]> stations = entityManager.createNativeQuery(
                "SELECT DISTINCT trains.number,S1.name,CONCAT('',(TIME(SS1.datetimeOfArrive))),CONCAT('',(TIME(SS1.datetimeOfDeparture))),CONCAT('',(TIMEDIFF(SS1.datetimeOfDeparture,SS1.datetimeOfArrive)) )AS timeOfStatnding,SS1.distance " +
                        " FROM trains" +
                        " INNER JOIN stationsOfTrain SS1 ON SS1.idTrain=trains.idTrain" +
                        " INNER JOIN stations S1 ON S1.idStation=SS1.idStation" +
                        " WHERE trains.idTrain = :ahref")

                .setParameter("ahref", ahref)
                .getResultList();

        for (Object[] entity : stations) {
            StationsOfTrainBean bean= new StationsOfTrainBean();
            String tr_num = (String) entity[0];
            String station_name = (String) entity[1];
            String time_arr = (String) entity[2];
            String time_dep = (String) entity[3];
            String time_stand = (String) entity[4];
            Integer distance = (Integer) entity[5];
            bean.setNumberTrain(tr_num);
            bean.setName(station_name);
            bean.setTimeArrive(time_arr);
            bean.setTimeDeparture(time_dep);
            bean.setTimeStanding(time_stand);
            bean.setDistance(distance.toString());
            beans.add(bean);
          //  System.out.println(tr_num + " " + station_name + " " + time_arr + " " + time_dep + " " + distance);
        }

        return beans;
    }

    @Override
    public List<StationsOfTrainBean> loadAllStationsOfTrain() {
        EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT_NAME);

        EntityManager entityManager = factory.createEntityManager();
        List<StationsOfTrainBean> beans= new ArrayList<StationsOfTrainBean>();
        List<Object[]> stations = entityManager.createNativeQuery(
                "SELECT DISTINCT trains.number,S1.name,CONCAT('',(TIME(SS1.datetimeOfArrive))),CONCAT('',(TIME(SS1.datetimeOfDeparture))),SS1.distance " +
                        " FROM trains" +
                        " INNER JOIN stationsOfTrain SS1 ON SS1.idTrain=trains.idTrain" +
                        " INNER JOIN stations S1 ON S1.idStation=SS1.idStation")
                .getResultList();

        for (Object[] entity : stations) {
            StationsOfTrainBean bean= new StationsOfTrainBean();
            String tr_num = (String) entity[0];
            String station_name = (String) entity[1];
            String time_arr = (String) entity[2];
            String time_dep = (String) entity[3];
            Integer distance = (Integer) entity[4];
            bean.setNumberTrain(tr_num);
            bean.setName(station_name);
            bean.setTimeArrive(time_arr);
            bean.setTimeDeparture(time_dep);
            bean.setDistance(distance.toString());
            beans.add(bean);
            //  System.out.println(tr_num + " " + station_name + " " + time_arr + " " + time_dep + " " + distance);
        }

        return beans;
    }
}



