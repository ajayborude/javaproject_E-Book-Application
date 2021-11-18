package com.entities;

public class UserDetails {
	
	private int id;
	private String name , phone , email , password , prifle_picture;
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
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
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
	public String getPrifle_picture() {
		return prifle_picture;
	}
	public void setPrifle_picture(String prifle_picture) {
		this.prifle_picture = prifle_picture;
	}
}
