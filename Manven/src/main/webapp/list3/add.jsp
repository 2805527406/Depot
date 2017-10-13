<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<form>
姓名：<input type="text" ng-model="listDape.ename"><br>
性别：<input type="radio" ng-model="listDape.sex" name="sex" value="男">男&nbsp;<input type="radio" ng-model="listDape.sex" name="sex" value="女">女<br>
部门：<select  ng-model="listDape.dept_id" ng-options="x.did as x.dname for x in listType">
</select>
<input type="submit" value="确定" ng-click="save()">
</form>