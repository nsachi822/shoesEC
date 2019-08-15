<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="common.jsp"  %> 
<!DOCTYPE html>
<html lang="ja" xmlns="http://www.w3.org/1999/xhtml"
    xmlns:th="http://www.thymeleaf.org">
<head>
<script th:src="@{/webjars/jquery/3.3.1/jquery.min.js}"></script>
<meta charset="UTF-8">
<title>shoes market/order history</title>
</head>
<body>
<form id="csvform" method="post" th:action="@{/download/csv}">
	<table border="1">
   
	<c:forEach var="order" items="${orderList}">
	<c:if test="${order.userId == user.userId}">
	<tr>
		<th>order id</th>
		<th>order date</th>
		<th>total price</th>
		<th>arrival date</th>
	</tr>
	<tr>
		<td><c:out value="${order.orderId}"/></td>
		<td><c:out value="${order.date}"/></td>
		<td><c:out value="${order.totalPrice}"/></td>
		<td><c:out value="${order.orderDate}"/></td>	
	</tr>
	</c:if>
	</c:forEach>
	
	
	</table>
	
    <input type="hidden" name="filename"/>
    <button type="submit">送信</button>
</form>



</body>
</html>