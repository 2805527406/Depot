<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<form>
xname:<input type="text" ng-model="listDape.xname"><br>
hire:<input type="text" ng-model="listDape.hire"><br>
zhang:<select ng-model="listDape.zhang_id" ng-options="x.zid as x.zname for x in listType"></select><br>
<input type="submit" value="提交" ng-click="save()">
</form>