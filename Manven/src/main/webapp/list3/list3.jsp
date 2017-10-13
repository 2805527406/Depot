<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body ng-app="myapp">
<a ui-sref="add">添加</a>
<ui-view></ui-view>
</body>
<script src="/Manven/jquery-1.8.0.min.js"></script>
<script src="/Manven/angular.min.js"></script>
<script src="/Manven/angular-ui-router.min.js"></script>
<script>
	var myapp=angular.module("myapp",["ui.router"]);
	myapp.config(function($stateProvider,$urlRouterProvider){
		console.log("jifsdf");
		$stateProvider.state("add",{
			url:"/adddd",
			templateUrl:"add.jsp",
			controller:"listController"
		}).state("list",{
			url:"/listtt",
			templateUrl:"list.jsp",
			controller:"listController"
		}).state("edit",{
			params:{eid:0},
			url:"/edittt",
			templateUrl:"add.jsp",
			controller:"listController"
		});
		$urlRouterProvider.otherwise("/listtt");
	});
	
	
	//----------------------------------------------------------------
	myapp.service("Service",function($http,$state){//方法
		this.list2=function(){
			return $http.get("/Manven/list2.sw",{});
		}
	
		this.find=function($scope){
			return $http.get('/Manven/elist22.sw').then(function(response){
				console.log(response.data);
				$scope.listData=response.data
			}, function(response){
				console.log(response.data);
			});
		}
		
		this.load=function($scope,eid){
			return $http.get("/Manven/toupdate.sw",{params:{eid:eid}}).then(
					function(response){$scope.listDape=response.data;
									  /*  $scope.listDape.dept=null; */
									   console.log($scope.listDape);
					},
					function(response){console.log(response.data);});
		}
		
		this.save=function(obj){
			console.log("表单数据：",obj);
			if(obj.eid){
				url = "/Manven/eupdate.sw";
			}else{
				url = "/Manven/eadd.sw";
			}
			delete obj["dept"];
			//将参数传递的方式改成form
			postCfg = {
			    headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
			    transformRequest: function (data) {
			        return $.param(data);
			    }
			};
			//发送post请求，获取数据
			 $http.post(url, obj, postCfg).then(function(response){$state.go("list");},
					 function(response){console.log("回应失败：",response)});
		}
	});
	
	
	
	//*-----------------------------------------------------------------------
	//--------------------------------------------------------------------
	myapp.controller("listController",function($location,$scope,$stateParams,Service){
		$scope.listType=[];//下拉列表数据
		$scope.listData=[];//列表数据
		$scope.listDape={
				eid:null,
				ename:"",
				sex:"",
				dept_id:null
		};//表单对象
		Service.list2().then(function(response){
			console.log("下拉列表接收到的数据：",response.data);
			$scope.listType=response.data;
		},function(response){console.log(response)});
		
		$scope.save=function(){
			console.log($scope.listDape);
			Service.save($scope.listDape);
		}
		console.log("地址:",$location.url())
		if($location.url()=="/listtt"){
			console.log("列表1");
			Service.find($scope);
		}
		if($location.url()=="/edittt"){
			Service.load($scope,$stateParams.eid);
		}
		
		console.log("下拉列表的数据：",$scope.listType);
	});
</script>
</html>