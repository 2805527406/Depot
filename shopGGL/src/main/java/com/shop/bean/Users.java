package com.shop.bean;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name="users")
public class Users {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer userid;
	private String username;
	private String password;
	private String realname;
	private String phone;
	private String address;
	private String img;
	private String zip;
	private String role;
	private String userlean;
	@OneToMany(mappedBy="users",cascade=CascadeType.ALL)
	@JsonIgnore
	private Set<Order> orders=new HashSet<Order>();
	public Integer getUserid() {
		return userid;
	}
	public void setUserid(Integer userid) {
		this.userid = userid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getRealname() {
		return realname;
	}
	public void setRealname(String realname) {
		this.realname = realname;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getZip() {
		return zip;
	}
	public void setZip(String zip) {
		this.zip = zip;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getUserlean() {
		return userlean;
	}
	public void setUserlean(String userlean) {
		this.userlean = userlean;
	}
	public Set<Order> getOrders() {
		return orders;
	}
	public void setOrders(HashSet<Order> orders) {
		this.orders = orders;
	}
	@Override
	public String toString() {
		return "Users [userid=" + userid + ", username=" + username + ", password=" + password + ", realname="
				+ realname + ", phone=" + phone + ", address=" + address + ", img=" + img + ", zip=" + zip + ", role="
				+ role + ", userlean=" + userlean + ", orders=" + orders + "]";
	}
	
}
