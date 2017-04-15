package com.bsuir.rw.model.dao;

import com.bsuir.rw.model.beans.TrainsBean;
import com.bsuir.rw.model.domain.Tickets;
import com.bsuir.rw.model.domain.Trains;

import java.util.List;

/**
 * Created by USER on 15.04.2017.
 */
public interface TicketsDao {
    public void insert(Tickets ob);
    public void update(Tickets ob);
    public void delete(Tickets ob);

    public Tickets findTicketById(int id);



}
