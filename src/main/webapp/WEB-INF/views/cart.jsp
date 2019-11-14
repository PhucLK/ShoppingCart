
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<title>Your Cart</title>
<jsp:include page="header.jsp"></jsp:include>
</head>
<body>
	<div class="container">
		<jsp:include page="menu.jsp"></jsp:include>
		<div class="container" >
			<c:if test="${not empty ListOrderDetail}">
				<div class="container">
					<h1 style="margin-top: 10%;">Your Items</h1>
				</div>

				<div class="container">

					<table class="table table-hover">

						<c:forEach var="orderDetail" items="${ListOrderDetail}">
							<tr>
								<td scope="col">
								<c:forEach var="i"
										items="${orderDetail.product.images}">
										<a href="detail/${orderDetail.product.id}"> <img
											id="image" class="img-fluid"
											src='<c:url value="/resources/images/${i.name}" /> '
											width="60" />
										</a>
								</c:forEach></td>
									
								<td scope="col" style="text-align: left !important;">${orderDetail.product.name}</td>
								<td scope="col">${orderDetail.orderSizeTem}</td>
								<td scope="col">${orderDetail.product.price} VND</td>
								<td scope="col">
									<form action="${pageContext.request.contextPath}/update"
										method="get">
										<input type="hidden" name="size"
											value="${orderDetail.orderSizeTem}"> <input
											style="width: 30px !important;" type="text" name="quantity"
											value="${orderDetail.quantity}"> <input type="submit"
											value="Update" class="btn btn-primary">
									</form>
								</td>
								<td scope="col">${orderDetail.amount} VND</td>

								<td scope="col">
									<a href="${pageContext.request.contextPath}/delete/${orderDetail.orderSizeTem}">
										 <i class="fas fa-trash"></i>
									</a>
								</td>

							</tr>
						</c:forEach>
						<tr>
							<th scope="col"></th>
							<th scope="col"></th>
							<th scope="col"></th>
							<th scope="col"></th>
							<th scope="col">Total</th>
							<th scope="col">${total} VND</th>
							<th scope="col"></th>
						</tr>
					</table>

				</div>
				<div class="container">
					<form action="${pageContext.request.contextPath}/checkout"
						method="get">
						<input
							style="width: 100px !important; border-radius: 15px !important;"
							type="submit" value="Check out" class="btn btn-primary">
					</form>
				</div>
			</c:if>
			<c:if test="${empty ListOrderDetail }">
				<div class="container"
					style="margin-top: 120px; text-align: center;">
					<div class="col-sm-12">
						<div class="alert alert-danger">${message}</div>
					</div>
					<img class="rounded mx-auto d-block"
						src="<c:url value="/resources/images/empty_cart.png" />" />
				</div>
				<div class="col text-center" style="margin-top: 20px;">
					<a href="<c:url value="/home"></c:url>"><button
							class="btn btn-primary" style="text-align: center;">Continue
							Shopping</button></a>
				</div>
			</c:if>
		</div>
	</div>
</body>
</html>