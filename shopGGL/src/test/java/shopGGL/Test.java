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
	        for (int i = 0; i < 25; i++) {// �������ɼ����ַ��ģ��Ͱ�4�ĳɼ�������ĳ�1,�Ǿ�����һ�������ĸ��
	            str1 = (char) (Math.random() * 26);
	        }
	        System.out.println("���������ɵ��ַ���" + str1);
	 
	        String str = "";
	        for (int i = 0; i < 25; i++) {// �������ɼ����ַ��ģ��Ͱ�4�ĳɼ�������ĳ�1,�Ǿ�����һ�������ĸ��
	            str = str + (char) (Math.random() * 26 + 'A');
	        }
	        System.out.println("���������ɵ��ַ���" + str);
	        System.out.println(Integer.parseInt("���������ɵ��ַ���"));
	}
}
