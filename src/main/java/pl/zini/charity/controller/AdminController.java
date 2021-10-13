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
@RequestMapping("/admin")
public class AdminController {

    private final UserService userService;
    private final InstitutionService institutionService;

    public AdminController(UserService userService, InstitutionService institutionService) {
        this.userService = userService;
        this.institutionService = institutionService;
    }

    @ModelAttribute("loggedUser")
    public User loggedUser() {
        String email = SecurityContextHolder.getContext().getAuthentication().getName();
        User user = userService.findUserByEmail(email);
        return user;
    }

    @RequestMapping("/users")
    public String getAllUsers(Model model) {
        List<User> users = userService.findAll();
        model.addAttribute("users", users);
        return "admin/userList";
    }

    @GetMapping("/users/create")
    public String createOrUpdateUser(Long id, Model model) {
        User user;
        if (id != null) {
            user = userService.getById(id);
        } else {
            user = new User();
        }
        model.addAttribute(user);
        return "admin/userCreate";
    }

    @PostMapping("/users/create")
    public String createOrUpdateUser(@Valid User user, BindingResult result) {
        if (result.hasErrors()) {
            return "admin/userCreate";
        }
        userService.save(user);
        return "redirect:/admin/users/";
    }

    @GetMapping("/users/delete/{id}")
    public String deleteUser(@PathVariable String id) {
        User user = userService.getById(Long.parseLong(id));
        userService.delete(user);
        return "redirect:/admin/users/";
    }

    @RequestMapping("/institutions")
    public String getAllInstitutions(Model model) {
        List<Institution> institutions = institutionService.findAll();
        model.addAttribute("institutions", institutions);
        return "admin/institutionsList";
    }

    @GetMapping("/institutions/create")
    public String createOrUpdateInstitution(Long id, Model model) {
        Institution institution;
        if (id != null) {
            institution = institutionService.getById(id);
        } else {
            institution = new Institution();
        }
        model.addAttribute(institution);
        return "admin/createInstitution";
    }

    @PostMapping("/institutions/create")
    public String createOrUpdateInstitution(@Valid Institution institution, BindingResult result) {
        if (result.hasErrors()) {
            return "admin/createInstitution";
        }
        institutionService.save(institution);
        return "redirect:/admin/institutions/";
    }

    @GetMapping("/institutions/delete/{id}")
    public String deleteInstitution(@PathVariable String id) {
        Institution institution = institutionService.getById(Long.parseLong(id));
        institutionService.delete(institution);
        return "redirect:/admin/institutions/";
    }

}
