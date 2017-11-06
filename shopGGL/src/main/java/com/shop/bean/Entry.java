package com.shop.bean;

import java.util.Date;
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


import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name="entry")
public class Entry {//�����İ��
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer entryid;
	private String orderno;
	private String payment;
	private Float paymoney;
	private Float price;
	private Integer tag;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	@JsonFormat(pattern="yyyy-MM-dd",locale="GTM+8")
	private Date createtime;
	
	@Column(insertable=false,updatable=false)
	private Integer orid;
	@ManyToOne(cascade=CascadeType.ALL,fetch=FetchType.EAGER)
	@JoinColumn(name="orid")
	private Order or;
	
	@OneToMany(mappedBy="en_pro",fetch=FetchType.EAGER)
	
	private Set<Product> pro_en=new HashSet<Product>();
	
	
	public Integer getEntryid() {
		return entryid;
	}

	public void setEntryid(Integer entryid) {
		this.entryid = entryid;
	}

	public Float getPrice() {
		return price;
	}

	public void setPrice(Float price) {
		this.price = price;
	}

	public Date getCreatetime() {
		return createtime;
	}

	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}

	public Order getOr() {
		return or;
	}

	public void setOr(Order or) {
		this.or = or;
	}
	public Integer getOrid() {
		return orid;
	}

	public void setOrid(Integer orid) {
		this.orid = orid;
	}
	
	



	

	public String getOrderno() {
		return orderno;
	}

	public void setOrderno(String orderno) {
		this.orderno = orderno;
	}

	public String getPayment() {
		return payment;
	}

	public void setPayment(String payment) {
		this.payment = payment;
	}

	public Float getPaymoney() {
		return paymoney;
	}

	public void setPaymoney(Float paymoney) {
		this.paymoney = paymoney;
	}

	public Integer getTag() {
		return tag;
	}

	public void setTag(Integer tag) {
		this.tag = tag;
	}
	
	public Set<Product> getPro_en() {
		return pro_en;
	}

	public void setPro_en(Set<Product> pro_en) {
		this.pro_en = pro_en;
	}

	@Override
	public String toString() {
		return "Entry [entryid=" + entryid + ", payment=" + payment + ", paymoney=" + paymoney + ", price=" + price
				+ ", tag=" + tag + ", createtime=" + createtime + ", orid=" + orid 
				+ "pro_en="+pro_en+ "]";
	}

	


	
	
}
