package pl.zini.charity.DTO;

import lombok.Data;

@Data
public class UserEditDTO {

    private Long id;
    private String firstName;
    private String lastName;
    private String email;

}
