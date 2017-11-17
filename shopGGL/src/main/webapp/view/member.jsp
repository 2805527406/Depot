<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" ng-app="app">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>会员中心</title>
<link href="/shopGGL/css/style.css" type="text/css" rel="stylesheet" />
<script src="/shopGGL/js/jquery-1.7.min.js" type="text/javascript"></script>
<script src="/shopGGL/js/common.js"  type="text/javascript"></script>

</head>
<body class="index" ng-controller="sonController">
<div class="top_ad"><div class="w1200"><a href="#" id="close"></a></div></div>

<div class="top">
	<div class="w1200">
	<c:if test="${empty qianlogin}">
		<div class="left">您好，欢迎光临易易城！<a href="/shopGGL/view/login3.jsp">[登录]</a> <a href="/shopGGL/view/reg.html">[注册]</a></div>
	</c:if>
	<c:if test="${not empty qianlogin }">
	<div class="left">您好，欢迎光临易易城！<a href="/shopGGL/view/member.jsp">[${qianlogin.realname}]</a> <a href="/shopGGL/removelogin.sw">[退出]</a></div>
        <div class="right"><a href="/shopGGL/view/member.jsp">我的会员中心</a>|<a href="#">收藏夹</a>|<a href="#">服务中心</a>|<a href="#">在线客服</a>|<a href="/shopGGL/view/shopcar.jsp">购物车<b>0</b>件</a></div>
        <div class="clear"></div></c:if>
    </div>	
</div>

<div class="head">
	<div class="w1200">
    	<div class="logo"><a href="#"></a></div>
        <div class="search">
        	<form action="/shopGGL/cx.sw" class="form">
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

<div class="w1200">
	<div class="position"><a href="index.jsp">首页</a> > <a href="#">会员中心</a> > <a href="#">个人资料</a></div>
    
    <div class="m_d">
    	<div class="left">
        	<dl><dt>账户管理</dt>
            <dd>
            	<a href="#" class="on">编辑个人资料</a>
                <a href="/shopGGL/view/pwd.jsp">修改密码</a>
                <a href="/shopGGL/view/yhdingdan.jsp">订单详情</a>
                <a href="#">绑定银行卡</a>
                <a href="#">升级管理</a>
                <a href="#">账单列表</a>
                <a href="#">提现申请</a>
            </dd>
            </dl>
            <dl><dt class="dt02">排队管理</dt>
            <dd>
            	<a href="#">参与排队</a>
                <a href="#">全国排队详情</a>
                <a href="#">23通道排队列表</a>
                <a href="#">12通道排队列表</a>
                <a href="#">6通道排队列表</a>
            </dd>
            </dl>
        </div>
        <div class="right">
        	<dl class="dl01">
            	<dt><img src="/shopGGL/images/ico04.jpg"/></dt>
                <dd>
					<table width="725" border="0" cellpadding="0" cellspacing="0">
                      <tr>
                        <td width="416" class="td01">尊敬的，<font>${qianlogin.username}</font> 您好！<span>(普通会员)</span></td>
                        <td width="44">余额：</td>
                        <td width="122"><span>0.000元</span></td>
                        <td width="56" align="right">可用：</td>
                        <td width="87"><span>0.000元</span></td>
                      </tr>
                      <tr>
                        <td>还没有上传头像？ 点击<a href="#">上传头像</a><a class="save" href="#">保存</a></td>
                        <td>冻结：</td>
                        <td><span>0.000元</span></td>
                        <td align="right">已提现：</td>
                        <td><span>0.000元</span></td>
                      </tr>
                    </table>
                    <img src="${qianlogin.img}" width=117 height=118/>
                </dd>
            </dl>
            <dl class="dl02">
            	<dt>
                	<span>个人资料</span>
                </dt>
                <dd>
                <form  method="post">
                   <div class="item"><span><font>*</font>用户账号：</span><input type="text" id="userid" ng-model="username" readonly="readonly" class="txt"/></div>
                	<div class="item"><span><font>*</font>用户昵称：</span><input type="text" id="realname"  ng-model="realname" class="txt"/></div>
                	<div class="item"><span><font>*</font>用户头像：</span><input type="file" file-model="myFile" class="txt"/><div class="col-md-12">
    <img ng-src="{{imageSrc}}" style="max-width:300px;max-height:300px;margin:0 auto;display:block;" />
</div> </div>
                    <div class="item"><span><font>*</font>用户地址：</span><input type="text" id="address" ng-model="address" class="txt"/></div>
                     <div class="item"><span><font>*</font>电话：</span><input type="text"    id="phone" ng-model="phone" class="txt"/></div>
                     <div class="item"><span><font>*</font>邮政编码：</span><input type="text"  id="zip" ng-model="zip" class="txt"/></div>
                     <div class="item"><input type="button" ng-click="tj()" class="sub" value="保存"  /></div>
                </form>
                </dd>
            </dl>
        </div>
        <div class="clear"></div>
    </div>
</div>

