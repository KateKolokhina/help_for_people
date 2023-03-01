package com.naukma.helppeople.exceptionHandlers.exceptions;

public class UserNotFoundException extends RuntimeException {
    public UserNotFoundException(String login) {
        super("Користувача з login/id: " + login + " не знайдено, або він не існує.");
    }
}
