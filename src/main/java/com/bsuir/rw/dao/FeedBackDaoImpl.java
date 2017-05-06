package com.bsuir.rw.dao;

import com.bsuir.rw.model.domain.Feaadback;
import com.bsuir.rw.utils.HibernateSessionFactory;
import org.hibernate.HibernateException;
import org.hibernate.Session;

/**
 * Created by USER on 04.05.2017.
 */
public class FeedBackDaoImpl implements FeedBackDao {
    @Override
    public void delete(Feaadback ob) {
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
}
