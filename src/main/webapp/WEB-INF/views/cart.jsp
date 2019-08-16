<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="common.jsp"  %>     
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user.css">
<meta charset="UTF-8">
<title>cart/shoes market</title>
<style>
.content{
    margin: 0 auto;
    padding: 40px;
	display: inline-block;
	
}
</style>
</head>
<body>
<div class="login-popup-wrap new_login_popup">
<div class="login-popup-heading text-center">
	 <h4><i class="fa fa-lock" aria-hidden="true"></i> Cart </h4>                        
     </div>
     
	<div class="text-center">
	<c:forEach var ="cart" items="${cartList}">
	<c:if test="${cart.userId == user.userId}">
	<div class="content">
	<img src="..${pageContext.request.contextPath}/img/${cart.imagePath}" width="213" height="250" />　<br>
	name: <c:out value="${cart.itemName}"/><br>
	brand: <c:out value="${cart.brandName}"/><br>
	quantity: <c:out value="${cart.quantity}"/><br>
	total price: ¥<fmt:formatNumber value="${cart.price}" pattern="###,###" /><br>
	
	<form:form modelAttribute="itemOrderForm" action="${pageContext.request.contextPath}/cartdelete">
		<input type ="hidden" name ="cartId" value="${cart.cartId}">
		<input type ="submit" value="Delete" class="btn btn-default login-popup-btn">
	</form:form>	
	
		<input type = "hidden" name = "cartId" value ="${cart.cartId}" form ="cart">
		<input type = "hidden" name = "userId" value ="${cart.userId}" form ="cart">
		<input type = "hidden" name = "itemId" value = "${cart.itemId}" form ="cart">
		<input type = "hidden" name = "itemName" value ="${cart.itemName}" form ="cart">
		<input type = "hidden" name = "imagePath" value ="${cart.imagePath}" form ="cart">
		<input type = "hidden" name = "brandName" value = "${cart.brandName}" form ="cart">
		<input type = "hidden" name = "price" value= "${cart.price}" form ="cart">
		<input type  ="hidden" name = "quantity" value ="${cart.quantity}" form ="cart">
		</div>
	</c:if>
	</c:forEach>
	</div>
	
	<form:form modelAttribute="itemOrderForm" action="${pageContext.request.contextPath}/confirmorder" id="cart">
	 <button type="submit" class="btn btn-default login-popup-btn" >next</button>
	</form:form>
	<div class="form-group text-center">
	<a href="${pageContext.request.contextPath}/list/">check other products</a>
	</div>
	</div>
</body>
</html>