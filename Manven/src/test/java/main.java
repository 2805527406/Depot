import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import demo.service.BaseService;


public class main {
	public static void main(String[] args) {
		ApplicationContext applic=new ClassPathXmlApplicationContext("/app-core.xml");
		BaseService bs=(BaseService) applic.getBean("baseservice");
		
		System.out.println(bs.findAll("from Dept", null));
	}
}
