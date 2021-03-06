

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="container-fluid">


	<nav
		class="navbar navbar-expand-xl navbar-expand-lg navbar-dark justify-content bg-dark fixed-top">
		<a class="navbar-brand" href='<c:url value="/home"></c:url>'><img
			src='<c:url value="/resources/images/a.jpg"/>' width="80" height="82">
		</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContentXL"
			aria-controls="navbarSupportedContentXL" aria-expanded="false"
			aria-label="Toggle navigation" style="color: white">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContentXL">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item "><a class="nav-link"
					href='<c:url value="/home"></c:url>'>Home <span class="sr-only">(current)</span></a></li>
				<li class="nav-item"><a class="nav-link"
					href='<c:url value="/loginUser"></c:url>'>Login</a></li>
				<li class="nav-item"><a class="nav-link"
					href='<c:url value="/loginUser"></c:url>'>New Collection</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdownXL"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> Catogory </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdownXL">
						<a class="dropdown-item dark" href="#">Action</a> <a
							class="dropdown-item" href="#">Another action</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">Something else here</a>
					</div></li>
				<li class="nav-item"><a class="nav-link disabled" href="#">LK
						Colection</a></li>
			</ul>
			<form action="${pageContext.request.contextPath}/search"
				method="post" class="form-inline my-2 my-lg-0">
				<input class="form-control mr-sm-2" type="text" placeholder="Search"
					required="required" name="search" aria-label="Search">
				<button class="btn btn-outline-primary my-2 my-sm-0" type="submit">
					<i class="fas fa-search"></i>
				</button>
			</form>

		</div>
		<div class="form-inline">
			<a href="${pageContext.request.contextPath}/cart"> <i
				class="fas fa-shopping-cart"></i> Cart(${lenght})
			</a>
		</div>
	</nav>


	<!--	<nav
		class=" navbar navbar-expand-sm navbar-primary justify-content-center bg-dark fixed-top">
		<a class="navbar-brand" href='<c:url value="/home"></c:url>'><img
			src='<c:url value="/resources/images/giphy.gif"/>' width="80"
			height="82"> </a>
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




			<form action="${pageContext.request.contextPath}/search"
				method="post" class="form-inline">

				<select class="form-control selectpicker dropdown-fast" style="width: 20px">
					<option selected>Open </option>
					<option value="1">One</option>
					<option value="2">Two</option>
					<option value="3">Three</option>
				</select>
				
				 <input class="form-control right mr-sm-2" type="text"
					placeholder="Search" required="required" name="search">
				<button class="btn btn-primary" type="submit">
					<i class="fas fa-search"></i>
				</button>

			</form>
			<a href="${pageContext.request.contextPath}/cart"
				style="margin-left: 20px; padding-top: 5px;"> <i
				class="fas fa-shopping-cart"></i> Cart(${lenght})
			</a>
		</ul>
	</nav>
	 -->
</div>