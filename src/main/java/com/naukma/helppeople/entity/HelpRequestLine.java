package com.naukma.helppeople.entity;

import lombok.*;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.PositiveOrZero;


@Entity
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Table(name = "help_request_lines")
public class HelpRequestLine {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false, unique = true)
    private Long id;

    @NotNull
    @ManyToOne
    @JoinColumn(name = "product_id", nullable = false, referencedColumnName = "id")
    private Product product;

    @NotNull
    @ManyToOne
    @JoinColumn(name = "help_request_id", nullable = false, referencedColumnName = "id")
    private HelpRequest helpRequest;

    @NotNull
    @PositiveOrZero
    @Column(name = "total_count", nullable = false)
    private Integer amount;
}
