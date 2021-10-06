package pl.zini.charity.model;

import lombok.EqualsAndHashCode;
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
@EqualsAndHashCode(callSuper = true)
@Entity
public class Donation extends BaseClass{

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
