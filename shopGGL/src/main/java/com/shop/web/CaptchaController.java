package com.shop.web;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.google.code.kaptcha.Constants;
import com.google.code.kaptcha.Producer;
import com.shop.bean.Admin;
import com.shop.bean.Users;
import com.shop.service.BaseService;

@Controller
@RequestMapping("captcha")
public class CaptchaController {

    @Resource(name="captchaProducer")
    private Producer captchaProducer;
    @Resource(name="baseservice")
    private BaseService bs;
    /**
     *             
     *                获取验证码图片
     * @author         ccg
     * @param         request
     * @param         response
     * @return
     * @throws         IOException
     * Created        2017年1月17日 下午5:07:28
     */
    @RequestMapping("getCaptchaCode")
    public ModelAndView getCaptchaCode(HttpServletRequest request, HttpServletResponse response) throws IOException{
        HttpSession session = request.getSession();
        
        response.setDateHeader("Expires", 0);  
        response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");  
        response.addHeader("Cache-Control", "post-check=0, pre-check=0");  
        response.setHeader("Pragma", "no-cache");  
        response.setContentType("image/jpeg"); 
        
        //生成验证码文本
        String capText = captchaProducer.createText();  
        session.setAttribute(Constants.KAPTCHA_SESSION_KEY, capText);
        System.out.println("生成验证码文本===="+capText);
        //利用生成的字符串构建图片
        BufferedImage bi = captchaProducer.createImage(capText);
        ServletOutputStream out = response.getOutputStream();  
        ImageIO.write(bi, "jpg", out);  
        
        try {  
            out.flush();  
        } finally {  
            out.close();  
        }
        return null;
    }
    
    /**
     *             
     *                前端输入的验证码与生成的对比
     * @author         ccg
     * @param         request
     * @param         response
     * @param         captchaCode
     * Created        2017年1月17日 下午5:34:23
     */
    @RequestMapping("checkCaptchaCode")
    public void checkCaptchaCode(HttpServletRequest request, HttpServletResponse response,String captchaCode
    		,String username,String password){
        System.out.println("页面输入验证码===="+captchaCode);
        System.out.println(username+","+password);
        response.setCharacterEncoding("UTF-8");
        response.setHeader("Pragma", "No-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires", 0);
        
        String generateCode =(String) request.getSession().getAttribute(Constants.KAPTCHA_SESSION_KEY);
        String result = "";
        if(generateCode.equals(captchaCode)){
        	String hql="from Users a where a.username='"+username+"' and a.password='"+password+"'";
			List a=bs.findAll(hql, null);
			if(a.size()>0){
					Users ad=(Users) a.get(0);
					request.getSession().setAttribute("qianlogin",ad);
					result="ok";
			}else{
				result="no";
			}
        }else{
            result = "请输入正确的验证码";
        }
        PrintWriter out = null;
        try {
            out = response.getWriter();
        } catch (IOException e) {
            e.printStackTrace();
        }
        out.print(result);
        out.flush();
    }
}