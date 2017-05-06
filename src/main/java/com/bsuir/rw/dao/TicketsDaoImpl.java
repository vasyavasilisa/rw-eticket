package com.bsuir.rw.dao;

import com.bsuir.rw.model.domain.Tickets;
import com.bsuir.rw.utils.HibernateSessionFactory;
import org.hibernate.HibernateException;
import org.hibernate.Session;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by USER on 15.04.2017.
 */
public class TicketsDaoImpl implements TicketsDao {

    public void insert(Tickets entity) {
        Session session = null;
        String number=entity.getTicketNumber();
        int idUser=entity.getIdUser();
        int result = 0;
        try {
            session = HibernateSessionFactory.getSessionFactory().getCurrentSession();
            session.beginTransaction();
            session.save(entity);
            session.getTransaction().commit();

        } catch (HibernateException e) {
            e.printStackTrace();

        }
    }


    public void update(Tickets ob) {

        Session session = null;
        int result = 0;
        try {
            session = HibernateSessionFactory.getSessionFactory().getCurrentSession();
            session.beginTransaction();
            session.update(ob);
            session.getTransaction().commit();

        } catch (HibernateException e) {
            e.printStackTrace();

        }


    }

    public void delete(Tickets ob) {

    }


    @Override
    public Tickets findTicketById(int id) {
        Session session = null;
        Tickets entity = new Tickets();
        try {
            session = HibernateSessionFactory.getSessionFactory().getCurrentSession();
            session.beginTransaction();
            entity = (Tickets)session.createQuery("select t from Tickets t where t.id=:id")
                    .setParameter("id",id)
                    .uniqueResult();
            session.getTransaction().commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        }


        return entity;
    }

    @Override
    public List<Tickets> findTicketsByTrainAndDate(String trainNum, String date) {
        Session session = null;
        List<Tickets> list = new ArrayList<>();
        try {
            session = HibernateSessionFactory.getSessionFactory().getCurrentSession();
            session.beginTransaction();
            list = session.createQuery("select t from Tickets t where t.trainNumber=:trainNum AND t.dateDeparture=:date")
                    .setParameter("trainNum",trainNum)
                    .setParameter("date",date)
                    .list();
            session.getTransaction().commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        }


        return list;
    }
}
