package com.shop.web;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.criteria.From;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.loader.custom.EntityFetchReturn;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.shop.bean.Csort;
import com.shop.bean.Product;
import com.shop.bean.Sort;
import com.shop.service.BaseService;
import com.shop.vo.Cart;
import com.shop.vo.CartItem;

@Controller
public class ShopController {
	@Autowired
	private BaseService bs;
	
	@RequestMapping(value="/find")
	public String find(){
		return "forward:view/index.jsp";
	}
	
	@RequestMapping(value="/find2")
	@ResponseBody
	public Object find2(){
		System.out.println(bs.findAll("from Sort", null));
		return bs.findAll("from Sort", null);
	}
	
	@RequestMapping(value="/find3")
	@ResponseBody
	public Object find3(){
		System.out.println(bs.findAll("select p from Product p left join p.grou g where g.gname='限时抢购'", null));
		return bs.findAll("select p from Product p left join p.grou g where g.gname='限时抢购'", null);
	}
	
	@RequestMapping(value="/find4")
	@ResponseBody
	public Object find4(){
		System.out.println(bs.findAll("select p from Product p left join p.grou g where g.gname='特色品牌'", null));
		return bs.findAll("select p from Product p left join p.grou g where g.gname='特色品牌'", null);
	}
	
	@RequestMapping(value="/find5")
	@ResponseBody
	public Object find5(){
		System.out.println(bs.findAll("select p from Product p left join p.grou g where g.gname='精品推荐'", null));
		return bs.findAll("select p from Product p left join p.grou g where g.gname='精品推荐'", null);
	}
	
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
	
	@RequestMapping(value="/jump2")
	public String jump2(Product p,
			HttpServletRequest request){
		System.out.println(p.getProid());
		String hql="select p from Product p where p.proid="+p.getProid();
		request.setAttribute("ppp",bs.find(Product.class, p.getProid()));
		System.out.println(bs.find(Product.class, p.getProid()));
		return "forward:view/product_show.jsp";
	}
	
	@RequestMapping(value="cart")
	public String Cart(@RequestParam(name="total")Integer total,@RequestParam(name="proid")Integer proid,
			HttpSession session){
		System.out.println("你进来了吧："+total+","+proid);
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
	
	@RequestMapping(value="/test")
	@ResponseBody
	public Object test(Integer sid,
			HttpServletRequest request){
		System.out.println(sid);
		String hql="select p from Product p where p.proid="+sid;
		request.setAttribute("ppp",bs.find(Product.class, sid));
		return bs.findAll(hql, null);
	}
	
	@RequestMapping(value="/removeCart")
	public String removeCart(@RequestParam(name="pid")Integer pid,HttpSession session){
		System.out.println(pid);
		Cart cart=getCart(session);
		cart.removeCart(pid);
		return "redirect:view/shopcar.jsp";
	}
	
	@RequestMapping(value="/code")
	public String code(HttpSession session){
		Cart cart=getCart(session);
		
		
		return "redirect:view/info.jsp";
	}
	
	
	

	
}
