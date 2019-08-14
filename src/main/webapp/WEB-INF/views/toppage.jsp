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
<title>HOME/shoes market</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<style>
*{
    box-sizing: border-box;
    margin: 0;
    padding: 0;
}
.content{
    margin: 0 auto;
    padding: 40px;
}
.modal{
    display: none;
    height: 100vh;
    position: fixed;
    top: 0;
    width: 100%;
}
.modal__bg{
    background: rgba(0,0,0,0.8);
    height: 100vh;
    position: absolute;
    width: 100%;
}
.modal__content{
    background: #fff;
    left: 50%;
    padding: 40px;
    position: absolute;
    top: 50%;
    transform: translate(-50%,-50%);
    width: 30%;
}
</style>
</head>
<body>
<h2>shoes market</h2>

	<!-- item一覧表示 -->
	<div class="content">
	<c:forEach var="items" items="${itemsList}">	 
	<img src="../img/${items.imagePath}" width="213" height="250" /><br>
    <a class="js-modal-open" data-target="${items.itemName}" href=""  ><c:out value="${items.itemName}"/> </a><br>
	<c:out value="${items.brandName}"/><br>
	</c:forEach>	
    </div>
    
    <!-- item詳細表示・hiddenで値を送信 -->
    <c:forEach var="items" items="${itemsList}">
    <div id="${items.itemName}" class="modal js-modal">
        <div class="modal__bg js-modal-close"></div>
        <div class="modal__content">
        	<form:form modelAttribute="itemOrderForm"
							action="${pageContext.request.contextPath}/addcart">
            <p><img src="../img/${items.imagePath}" width="213" height="250" /></p>
            <input type ="hidden" name="imagePath" value="${items.imagePath}">
            <p>product: <c:out value="${items.itemName}"/></p>
            <input type ="hidden" name="itemName" value="${items.itemName}"> 
            <input type ="hidden" name="itemId" value="${items.itemId}">           
            <p>brand: <c:out value="${items.brandName}"/></p>
            <input type = "hidden" name="brandName" value="${items.brandName}">
            <p>price: ¥<fmt:formatNumber value="${items.price}" pattern="###,###" /></p>
            <input type="hidden" name="price" value="${items.price}">
            size: <input type="radio" value="S" name="size">S <input type ="radio" value="M" name="size"> M <br>
            quantity: <select name="quantity">
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
							</select>　<br>
            
            <input type = "submit" value="add to cart">            
            <input type ="hidden" name = "userId" value="${user.userId}">
            </form:form>          
            <a class="js-modal-close" href="">close</a>
        </div><!--modal__inner-->
    </div><!--modal-->
    </c:forEach>
    
    <script>
    $(function(){
        $('.js-modal-open').each(function(){
            $(this).on('click',function(){
                var target = $(this).data('target');
                var modal = document.getElementById(target);
                $(modal).fadeIn();
                return false;
            });
        });
        $('.js-modal-close').on('click',function(){
            $('.js-modal').fadeOut();
            return false;
        }); 
    });
    </script>
	
</body>
</html>