<!--footer-->
<div class="footer">
	<div class="f_bz">
    	<div class="w1200">
            <dl class="dl01">
                <dt>正品保证</dt>
                <dd>正品护航  购物无忧</dd>
            </dl>
            <dl class="dl02">
                <dt>你消费 我买单</dt>
                <dd>返现购物商城</dd>
            </dl>
            <dl class="dl03">
                <dt>品类丰富</dt>
                <dd>品类齐全 轻松购物</dd>
            </dl>
            <dl class="dl04">
                <dt>特色服务体验</dt>
                <dd>为您呈现不一样的服务</dd>
            </dl>
            <div class="clear"></div>
        </div>
    </div>
	<div class="f_nav">
    	<div class="w1200">
            <dl>
                <dt>新手指南</dt>
                <dd>
                    <a href="#">注册新用户</a>
                    <a href="#">商品订购流程</a>
                    <a href="#">会员注册协议</a>
                </dd>
            </dl>
            <dl>
                <dt>付款方式</dt>
                <dd>
                    <a href="#">支付宝支付</a>
                    <a href="#">网上银行支付</a>
                    <a href="#">货到付款</a>
                </dd>
            </dl>
            <dl>
                <dt>常见问题</dt>
                <dd>
                    <a href="#">订单状态</a>
                    <a href="#">发票说明</a>
                </dd>
            </dl>
            <dl>
                <dt>售后服务</dt>
                <dd>
                    <a href="#">退换货政策</a>
                    <a href="#">退换货流程</a>
                    <a href="#">退款说明</a>
                    <a href="#">退换货申请</a>
                </dd>
            </dl>
            <dl>
                <dt>客服中心</dt>
                <dd>
                    <a href="#">常见问题</a>
                    <a href="#">联系客服</a>
                    <a href="#">投诉与建议</a>
                </dd>
            </dl>
            <div class="ewm"><img src="images/home/ico35.png"/></div>
            <div class="ewm"><img src="images/home/ico38.png"/></div>
            <div class="clear"></div>
        </div>
    </div>
    <div class="w1200">
        <div class="bottom">
            <a href="#">关于我们</a>|<a href="#">帮助中心</a>|<a href="#">法律声明</a>|<a href="#">用户协议</a>|<a href="#">联系我们</a>|<a href="#">人才招聘</a>|<a href="#">站点地图</a>
           
            <p>网络文化经营许可证：粤网文[2015]0295-065号<br />© 2015 深圳易易城科技网络有限公司. 粤ICP备15042543号</p>
            <p class="p02"><img src="images/home/ico25.jpg"/><img src="images/home/ico26.jpg"/><img src="images/home/ico27.jpg"/><img src="images/home/ico36.jpg"/><img src="images/home/ico37.jpg"/></p>
        </div>
    </div>
</div>
<!--float_right-->
<div class="float">
	<ul>
    	<li><a href="#" class="a01"></a></li>
        <li><a href="#" class="a02"></a></li>
        <li><a href="#" class="a03"></a></li>
        <li><a href="#" class="a04"></a></li>
    </ul>
</div>


<script src="/shopGGL/angular.min.js"></script>
<script src="/shopGGL/angular-ui-router.min.js"></script>
<script>
	var app=angular.module("app",["ui.router"]);
	app.directive('fileModel', ['$parse', function ($parse) {
        return {
            restrict: 'A',
            link: function(scope, element, attrs, ngModel) {
                var model = $parse(attrs.fileModel);
                var modelSetter = model.assign;
                element.bind('change', function(event){
                    scope.$apply(function(){
                        modelSetter(scope, element[0].files[0]);
                    });
                    //附件预览
                         scope.file = (event.srcElement || event.target).files[0];
                    scope.getFile();
                });
            }
        };
    }]);
	
	 app.factory('fileReader', ["$q", "$log", function($q, $log){
         var onLoad = function(reader, deferred, scope) {
             return function () {
                 scope.$apply(function () {
                     deferred.resolve(reader.result);
                 });
             };
         };
  
         var onError = function (reader, deferred, scope) {
             return function () {
                 scope.$apply(function () {
                     deferred.reject(reader.result);
                 });
             };
         };
  
         var getReader = function(deferred, scope) {
             var reader = new FileReader();
             reader.onload = onLoad(reader, deferred, scope);
             reader.onerror = onError(reader, deferred, scope);
             return reader;
         };
  
         var readAsDataURL = function (file, scope) {
             var deferred = $q.defer();
             var reader = getReader(deferred, scope);         
             reader.readAsDataURL(file);
             return deferred.promise;
         };
  
         return {
             readAsDataUrl: readAsDataURL  
         };
     }])
	app.service("Service",function($http){
		this.find=function($scope){
			$http.get("/shopGGL/find2.sw").then(function(response){$scope.son1=response.data},function(response){console.log(response)})		
		}
		postCfg = {
				 headers: {'Content-Type': undefined},
			        transformRequest: angular.identity
			};
		
		this.finduser=function($scope,userid){
			
			return $http.get("/shopGGL/view/toupdateuser.sw",{params: {  
		        "userid":userid
		    }}).then(function(response){$scope.username=response.data.username,
		    	$scope.realname=response.data.realname,$scope.address=response.data.address,
		    	$scope.phone=response.data.phone,$scope.zip=response.data.zip
		    },function(response){console.log(response)})	
		}
		
		this.tjp=function($scope,userid){
			var postData={
					userid:userid,
					realname:$scope.realname,
					image:$scope.imageSrc,
					address:$scope.address,
					phone:$scope.phone,
					zip:$scope.zip
			};

			var url="/shopGGL/view/updateuser.sw";
			 var fd = new FormData();
			 angular.forEach(postData, function(val, key) {
                 fd.append(key, val);
             });
			return $http.post(url,fd,postCfg);
		}
	});
	app.controller("sonController",function($scope,Service,fileReader){
		var userid="${qianlogin.userid}";
		$scope.son1=[];
		Service.find($scope);
		Service.finduser($scope,userid);
		$scope.tj=function(){
			Service.tjp($scope,userid).then(function(response){window.location.reload();
			},function(response){alert("添加失败！！！")});
		}
		
		 $scope.getFile = function () {
             fileReader.readAsDataUrl($scope.file, $scope)
                           .then(function(result) {
                               $scope.imageSrc = result;
                           });
         };
	});
	

</script>
</body>
</html>
