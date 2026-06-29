package controller;

import annotation.Controller;
import annotation.UrlMapping;

@Controller
public class EmployerController {
    @UrlMapping(path="/liste", methode = "GET")
    public void liste() {
        System.out.println("Liste des employeurs");
    }
}