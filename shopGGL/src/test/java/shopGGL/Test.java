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
		
		 int str1 =0;
	        for (int i = 0; i < 25; i++) {// 你想生成几个字符的，就把4改成几，如果改成1,那就生成一个随机字母．
	            str1 = (char) (Math.random() * 26);
	        }
	        System.out.println("输出随机生成的字符串" + str1);
	 
	        String str = "";
	        for (int i = 0; i < 25; i++) {// 你想生成几个字符的，就把4改成几，如果改成1,那就生成一个随机字母．
	            str = str + (char) (Math.random() * 26 + 'A');
	        }
	        System.out.println("输出随机生成的字符串" + str);
	        System.out.println(Integer.parseInt("输出随机生成的字符串"));
	}
}
