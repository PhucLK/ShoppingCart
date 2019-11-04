<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8" language="java"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Login</title>
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
	<div class="container" id="login">
		<h2>Login</h2>
		<p style="color: red !important;"><c:if test="${not empty message }">${message}</c:if></p>
		<form:form method="post" modelAttribute="user" class="form-horizontal"
			action="${pageContext.request.contextPath}/loginValidate">
			<div class="form-group">
				<label class="control-label col-sm-2" for="email">Name:</label>
				<div class="col-sm-10">
					<form:input path="userName" class="form-control"
						placeholder="Enter username" />
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2">Password:</label>
				<div class="col-sm-10">
					<form:input path="password" class="form-control"
						placeholder="Enter password" type="password" />
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<div class="checkbox">
						<label><input type="checkbox" name="remember">
							Remember me</label>
					</div>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<input type="submit" class="btn btn-primary"
						style="border-radius: 10px; width: 100px;" value="Login">
				</div>
			</div>
		</form:form>
	</div>
</body>
</html>