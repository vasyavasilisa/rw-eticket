package com.bsuir.rw.services;

import com.bsuir.rw.dao.TicketsDao;
import com.bsuir.rw.dao.factory.DAOFactory;
import com.bsuir.rw.model.domain.Tickets;

/**
 * Created by USER on 14.04.2017.
 */
public class TicketService {

    private static final long MAX = 9;

    public TicketService (){

    }

    public  double generateOneDigit(){
        return Math.random() * MAX;
    }


    public  String getgTicketNumber(){

        StringBuilder number=new StringBuilder();
        number.append("1");
        for(int i=1;i<14;i++) {
            number.append((int)generateOneDigit());
        }
        return number.toString();
    }

    public void createTicket(Tickets entity){
        TicketsDao dao= DAOFactory.getFactory().getTicketsDao();
        dao.insert(entity);
    }

    public Tickets getTicketById(int id){
        TicketsDao dao= DAOFactory.getFactory().getTicketsDao();
        return dao.findTicketById(id);
    }

    public void updateTicket(Tickets entity){
        TicketsDao dao= DAOFactory.getFactory().getTicketsDao();
        dao.update(entity);
    }

}
