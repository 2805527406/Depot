package demo.bean;

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
@Table(name="dept")
public class Dept {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer did;
	private String dname;
	@Column(insertable=false,updatable=false)
	private Integer deid;
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="deid")
	private Dept d;
	
	@OneToMany(mappedBy="dept")
	@JsonIgnore
	private Set<Emp> emps=new HashSet<Emp>();

	public Integer getDid() {
		return did;
	}

	public void setDid(Integer did) {
		this.did = did;
	}

	public String getDname() {
		return dname;
	}

	public void setDname(String dname) {
		this.dname = dname;
	}

	public Integer getDeid() {
		return deid;
	}

	public void setDeid(Integer deid) {
		this.deid = deid;
	}

	public Dept getD() {
		return d;
	}

	public void setD(Dept d) {
		this.d = d;
	}

	public Set<Emp> getEmps() {
		return emps;
	}

	public void setEmps(Set<Emp> emps) {
		this.emps = emps;
	}

	@Override
	public String toString() {
		return "Dept [did=" + did + ", dname=" + dname + ", deid=" + deid + ", d=" + d + "]";
	}
	
}
