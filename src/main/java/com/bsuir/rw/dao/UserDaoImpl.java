package com.bsuir.rw.dao;


import com.bsuir.rw.model.domain.Feaadback;
import com.bsuir.rw.model.domain.Users;
import com.bsuir.rw.utils.HibernateSessionFactory;
import org.hibernate.HibernateException;
import org.hibernate.Session;

import java.util.ArrayList;
import java.util.List;


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

    public Users findUser(Users ob) {
        Session session = null;
        String log=ob.getLogin();
        String pass=ob.getPassword();
       Users entity = new Users();
        try {
            session = HibernateSessionFactory.getSessionFactory().getCurrentSession();
            session.beginTransaction();
            entity =(Users) session.createQuery("select us from Users us where us.login=:login and us.password=:password")
                    .setParameter("login",ob.getLogin())
                    .setParameter("password",ob.getPassword())
                            .uniqueResult();

            session.getTransaction().commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        }

        return entity;

    }

    @Override
    public void saveFeedBackForUser(Feaadback ob) {
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

    @Override
    public List<Feaadback> getFeedBacks() {
        Session session = null;
        List<Feaadback> result = new ArrayList<>();
        try {
            session = HibernateSessionFactory.getSessionFactory().getCurrentSession();
            session.beginTransaction();
            result = session.createQuery("select f from Feaadback f")
                    .list();
            session.getTransaction().commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        }

        return result;
    }

    @Override
    public List<Users> getAllUsers() {
        Session session = null;
        List<Users> result = new ArrayList<>();
        try {
            session = HibernateSessionFactory.getSessionFactory().getCurrentSession();
            session.beginTransaction();
            result = session.createQuery("select u from Users u")
                    .list();
            session.getTransaction().commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        }

        return result;
    }

    @Override
    public Users getUserById(int id) {
        Session session = null;
        Users result = new Users();
        try {
            session = HibernateSessionFactory.getSessionFactory().getCurrentSession();
            session.beginTransaction();
            result = (Users)session.createQuery("select t from Users t where t.id=:id")
                    .setParameter("id",id)
                    .uniqueResult();
            session.getTransaction().commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        }

        return result;
    }
}
