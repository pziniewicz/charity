package pl.zini.charity.service;

import org.springframework.stereotype.Service;
import pl.zini.charity.model.Donation;
import pl.zini.charity.repository.DonationRepository;

@Service
public class DonationService {

    private final DonationRepository donationRepository;

    public DonationService(DonationRepository donationRepository) {
        this.donationRepository = donationRepository;
    }

    public Integer getNumberOfBags() {
        return donationRepository.getNumberOfBags();
    }

    public Integer getNumberOfDonations() {
        return donationRepository.getNumberOfDonations();
    }

    public void save(Donation donation) {
        donationRepository.save(donation);
    }
}
