package com.bsuir.rw.dao;

import com.bsuir.rw.beans.PlacesBean;
import com.bsuir.rw.model.domain.Carriageoftrain;
import com.bsuir.rw.model.domain.Users;
import com.bsuir.rw.utils.HibernateSessionFactory;
import org.hibernate.HibernateException;
import org.hibernate.Session;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by USER on 13.04.2017.
 */
public class CarriageoftrainDaoImpl implements CarriageoftrainDao{

    private static final String PERSISTENCE_UNIT_NAME = "bachelordebug";

    public boolean insert(Users ob) {
        return false;
    }

    public void update(Users ob) {

    }

    public void delete(Users ob) {

    }

    public Carriageoftrain findCarriageById(int id) {
        Session session = null;
        Carriageoftrain entity = new Carriageoftrain();
        try {
            session = HibernateSessionFactory.getSessionFactory().getCurrentSession();
            session.beginTransaction();
            entity =(Carriageoftrain) session.createQuery("select car from Carriageoftrain car where car.id=:id")
                    .setParameter("id",id)
                    .uniqueResult();

            session.getTransaction().commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        }

        return entity;

    }

    public  List<PlacesBean> findPlacesForCarriage(int idCarriage,int idTrain,String departure, String arrive) {
        EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT_NAME);

        EntityManager entityManager = factory.createEntityManager();
        List<PlacesBean> result = new ArrayList<PlacesBean>();
        String stat="свободно";
        List<Object[]> places = entityManager.createNativeQuery(
                "SELECT DISTINCT places.idPlace,places.type,places.status,places.number,fare.price" +
                        " FROM passage" +
                        " INNER JOIN fare ON fare.idTrain=passage.idTrain\n" +
                        " INNER JOIN trainRouts  ON trainRouts.idRout=fare.idRout\n" +
                        " INNER JOIN stationsOfTrain S1 ON S1.idStationOfTrain=trainRouts.idDepartureStation\n" +
                        " INNER JOIN stations SS1 ON SS1.idStation=S1.idStation\n" +
                        " INNER JOIN stationsOfTrain S2 ON S2.idStationOfTrain=trainRouts.idArriveStation\n" +
                        " INNER JOIN stations SS2 ON SS2.idStation=S2.idStation\n" +
                        " INNER JOIN trains ON trains.idTrain=trainRouts.idTrain\n" +
                        " INNER JOIN places ON places.idPlace=fare.idPlace\n" +
                        " INNER JOIN carriageOfTrain ON carriageOfTrain.idCarriageOfTrain=places.idCarriage\n" +
                        " WHERE SS1.name=:departure AND SS2.name=:arrive AND trains.idTrain=:idTrain AND carriageOfTrain.idCarriageOfTrain=:idCarriage AND places.status=:status")
                .setParameter("departure", departure)
                .setParameter("arrive", arrive)
                .setParameter("idTrain", idTrain)
                .setParameter("idCarriage",idCarriage)
                .setParameter("status",stat)
                .getResultList();

        for (Object[] entity : places) {
            PlacesBean bean = new PlacesBean();
            Integer idPlace = (Integer) entity[0];
            String type = (String) entity[1];
            String status = (String) entity[2];
            Integer number = (Integer) entity[3];
            Double cost = (Double) entity[4];
            bean.setIdPlace(idPlace);
            bean.setType(type);
            bean.setStatus(status);
            bean.setNumber(number);
            bean.setCost(cost);
            result.add(bean);
        }

        return result;
    }
}
