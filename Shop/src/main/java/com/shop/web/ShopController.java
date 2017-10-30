package com.shop.web;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.loader.custom.EntityFetchReturn;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.shop.service.BaseService;

@Controller
public class ShopController {
	@Autowired
	private BaseService bs;
	
	@RequestMapping(value="/find")
	public String find(){
		ModelAndView mav=new ModelAndView();
		String hql="select s from Sort s where 1=1";
		List<Object> list=new ArrayList<Object>();
		mav.addObject("ss",bs.findAll(hql,list.toArray()));
		mav.setViewName("view/index");
		return "forward:view/index.jsp";
	}
}
