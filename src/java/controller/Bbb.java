package controller;

import annotation.Controller;
import annotation.RequestMapping;

@Controller
public class Bbb {

    @RequestMapping("/test/qqqq")
    public void test() {
        System.out.println("test");
    }
}