<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="common.jsp"  %> 
<!DOCTYPE html>
<html>

<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user.css">
<meta charset="UTF-8">
<title>Login/shoes market</title>
<style></style>
</head>
<body>
	<div class="login-popup-wrap new_login_popup"> 
	 <div class="login-popup-heading text-center">
	 <h4><i class="fa fa-lock" aria-hidden="true"></i> Login </h4>                        
     </div>
	<form:form id="loginMember" role="form" modelAttribute="loginForm" action ="${pageContext.request.contextPath}/logincheck">
		<div class="form-group">
		<form:input class="form-control" id="user_id" path="email" placeholder="Email" required autoforcus />
		</div>
		 <div class="form-group">
		<form:password class="form-control" id="password" path="password" placeholder="Password"/>
		</div>
		<input type="submit" value="login" class="btn btn-default login-popup-btn">
	</form:form>
		 <div class="form-group text-center">	
		<a href = "${pageContext.request.contextPath}/member/form" class="text-center">create new account</a></div>
		</div>


</body>
</html>