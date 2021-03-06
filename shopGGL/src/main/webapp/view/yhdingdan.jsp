﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" ng-app="myApp">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>订单详情</title>
<link href="/shopGGL/css/style.css" type="text/css" rel="stylesheet" />
<link href="/shopGGL/css/style2.css" type="text/css" rel="stylesheet" />
<link href="/shopGGL/css/demo.css" rel="stylesheet" rev="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="/shopGGL/js/jquery1.42.min.js"></script>
<script type="text/javascript" src="/shopGGL/js/jquery.SuperSlide.js"></script>
<script src="/shopGGL/js/jquery-1.7.min.js" type="text/javascript"></script>
<script type="text/javascript" src="/shopGGL/js/Validform_v5.3.2_min.js"></script>

<script src="/shopGGL/js/common.js"  type="text/javascript"></script>
<style>
.Validform_checktip{margin:4px 0 12px 92px;}
.formsub label{display:inline-block; width:70px;}
.action{padding-left:92px;}
</style>
</head>
<body class="index"  ng-controller="yhdingdanController">
<div class="top_ad"><div class="w1200"><a href="#" id="close"></a></div></div>

<%@ include file="index_hand.jsp" %>


<div class="w1200">
	<div class="position"><a href="/shopGGL/view/index.jsp">首页</a> > <a href="#">会员中心</a> > <a href="#">个人资料</a></div>
    
    <div class="m_d">
    	<div class="left">
        	<dl><dt>账户管理</dt>
            <dd>
            	<a href="/shopGGL/view/member.jsp">个人资料</a>
                <a href="/shopGGL/view/pwd.jsp" class="on">修改密码</a>
                <a href="#">订单详情</a>
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
            	<dt><img src="images/ico04.jpg"/></dt>
                <dd>
					<table width="725" border="0" cellpadding="0" cellspacing="0">
                      <tr>
                        <td width="416" class="td01">尊敬的，<font>张三</font> 您好！<span>(普通会员)</span></td>
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
                    <img src="${qianlogin.img}"/>
                </dd>
            </dl>
            <dl class="dl02">
            	<dt>
                	<span>订单详情</span>
                </dt>
                <dd>
                <table width=100% border="1" cellpadding="0" cellspacing="0">
        <tr>
        <th>编号</th>
        <th>订单编号</th>
 
        <th>下单时间</th>
        <th>购买价钱</th>
        <th>收货人地址</th>
        <th>收货人姓名</th>
        <th>收货人电话</th>
        <th>商品名称</th>
        <th>订单状态</th>
        <th>操作</th>
    </tr>
         <tr ng-repeat="p in yhdingdan">
            <td>{{$index+1}}</td>
            <td>{{p.orderno}}</td>
            <td>{{p.createtime}}</td>
            <td>{{p.paymoney}}</td>
            <td>{{p.or.sendaddress}}</td>
            <td>{{p.or.sendname}}</td>
            <td>{{p.or.sendphone}}</td>
            <td><p ng-repeat="vs in p.pro_en">{{vs.proname}}</p></td>
            <td>{{p.price=="2"? "货到付款":p.price=="1"?"已付款":p.price=="3"?"已发货":"未付款"}}</td>
            <td >
             <a href="javascript:void(0)"  ng-click="qxdd(p.entryid)" >取消订单</a></td>
        </tr>
                </table>
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
<script>
$(function(){
	//$(".registerform").Validform();  //就这一行代码！;
		
	$(".registerform").Validform({
		tiptype:function(msg,o,cssctl){
			//msg：提示信息;
			//o:{obj:*,type:*,curform:*}, obj指向的是当前验证的表单元素（或表单对象），type指示提示的状态，值为1、2、3、4， 1：正在检测/提交数据，2：通过验证，3：验证失败，4：提示ignore状态, curform为当前form对象;
			//cssctl:内置的提示信息样式控制函数，该函数需传入两个参数：显示提示信息的对象 和 当前提示的状态（既形参o中的type）;
			if(!o.obj.is("form")){//验证表单元素时o.obj为该表单元素，全部验证通过提交表单时o.obj为该表单对象;
				var objtip=o.obj.siblings(".Validform_checktip");
				cssctl(objtip,o.type);
				objtip.text(msg);
			}
		}
	});
})
</script>

</body>

 <script src="/shopGGL/angular.min.js"></script>
   <script src="/shopGGL/angular-ui-router.min.js"></script>
 <script type="text/javascript">
   var myapp=angular.module("myApp",[]);
   
   myapp.service("Service",function($http){
	   postCfg = {
			    headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
			    transformRequest: function (data) {
			        return $.param(data);
			    }
			};
	   //删除订单
	   this.qx=function(eid){
		   return $http.get("/shopGGL/view/qxyhdd.sw",{params: {  
			   "eid":eid
		    }});
	   }
	   this.cxyhdd=function($scope,s){
		 //  alert($scope.realname);
		   $http.post("/shopGGL/view/yhdingdan.sw",{ 
		        "userid": s
		    },postCfg).then(function(response){
				 $scope.yhdingdan = response.data;
			 }, function(response){
				 console.log("ERRORwd:" , response);
			 });
	   }
   });

   myapp.controller("yhdingdanController",function($scope,Service){
	   var s='${qianlogin.userid}';
	   console.log('用户id',s)
	   $scope.yhdingdan=[];
	   Service.cxyhdd($scope,s);//全部查询
	   
	   $scope.qxdd=function(eid){//用户修改
		   Service.qx(eid).then(function(response){
			   var s2=response.data.result;
			   if(s2=="yes"){
				   Service.cxyhdd($scope,s);//全部查询
			   }else{
				   alert("订单已发货，不能取消订单");
				   Service.cxyhdd($scope,s);//全部查询
			   }
		   },function(response){console.log("ERROR:",response)});
		}
	  
   });
   

   
</script>
</html>


  



