<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/zzw/themes/icon.css">
<link rel="stylesheet" type="text/css" href="/zzw/themes/default/easyui.css">
<script type="text/javascript" src="/zzw/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="/zzw/jquery.easyui.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#dg").datagrid({
			url:'list.sw',
			queryParams:{
				name:"",
				sex:"A",
				ctid:0
			},
			columns:[[    
				  {field:'cid',title:'编号',width:100},
			      {field:'name',title:'姓名',width:100},    
			      {field:'sex',title:'性别',width:100},    
			      {field:'hometelnum',title:'家庭电话',width:100},
			      {field:'officetelnum',title:'办公电话',width:100},
			      {field:'company',title:'公司',width:100},
			      {field:'ctname',title:'名片',width:100,formatter:function(value,row,index){
			    	  return row.cardtype?row.cardtype.ctname:"--";
			      }}
			       ]]   
		})
	})
	
	$(function(){
		$.getJSON('list2.sw',{},function(data){
			$("<option></option>").attr("value",0).text("请选择").appendTo("#ctid")
			$.each(data,function(i,n){
				$("<option></option>").attr("value",n.ctid).text(n.ctname).appendTo("#ctid")
			})
			
		})
	})
	
	$(function(){
		$("#dg").datagrid({
			toolbar:'#f'
		})
	})
	
	function cx(){
		$("#dg").datagrid('reload',{
			name:$("input[name='name']").val(),
			sex:$("input[name='sex']:checked").val(),
			ctid:$("select[name='ctid']").val()
		})
	}
</script>
</head>
<body>
<form id="f">
姓名<input type="text" name="name">&nbsp;
性别<input type="radio" name="sex" value="A">无&nbsp;<input type="radio" name="sex" value="男">男&nbsp;<input type="radio" name="sex" value="女">女&nbsp;
<br>所属名片夹<select name="ctid" id="ctid"></select>&nbsp;
<input type="button" value="查询" onclick="cx()">
</form>
<a href="add.sw">添加</a>
<table id="dg"></table>
</body>
</html>