package com.bsuir.rw.controllers;

import com.bsuir.rw.beans.Train;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by USER on 12.04.2017.
 */
@Controller
@SessionAttributes({"trainParam"})
public class PassangerServicesController{


    @ModelAttribute("trainParam")
    public Train createTrainRequest() {
        return new Train();
    }


    @RequestMapping(value = "/byebook", method = RequestMethod.POST)
    public ModelAndView byebook(@ModelAttribute("trainParam") Train train) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("trainParam", new Train());
        modelAndView.setViewName("byebook");
        return modelAndView;
    }

    @RequestMapping(value = "/byebook", method = RequestMethod.GET)
    public ModelAndView byebookGet(@ModelAttribute("trainParam") Train train) {
        return byebook(train);
    }
//////////////////////////////////////////////////////////////////////////////{
}
