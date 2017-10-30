package com.shop.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shop.bean.Admin;
import com.shop.bean.Csort;
import com.shop.bean.Entry;
import com.shop.bean.Grou;
import com.shop.bean.Product;
import com.shop.bean.Sort;
import com.shop.bean.Sort_2;
import com.shop.service.BaseService;


@Controller
public class AdminController {
	@Autowired
	private BaseService bs;
	
	//��ѯ�����
		@RequestMapping(value="/admin/find2")
		@ResponseBody
		public Object find2(){
			List<Sort> list=bs.findAll("from Sort", null);
			Sort s=new Sort();
			s.setSorid(0);
			s.setSorname("请选择");
			list.add(s);
			return list;
		}
		
		@RequestMapping(value="/admin/find3")
		@ResponseBody
		public Object find3(){
			List<Grou> list=bs.findAll("from Grou", null);
			Grou s=new Grou();
			s.setGid(0);
			s.setGname("请选择");
			list.add(s);
			return list;
		}
		
		@RequestMapping(value="/admin/find4")
		@ResponseBody
		public Object find4(Integer id){
			List<Csort> list=bs.findAll("from Csort cs where cs.sid="+id, null);
			Csort s=new Csort();
			s.setCsorid(0);
			s.setCsorname("请选择");
			list.add(s);
			return list;
		}
		
		@RequestMapping(value="/admin/find5")
		@ResponseBody
		public Object find5(Integer id){
			List<Sort_2> list=bs.findAll("from Sort_2 s2 where s2.csid="+id, null);
			Sort_2 s=new Sort_2();
			s.setS2id(0);
			s.setS2name("请选择");
			list.add(s);
			return list;
		}
		
		@RequestMapping(value="/admin/pro")
		@ResponseBody
		public Object find5(String proname,Integer sorid,Integer gid,Integer csorid,Integer s2id){
			String hql="select p from Product p left join p.csort s2 left join p.csort.parent_csort cs left join p.csort.parent_csort.sort s left join p.grou g where 1=1";
			List list=new ArrayList<Object>();
			if(proname!=null&&!proname.equals("")){
				hql+=" and p.proname like '%"+proname+"%'";
			}
			if(sorid!=null&&!sorid.equals("")&&sorid!=0){
				hql+=" and s.sorid=?";
				list.add(sorid);
			}
			if(gid!=null&&!gid.equals("")&&gid!=0){
				hql+=" and g.gid=?";
				list.add(gid);
			}
			if(csorid!=null&&!csorid.equals("")&&csorid!=0){
				hql+=" and cs.csorid=?";
				list.add(csorid);
			}if(s2id!=null&&!s2id.equals("")&&s2id!=0){
				hql+=" and s2.s2id=?";
				list.add(s2id);
			}
			System.out.println(hql);
			return bs.findAll(hql, list.toArray());
		}
		
		@RequestMapping(value="/admin/removePro")
		@ResponseBody
		public Object removePro(Integer id){
			System.err.println(id);
			bs.del((Product)bs.find(Product.class, id));
			Map<String , Object> map=new HashMap<String, Object>();
			return map;
		}
		
		@RequestMapping(value="/admin/addProduct")
		@ResponseBody
		public Object addPro(Product pro){
			if(pro!=null&&pro.getCsorid()!=null&&pro.getCsorid()!=0&&!pro.getCsorid().equals("")&&
					pro.getDecript()!=null&&!pro.getDecript().equals("")&&
					pro.getImage()!=null&&!pro.getImage().equals("")&&
					pro.getPrice()!=null&&pro.getPrice()!=0&&!pro.getPrice().equals("")&&
					pro.getProname()!=null&&!pro.getProname().equals("")&&
					pro.getCount()!=null&&pro.getCount()!=0&&!pro.getCount().equals("")){
				pro.setCsort((Sort_2)bs.find(Sort_2.class, pro.getCsorid()));
				if(pro.getGrid()!=null&&pro.getGrid()!=0&&!pro.getGrid().equals("")){
					pro.setGrou((Grou)bs.find(Grou.class,pro.getGrid()));
				}
				bs.add(pro);
				Map<String , Object> map=new HashMap<String, Object>();
				return map;
			}else{
				return "ok";
			}
		}
		
		@RequestMapping(value="/admin/editProduct")
		@ResponseBody
		public Object editPro(Product pro){
			if(pro!=null&&pro.getCsorid()!=null&&pro.getCsorid()!=0&&!pro.getCsorid().equals("")&&
					pro.getDecript()!=null&&!pro.getDecript().equals("")&&
					pro.getImage()!=null&&!pro.getImage().equals("")&&
					pro.getPrice()!=null&&pro.getPrice()!=0&&!pro.getPrice().equals("")&&
					pro.getProname()!=null&&!pro.getProname().equals("")&&
					pro.getCount()!=null&&pro.getCount()!=0&&!pro.getCount().equals("")){
				pro.setCsort((Sort_2)bs.find(Sort_2.class, pro.getCsorid()));
				Product p=(Product) bs.find(Product.class, pro.getProid());
				p.setProname(pro.getProname());
				p.setCsorid(pro.getCsorid());
				p.setDecript(pro.getDecript());
				p.setImage(pro.getImage());
				p.setPrice(pro.getPrice());
				p.setCount(pro.getCount());
				if(pro.getGrid()!=null&&pro.getGrid()!=0&&!pro.getGrid().equals("")){
					p.setGrou((Grou)bs.find(Grou.class,pro.getGrid()));
				}
				bs.update(p);
				Map<String , Object> map=new HashMap<String, Object>();
				return map;
			}else{
				return "ok";
			}
		}
		
		@RequestMapping(value="/admin/edit")
		@ResponseBody
		public Object edit(Integer id){
			System.out.println(bs.find(Product.class,id));
			return bs.find(Product.class,id);
		}
		
		@RequestMapping(value="/admin/login")
		@ResponseBody
		public Object login(@RequestParam(name="adminname")String adminname,@RequestParam(name="password")String password,HttpSession session){
			String str="";
			String hql="from Admin a where a.adminname='"+adminname+"' and a.password='"+password+"'";
				List a=bs.findAll(hql, null);
				if(a.size()>0){
						Admin ad=(Admin) a.get(0);
						session.setAttribute("houlogin",ad);
						str="ok";
				}else{
					str="no";
				}
			
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("ss",str);
			return map;
		}
		
		@RequestMapping(value="/admin/yeslog")
		public String yeslog(HttpSession session){
			session.removeAttribute("houlogin");
			return "redirect:/backstage/Public/login.jsp";
		}

		
}
