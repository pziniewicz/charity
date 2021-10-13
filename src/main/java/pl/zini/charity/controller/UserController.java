package pl.zini.charity.controller;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.zini.charity.DTO.UserEditDTO;
import pl.zini.charity.DTO.UserNewPassDTO;
import pl.zini.charity.model.Institution;
import pl.zini.charity.model.User;
import pl.zini.charity.service.InstitutionService;
import pl.zini.charity.service.UserService;

import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {

    private final UserService userService;
    private final InstitutionService institutionService;

    public UserController(UserService userService, InstitutionService institutionService) {
        this.userService = userService;
        this.institutionService = institutionService;
    }

    @ModelAttribute("loggedUser")
    public User loggedUser() {
        String email = SecurityContextHolder.getContext().getAuthentication().getName();
        User user = userService.findUserByEmail(email);
        return user;
    }

    @GetMapping("/")
    public String index(Model model) {
        List<Institution> institutions = institutionService.findAll();
        model.addAttribute("institutions", institutions);
        return "user/index";
    }

    @GetMapping("/edit/{id}")
    public String updateUser(@PathVariable Long id, Model model) {
        if(!userService.hasAuthority(id)) {
            return "accessDenied";
        }
        UserEditDTO user = userService.getUserToEditById(id);
        model.addAttribute("userEditDTO",user);
        return "user/userUpdate";
    }

    @PostMapping("/edit")
    public String updateUser(@Valid @ModelAttribute("userEditDTO") UserEditDTO user, BindingResult result, Model model) {
        if (result.hasErrors()) {
            return "user/userUpdate";
        }
        userService.updateUser(user);
        return "redirect:/";
    }

    @GetMapping("/changePassword/{id}")
    public String changePassUser(@PathVariable Long id, Model model) {
        if(!userService.hasAuthority(id)) {
            return "accessDenied";
        }
        UserNewPassDTO user = userService.getUserToChangePassById(id);
        model.addAttribute("userNewPassDTO",user);
        return "user/userNewPass";
    }

    @PostMapping("/changePassword")
    public String changePassUser(@Valid @ModelAttribute("userNewPassDTO") UserNewPassDTO user, BindingResult result, Model model) {
        if (result.hasErrors()) {
            return "user/userNewPass";
        }
        userService.userNewPass(user);
        return "redirect:/";
    }

}
