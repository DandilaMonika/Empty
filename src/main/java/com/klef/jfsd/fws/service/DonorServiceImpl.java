package com.klef.jfsd.fws.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.fws.model.Donor;
import com.klef.jfsd.fws.model.FoodDonation;
import com.klef.jfsd.fws.repository.DonorRepository;

@Service
public class DonorServiceImpl implements DonorService {

    @Autowired
    private DonorRepository donorRepository;

    @Override
    public String registerDonor(Donor donor) {
        donorRepository.save(donor);
        return "Donor Registered Successfully!";
    }

    @Override
    public Donor checkDonorLogin(String email, String password) {
        return donorRepository.checkDonorLogin(email, password);
    }

    @Override
    public String updateDonorProfile(Donor donor) {
        Donor existingDonor = donorRepository.findById(donor.getId())
            .orElseThrow(() -> new RuntimeException("Donor not found"));
        
        // Update fields as needed
        existingDonor.setName(donor.getName());
        existingDonor.setEmail(donor.getEmail());
        existingDonor.setPassword(donor.getPassword());
        // Update other fields as necessary

        donorRepository.save(existingDonor); // Save the updated donor
        return "Donor Profile Updated Successfully!";
    }

    @Override
    public Donor getDonorById(int donorId) {
        return donorRepository.findById(donorId).orElse(null);
    }

    @Override
    public List<FoodDonation> getDonorDonations(int donorId) {
        return donorRepository.findDonationsByDonorId(donorId); 
    }

    @Override
    public String addFoodDonation(FoodDonation foodDonation) {
        donorRepository.save(foodDonation);
        return "Food Donation Added Successfully!";
    }
}
