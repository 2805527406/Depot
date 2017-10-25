<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>提交订单信息</title>
<link href="/shopGGL/css/style.css" type="text/css" rel="stylesheet" />
<script src="/shopGGL/js/jquery-1.7.min.js" type="text/javascript"></script>
<script src="/shopGGL/js/common.js"  type="text/javascript"></script>

</head>
<body class="index">


    <div class="shopcar" widht=600 height=800>
    
        <dl class="info">
        	
            <dd>
            	<div class="item"><span><font>*</font>所在地区：</span><select><option value="广东省">广东省</option></select><select><option value="深圳市">深圳市</option></select><input type="tex" class="txt"/></div>
            	<div class="item"><span><font>*</font>邮政编码：</span><input type="tex" class="txt"/></div>
                <div class="item">
                	<table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="8%"><span><font>*</font>详细地址：</span></td>
                        <td width="92%"><textarea></textarea></td>
                      </tr>
                    </table>
                </div>
                <div class="item"><span><font>*</font>收货人姓名：</span><input type="tex" class="txt"/></div>
                <div class="item"><span><font>*</font>手机：</span><input type="tex" class="txt"/></div>
                <div class="item"><span><font>*</font>电话：</span><input type="tex" class="txt"/></div>
                <div class="item"><input type="submit" class="sub" value="保存收货人信息"/></div>
            </dd>
       </dl>
 
</div>
</body>
</html>
