 package com.sports.model;

import java.beans.Transient;
import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name = "users")
public class UserLogin implements Serializable {
	
	private static final long serialVersionUID = -7988799579036200037L;	
	
	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;
	
	private String roles;	
	@NotEmpty
	@Pattern(regexp = "([a-zA-Z0-9]+([ ][a-zA-Z0-9])*)+",message="Last Name Required ")
	private String lname;
	//@NotEmpty(message = "First name cannot be empty")
	@Pattern(regexp = "([a-zA-Z0-9]+([ ][a-zA-Z0-9])*)+",message="First Name Required")
    private String fname;
	
	@Min(value = 10 , message="You must be between {value} and 30")
    @Max(value = 30, message="Age must be between 10 and {value}")
	private int age; 
	
	@Pattern(regexp = "([a-zA-Z0-9]+([ ][a-zA-Z0-9])*)+",message="Address required")
	//@NotEmpty(message = "Address required")
    private String address;
    @NotEmpty(message = "City required")
    private String city;
    @Pattern(regexp = "([a-zA-Z0-9]+([ ][a-zA-Z0-9])*)+",message="Please select State")
    private String state;     
    
    private long zip;
    
    private long tel;
    
    private long card;
    
    private String website;
    
    
    
    public String getWebsite() {
		return website;
	}
	public void setWebsite(String website) {
		this.website = website;
	}
	@Column(updatable=false)
   // @NotEmpty(message = "User name cannot be empty")
    @Pattern(regexp = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$",message="Invalid Email Use format JohnSmith@sbc.com")
	private String emailAddress;
   // @NotEmpty(message = "Password name cannot be empty")
    @Size(min=8, max=15,message="The length must be between {min} and {max}")
	private String password;
    
    @NotEmpty(message = "Please re-enter password ")
	private String passwordConfirm;
    @Pattern(regexp = "([a-zA-Z0-9]+([ ][a-zA-Z0-9])*)+",message="Please select subscription")
    private String subscription;
	
    @Size(min=5, max=150,message="Biograpthy Must be between {min} and {max}")
	private String background;

	private String selectClub;
	
	private String selectCamp;
	
	
	public String getSelectCamp() {
		return selectCamp;
	}
	public void setSelectCamp(String selectCamp) {
		this.selectCamp = selectCamp;
	}
	public String getBackground() {
		return background;
	}
	public void setBackground(String background) {
		this.background = background;
	}
	public String getSubscription() {
		return subscription;
	}
	public void setSubscription(String subscription) {
		this.subscription = subscription;
	}
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getRoles() {
		return roles;
	}
	public void setRoles(String roles) {
		this.roles = roles;
	}
	public String getLname() {
		return lname;
	}
	public void setLname(String lname) {
		this.lname = lname;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public long getZip() {
		return zip;
	}
	public void setZip(long zip) {
		this.zip = zip;
	}
	public long getTel() {
		return tel;
	}
	public void setTel(long tel) {
		this.tel = tel;
	}
	public long getCard() {
		return card;
	}
	public void setCard(long card) {
		this.card = card;
	}
	public String getEmailAddress() {
		return emailAddress;
	}
	public void setEmailAddress(String emailAddress) {
		this.emailAddress = emailAddress;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	@Transient
	public String getPasswordConfirm() {
		return passwordConfirm;
	}
	public void setPasswordConfirm(String passwordConfirm) {
		this.passwordConfirm = passwordConfirm;
	}
	public String getSelectClub() {
		return selectClub;
	}	 
	public void setSelectClub(String selectClub) {
		this.selectClub = selectClub;
		
	}
	
	

}
