package com.shop.web;

import java.io.UnsupportedEncodingException;
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
import org.springframework.web.multipart.MultipartFile;

import com.mysql.jdbc.util.Base64Decoder;
import com.shop.bean.Admin;
import com.shop.bean.Csort;
import com.shop.bean.Entry;
import com.shop.bean.Grou;
import com.shop.bean.Product;
import com.shop.bean.Sort;
import com.shop.bean.Sort_2;
import com.shop.bean.Users;
import com.shop.service.BaseService;

import sun.misc.BASE64Decoder;


@Controller
public class AdminController {
	@Autowired
	private BaseService bs;
	
	//��ѯ�����
		@RequestMapping(value="/admin/find2")
		@ResponseBody
		public Object find2(){
			System.out.println("为什么我进不来");
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
			System.out.println("为什么我进不来");
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
			System.out.println("为什么我进不来");
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
		public Object addPro(HttpServletRequest request){
			try {
				request.setCharacterEncoding("utf-8");
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			String proname=request.getParameter("proname");
			String csorid2=request.getParameter("csorid");
			String decript=request.getParameter("decript");
			String grid2=request.getParameter("grid");
			String image2=request.getParameter("image");
			String price2=request.getParameter("price");
			String proid2=request.getParameter("proid");
			String count2=request.getParameter("count");
			System.out.println("image2:"+image2);
			if(proname!=null&&proname!="0"&&!proname.equals("")&&
					csorid2!=null&&!csorid2.equals("")&&
							decript!=null&&!decript.equals("")&&
									count2!=null&&count2!="0"&&!count2.equals("")&&
											image2!=null&&!image2.equals("")&&
													price2!=null&&price2!="0"&&!price2.equals("")){
				Product pro=new Product();
				Integer csorid=Integer.parseInt(csorid2);
				Float price=Float.parseFloat(price2);
				try {
					Integer proid=Integer.parseInt(proid2);
					pro.setProid(proid);
				} catch (Exception e) {
					
				}
				
				Integer count=Integer.parseInt(count2);
				pro.setCsorid(csorid);
				pro.setDecript(decript);
		
				pro.setImage(image2);
				pro.setPrice(price);
				pro.setProname(proname);
				pro.setCount(count);
				pro.setCsort((Sort_2)bs.find(Sort_2.class, csorid));
				
				if(grid2!=null&&grid2!="0"&&!grid2.equals("")){
					Integer grid=Integer.parseInt(grid2);
					pro.setGrou((Grou)bs.find(Grou.class,grid));
					
				}
				System.out.println("添加商品："+pro);
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

		
		//用户管理
				//查询全部用户信息
				
				
				//查询用户信息
				@RequestMapping(value="/admin/yonghu")//查询用户信息
				@ResponseBody
				public Object findyonghu(String realname){
					String hql="select u from Users u where 1=1";
					System.out.println("用户查询"+realname);
					List list=new ArrayList<Object>();
					if(realname!=null&&!realname.equals("")){
						hql+=" and u.realname like '%"+realname+"%'";
					}
					System.out.println(hql);
					return bs.findAll(hql, list.toArray());
				}
				///管理员修改用户状态
				@RequestMapping(value="/admin/yhfind")
				@ResponseBody  
				public Object yhfind(Integer userid){
					System.out.println("id:"+userid);
					Users oldu =(Users)bs.find(Users.class,userid);
					System.out.println("用户id"+userid+"用户数组："+oldu);
					
					if (oldu.getUserlean().equals("Y")){
						oldu.setUserlean("N");
					}else {
						oldu.setUserlean("Y");
					}
					bs.update(oldu);
					Map<String,Object> map=new HashMap<String, Object>();
					map.put("ss","map");
					return map;
				}
				
				///订单的查询
				@RequestMapping(value="/admin/entry")
				@ResponseBody
				public Object finddingdan(String sendname,String orderno){
					String hql="select e from Entry e where 1=1";
					
					System.out.println("订单查询:"+sendname+orderno);
					List list=new ArrayList<Object>();
					if(sendname!=null&&!sendname.equals("")){
						hql+=" and e.or.sendname like '%"+sendname+"%'";
					}
					if(orderno!=null&&!orderno.equals("")){
						hql+=" and e.orderno like '%"+orderno+"%'";
					}
					System.out.println(hql);
//					System.out.println("商品输出："+bs.findAll(hql, list.toArray()));
					return bs.findAll(hql, list.toArray());
				}
		
}
