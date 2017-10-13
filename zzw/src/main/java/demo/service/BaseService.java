package demo.service;

import java.util.List;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import demo.dao.BaseDao;


@Component("baseservice")
public class BaseService {
	@Autowired
	private BaseDao baseDao;
	
	@Transactional
	public void add(Object obj){
		baseDao.add(obj);
	}
	@Transactional
	public void update(Object obj){
		baseDao.update(obj);
	}
	
	public Object find(Class clazz,Integer id){
		return baseDao.find(clazz, id);
	}
	
	public List findAll(String hql,Object[] obj){
		return baseDao.findAll(hql, obj);
	}
}
