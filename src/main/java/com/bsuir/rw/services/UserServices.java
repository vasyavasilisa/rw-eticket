package com.bsuir.rw.services;



import com.bsuir.rw.dao.TicketsDao;
import com.bsuir.rw.dao.UsersDao;
import com.bsuir.rw.dao.factory.DAOFactory;
import com.bsuir.rw.model.domain.Feaadback;
import com.bsuir.rw.model.domain.Tickets;
import com.bsuir.rw.model.domain.Users;
import com.bsuir.rw.utils.Context;
import com.bsuir.rw.utils.DateByConvert;
import com.bsuir.rw.utils.DateUtil;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;


/**
 * Created by USER on 12.04.2017.
 */
public class UserServices {

    private static final int MAX = 500;

    public UserServices(){
    }

    public  double generateBalance(){
        return Math.random() * MAX;
    }

    public boolean createUser(Users entity){
        UsersDao dao = DAOFactory.getFactory().getUsersDao();
        dao.insert(entity);
        return true;
    }

   public Users getUserByLoginPassword(Users user){
       UsersDao dao = DAOFactory.getFactory().getUsersDao();
      Users entity=dao.findUser(user);
       return entity;
   }

    public List<Tickets> getCompletedTrips(Users user){
        Users entity=getUserByLoginPassword(user);
        Date curdate= new Date();
        List<Tickets> result= new ArrayList<>();
        for(Tickets ticket: entity.getTicketsesByIdUser()){
            if(!ticket.getStatus().equals("возвращён")) {
                String s=ticket.getDateDeparture();

                Context context = new Context(new DateByConvert());
                Date docDate = context.returnDate(7,curdate,s);

            //  Date docDate= DateUtil.converStringToDate(7,curdate,s);
                if(DateUtil.isPassed(docDate)){
                    result.add(ticket);
                }
            }

        }
        return result;
    }

    public List<Tickets> getFutureTrips(Users user){
        Users entity=getUserByLoginPassword(user);
        Date curdate = new Date();
        List<Tickets> result= new ArrayList<>();
        for(Tickets ticket: entity.getTicketsesByIdUser()){
            if(!ticket.getStatus().equals("возвращён")) {
                String s=ticket.getDateDeparture();
                Context context = new Context(new DateByConvert());
                Date docDate = context.returnDate(7,curdate,s);
                if(!DateUtil.isPassed(docDate)){
                    result.add(ticket);
                }
            }

        }
        return result;
    }

    public List<Tickets> getCanceledTrips(Users user){
        Users entity=getUserByLoginPassword(user);
        List<Tickets> result= new ArrayList<>();
        for(Tickets ticket: entity.getTicketsesByIdUser()){
            if(ticket.getStatus().equals("возвращён")) {
                result.add(ticket);
            }

        }
        return result;
    }

    public boolean createFeedBackForUser(Feaadback entity){
        UsersDao dao = DAOFactory.getFactory().getUsersDao();
        dao.saveFeedBackForUser(entity);
        return true;
    }

    public  List<Feaadback> getFeedBacks(){
        UsersDao dao = DAOFactory.getFactory().getUsersDao();
        List<Feaadback> result=dao.getFeedBacks();
        return  result;
    }

    public List<Tickets> getUsersTickets(String numTrain,String date){
        TicketsDao dao = DAOFactory.getFactory().getTicketsDao();
        List<Tickets> tickets= dao.findTicketsByTrainAndDate(numTrain,date);
        return tickets;

    }
    public List<Users> getAllUsers(){
        UsersDao dao = DAOFactory.getFactory().getUsersDao();
        List<Users> users= dao.getAllUsers();
        return users;
    }

    public void deleteUser(Users ob){
        UsersDao dao = DAOFactory.getFactory().getUsersDao();
        dao.delete(ob);
    }

    public List<Tickets> getAllTicketsForUser(int id){
        UsersDao dao = DAOFactory.getFactory().getUsersDao();
        Users user=dao.getUserById(id);
        List <Tickets> list= new ArrayList<>();
        for(Tickets ticket:user.getTicketsesByIdUser()){
            list.add(ticket);
        }
        return list;
    }

}
