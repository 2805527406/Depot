<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>产品列表</title>
<link href="/shopGGL/css/style.css" type="text/css" rel="stylesheet" />
<script src="/shopGGL/js/jquery-1.7.min.js" type="text/javascript"></script>
<script src="/shopGGL/js/common.js"  type="text/javascript"></script>

</head>
<body class="index">
<div class="top_ad"><div class="w1200"><a href="#" id="close"></a></div></div>

<div class="top">
	<div class="w1200">
		<div class="left">您好，欢迎光临易易城！<a href="#">[登录]</a> <a href="#">[注册]</a></div>
        <div class="right"><a href="#">我的会员中心</a>|<a href="#">收藏夹</a>|<a href="#">服务中心</a>|<a href="#">在线客服</a>|<a href="#">购物车<b>0</b>件</a></div>
        <div class="clear"></div>
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
        	<div class="nav_son">
            	<ul>
                	<li class="li01"><a href="#">功能产品</a></li>
                    <li class="li02"><a href="#">服装箱包</a></li>
                    <li class="li03"><a href="#">美妆护肤</a></li>
                    <li class="li04"><a href="#">珠宝饰品</a></li>
                    <li class="li05"><a href="#">数码家电</a></li>
                    <li class="li06"><a href="#">食品茶酒</a></li>
                    <li class="li07"><a href="#">运动体育</a></li>
                    <li class="li08"><a href="#">家居家纺</a></li>
                    <li class="li09"><a href="#">生活服务</a></li>
                    <li class="li10"><a href="#">其他</a></li>
                </ul>
            </div>
        </div>
    	<div class="item"><a href="#" class="home">商城首页</a></div>
        <div class="item"><a href="#">易易特色</a></div>
        <div class="item"><a href="#">热销产品</a></div>
        <div class="item"><a href="#">新品上市</a></div>
        <div class="item"><a href="#">精品推荐</a></div>
        <div class="item"><a href="#">生活服务</a></div>
    </div>
</div>


<div class="w1200">
	<div class="position"><a href="/shopGGL/view/index.jsp">首页</a> > <a href="/shopGGL/jump.sw?sid=${product[0].sort.sorid}">${product[0].sort.sorname}</a></div>
    
    <div class="c_nav">
   		<c:forEach items="${product}" var="p">
        <div class="item"><span>${p.csorname}</span>
        <p>
        <c:forEach items="${p.sort2s}" var="s">
        <a href="/shopGGL/jump.sw?csorid=${s.s2id}&sid=${product[0].sort.sorid}">${s.s2name}</a>
        </c:forEach>
        </p><div class="clear"></div>
        </div>
         </c:forEach>
    </div>
    
    <div class="order"><a href="#" class="cur">综合排序</a><a href="#">销量</a><a href="#">价格</a><a href="#">评论数</a><span><font>共1889件商品  <strong><b>1</b>/50</strong></font><a href="#">></a><a href="#"><</a></span>
    <div class="clear"></div>
    </div>
    <div class="pro_cont" id="asdf">
    <c:forEach items="${pro}" var="p">
    	<a href="/shopGGL/jump2.sw?proid=${p.proid }"><div class='item'><dt><img src='${p.image }'/></dt></dl><p class='p01'><font>￥</font><font>${p.price }</font></p><p class='p02'><a href='#'>${p.proname }</a></p></div></a>

       </c:forEach>
        <div class="clear"></div>
    </div>
	<div class="page">
    	<a href="#" class="pre">上一页</a>
        <a href="#" class="on">1</a>
        <a href="#">2</a>
        <a href="#">3</a>
        <a href="#">4</a>
        <a href="#">5</a>
        <a href="#">6</a>
        <span>...</span>
        <a href="#" class="next">下一页></a>
        共50页 到第<input type="text" value="1" />页  <a href="#" class="sub">确定</a>
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
