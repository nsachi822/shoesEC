<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cart/shoes market</title>
</head>
<body>
<h1>shopping cart</h1>
	<c:forEach var ="cart" items="${cartList}">
	<img src="..${pageContext.request.contextPath}/img/${cart.imagePath}" width="213" height="250" />　<br>
	name: <c:out value="${cart.itemName}"/><br>
	brand: <c:out value="${cart.brandName}"/><br>
	quantity: <c:out value="${cart.quantity}"/><br>
	total price: ¥<fmt:formatNumber value="${cart.price}" pattern="###,###" /><br>
	
	<form:form modelAttribute="itemOrderForm" action="${pageContext.request.contextPath}/cartdelete">
		<input type ="hidden" name ="cartId" value="${cart.cartId}">
		<input type ="submit" value="Delete">
	</form:form>	
	
		<input type = "hidden" name = "cartId" value ="${cart.cartId}" form ="cart">
		<input type = "hidden" name = "userId" value ="${cart.userId}" form ="cart">
		<input type = "hidden" name = "itemId" value = "${cart.itemId}" form ="cart">
		<input type = "hidden" name = "itemName" value ="${cart.itemName}" form ="cart">
		<input type = "hidden" name = "imagePath" value ="${cart.imagePath}" form ="cart">
		<input type = "hidden" name = "brandName" value = "${cart.brandName}" form ="cart">
		<input type = "hidden" name = "price" value= "${cart.price}" form ="cart">
		<input type  ="hidden" name = "quantity" value ="${cart.quantity}" form ="cart">
	
	</c:forEach>
	
	<form:form modelAttribute="itemOrderForm" action="${pageContext.request.contextPath}/confirmorder" id="cart">
	 <button type="submit">order confirmation</button>
	</form:form>
	<button type="submit" onclick="location.href='${pageContext.request.contextPath}/list/'">check other products</button>
	
</body>
</html>