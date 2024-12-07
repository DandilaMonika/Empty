package com.klef.jfsd.fws.model;

import java.time.LocalDate;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;


@Entity
@Table(name="food_donation")
public class FoodDonation {
	   @Id
	    @GeneratedValue(strategy = GenerationType.IDENTITY)
	    @Column(name = "donation_id")
	    private int donationId;

	    @ManyToOne
	    @JoinColumn(name = "donor_id", nullable = false)
	    private Donor donor;

	    @Column(name = "food_type", nullable = false, length = 30)
	    private String foodType;

	    @Column(name = "quantity", nullable = false)
	    private int quantity;  // Quantity in kilograms or relevant unit

	    @Column(name = "expiry_date", nullable = false)
	    private LocalDate expiryDate;

	    @Column(name = "pickup_location", nullable = false)
	    private String pickupLocation;

	    @Column(name = "status", nullable = false, length = 20)
	    private String status;  // e.g., "Available", "Donated"

	    // Default Constructor
	    public FoodDonation() {}

	    // Getters and Setters
	    public int getDonationId() {
	        return donationId;
	    }

	    public void setDonationId(int donationId) {
	        this.donationId = donationId;
	    }

	    public Donor getDonor() {
	        return donor;
	    }

	    public void setDonor(Donor donor) {
	        this.donor = donor;
	    }

	    public String getFoodType() {
	        return foodType;
	    }

	    public void setFoodType(String foodType) {
	        this.foodType = foodType;
	    }

	    public int getQuantity() {
	        return quantity;
	    }

	    public void setQuantity(int quantity) {
	        this.quantity = quantity;
	    }

	    public LocalDate getExpiryDate() {
	        return expiryDate;
	    }

	    public void setExpiryDate(LocalDate expiryDate) {
	        this.expiryDate = expiryDate;
	    }

	    public String getPickupLocation() {
	        return pickupLocation;
	    }

	    public void setPickupLocation(String pickupLocation) {
	        this.pickupLocation = pickupLocation;
	    }

	    public String getStatus() {
	        return status;
	    }

	    public void setStatus(String status) {
	        this.status = status;
	    }
	}


