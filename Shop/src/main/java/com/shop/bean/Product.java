package com.shop.bean;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="product")
public class Product {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer proid;
	private String proname;
	private Integer salecount;
	private String image;
	private Float price;
	private String decript;
	
	@Column(insertable=false,updatable=false)
	private Integer sorid;
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="sorid")
	private Sort sort;
	
	
	
	public Integer getProid() {
		return proid;
	}
	public void setProid(Integer proid) {
		this.proid = proid;
	}
	public String getProname() {
		return proname;
	}
	public void setProname(String proname) {
		this.proname = proname;
	}
	public Integer getSalecount() {
		return salecount;
	}
	public void setSalecount(Integer salecount) {
		this.salecount = salecount;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public Float getPrice() {
		return price;
	}
	public void setPrice(Float price) {
		this.price = price;
	}
	public String getDecript() {
		return decript;
	}
	public void setDecript(String decript) {
		this.decript = decript;
	}
	public Integer getSorid() {
		return sorid;
	}
	public void setSorid(Integer sorid) {
		this.sorid = sorid;
	}
	public Sort getSort() {
		return sort;
	}
	public void setSort(Sort sort) {
		this.sort = sort;
	}
	
	
	@Override
	public String toString() {
		return "Product [proid=" + proid + ", proname=" + proname + ", salecount=" + salecount + ", image=" + image
				+ ", price=" + price + ", decript=" + decript + ", sorid=" + sorid + "]";
	}
	
	
}
