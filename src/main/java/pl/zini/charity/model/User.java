package pl.zini.charity.model;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.Entity;

@Getter
@Setter
@ToString(exclude = "password")
@EqualsAndHashCode(callSuper = true)
@Entity
public class User extends BaseClass{

    private String firstName;
    private String lastName;
    private String password;
    private String email;
    private String role;
    private Boolean enabled;


}
