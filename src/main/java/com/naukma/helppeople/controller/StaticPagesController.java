package com.naukma.helppeople.controller;

import lombok.extern.log4j.Log4j2;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.ModelAndView;

@Controller
@Log4j2
public class StaticPagesController {

    @GetMapping({"/", "/index", "/about"})
    public ModelAndView index() {
        return new ModelAndView("index");
    }

    @GetMapping("/where-find")
    public ModelAndView whereCanFind() {
        return new ModelAndView("where_find");
    }

    @GetMapping("/donate")
    public ModelAndView donate() {
        return new ModelAndView("donate");
    }


    @ModelAttribute("currentUser")
    public UserDetails getCurrentUser(Authentication authentication) {
        return (authentication == null) ? null : (UserDetails) authentication.getPrincipal();
    }
}