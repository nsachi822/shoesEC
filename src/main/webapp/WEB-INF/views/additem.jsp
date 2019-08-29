<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="common.jsp"  %>  
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user.css">
<meta charset="UTF-8">
<title>add item /shoes market</title>
<script type="text/javascript" src="https://js/jQuery-3.2.0.min.js"></script>
			<style>
			label {
			color: #212529;	
			font-size: 13px; 
			background-color: #f5f1f1;
			padding: 3px;	
			border-radius: 8px;	
			cursor:pointer;	
			}
			label > .form-control{
			display:none;	
			}
			#file_upload{
			display:none;
			}	
			</style>
</head>
<body>
	<div class="login-popup-wrap new_login_popup"> 
	 <div class="login-popup-heading text-center">
	 <h4><i class="fa fa-lock" aria-hidden="true"></i> new item </h4>                        
     </div>
    
    <form:form id="loginMember" role="form" modelAttribute="addItemForm" enctype="multipart/form-data" action="${pageContext.request.contextPath}/items/insert">
		<div class="form-group">
		<p>item name</p>
		<p><form:input class="form-control" path="itemName" placeholder="name" required="required" oninvalid="this.setCustomValidity('required contents')"/></p>
		</div>
		<div class="form-group">
		<p>price</p>
		<p><form:input class="form-control" path="price" placeholder="price" required="required" oninvalid="this.setCustomValidity('required contents')" /></p>
		</div>
		<div class="form-group">
		<p>brand name</p>
		<p><form:input class="form-control" path="brandName" placeholder="brandName" required="required" oninvalid="this.setCustomValidity('required contents')"/></p>
		</div>
		<div class="form-group">
		<p>image</p>
		<label for="file_upload">select item image
		<form:input id="file" type="file" class="form-control" path="imageFile" placeholder="image" accept="imagePath/*" required="required" oninvalid="this.setCustomValidity('required contents')" onchange="$('#fake_text_box').val($(this).val())" />
		<input type="text" id="file_upload" value="ファイル選択" onClick="$('#file').click();">
		</label>
		<div>
		<input type="text" id="fake_text_box" value="" size="35" readonly onClick="$('#file').click();">
		</div>
		<br>
		<img id ="result" width="193" height="130" />
		</div>
		
		<p><input type ="submit" value="add new item" class="btn btn-default login-popup-btn">
		
	</form:form>
		</div>
		
		<script>
		window.addEventListener('DOMContentLoaded',function(){
			document.getElementById("file").addEventListener('change',function(e){
				var input = document.getElementById("file").files[0];
				var reader = new FileReader();
				reader.addEventListener('load',function(e){
					document.getElementById("result").src=reader.result;
				},true);
				reader.readAsDataURL(input);
			},true);
		});
		</script>
</body>
</html>