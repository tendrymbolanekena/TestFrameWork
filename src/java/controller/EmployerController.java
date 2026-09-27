package controller;

import annotation.Controller;
import annotation.UrlMapping;
import view.*;
import java.util.List;
import annotation.ToJson;
import java.util.Vector;
import annotation.Param;

@Controller
public class EmployerController {

    @UrlMapping(path="/liste", methode = "GET")
    public ModelAndView liste() {
        ModelAndView modelAndView = new ModelAndView();
        System.out.println("liste");
        modelAndView.setViewName("accueil");
        modelAndView.setAttribute("employers", "nnnna");

        return modelAndView;
    }
    
    @UrlMapping(path="/listeJson", methode="GET") 
    @ToJson
    public ModelAndView listeJsonaa(@Param("id") int id , @Param("message") String message) { 
       ModelAndView modelAndView = new ModelAndView();      
       System.out.println("listeJson");
       modelAndView.setViewName("accueil");
       modelAndView.setAttribute("employers", id);
       modelAndView.setAttribute("message", message);

       return modelAndView;
    }
}