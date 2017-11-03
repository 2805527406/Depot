package com.shop.bean;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

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
@Table(name="orders")
public class Order {//�ջ���ַ
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer orderid;
	private String orderno;
	private String sendname;
	private String sendaddress;
	private String sendphone;
	private String zip;
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	@JsonFormat(pattern="yyyy-MM-dd",locale="GTM+8")
	private Date time;
	
	@Column(insertable=false,updatable=false)
	private Integer userid;
	@ManyToOne
	@JoinColumn(name="userid")
	private Users users;
	
	@OneToMany(mappedBy="or",fetch=FetchType.EAGER)
	@JsonIgnore
	private Set<Entry> entry=new HashSet<Entry>();

	public Integer getOrderid() {
		return orderid;
	}

	public void setOrderid(Integer orderid) {
		this.orderid = orderid;
	}

	public String getOrderno() {
		return orderno;
	}

	public void setOrderno(String orderno) {
		this.orderno = orderno;
	}

	public String getSendname() {
		return sendname;
	}

	public void setSendname(String sendname) {
		this.sendname = sendname;
	}

	public String getSendaddress() {
		return sendaddress;
	}

	public void setSendaddress(String sendaddress) {
		this.sendaddress = sendaddress;
	}

	public String getSendphone() {
		return sendphone;
	}

	public void setSendphone(String sendphone) {
		this.sendphone = sendphone;
	}

	
	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	public Integer getUserid() {
		return userid;
	}

	public void setUserid(Integer userid) {
		this.userid = userid;
	}

	public Users getUsers() {
		return users;
	}

	public void setUsers(Users users) {
		this.users = users;
	}

	
	public Set<Entry> getEntry() {
		return entry;
	}

	public void setEntry(Set<Entry> entry) {
		this.entry = entry;
	}

	
	public String getZip() {
		return zip;
	}

	public void setZip(String zip) {
		this.zip = zip;
	}

	@Override
	public String toString() {
		return "Order [orderid=" + orderid + ", orderno=" + orderno + ", sendname=" + sendname + ", sendaddress="
				+ sendaddress + ", sendphone=" + sendphone + ", time=" + time + ", userid=" + userid + ", users="
				 + ", entry=" + entry + "]";
	}

	
	
	
}
