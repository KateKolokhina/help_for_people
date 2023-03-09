package com.naukma.helppeople.exceptionHandlers.exceptions;

public class CategoryNotFoundException extends RuntimeException {

    public CategoryNotFoundException(Long id) {
        super("Не можемо знайти категорію з id: " + id);
    }

}
