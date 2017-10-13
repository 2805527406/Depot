package demo.web;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
public class TextController2 {
	@Resource(name="baseservice")
	private BaseService bs;
	
	//鐠哄疇娴嗛崚棰佸瘜妞ょ敻娼�
	@RequestMapping(value="/s")
	public ModelAndView s(){
		ModelAndView mav=new ModelAndView();
		mav.setViewName("list3");
		return mav;
	}
	
	@RequestMapping(value="/elist")
	@ResponseBody
	public Object list(@RequestParam(name="ename")String ename,@RequestParam(name="dept_id")Integer dept_id){
		List list=new ArrayList<Object>();
		String hql="select e from Emp e where 1=1";
		if(ename!=null&&!ename.equals("")){
			hql+=" and e.ename like ?";
			list.add("%"+ename+"%");
		}
		if(dept_id!=null&&dept_id!=0){
			hql+=" and e.dept_id=?";
			list.add(dept_id);
		}
		System.out.println(hql);
		return bs.findAll(hql, list.toArray());
	}
	
	@RequestMapping(value="/elist2")
	@ResponseBody
	public List lis2t(){
		List list=bs.findAll("from Dept", null);
		Dept d=new Dept();
		d.setDid(0);
		d.setDname("璇烽�鎷�");
		list.add(0,d);
		return list;
	}
	
	@RequestMapping(value="/etoupdate/{id}")
	@ResponseBody
	public Object lis2t(@PathVariable(name="id")Integer id){
		
		return bs.find(Emp.class, id);
	}
	
	@RequestMapping(value="/eadd")
	@ResponseBody
	public Object eadd(Emp e){
		if(e!=null){
			if(e.getDept_id()!=null&&e.getDept_id()!=0){
				e.setDept((Dept)bs.find(Dept.class,e.getDept_id()));
			}
			e.setHire(new Date());
			bs.add(e);
		}
		System.out.println(e);
		Map<String,Object> list=new HashMap<String,Object>();
		list.put("success","ok");
		return list;
	}
	
	@RequestMapping(value="/eupdate")
	@ResponseBody
	public Object ead2d(Emp e){
		e.setHire(new Date());
		if(e.getDept_id()!=null&&e.getDept_id()!=0){
			e.setDept((Dept)bs.find(Dept.class,e.getDept_id()));
		}
		bs.update(e);
		Map<String,Object> list=new HashMap<String,Object>();
		list.put("success","ok");
		return list;
	}
	
	@RequestMapping(value="/edel")
	@ResponseBody
	public Object edel(@RequestParam(name="eid")Integer eid){
		Emp e=(Emp) bs.find(Emp.class,eid);
		System.out.println(e);
		bs.del(e);
		return "鍒犻櫎鎴愬姛";
	}
	//鍚庣画鍙痙el
	@RequestMapping(value="/elist22")
	@ResponseBody
	public Object list(){
		List list=new ArrayList<Object>();
		String hql="select e from Emp e where 1=1";
		System.out.println(hql);
		return bs.findAll(hql, list.toArray());
	}
}
