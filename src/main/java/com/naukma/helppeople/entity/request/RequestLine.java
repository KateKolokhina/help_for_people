package com.naukma.helppeople.entity.request;

import com.naukma.helppeople.entity.Product;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Getter
@Setter
@NoArgsConstructor
@Table(name = "help_request_line")
public class RequestLine implements Serializable {

    @EmbeddedId
    private RequestLineId id;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @MapsId("productId")
    @JoinColumn(name = "product_id")
    private Product product;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @MapsId("requestId")
    @JoinColumn(name = "request_id")
    private Request request;

    @Column(nullable = false)
    private Integer amount = 1;

    @Override
    public String toString() {
        return "RequestLine{" +
                "id=" + id +
                ", product= [" + "id = " + product.getId() + ", name = " + product.getName() + " ]" +
                ", amount=" + amount +
                '}';
    }

    public Long getProductId() {
        return id.getProductId();
    }
}
