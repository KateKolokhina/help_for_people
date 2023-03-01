package com.naukma.helppeople.exceptionHandlers;

import com.naukma.helppeople.exceptionHandlers.exceptions.EntityDuplicateException;
import com.naukma.helppeople.exceptionHandlers.exceptions.UserExistsException;
import com.naukma.helppeople.exceptionHandlers.exceptions.UserNotFoundException;
import com.naukma.helppeople.repository.UserRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.annotation.AnnotationUtils;
import org.springframework.expression.AccessException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

@ControllerAdvice
@Slf4j
public class CustomExceptionHandler {
    @Autowired
    private UserRepository userRepository;

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
            String email = det.getUsername();
            if (!userRepository.findByLogin(email).isPresent()) {
                throw new UserNotFoundException(email);
            } else
                return userRepository.findByLogin(email).get().getId().toString();
        }
    }

    private ModelAndView getErrorMav(HttpServletRequest req, Exception exception, Integer status) throws Exception {
        // Rethrow annotated exceptions or they will be processed here instead.
        if (AnnotationUtils.findAnnotation(exception.getClass(),
                ResponseStatus.class) != null)
            throw exception;

        log.error("Request: " + req.getRequestURI() + " raised " + exception);

        ModelAndView mav = new ModelAndView("error");
        mav.addObject("exception", exception);
        mav.addObject("message", exception.getMessage());
        mav.addObject("status", status);

        return mav;
    }

    @ExceptionHandler(AccessException.class)
    public ModelAndView accessError(HttpServletRequest req, Exception exception) throws Exception {
        return getErrorMav(req, exception, 403);
    }

    @ExceptionHandler(EntityDuplicateException.class)
    public ModelAndView handleEntityDuplicateException(HttpServletRequest req, EntityDuplicateException exception)
            throws Exception {
        return getErrorMav(req, exception, 409); //Conflict error
    }

    @ExceptionHandler(UserNotFoundException.class)
    public ModelAndView HandleUserNotFoundException(HttpServletRequest req, UserNotFoundException exception) throws Exception {
        return getErrorMav(req, exception, 404);
    }


    @ExceptionHandler(Exception.class)
    public ModelAndView handleException(HttpServletRequest req, Exception exception)
            throws Exception {
        return getErrorMav(req, exception, 500);
    }

    @ExceptionHandler(UserExistsException.class)
    public ModelAndView handleUserExistsException(HttpServletRequest req, UserExistsException exception)
            throws Exception {
        return getErrorMav(req, exception, 409); //Conflict error
    }

}
