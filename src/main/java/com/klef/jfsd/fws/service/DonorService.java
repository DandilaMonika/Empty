package com.klef.jfsd.fws.service;

import java.util.List;

import com.klef.jfsd.fws.model.Donor;
import com.klef.jfsd.fws.model.FoodDonation;

public interface DonorService {

    String registerDonor(Donor donor);

    Donor checkDonorLogin(String email, String password);

    String updateDonorProfile(Donor donor);

    Donor getDonorById(int donorId);

    List<FoodDonation> getDonorDonations(int donorId);

    String addFoodDonation(FoodDonation foodDonation);
}
