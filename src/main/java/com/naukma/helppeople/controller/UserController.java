package com.naukma.helppeople.controller;

import com.naukma.helppeople.entity.dto.UserDTO;
import com.naukma.helppeople.exceptionHandlers.exceptions.EntityDuplicateException;
import com.naukma.helppeople.exceptionHandlers.exceptions.UserNotFoundException;
import com.naukma.helppeople.repository.UserRepository;
import com.naukma.helppeople.service.UserService;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

@Controller
@Log4j2
public class UserController {
    @Autowired
    private UserRepository userRepository;

    @Autowired
    private UserService userService;

    @ModelAttribute("currentUser")
    public UserDetails getCurrentUser(Authentication authentication) {
        return (authentication == null) ? null : (UserDetails) authentication.getPrincipal();
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

    @GetMapping("/user/add")
    @PreAuthorize("hasAuthority('ADMIN')")
    public ModelAndView createUserPage() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("user_create");
        UserDTO user = new UserDTO();
        mav.addObject("user", user);
        return mav;
    }

    @PostMapping("/user/add")
    @PreAuthorize("hasAuthority('ADMIN')")
    public RedirectView createUser(@ModelAttribute("user") UserDTO user) {
        if (userRepository.findByLogin(user.getLogin()).isPresent()) {
            throw new EntityDuplicateException("Користувач", "login", user.getLogin());
        }
        userService.addUser(user);
        return new RedirectView("/user/all");
    }


    @GetMapping("/user/{id}")
    public ModelAndView showUser(@PathVariable Long id) {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("user");

        if (!userRepository.findUserById(id).isPresent()) {
            throw new UserNotFoundException(id.toString());
        }
//        mav.addObject("receipts", receiptService.getAllReceipts(null, null, ipn));
        mav.addObject("user", userRepository.findUserDtoById(id));
        return mav;
    }

    @GetMapping("/user/edit/{id}")
    public ModelAndView showEditUser(@PathVariable Long id) {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("user_profile_edit");
        UserDTO user = new UserDTO(userRepository.findUserDtoById(id));
        if (!userRepository.findUserById(id).isPresent()) {
            throw new UserNotFoundException(id.toString());
        }
        mav.addObject("user", user);
        return mav;
    }

    @PostMapping("/user/edit/{id}")
    public RedirectView editUser(@PathVariable Long id, @ModelAttribute("userNew") UserDTO user) {
        log.info(user);
        if (!userRepository.findUserById(id).isPresent()) {
            throw new UserNotFoundException(id.toString());
        }
        userService.editUser(user.getId(), user);

        return new RedirectView("/user/" + id);
    }
}
