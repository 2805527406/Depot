<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<table border="1">
<tr><td>xid</td><td>xname</td><td>hire</td><td>zhang_id</td></tr>
<tr ng-repeat="v in listData"><td>{{v.xid}}</td><td>{{v.xname}}</td><td>{{v.hire}}</td><td>{{v.zhang.zname}}</td></tr>
</table>