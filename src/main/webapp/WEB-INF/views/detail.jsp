

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Detail product</title>
<jsp:include page="header.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="menu.jsp"></jsp:include>
	<div class="container" style="position: relative !important;">


		<div class="container" style="position: absolute !important">
			<c:if test="${not empty message }">
				<div class="container" style="margin-top: 10%; text-align: center;">
					<div class="col-sm-12">
						<div class="alert alert-success">${message}</div>
					</div>
				</div>
			</c:if>

			<div class="container" style="margin-top: 15% !important;">
				<div class="container">
					<div class="row">
						<div class="col-sm-6 col-lg-4">
							<h3 class="text-center">${product.name}</h3>

							<c:forEach var="i" items="${product.images}">

								<img id="image" class="img-fluid"
									src='<c:url value="/resources/images/${i.name}" /> '
									width="300" />

							</c:forEach>
							<!-- 
							<a href="${pageContext.request.contextPath}/detail"> <img
								width="110%" class="img-fluid" id="item"
								src="<c:url value="/resources/images/${product.id}.jpg"  /> " />
							</a>
							 -->

						</div>
						<div class="col-sm-6 col-lg-8">
							<div>
								<input type="hidden" name="idCategory"
									value="${product.category.id}">


								<p>${product.price}</p>
								<form action='${pageContext.request.contextPath}/add'
									method="post">
									<input type="hidden" name="id" value="${product.id}" /> <input
										type="hidden" name="quantity" value="1" />

									<p>

										<c:forEach var="c" items="${product.sizes}">
											<div class="form-check-inline">
												<input type="radio" name="size" value="${c.name}"
													checked="checked" />${c.name}
											</div>
										</c:forEach>

									</p>

									<p>${product.description}</p>

									<input type="submit" value="Add to cart"
										class="btn btn-primary"
										style="margin-bottom: 20px !important;">
								</form>
							</div>
						</div>

					</div>

				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#item").mouseenter(function() {
				$("this").hide();
			});
			$("#item").mouseleave(function() {
				$(this).atr("width", "110%");
			});
		});
	</script>
</body>
</html>