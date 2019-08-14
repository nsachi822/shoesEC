<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="common.jsp"  %>    
<!DOCTYPE html>
<html> 
<head>
<meta charset="UTF-8">
<title>create account/shoes market</title>
</head>
<body>
	<form:form modelAttribute="addAccountForm" action="${pageContext.request.contextPath}/member/create">
		<p>name
		<p><form:input path="userName" placeholder="name"/>
		<p>email
		<p><form:input path="email" placeholder="email"/>
		<p>password
		<p><form:password path="password" placeholder="password"/>	
		<p>confirm password
		<p><form:password path="checkPassword" placeholder="checkpassword"/>
		<p>postal code
		<p><form:input path="postalCode"  placeholder="postal code" size="10" maxlength="8" onKeyUp="AjaxZip3.zip2addr(this,'','address','address');"/>
		<p>address
		<p><form:input path="address" placeholder="address"/>
		<p>tel
		<p><form:input path="tel" placeholder="tel"/>
		
		<p><input type ="submit" value="create account">
		
	</form:form>

</body>
</html>