package com.shop.web;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.criteria.From;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.loader.custom.EntityFetchReturn;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.shop.bean.Csort;
import com.shop.bean.Entry;
import com.shop.bean.Order;
import com.shop.bean.Product;
import com.shop.bean.Sort;
import com.shop.bean.Users;
import com.shop.service.BaseService;
import com.shop.vo.Cart;
import com.shop.vo.CartItem;
import com.shop.vo.PageBean;
import com.shop.vo.RandomCharData;

@Controller
public class ShopController {
	@Autowired
	private BaseService bs;
	
	@RequestMapping(value="/find")
	public String find(){
		return "forward:view/index.jsp";
	}
	//查询大分类
	@RequestMapping(value="/find2")
	@ResponseBody
	public Object find2(){
		System.out.println(bs.findAll("from Sort", null));
		return bs.findAll("from Sort", null);
	}
	//
	@RequestMapping(value="/find3")
	@ResponseBody
	public Object find3(){
		System.out.println(bs.findAll("select p from Product p left join p.grou g where g.gname='限时抢购'", null));
		return bs.findAll("select p from Product p left join p.grou g where g.gname='限时抢购'", null);
	}
	//��ɫƷ��
	@RequestMapping(value="/find4")
	@ResponseBody
	public Object find4(){
		System.out.println(bs.findAll("select p from Product p left join p.grou g where g.gname='易易特色'", null));
		return bs.findAll("select p from Product p left join p.grou g where g.gname='易易特色'", null);
	}
	//��Ʒ�Ƽ�
	@RequestMapping(value="/find5")
	@ResponseBody
	public Object find5(){
		System.out.println(bs.findAll("select p from Product p left join p.grou g where g.gname='精品推荐'", null));
		return bs.findAll("select p from Product p left join p.grou g where g.gname='精品推荐'", null);
	}
	//��Ʒҳ��
	@RequestMapping(value="/jump")
	public String jump(Csort cs,
			HttpServletRequest request){
		String hql="select cs from Csort cs where cs.sid="+cs.getSid();
		String hql2="select p from Product p left join p.csort cs2 left join p.csort.parent_csort cs left join p.csort.parent_csort.sort s where cs.sid="+cs.getSid();
		request.setAttribute("product",bs.findAll(hql,null));
		if(cs.getCsorid()!=null&&!cs.getCsorid().equals("")){
			hql2+=" and p.csorid="+cs.getCsorid();
		}
		List list=bs.findAll(hql2, null);
		/***以下是分页信息***-/-//********************************************************/
		PageBean pageBean=new PageBean();
		pageBean.setPagesize(8);
		pageBean.setTotal(list.size());
		try {
			int page = Integer.parseInt(request.getParameter("page"));
			pageBean.setPage(page);
		} catch (Exception e) {
			// TODO: handle exception
		}
		request.setAttribute("pagebean", pageBean);
		request.setAttribute("pro",list);
		return "forward:view/product.jsp";
	}
	//��Ʒ����ҳ��
	@RequestMapping(value="/jump2")
	public String jump2(Product p,
			HttpServletRequest request){
		System.out.println(p.getProid());
		String hql="select p from Product p where p.proid="+p.getProid();
		request.setAttribute("ppp",bs.find(Product.class, p.getProid()));
		
		return "forward:view/product_show.jsp";
	}
	//����ҳ��
	@RequestMapping(value="cart")
	public String Cart(@RequestParam(name="total")Integer total,@RequestParam(name="proid")Integer proid,
			HttpSession session){
		Product p=(Product) bs.find(Product.class, proid);
		CartItem cartItem=new CartItem(p, total);
		Cart cart=getCart(session);
		cart.addcart(cartItem);
		
		return "redirect:view/shopcar.jsp";
	}
	
