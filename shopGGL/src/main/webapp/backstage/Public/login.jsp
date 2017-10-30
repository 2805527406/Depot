<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>åå°ç®¡çç³»ç»</title>
	<meta charset="UTF-8">
   <link rel="stylesheet" type="text/css" href="../Css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="../Css/bootstrap-responsive.css" />
    <link rel="stylesheet" type="text/css" href="../Css/style.css" />
    <link href="../Css/drag.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="../Js/jquery.js"></script>
    <script type="text/javascript" src="../Js/jquery.sorted.js"></script>
    <script type="text/javascript" src="../Js/bootstrap.js"></script>
    <script type="text/javascript" src="../Js/ckform.js"></script>
    <script type="text/javascript" src="../Js/common.js"></script>
    <script src="../Js/drag.js" type="text/javascript"></script>
    <style type="text/css">
        body {
            padding-top: 40px;
            padding-bottom: 40px;
            background-color: #f5f5f5;
        }

        .form-signin {
            max-width: 300px;
            padding: 19px 29px 29px;
            margin: 0 auto 20px;
            background-color: #fff;
            border: 1px solid #e5e5e5;
            -webkit-border-radius: 5px;
            -moz-border-radius: 5px;
            border-radius: 5px;
            -webkit-box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
            -moz-box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
            box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
        }

        .form-signin .form-signin-heading,
        .form-signin .checkbox {
            margin-bottom: 10px;
        }

        .form-signin input[type="text"],
        .form-signin input[type="password"] {
            font-size: 16px;
            height: auto;
            margin-bottom: 15px;
            padding: 7px 9px;
        }

    </style>  
</head>
<body>
<div class="container">

    <form class="form-signin" method="post" action="../index.html">
        <h2 class="form-signin-heading">后台登陆</h2>
        <span id="msg" style="color:red"></span>
        <input type="text" maxlength=17 name="username" id="adminname" class="input-block-level"  placeholder="账号">
        <input type="password" maxlength=17 name="password" id="password" class="input-block-level" placeholder="密码">
 		<div id="drag"></div><br>
        <p><button class="btn btn-large btn-primary" type="button" onclick="tj()">提交</button></p>
    </form>

</div>
<script type="text/javascript">
$('#drag').drag();

function tj(){
	var adminname=$("#adminname").val();
	var password=$("#password").val();
	if(adminname!=""&&password!=""){
		if($("#drag").text()=="验证通过"){
			$.post("/shopGGL/admin/login.sw",{adminname:adminname,password:password},function(data){
				if(data.ss=="no"){
					$("#msg").text("账号或密码错误");
				}
				if(data.ss=="ok"){window.location.href="/shopGGL/backstage/index.jsp"}
			});
		}else{
			$("#msg").text("请通过验证");
		}
	}else{
		$("#msg").text("账号或密码请填写完整");
	}
	
	
}
</script>

</body>
</html>