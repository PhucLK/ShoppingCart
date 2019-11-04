

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Detail product</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="<c:url value="/resources/style_shopping.css" />" />
</head>
<body>
	<jsp:include page="menu.jsp"></jsp:include>
	<div class="container" id="body">
		<h1>Detail Product</h1>

		<div class="row">
			<div class="col-sm-4">
				<h3>${product.name}</h3>
				<a href="detail/${product.id}"> <img class="img-fluid"
					id="detail"
					src="<c:url value="/resources/images/${product.id}.jpg" /> " />
				</a>
				<div class="caption">
					<input type="hidden" name="idCategory"
						value="${product.category.id}">
					<p>${product.description}</p>
					<p>${product.price}</p>
					<input type="button" value="Add to cart" class="btn btn-primary">
				</div>

			</div>
		</div>
	</div>
</body>
</html>