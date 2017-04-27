package com.bsuir.rw.controllers;

import com.bsuir.rw.beans.User;
import com.bsuir.rw.model.domain.Feaadback;
import com.bsuir.rw.model.domain.Users;
import com.bsuir.rw.model.services.UserServices;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * Created by USER on 25.04.2017.
 */
@Controller
@SessionAttributes({"user","trainParam"})
public class UserController {


    @RequestMapping(value = "/leave-feedback", method = RequestMethod.POST)
    public ModelAndView leaveFeedback(@SessionAttribute("user") Users user,@RequestParam("feedback") String text) {
        ModelAndView modelAndView = new ModelAndView();
        UserServices service= new UserServices();
        Feaadback feedback= new Feaadback();
        feedback.setIdUser(Integer.valueOf(user.getIdUser()));
        feedback.setUsersByIdUser(user);
        feedback.setText(text);
        service.createFeedBackForUser(feedback);
        modelAndView.setViewName("main");
        return modelAndView;
    }


    @RequestMapping(value = "/fill-feedback", method = RequestMethod.POST)
    public ModelAndView fillFeedback(@SessionAttribute("user") Users user) {
        ModelAndView modelAndView = new ModelAndView();
        if(user.getLogin()==null){
            modelAndView.setViewName("authMessage");
            return modelAndView;
        }
        modelAndView.setViewName("livefeedback");
        return modelAndView;
    }

    @RequestMapping(value = "/feedbacks", method = RequestMethod.POST)
    public ModelAndView feedbacks(@SessionAttribute("user") Users user) {
        ModelAndView modelAndView = new ModelAndView();
UserServices service= new UserServices();
        List<Feaadback> feedbacks= service.getFeedBacks();
        modelAndView.addObject("feedbacks",feedbacks);
        modelAndView.setViewName("feedbacks");
        return modelAndView;
    }
}
