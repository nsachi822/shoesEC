<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="common.jsp"  %>    
<!DOCTYPE html>
<html> 
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user.css">
<meta charset="UTF-8">
<title>create account/shoes market</title>
</head>
<body>
	<div class="login-popup-wrap new_login_popup"> 
	 <div class="login-popup-heading text-center">
	 <h4><i class="fa fa-lock" aria-hidden="true"></i> create account </h4>                        
     </div>

	<form:form id="loginMember" role="form" modelAttribute="addAccountForm" action="${pageContext.request.contextPath}/member/create">
		<div class="form-group">
		<p>name</p>
		<p><form:input class="form-control" path="userName" placeholder="name"/></p>
		</div>
		<div class="form-group">
		<p>email</p>
		<p><form:input class="form-control" path="email" placeholder="email"/></p>
		</div>
		<div class="form-group">
		<p>password</p>
		<p><form:password class="form-control" path="password" placeholder="password"/></p>
		</div>
		<div class="form-group">
		<p>confirm password</p>
		<p><form:password class="form-control" path="checkPassword" placeholder="checkpassword"/>
		</div>
		<div class="form-group">
		<p>postal code</p>
		<p><form:input class="form-control" path="postalCode"  placeholder="postal code" size="10" maxlength="8" onKeyUp="AjaxZip3.zip2addr(this,'','address','address');"/>
		</div>
		<div class="form-group">
		<p>address</p>
		<p><form:input class="form-control" path="address" placeholder="address"/>
		</div>
		<div class="form-group">
		<p>phone number</p>
		<p><form:input class="form-control" path="tel" placeholder="tel"/>
		</div>
		<p><input type ="submit" value="create account" class="btn btn-default login-popup-btn">
		
	</form:form>
		</div>
		
		<script src="https://ajaxzip3.github.io/ajaxzip3.js" charset="UTF-8"></script>

</body>
</html>