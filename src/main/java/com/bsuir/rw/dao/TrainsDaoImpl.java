package com.bsuir.rw.dao;





import com.bsuir.rw.beans.TrainsBean;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import com.bsuir.rw.model.domain.Trains;
import com.bsuir.rw.utils.HibernateSessionFactory;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by USER on 12.03.2017.
 */
public class TrainsDaoImpl implements TrainsDao{

    private static final String PERSISTENCE_UNIT_NAME = "bachelordebug";


    public void insert(Trains ob) {
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

    public void update(Trains ob) {

    }

    public void delete(Trains ob) {

        Session session = null;
        try {
            session = HibernateSessionFactory.getSessionFactory().getCurrentSession();
            session.beginTransaction();
            session.delete(ob);
            session.getTransaction().commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        }
    }




     //@Override
    public List<TrainsBean> loadTrainsOrderByTimeDep(String date, String stationDep, String stationArr) {

        EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT_NAME);

        EntityManager entityManager = factory.createEntityManager();
        List<TrainsBean> result = new ArrayList<TrainsBean>();
        List<Object[]> trains = entityManager.createNativeQuery(
                "SELECT DISTINCT trains.number,trains.nameTrain,fare.idTrain,CONCAT('',(TIME(S1.datetimeOfDeparture))) as TimeDep,CONCAT('',(TIME(S2.datetimeOfArrive))), CONCAT('',(TIMEDIFF(S2.datetimeOfArrive,S1.datetimeOfDeparture))) AS Time,COUNT(*) AS Count"+
                        " FROM fare "+
                        "INNER JOIN places  ON places.idPlace=fare.idPlace "+
                        "INNER JOIN trainRouts  ON trainRouts.idRout=fare.idRout "+
                        "INNER JOIN trains ON trains.idTrain=trainRouts.idTrain "+
                        "INNER JOIN stationsOfTrain S1 ON S1.idStationOfTrain=trainRouts .idDepartureStation "+
                        "INNER JOIN stations SS1 ON SS1.idStation=S1.idStation "+
                        "INNER JOIN stationsOfTrain S2 ON S2.idStationOfTrain=trainRouts .idArriveStation "+
                        "INNER JOIN stations SS2 ON SS2.idStation=S2.idStation "+
                        "WHERE trains.idTrain IN "+
                        "( SELECT idTrain FROM passage WHERE date= :date1"+" )AND  SS1.name = :name1 AND SS2.name= :name2 AND places.status='свободно' "+
                        "GROUP BY trains.number,trains.nameTrain,fare.idTrain,TimeDep,TIME(S2.datetimeOfArrive),  Time "+
                        "Order by TimeDep")
                .setParameter( "date1", date)
                .setParameter("name1",stationDep)
                .setParameter("name2",stationArr)
                .getResultList();

        for(Object[] entity : trains) {
            TrainsBean bean= new TrainsBean();
            String tr_num= (String)entity[0];
            String tr_name= (String)entity[1];
            Integer tr_id= (Integer)entity[2];
            String time1= (String)entity[3];
            String time2= (String)entity[4];
            String timetrav= (String)entity[5];
            BigInteger count= (BigInteger)entity[6];
            bean.setNumber(tr_num);
            bean.setNameTrain(tr_name);
            bean.setIdTrain(tr_id);
            bean.setTimeDeparture(time1);
            bean.setTimeArrive(time2);
            bean.setTravelTime(timetrav);
            bean.setNumberOfAvailSeats(Integer.valueOf(String.valueOf(count)));
            result.add(bean);
            //System.out.println(tr_num+" "+tr_name+" "+tr_id+" "+time1.toString()+" "+time2.toString()+" "+timetrav+" "+count);
        }
        return result;

    }



   // @Override
    public List<TrainsBean> loadTrainsByDateStations(String date, String stationDep, String stationArr) {

        EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT_NAME);

        EntityManager entityManager = factory.createEntityManager();
        List<TrainsBean> result = new ArrayList<TrainsBean>();
        List<Object[]> trains = entityManager.createNativeQuery(
                "SELECT DISTINCT trains.number,trains.nameTrain,fare.idTrain,CONCAT('',(TIME(S1.datetimeOfDeparture))),CONCAT('',(TIME(S2.datetimeOfArrive))), CONCAT('',(TIMEDIFF(S2.datetimeOfArrive,S1.datetimeOfDeparture))) AS Time,COUNT(*) AS Count"+
                        " FROM fare "+
                        "INNER JOIN places  ON places.idPlace=fare.idPlace "+
                        "INNER JOIN trainRouts  ON trainRouts.idRout=fare.idRout "+
                        "INNER JOIN trains ON trains.idTrain=trainRouts.idTrain "+
                        "INNER JOIN stationsOfTrain S1 ON S1.idStationOfTrain=trainRouts .idDepartureStation "+
                        "INNER JOIN stations SS1 ON SS1.idStation=S1.idStation "+
                        "INNER JOIN stationsOfTrain S2 ON S2.idStationOfTrain=trainRouts .idArriveStation "+
                        "INNER JOIN stations SS2 ON SS2.idStation=S2.idStation "+
                        "WHERE trains.idTrain IN "+
                        "( SELECT idTrain FROM passage WHERE date= :date1"+" )AND  SS1.name = :name1 AND SS2.name= :name2 AND places.status='свободно' "+
                        "GROUP BY trains.number,trains.nameTrain,fare.idTrain,TIME(S1.datetimeOfDeparture),TIME(S2.datetimeOfArrive),  Time "+
                        "Order by Time")
                .setParameter( "date1", date)
                .setParameter("name1",stationDep)
                .setParameter("name2",stationArr)
                .getResultList();

