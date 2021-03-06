<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>登陆</title>
<link href="/shopGGL/css/login.css" rel="stylesheet" rev="stylesheet" type="text/css" media="all" />
<link href="/shopGGL/css/demo.css" rel="stylesheet" rev="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="/shopGGL/js/jquery1.42.min.js"></script>
<script type="text/javascript" src="/shopGGL/js/jquery.SuperSlide.js"></script>
<script type="text/javascript" src="/shopGGL/js/Validform_v5.3.2_min.js"></script>

<script>
$(function(){

$(".i-text").focus(function(){
$(this).addClass('h-light');
});

$(".i-text").focusout(function(){
$(this).removeClass('h-light');
});

$("#username").focus(function(){
 var username = $(this).val();
 if(username=='输入账号'){
 $(this).val('');
 }
});

$("#username").focusout(function(){
 var username = $(this).val();
 if(username==''){
 $(this).val('输入账号');
 }
});


$("#password").focus(function(){
 var username = $(this).val();
 if(username=='输入密码'){
 $(this).val('');
 }
});


$("#yzm").focus(function(){
 var username = $(this).val();
 if(username=='输入验证码'){
 $(this).val('');
 }
});

$("#yzm").focusout(function(){
 var username = $(this).val();
 if(username==''){
 $(this).val('');
 }
});

$(".registerform").Validform({
	tiptype:function(msg,o,cssctl){
		var objtip=$(".error-box");
		cssctl(objtip,o.type);
		objtip.text(msg);
	},
	ajaxPost:true
});
});
</script>


</head>

<body>


<div class="header">
  <h1 class="headerLogo"><a title="系统管理" target="_blank" href="#"><img alt="logo" src="/shopGGL/images/logo.jpg"></a></h1>

</div>

<div class="banner">

<div class="login-aside">
  <div id="o-box-up"></div>
  <div id="o-box-down"  style="table-layout:fixed;">
   <div class="error-box"></div>
   
   <form class="registerform" action="/shopGGL/captcha/checkCaptchaCode.sw">
   <div class="fm-item">
	   <label for="logonId" class="form-label">MISS系统登陆：</label>
	   <input type="text" value="输入账号" maxlength="100" id="username" class="i-text"   datatype="s4-18" errormsg="用户名至少4个字符,最多18个字符！"  >    
       <div class="ui-form-explain"></div>
  </div>
  
  <div class="fm-item">
	   <label for="logonId" class="form-label">登陆密码：</label>
	   <input type="password" value="" maxlength="100" id="password" class="i-text" datatype="*6-16" nullmsg="请设置密码！" errormsg="密码范围在6~16位之间！">    
       <div class="ui-form-explain"></div>
  </div>
  
  <div class="fm-item pos-r">
	   <label for="logonId" class="form-label">验证码</label>
	   <input type="text" value="输入验证码" maxlength="100" id="yzm" class="i-text yzm" nullmsg="请输入验证码！" >    
       <div class="ui-form-explain"><a href="javascript:changeCaptcha()" ><img id="changeCaptcha" src="/shopGGL/captcha/getCaptchaCode.sw" class="yzm-img"></a></div>
  </div>
  <div>
     <label for="logonId" class="form-label">还没有账号？点击<a href="/shopGGL/view/reg.html">注册</a></label>
  </div>
  <div class="fm-item">
	   <label for="logonId" class="form-label"></label>
	   <input type="button" onclick="checkCaptcha()" tabindex="4" id="send-btn" class="btn-login"/>
       <div class="ui-form-explain"></div>
  </div>
  </form>
  
  </div>

</div>

	<div class="bd">
		<ul>
			<li style="background:url(/shopGGL/themes/111.jpg) #CCE1F3 center 0 no-repeat;"><a target="_blank" href="#"></a></li>
			<li style="background:url(/shopGGL/themes/222.jpg) #BCE0FF center 0 no-repeat;"><a target="_blank" href="#"></a></li>
		</ul>
	</div>

	<div class="hd"><ul></ul></div>
</div>
<script type="text/javascript">jQuery(".banner").slide({ titCell:".hd ul", mainCell:".bd ul", effect:"fold",  autoPlay:true, autoPage:true, trigger:"click" });</script>
<script>
//获取验证码图片 
function changeCaptcha(){
    $("#changeCaptcha").attr("src","/shopGGL/captcha/getCaptchaCode.sw");
}
//验证输入的验证码 
function checkCaptcha(){
    var captchaCode = $("#yzm").val();
    if($("#yzm").val()!=""&&$("#username").val()&&$("#password").val()){
    	 $.ajax({
    	        type:'post',
    	        async : false,
    	        url:'/shopGGL/captcha/checkCaptchaCode.sw',
    	        data:{"captchaCode" : captchaCode,"username":$("#username").val(),"password":$("#password").val()},
    	        success:function(res){
    	        	var str="";
    	        	if(res=="ok"){
    	        		window.location.href="/shopGGL/view/index.jsp";
    	        	}else if(res=="no"){
    	        		str="账号或密码错误";
    	        	}else{str=res}
    	        	$(".error-box").text(str);
    	        }
    	    });
    }
   
}
</script>

<div class="banner-shadow"></div>


</body>
</html>
