package com.bsuir.rw;

/**
 * Created by USER on 09.04.2017.
 */
import com.bsuir.rw.model.beans.TrainsBean;
import com.bsuir.rw.model.domain.Carriage;
import com.bsuir.rw.model.domain.Carriageoftrain;
import com.bsuir.rw.model.domain.Users;
import com.bsuir.rw.model.services.EmailService;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import com.bsuir.rw.beans.Train;

import com.bsuir.rw.model.beans.CarriagesBean;
import com.bsuir.rw.model.beans.StationsOfTrainBean;
import com.bsuir.rw.model.services.StationsOfTrainService;
import com.bsuir.rw.model.services.TrainsService;

//import javax.validation.Valid;
import javax.validation.Valid;
import java.util.ArrayList;
import java.util.List;


@Controller
@SessionAttributes({"trainParam", "trainId","user","carriage"})
public class MainController {

    private static final String SORT_PARAM="sort";
    private static final String SORT_TRAVEL_PARAM="sorttimetravel";
    private static final String SORT_DEPARTURE_PARAM="sorttimedeparture";
    private static final String SET_SORT_TRAVEL_PARAM="sortTimeTravel";
    private static final String SET_SORT_DEPARTURE_PARAM="sortTimeDep";


    private static final String ERR_ROUT = "Нет поездов по указанному маршруту";
    private static final String ERR_DATE = "В указанную дату поезд не идёт";


    /*First method on start application*/
    /*Попадаем сюда на старте приложения (см. параметры аннотации и настройки пути после деплоя) */
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String main() {
        return "main";
    }

    @RequestMapping(value = "/main", method = RequestMethod.POST)
    public String homepage() {
        return "main";
    }

    @ModelAttribute("trainParam")
    public Train createTrainRequest() {
        return new Train();
    }


    @ModelAttribute("trainId")
    public String createTrainIdRequest() {
        return "empty";
    }

    @ModelAttribute("user")
    public Users createUserRequest() {
        return new Users();
    }

///
@RequestMapping(value = "/passenger-services", method = RequestMethod.POST)
public String passengerServices() {
    return  "passangerservices";
}

    @RequestMapping(value = "/passenger-services", method = RequestMethod.GET)
    public String passengerServicesGet() {
        return  "passangerservices";
    }



/////////////////////////////////////////////////////////////////////



    /*как только на index.jsp подтвердится форма
    <spring:form method="post"  modelAttribute="userJSP" action="check-user">,
    то попадем вот сюда
     */



    @RequestMapping(value = "/findtrains", method = RequestMethod.POST)
    public ModelAndView findtrains(@ModelAttribute("trainParam") Train train/*,@ModelAttribute("trainInfo") TrainInfo trainInfo*/){

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
            modelAndView.addObject("trainParam",train);
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

    @RequestMapping(value = "/findtrains", method = RequestMethod.GET)
    public ModelAndView findtrainsGet(@ModelAttribute("trainParam") Train train/*,@ModelAttribute("trainInfo") TrainInfo trainInfo*/){

      return  findtrains(train);
    }

    @RequestMapping(value = "/findtrains-from-start", method = RequestMethod.POST)
    public ModelAndView findtrainsFromStart(@ModelAttribute("trainParam") Train train/*,@ModelAttribute("trainInfo") TrainInfo trainInfo*/){

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
            modelAndView.addObject("trainParam",train);
            modelAndView.setViewName("main");
            return modelAndView;
        }
        else {
       /* modelAndView.addObject("trainInfo", new TrainInfo());*/
            modelAndView.addObject("trains", arrayTrains);
            modelAndView.setViewName("findtrains");
            return modelAndView;
        }
    }

    @RequestMapping(value = "/findtrains-from-start", method = RequestMethod.GET)
    public ModelAndView findtrainsFromStartGet(@ModelAttribute("trainParam") Train train/*,@ModelAttribute("trainInfo") TrainInfo trainInfo*/){

        return findtrainsFromStart(train);
    }


    ////////////////////////////////////////////////////////////////

    @RequestMapping(value = "/trains-info", method = RequestMethod.POST)
    public ModelAndView trainsinfo(@RequestParam(value = "middlestations",required = false) String id_train_for_st,
                                   @RequestParam(value = "idTrain",required = false) String id_train_for_carr){    /*Промежуточные или вагоны */
        List<StationsOfTrainBean> arrayStations = new ArrayList<StationsOfTrainBean>();
        ModelAndView modelAndView = new ModelAndView();
        if (id_train_for_st!= null) {
            StationsOfTrainService service= new StationsOfTrainService();
            arrayStations=service.getAllStationsOfTrain(id_train_for_st);
            modelAndView = new ModelAndView();
            modelAndView.addObject("stations",arrayStations);
         //   modelAndView.addObject("middlestations",id_train_for_st);
            modelAndView.setViewName("middlestations");
            return modelAndView;
        }

        else if(id_train_for_carr!=null){
            TrainsService service= new TrainsService();
            List<CarriagesBean> beans = new ArrayList<CarriagesBean>();
            modelAndView = new ModelAndView();
            beans =  service.getCarriagesForTrain(Integer.valueOf(id_train_for_carr));
            modelAndView.addObject("carriages",beans);
            modelAndView.addObject("trainId",id_train_for_carr);
            modelAndView.addObject("carriage",new Carriageoftrain());
           // modelAndView.addObject("idTrain",id_train_for_carr);
            modelAndView.setViewName("carriagesforusers");
            return modelAndView;
        }


        return modelAndView;
    }

    @RequestMapping(value = "/trains-info", method = RequestMethod.GET)
    public ModelAndView trainsinfoGet(@ModelAttribute(value = "middlestations") String id_train_for_st,
                                      @ModelAttribute(value = "idTrain") String id_train_for_carr){    /*Промежуточные или вагоны */
        return trainsinfo(id_train_for_st,id_train_for_carr);

    }
    ///////////////////////////////////////////////////////////////////////////////////////




    @RequestMapping(value = "/trains-sort", method = RequestMethod.POST)
    public ModelAndView trainsSort(@RequestParam(value=SORT_PARAM ,required = false) String sort_param,@RequestParam(value="date",required = false) String date,
                                   @ModelAttribute("trainParam") Train train){    /*Промежуточные или вагоны */
        List<TrainsBean> trainsArray = new ArrayList<TrainsBean>();
        ModelAndView modelAndView = new ModelAndView();
        if(sort_param!=null) {
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

        }

        TrainsService service = new TrainsService();
        trainsArray = service.getTrainsOrderByTimeDep(train.getDate(), train.getDepartment(), train.getArrive());
        modelAndView.addObject("trains", trainsArray);
        modelAndView.setViewName("findtrains");
        return modelAndView;
    }

    @RequestMapping(value = "/trains-sort", method = RequestMethod.GET)
    public ModelAndView trainsSortGet(@RequestParam(value=SORT_PARAM,required = false) String sort_param,@RequestParam(value="date",required = false) String date,
                                   @ModelAttribute("trainParam") Train train) {    /*Промежуточные или вагоны */
     return trainsSort(sort_param,date,train);

    }





    }