package demo.bean;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

@Entity
@Table(name="xin")
public class Xin {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer xid;
	private String xname;
	@DateTimeFormat(pattern="yyyy-mm-dd")
	@JsonFormat(pattern="yyyy-mm-dd",timezone="GTM+8")
	private Date hire;
	@Column(insertable=false,updatable=false)
	private Integer zhang_id;
	
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="zhang_id")
	private Zhang zhang;

	public Integer getXid() {
		return xid;
	}

	public void setXid(Integer xid) {
		this.xid = xid;
	}

	public String getXname() {
		return xname;
	}

	public void setXname(String xname) {
		this.xname = xname;
	}

	public Date getHire() {
		return hire;
	}

	public void setHire(Date hire) {
		this.hire = hire;
	}

	public Integer getZhang_id() {
		return zhang_id;
	}

	public void setZhang_id(Integer zhang_id) {
		this.zhang_id = zhang_id;
	}

	public Zhang getZhang() {
		return zhang;
	}

	public void setZhang(Zhang zhang) {
		this.zhang = zhang;
	}

	@Override
	public String toString() {
		return "Xin [xid=" + xid + ", xname=" + xname + ", hire=" + hire + ", zhang_id=" + zhang_id + ", zhang=" + zhang
				+ "]";
	}
	
	
	
}
