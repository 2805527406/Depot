package com.shop.bean;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name="grou")
public class Grou {
		@Id
		@GeneratedValue(strategy=GenerationType.IDENTITY)
		private Integer gid;
		private String gname;

		@OneToMany(mappedBy="grou")
		@JsonIgnore
		private Set<Product> ppp=new HashSet<Product>();
		public Integer getGid() {
			return gid;
		}
		public void setGid(Integer gid) {
			this.gid = gid;
		}
		public String getGname() {
			return gname;
		}
		public void setGname(String gname) {
			this.gname = gname;
		}
	
		public Set<Product> getPpp() {
			return ppp;
		}
		public void setPpp(Set<Product> ppp) {
			this.ppp = ppp;
		}
		@Override
		public String toString() {
			return "Group [gid=" + gid + ", gname=" + gname +   "]";
		}
		
}
