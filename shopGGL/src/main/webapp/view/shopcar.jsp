<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" ng-app="app">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>我的购物车</title>
<link href="/shopGGL/css/style.css" type="text/css" rel="stylesheet" />
<script src="/shopGGL/js/jquery-1.7.min.js" type="text/javascript"></script>
<script src="/shopGGL/js/common.js"  type="text/javascript"></script>

</head>
<body class="index" ng-controller="sonController">
<div class="top_ad"><div class="w1200"><a href="#" id="close"></a></div></div>
<%@ include file="index_hand.jsp" %>

<div class="w1200">
	<div class="position"><a href="#">首页</a> > <a href="#">购物车</a></div>
    
    <div class="shopcar">
    	<div class="shop_lc"><span class="sp01">我的购物车</span><span class="sp02">填写提交信息表单</span><span class="sp03">在线支付</span></div>
      	<dl>
        	<dt><span>我的购物车</span></dt>
            <dd>
            	<table width="100%" cellpadding="0" cellspacing="0" border="0">
                  <tr class="tr_t">
                    <td width="4%"><input type="checkbox" checked="checked"/></td>
                    <td width="4%">全选</td>
                    <td width="35%">商品</td>
                    <td width="26%">单价</td>
                    <td width="6%">数量</td>
                    <td width="14%">小计</td>
                    <td width="11%">操作</td>
                  </tr>
                  <c:forEach items="${cart.cartItems}" var="cart">
                  <tr class="tr_c">
                    <td><input type="checkbox" checked="checked"/></td>
                    <td colspan="2">
                    	<table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td width="15%"><img src="${cart.product.image }"/></td>
                            <td width="85%"><a href="javascript:void(0)" class="title">${cart.product.proname }</a></td>
                          </tr>

                        </table>
                    </td>
                    <td class="price">￥${cart.product.price }</td>
                    <td>${cart.count }</td>
                    <td class="price">￥${cart.subtatal }</td>
                    <td><a href="/shopGGL/removeCart.sw?pid=${cart.product.proid }" onclick="return confirm('确定删除？');">删除</a></td>
                  </tr>
                  </c:forEach>
                  <tr class="tr_d">
                    <td colspan="7">
                    	<table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td width="75%"><span class="del"><a href="#"></a></span></td>
                            <td width="11%">  <strong></strong>  件</td>
                            <td width="14%" class="all_price">合计：<font>￥${cart.total }</font></td>
                          </tr>
                        </table>
                    </td>
                  </tr>
                </table>
                <div class="clear"></div>
                
   		  </dd>
        </dl>
        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="go_tb">
         <tr>
           <td width="20%"><a href="#" class="go_buy">继续购物</a></td>
           <td width="63%">&nbsp;</td>
           <td width="17%" align="right"><a href="/shopGGL/jump3.sw" class="code">结 算</a></td>
         </tr>
        </table>
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


</body>
</html>
