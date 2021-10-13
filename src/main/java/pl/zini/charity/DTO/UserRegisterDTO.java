package pl.zini.charity.DTO;

import lombok.Data;

@Data
public class UserRegisterDTO {

    private Long id;
    private String firstName;
    private String lastName;
    private String password;
    private String email;
}
