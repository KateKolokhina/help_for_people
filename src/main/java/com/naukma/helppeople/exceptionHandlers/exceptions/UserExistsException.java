package com.naukma.helppeople.exceptionHandlers.exceptions;

public class UserExistsException extends RuntimeException {
    public UserExistsException() {
        super("Користувач з ");
    }
}
