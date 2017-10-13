package demo.service;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.transaction.Transactional;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Component;

import demo.bean.Dept;
import demo.bean.Emp;
import demo.dao.BaseDao;

@Component("baseservice")
public class BaseService {
	@Resource(name="basedao")
	private BaseDao baseDao;
	
	@Transactional
	public void add(Object obj){
		baseDao.add(obj);
	}
	@Transactional
	public void update(Object obj){
		baseDao.update(obj);
	}
	@Transactional
	public void del(Object obj){
		baseDao.del(obj);
	}
	
	public Object find(Class clazz,Integer id){
		return baseDao.find(clazz, id);
	}
	
	public List findAll(String hql,Object[] obj){
		return baseDao.findAll(hql, obj);
	}
	
	public static void main(String[] args) {
		ApplicationContext applic=new ClassPathXmlApplicationContext("/app-core.xml");
		BaseService bs=(BaseService) applic.getBean("baseservice");
		
//		Dept d=new Dept();
//		d.setDname("婢堆囧劥闂傦拷);
//		
//		Dept d2=new Dept();
//		d2.setDname("瀵拷褰傞柈锟�;
//		d2.setD(d);
//		bs.add(d2);
		
		Emp e=new Emp();
		e.setEname("瀵姳绗�");
		e.setSex("閻拷");
		e.setHire(new Date());
		e.setDept((Dept)bs.find(Dept.class,2));
		bs.add(e);
	}
}
