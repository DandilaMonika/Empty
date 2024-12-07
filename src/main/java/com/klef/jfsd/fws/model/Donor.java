package com.klef.jfsd.fws.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "donor_table")
public class Donor {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="donor_id")
    private int id;

    @Column(name="donor_name", nullable=false, length=50)
    private String name;

    @Column(name="donor_gender", nullable=false, length=10)
    private String gender;

    @Column(name="donor_email", nullable=false, unique=true, length=30)
    private String email;

    @Column(name="donor_password", nullable=false, length=30)
    private String password;

    @Column(name="donor_address", nullable=false)
    private String address;

    @Column(name="donor_contact_no", nullable=false, unique=true)
    private String contactNo;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getContactNo() {
		return contactNo;
	}

	public void setContactNo(String contactNo) {
		this.contactNo = contactNo;
	}

	@Override
	public String toString() {
		return "Donor [id=" + id + ", name=" + name + ", gender=" + gender + ", email=" + email + ", password="
				+ password + ", address=" + address + ", contactNo=" + contactNo + "]";
	}

}
