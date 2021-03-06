package pl.zini.charity.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.zini.charity.DTO.UserRegisterDTO;
import pl.zini.charity.mail.EmailServiceImpl;
import pl.zini.charity.model.Institution;
import pl.zini.charity.model.User;
import pl.zini.charity.service.DonationService;
import pl.zini.charity.service.InstitutionService;
import pl.zini.charity.service.UserService;

import javax.validation.Valid;
import java.util.List;


@Controller
public class HomeController {

    private final InstitutionService institutionService;
    private final DonationService donationService;
    private final UserService userService;

    @Autowired
    private EmailServiceImpl emailService;

    public HomeController(InstitutionService institutionService, DonationService donationService, UserService userService) {
        this.institutionService = institutionService;
        this.donationService = donationService;
        this.userService = userService;
    }

    @ModelAttribute("loggedUser")
    public User loggedUser() {
        String email = SecurityContextHolder.getContext().getAuthentication().getName();
        User user = userService.findUserByEmail(email);
        return user;
    }

    @RequestMapping("/")
    public String homeAction(Model model) {
        List<Institution> institutions = institutionService.findAll();
        model.addAttribute("institutions", institutions);
        Integer nrOfBags = donationService.getNumberOfBags();
        model.addAttribute("nrOfBags", nrOfBags);
        Integer nrOfDonations = donationService.getNumberOfDonations();
        model.addAttribute("nrOfDonations", nrOfDonations);
        return "index";
    }

    @GetMapping("/register")
    public String register(Model model) {
        UserRegisterDTO user = new UserRegisterDTO();
        model.addAttribute("user",user);
        return "register";
    }

    @PostMapping("/register")
    public String register(@Valid UserRegisterDTO user, BindingResult result) {
        if (result.hasErrors()) {
            return "register";
        }
        userService.save(user);
        return "redirect:/login";
    }

    @PostMapping("/sendEmail")
    public String sendEmail(@RequestParam String name, @RequestParam String email, @RequestParam String message) {

        emailService.sendSimpleMessage(email, name, message);
        return "redirect:/";
    }
}
