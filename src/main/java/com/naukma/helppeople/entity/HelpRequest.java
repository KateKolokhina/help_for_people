package com.naukma.helppeople.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.*;

import java.sql.Date;
import java.util.Set;

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
    private Date dateClosed;

    @NotNull
    @Column(name = "date_create", nullable = false)
    private Date dateCreate;

    @NotBlank
    @Size(max = 255)
    @Column(name = "status", nullable = false, length = 255)
    private String status;
}
