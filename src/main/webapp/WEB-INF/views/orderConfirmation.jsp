<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="common.jsp"  %>   
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user.css">
<meta charset="UTF-8">
<title>order confirmation/shoes market</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
	<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1/jquery-ui.min.js"></script>
	<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1/i18n/jquery.ui.datepicker-ja.min.js"></script>
	<link rel="stylesheet" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1/themes/ui-lightness/jquery-ui.css" >

	<script>
	function disp(){

	if(window.confirm('Do you want to confirm the order?')){

		location.href = "${pageContext.request.contextPath}/orderfinished"; 

	}
	else{

		window.alert('ok.'); 
	}

}
</script>

<style>
.content{
    margin: 0 auto;
    padding: 40px;
	display: inline-block;
	
}
</style>
</head>


<body>
 <div class="login-popup-heading text-center">
	 <h4><i class="fa fa-lock" aria-hidden="true"></i> Order </h4>                        
     </div>
     
	<div class="text-center">
	<c:forEach var="cart" items="${cartList}">
	<c:if test="${cart.userId == user.userId}">
	<div class="content">
	<img src="..${pageContext.request.contextPath}/img/${cart.imagePath}" width="213" height="250" />　<br>
	<c:out value="${cart.itemName}"/> <br>
	<c:out value="${cart.brandName}"/>	<br>
	<input type = "hidden" name = "userId" value ="${cart.userId}" form ="order">
	<input type = "hidden" name = "itemId" value = "${cart.itemId}" form ="order">	
	</div>
	</c:if>
	</c:forEach>
	</div>


	<div class="login-popup-heading text-center">
	 <h4><i class="fa fa-lock" aria-hidden="true"></i> Price </h4>                        
     </div>
	<c:set var="price" value="${0}"/>
<c:forEach var="cart" items="${cartList}">
    <c:set var="price" value="${price + cart.price}" />
</c:forEach>
	
<p class="text-center">¥<fmt:formatNumber value ="${price + cart.price}" pattern="###,###" /></p>
		<input type="hidden" name="totalPrice" value= "${price + cart.price}" form="order">

	<div class="login-popup-heading text-center">
	 <h4><i class="fa fa-lock" aria-hidden="true"></i> Personal Information </h4>                        
     </div>
	
	<div class="login-popup-wrap new_login_popup">      
	<form>
	<div class="form-group">
	name: <input class="form-control" type="text" name="name" placeHolder="Name"> <br>
	</div>
	<div class="form-group">
	postal code: <input class="form-control" type ="text" name="postalCode" placeHolder="PostalCode"> <br>
	</div>
	<div class="form-group">
	address: <input class="form-control" type ="text" name="address" placeHolder="Address"> <br>
	</div>
	<div class="form-group">
	phone number: <input class="form-control" type ="text" name="phoneNumber" placeHolder="PhoneNumber"> <br>
	</div>
	<div class="form-group">
	delivery date: <input  class="form-control" type="text" name ="orderDate" value="${order.orderDate}"  id="datepicker" form="order"><br>
	</div>

	</form>
	</div>
	
	<div class="login-popup-wrap new_login_popup"> 
	<div class="login-popup-heading text-center">
	 <h4><i class="fa fa-lock" aria-hidden="true"></i> Method of Payment </h4>                        
     </div>
     						<div class="form-group">
     							<div class="text-center">
							 <input type="radio" name="responsibleOrder" checked="checked"> cash
							　<input type="radio" name="responsibleOrder" > credit card
								</div>
							</div>
							<div class="form-group">
							card number：<input class="form-control" type = "text" placeholder ="card_number">
							</div>
							<div class="form-group">
							limit(month)：	
							<select class="form-control" name="card_exp_year" required>
							<option value="">-</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>
							<option value="9">9</option>
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="12">12</option>
							</select>　
							</div>
							<div class="form-group">
							limit(year)：
							<select class="form-control" name="card_exp_month" required>
							<option value="">-</option>
							<option value="2018">2018</option>
							<option value="2019">2019</option>
							<option value="2020">2020</option>
							<option value="2021">2021</option>
							<option value="2022">2022</option>
							<option value="2023">2023</option>
							<option value="2024">2024</option>
							<option value="2025">2025</option>
							<option value="2026">2026</option>
							<option value="2027">2027</option>
							<option value="2028">2028</option>
							<option value="2029">2029</option>
							<option value="2030">2030</option>
							<option value="2031">2031</option>
							<option value="2032">2032</option>
							<option value="2033">2033</option>
							<option value="2034">2034</option>
							<option value="2035">2035</option>
							<option value="2036">2036</option>
							<option value="2037">2037</option>
							<option value="2038">2038</option>
							</select>　
							</div>
							<div class="form-group">
							card name：　<input class="form-control" type ="text" placeholder ="card_name" required>
							</div>
							<div class="form-group">
							security code： <input class="form-control" type="text" placeholder ="card_cvv" required>
							</div>
	<form:form modelAttribute="orderInfoForm" action="${pageContext.request.contextPath}/orderfinished" onClick="disp()"  id="order">
	 <button class="btn btn-default login-popup-btn" type="submit">order</button>
	</form:form>
	</div>
	 <div class="form-group text-center">
	 <a href="${pageContext.request.contextPath}/cartlist/" class="text-center">back to your cart</a>		
	</div>						
							
							
<script>
  $(function() {
    $("#datepicker").datepicker();
  });
</script>





</body>
</html>