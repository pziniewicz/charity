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
@RequestMapping("/admin/institution")
public class InstitutionController {

    private final InstitutionService institutionService;
    private final UserService userService;

    public InstitutionController(InstitutionService institutionService, UserService userService) {
        this.institutionService = institutionService;
        this.userService = userService;
    }

    @ModelAttribute("loggedUser")
    public User loggedUser() {
        String email = SecurityContextHolder.getContext().getAuthentication().getName();
        User user = userService.findUserByEmail(email);
        return user;
    }

    @RequestMapping("")
    public String getAll(Model model) {
        List<Institution> institutions = institutionService.findAll();
        model.addAttribute("institutions", institutions);
        return "admin/institutionsList";
    }

    @GetMapping("/create")
    public String create(Long id, Model model) {
        Institution institution;
        if (id != null) {
            institution = institutionService.getById(id);
        } else {
            institution = new Institution();
        }
        model.addAttribute(institution);
        return "admin/createInstitution";
    }

    @PostMapping("/create")
    public String create(@Valid Institution institution, BindingResult result) {
        if (result.hasErrors()) {
            return "admin/createInstitution";
        }
        institutionService.save(institution);
        return "redirect:/admin/institution/";
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable String id) {
        Institution institution = institutionService.getById(Long.parseLong(id));
        institutionService.delete(institution);
        return "redirect:/admin/institution/";
    }


}
