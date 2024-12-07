package com.klef.jfsd.fws.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.fws.model.Donor;
import com.klef.jfsd.fws.model.FoodDonation;

@Repository
public interface DonorRepository extends JpaRepository<Donor, Integer> {

    @Query("SELECT d FROM Donor d WHERE d.email = ?1 AND d.password = ?2")
    Donor checkDonorLogin(String email, String password);

    // Fetch all donations by a specific donor
    @Query("SELECT fd FROM FoodDonation fd WHERE fd.donor.id = ?1")
    List<FoodDonation> findDonationsByDonorId(int donorId);

    // Save Food Donation
    @Modifying
    FoodDonation save(FoodDonation foodDonation);
}
