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
@Table(name="zhang")
public class Zhang {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer zid;
	private String zname;
	@Column(insertable=false,updatable=false)
	private Integer zhid;
	//cascade与增，删，改有关
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="zhid")
	private Zhang z;
	
	//fetch与查询有关
	@OneToMany(mappedBy="zhang")
	@JsonIgnore
	private Set<Xin> xins=new HashSet<Xin>();

	public Integer getZid() {
		return zid;
	}

	public void setZid(Integer zid) {
		this.zid = zid;
	}

	public String getZname() {
		return zname;
	}

	public void setZname(String zname) {
		this.zname = zname;
	}

	public Integer getZhid() {
		return zhid;
	}

	public void setZhid(Integer zhid) {
		this.zhid = zhid;
	}

	public Zhang getZ() {
		return z;
	}

	public void setZ(Zhang z) {
		this.z = z;
	}

	public Set<Xin> getXins() {
		return xins;
	}

	public void setXins(Set<Xin> xins) {
		this.xins = xins;
	}

	@Override
	public String toString() {
		return "Zhang [zid=" + zid + ", zname=" + zname + ", zhid=" + zhid + ", z=" + z + "]";
	}
	
	
}
