package com.bsuir.rw.model.dao;

import com.bsuir.rw.model.domain.Places;
import com.bsuir.rw.model.domain.Trains;
import com.bsuir.rw.model.utils.HibernateSessionFactory;
import org.hibernate.HibernateException;
import org.hibernate.Session;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by USER on 15.04.2017.
 */
public class PlacesDaoImpl implements PlacesDao {
    public void insert(Places ob) {

    }

    public void update(Places ob) {

    }

    public void delete(Places ob) {

    }

    public Places loadPlaceById(int id) {
            Session session = null;
        Places entity = new Places();
            try {
                session = HibernateSessionFactory.getSessionFactory().getCurrentSession();
                session.beginTransaction();
                entity = (Places)session.createQuery("select pl from Places pl where pl.id=:id")
                        .setParameter("id",id)
                        .uniqueResult();
                session.getTransaction().commit();
            } catch (HibernateException e) {
                e.printStackTrace();
            }


            return entity;

    }
}
