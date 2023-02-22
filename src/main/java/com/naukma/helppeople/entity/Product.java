package com.naukma.helppeople.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.*;
import lombok.*;

import java.io.Serializable;
import java.util.Set;

@Entity
@Data
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Table(name = "products")
public class Product implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false, unique = true)
    private Long id;

    @NotNull
    @ManyToOne
    @JoinColumn(name = "category_id", nullable = false, referencedColumnName = "id")
    private Category category;

    @NotBlank
    @Size(max = 255)
    @Column(name = "gender", nullable = false, length = 255)
    private String gender;

    @NotBlank
    @Size(max = 255)
    @Column(name = "name", nullable = false, length = 255)
    private String name;

    @Size(max = 255)
    @Column(name = "season", length = 255)
    private String season;

    @NotNull
    @Positive
    @Column(name = "size", nullable = false)
    private Integer size;

    @NotNull
    @PositiveOrZero
    @Column(name = "total_count", nullable = false)
    private Integer totalCount;
}
