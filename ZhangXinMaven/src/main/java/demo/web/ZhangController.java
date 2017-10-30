package demo.web;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import demo.bean.Xin;
import demo.bean.Zhang;
import demo.service.BaseService;

@Controller
public class ZhangController {
	@Autowired
	private BaseService bs;
	
	@RequestMapping(value="/list")
	@ResponseBody
	public Object list(){
		System.out.println(bs.findAll("from Xin",null));
		return bs.findAll("from Xin",null);
	}
	
	@RequestMapping(value="/list2")
	@ResponseBody
	public Object list2(){
		System.out.println(bs.findAll("from Zhang",null));
		return bs.findAll("from Zhang",null);
	}
	
	@RequestMapping(value="/add")
	@ResponseBody
	public Object add(Xin x){
		System.out.println("添加的信息："+x);
		x.setZhang((Zhang)bs.find(Zhang.class,x.getZhang_id()));
		bs.add(x);
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("success", "ok");
		return map;
	}
}
