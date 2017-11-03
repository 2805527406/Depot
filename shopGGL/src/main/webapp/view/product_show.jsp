﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" ng-app="app">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" name="viewport"/>
<title>产品详情</title>
<link href="/shopGGL/css/style.css" type="text/css" rel="stylesheet" />

	
<script src="/shopGGL/js/jquery-1.7.min.js" type="text/javascript"></script>
<script src="/shopGGL/js/common.js"  type="text/javascript"></script>

<SCRIPT LANGUAGE="JavaScript">
<!-- Hide
function killErrors() {
return true;
}

</SCRIPT>
</head>
<body class="index" ng-controller="sonController">
<div class="top_ad"><div class="w1200"><a href="#" id="close"></a></div></div>
<%@ include file="index_hand.jsp" %>
<div class="w1200 product">
	<div class="position"><a href="/shopGGL/view/index.jsp">首页</a> > <a href="/shopGGL/jump.sw?sid=${ppp.csort.parent_csort.sort.sorid}">${ppp.csort.parent_csort.sort.sorname}</a> > <a href="/shopGGL/jump.sw?sid=${ppp.csort.parent_csort.sort.sorid}&csorid=${ppp.csort.s2id}">${ppp.csort.s2name}</a></div>
    
    <link rel="stylesheet" href="css/detail.css" type="text/css" />
	<script src="js/jquery-1.5.1.js" type="text/javascript"></script>
    <script src="js/jquery.jqzoom.js" type="text/javascript"></script>
    <script src="js/use_jqzoom.js" type="text/javascript"></script>
    
    <script src="js/jquery.livequery.js" type="text/javascript"></script>
    <script src="js/switchImg.js" type="text/javascript"></script>
    <!--one-->
            <div class="one">
            	<div class="left">
                    <!--放大镜-->
                	<div class="pro_detail">
                        <div class="pro_detail_left">
                            <div class="jqzoom"><img src="${ppp.image}" class="fs" alt="" jqimg="<img src='images/img/img39.jpg' height='800' width='800'>" id="bigImg"/></div>
             
                        </div>
                    </div>
                    <!--放大镜-->
                </div>
                <div class="right">
                	<div class="title">${ppp.proname}</div>
                    <div class="info">${ppp.decript}</div>
                    
                    <div class="price">
                    	<table width="100%" height="61" border="0" cellpadding="0" cellspacing="0">
                          <tr>
                            <td width="8%">售价：</td>
                            <td width="41%"><b>￥${ppp.price}</b></td>

                          </tr>
                        </table>
                  	</div>
                    <div class="send"><small>配送至：</small><input value="北京朝阳区三环以内" name="" /><span>由 <u>奥凡尼旗舰店</u>从广东佛山市发货，并提供售后服务。</span><div class="clear"></div></div>
                    
                	<div class="size"><small>选择尺码：</small><p><span>进口厚皮 双人位+贵妃位+边几</span><span class="on">进口厚皮 双人位+贵妃位+边几</span><span>进口厚皮 全套系列</span><span>进口厚皮 双+贵+单+边几</span></p><div class="clear"></div></div>
                   <form method="get" id="subcart">
                    
                    <div class="number">
                        <small>数量：</small>
                        <input type="hidden" name="proid" value="${ppp.proid}"/>
                       <input type="text" maxlength=3 value="1" name="total" class="num"/>
                      
        				<span class="jian"></span><span class="jia"></span>
        					       <div class="ku"><p>件&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p></div>
                        <div class="clear"></div>
                    </div>
                    <div class="sale"><small>销量：</small><span class="on">${ppp.salecount}</span><div class="clear"></div></div>
                    <div class="sub"><a href="javascript:void(0)" onclick="subCart()" class="btn02"></a></div>
               </form>
               
                </div>
                <div class="clear"></div>
            </div>
          
            
            <div class="share w1200">
               <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                            <td width="13%">收藏商品 已有<b>0</b>人气</td>
                            <td width="87%">
                                <div class="bdsharebuttonbox"><a href="#" class="bds_more" data-cmd="more"></a><a href="#" class="bds_qzone" data-cmd="qzone"></a><a href="#" class="bds_tsina" data-cmd="tsina"></a><a href="#" class="bds_tqq" data-cmd="tqq"></a><a href="#" class="bds_renren" data-cmd="renren"></a><a href="#" class="bds_weixin" data-cmd="weixin"></a></div>
                <script>window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"","bdMini":"2","bdPic":"","bdStyle":"0","bdSize":"16"},"share":{},"image":{"viewList":["qzone","tsina","tqq","renren","weixin"],"viewText":"分享到：","viewSize":"16"},"selectShare":{"bdContainerClass":null,"bdSelectMiniList":["qzone","tsina","tqq","renren","weixin"]}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];</script><span>分享到:</span>
                    </td>
                 </tr>
                </table>
			</div>
            
            <!--two-->
            <div class="two">
            	<div class="left">
                <dl>
                	<dt>相关产品</dt>
                    <dd>
                    	<div class="item">
                        	<ul>
                                <li><img src="images/ico36.jpg" width="160" height="160"/></li>
                                <li class="title"><a href="#">西铁城citizen石英表</a></li>
                                <li class="price">￥6542.00</li>
                            </ul>
                        </div>
                        <div class="item">
                        	<ul>
                                <li><img src="images/ico36.jpg" width="160" height="160"/></li>
                                <li class="title"><a href="#">西铁城citizen石英表</a></li>
                                <li class="price">￥6542.00</li>
                            </ul>
                        </div>
                        <div class="item">
                        	<ul>
                                <li><img src="images/ico36.jpg" width="160" height="160"/></li>
                                <li class="title"><a href="#">西铁城citizen石英表</a></li>
                                <li class="price">￥6542.00</li>
                            </ul>
                        </div>
                        <div class="item">
                        	<ul>
                                <li><img src="images/ico36.jpg" width="160" height="160"/></li>
                                <li class="title"><a href="#">西铁城citizen石英表</a></li>
                                <li class="price">￥6542.00</li>
                            </ul>
                        </div>
                        <div class="item">
                        	<ul>
                                <li><img src="images/ico36.jpg" width="160" height="160"/></li>
                                <li class="title"><a href="#">西铁城citizen石英表</a></li>
                                <li class="price">￥6542.00</li>
                            </ul>
                        </div>
                    </dd>
                   </dl>
                </div>
                <div class="right">
                <dl>
                	<dt><a class="cur" href="#a01">商品详情</a><a href="#a02">规格参数</a><a href="#a03">累计评价<font>（2654）</font></a><a href="#a04">售后保障</a><a href="#a05">易易城消费返现规则</a></dt>
                    <dd>
                    	<a name="a01"></a>
                    	<ul>
                        	<li>品牌: Card fina/卡菲纳</li>
                            <li>型号: FPC0062-2</li>
                            <li>是否可预售: 是</li>
                            <li>款式定位: 品质奢华型</li>
                            <li>毛重: 60</li>
                            <li>颜色分类: 头层真皮（珠光咖）</li>
                            <li>尺寸: 1500mm*1900mm 1500mm*2000mm </li>
                            <li>是否带储物空间: 否</li>
                            <li>是否带软靠: 是</li>
                            <li>形状: 方形</li>
                            <li>皮革材质: 真皮</li>
                            <li>真皮类型: 接触面真皮</li>
                            <li>是否可定制: 否</li>
                            <li>风格: 简约现代</li>
                            <li>产地: 广东省</li>
                            <li>城市: 佛山市</li>
                            <li>材质: 木</li>
                            <li>可送货/安装: 全部城市</li>
                            <div class="clear"></div>
                        </ul>
                    </dd> 
                    <div class="pro-info"><img src="images/ico38.jpg"/></div>
                    <dd class="dd02">
                    	<div class="dd02_t">累计评价 </div>
                        <!--评价-->
						<div class="rate-header rate-header-tags">
                        <div class="rate-score">
                            <h4>与描述相符</h4>
                            <strong>4.8</strong>
                            <p><span class="s48"></span></p>
                        </div>
                        <div class="rate-tag-box">
                            <div class="rate-tag-label">
                                <span>大家都写到</span>
                            </div>
                            <div class="rate-tag-list" style="height: 70px;">
                                <div class="rate-tag-inner">
                                    <span class="tag-posi">很舒服(189)</span>
                                    <span class="tag-posi">整体不错(160)</span>
                                    <span class="tag-posi">面料好(92)</span>
                                    <span class="tag-posi">尺码很准(52)</span>
                                    <span class="tag-posi">版式好(45)</span>
                                    <span class="tag-posi">颜色很好(36)</span>
                                    <span class="tag-posi">颜色一般(20)</span>
                                    <span class="tag-posi">尺码很准(52)</span>
                                    <span class="tag-posi">版式好(45)</span>
                                    <span class="tag-posi">颜色很好(36)</span>
                                    <span class="tag-posi">颜色一般(20)</span>
                                </div>
                            </div>
                        </div>
                        <div class="clear"></div>
                    </div>
                    </dd>
                    <dd class="dd03">
                    <div class="pj_list">
                        <div class="pj_one">
                            <dl>
                            	<dt><a class="cur" href="#a01">全部<font>（2654）</font></a><a href="#a02">好评<font>（2154）</font></a><a href="#a03">中评<font>（2654）</font></a><a href="#a04">差评<font>（16）</font></a><a href="#a05">有图评价<font>（919）</font></a></dt>
                            </dl>
                            <div class="clear"></div>
                        </div>
                        <div class="pj_two">
                            <div class="pj_item">
                                <div class="two1">初次评价：<br />06.16</div>
                                <div class="two2"><p>燕窝已经收到了，包装的很精美，品相非常不错，而且每盏都有溯源码，比商城买的实惠，发货速度很给力，炖煮后有淡淡的蛋清味，吃完后再来追评哈</p>
                                <p><img src="images/ico36.jpg"/><img src="images/ico36.jpg"/></p>
                                </div>
                                <div class="two3">s******88(匿名)<br /><img src="images/ico37.jpg"/><img src="images/ico37.jpg"/><img src="images/ico37.jpg"/></div>
                                <div class="clear"></div>
                            </div>
                            <div class="pj_item">
                                <div class="two1">初次评价：<br />06.16</div>
                                <div class="two2"><p>燕窝已经收到了，包装的很精美，品相非常不错，而且每盏都有溯源码，比商城买的实惠，发货速度很给力，炖煮后有淡淡的蛋清味，吃完后再来追评哈</p>
                                <p><img src="images/ico36.jpg"/><img src="images/ico36.jpg"/></p>
                                </div>
                                <div class="two3">s******88(匿名)<br /><img src="images/ico37.jpg"/><img src="images/ico37.jpg"/><img src="images/ico37.jpg"/></div>
                                <div class="clear"></div>
                            </div>
                            <div class="pj_item">
                                <div class="two1">初次评价：<br />06.16</div>
                                <div class="two2"><p>燕窝已经收到了，包装的很精美，品相非常不错，而且每盏都有溯源码，比商城买的实惠，发货速度很给力，炖煮后有淡淡的蛋清味，吃完后再来追评哈</p>
                                <p><img src="images/ico36.jpg"/><img src="images/ico36.jpg"/></p>
                                </div>
                                <div class="two3">s******88(匿名)<br /><img src="images/ico37.jpg"/><img src="images/ico37.jpg"/><img src="images/ico37.jpg"/></div>
                                <div class="clear"></div>
                            </div>
                            <div class="pj_item">
                                <div class="two1">初次评价：<br />06.16</div>
                                <div class="two2"><p>燕窝已经收到了，包装的很精美，品相非常不错，而且每盏都有溯源码，比商城买的实惠，发货速度很给力，炖煮后有淡淡的蛋清味，吃完后再来追评哈</p>
                                <p><img src="images/ico36.jpg"/><img src="images/ico36.jpg"/></p>
                                </div>
                                <div class="two3">s******88(匿名)<br /><img src="images/ico37.jpg"/><img src="images/ico37.jpg"/><img src="images/ico37.jpg"/></div>
                                <div class="clear"></div>
                            </div>
                            <div class="pj_item">
                                <div class="two1">初次评价：<br />06.16</div>
                                <div class="two2"><p>燕窝已经收到了，包装的很精美，品相非常不错，而且每盏都有溯源码，比商城买的实惠，发货速度很给力，炖煮后有淡淡的蛋清味，吃完后再来追评哈</p>
                                <p><img src="images/ico36.jpg"/><img src="images/ico36.jpg"/></p>
                                </div>
                                <div class="two3">s******88(匿名)<br /><img src="images/ico37.jpg"/><img src="images/ico37.jpg"/><img src="images/ico37.jpg"/></div>
                                <div class="clear"></div>
                            </div>
                            
                            <!--page-->
                            <div class="page"><a href="#">上一页</a><a href="#" class="on">1</a><a href="#">2</a><a href="#">3</a><a href="#">4</a><a href="#">5</a><a href="#">6</a><a href="#">7</a><a href="#">7</a><a href="#">...</a><a href="#">下一页</a></div>
                            <!--page2-->
                        </div>
                    </div>
                    </dd>
                   </dl>
                   
                   <div class="shenmin">
                   	<p><b>安全提示：</b>交易中请勿使用阿里旺旺以外的聊天工具沟通，不要接收可疑文件和不要点击不明来源的链接，支付前核实好域名和支付详情。 淘宝不会以订单有问题，让您提供任何银行卡、密码、手机验证码！遇此情况请终止通话或举报到淘宝网 常见骗术<br />推荐安全软件：  阿里钱盾阿里钱盾  UC浏览器UC浏览器  腾讯电脑管家腾讯电脑管家  360网盾360网盾 安全软件中心</p>

					<p><b>内容申明：</b>淘宝为第三方交易平台及互联网信息服务提供者，淘宝（含网站、客户端等）所展示的商品/服务的标题、价格、详情等信息内容系由店铺经营者发布，其真实性、准确性和合法性均由店铺经营者负责。淘宝提醒用户购买商品/服务前注意谨慎核实。如用户对商品/服务的标题、价格、详情等任何信息有任何疑问的，请在购买前通过阿里旺旺与店铺经营者沟通确认；淘宝存在海量店铺，如用户发现店铺内有任何违法/侵权信息，请立即向淘宝举报并提供有效线索。</p>
                   </div>
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
	<%@ include file="index_foot.jsp" %>
</div>

<script type="text/javascript">
function subCart(){
	var s='<%=session.getAttribute("qianlogin")==null ?"":"aa"%>';
	console.log(s);
	if(!s){
		alert("请先登录");
	}else{
		$("#subcart").attr("action","/shopGGL/cart.sw").submit();
	}
}

$(function(){
var imgWid = 0 ;
var imgHei = 0 ; //变量初始化
var big = 6.2;//放大倍数
$(".pj_item .two2 p img").hover(function(){
$(this).stop(true,true);
var imgWid2 = 0;var imgHei2 = 0;//局部变量
imgWid = $(this).width();
imgHei = $(this).height();
imgWid2 = imgWid * big;
imgHei2 = imgHei * big;
$(this).css({"z-index":2,"position":"relative"});
$(this).animate({"width":imgWid2,"height":imgHei2,"margin-left":-imgWid2/3,"margin-top":-imgWid2/3});
},function(){$(this).stop().animate({"width":imgWid,"height":imgHei,"margin-left":0,"margin-top":0,"z-index":1});
});
})
</script>
</body>
</html>
