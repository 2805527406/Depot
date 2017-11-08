<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" ng-app="app">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>提交订单信息</title>
<link href="/shopGGL/css/style.css" type="text/css" rel="stylesheet" />
<script src="/shopGGL/js/jquery-1.9.1.min.js" type="text/javascript"></script>
<script src="/shopGGL/js/common.js"  type="text/javascript"></script>


</head>
<body class="index" ng-controller="sonController">
<div class="top_ad"><div class="w1200"><a href="#" id="close"></a></div></div>
<%@ include file="index_hand.jsp" %>
<div class="w1200">
	<div class="position"><a href="/shopGGL/view/index.jsp">首页</a> > <a href="#">购物车</a></div>
    
    <div class="shopcar">
    	<div class="info_lc"><span class="sp01">我的购物车</span><span class="sp02">填写提交信息表单</span><span class="sp03">在线支付</span></div>
      	<h3><a href="javascript:void(0)" id="showeee">添加新地址</a></h3>
      	<div id="show_info">
      	
        	<dl class="info">
        	<dt><span>添加收货地址</span></dt>
            <dd>
            	<div class="item"><span><font>*</font>所在地区：</span><select id="addres1"><option value="广东省">广东省</option></select><select id="addres2"><option value="深圳市">深圳市</option></select><input id="addres3" type="tex" class="txt"/><input type="hidden" id="orderid" value="0"/></div>
            	<div class="item"><span><font>*</font>邮政编码：</span><input id="zip" type="tex" class="txt"/></div>
                <div class="item">
                	<table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="8%"><span><font>*</font>详细地址：</span></td>
                        <td width="92%"><textarea id="addres4"></textarea></td>
                      </tr>
                    </table>
                </div>
                <div class="item"><span><font>*</font>收货人姓名：</span><input id="sendname" type="tex" class="txt"/></div>
                <div class="item"><span><font>*</font>手机：</span><input id="sendphone" type="tex" class="txt"/></div>
                <div class="item"><a href="javascript:void(0)" class="sub" onclick="saveor()">保存收货人信息</a><a href="javascript:void(0)" class="sub" onclick="guanbi()">关闭</a></div>
            </dd>
        </dl>
        </div> 
        
        
        <div id="show_addres">
       		 <dl>
        	<dt><span>确认收货地址</span></dt>
            <dd>
            <form id="form_or" method="post">
            	<table width="100%" cellpadding="0" cellspacing="0" border="0">
                  <tr class="tr_t">
                    <td width="4%"><input type="radio" /></td>
                    <td width="20%">姓名</td>
                    <td width="17%">电话</td>
                    <td width="12%">邮编</td>
                    <td width="35%">地址</td>
                    <td width="12%">操作</td>
                  </tr>
                  <c:forEach items="${order}" var="ors">
 				<tr class="tr_c">
                    <td><input type="radio"  name="orderid" value="${ors.orderid }"/></td>
                 	<td>${ors.sendname }</td>
                    <td>${ors.sendphone }</td>
                    <td class="price">${ors.zip }</td>
                    <td class="price">${ors.sendaddress }</td>
                    <td><a href="/shopGGL/removeAddres.sw?orderid=${ors.orderid }">删除</a>&nbsp;
                    	<a href="javascript:void(0)" onclick="editAddres(${ors.orderid})">编辑</a>
                    </td>
                  </tr>
                  </c:forEach>
                </table>
                </form>
                <div class="clear"></div>   
   		  </dd>
        </dl>
   		</div>
        
        
        <dl>
        	<dt><span>确认订单信息</span></dt>
            <dd>
            	<table width="100%" cellpadding="0" cellspacing="0" border="0">
                  <tr class="tr_t">
                  	<td width="2%">&nbsp;</td>
                    <td width="48%">商品</td>
                    <td width="25%">单价</td>
                    <td width="13%">数量</td>
                    <td width="12%">小计</td>
                  </tr>
                  <c:forEach items="${cart.cartItems}" var="c">
                  <tr class="tr_c">
                  	<td>&nbsp;</td>
                    <td>
                    	<table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td width="15%"><img src="${c.product.image }"/></td>
                            <td width="85%"><a href="#" class="title">${c.product.proname }</a></td>
                          </tr>
                        </table>
                    </td>
                    <td class="price">￥${c.product.price }</td>
                    <td>${c.count }</td>
                    <td class="price">￥${c.subtatal }</td>
                  </tr>
                  </c:forEach>
                  <tr class="tr_d">
                    <td colspan="7">
                    	<table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                          	<td width="3%">&nbsp;</td>
                            <td width="6%"></td>
                            <td width="75%"></td>
                            <td width="6%">应付金额：</td>
                            <td width="10%" class="all_price"><font>￥${cart.total}</font></td>
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
           <td width="20%"><a href="/shopGGL/view/index.jsp" class="go_buy">继续购物</a></td>
           <td width="63%">&nbsp;</td>
           <td width="17%" align="right"><a href="javascript:void(0)" onclick="subor()" class="code">结 算</a></td>
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
<script>
function showss(){
	var div = $("#show_info");
    if ( div.css("display") === "none" ) {
        div.show();
        $("#show_addres").hide();
    } else {
        div.hide();
        $("#show_addres").show();
    }
    $("#sendphone").val("");
	$("#sendname").val("");
	$("#zip").val("");
	$("#addres1").val("");
	$("#addres2").val("");
	$("#addres3").val("");
	$("#addres4").val("");
	$("#orderid").val(0);
}

$("#showeee").click(function(){
	 showss();

});
$(document).ready(function(){
	$("#show_info").hide();
});

function guanbi(){
	 showss();
}

function saveor(){
	var addres=$("#addres1").val()+" "+$("#addres2").val()+" "+$("#addres3").val()+" "+$("#addres4").val();
	var zip=$("#zip").val();
	var sendname=$("#sendname").val();
	var sendphone=$("#sendphone").val();
	var orderid=$("#orderid").val();
	var url="/shopGGL/addorder.sw";
	if(orderid!=null && orderid!="0"){
		url="/shopGGL/editorder.sw"
	}
	$.post(url,{
		orderid:orderid,
		sendaddress:addres,
		sendname:sendname,
		sendphone:sendphone,
		zip:zip
	},function(data){
		alert(data);
		window.location.reload();
	});
}

function editAddres(orderid){
	$.get("/shopGGL/editAddres.sw",{
		orderid:orderid
	},function(data){
		console.log(data);
		showss();
		var str=data.sendaddress;
		var strs=new Array();
		strs=str.split(" ");
		for(var i=0;i<strs.length;i++){
			var s=i+1;
			var st="#addres"+s;
			$(st).val(strs[i]);
		}
		$("#sendphone").val(data.sendphone);
		$("#sendname").val(data.sendname);
		$("#zip").val(data.zip);
		$("#orderid").val(data.orderid);
	});
}

function subor(){
	var orderid=$("#form_or input:radio[name='orderid']:checked").val();
	if(orderid){
		$("#form_or").attr("action","/shopGGL/code.sw").submit();
	}else{
		alert("请选择地址");
	}
	
}



</script>
</html>
