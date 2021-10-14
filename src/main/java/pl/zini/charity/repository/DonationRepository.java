package pl.zini.charity.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import pl.zini.charity.model.Donation;

import java.util.List;

@Repository
public interface DonationRepository extends JpaRepository<Donation, Long> {

    @Query(value = "SELECT sum(quantity) as count FROM donation", nativeQuery = true)
    Integer getNumberOfBags();

    @Query(value = "SELECT count(*) AS count FROM donation", nativeQuery = true)
    Integer getNumberOfDonations();

    @Query(value = "SELECT * FROM donation where user_id= :userId ORDER BY is_picked_up desc, pick_up_date asc", nativeQuery = true)
    List<Donation> findAllByUserId(Long userId);

    Donation getByIdAndUserId(Long id, Long userId);

}
