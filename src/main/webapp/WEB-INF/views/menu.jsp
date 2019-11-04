

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="container">
	<nav
		class=" navbar navbar-expand-sm navbar-primary justify-content-center bg-dark fixed-top">
		<a class="navbar-brand" href='<c:url value="/home"></c:url>'><img
			src="<c:url value="/resources/images/a.jpg" />" width="50"
			height="52"> </a>
		<ul class="navbar-nav">
			<li class="navbar-nav"><a class="nav-link"
				href='<c:url value="/home"></c:url>'>Home</a></li>

			<li class="navbar-nav"><a class="nav-link" href="#">Shop</a></li>

			<li class="navbar-nav"><a class="nav-link" href="#">About</a></li>

			<li class="navbar-nav"><a class="nav-link"
				href='<c:url value="/login"></c:url>'>Login</a></li>

			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="navbardrop"
				data-toggle="dropdown">Link </a>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="#">Link1</a> <a
						class="dropdown-item" href="#">Link1</a> <a class="dropdown-item"
						href="#">Link1</a> <a class="dropdown-item" href="#">Link1</a>
				</div></li>

			<form action="${pageContext.request.contextPath}/search" method="post" class="form-inline">
				<input class="form-control mr-sm-2" type="text" placeholder="Search"
					name="search">
				<button class="btn btn-primary" type="submit">Search</button>

			</form>
		</ul>
	</nav>
</div>