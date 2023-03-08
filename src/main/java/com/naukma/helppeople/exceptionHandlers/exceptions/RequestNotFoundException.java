package com.naukma.helppeople.exceptionHandlers.exceptions;

public class RequestNotFoundException extends RuntimeException {

    public RequestNotFoundException(Long id) {
        super("Не можемо знайти заявку з id: " + id);
    }

}
