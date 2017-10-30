package com.shop.web;

import java.util.ArrayList;
import java.util.Date;
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
		return bs.findAll("select p from Product p left join p.grou g where g.gname='精品抢购'", null);
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
		request.setAttribute("pro",bs.findAll(hql2, null));
		return "forward:view/product.jsp";
	}
	//��Ʒ����ҳ��
	@RequestMapping(value="/jump2")
	public String jump2(Product p,
			HttpServletRequest request){
		System.out.println(p.getProid());
		String hql="select p from Product p where p.proid="+p.getProid();
		request.setAttribute("ppp",bs.find(Product.class, p.getProid()));
		System.out.println(bs.find(Product.class, p.getProid()));
		return "forward:view/product_show.jsp";
	}
	//����ҳ��
	@RequestMapping(value="cart")
	public String Cart(@RequestParam(name="total")Integer total,@RequestParam(name="proid")Integer proid,
			HttpSession session){
		System.out.println("������˰ɣ�"+total+","+proid);
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
		order.setTime(new Date());
		order.setUsers((Users)bs.find(Users.class,1));
		bs.add(order);
		return "ok";
	}
	//֧��ҳ��
	@RequestMapping(value="/jump3")
	public String jump3(HttpServletRequest request){
		request.setAttribute("order",bs.findAll("from Order o where o.userid=1", null));
		return "forward:view/info.jsp";
	}
	//֧��
	@RequestMapping(value="/removeAddres")
	public String removeAddres(Integer orderid,HttpServletRequest request){
		bs.del((Order)bs.find(Order.class, orderid));
		request.setAttribute("order",bs.findAll("from Order o where o.userid=1", null));
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
	public String editorder(Order order){
		Order or=(Order) bs.find(Order.class,order.getOrderid());
		or.setTime(new Date());
		or.setUsers((Users)bs.find(Users.class,1));
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
		Order or=(Order) bs.find(Order.class, orderid);
		RandomCharData r=new RandomCharData();
		String str=orderid+r.createRandomCharData(15);
		System.out.println("�����ţ�"+str);
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
		p.setEn_pro(en);
		bs.update(p);
		}
		
		return "redirect:view/payply.jsp";
	}
	
	@RequestMapping(value="/removelogin")
	public String removelogin(HttpSession session){
		session.removeAttribute("qianlogin");
		return "redirect:view/index.jsp";
	}

	
}
