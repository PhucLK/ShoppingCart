

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<title>Shopping Cart</title>
<jsp:include page="header.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="menu.jsp"></jsp:include>

	<c:if test="${ check == 'Banner'}">
		<jsp:include page="carousel.jsp"></jsp:include>
	</c:if>
	<div class="container-fluid" id="body">
		<div></div>


		<c:if test="${not empty message }">
			<div class="container" style="margin-top: 120px; text-align: center;">
				<div class="col-sm-12">
					<div class="alert alert-danger">${message}</div>
				</div>
				<div class="col">
					<img class="rounded mx-auto d-block"
						src="<c:url value="/resources/images/empty_cart.png" />" />
				</div>
			</div>
			<div class="col text-center" style="margin-top: 20px;">
				<a href="<c:url value="/home"></c:url>"><button
						class="btn btn-primary" style="text-align: center;">Continue
						Shopping</button></a>
			</div>
		</c:if>
		<!--
		<div class="col-sm-12">
			<div class="row">
				<a href="${pageContext.request.contextPath}/cart">
					<button style="float: right !important;" class="btn btn-primary">
						<i class="fas fa-shopping-cart"></i> Cart(${lenght})
					</button>
				</a>
			</div>
		</div> -->
		<div class="container">
			<div class="row" style="margin-top: 7rem !important;">
				<c:forEach var="product" items="${ListProduct}">

					<div class="col-sm-6 col-lg-4">
						<h3 class="text-center">${product.name}</h3>
						<div class="text-center">
							<c:forEach var="i" items="${product.images}">

								<a href="detail/${product.id}"> <img id="image"
									class="img-fluid"
									src='<c:url value="/resources/images/${i.name}" /> '
									width="280" />
								</a>
							</c:forEach>

						</div>
						<div class="caption">
							<input type="hidden" name="idCategory"
								value="${product.category.id}">
							<p class="text-center">${product.description}</p>
							<p class="text-center">${product.price}</p>
							<!-- 
							<div class="text-center">
								<form action='add' method="get">
									<input type="hidden" name="id" value="${product.id}" /> <input
										type="hidden" name="quantity" value="1" /> <input
										type="submit" value="Add to cart" class="btn btn-primary"
										style="margin-bottom: 20px !important;">
								</form>
							</div>
							 -->
						</div>

					</div>
					<!-- 
					<script type="text/javascript">
						$('#image').mouseenter(function(){
							$(this).attr('src', '/resources/images/${product.id}-${product.id}.jpg');
						});
						$('#image').mouseleave(function(){
							$(this).attr('src', '/resources/images/${product.id}.jpg');
						});
					</script>
					 -->

				</c:forEach>
			</div>
			<a id="back-to-top" href="#"
				class="btn btn-primary btn-lg back-to-top" role="button"
				title="Click to return on the top page" data-toggle="tooltip"
				data-placement="left">Top <span
				class="glyphicon glyphicon-chevron-up"></span>
			</a>
		</div>
		<nav aria-label="...">
			<ul class="pagination">
				<li class="page-item disabled"><a class="page-link" href="#"
					tabindex="-1">Previous</a></li>
				<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/home?page=0">1</a></li>
				<li class="page-item active"><a class="page-link" href="${pageContext.request.contextPath}/home?page=1">2
						<span class="sr-only">(current)</span>
				</a></li>
				<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/home?page=2">3</a></li>
				<li class="page-item"><a class="page-link" href="">Next</a></li>
			</ul>
		</nav>
		<jsp:include page="footer.jsp"></jsp:include>

	</div>

	<script type="text/javascript">
		$(document).ready(function() {
			$(window).scroll(function() {
				if ($(this).scrollTop() > 50) {
					$('#back-to-top').fadeIn();
				} else {
					$('#back-to-top').fadeOut();
				}
			});
			// scroll body to 0px on click
			$('#back-to-top').click(function() {
				$('#back-to-top').tooltip('hide');
				$('body,html').animate({
					scrollTop : 0
				}, 800);
				return false;
			});

			$('#back-to-top').tooltip('show');

		});
	</script>
</body>
</html>
