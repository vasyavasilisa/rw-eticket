package com.bsuir.rw.controllers;

import com.bsuir.rw.beans.Train;
import com.bsuir.rw.beans.User;
import com.bsuir.rw.model.beans.PlacesBean;
import com.bsuir.rw.model.beans.TrainsBean;
import com.bsuir.rw.model.domain.Carriageoftrain;
import com.bsuir.rw.model.domain.Places;
import com.bsuir.rw.model.domain.Tickets;
import com.bsuir.rw.model.domain.Users;
import com.bsuir.rw.model.services.CarriageoftrainService;
import com.bsuir.rw.model.services.PlacesService;
import com.bsuir.rw.model.services.TicketService;
import com.bsuir.rw.model.services.TrainsService;
import com.bsuir.rw.model.utils.DateUtil;
import com.bsuir.rw.model.utils.HibernateSessionFactory;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;


/**
 * Created by USER on 14.04.2017.
 */

@Controller
@SessionAttributes({"user","trainParam","carriage","trainId","resultTickets"/*,"place"*/})
public class PlacesController {


    @ModelAttribute("resultTickets")
    public List<Tickets> createPlacesRequest() {
        return new ArrayList<>();
    }

    @RequestMapping(value = "/bye", method = RequestMethod.POST)
    public ModelAndView authiio(@SessionAttribute("user") Users user,@SessionAttribute("trainParam") Train train,
                             @SessionAttribute("carriage") Carriageoftrain car,
                                @SessionAttribute("trainId") String trainId,@RequestParam("place") String[] paramPlace,
                                @RequestParam("surname") String[] surname, @RequestParam("name") String[] name,
                                @RequestParam("passport") String[] passport, @RequestParam("count") int count,
                                @RequestParam(value="bye",required = false) String bye, @RequestParam(value="book", required = false)String book ) {
        TrainsService serv=new TrainsService();
        PlacesService placesservice= new PlacesService();
        TrainsBean bean=serv.getParamForTicket(Integer.valueOf(trainId),train.getDepartment(),train.getArrive());
        ModelAndView modelAndView = new ModelAndView();
        TicketService service= new TicketService();
        List<Tickets> resultTickets= new ArrayList<>();
        Tickets singleTicket= new Tickets();
        int i = 0 ;
        for(String str: paramPlace) {
                Tickets tickets = new Tickets();
                String placesParam[] = str.split("/");
                int idPlace = Integer.valueOf(placesParam[0]);
                double cost = Double.valueOf(placesParam[1]);
                int placeNumber = Integer.valueOf(placesParam[2]);
                String ticket_number = service.getgTicketNumber();
                tickets.setIdUser(Integer.valueOf(user.getIdUser()));
                tickets.setUsersByIdUser(user);
                tickets.setTicketNumber(ticket_number);
                tickets.setRout(train.getDepartment() + "-" + train.getArrive());
                tickets.setDateDeparture(train.getDate());
                tickets.setTimeDeparture(bean.getTimeDeparture());
                tickets.setTimeArrive(bean.getTimeArrive());
                tickets.setTrainNumber(bean.getNumber());
                tickets.setCarriageNumber(car.getNumber());
                tickets.setPlaceNumber(placeNumber);
                tickets.setPrice(cost);
            if(bye!=null) {
                tickets.setStatus("оплачен");
                Places place=placesservice.getPlaceEntityById(idPlace);
                place.setStatus("занято");
                placesservice.updatePlace(place);
            }
            else {
                tickets.setStatus("бронь");
                Places place=placesservice.getPlaceEntityById(idPlace);
                place.setStatus("забронировано");
                placesservice.updatePlace(place);
            }
                 Date curDate = new Date();
                SimpleDateFormat formatForDateNow = new SimpleDateFormat("yyyyMMddhhmmss");
                tickets.setDatetimeCreation(formatForDateNow.format(curDate));
                Date newDate = DateUtil.changeDateByAddDays(7,curDate); // получаем измененную дату
                tickets.setDatetimeCancel(formatForDateNow.format(newDate));
                tickets.setPassangerSurname(surname[i]);
                tickets.setPassangerName(name[i]);
                tickets.setPassportNumber(passport[i]);
               // service.createTicket( tickets);
            resultTickets.add( tickets);
            singleTicket=tickets;
           i++;
        }

        modelAndView.addObject("singleTicket",singleTicket);
        modelAndView.addObject("resultTickets",resultTickets);
        modelAndView.setViewName("checkorder");
        return modelAndView;


    }
}
