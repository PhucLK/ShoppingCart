

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<title>Shopping Cart</title>
<jsp:include page="header.jsp"></jsp:include>
<style type="text/css">
#myBtn {
	display: none;
	position: fixed;
	bottom: 20px;
	right: 30px;
	z-index: 99;
	font-size: 18px;
	border: none;
	outline: none;
	background-color: #007BFF;
	color: white;
	cursor: pointer;
	padding: 15px;
	border-radius: 4px;
}

#myBtn:hover {
	background-color: #066DFF;
}
</style>
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

		</div>
		<nav aria-label="Page navigation ">
			<ul class="pagination justify-content-center">
				<li class="page-item disabled"><a class="page-link" href="#"
					tabindex="-1">Previous</a></li>
				<li class="page-item"><a class="page-link"
					href="${pageContext.request.contextPath}/home?page=0">1</a></li>
				<li class="page-item active"><a class="page-link"
					href="${pageContext.request.contextPath}/home?page=1">2 <span
						class="sr-only">(current)</span>
				</a></li>
				<li class="page-item"><a class="page-link"
					href="${pageContext.request.contextPath}/home?page=2">3</a></li>
				<li class="page-item"><a class="page-link" href="">Next</a></li>
			</ul>
		</nav>
		<jsp:include page="footer.jsp"></jsp:include>

	</div>

	<button id="myBtn" title="Go to top">Top</button>

	<script>
		//Get the button
		var mybutton = document.getElementById("myBtn");

		// When the user scrolls down 20px from the top of the document, show the button
		window.onscroll = function() {
			scrollFunction()
		};

		function scrollFunction() {
			if (document.body.scrollTop > 20
					|| document.documentElement.scrollTop > 20) {
				mybutton.style.display = "block";
			} else {
				mybutton.style.display = "none";
			}
		}

		// When the user clicks on the button, scroll to the top of the document
		$( document ).ready(function() {
			$("#myBtn").click(function(){
				$('body,html').animate({
					scrollTop : 0
				}, 800);
				document.body.scrollTop = 100;
				document.documentElement.scrollTop = 100;
			})
		})

	</script>
</body>
</html>
