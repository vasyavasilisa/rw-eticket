package com.bsuir.rw.controllers;

import com.bsuir.rw.beans.StationsOfTrainBean;
import com.bsuir.rw.beans.TrainsBean;
import com.bsuir.rw.model.domain.*;
import com.bsuir.rw.services.*;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;


/**
 * Created by USER on 03.05.2017.
 */
@Controller
@SessionAttributes({"user"})
public class AdminController {

    @RequestMapping(value = "/manag", method = RequestMethod.POST)
    public String auth() {
        return ("objects");
    }

    @RequestMapping(value = "/trains-manag", method = RequestMethod.POST)
    public ModelAndView trainsManag() {
        ModelAndView modelAndView = new ModelAndView();
        TrainsService service= new TrainsService();
        List<TrainsBean> list= service.getAllTrais();
        modelAndView.addObject("trains",list);
        modelAndView.setViewName("trainsAdmin");
        return  modelAndView;
    }

    @RequestMapping(value = "/delete-train", method = RequestMethod.POST)
    public ModelAndView deleteTrain(@RequestParam("idTrain") Integer idTrain) {
        ModelAndView modelAndView = new ModelAndView();
        TrainsService service= new TrainsService();
        Trains train = new Trains();
        train.setIdTrain(idTrain);
service.daleteTrain(train);
        return  trainsManag() ;
    }

    @RequestMapping(value = "/add-train", method = RequestMethod.POST)
    public ModelAndView addTrain(@RequestParam("number") String number,@RequestParam("rout") String rout) {
        ModelAndView modelAndView = new ModelAndView();
        TrainsService service= new TrainsService();
        Trains train = new Trains();
        train.setNumber(number);
        train.setNameTrain(rout);
       service.addTrain(train);
        return  trainsManag() ;
    }

    @RequestMapping(value = "/stations-manag", method = RequestMethod.POST)
    public ModelAndView stationsManag() {
        ModelAndView modelAndView = new ModelAndView();
        StationsOfTrainService service= new StationsOfTrainService();
       List<StationsOfTrainBean> list= service.loadAllStationsOfTrain();
        modelAndView.addObject("midstations",list);


        TrainsService tservice= new TrainsService();
        List<TrainsBean> trains= tservice.getAllTrais();
        modelAndView.addObject("trains",trains);
        StationsService stservice= new StationsService();
        List <Stations> stations= stservice.getAllStations();
        modelAndView.addObject("stations",stations);
        modelAndView.setViewName("stationsAdmin");
        return  modelAndView;
    }

    @RequestMapping(value = "/add-station", method = RequestMethod.POST)
    public ModelAndView addStation(@RequestParam("train") String trainNum,@RequestParam("station") String stationName,
                                   @RequestParam(value = "timeArr",required = false) String timeArr,
                                   @RequestParam(value = "timeDep",required = false) String timeDep,
                                   @RequestParam(value = "distance",required = false) String distance) {
        ModelAndView modelAndView = new ModelAndView();
        TrainsService service= new TrainsService();
        Trains train = service.getTrainByNumber(trainNum);

        StationsService stservice= new StationsService();
        Stations station = stservice.getStationBtName(stationName);
        Stationsoftrain st= new Stationsoftrain();
        st.setIdTrain(train.getIdTrain());
        st.setIdStation(station.getIdStation());
        st.setTrainsByIdTrain(train);
        st.setStationsByIdStation(station);
        if(!timeArr.isEmpty()) {
            String time[] = timeArr.split(":");
            st.setDatetimeOfArrive("20171212" + time[0] + time[1] + "00");
        }
        if(!timeDep.isEmpty()) {
            String time2[] = timeDep.split(":");
            st.setDatetimeOfDeparture("20171212" + time2[0] + time2[1] + "00");
        }
        if(!distance.isEmpty()) {
            st.setDistance(Integer.valueOf(distance));
        }
        else {
            st.setDistance(0);
        }
        StationsOfTrainService sservice = new StationsOfTrainService();
        sservice.insert(st);
        return  stationsManag() ;
    }

    @RequestMapping(value = "/report", method = RequestMethod.POST)
    public ModelAndView showReport(@RequestParam("train") String trainNum,@RequestParam("date") String dateDep) {
        ModelAndView modelAndView = new ModelAndView();
        UserServices service= new UserServices();
        List<Tickets> list= service.getUsersTickets(trainNum,dateDep);
        modelAndView.addObject("report",list);
        modelAndView.setViewName("report");
        return  modelAndView;
    }

    @RequestMapping(value = "/form-report", method = RequestMethod.POST)
    public String showReportForm() {
        return  "report";
    }


    @RequestMapping(value = "/feedbacks-manag", method = RequestMethod.POST)
    public  ModelAndView showFeedBacks() {
        ModelAndView modelAndView = new ModelAndView();
        UserServices service= new UserServices();
        List<Feaadback> feedbacks= service.getFeedBacks();
        modelAndView.addObject("feedbacks",feedbacks);
        modelAndView.setViewName("feedbacksadmin");
        return  modelAndView ;
    }


    @RequestMapping(value = "/delete-feedback", method = RequestMethod.POST)
    public  ModelAndView deleteFeedBack(@RequestParam("idFeed") Integer idFeedback) {

        Feaadback feed= new Feaadback();
        feed.setIdFeedback(idFeedback);
     FeedBackService service= new FeedBackService();
        service.deleteFeedBackById( feed);
        return  showFeedBacks();
    }

    @RequestMapping(value = "/users-manag", method = RequestMethod.POST)
    public  ModelAndView showUsers() {
        ModelAndView modelAndView = new ModelAndView();
        UserServices service= new UserServices();
        List<Users> users= service.getAllUsers();
        modelAndView.addObject("users",users);
        modelAndView.setViewName("usersadmin");
        return  modelAndView ;
    }
    @RequestMapping(value = "/delete-user", method = RequestMethod.POST)
    public  ModelAndView deleteUser(@RequestParam("idUser") Integer idUser) {
        Users user= new Users();
        user.setIdUser(idUser);
        UserServices service= new UserServices();
        service.deleteUser(user);
        return  showUsers();
    }

    @RequestMapping(value = "/show-history", method = RequestMethod.POST)
    public  ModelAndView showHistory(@RequestParam("idUser") Integer idUser,@RequestParam("login") String login) {
        ModelAndView modelAndView = new ModelAndView();
        UserServices service= new UserServices();
        List<Tickets> tickets=service.getAllTicketsForUser(idUser);
        modelAndView.addObject("tickets",tickets);
        modelAndView.addObject("login",login);
        modelAndView.setViewName("history");
        return  modelAndView;
    }

}
