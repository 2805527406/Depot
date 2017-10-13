package demo.bean;

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
@Table(name="contact")
public class Contact {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer cid;
	private String name;
	private String sex;
	private String company;
	private String hometelnum;
	private String officetelnum;
	
	@Column(insertable=false,updatable=false)
	private Integer ctid;
	
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="ctid")
	private Cardtype cardtype;


	public Integer getCid() {
		return cid;
	}


	public void setCid(Integer cid) {
		this.cid = cid;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getSex() {
		return sex;
	}


	public void setSex(String sex) {
		this.sex = sex;
	}


	public String getCompany() {
		return company;
	}


	public void setCompany(String company) {
		this.company = company;
	}


	public String getHometelnum() {
		return hometelnum;
	}


	public void setHometelnum(String hometelnum) {
		this.hometelnum = hometelnum;
	}


	public String getOfficetelnum() {
		return officetelnum;
	}


	public void setOfficetelnum(String officetelnum) {
		this.officetelnum = officetelnum;
	}


	public Integer getCtid() {
		return ctid;
	}


	public void setCtid(Integer ctid) {
		this.ctid = ctid;
	}


	public Cardtype getCardtype() {
		return cardtype;
	}


	public void setCardtype(Cardtype cardtype) {
		this.cardtype = cardtype;
	}


	@Override
	public String toString() {
		return "Contact [cid=" + cid + ", name=" + name + ", sex=" + sex + ", company=" + company + ", hometelnum="
				+ hometelnum + ", officetelnum=" + officetelnum + ", ctid=" + ctid + ", cardtype=" + cardtype + "]";
	}
	
	
	
}
