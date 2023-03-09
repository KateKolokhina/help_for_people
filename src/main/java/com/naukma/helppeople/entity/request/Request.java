package com.naukma.helppeople.entity.request;

import com.naukma.helppeople.entity.User;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import javax.validation.constraints.Pattern;
import java.io.Serializable;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Entity
@Getter
@Setter
@NoArgsConstructor
@Table(name = "help_request")
public class Request implements Serializable {

    @Id
    @Column(nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private LocalDate dateCreate;

    private LocalDate dateClosed;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id", nullable = false)
    private User user;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "admin_id")
    private User admin;

    private String comment;

    private String adminComment;


    public String getComment() {
        if (comment == null)
            return "";
        else
            return comment;
    }

    public String getAdminComment() {
        if (adminComment == null)
            return "";
        else
            return adminComment;
    }

    @Column(nullable = false)
    @Pattern(regexp = "OPEN|IN_PROGRESS|CLOSED")
    private String status = "OPEN";

    @OneToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JoinColumn(name = "request_id")
    private List<RequestLine> requestLinesList = new ArrayList<>();

}
