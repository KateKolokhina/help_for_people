package com.naukma.helppeople.exceptionHandlers.exceptions;

import java.util.List;

public class CloseRequestException extends RuntimeException {
    public CloseRequestException(List<String> invalidParams) {
        super(buildResult(invalidParams));
    }

    private static String buildResult(List<String> invalidParams) {
        StringBuilder sb = new StringBuilder("Виникли проблеми при списанні цих товарів : \n");
        for (String elem : invalidParams) {
            sb.append(elem).append(" \n ");
        }
        return sb.toString();
    }

}
