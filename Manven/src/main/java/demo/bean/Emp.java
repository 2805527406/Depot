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
@Table(name="emp")
public class Emp {
		@Id
		@GeneratedValue(strategy=GenerationType.IDENTITY)
		private Integer eid;
		private String ename;
		private String sex;
		@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
		@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone="GTM+8")
		private Date hire;
		
		@Column(insertable=false,updatable=false)
		private Integer dept_id;
		@ManyToOne
		@JoinColumn(name="dept_id")
		private Dept dept;
		public Integer getEid() {
			return eid;
		}
		public void setEid(Integer eid) {
			this.eid = eid;
		}
		public String getEname() {
			return ename;
		}
		public void setEname(String ename) {
			this.ename = ename;
		}
		public String getSex() {
			return sex;
		}
		public void setSex(String sex) {
			this.sex = sex;
		}
		public Date getHire() {
			return hire;
		}
		public void setHire(Date hire) {
			this.hire = hire;
		}
		public Integer getDept_id() {
			return dept_id;
		}
		public void setDept_id(Integer dept_id) {
			this.dept_id = dept_id;
		}
		public Dept getDept() {
			return dept;
		}
		public void setDept(Dept dept) {
			this.dept = dept;
		}
		@Override
		public String toString() {
			return "Emp [eid=" + eid + ", ename=" + ename + ", sex=" + sex + ", hire=" + hire + ", dept_id=" + dept_id
					+ ", dept=" + dept + "]";
		}
		
		
}
