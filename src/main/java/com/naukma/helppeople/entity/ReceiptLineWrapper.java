package com.naukma.helppeople.entity;


import com.naukma.helppeople.entity.dto.RequestLineDTO;
import lombok.extern.log4j.Log4j2;

import java.util.ArrayList;

@Log4j2
public class ReceiptLineWrapper {

    private ArrayList<RequestLineDTO> properties;

    public ReceiptLineWrapper() {
    }

    public ArrayList<RequestLineDTO> getProperties() {
        if (this.properties == null) {
            this.properties = new ArrayList<RequestLineDTO>();
        }
        return properties;
    }

    public void setProperties(ArrayList<RequestLineDTO> properties) {
        this.properties = properties;
    }

    public void newProperty(
            Long id,
            String gender,
            String category,
            String season,
            Integer size,
            Integer amount,
            Integer allowed) {

        RequestLineDTO newPr = new RequestLineDTO(id, gender,
                category, season, size, amount, allowed);
        this.getProperties().add(newPr);
    }

    public void printAll() {
        for (RequestLineDTO p : getProperties()) {
            log.info(p.toString());
        }
    }
}
