package com.shop.vo;
import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

import java.io.*;

/**
 * Created by cgy on 2016/12/21.
 */
public class Base {
    /**
     * @param imgStr base64编码字符串
     * @param path   图片路径-具体到文件
     * @return
     * @Description: 将base64编码字符串转换为图片
     * @Author:
     * @CreateTime:
     */
    public static boolean generateImage(String imgStr, String path) {
        if(imgStr == null){
            return false;
        }
        BASE64Decoder decoder = new BASE64Decoder();
        try{
            //解密
            byte[] b = decoder.decodeBuffer(imgStr);
            //处理数据
            for (int i = 0;i<b.length;++i){
                if(b[i]<0){
                    b[i]+=256;
                }
            }
            OutputStream out = new FileOutputStream(path);
            out.write(b);
            out.flush();
            out.close();
            return true;
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        }
    }
    /**
     * @Description: 根据图片地址转换为base64编码字符串
     * @Author:
     * @CreateTime:
     * @return
     */
    public static String getImageStr(String imgFile) {
        InputStream inputStream = null;
        byte[] data = null;
        try {
            inputStream = new FileInputStream(imgFile);
            data = new byte[inputStream.available()];
            inputStream.read(data);
            inputStream.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        // 加密
        BASE64Encoder encoder = new BASE64Encoder();
        return encoder.encode(data);
    }
    public static void main(String[] args) {
        String strImg = getImageStr("C:/Users/asus/Pictures/IQIYISnapShot/1.jpg");
        System.out.println(strImg);
        generateImage("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", "D:/tupian/86619-107.jpg");
    }
}