package pl.zini.charity.controller;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.zini.charity.model.Category;
import pl.zini.charity.model.Donation;
import pl.zini.charity.model.Institution;
import pl.zini.charity.model.User;
import pl.zini.charity.repository.UserRepository;
import pl.zini.charity.service.CategoryService;
import pl.zini.charity.service.DonationService;
import pl.zini.charity.service.InstitutionService;
import pl.zini.charity.service.UserService;

import javax.validation.Valid;
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

    @ModelAttribute("institutionList")
    public List<Institution> institutions() {
        return institutionService.findAll();
    }

    @ModelAttribute("categoriesList")
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
    public String addDonation(Model model) {
//        Donation donation = new Donation();
//        model.addAttribute("donation", donation);
        return "user/form";
    }

    @PostMapping
    public String addDonation(@Valid @ModelAttribute("donation") Donation donation, BindingResult result, Model model) {
        if (result.hasErrors()) {
            model.addAttribute("errors");
            return "user/form";
        }
        donation.setIsPickedUp(false);
        donation.setUser(loggedUser());
        donationService.save(donation);
        return "user/formConfirmation";
    }

    @GetMapping("/pass/{id}")
    public String dontaitonPassed(@PathVariable Long id) {
        Donation donation = donationService.getById(id);
        donation.setIsPickedUp(true);
        donationService.save(donation);
        return "redirect:/user/donation/list";
    }

    @RequestMapping("/list")
    public String getAllDonations(Model model) {
        List<Donation> donations = donationService.findAllByUserId(loggedUser().getId());
        model.addAttribute("donations", donations);
        return "user/donationList";
    }

    @RequestMapping("/item/{id}")
    public String getAllDonations(Model model, Long id) {
        Donation donation = donationService.getByIdAndUserId(id, loggedUser().getId());
        model.addAttribute("donation", donation);
        return "user/donation";
    }
}
