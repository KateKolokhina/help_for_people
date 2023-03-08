package com.naukma.helppeople.service;

import com.naukma.helppeople.entity.User;
import com.naukma.helppeople.entity.dto.UserDTO;
import com.naukma.helppeople.exceptionHandlers.exceptions.EntityDuplicateException;
import com.naukma.helppeople.repository.UserRepository;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Service
@Log4j2
public class UserService {
    @Autowired
    private BCryptPasswordEncoder passwordEncoder;

    @Autowired
    private UserRepository userRepository;

    public User findUserById(Long id) {
        if (userRepository.findUserById(id).isPresent()) {
            log.info("found by id  -> id:" + id);
            return userRepository.findUserById(id).get();
        } else {
            return null;
        }
    }


    public User findUserByLogin(String login) {
        if (userRepository.findByLogin(login).isPresent()) {
            log.info("found by login  -> login:" + login);
            return userRepository.findByLogin(login).get();
        } else {
            return null;
        }
    }

    public void addUser(UserDTO userNew) {
        User userNewLogin = findUserByLogin(userNew.getLogin());
        if (userNewLogin != null) {
            throw new EntityDuplicateException("Користувач", "login", userNew.getLogin());
        }
        User user = new User();
        userNew.setPassword(passwordEncoder.encode(userNew.getPassword()));
        user.changeUser(userNew);
        user.setRole("USER");
        userRepository.save(user);
    }
}
