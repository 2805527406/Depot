<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <div class="pro_cont">
    <c:forEach items="${product}" var="p">
    <c:forEach items="${p.sort2s}" var="s">
    <c:forEach items="${s.products}" var="v">
    	<div class="item">
        	<dl>
            	<dt><img src="${v.image }"/></dt>
                
            </dl>
            <p class="p01"><font>￥</font>${v.price }</font></p>
            <p class="p02"><a href="#">${v.proname }</a></p>
        </div>
       	 </c:forEach>
        </c:forEach>
       </c:forEach>
        <div class="clear"></div>
    </div>
    <script>
    	$.ajax({
    		type:"get",
    		url:"",
    		data:"",
    		success:function(data){
    			
    		}
    	});
    </script>
    