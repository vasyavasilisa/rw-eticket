package com.bsuir.rw.dao;

import com.bsuir.rw.model.domain.Places;
import com.bsuir.rw.utils.HibernateSessionFactory;
import org.hibernate.HibernateException;
import org.hibernate.Session;

/**
 * Created by USER on 15.04.2017.
 */
public class PlacesDaoImpl implements PlacesDao {
    public void insert(Places ob) {

    }

    public void update(Places ob) {
        Session session = null;
        try {
            session = HibernateSessionFactory.getSessionFactory().getCurrentSession();
            session.beginTransaction();
            session.update(ob);
            session.getTransaction().commit();

        } catch (HibernateException e) {
            e.printStackTrace();

        }
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
