package com.bsuir.rw.controllers;

import com.bsuir.rw.beans.Train;
import com.bsuir.rw.beans.User;
import com.bsuir.rw.model.beans.PlacesBean;
import com.bsuir.rw.model.domain.Carriage;
import com.bsuir.rw.model.domain.Carriageoftrain;
import com.bsuir.rw.model.domain.Tickets;
import com.bsuir.rw.model.domain.Users;
import com.bsuir.rw.model.services.CarriageoftrainService;
import com.bsuir.rw.model.services.UserServices;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import java.util.List;

/**
 * Created by USER on 13.04.2017.
 */


@Controller
@SessionAttributes({"action","user","carriage","trainParam","trainId","carriageId"})
public class CarriagesController {

    private static final String AUTH_REGISTRATION_VAL="registration";
    private static final String LOGIN_ATTR_ERR="login_attr";

  /*  @ModelAttribute("places")
    public PlacesBean createPlacesRequest() {
        return new PlacesBean();
    }*/


  /* @ModelAttribute("tickets")
    public Tickets[] createTicketRequest() {
        //return new Tickets[4];
       Tickets tick[]=new Tickets[4];
       for(int i=0;i<4;i++){
           tick[i]=new Tickets();
       }
       return tick;
    }*/


    @RequestMapping(value = "/places", method = RequestMethod.POST)
    public ModelAndView auth(@SessionAttribute("user") Users user,@RequestParam("carriage") String idCarriage,
                             @SessionAttribute("trainParam") Train train, @SessionAttribute("trainId") String trainId) {
        ModelAndView modelAndView = new ModelAndView();
        if(user.getLogin()==null){
            modelAndView.addObject("user", new User());
            modelAndView.addObject("carriageId", idCarriage);
            modelAndView.setViewName("auth_reg");
            return modelAndView;
        }
        else{
            CarriageoftrainService service= new CarriageoftrainService();
            Carriageoftrain entity=service.getCarriageoftrain(Integer.valueOf(idCarriage));

List<PlacesBean> places=service.getPlacesForCarriage(Integer.valueOf(idCarriage),Integer.valueOf(trainId),
        train.getDepartment(),train.getArrive());
            modelAndView.addObject("carriageId", idCarriage);
            modelAndView.addObject("carriage", entity);
            modelAndView.addObject("places", places);
            modelAndView.setViewName("places");
            return modelAndView;
        }


    }

    @RequestMapping(value = "/places_check_auth", method = RequestMethod.POST)
    public ModelAndView auth_check(@Valid @ModelAttribute("user") User user, BindingResult bindingResult,
                                   @RequestParam("enter") String auth,
                                   @SessionAttribute("carriageId") String idCarriage,
                                   @SessionAttribute("trainParam") Train train,@SessionAttribute("trainId") String trainId) {
        ModelAndView modelAndView = new ModelAndView();
        if (auth != null) {
            if (auth.equals(AUTH_REGISTRATION_VAL)) {
                modelAndView.addObject("user", new Users());
                modelAndView.setViewName("registration_for_places");
                return modelAndView;
            } else  {
                    if (bindingResult.hasErrors()) {
                    modelAndView.setViewName("auth_reg");
                    return modelAndView;
                }
                UserServices service = new UserServices();
                Users ob=new Users();
                ob.setLogin(user.getLogin());
                ob.setPassword(user.getPassword());
                Users findUser = service.getUserByLoginPassword(ob);
                if (findUser == null) {
                    modelAndView.addObject(LOGIN_ATTR_ERR, user.getLogin());
                    modelAndView.setViewName("auth_reg");
                    return modelAndView;
                } else {
                    CarriageoftrainService car_service= new CarriageoftrainService();
                    Carriageoftrain entity=car_service.getCarriageoftrain(Integer.valueOf(idCarriage));
                    List<PlacesBean> places=car_service.getPlacesForCarriage(Integer.valueOf(idCarriage),Integer.valueOf(trainId),
                            train.getDepartment(),train.getArrive());
                    modelAndView.addObject("carriage", entity);
                    modelAndView.addObject("places", places);
                    modelAndView.addObject("user",findUser);
                    modelAndView.setViewName("places");
                    return modelAndView;
                }
            }
        }
        return modelAndView;
    }

    @RequestMapping(value = "/places_after_reg", method = RequestMethod.POST)
    public ModelAndView regShowPlaces(@Valid @ModelAttribute("user") Users user, BindingResult bindingResult,
                                      @SessionAttribute("carriageId") String idCarriage, @SessionAttribute("trainParam") Train train,
                                      @SessionAttribute("trainId") String trainId) {
        ModelAndView modelAndView = new ModelAndView();

                if (bindingResult.hasErrors()) {
                    modelAndView.setViewName("registration_for_places");
                    return modelAndView;
                }
        CarriageoftrainService service= new CarriageoftrainService();
        Carriageoftrain entity=service.getCarriageoftrain(Integer.valueOf(idCarriage));
        UserServices serv = new UserServices();
        double balance=serv.generateBalance();
        user.setBalance(balance);
        serv.createUser(user);
        Users createdUser=serv.getUserByLoginPassword(user);
        modelAndView.addObject("user",createdUser);
        List<PlacesBean> places=service.getPlacesForCarriage(Integer.valueOf(idCarriage),Integer.valueOf(trainId),
                train.getDepartment(),train.getArrive());
        modelAndView.addObject("carriage", entity);
        modelAndView.addObject("places", places);
        modelAndView.setViewName("places");
        return modelAndView;
    }


}
