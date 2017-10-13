package demo.bean;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;
@Entity
@Table(name="cardtype")
public class Cardtype {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer ctid;
	private String ctname;
	
	@OneToMany(mappedBy="cardtype",fetch=FetchType.EAGER,cascade=CascadeType.ALL)
	@JsonIgnore
	private Set<Contact> contacts=new HashSet<Contact>();


	public Integer getCtid() {
		return ctid;
	}


	public void setCtid(Integer ctid) {
		this.ctid = ctid;
	}


	public String getCtname() {
		return ctname;
	}


	public void setCtname(String ctname) {
		this.ctname = ctname;
	}


	public Set<Contact> getContacts() {
		return contacts;
	}


	public void setContacts(Set<Contact> contacts) {
		this.contacts = contacts;
	}


	@Override
	public String toString() {
		return "Cardtype [ctid=" + ctid + ", ctname=" + ctname + "]";
	}
	
	
	
}
