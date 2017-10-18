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
@Table(name="sort")
public class Sort {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer sorid;
	private String sorname;
	private String sorimg;
	@Column(insertable=false,updatable=false)
	private Integer sid;
	@ManyToOne
	@JoinColumn(name="sid")
	private Sort parent_sort;
	
	@OneToMany(mappedBy="sort")
	@JsonIgnore
	private Set<Product> products=new HashSet<Product>();

	@Column(insertable=false,updatable=false)
	private Integer enid;
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="enid")
	private Entry en;
	
	public Integer getSorid() {
		return sorid;
	}

	public void setSorid(Integer sorid) {
		this.sorid = sorid;
	}

	public String getSorname() {
		return sorname;
	}

	public void setSorname(String sorname) {
		this.sorname = sorname;
	}

	public String getSorimg() {
		return sorimg;
	}

	public void setSorimg(String sorimg) {
		this.sorimg = sorimg;
	}

	public Integer getSid() {
		return sid;
	}

	public void setSid(Integer sid) {
		this.sid = sid;
	}

	public Sort getParent_sort() {
		return parent_sort;
	}

	public void setParent_sort(Sort parent_sort) {
		this.parent_sort = parent_sort;
	}

	public Set<Product> getProducts() {
		return products;
	}

	public void setProducts(HashSet<Product> products) {
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
		return "Sort [sorid=" + sorid + ", sorname=" + sorname + ", sorimg=" + sorimg + ", sid=" + sid
				+ ", parent_sort=" + parent_sort + ", products=" + products + "]";
	}
	
	
}
