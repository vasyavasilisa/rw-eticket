package com.bsuir.rw.dao;

import com.bsuir.rw.model.domain.Stations;
import com.bsuir.rw.model.domain.Stationsoftrain;
import com.bsuir.rw.utils.HibernateSessionFactory;
import org.hibernate.HibernateException;
import org.hibernate.Session;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by USER on 04.05.2017.
 */
public class StationsDaoImpl implements StationsDao {

    @Override
    public void insert(Stationsoftrain ob) {

    }


    @Override
    public List<Stations> getAllStations() {
        Session session = null;
        List<Stations> result = new ArrayList<>();
        try {
            session = HibernateSessionFactory.getSessionFactory().getCurrentSession();
            session.beginTransaction();
            result = session.createQuery("select st from Stations st")
                    .list();
            session.getTransaction().commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        }

        return result;

    }

    @Override
    public Stations getStationByName(String name) {
        Session session = null;
        Stations result = null;
        try {
            session = HibernateSessionFactory.getSessionFactory().getCurrentSession();
            session.beginTransaction();
            result = (Stations) session.createQuery("select st from Stations st where st.name=:name")
                    .setParameter("name", name)
                    .getSingleResult();
            session.getTransaction().commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        }

        return result;
    }
}
