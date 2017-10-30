<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="top">
	<div class="w1200">
	<c:if test="${empty qianlogin}">
		<div class="left">您好，欢迎光临易易城！<a href="/shopGGL/view/login3.jsp">[登录]</a> <a href="#">[注册]</a></div>
	</c:if>
	<c:if test="${not empty qianlogin }">
	<div class="left">您好，欢迎光临易易城！<a href="/shopGGL/view/login3.jsp">[${qianlogin.realname}]</a> <a href="/shopGGL/removelogin.sw">[退出]</a></div>
        <div class="right"><a href="#">我的会员中心</a>|<a href="#">收藏夹</a>|<a href="#">服务中心</a>|<a href="#">在线客服</a>|<a href="#">购物车<b>0</b>件</a></div>
        <div class="clear"></div></c:if>
    </div>	
</div>

<div class="head">
	<div class="w1200">
    	<div class="logo"><a href="#"></a></div>
        <div class="search">
        	<form action="#" class="form">
        		<input type="text" value="输入商品关键字" name="keyword" class="txt" onfocus="if(value=='输入商品关键字') {value=''}" onblur="if(value=='') {value='输入商品关键字'}"/>
                <input type="submit" value="搜索" class="sub"/>
            </form>
        	<p><a href="#">iphone6s</a>|<a href="#">面膜</a>|<a href="#">婚庆床品</a>|<a href="#">运动鞋</a>|<a href="#">眼霜</a>|<a href="#">月饼</a>|<a href="#">智能手机</a>|<a href="#">连衣裙</a></p>
        </div>
        <div class="s_r">
        	<dl>
            	<dt><p>购物车<span>0</span></p></dt>
                <dd>客服电话：<b>400-0139-038</b></dd>
            </dl>
        </div>
        <div class="clear"></div>
    </div>
</div>

<div class="menu">
	<div class="w1200">
    	<div class="item" id="nav"><a href="#" class="nav">全部商品分类</a>
        	<div class="nav_son" >
            	<ul>
                	<li ng-repeat="v in son1" class="{{v.sorimg}}"><a href="/shopGGL/jump.sw?sid={{v.sorid}}">{{v.sorname}}</a></li>
                </ul>

            </div>
        </div>
   	  <div class="item"><a href="#" class="home">商城首页</a></div>
       <!--  <div class="item"><a href="#">易易特色</a></div>
        <div class="item"><a href="#">热销产品</a></div>
        <div class="item"><a href="#">新品上市</a></div>
        <div class="item"><a href="#">精品推荐</a></div>
        <div class="item"><a href="#">生活服务</a></div> -->
    </div>
</div>


<script src="/shopGGL/angular.min.js"></script>
<script src="/shopGGL/angular-ui-router.min.js"></script>
<script>
	var app=angular.module("app",["ui.router"]);
	app.service("Service",function($http){
		this.find=function($scope){
			$http.get("/shopGGL/find2.sw").then(function(response){$scope.son1=response.data},function(response){console.log(response)})
				
		}
		this.findsrc=function($scope){
			$http.get("/shopGGL/find3.sw").then(function(response){$scope.srct=response.data},function(response){console.log(response)})
				
		}
		this.findsrc2=function($scope){
			$http.get("/shopGGL/find4.sw").then(function(response){$scope.srct2=response.data},function(response){console.log(response)})
				
		}
		this.findsrc3=function($scope){
			$http.get("/shopGGL/find5.sw").then(function(response){$scope.srct3=response.data},function(response){console.log(response)})
				
		}
	});
	app.controller("sonController",function($scope,Service){
		$scope.son1=[];
		$scope.srct=[];
		$scope.srct2=[];
		$scope.srct3=[];
		Service.find($scope);
		Service.findsrc($scope);
		Service.findsrc2($scope);
		Service.findsrc3($scope);
	});
	

</script>
    