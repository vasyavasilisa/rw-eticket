package com.bsuir.rw.dao;

import com.bsuir.rw.model.domain.Tickets;

import java.util.List;

/**
 * Created by USER on 15.04.2017.
 */
public interface TicketsDao {
    public void insert(Tickets ob);
    public void update(Tickets ob);
    public void delete(Tickets ob);

    public Tickets findTicketById(int id);
    public List<Tickets> findTicketsByTrainAndDate(String trainNum,String date);



}
