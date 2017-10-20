package com.shop.web;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.loader.custom.EntityFetchReturn;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.shop.bean.Sort;
import com.shop.service.BaseService;

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
}
