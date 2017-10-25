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
	
	@OneToMany(mappedBy="parent_csort",fetch=FetchType.EAGER)
	@JsonIgnore
	private Set<Sort_2> sort2s=new HashSet<Sort_2>();

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

	public Set<Sort_2> getSort2s() {
		return sort2s;
	}

	public void setSort2s(Set<Sort_2> sort2s) {
		this.sort2s = sort2s;
	}

	@Override
	public String toString() {
		return "Csort [csorid=" + csorid + ", csorname=" + csorname + ", csorimg=" + csorimg + ", sid=" + sid
				+ ", sort=" + sort + ", sort2s=" + "]";
	}
	
	
	
	

	

	


	



	


	
	
	
}
