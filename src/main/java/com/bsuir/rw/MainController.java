package com.bsuir.rw;

/**
 * Created by USER on 09.04.2017.
 */
import com.bsuir.rw.model.beans.TrainsBean;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import com.bsuir.rw.beans.Train;

import com.bsuir.rw.model.beans.CarriagesBean;
import com.bsuir.rw.model.beans.StationsOfTrainBean;
import com.bsuir.rw.model.services.StationsOfTrainService;
import com.bsuir.rw.model.services.TrainsService;

import java.util.ArrayList;
import java.util.List;


@Controller
@SessionAttributes({"trainParam", "trainId"})
public class MainController {

    private static final String SORT_PARAM="sort";
    private static final String SORT_TRAVEL_PARAM="sorttimetravel";
    private static final String SORT_DEPARTURE_PARAM="sorttimedeparture";
    private static final String SET_SORT_TRAVEL_PARAM="sortTimeTravel";
    private static final String SET_SORT_DEPARTURE_PARAM="sortTimeDep";
    private static final String DEPARTMENT_STATION_PARAM = "department";
    private static final String ARRIVE_STATION_PARAM = "arrive";

    private static final String ERR_ROUT = "Нет поездов по указанному маршруту";
    private static final String ERR_DATE = "В указанную дату поезд не идёт";


    /*First method on start application*/
    /*Попадаем сюда на старте приложения (см. параметры аннотации и настройки пути после деплоя) */
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String main() {

        return "main";
    }


    @RequestMapping(value = "/passenger-services", method = RequestMethod.POST)
    public String passengerServices() {
        return  "passangerservices";
    }

    @RequestMapping(value = "/byebook", method = RequestMethod.POST)
    public ModelAndView byebook(@ModelAttribute("trainParam") Train train) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("trainParam", new Train());
        modelAndView.setViewName("byebook");
        return modelAndView;
    }

    @ModelAttribute("trainParam")
    public Train createTrainRequest() {
        return new Train();
    }


    @ModelAttribute("trainId")
    public String createTrainIdRequest() {
        return "empty";
    }

    /*как только на index.jsp подтвердится форма
    <spring:form method="post"  modelAttribute="userJSP" action="check-user">,
    то попадем вот сюда
     */



    @RequestMapping(value = "/findtrains", method = RequestMethod.POST)
    public ModelAndView findtrains(@ModelAttribute("trainParam") Train train/*,@ModelAttribute("trainInfo") TrainInfo trainInfo*/){

        System.out.println(train.getDepartment());
        System.out.println(train.getArrive());
        System.out.println(train.getDate());
        List<TrainsBean> arrayTrains = new ArrayList<TrainsBean>();

        TrainsService service= new TrainsService();
        arrayTrains= service.getAllTrainsByDateStations(train.getDate(),train.getDepartment(),train.getArrive());
        ModelAndView modelAndView = new ModelAndView();
        if (arrayTrains.isEmpty()) {

            boolean isExistRout = service.isRoutExist(train.getDate(),train.getDepartment(),train.getArrive());

            if (!isExistRout) {//////////////////////Не найден маршрут
                modelAndView.addObject("errorRout", ERR_ROUT);

            } else {////////////////////////////Не найдена дата
                modelAndView.addObject("errorRout", ERR_DATE);

            }
            modelAndView.setViewName("byebook");
            return modelAndView;
        }
        else {
       /* modelAndView.addObject("trainInfo", new TrainInfo());*/
            modelAndView.addObject("trains", arrayTrains);
            modelAndView.setViewName("findtrains");
            return modelAndView;
        }
    }


    @RequestMapping(value = "/trains-info", method = RequestMethod.POST)
    public ModelAndView trainsinfo(@RequestParam(value = "middlestations", required = false) String id_train_for_st,
                                   @RequestParam(value = "idTrain", required = false) String id_train_for_carr){    /*Промежуточные или вагоны */
        List<StationsOfTrainBean> arrayStations = new ArrayList<StationsOfTrainBean>();
        ModelAndView modelAndView = new ModelAndView();
        if (id_train_for_st!= null) {
            StationsOfTrainService service= new StationsOfTrainService();
            arrayStations=service.getAllStationsOfTrain(id_train_for_st);
            modelAndView = new ModelAndView();
            modelAndView.addObject("stations",arrayStations);
            modelAndView.setViewName("middlestations");
            return modelAndView;
        }

        else if(id_train_for_carr!=null){
            TrainsService service= new TrainsService();
            List<CarriagesBean> beans = new ArrayList<CarriagesBean>();
            beans =  service.getCarriagesForTrain(Integer.valueOf(id_train_for_carr));
            modelAndView.addObject("carriages",beans);
            modelAndView.addObject("trainId",id_train_for_carr);
            modelAndView.setViewName("carriagesforusers");
            return modelAndView;
        }


        return modelAndView;
    }

    @RequestMapping(value = "/trains-sort", method = RequestMethod.POST)
    public ModelAndView trainsSort(@RequestParam(SORT_PARAM) String sort_param,@RequestParam("date") String date,
                                   @ModelAttribute("trainParam") Train train){    /*Промежуточные или вагоны */
        List<TrainsBean> trainsArray = new ArrayList<TrainsBean>();
        ModelAndView modelAndView = new ModelAndView();
        if (sort_param.equals(SORT_DEPARTURE_PARAM)){///////////////сортировать по времени отправления

            TrainsService service= new TrainsService();
            trainsArray = service.getTrainsOrderByTimeDep(train.getDate(),train.getDepartment(),train.getArrive());
            modelAndView.addObject("checkbox",SET_SORT_DEPARTURE_PARAM);
            modelAndView.addObject("trains",trainsArray);
            modelAndView.setViewName("findtrains");
            return modelAndView;


        }

        else if(sort_param.equals(SORT_TRAVEL_PARAM)) {
            TrainsService service= new TrainsService();
            trainsArray= service.getAllTrainsByDateStations(train.getDate(),train.getDepartment(),train.getArrive());
            modelAndView.addObject("checkbox",SET_SORT_TRAVEL_PARAM);
            modelAndView.addObject("trains",trainsArray);
            modelAndView.setViewName("findtrains");
            return modelAndView;
        }




        return modelAndView;
    }




}