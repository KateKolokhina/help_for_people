package com.naukma.helppeople.service;

import com.naukma.helppeople.entity.User;
import com.naukma.helppeople.entity.dto.UserDTO;
import com.naukma.helppeople.exceptionHandlers.exceptions.EntityDuplicateException;
import com.naukma.helppeople.exceptionHandlers.exceptions.UserNotFoundException;
import com.naukma.helppeople.repository.UserRepository;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;

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

    public User findUserByPhone(String phone) {
        if (userRepository.findByPhone(phone).isPresent()) {
            log.info("found by phone  -> phone:" + phone);
            return userRepository.findByPhone(phone).get();
        } else {
            return null;
        }
    }

    public List<User> findByRole(String role) {
        return userRepository.findUsersByRole(role);
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

    public void editUser(Long id, UserDTO userNew) {
        if (!userRepository.findUserById(id).isPresent()) {
            throw new UserNotFoundException(id.toString());
        }
        User userNewLogin = findUserByLogin(userNew.getLogin());

        if (userNewLogin != null && !userNew.getLogin().equals(userNew.getOldLogin())) {
            throw new EntityDuplicateException("Користувач", "login", userNew.getLogin());
        }
        User user = userRepository.findUserById(id).get();

        if (!userNew.getPassword().isEmpty() && !passwordEncoder.encode(userNew.getPassword()).equals(user.getPassword())) {
            userNew.setPassword(passwordEncoder.encode(userNew.getPassword()));
        }
        user.changeUser(userNew);
        userRepository.save(user);
    }
}
