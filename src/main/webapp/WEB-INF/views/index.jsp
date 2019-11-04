

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<title>Shopping Cart</title>
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
		<div>
			<h1 style="text-align: center;">All Product</h1>
		</div>

		<c:if test="${not empty message }">
			<div class="row">
				<div class="col-sm-12">
					<div class="alert alert-danger">${message}</div>
				</div>
			</div>
		</c:if>

		<a href="${pageContext.request.contextPath}/cart">
			<button style="float: right !important;" class="btn btn-primary">
				<i class="fas fa-shopping-cart"></i> Cart(${lenght})
			</button>
		</a>
		<div class="row">
			<c:forEach var="product" items="${ListProduct}">

				<div class="col-sm-4">
					<h3>${product.name}</h3>
					<a href="detail/${product.id}"> <img
						src="<c:url value="/resources/images/${product.id}.jpg" /> "
						width="100" />
					</a>
					<div class="caption">
						<input type="hidden" name="idCategory"
							value="${product.category.id}">
						<p>${product.description}</p>
						<p>${product.price}</p>
						<form action='add' method="get">
							<input type="hidden" name="id" value="${product.id}" /> <input
								type="hidden" name="quantity" value="1" /> <input type="submit"
								value="Add to cart" class="btn btn-primary">
						</form>
					</div>

				</div>

			</c:forEach>
		</div>
	</div>
</body>
</html>