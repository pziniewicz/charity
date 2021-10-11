package pl.zini.charity.controller;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.zini.charity.model.Institution;
import pl.zini.charity.model.User;
import pl.zini.charity.service.InstitutionService;
import pl.zini.charity.service.UserService;

import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("")
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

    @GetMapping("/user")
    public String index(Model model) {
        List<Institution> institutions = institutionService.findAll();
        model.addAttribute("institutions", institutions);
        return "user/index";
    }

    @RequestMapping("/admin/users")
    public String getAll(Model model) {
        List<User> users = userService.findAll();
        model.addAttribute("users", users);
        return "admin/userList";
    }

    @GetMapping("/admin/user/create")
    public String create(Long id, Model model) {
        User user;
        if (id != null) {
            user = userService.getById(id);
        } else {
            user = new User();
        }
        model.addAttribute(user);
        return "admin/userCreate";
    }

    @PostMapping("/admin/user/create")
    public String create(@Valid User user, BindingResult result) {
        if (result.hasErrors()) {
            return "admin/userCreate";
        }
        userService.save(user);
        return "redirect:/admin/user/";
    }

    @GetMapping("/admin/user/delete/{id}")
    public String delete(@PathVariable String id) {
        User user = userService.getById(Long.parseLong(id));
        userService.delete(user);
        return "redirect:/admin/users/";
    }


}
