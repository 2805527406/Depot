<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html ng-app="app">
<head>
    <title></title>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="../Css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="../Css/bootstrap-responsive.css" />
    <link rel="stylesheet" type="text/css" href="../Css/style.css" />
    <script type="text/javascript" src="../Js/jquery.js"></script>
    <script type="text/javascript" src="../Js/jquery.sorted.js"></script>
    <script type="text/javascript" src="../Js/bootstrap.js"></script>
    <script type="text/javascript" src="../Js/ckform.js"></script>
    <script type="text/javascript" src="../Js/common.js"></script>
    <style type="text/css">
        body {
            padding-bottom: 40px;
        }
        .sidebar-nav {
            padding: 9px 0;
        }

        @media (max-width: 980px) {
            /* Enable use of floated navbar text */
            .navbar-text.pull-right {
                float: none;
                padding-left: 5px;
                padding-right: 5px;
            }
        }


    </style>
</head>
<body ng-controller="addProController">
<form>
<table class="table table-bordered table-hover definewidth m10">
    <tr>
        <td width="10%" class="tableleft">商品名称</td>
        <td><input type="text" ng-model="proname"/></td>
    </tr>
    <tr>
        <td class="tableleft">商品图片</td>
        <td><input type="text" ng-model="image"/></td>
    </tr>  
    <tr>
        <td class="tableleft">商品价格</td>
        <td>
        <input ng-model="price" type=text t_value="" o_value="" onkeypress="if(!this.value.match(/^[\+\-]?\d*?\.?\d*?$/))this.value=this.t_value;else this.t_value=this.value;if(this.value.match(/^(?:[\+\-]?\d+(?:\.\d+)?)?$/))this.o_value=this.value" onkeyup="if(!this.value.match(/^[\+\-]?\d*?\.?\d*?$/))this.value=this.t_value;else this.t_value=this.value;if(this.value.match(/^(?:[\+\-]?\d+(?:\.\d+)?)?$/))this.o_value=this.value" onblur="if(!this.value.match(/^(?:[\+\-]?\d+(?:\.\d+)?|\.\d*?)?$/))this.value=this.o_value;else{if(this.value.match(/^\.\d+$/))this.value=0+this.value;if(this.value.match(/^\.$/))this.value=0;this.o_value=this.value}"></td>
    </tr>  
    <tr>
        <td class="tableleft">详细信息</td>
        <td><textarea rows="5" cols="50" ng-model="decript"></textarea></td>
    </tr> 
    <tr>
        <td class="tableleft">商品类别</td>
        <td>类别1：<select ng-model="sdo" ng-options="v.sorid as v.sorname for v in sort" ng-click="csor()"><option value="0" >请选择</></select>&nbsp; 
  <br> 类别3：<select ng-model="sdo3" ng-options="v.csorid as v.csorname for v in csort" ng-click="csor2()"><option value="0">请选择</></select>&nbsp;  类别4：<select ng-options="v.s2id as v.s2name for v in sort2" ng-model="csorid"><option value="0">请选择</></select>&nbsp;
 </td>
    </tr> 
    <tr>
        <td class="tableleft">首页类别</td>
        <td><select ng-options="v.gid as v.gname for v in grou" ng-model="grid"><option value="0">请选择</></select>&nbsp;</td>
    </tr> 
    <tr>
        <td class="tableleft">商品数量</td>
        <td><input ng-model="count" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"/></td>
    </tr> 
    <tr>
        <td class="tableleft">状态</td>
        <td>
            <input type="radio" name="status" value="1" checked/> 启用
            <input type="radio" name="status" value="0"/> 禁用
        </td>
    </tr>
    <tr>
        <td class="tableleft"></td>
        <td>
            <input type="button" class="btn btn-primary" ng-click="tj()" value="保存">&nbsp;&nbsp;<button type="button" class="btn btn-success" name="backid" id="backid">返回列表</button>
        </td>
    </tr>
