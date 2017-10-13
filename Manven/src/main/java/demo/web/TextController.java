package demo.web;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


import demo.bean.Dept;
import demo.bean.Emp;
import demo.service.BaseService;
@Controller
public class TextController {
	@Resource(name="baseservice")
	private BaseService bs;
	
	@RequestMapping(value="/list")
	public ModelAndView list(Emp e){
		ModelAndView mav=new ModelAndView();
		List list=new ArrayList<Object>();
		String hql="select e from Emp e where 1=1 ";
		if(e!=null){
			if(e.getEname()!=null&&!e.getEname().equals("")){
				hql+=" and e.ename like ?";
				list.add("%"+e.getEname()+"%");
			}
			if(e.getDept_id()!=null&&!e.getDept_id().equals("")&&e.getDept_id()!=0){
				hql+=" and e.dept_id=?";
				list.add(e.getDept_id());
			}
		}
		System.out.println(hql);
		mav.addObject("list",bs.findAll(hql,list.toArray()));
		mav.setViewName("list");
		return mav;
	}
	
	@RequestMapping(value="/list2")
	@ResponseBody
	public Object list2(){
		return bs.findAll("from Dept",null);
	}
	
	@RequestMapping(value="/toupdate")
	@ResponseBody
	public Object toupdate(@RequestParam(name="eid")Integer id){
		return bs.find(Emp.class,id);
	}
	
	@RequestMapping(value="/add")
	public String add(Emp e){
		e.setHire(new Date());
		e.setDept((Dept)bs.find(Dept.class,e.getDept_id()));
		bs.add(e);
		return "redirect:/list.sw";
	}
	
	@RequestMapping(value="/del/{id}")
	public String del(@PathVariable(name="id")Integer id){
		System.out.println(id);
		Emp e=(Emp) bs.find(Emp.class,id);
		bs.del(e);
		return "redirect:/list.sw";
	}
	
	@RequestMapping(value="/update")
	public String update(Emp e){
		Emp e2=(Emp) bs.find(Emp.class,e.getEid());
		e2.setEname(e.getEname());
		e2.setSex(e.getSex());
		e2.setHire(new Date());
		e2.setDept_id(e.getDept_id());
		bs.update(e2);
		return "redirect:/list.sw";
	}
}
