package com.bsuir.rw.controllers;

import com.bsuir.rw.beans.Train;
import com.bsuir.rw.beans.User;
import com.bsuir.rw.model.domain.Users;
import com.bsuir.rw.services.UserServices;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

/**
 * Created by USER on 12.04.2017.
 */


@Controller
@SessionAttributes({"user","trainParam"})
public class AuthController {


    private static final String AUTH_REGISTRATION_VAL="registration";
    private static final String AUTH_LOGIN_VAL="login";
    private static final String AUTH_LOGOUT_VAL="logout";
    private static final String LOGIN_ATTR_ERR="login_attr";


    @ModelAttribute("trainParam")
    public Train createTrainRequest() {
        return new Train();
    }
    @ModelAttribute("user")
    public Users createUserRequest() {
        return new Users();
    }
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public ModelAndView auth(@RequestParam("auth") String auth,  HttpSession session,SessionStatus status) {
        ModelAndView modelAndView = new ModelAndView();
        if(auth!=null) {
            if (auth.equals(AUTH_REGISTRATION_VAL)) {
                modelAndView.addObject("user", new Users());
                modelAndView.setViewName("registration");
                return modelAndView;
            } else if (auth.equals(AUTH_LOGIN_VAL)) {
                modelAndView.addObject("user", new User());
                modelAndView.setViewName("authorisation");
                return modelAndView;
            }
            if (auth.equals(AUTH_LOGOUT_VAL)) {
                status.setComplete();
                session.removeAttribute("user");
                modelAndView.setViewName("main");
                return modelAndView;
            }
        }

        modelAndView.addObject("user", new User());
        modelAndView.setViewName("registration");
        return modelAndView;
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public ModelAndView authGet(@RequestParam(value="auth",required = false) String auth) {
        return authGet(auth);
    }

    @RequestMapping(value = "/registration", method = RequestMethod.POST)
    public ModelAndView registration(@Valid @ModelAttribute("user") Users user, BindingResult bindingResult) {
        ModelAndView modelAndView = new ModelAndView();
        if(bindingResult.hasErrors()){
            modelAndView.setViewName("registration");
            return modelAndView;
        }
        UserServices service = new UserServices();
        double balance=service.generateBalance();
        user.setBalance(balance);
        // user.setRole("0");
        service.createUser(user);
        Users createdUser=service.getUserByLoginPassword(user);
        modelAndView.addObject("user",createdUser);
        modelAndView.setViewName("main");
        return modelAndView;
    }


    @RequestMapping(value = "/authorisation", method = RequestMethod.POST)
    public ModelAndView authorisation(@Valid @ModelAttribute("user") User user, BindingResult bindingResult) {
        ModelAndView modelAndView = new ModelAndView();

        if (bindingResult.hasErrors()) {
            modelAndView.setViewName("authorisation");
            return modelAndView;
        }
        UserServices service = new UserServices();
       ApplicationContext cont= new ClassPathXmlApplicationContext("applicationContext.xml");
        Users ob = (Users) cont.getBean("objUser");

        // Users ob=new Users();
        ob.setLogin(user.getLogin());
        ob.setPassword(user.getPassword());
       Users findUser = service.getUserByLoginPassword(ob);
        if (findUser == null) {
            modelAndView.addObject(LOGIN_ATTR_ERR, user.getLogin());
            modelAndView.setViewName("authorisation");
            return modelAndView;
        } else {
if(findUser.getRole().equals("0")) {
    modelAndView.addObject("user", findUser);
    modelAndView.setViewName("main");
    return modelAndView;
}

            else {
    modelAndView.addObject("user", findUser);
    modelAndView.setViewName("mainadmin");
    return modelAndView;

            }
        }
    }



}
