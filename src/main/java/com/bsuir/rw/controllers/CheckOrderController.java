package com.bsuir.rw.controllers;

import com.bsuir.rw.beans.Train;
import com.bsuir.rw.model.beans.TrainsBean;
import com.bsuir.rw.model.domain.Carriageoftrain;
import com.bsuir.rw.model.domain.Tickets;
import com.bsuir.rw.model.domain.Users;
import com.bsuir.rw.model.services.EmailService;
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
@SessionAttributes({"resultTickets","user"})
public class CheckOrderController {

      public static final String SUBJECT_CONFIRM_ORDER="Заказ на покупку проездных документов";
      public static final String BODY_CONFIRM_ORDER="Уважаемый пользователь. Вы успешно прошли электронную регистрацию.";
    public static final String SUBJECT_CANCEL_ORDER="Аннулирование заказа на покупку проездных документов";
    public static final String BODY_CANCEL_ORDER="Здравствуйте, уважаемый пользователь.";


    @RequestMapping(value = "/confirmorder", method = RequestMethod.POST)
    public ModelAndView confirmOrder(@ModelAttribute("resultTickets") List<Tickets> resultTickets,@SessionAttribute("user") Users user) {
        ModelAndView modelAndView = new ModelAndView();
        TicketService service= new TicketService();
        for(Tickets ticket: resultTickets){
            service.createTicket( ticket);
            StringBuilder startMessage= new StringBuilder(BODY_CONFIRM_ORDER);
            StringBuilder bodyMessage= new StringBuilder();
            bodyMessage=startMessage.append("Ваш заказ №").append( ticket.getTicketNumber())
                    .append(" на покупку элуктронных проездных документов на поезд №").append(ticket.getTrainNumber())
            .append(" по маршруту ").append(ticket.getRout()).append(" отправлением ").append(ticket.getDateDeparture()).append(" ")
            .append(ticket.getTimeDeparture()).append(" выполнен успешно. Стоимость заказа: ").append(ticket.getPrice())
                    .append(" BYN");
            EmailService emailService = new EmailService();
            emailService.sendEmail(user.getEmail(), SUBJECT_CONFIRM_ORDER, bodyMessage.toString());
        }


        modelAndView.setViewName("orderNumber");
        return modelAndView;
    }


    @RequestMapping(value = "/private-office", method = RequestMethod.POST)
    public ModelAndView goToPrivateOffice(@SessionAttribute("user") Users user) {
        ModelAndView modelAndView = new ModelAndView();
        if(user.getLogin()==null){
            modelAndView.setViewName("authMessage");
            return modelAndView;
        }

        UserServices service= new UserServices();
        List<Tickets> completedTickets= new ArrayList<>();
        completedTickets=service.getCompletedTrips(user);
        modelAndView.addObject("completedTrips",completedTickets);
        modelAndView.setViewName("privateoffice");
        return modelAndView;


    }

    @RequestMapping(value = "/future-trips", method = RequestMethod.POST)
    public ModelAndView getFutureTrips(@SessionAttribute("user") Users user) {
        ModelAndView modelAndView = new ModelAndView();
        UserServices service= new UserServices();
        List<Tickets> futureTickets= new ArrayList<>();
        futureTickets=service.getFutureTrips(user);
        modelAndView.addObject("futureTrips",futureTickets);
        modelAndView.setViewName("futuretrips");
        return modelAndView;


    }


    @RequestMapping(value = "/cancel-order", method = RequestMethod.POST)
    public ModelAndView cancelOrder(@RequestParam("cancel") int ticketId,@SessionAttribute("user") Users user) {
        ModelAndView modelAndView = new ModelAndView();
        TicketService service= new TicketService();
        Tickets ticket= new Tickets();
        ticket=service.getTicketById(ticketId);
        ticket.setStatus("возвращён");
        service.updateTicket(ticket);
        StringBuilder startMessage= new StringBuilder(BODY_CANCEL_ORDER);
        StringBuilder bodyMessage= new StringBuilder();
        bodyMessage=startMessage.append("Ваш заказ №").append( ticket.getTicketNumber())
                .append(" на покупку элуктронных проездных документов на поезд №").append(ticket.getTrainNumber())
                .append(" по маршруту ").append(ticket.getRout()).append(" отправлением ").append(ticket.getDateDeparture()).append(" ")
                .append(ticket.getTimeDeparture()).append(" был аннулирован. Список возвращённых заказов находится в личном кабинетею");
        EmailService emailService = new EmailService();
        emailService.sendEmail(user.getEmail(),SUBJECT_CANCEL_ORDER, bodyMessage.toString());

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
