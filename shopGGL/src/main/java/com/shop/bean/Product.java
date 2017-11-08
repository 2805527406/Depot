package com.shop.bean;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name="product")
public class Product {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer proid;
	private String proname;
	private Integer salecount;//购买的数量
	@Column(length=20000)
	private String image;
	private Float price;
	private String decript;
	private Integer count;
	public Integer getCount() {
		return count;
	}
	public void setCount(Integer count) {
		this.count = count;
	}
	@Column(insertable=false,updatable=false)
	private Integer csorid;
	@ManyToOne(cascade={CascadeType.PERSIST,CascadeType.MERGE})
	@JoinColumn(name="csorid")
	private Sort_2 csort;
	
	@Column(insertable=false,updatable=false)
	private Integer grid;
	@ManyToOne(cascade={CascadeType.PERSIST,CascadeType.MERGE})
	@JoinColumn(name="grid")
	private Grou grou;
	
	@ManyToMany(fetch=FetchType.EAGER)
	@JoinTable(name="pro_ent",joinColumns=@JoinColumn(name="pid"),inverseJoinColumns=@JoinColumn(name="eid"))
	@JsonIgnore
	private Set<Entry> entrys=new HashSet<Entry>();
	
	
	
	public Set<Entry> getEntrys() {
		return entrys;
	}
	public void setEntrys(Set<Entry> entrys) {
		this.entrys = entrys;
	}
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
	
	
	public Integer getCsorid() {
		return csorid;
	}
	public void setCsorid(Integer csorid) {
		this.csorid = csorid;
	}
	public Sort_2 getCsort() {
		return csort;
	}
	public void setCsort(Sort_2 csort) {
		this.csort = csort;
	}
	
	
	public Integer getGrid() {
		return grid;
	}
	public void setGrid(Integer grid) {
		this.grid = grid;
	}
	public Grou getGrou() {
		return grou;
	}
	public void setGrou(Grou grou) {
		this.grou = grou;
	}
	@Override
	public String toString() {
		return "Product [proid=" + proid + ", proname=" + proname + ", salecount=" + salecount + ", image=" + image
				+ ", price=" + price + ", decript=" + decript + ", csorid=" + csorid + ", csort=" + csort + ", grid="
				+ grid + ", grou=" + grou + "]";
	}
	
	
	
}
