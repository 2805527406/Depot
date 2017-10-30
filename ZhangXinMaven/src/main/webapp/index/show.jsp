<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/ZhangXinMaven/jquery-1.8.0.min.js"></script>
</head>
<body ng-app="app">
<a ui-sref="add">添加</a>
<ui-view></ui-view>
</body>
<script src="/ZhangXinMaven/angular.min.js"></script>
<script src="/ZhangXinMaven/angular-ui-router.min.js"></script>
<script>
var app=angular.module("app",["ui.router"]);
app.config(function($stateProvider,$urlRouterProvider){
	$stateProvider.state("add",{
		url:"/in/add",
		templateUrl:"add.jsp",
		controller:"listController"
	}).state("list",{
		url:"/in/list",
		templateUrl:"list.jsp",
		controller:"listController"
	}).state("update",{
		url:"/in/update",
		templateUrl:"add.jsp",
		controller:"listController"
	})
	$urlRouterProvider.otherwise("/in/list");
})

app.service("Service",function($http,$state){
	this.list=function($scope){
		return $http.get("/ZhangXinMaven/list.sw").then(function(response){$scope.listData=response.data},function(response){console.log("error",response)})
	}
	
	this.list2=function(){
		return $http.get("/ZhangXinMaven/list2.sw");
	}
	
	this.save=function(obj){
		console.log(obj);
		var url="/ZhangXinMaven/add.sw";
		postCfg = {
			    headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
			    transformRequest: function (data) {
			        return $.param(data);
			    }
			};
		return $http.post(url,obj,postCfg).then(function(response){
			$state.go("list");
		},function(response){console.log(response)});
	}
});

app.controller("listController",function($scope,$location,Service){
	$scope.listData=[];
	$scope.listType=[];
	$scope.listDape={
			xid:null,
			xname:"",
			hire:"",
			zhang_id:null
	};
	
	Service.list2().then(function(response){$scope.listType=response.data},function(response){console.log(response)})
	
	if($location.url()=="/in/list"){
		Service.list($scope);
	}
	
	$scope.save=function(){
		Service.save($scope.listDape);
	}
	
	if($location.url()=="/in/add"){
		
	}
})
</script>
</html>