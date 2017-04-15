package com.bsuir.rw.controllers;

import com.bsuir.rw.beans.Train;
import com.bsuir.rw.model.beans.TrainsBean;
import com.bsuir.rw.model.domain.Carriageoftrain;
import com.bsuir.rw.model.domain.Tickets;
import com.bsuir.rw.model.domain.Users;
import com.bsuir.rw.model.services.TicketService;
import com.bsuir.rw.model.services.TrainsService;
import com.bsuir.rw.model.services.UserServices;
import com.bsuir.rw.model.utils.DateUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by USER on 15.04.2017.
 */


@Controller
@SessionAttributes({"resultTickets"})
public class CheckOrderController {


    @RequestMapping(value = "/confirmorder", method = RequestMethod.POST)
    public ModelAndView confirmOrder(@ModelAttribute("resultTickets") List<Tickets> resultTickets) {
        ModelAndView modelAndView = new ModelAndView();
        TicketService service= new TicketService();
        for(Tickets ticket: resultTickets){
            service.createTicket( ticket);
        }
        modelAndView.setViewName("orderNumber");
        return modelAndView;
    }


    @RequestMapping(value = "/private-office", method = RequestMethod.POST)
    public ModelAndView goToPrivateOffice(@SessionAttribute("user") Users user) {
        ModelAndView modelAndView = new ModelAndView();
        UserServices service= new UserServices();
        List<Tickets> completedTickets= new ArrayList<>();
        Date curDate= new Date();
        completedTickets=service.getCompletedTrips(user,curDate);
        modelAndView.addObject("completedTrips",completedTickets);
        modelAndView.setViewName("privateoffice");
        return modelAndView;


    }

    @RequestMapping(value = "/future-trips", method = RequestMethod.POST)
    public ModelAndView getFutureTrips(@SessionAttribute("user") Users user) {
        ModelAndView modelAndView = new ModelAndView();
        UserServices service= new UserServices();
        List<Tickets> futureTickets= new ArrayList<>();
        Date curDate= new Date();
        futureTickets=service.getFutureTrips(user,curDate);
        modelAndView.addObject("futureTrips",futureTickets);
        modelAndView.setViewName("futuretrips");
        return modelAndView;


    }


    @RequestMapping(value = "/cancel-order", method = RequestMethod.POST)
    public ModelAndView cancelOrder(@RequestParam("cancel") int ticketId) {
        ModelAndView modelAndView = new ModelAndView();
        TicketService service= new TicketService();
        Tickets ticket= new Tickets();
        ticket=service.getTicketById(ticketId);
        ticket.setStatus("возвращён");
        service.updateTicket(ticket);
        modelAndView.addObject("ticketNumber",ticket.getTicketNumber());
        modelAndView.setViewName("returnNotice");
        return modelAndView;


    }

    @RequestMapping(value = "/canceled-orders", method = RequestMethod.POST)
    public ModelAndView getCanceledOrders(@SessionAttribute("user") Users user) {
        ModelAndView modelAndView = new ModelAndView();
        UserServices service= new UserServices();
        List<Tickets> canceledTickets= new ArrayList<>();
        canceledTickets=service.getCanceledTrips(user);
        modelAndView.addObject("canceledTrips",canceledTickets);
        modelAndView.setViewName("canceledtrips");
        return modelAndView;


    }
}
