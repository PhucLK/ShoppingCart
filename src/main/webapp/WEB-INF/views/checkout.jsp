
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<title>Check Out</title>
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
	<jsp:include page="menu.jsp" />
	<div class="container" id="body">
		<div class="row">

			<table class="table">
				<thead class="thead-light">
					<tr>
						<th style="text-align: left !important;">Product</th>
						<th>Price</th>
						<th>Quantity</th>
						<th>Amout</th>
					</tr>
				</thead>
				<c:forEach var="orderDetail" items="${ListOrderDetail}">
					<tr>
						<td style="text-align: left !important;">${orderDetail.product.name}</td>
						<td>${orderDetail.product.price}</td>
						<td>${orderDetail.quantity}</td>
						<td>${orderDetail.amout}</td>

					</tr>
				</c:forEach>
				<tr>
					<th></th>
					<th></th>
					<th>Total</th>
					<th>${total}</th>
				</tr>
			</table>

		</div>
	</div>
	<div class="container">
		<h2>CheckOut</h2>
		<form:form method="post" modelAttribute="customer"
			class="form-horizontal" action="${pageContext.request.contextPath}/thanks">
			<div class="form-group">
				<label class="control-label col-sm-2" for="email">Name:</label>
				<div class="col-sm-10">
					<form:input path="name" class="form-control"
						placeholder="Enter your name" />
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="pwd">Address:</label>
				<div class="col-sm-10">
					<form:input path="address" class="form-control"
						placeholder="Enter your address" />
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="email">Phone
					Number:</label>
				<div class="col-sm-10">
					<form:input path="phoneNumber" class="form-control"
						placeholder="Enter your phone number" />
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<input type="submit" class="btn btn-primary"
						style="border-radius: 10px; width: 100px;" value="Sent">
				</div>
			</div>
		</form:form>
	</div>

</body>
</html>