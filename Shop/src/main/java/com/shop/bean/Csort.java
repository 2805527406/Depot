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
	private Integer csid;
	@ManyToOne
	@JoinColumn(name="csid")
	private Sort parent_sort;
	
	@OneToMany(mappedBy="csort")
	@JsonIgnore
	private Set<Product> products=new HashSet<Product>();

	@Column(insertable=false,updatable=false)
	private Integer enid;
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="enid")
	private Entry en;
}
