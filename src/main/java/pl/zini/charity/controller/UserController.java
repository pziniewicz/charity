package pl.zini.charity.controller;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.zini.charity.model.Institution;
import pl.zini.charity.model.User;
import pl.zini.charity.service.InstitutionService;
import pl.zini.charity.service.UserService;

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

    @GetMapping("")
    public String index(Model model) {
        List<Institution> institutions = institutionService.findAll();
        model.addAttribute("institutions", institutions);
        return "user/index";
    }

//    @GetMapping(value = "/edit", produces = "text/plain;charset=UTF-8")
//    public String edit(Long id, Model model) {
////        model.addAttribute("user",loggedUser());
//        return "user/edit";
//    }
//
//    @PostMapping(value = "/edit", produces = "text/plain;charset=UTF-8")
//    public String create(@Valid User loggedUser, BindingResult result) {
//        if (result.hasErrors()) {
//            return "user/edit";
//        }
//        userService.save(loggedUser);
//        return "redirect:/user";
//    }
}
