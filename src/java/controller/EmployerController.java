package controller;

import annotation.Controller;
import annotation.UrlMapping;
import view.*;
import java.util.List;

@Controller
public class EmployerController {

    @UrlMapping(path="/liste", methode = "GET")
    public void liste(ModelAndView modelAndView) {

        System.out.println("liste");
        modelAndView.setViewName("accueil");
        modelAndView.setAttribute("employers", "nnnna");
    }

    // @UrlMapping(path="/liste", methode = "GET")
    // public void listes() {
    //     System.out.println("Liste 2222222");
    // }


}