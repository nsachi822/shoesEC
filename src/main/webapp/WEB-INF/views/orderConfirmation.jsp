<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="common.jsp"  %>   
<!DOCTYPE html>
<html>
<head>
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


</head>
<body>
<h1>order confirmation</h1>

<h2>your orders</h2>
	<c:forEach var="cart" items="${cartList}">
	<img src="..${pageContext.request.contextPath}/img/${cart.imagePath}" width="213" height="250" />　<br>
	<c:out value="${cart.itemName}"/> <br>
	<c:out value="${cart.brandName}"/>	<br>
	<input type = "hidden" name = "userId" value ="${cart.userId}" form ="order">
	<input type = "hidden" name = "itemId" value = "${cart.itemId}" form ="order">	
	</c:forEach>


<h2>sub total</h2>

	<c:set var="price" value="${0}"/>
<c:forEach var="cart" items="${cartList}">
    <c:set var="price" value="${price + cart.price}" />
</c:forEach>
<p>¥<fmt:formatNumber value ="${price + cart.price}" pattern="###,###" /></p>
		<input type="hidden" name="totalPrice" value= "${price + cart.price}" form="order">

<h2>the destination address form</h2>
<form>
	name: <input type="text" name="name" placeHolder="Name"> <br>
	postal code: <input type ="text" name="postalCode" placeHolder="PostalCode"> <br>
	address: <input type ="text" name="address" placeHolder="Address"> <br>
	phone number: <input type ="text" name="phoneNumber" placeHolder="PhoneNumber"> <br>
	
	delivery date: <input type="text" name ="orderDate" value="${order.orderDate}"  id="datepicker" form="order"><br>
	

</form>

<h2>Method of payment</h2>
							 <input type="radio" name="responsibleOrder" checked="checked"> cash
							　<input type="radio" name="responsibleOrder" > credit card
							<br>
							card number：<input type = "text" placeholder ="card_number"><br>
							limit：	
							<select name="card_exp_year" required>
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
							</select>　month
							
							<select name="card_exp_month" required>
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
							</select>　year
							<br>
							card name：　<input type ="text" placeholder ="card_name" required><br>
							security code： <input type="text" placeholder ="card_cvv" required><br>
				
	<form:form modelAttribute="orderInfoForm" action="${pageContext.request.contextPath}/orderfinished" onClick="disp()"  id="order">
	 <button type="submit">order</button>
	</form:form>
	<button type="submit" onclick="location.href='${pageContext.request.contextPath}/cartlist/'">back to your cart</button>			
							
							
							
<script>
  $(function() {
    $("#datepicker").datepicker();
  });
</script>





</body>
</html>