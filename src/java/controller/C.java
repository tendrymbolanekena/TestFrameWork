package controller;

import annotation.Controller;
import annotation.RequestMapping;

@Controller
public class C {
    @RequestMapping("/test/akakaka")
    public void entrer() {
        System.out.println("test");
    }
}