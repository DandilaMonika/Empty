package com.klef.jfsd.fws.controller;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.fws.model.Donor;
import com.klef.jfsd.fws.model.FoodDonation;
import com.klef.jfsd.fws.service.DonorService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class DonorController {

    @Autowired
    private DonorService donorService;

    // Home Page
    @GetMapping("/")
    public ModelAndView home() {
        return new ModelAndView("home");
    }

    // Registration Page
    @GetMapping("/donor-register")
    public ModelAndView donorRegister() {
        return new ModelAndView("donor-register");
    }

    // Registration Handler
    @PostMapping("/registerDonor")
    public ModelAndView registerDonor(HttpServletRequest request) {
        Donor donor = new Donor();
        donor.setName(request.getParameter("name"));
        donor.setGender(request.getParameter("gender"));
        donor.setEmail(request.getParameter("email"));
        donor.setPassword(request.getParameter("password"));
        donor.setAddress(request.getParameter("address"));
        donor.setContactNo(request.getParameter("contactNo"));

        String message = donorService.registerDonor(donor);
        return new ModelAndView("registration-success", "message", message);
    }

    // Login Page
    @GetMapping("/donor-login")
    public ModelAndView donorLogin() {
        return new ModelAndView("donor-login");
    }

    // Login Handler
    @PostMapping("/loginDonor")
    public ModelAndView loginDonor(HttpServletRequest request) {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Donor donor = donorService.checkDonorLogin(email, password);
        ModelAndView mv = new ModelAndView();

        if (donor != null) {
            HttpSession session = request.getSession();
            session.setAttribute("donor", donor);
            mv.setViewName("add-food-donation");
            mv.addObject("donorName", donor.getName());
        } else {
            mv.setViewName("donor-login");
            mv.addObject("message", "Login Failed");
        }
        return mv;
    }

    // Logout Handler
    @GetMapping("/donor-logout")
    public ModelAndView logoutDonor(HttpServletRequest request) {
        HttpSession session = request.getSession();
        session.invalidate(); // Invalidate the session
        return new ModelAndView("donor-login", "message", "Successfully logged out");
    }

    // Donor Profile Page
    @GetMapping("/donor-profile")
    public ModelAndView donorProfile(HttpServletRequest request) {
        HttpSession session = request.getSession();
        Donor donor = (Donor) session.getAttribute("donor");
        if (donor == null) {
            return new ModelAndView("donor-login", "message", "Session expired. Please log in again.");
        }
        return new ModelAndView("donor-profile", "donor", donor);
    }

    // Update Donor Profile Handler
    @PostMapping("/updateDonorProfile")
    public ModelAndView updateDonorProfile(HttpServletRequest request) {
        HttpSession session = request.getSession();
        Donor donor = (Donor) session.getAttribute("donor");
        if (donor == null) {
            return new ModelAndView("donor-login", "message", "Session expired. Please log in again.");
        }

        donor.setName(request.getParameter("name"));
        donor.setEmail(request.getParameter("email"));
        donor.setPassword(request.getParameter("password")); // Consider hashing this password in production!
        donor.setAddress(request.getParameter("address"));
        donor.setContactNo(request.getParameter("contactNo"));

        String message = donorService.updateDonorProfile(donor);
        return new ModelAndView("profile-update-success", "message", message);
    }

    // Add Food Donation Page
    @GetMapping("/add-food-donation")
    public ModelAndView addFoodDonationPage(HttpServletRequest request) {
        HttpSession session = request.getSession();
        Donor donor = (Donor) session.getAttribute("donor");
        if (donor == null) {
            return new ModelAndView("donor-login", "message", "Session expired. Please log in again.");
        }
        return new ModelAndView("add-food-donation");
    }

    // Add Food Donation Handler
    @PostMapping("/submitFoodDonation")
    public ModelAndView submitFoodDonation(HttpServletRequest request) {
        HttpSession session = request.getSession();
        Donor donor = (Donor) session.getAttribute("donor");
        if (donor == null) {
            return new ModelAndView("donor-login", "message", "Session expired. Please log in again.");
        }

        FoodDonation foodDonation = new FoodDonation();
        foodDonation.setDonor(donor);
        foodDonation.setFoodType(request.getParameter("foodType"));
        foodDonation.setQuantity(Integer.parseInt(request.getParameter("quantity")));
        foodDonation.setExpiryDate(LocalDate.parse(request.getParameter("expiryDate")));
        foodDonation.setPickupLocation(request.getParameter("pickupLocation"));
        foodDonation.setStatus("Available");

        String message = donorService.addFoodDonation(foodDonation);
        return new ModelAndView("donation-success", "message", message);
    }

    // View Donor Donations
    @GetMapping("/donor-donations")
    public ModelAndView viewDonorDonations(HttpServletRequest request) {
        HttpSession session = request.getSession();
        Donor donor = (Donor) session.getAttribute("donor");
        if (donor == null) {
            return new ModelAndView("donor-login", "message", "Session expired. Please log in again.");
        }

        List<FoodDonation> donations = donorService.getDonorDonations(donor.getId());
        return new ModelAndView("donor-donations", "donations", donations);
    }
}
