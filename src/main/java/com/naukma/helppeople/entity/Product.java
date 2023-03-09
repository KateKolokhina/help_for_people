package com.naukma.helppeople.entity;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import java.io.Serializable;

@Entity
@Data
@NoArgsConstructor
@Table(name = "product")
public class Product implements Serializable {

    @Id
    @Column(nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String name;

    @Column(nullable = false)
    @Pattern(regexp = "F|M|K")
    private String gender;

    @Pattern(regexp = "Autumn|Winter|Spring|Summer")
    private String season;

    @Column(nullable = false)
    private Integer size;

    @Column(nullable = false)
    @NotNull
    @Min(0)
    private Integer totalCount;

    @ManyToOne
    @JoinColumn(name = "category_id", nullable = false)
    private Category category;

    public String getSeasonUa() {
        if (this.season == null) {
            return null;
        }
        switch (this.season) {
            case "Spring":
                return "Весна";
            case "Autumn":
                return "Осінь";
            case "Winter":
                return "Зима";
            case "Summer":
                return "Літо";
        }
        return "";
    }
}
