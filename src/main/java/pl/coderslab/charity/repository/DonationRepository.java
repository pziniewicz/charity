package pl.coderslab.charity.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import pl.coderslab.charity.model.Donation;

@Repository
public interface DonationRepository extends JpaRepository<Donation, Long> {

    @Query(value = "SELECT sum(quantity) as count FROM donation", nativeQuery = true)
    Integer getNumberOfBags();

    @Query(value = "SELECT count(*) AS count FROM donation", nativeQuery = true)
    Integer getNumberOfDonations();

}
