package com.naukma.helppeople.entity;

import lombok.*;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Entity
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Table(name = "help_requests")
public class HelpRequest {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false, unique = true)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "admin_id", referencedColumnName = "id")
    private User admin;

    @NotNull
    @ManyToOne
    @JoinColumn(name = "client_id", nullable = false, referencedColumnName = "id")
    private User client;

    @Size(max = 255)
    @Column(name = "admin_comment", length = 255)
    private String adminComment;

    @Size(max = 255)
    @Column(name = "client_comment", length = 255)
    private String clientComment;

    @Column(name = "date_closed")
    private LocalDate dateClosed;

    @NotNull
    @Column(name = "date_create", nullable = false)
    private LocalDate dateCreate;

    @NotBlank
    @Size(max = 255)
    @Pattern(regexp = "OPEN|IN_PROGRESS|CLOSED")
    private String status = "OPEN";

    @OneToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JoinColumn(name = "request_id")
    private List<HelpRequestLine> requestLinesList = new ArrayList<>();

}
