package pl.zini.charity.controller;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.zini.charity.model.Category;
import pl.zini.charity.model.Donation;
import pl.zini.charity.model.Institution;
import pl.zini.charity.model.User;
import pl.zini.charity.repository.UserRepository;
import pl.zini.charity.service.CategoryService;
import pl.zini.charity.service.DonationService;
import pl.zini.charity.service.InstitutionService;
import pl.zini.charity.service.UserService;

import java.util.List;

@Controller
@RequestMapping("/user/donation")
public class DonationController {

    private final DonationService donationService;
    private final InstitutionService institutionService;
    private final CategoryService categoryService;
    private final UserService userService;

    public DonationController(DonationService donationService, InstitutionService institutionService, CategoryService categoryService, UserService userService) {
        this.donationService = donationService;
        this.institutionService = institutionService;
        this.categoryService = categoryService;
        this.userService = userService;
    }

    @ModelAttribute("donation")
    public Donation donation() {
        return new Donation();
    }

    @ModelAttribute("institutions")
    public List<Institution> institutions() {
        return institutionService.findAll();
    }

    @ModelAttribute("categories")
    public List<Category> categories() {
        return categoryService.findAll();
    }

    @ModelAttribute("loggedUser")
    public User loggedUser() {
        String email = SecurityContextHolder.getContext().getAuthentication().getName();
        User user = userService.findUserByEmail(email);
        return user;
    }

    @GetMapping
    public String addDonation() {
        return "user/form";
    }

    @PostMapping
    public String addDonation(@ModelAttribute("donation") Donation donation, BindingResult result, Model model) {
        if (result.hasErrors()) {
            return "user/form";
        }
        donationService.save(donation);
        return "user/form-confirmation";
    }


}
