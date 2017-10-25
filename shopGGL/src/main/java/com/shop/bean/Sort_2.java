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
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name="sort2")
public class Sort_2 {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer s2id;
	private String s2name;
	
	@Column(insertable=false,updatable=false)
	private Integer csid;
	@ManyToOne(cascade=CascadeType.ALL,fetch=FetchType.EAGER)
	@JoinColumn(name="csid")
	private Csort parent_csort;
	
	@OneToMany(mappedBy="csort",fetch=FetchType.EAGER)
	@JsonIgnore
	private Set<Product> products=new HashSet<Product>();
	
	
	public Integer getS2id() {
		return s2id;
	}

	public void setS2id(Integer s2id) {
		this.s2id = s2id;
	}

	public String getS2name() {
		return s2name;
	}

	public void setS2name(String s2name) {
		this.s2name = s2name;
	}

	public Integer getCsid() {
		return csid;
	}

	public void setCsid(Integer csid) {
		this.csid = csid;
	}

	public Csort getParent_csort() {
		return parent_csort;
	}

	public void setParent_csort(Csort parent_csort) {
		this.parent_csort = parent_csort;
	}

	public Set<Product> getProducts() {
		return products;
	}

	public void setProducts(Set<Product> products) {
		this.products = products;
	}
//	@Column(insertable=false,updatable=false)
//	private Integer enid;
//	@ManyToOne(cascade=CascadeType.ALL)
//	@JoinColumn(name="enid")
//	private Entry en;
//	public Integer getEnid() {
//		return enid;
//	}
//
//
//	public void setEnid(Integer enid) {
//		this.enid = enid;
//	}
//
//
//	public Entry getEn() {
//		return en;
//	}
//
//
//	public void setEn(Entry en) {
//		this.en = en;
//	}

	@Override
	public String toString() {
		return "Sort_2 [s2id=" + s2id + ", s2name=" + s2name + ", csid=" + csid + ", parent_csort=" + parent_csort
				+ "]";
	}
	
	
	
}
