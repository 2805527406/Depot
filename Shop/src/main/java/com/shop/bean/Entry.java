package com.shop.bean;

import java.util.Date;
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


import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name="entry")
public class Entry {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer entryid;
	private Float price;
	private Integer count;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	@JsonFormat(pattern="yyyy-MM-dd",locale="GTM+8")
	private Date createtime;
	
	@Column(insertable=false,updatable=false)
	private Integer orid;
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="orid")
	private Order or;
	
	@OneToMany(mappedBy="en",cascade=CascadeType.ALL)
	@JsonIgnore
	private Set<Sort> sorts=new HashSet<Sort>();

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

	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
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

	public Set<Sort> getSorts() {
		return sorts;
	}

	public void setSorts(HashSet<Sort> sorts) {
		this.sorts = sorts;
	}

	@Override
	public String toString() {
		return "Entry [entryid=" + entryid + ", price=" + price + ", count=" + count + ", createtime=" + createtime
				+ ", orid=" + orid + ", or=" + or + ", sorts=" + sorts + "]";
	}


	
	
}
