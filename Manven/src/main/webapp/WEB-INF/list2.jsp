<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/Text/themes/icon.css">
<link rel="stylesheet" type="text/css" href="/Text/themes/default/easyui.css">
<script type="text/javascript" src="/Text/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="/Text/jquery.easyui.min.js"></script>
<script type="text/javascript" src="/Text/list2.js">
//渲染表格
</script>
</head>
<body>


<table id="dg"></table>
<div id="dv">
<form id="f">
<input type="hidden" name="eid" value="0">
姓名：<input type="text" name="ename"><br>
性别：<input type="radio" name="sex" value="男">男&nbsp;<input type="radio" name="sex" value="女">女<br>
部门：<input type="text" name="dept_id" id="cc"><br>
<!-- <input type="button" value="确定" onclick="tj()"> -->
</form>
</div>

<!-- 模糊查询 -->
<form id="f2">
姓名：<input type="text" name="ename" ><br>
部门：<input type="text" name="dept_id" id="c2"><br>
<input type="button" value="确定" onclick="cx()">&nbsp;<input type="button" value="添加员工" onclick="da()">
</form>
</body>
</html>