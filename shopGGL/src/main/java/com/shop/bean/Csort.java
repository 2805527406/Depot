package com.shop.bean;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name="csort")
public class Csort {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer csorid;
	private String csorname;
	private String csorimg;
	
	
	@Column(insertable=false,updatable=false)
	private Integer sid;
	@ManyToOne
	@JoinColumn(name="sid")
	private Sort sort;
	
	@OneToMany(mappedBy="csort")
	@JsonIgnore
	private Set<Product> products=new HashSet<Product>();

	@Column(insertable=false,updatable=false)
	private Integer enid;
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="enid")
	private Entry en;
	
	
	public Integer getCsorid() {
		return csorid;
	}


	public void setCsorid(Integer csorid) {
		this.csorid = csorid;
	}


	public String getCsorname() {
		return csorname;
	}


	public void setCsorname(String csorname) {
		this.csorname = csorname;
	}


	public String getCsorimg() {
		return csorimg;
	}


	public void setCsorimg(String csorimg) {
		this.csorimg = csorimg;
	}


	



	public Integer getSid() {
		return sid;
	}


	public void setSid(Integer sid) {
		this.sid = sid;
	}


	public Sort getSort() {
		return sort;
	}


	public void setSort(Sort sort) {
		this.sort = sort;
	}


	public Set<Product> getProducts() {
		return products;
	}


	public void setProducts(Set<Product> products) {
		this.products = products;
	}


	public Integer getEnid() {
		return enid;
	}


	public void setEnid(Integer enid) {
		this.enid = enid;
	}


	public Entry getEn() {
		return en;
	}


	public void setEn(Entry en) {
		this.en = en;
	}


	@Override
	public String toString() {
		return "Csort [csorid=" + csorid + ", csorname=" + csorname + ", csorimg=" + csorimg 
				+ ", products=" + products + ", enid=" + enid + ", en=" + en + "]";
	}
	
	
}
