package pl.zini.charity.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;

@Getter
@Setter
@ToString
@Entity
public class Donation {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private Integer quantity;

    @ManyToMany
    private List<Category> categories;

    @ManyToOne
    private Institution institution;

    private String street;

    private String city;

    private String zipcode;

    private LocalDate pickUpDate;

    private LocalTime pickUpTime;

    private String pickUpComment;
}
