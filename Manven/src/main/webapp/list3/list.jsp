<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<table border="1">
<tr><td>编号</td><td>姓名</td><td>性别</td><td>修改日期</td><td>部门</td><td>操作</td></tr>
<tr ng-repeat="v in listData"><td>{{v.eid}}</td>
<td>{{v.ename}}</td><td>{{v.sex}}</td><td>{{v.hire}}</td><td>{{v.dept.dname}}</td>
<td><button ui-sref="edit({eid:v.eid})">修改</button></td></tr>
</table>