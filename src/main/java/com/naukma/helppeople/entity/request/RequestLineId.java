package com.naukma.helppeople.entity.request;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import java.io.Serializable;

@Embeddable
@Getter
@Setter
@ToString
@NoArgsConstructor
public class RequestLineId implements Serializable {

    @Column(name = "product_id", nullable = false)
    private Long productId;

    @Column(name = "request_id", nullable = false)
    private Long requestId;

}
