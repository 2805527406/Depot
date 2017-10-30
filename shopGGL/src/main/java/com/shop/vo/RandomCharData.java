package com.shop.vo;

import java.util.Random;

public class RandomCharData {

	    //����ָ������������ĸ�����ֵ������
	    //0~9��ASCIIΪ48~57
	    //A~Z��ASCIIΪ65~90
	    //a~z��ASCIIΪ97~122
	    public String createRandomCharData(int length)
	    {
	        StringBuilder sb=new StringBuilder();
	        Random rand=new Random();//����������������������
	        Random randdata=new Random();
	        int data=0;
	        for(int i=0;i<length;i++)
	        {
	            int index=rand.nextInt(3);
	            //Ŀ�������ѡ���������֣���Сд��ĸ
	            switch(index)
	            {
	            case 0:
	                 data=randdata.nextInt(10);//����������0~9
	                 sb.append(data);
	                break;
	            case 1:
	                data=randdata.nextInt(26)+65;//��ֻ֤�����65~90֮�������
	                sb.append((char)data);
	                break;
	            case 2:
	                data=randdata.nextInt(26)+97;//��ֻ֤�����97~122֮�������
	                sb.append((char)data);
	                break;
	            }
	        }
	        String result=sb.toString();
	        return result;
	    }
	                       
	    //����ָ���������ɴ����ֵ������
	    public void createData(int length) {
	        StringBuilder sb=new StringBuilder();
	        Random rand=new Random();
	        for(int i=0;i<length;i++)
	        {
	            sb.append(rand.nextInt(10));
	        }
	        String data=sb.toString();
	        System.out.println(length+" random data: "+data);
	    }
}
