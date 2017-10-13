package demo.web;
//Êý¾Ý½»»¥
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import demo.bean.Cardtype;
import demo.bean.Contact;
import demo.service.BaseService;

@Controller
public class ContactController {
	@Resource(name="baseservice")
	private BaseService bs;
	
	@RequestMapping(value="/s")
	public ModelAndView s(){
		ModelAndView mav=new ModelAndView();
		mav.setViewName("list");
		return mav;
	}
	
	@RequestMapping(value="/add",method=RequestMethod.GET)
	public ModelAndView add(){
		ModelAndView mav=new ModelAndView();
		mav.setViewName("add");
		return mav;
	}
	
	@RequestMapping(value="/add",method=RequestMethod.POST)
	public String add2(Contact t){
		Cardtype c=(Cardtype) bs.find(Cardtype.class,t.getCtid());
		t.setCardtype(c);
		bs.add(t);
		return "redirect:/s.sw";
	}
	
	@RequestMapping(value="/list")
	@ResponseBody
	public Object list(Contact c){
		List list=new ArrayList<Object>();
		String hql="select c from Contact c where 1=1 ";
		if(c!=null){
			if(c.getName()!=null && !c.getName().equals("")){
				hql+=" and c.name like ?";
				list.add("%"+c.getName()+"%");
			}
			if(c.getSex()!=null && !c.getSex().equals("") && !c.getSex().equals("A")){
				hql+=" and c.sex=?";
				list.add(c.getSex());
			}
			if(c.getCtid()!=null && !c.getCtid().equals("0") && c.getCtid()!=0){
				hql+=" and c.ctid=?";
				list.add(c.getCtid());
			}
		}
		System.out.println(hql);
		System.out.println(bs.findAll(hql,list.toArray()));
		return bs.findAll(hql,list.toArray());
	}
	
	@RequestMapping(value="/list2")
	@ResponseBody
	public Object list2(){
		System.out.println("jihe"+bs.findAll("from Cardtype",null));
		return bs.findAll("from Cardtype",null);
	}
}
