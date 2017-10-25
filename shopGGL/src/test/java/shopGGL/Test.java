package shopGGL;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.shop.bean.Csort;
import com.shop.bean.Sort;
import com.shop.service.BaseService;

public class Test {
	public static void main(String[] args) {
		ApplicationContext applic=new ClassPathXmlApplicationContext("/app-core.xml");
		BaseService bs=(BaseService) applic.getBean("baseservice");
		
		System.out.println(bs.findAll("from Csort", null));
	}
}
