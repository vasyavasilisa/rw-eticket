package com.bsuir.rw.model.dao;

import com.bsuir.rw.model.domain.Users;
import com.bsuir.rw.model.utils.HibernateSessionFactory;
import org.hibernate.HibernateException;
import org.hibernate.Session;

/**
 * Created by USER on 12.04.2017.
 */
public class UserDaoImpl implements UsersDao{
    public boolean insert(Users ob) {
        Session session = null;
        int result = 0;
        try {
            session = HibernateSessionFactory.getSessionFactory().getCurrentSession();
            session.beginTransaction();
            session.save(ob);
            session.getTransaction().commit();
            return true;
        } catch (HibernateException e) {
            e.printStackTrace();
            return false;
        }
    }

    public void update(Users ob) {

    }

    public void delete(Users ob) {

    }
}
