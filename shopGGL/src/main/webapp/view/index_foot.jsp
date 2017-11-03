<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<ul>
    	<li><a href="javascript:void(0)" onclick="shopcar()" class="a01"></a></li>
        <li><a href="javascript:void(0)" onclick="gongneng()" class="a02"></a></li>
        <li><a href="javascript:void(0)" onclick="gongneng()" class="a03"></a></li>
        <li><a href="javascript:void(0)" onclick="gongneng()" class="a04"></a></li>
    </ul>
<script>
function shopcar(){
	var s='<%=session.getAttribute("qianlogin")==null ?"":"aa"%>';
	console.log(s);
	if(!s){
		alert("请先登录");
	}else{
		window.location.href="/shopGGL/view/shopcar.jsp";
	}
}

function gongneng(){
	alert("逗你玩呢，这个功能我还没做");
}
</script>