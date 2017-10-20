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
@Table(name="sort")
public class Sort {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer sorid;
	private String sorname;
	private String sorimg;
	
	@OneToMany(mappedBy="sort")
	@JsonIgnore
	private Set<Csort> csorts=new HashSet<Csort>();
	
	
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
	
	

	public Set<Csort> getCsorts() {
		return csorts;
	}

	public void setCsorts(Set<Csort> csorts) {
		this.csorts = csorts;
	}

	@Override
	public String toString() {
		return "Sort [sorid=" + sorid + ", sorname=" + sorname + ", sorimg=" + sorimg  +"csorts"+ "]";
	}

	

	
}
