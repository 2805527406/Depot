<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/Text/jquery-1.8.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		//部门下拉列表渲染
		$.getJSON("list2.sw",{},function(data){
			$("<option></option>").attr("value",0).text("请选择").appendTo("#dept2");
			$.each(data,function(i,v){
				$("<option></option>").attr("value",v.did).text(v.dname).appendTo("#dept");
				$("<option></option>").attr("value",v.did).text(v.dname).appendTo("#dept2");
			})
		})
	})
	
	//准备修改
	function toupdate(eid){
		$.getJSON("toupdate.sw",{eid:eid},function(data){
			$("input[name='eid']").val(data.eid);
			$("input[name='ename']").val(data.ename);
			$("input[name='sex']").each(function(){
				if(this.value==data.sex){
					this.checked=true;
				}
			});
			$("select[name='dept_id']").val(data.dept_id);
		})
	}
	
	//表单提交
	function sub(){
		var eid=$("input[name='eid']").val();
		if(eid){
			//修改
			$("#f").attr("action","update.sw").submit();
		}else{
			//添加
			$("#f").attr("action","add.sw").submit();
		}
	}
</script>
</head>
<body>
<form method="post" id="f2" action="list.sw">
姓名<input type="text" name="ename"><br>
部门<select name="dept_id" id="dept2"></select><br>
<input type="submit" value="确定">
</form>
<table border="1">
<tr><td>编号</td><td>姓名</td><td>性别</td><td>修改日期</td><td>部门</td><td>操作</td></tr>
<c:forEach items="${list}" var="s">
<tr><td>${s.eid }</td><td>${s.ename }</td><td>${s.sex }</td><td>${s.hire }</td><td>${s.dept.dname }</td><td>
<a href="del/${s.eid}.sw">删除</a>&nbsp;<a href="javascript:void(0)" onclick="toupdate(${s.eid})">修改</a></td></tr>
</c:forEach>
</table>
<form method="post" id="f">
<input type="hidden" name="eid">
姓名<input type="text" name="ename"><br>
性别<input type="radio" name="sex" value="男">男&nbsp;<input type="radio" name="sex" value="女">女<br>
部门<select name="dept_id" id="dept"></select><br>
<input type="button" value="确定" onclick="sub()">
</form>
</body>
</html>