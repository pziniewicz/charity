package pl.zini.charity.controller;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.zini.charity.DTO.UserActiveDTO;
import pl.zini.charity.DTO.UserEditDTO;
import pl.zini.charity.DTO.UserRegisterDTO;
import pl.zini.charity.DTO.UserSwitchRoleDTO;
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
        String email = SecurityContextHolder.getContext()
                .getAuthentication()
                .getName();
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
    public String createOrUpdateUser(Model model) {
        UserRegisterDTO user = new UserRegisterDTO();
        model.addAttribute("user",user);
        return "admin/userCreate";
    }

    @PostMapping("/users/create")
    public String createOrUpdateUser(@Valid UserRegisterDTO user, BindingResult result) {
        if (result.hasErrors()) {
            return "admin/userCreate";
        }
        userService.save(user);
        return "redirect:/admin/users/";
    }

    @GetMapping("/users/edit/{id}")
    public String updateUser(@PathVariable Long id, Model model) {
        UserEditDTO user = userService.getUserToEditById(id);
        model.addAttribute("userEditDTO",user);
        return "user/userUpdate";
    }

    @PostMapping("/users/edit")
    public String updateUser(@Valid @ModelAttribute("userEditDTO") UserEditDTO user, BindingResult result, Model model) {
        if (result.hasErrors()) {
            return "user/userUpdate";
        }
        userService.updateUser(user);
        return "redirect:/admin/users/";
    }

    @GetMapping("/users/delete/{id}")
    public String deleteUser(@PathVariable Long id) {
        if (id != loggedUser().getId()) {
            User user = userService.getById(id);
            userService.delete(user);
        }
        return "redirect:/admin/users/";
    }

    @GetMapping("/users/activate/{id}")
    public String activateUser(@PathVariable Long id) {
        UserActiveDTO user = new UserActiveDTO();
        user.setId(id);
        user.setEnabled(true);
        userService.activate(user);
        return "redirect:/admin/users/";
    }

    @GetMapping("/users/deactivate/{id}")
    public String deactivateUser(@PathVariable Long id) {
        UserActiveDTO user = new UserActiveDTO();
        user.setId(id);
        user.setEnabled(false);
        userService.activate(user);
        return "redirect:/admin/users/";
    }

    @GetMapping("/users/toAdmin/{id}")
    public String changeToAdmin(@PathVariable Long id) {
        UserSwitchRoleDTO user = new UserSwitchRoleDTO();
        user.setId(id);
        user.setRole("ROLE_ADMIN");
        userService.switchRole(user);
        return "redirect:/admin/users/";
    }

    @GetMapping("/users/toUser/{id}")
    public String changeToUser(@PathVariable Long id) {
        UserSwitchRoleDTO user = new UserSwitchRoleDTO();
        user.setId(id);
        user.setRole("ROLE_USER");
        userService.switchRole(user);
        return "redirect:/admin/users/";
    }

//    @GetMapping("/users/toUser/{id}")
//    public String changeToUser(@PathVariable Long id) {
//        User user = userService.getById(id);
//        user.setRole("ROLE_USER");
//        userService.save(user);
//        return "redirect:/admin/users/";
//    }

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
    public String deleteInstitution(@PathVariable Long id) {
        Institution institution = institutionService.getById(id);
        institutionService.delete(institution);
        return "redirect:/admin/institutions/";
    }

}
