﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

<%@ include file="index_hand.jsp" %>

<div class="w1200">
	<div class="position"><a href="index.jsp">首页</a> > <a href="#">会员中心</a> > <a href="#">个人资料</a></div>
    
    <div class="m_d">
    	<div class="left">
        	<dl><dt>账户管理</dt>
            <dd>
            	<a href="#" class="on">个人资料</a>
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
                    <img src="${qianlogin.img}" width=117 height=118/>
                </dd>
            </dl>
            <dl class="dl02">
            	<dt>
                	<span>个人资料</span>
                </dt>
                <dd>
                	<div class="item"><span><font>*</font>用户真实姓名：</span><input type="tex" class="txt"/></div>
                    <div class="item"><span><font>*</font>用户身份证号码：</span><input type="tex" class="txt"/></div>
                    <div class="item"><span><font>*</font>性别：</span><input type="radio" value="" name="sex"/> 男&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" value="" name="sex"/> 女</div>
                	<div class="item"><span style="float:left"><font>*</font>开户行：</span>
                     <div class="xlc"><input name="aaa" class="txt-xl li01" value="储蓄卡|213213"/><span>更换银行 V</span>
                          <ul>
                              <li class="li01">储蓄卡|111111</li>
                              <li class="li02">储蓄卡|222222</li>
                              <li class="li03">储蓄卡|213213</li>
                          </ul>
                      </div>
                      <div class="clear"></div>
                     </div>
                     <div class="item"><span><font>*</font>开户人姓名：</span><input type="tex" class="txt"/></div>
                     <div class="item"><span><font>*</font>银行卡号：</span><input type="tex" class="txt"/></div>
                     <div class="item"><span><font>*</font>电子邮箱：</span><input type="tex" class="txt"/> <em>请输入邮箱地址，邮箱将用于找回密码。</em></div>
                     <div class="item"><span><font>*</font>联系地址：</span><select><option value="广东省">广东省</option></select><select><option value="深圳市">深圳市</option></select><input type="tex" class="txt"/></div>
                     <div class="item"><input type="submit" class="sub" value="保存"/></div>
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


</body>
</html>