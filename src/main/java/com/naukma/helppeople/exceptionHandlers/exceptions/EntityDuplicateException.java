package com.naukma.helppeople.exceptionHandlers.exceptions;

public class EntityDuplicateException extends RuntimeException {

    public EntityDuplicateException(String object, String valueName, String value) {

        super(object + " зі значенням: " + valueName + ": " + value + " вже існує.");
    }

}
