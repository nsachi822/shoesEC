<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="common.jsp"  %> 
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user.css">
<script src="https://webjars/jquery/3.3.1/jquery.min.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>shoes market/order history</title>
</head>
<body>
	<div class="login-popup-heading text-center">
	 <h4><i class="fa fa-lock" aria-hidden="true"></i> Order History </h4>                        
     </div>
     
   	<div class="col-5 ml-3 text-center">
	<table class="table table-hover" >
	<thead>
	<tr>
		<th>order id</th>
		<th>order date</th>
		<th>total price</th>
		<th>arrival date</th>
	</tr>
	</thead>
	<c:forEach var="order" items="${orderList}">
	<c:if test="${order.userId == user.userId}">
	<tr>
		<td><c:out value="${order.orderId}"/></td>
		<td><c:out value="${order.date}"/></td>
		<td><fmt:formatNumber value="${order.totalPrice}" pattern="###,###"/></td>
		<td><c:out value="${order.orderDate}"/></td>	
	</tr>
	</c:if>
	</c:forEach>
	
	</table>
		</div>

<!-- csv download -->
<div class="login-popup-wrap new_login_popup"> 
<form id="csvform" method="post" action="${pageContext.request.contextPath}/download/csv">
	<input type="hidden" value="${order.orderId}">
	<input type="hidden" value="${order.date}">
	<input type="hidden" value="${order.totalPrice}">
	<input type="hidden" value="${order.orderDate}">
    <input type="hidden" name="filename"/>
    <button type="submit" class="btn btn-default login-popup-btn">csv</button>
</form>
</div>




</body>
</html>