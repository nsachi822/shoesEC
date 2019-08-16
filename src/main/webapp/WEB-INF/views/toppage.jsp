<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="common.jsp"  %> 
   
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user.css">
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
	display: inline-block;
	
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

	
	 <div class="login-popup-heading text-center">
	 <h4><i class="fa fa-lock" aria-hidden="true"></i> Goods </h4>                        
     </div>
	<!-- item一覧表示 -->
	<div class="text-center">
	<c:forEach var="items" items="${itemsList}">	 
	<div class="content">
	<p><img src="../img/${items.imagePath}" width="213" height="250"/>
    <p><a class="js-modal-open" data-target="${items.itemName}" href=""  ><c:out value="${items.itemName}"/> </a>
	<p><c:out value="${items.brandName}"/>
    </div>
	</c:forEach>
	</div>
    
    <!-- item詳細表示・hiddenで値を送信 -->
    <c:forEach var="items" items="${itemsList}">
    <div id="${items.itemName}" class="modal js-modal">
        <div class="modal__bg js-modal-close"></div>
        <div class="modal__content">
  			<div class="text-center">
        	<form:form modelAttribute="itemOrderForm"
							action="${pageContext.request.contextPath}/addcart">
    <div class="login-popup-heading text-center">
	 <h4><i class="fa fa-lock" aria-hidden="true"></i> About </h4>                        
     </div>
            <p><img src="../img/${items.imagePath}" width="213" height="250" /></p>
            <input type ="hidden" name="imagePath" value="${items.imagePath}">
            <p><c:out value="${items.itemName}"/></p>
            <input type ="hidden" name="itemName" value="${items.itemName}"> 
            <input type ="hidden" name="itemId" value="${items.itemId}">           
            <p><c:out value="${items.brandName}"/></p>
            <input type = "hidden" name="brandName" value="${items.brandName}">
            <p><fmt:formatNumber value="${items.price}" pattern="###,###" /></p>
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
            
            <input type ="hidden" name = "userId" value="${user.userId}">
            <input type = "submit" value="add to cart" class="btn btn-default login-popup-btn">            
            </form:form>  
            <div class="form-group text-center">        
            <a class="js-modal-close" href="" class="text-center">close</a>
            </div>
            </div>
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