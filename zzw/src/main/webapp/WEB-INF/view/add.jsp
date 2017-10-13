<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/zzw/jquery-1.8.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		$.getJSON('list2.sw',{},function(data){
			$.each(data,function(i,n){
				$("<option></option>").attr("value",n.ctid).text(n.ctname).appendTo("#ctid")
			})
			
		})
	})
</script>
</head>
<body>
<form method="POST" action="add.sw">
姓名<input type="text" name="name"><br>
性别<input type="radio" name="sex" value="男">男&nbsp;<input type="radio" name="sex" value="女">女<br>
公司<input type="text" name="company"><br>
家庭电话<input type="text" name="hometelnum"><br>
办公电话<input type="text" name="officetelnum"><br>
所属名片夹<select name="ctid" id="ctid"></select><br>
<input type="submit" value="保存"></form>
</body>
</html>