        for(Object[] entity : trains) {
            TrainsBean bean= new TrainsBean();
            String tr_num= (String)entity[0];
            String tr_name= (String)entity[1];
            Integer tr_id= (Integer)entity[2];
            String time1= (String)entity[3];
            String time2= (String)entity[4];
            String timetrav= (String)entity[5];
            BigInteger count= (BigInteger)entity[6];
            bean.setNumber(tr_num);
            bean.setNameTrain(tr_name);
            bean.setIdTrain(tr_id);
            bean.setTimeDeparture(time1);
            bean.setTimeArrive(time2);
            bean.setTravelTime(timetrav);
            bean.setNumberOfAvailSeats(Integer.valueOf(String.valueOf(count)));
            result.add(bean);
            //System.out.println(tr_num+" "+tr_name+" "+tr_id+" "+time1+" "+time2+" "+timetrav);

        }
        return result;
    }

  //  @Override
    public boolean isRoutExist(String date, String stationDep, String stationArr) {
       boolean result = false;
        EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT_NAME);

        EntityManager entityManager = factory.createEntityManager();

        List<Object[]> trains = entityManager.createNativeQuery(
                "select trainrouts.idRout from trainrouts " +
                "INNER JOIN stationsOfTrain S1 ON S1.idStationOfTrain=trainRouts.idDepartureStation " +
                        "INNER JOIN stations SS1 ON SS1.idStation=S1.idStation " +
                        "INNER JOIN stationsOfTrain S2 ON S2.idStationOfTrain=trainRouts.idArriveStation " +
                        "INNER JOIN stations SS2 ON SS2.idStation=S2.idStation " +
                        "WHERE  SS1.name = :stationDep AND SS2.name = :stationArr")
                .setParameter( "stationDep", stationDep)
                .setParameter("stationArr",stationArr)
                .getResultList();

      if(!trains.isEmpty()){
          result=true;
      }
        else {
          result=false;
      }
            return result;
    }

    public List<Trains> loadInformationForTrain(int id) {
        Session session = null;
        List<Trains> list_entity = new ArrayList<Trains>();
        try {
            session = HibernateSessionFactory.getSessionFactory().getCurrentSession();
            session.beginTransaction();
            list_entity = session.createQuery("select tr from Trains tr where tr.id=:id")
                    .setParameter("id",id)
                    .list();
            session.getTransaction().commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        }


        return list_entity;

    }

    public TrainsBean loadParamForTicket(int id, String dep, String arr) {
        EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT_NAME);

        EntityManager entityManager = factory.createEntityManager();
              List<Object[]> trains = entityManager.createNativeQuery(
                "SELECT DISTINCT CONCAT('',(TIME(S1.datetimeOfDeparture))),CONCAT('',(TIME(S2.datetimeOfArrive))),trains.number"+
                        " FROM fare "+
                        "INNER JOIN places  ON places.idPlace=fare.idPlace "+
                        "INNER JOIN trainRouts  ON trainRouts.idRout=fare.idRout "+
                        "INNER JOIN trains ON trains.idTrain=trainRouts.idTrain "+
                        "INNER JOIN stationsOfTrain S1 ON S1.idStationOfTrain=trainRouts .idDepartureStation "+
                        "INNER JOIN stations SS1 ON SS1.idStation=S1.idStation "+
                        "INNER JOIN stationsOfTrain S2 ON S2.idStationOfTrain=trainRouts .idArriveStation "+
                        "INNER JOIN stations SS2 ON SS2.idStation=S2.idStation "+
                        "WHERE trains.idTrain =:id AND  SS1.name = :name1 AND SS2.name= :name2 AND places.status='свободно'")
                .setParameter( "id", id)
                .setParameter("name1",dep)
                .setParameter("name2",arr)
                .getResultList();

        TrainsBean bean= new TrainsBean();
        for(Object[] entity : trains) {
            String time1= (String)entity[0];
            String time2= (String)entity[1];
            String num_train= (String)entity[2];
            bean.setTimeDeparture(time1);
            bean.setTimeArrive(time2);
            bean.setNumber(num_train);
             }

        return bean;

    }

    @Override
    public List<Trains> loadAllTrains() {
        Session session = null;
        List<Trains> list_entity = new ArrayList<Trains>();
        try {
            session = HibernateSessionFactory.getSessionFactory().getCurrentSession();
            session.beginTransaction();
            list_entity = session.createQuery("select tr from Trains tr")
                    .list();
            session.getTransaction().commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        }
        return list_entity;
    }

    @Override
    public Trains getTrainByNumber(String num) {
        Session session = null;
        Trains entity = null;
        try {
            session = HibernateSessionFactory.getSessionFactory().getCurrentSession();
            session.beginTransaction();
            entity= (Trains)session.createQuery("select tr from Trains tr where tr.number=:num")
                    .setParameter("num",num)
                    .uniqueResult();
            session.getTransaction().commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        }
        return entity;

    }
}
