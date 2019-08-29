<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
 
<!-- Bootstrap JavaScript(jQuery含む) -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

<!-- slide show -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/slick-carousel@1/slick/slick.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/slick-carousel@1/slick/slick.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/slick-carousel@1/slick/slick-theme.min.css">
<style>
	.hero{
    margin: 0px auto;
    width: 90%;
}
.hero img{
    height: 50vw;
    width: 100%;
    object-fit: cover;
}
</style>

</head>

<header>

<c:if test="${user==null}" var="check"/>
<c:if test="${check}">	
<nav class="navbar navbar-expand-sm navbar-light bg-light mt-3 mb-3">
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav4" aria-controls="navbarNav4" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <a class="navbar-brand" href="${pageContext.request.contextPath}/list/">shoes market</a>
        <div class="collapse navbar-collapse justify-content-end">
            <ul class="navbar-nav">
                <li class="nav-item active">
                    <a class="nav-link" href="${pageContext.request.contextPath}/login">login</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/cartlist">cart</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/member/form">create account</a>
                </li>
            </ul>
        </div>
    </nav>  
</c:if>

<c:if test="${user.userName == 'Admin'}">			
	<nav class="navbar navbar-expand-sm navbar-light bg-light mt-3 mb-3">
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav4" aria-controls="navbarNav4" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <a class="navbar-brand" href="${pageContext.request.contextPath}/list/">shoes market</a>
        <div class="collapse navbar-collapse justify-content-end">
            <ul class="navbar-nav">
            	<li class="nav-item">
                    <a class="nav-link"> welcome,<c:out value="${user.userName}"/> </a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="${pageContext.request.contextPath}/logout/sessionInvalidate">logout</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/items/addform">add items</a>
                </li>                
            </ul>
        </div>
    </nav>  
</c:if>


<c:if test="${!check and user.userName!='Admin'}">	
	<nav class="navbar navbar-expand-sm navbar-light bg-light mt-3 mb-3">
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav4" aria-controls="navbarNav4" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <a class="navbar-brand" href="${pageContext.request.contextPath}/list/">shoes market</a>
        <div class="collapse navbar-collapse justify-content-end">
            <ul class="navbar-nav">
            	<li class="nav-item">
                    <a class="nav-link"> welcome,<c:out value="${user.userName}"/> </a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="${pageContext.request.contextPath}/logout/sessionInvalidate">logout</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/cartlist">cart</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/history">orders</a>
                </li>
            </ul>
        </div>
    </nav>  
</c:if>



	

        
		<div class="hero">
			<div><img class="hero__img" src="${pageContext.request.contextPath}/img/run1.jpg" alt=""></div>
			<div><img class="hero__img" src="${pageContext.request.contextPath}/img/run2.jpg" alt=""></div>
			<div><img class="hero__img" src="${pageContext.request.contextPath}/img/run3.jpg" alt=""></div>
			<div><img class="hero__img" src="${pageContext.request.contextPath}/img/run4.jpg" alt=""></div>
		</div>
		
		<script>
		$('.hero').slick({
		    autoplay:true,
		    autoplaySpeed:4000,
		    centerMode: true,
		    centerPadding: '0px',
		});
		</script>




</header>
