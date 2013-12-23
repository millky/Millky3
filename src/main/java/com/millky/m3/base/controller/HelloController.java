package com.millky.m3.base.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/")
public class HelloController {
    @RequestMapping(method = RequestMethod.GET)
    public String printWelcome(ModelMap model) {
        model.addAttribute("message", "Hello world! get");
        return "hello";
    }

    @RequestMapping(method = RequestMethod.POST)
    public String printWelcomePost(ModelMap model) {
        model.addAttribute("message", "Hello world! post");
        return "hello";
    }
}