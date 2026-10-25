package controller;

import annotation.Controller;
import annotation.UrlMapping;
import view.*;
import java.util.List;
import annotation.ToJson;
import java.util.Vector;
import annotation.Param;
import model.Employer;
import util.Mysession;
import annotation.*;

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

    @UrlMapping(path="/listeJson", methode="POST") 
    @ToJson
    public ModelAndView listeJson(@Param("id") int id , @Param("message") String message) { 
       ModelAndView modelAndView = new ModelAndView();      
       System.out.println("listeJson");
       modelAndView.setViewName("accueil");
       modelAndView.setAttribute("employers", id);
       modelAndView.setAttribute("message", message);

       return modelAndView;
    }

    @UrlMapping(path = "/ajouter", methode = "POST")
    @ToJson
    public Employer ajouter(Employer employer , Mysession mysession) {
        mysession.add("0", employer.getNom());
        mysession.add("1", "admin");
        return employer;
    }


    @UrlMapping(path = "/s", methode = "GET")
    @ToJson
    public Employer getSessionEmployer(Mysession mysession) {
        return (Employer) mysession.get("0");
    }

    @UrlMapping(path = "/auth", methode = "GET")
    @Auth
    public void auth() {
        System.out.println("auth");
    }

    @UrlMapping(path = "/roles", methode = "GET")
    @Roles({"admin", "user"})
    @ToJson
    public String roles(Mysession mysession) {
        return mysession.get("1").toString();
    }
}