</table>
</form>
</body>
</html>
<script>
    $(function () {       
		$('#backid').click(function(){
				window.location.href="index.html";
		 });

    });
</script>

<script src="/shopGGL/angular.min.js"></script>
<script src="/shopGGL/angular-ui-router.min.js"></script>
<script>
	var app=angular.module("app",["ui.router"]);
	 app.config(['$locationProvider', function($locationProvider) {  
         // $locationProvider.html5Mode(true);  
         $locationProvider.html5Mode({
          enabled: true,
          requireBase: false
        });
        }]);
	app.service("Service",function($http){
		this.cx1=function(){
			return $http.get("/shopGGL/admin/find2.sw");
		}
		this.cx2=function(){
			return $http.get("/shopGGL/admin/find3.sw");
		}
		this.csor=function(id){
			return $http.get("/shopGGL/admin/find4.sw",{params: {  
		        "id":id  
		    }} );
		}
		
		this.csor2=function(id){
			return $http.get("/shopGGL/admin/find5.sw",{params: {  
		        "id":id
		    } });
		}
		postCfg = {
			    headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
			    transformRequest: function (data) {
			        return $.param(data);
			    }
			};
		
		this.tjp=function($scope,proid){
			var url="/shopGGL/admin/addProduct.sw";
			if(proid){
				url="/shopGGL/admin/editProduct.sw";
			}
			$http.post(url,{
				proid:proid,csorid:$scope.csorid,decript:$scope.decript,grid:$scope.grid,image:$scope.image,price:$scope.price,proname:$scope.proname,count:$scope.count
			},postCfg).then(function(response){window.location.href="index.html";},function(response){alert("添加成功！！！")});
		}
		this.edit=function(id){
			return $http.get("/shopGGL/admin/edit.sw",{params: {  
		        "id":id
		    } });
		}
	});
	app.controller("addProController",function($scope,Service,$location){
		$scope.sort=[];//大分类
		$scope.grou=[];//热门分类
		$scope.csort=[];//二级分类
		$scope.sort2=[];//三级分类
		Service.cx1().then(function(response){
			$scope.sort=response.data;
			$scope.sdo=0;
		},function(response){console.log("ERROR:",response)});
		Service.cx2().then(function(response){
			$scope.grou=response.data;
			$scope.grid=0;
		},function(response){console.log("ERROR:",response)});
		$scope.csor=function(){
			$scope.csort=[];
			$scope.sort2=[];
			Service.csor($scope.sdo).then(function(response){
				$scope.csort=response.data;
				$scope.sdo3=0;
			},function(response){console.log("ERROR:",response)});
		}
		
		$scope.csor2=function(){
			$scope.sort2=[];
			Service.csor2($scope.sdo3).then(function(response){
				$scope.sort2=response.data;
				$scope.csorid=0;
			},function(response){console.log("ERROR:",response)});
		}

		var proid=$location.search().proid;
		if(proid){
			Service.edit(proid).then(function(response){
				$scope.decript=response.data.decript;$scope.grid=response.data.grid;$scope.image=response.data.image;$scope.price=response.data.price;$scope.proname=response.data.proname;$scope.count=response.data.count;
				$scope.sdo=response.data.csort.parent_csort.sort.sorid;//大类别
				var sdo3=response.data.csort.parent_csort.csorid;
				Service.csor($scope.sdo).then(function(response){
					$scope.csort=response.data;
					$scope.sdo3=sdo3;
				},function(response){console.log("ERROR:",response)});
				var csorid=response.data.csorid;
				Service.csor2(sdo3).then(function(response){
					$scope.sort2=response.data;
					$scope.csorid=csorid;
				},function(response){console.log("ERROR:",response)});
			},function(response){console.log("ERROR:",response)});
		}
		//修改传的值有问题，可以通过地址传值
		$scope.tj=function(){
			console.log("我调用了没");
			Service.tjp($scope,proid);
		}
	});
</script>