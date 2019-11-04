

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<title>Your Cart</title>
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
		<h1>Check Out</h1>

		<div class="row">

			<table class="table table-hover">
				<thead class="thead-light">
					<tr>
						<th style="text-align: left !important;">Product</th>
						<th style="text-align: left !important;">Decription</th>
						<th>Price</th>
						<th>Quantity</th>
						<th>Amout</th>
						<th colspan="2">Action</th>
					</tr>
				</thead>
				<c:forEach var="orderDetail" items="${ListOrderDetail}">
					<tr>
						<td style="text-align: left !important;">${orderDetail.product.name}</td>
						<td style="text-align: left !important;">${orderDetail.product.description}</td>
						<td>${orderDetail.product.price}</td>
						<td>
							<form action="${pageContext.request.contextPath}/update" method="get">
								<input type="hidden" name="id" value="${orderDetail.product.id}"> <input
									style="width: 50px !important;" type="text" name="quantity"
									value="${orderDetail.quantity}"> <input
									type="submit" value="Update" class="btn btn-primary">
							</form>
						</td>
						<td>${orderDetail.amout}</td>

						<td>
							<form action="${pageContext.request.contextPath}/delete" method="post">
								<input type="hidden" name="id" value="${orderDetail.product.id}"> <input
									type="submit" value="Delete" class="btn btn-danger">
							</form>
						</td>

					</tr>
				</c:forEach>
				<tr>
					<th></th>
					<th></th>
					<th>Total</th>
					<th></th>
					<th>${total}</th>
					<th></th>
				</tr>
			</table>

		</div>
		<div>
			<form action="${pageContext.request.contextPath}/checkout" method="get">
				<input
					style="width: 100px !important; border-radius: 15px !important;"
					type="submit" value="Check out" class="btn btn-primary">
			</form>
		</div>
	</div>
</body>
</html>