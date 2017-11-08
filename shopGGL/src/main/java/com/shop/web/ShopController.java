package com.shop.web;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shop.bean.Csort;
import com.shop.bean.Entry;
import com.shop.bean.Order;
import com.shop.bean.Product;
import com.shop.bean.Sort;
import com.shop.bean.Sort_2;
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
		System.out.println("限时抢购："+bs.findAll("select p from Product p left join p.grou g where g.gname='限时抢购'", null));
		return bs.findAll("select p from Product p left join p.grou g where g.gname='限时抢购'", null);
	}
	//��ɫƷ��
	@RequestMapping(value="/find4")
	@ResponseBody
	public Object find4(){
		System.out.println("易易特色："+bs.findAll("select p from Product p left join p.grou g where g.gname='易易特色'", null));
		return bs.findAll("select p from Product p left join p.grou g where g.gname='易易特色'", null);
	}
	//��Ʒ�Ƽ�
	@RequestMapping(value="/find5")
	@ResponseBody
	public Object find5(){
		System.out.println("精品推荐："+bs.findAll("select p from Product p left join p.grou g where g.gname='精品推荐'", null));
		return bs.findAll("select p from Product p left join p.grou g where g.gname='精品推荐'", null);
	}
	
	@RequestMapping(value="/find6")
	@ResponseBody
	public Object find6(){
		System.out.println("轮播图进不来卧槽");
		System.out.println("轮播图："+bs.findAll("select p from Product p left join p.grou g where g.gname='轮播图'", null));
		return bs.findAll("select p from Product p left join p.grou g where g.gname='轮播图'", null);
	}
	//��Ʒҳ��
	@RequestMapping(value="/jump")
	public String jump(Csort cs,
			HttpServletRequest request){
		String hql="select cs from Csort cs where cs.sid="+cs.getSid()+" order by cs.csorid";
		String hql2="select p from Product p left join p.csort cs2 left join p.csort.parent_csort cs left join p.csort.parent_csort.sort s where cs.sid="+cs.getSid();
		List<Csort> list2=bs.findAll(hql,null);
		request.setAttribute("product",list2);
		if(cs.getCsorid()!=null&&!cs.getCsorid().equals("")){
			hql2+=" and p.csorid="+cs.getCsorid();
		}
		List list=bs.findAll(hql2, null);
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
	
	@RequestMapping(value="/editCart")
	@ResponseBody
	public Object editCart(Integer count,Integer proid,Double total,HttpSession session){
		System.out.println("(●'◡'●)："+count+","+proid+","+total);
		Cart c=getCart(session);
		c.setTotal(total);
		Map<Integer, CartItem> map=c.getCart();
		CartItem pro=map.get(proid);
		pro.setCount(count);
		return "OK";
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
		/********************************/
		List list=  bs.findAll("from Entry en where en.orderno='"+str+"'",null);
		Entry en2=(Entry) list.get(0);
		for (Map.Entry<Integer, CartItem> entry : getCart(session).getCart().entrySet()) {
		Product p=(Product) bs.find(Product.class, entry.getKey());
		en2.getPro_en().add(p);
		CartItem ci=entry.getValue();
		p.getEntrys().add(en2);
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
	
	@RequestMapping(value="/shopover")
	@ResponseBody
	public Object shopover(@RequestParam(name="orderno")String orderno,@RequestParam(name="zf")Float zf,HttpSession session){
		System.out.println(orderno+","+zf);
		List list=bs.findAll("select e from Entry e where e.orderno='"+orderno+"'", null);
		Entry en=(Entry) list.get(0);
		en.setPrice(zf);
		Cart cart=getCart(session);
		cart.CleanCart();
		bs.update(en);
		return "ok";
	}
	
	//根据用户id来查询订单
	///订单的查询
	@RequestMapping(value="/view/yhdingdan")
	@ResponseBody
	public Object finddingdan(Integer userid){
		System.out.println("yonghuid:"+userid);
		String hql="select e from Entry e where e.or.userid="+userid;
		System.out.println(hql);
		return bs.findAll(hql,null);
	}		
	
	//取消用户订单1已经付款2货到付款3已发货4未付款
	@RequestMapping(value="/view/qxyhdd")
	@ResponseBody
	public Object removedd(@RequestParam(name="eid")Integer eid){
		System.out.println("我要修改订单");
		Entry entry=(Entry) bs.find(Entry.class, eid);//得到订单，还要商品
		Set<Product> products=entry.getPro_en();
			entry.getPro_en().removeAll(products);
		Map<String , Object> map=new HashMap<String, Object>();
		if(entry.getPrice()!=null){
			System.out.println("不是空的啊");
			Integer i = Math.round(entry.getPrice());
			if(i==3) {
				map.put("result", "no");
			}else{
				bs.del(entry);
				map.put("result", "yes");
			}
		}else{
			System.out.println("我要删除啦");
			bs.del(entry);
			map.put("result", "yes");
		}
		return map;
	}
	
	@RequestMapping(value="/cx")
	public String cx(String keyword,HttpServletRequest request){//得到模糊查询的关键字
		//查询类别   既然这样为何2个不都得到呢 我查询所有商品不都行了吗 
		/*
		 * 1.根据参数查询类别，吧类别下的商品得到2.根据关键之模糊查询商品，这样得到的就是所有商品
		 * 
		 * */
		//查询商品名称
		List<Product> list1=new ArrayList<Product>();//根据小分类查询到的商品
		List<Product> list2=new ArrayList<Product>();//商品模糊查询
		if(keyword!=null&&!keyword.equals("")){
			list1=bs.findAll("select p from Product p left join p.csort s2 where s2.s2name like '%"+keyword+"%'",null);
			System.out.println("分类查出来的商品："+list1);
			list2=bs.findAll("select p from Product p where p.proname like '%"+keyword+"%'",null);
			System.out.println("模糊查询的商品："+list2);
			list1.addAll(list2);
			System.out.println("合并后的集合："+list1);
			HashSet h = new HashSet(list1);   
			list1.clear();
			list1.addAll(h);
			System.out.println("去重复后的集合："+list1);
		}
		request.setAttribute("pro",list1);
		return "forward:view/product.jsp";
	}
	
	@RequestMapping(value="/clearCart")
	public String clearCart(HttpSession session){
		getCart(session).CleanCart();
		return "redirect:view/shopcar.jsp";
	}
	
}
