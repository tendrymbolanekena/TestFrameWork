package controller;

import annotation.Controller;
import annotation.UrlMapping;

@Controller
public class EmployerController {
    @UrlMapping(value="/li")
    public void liste() {
        System.out.println("test");
    }

    @UrlMapping("/delete")
    public void delete() {
        System.out.println("test");
    }

    @UrlMapping("/update")
    public void update() {
        System.out.println("test");
    }

    @UrlMapping("/andrana")
    public void andrana() {
        System.out.println("test");
    }




}