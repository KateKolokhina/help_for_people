package com.naukma.helppeople.exceptionHandlers.exceptions;

public class RequestProductNotFoundException extends RuntimeException {

    public RequestProductNotFoundException(Long id, Long prodId) {
        super("Не можемо знайти продукт з id:" + prodId + ", у заявці з id: " + id);
    }

}
