package pl.coderslab.charity.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.charity.model.Institution;
import pl.coderslab.charity.service.DonationService;
import pl.coderslab.charity.service.InstitutionService;

import java.util.List;


@Controller
public class HomeController {

    private final InstitutionService institutionService;
    private final DonationService donationService;

    public HomeController(InstitutionService institutionService, DonationService donationService) {
        this.institutionService = institutionService;
        this.donationService = donationService;
    }

    @RequestMapping("/")
    public String homeAction(Model model){
        List<Institution> institutions = institutionService.findAll();
        model.addAttribute("institutions", institutions);
        Integer nrOfBags = donationService.getNumberOfBags();
        model.addAttribute("nrOfBags", nrOfBags);
        Integer nrOfDonations = donationService.getNumberOfDonations();
        model.addAttribute("nrOfDonations", nrOfDonations);
        return "index";
    }
}
