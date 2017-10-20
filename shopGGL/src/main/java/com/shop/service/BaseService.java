package com.shop.service;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.transaction.Transactional;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Component;

import com.shop.dao.BaseDao;


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
	
}