	private Cart getCart(HttpSession session){
		Cart cart=(Cart) session.getAttribute("cart");
		if(cart==null){
			cart=new Cart();
			session.setAttribute("cart", cart);
		}
		return cart;
	}
	//���ﳵɾ��
	@RequestMapping(value="/removeCart")
	public String removeCart(@RequestParam(name="pid")Integer pid,HttpSession session){
		System.out.println(pid);
		Cart cart=getCart(session);
		cart.removeCart(pid);
		return "redirect:view/shopcar.jsp";
	}
	//��Ӷ���
	@RequestMapping(value="/addorder")
	@ResponseBody
	public String addOrder(Order order,HttpServletRequest request){
		Users u=(Users) request.getSession().getAttribute("qianlogin");
		order.setTime(new Date());
		order.setUsers((Users)bs.find(Users.class,u.getUserid()));
		bs.add(order);
		return "ok";
	}
	//֧��ҳ��
	@RequestMapping(value="/jump3")
	public String jump3(HttpServletRequest request,HttpSession session){
		Users u=(Users) session.getAttribute("qianlogin");
		request.getSession().setAttribute("order",bs.findAll("from Order o where o.userid="+u.getUserid(), null));
		return "forward:view/info.jsp";
	}
	//֧��
	@RequestMapping(value="/removeAddres")
	public String removeAddres(Integer orderid,HttpServletRequest request){
		bs.del((Order)bs.find(Order.class, orderid));
		Users u=(Users) request.getSession().getAttribute("qianlogin");
		request.getSession().setAttribute("order",bs.findAll("from Order o where o.userid="+u.getUserid(), null));
		return "redirect:view/info.jsp";
	}
	//֧��
	@RequestMapping(value="/editAddres")
	@ResponseBody
	public Object editAddres(Integer orderid){
		return bs.find(Order.class, orderid);
	}
	//֧��
	@RequestMapping(value="/editorder")
	@ResponseBody
	public String editorder(Order order,HttpSession session){
		Users u=(Users) session.getAttribute("qianlogin");
		Order or=(Order) bs.find(Order.class,order.getOrderid());
		or.setTime(new Date());
		or.setUsers((Users)bs.find(Users.class,u.getUserid()));
		or.setSendaddress(order.getSendaddress());
		or.setSendname(order.getSendname());
		or.setSendphone(order.getSendphone());
		or.setZip(order.getZip());
		bs.update(or);
		return "ok2";
	}
	
	//�������
	@RequestMapping(value="/code")
	public String code(Integer orderid,HttpSession session){
		System.out.println("id我应该得到了 啊："+orderid);
		Order or=(Order) bs.find(Order.class, orderid);
		RandomCharData r=new RandomCharData();
		String str=orderid+r.createRandomCharData(15);
		session.setAttribute("ddss", str);
		Entry en=new Entry();
		en.setOrderno(str);
		double f=getCart(session).getTotal();
		en.setPaymoney((float)f);
		en.setCreatetime(new Date());
		en.setOr(or);
		bs.add(en);
		
		 
		for (Map.Entry<Integer, CartItem> entry : getCart(session).getCart().entrySet()) {
		Product p=(Product) bs.find(Product.class, entry.getKey());
		CartItem ci=entry.getValue();
		p.setEn_pro(en);
		p.setSalecount(ci.getCount());
		bs.update(p);
		}
		return "redirect:view/payply.jsp";
	}
	
	@RequestMapping(value="/removelogin")
	public String removelogin(HttpSession session){
		session.removeAttribute("qianlogin");
		return "redirect:view/index.jsp";
	}
	
	//注册  判断账号是否存在
	@RequestMapping(value="/boolname")
	@ResponseBody
	public Object boolname(String name,String param){
		System.out.println(name);
		System.out.println(param);
		List list=bs.findAll("from Users u where u.username='"+param+"'", null);
		Map<String,Object> map=new HashMap<String, Object>();
		if(list.size()!=0){
			map.put("status", "n");
			map.put("info", "账号已存在！");
		}else{
			map.put("status", "y");  
		    map.put("info", "账号可以使用！");  
		}
		return map;
	}
	
	//修改密码 判断密码是否一样
	@RequestMapping(value="/boolpass")
	@ResponseBody
	public Object boolpass(String name,String param,HttpSession session){
		System.out.println(name);
		System.out.println(param);
		Users u=(Users) session.getAttribute("qianlogin");
		List list=bs.findAll("from Users u where u.username='"+u.getUsername()+"' and u.password='"+param+"'", null);
		Map<String,Object> map=new HashMap<String, Object>();
		if(list.size()!=0){
			map.put("status", "n");
			map.put("info", "密码已存在！");
		}else{
			map.put("status", "y");  
		    map.put("info", "密码可以使用！");  
		}
		return map;
	}
	
	@RequestMapping(value="/addUsers")
	public String addUsers(@RequestParam(name="name")String name,@RequestParam(name="userpassword")String password,@RequestParam(name="mobile")String mobile){
		System.out.println(name+","+password+","+mobile);
		Users u=new Users();
		u.setUsername(name);
		u.setPassword(password);
		u.setImg("/shopGGL/images/face.jpg");
		u.setPhone(mobile);
		u.setRealname("易易用户");
		u.setUserlean("Y");
		bs.add(u);
		return "redirect:view/login3.jsp";
	}
	
	@RequestMapping(value="/updatepass")
	public String updatepass(@RequestParam(name="userpassword")String password,HttpSession session){
		Users u=(Users) session.getAttribute("qianlogin");
		Users u2=(Users) bs.find(Users.class,u.getUserid());
		u2.setPassword(password);
		bs.update(u2);
		return "redirect:view/login3.jsp";
	}
	
}
