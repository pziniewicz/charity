package pl.zini.charity.model;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.Entity;

@Getter
@Setter
@ToString
@EqualsAndHashCode
@Entity
public class Institution extends BaseClass{

    private String name;
    private String description;
}
