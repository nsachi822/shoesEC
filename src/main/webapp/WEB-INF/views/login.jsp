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
<title>Login/shoes market</title>
</head>
<body>
	<form:form modelAttribute="loginForm" action ="${pageContext.request.contextPath}/logincheck">
	
		<form:input path="email" placeholder="Email"/><br>
		<form:password path="password" placeholder="Password"/><br>
		<input type="submit" value="login">
		<br>		
		
		<a href = "${pageContext.request.contextPath}/member/form">create new account</a>	
	</form:form>

</body>
</html>