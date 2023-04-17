package com.naukma.helppeople.controller;

import com.naukma.helppeople.entity.User;
import com.naukma.helppeople.entity.dto.UserDTO;
import com.naukma.helppeople.exceptionHandlers.exceptions.EntityDuplicateException;
import com.naukma.helppeople.exceptionHandlers.exceptions.UserNotFoundException;
import com.naukma.helppeople.repository.UserRepository;
import com.naukma.helppeople.service.UserService;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import java.security.Principal;

@Controller
@Log4j2
public class AuthController {

    @Autowired
    private UserService userService;

    @Autowired
    private UserRepository userRepository;

    @GetMapping("/login")
    public ModelAndView login() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("login");
        return mav;
    }

    @GetMapping("/registration")
    public ModelAndView registration() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("registration");
        UserDTO user = new UserDTO();
        mav.addObject("user", user);
        return mav;
    }

    @PostMapping("/registration")
    public RedirectView registUser(@ModelAttribute("user") UserDTO user) {
        log.info(user);
        if (userRepository.findUserById(user.getId()).isPresent()) {
            throw new EntityDuplicateException("Користувач", "id", user.getId().toString());
        }
        userService.addUser(user);
        Long id = userRepository.findByLogin(user.getLogin()).get().getId();
        return new RedirectView("/user/" + id);
    }

    @GetMapping("/success_login")
    public RedirectView successLogin(Principal principal) {
        User user = userService.findUserByLogin(principal.getName());
        return new RedirectView("/user/" + user.getId());
    }

    @GetMapping("/accessDenied")
    public ModelAndView accessDeniedException() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("access_denied");
        return mav;
    }

    @ModelAttribute("userId")
    public String getCurrentUserIpn(Authentication authentication) {
        UserDetails det = (authentication == null) ? null : (UserDetails) authentication.getPrincipal();
        if (det == null) {
            return "";
        } else {
            String login = det.getUsername();
            if (!userRepository.findByLogin(login).isPresent()) {
                throw new UserNotFoundException(login);
            } else
                return userRepository.findByLogin(login).get().getId().toString();
        }
    }

    @ModelAttribute("currentUser")
    public UserDetails getCurrentUser(Authentication authentication) {
        return (authentication == null) ? null : (UserDetails) authentication.getPrincipal();
    }
}
