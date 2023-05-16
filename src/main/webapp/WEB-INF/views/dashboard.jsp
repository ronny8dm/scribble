<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Dashboard - Scribble</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.0/css/all.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/style.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/script.js"></script>
</head>
<body>

	<header class="header">
		<div class="header-logo">
			<a href="dashboard"><h3>Scribble</h3></a>
		</div>
		<div class="header-user">
			<sec:authorize access="isAuthenticated()">
				<span>Hello,<span class="user-name"><sec:authentication
							property="name" /></span></span>
			</sec:authorize>
			<sec:authorize access="isAnonymous()">
				<a href="${pageContext.request.contextPath}/login">Login</a>
			</sec:authorize>
		</div>
	</header>

	<div class="sidebar">
		<nav class="menu">
			<ul>
				<li><a href="${pageContext.request.contextPath}/dashboard"><i class="fas fa-home"></i> Home</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="categoriesDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"><i class="fas fa-list"></i> Categories <i
						class="fas fa-angle-down"></i></a>
					<div class="dropdown-menu" aria-labelledby="categoriesDropdown">
						<a class="dropdown-item" href="${pageContext.request.contextPath}/categories/new"><i class="fas fa-plus"></i>
							Add new category</a> <a class="dropdown-item" href="${pageContext.request.contextPath}/categories"><i
							class="fas fa-th-list"></i> Category list</a>
					</div></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="itemsDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"><i class="fas fa-box-open"></i> Items <i
						class="fas fa-angle-down"></i></a>
					<div class="dropdown-menu" aria-labelledby="itemsDropdown">
						<a class="dropdown-item" href="${pageContext.request.contextPath}/items/new"><i
							class="fas fa-plus"></i> Add new Item</a> <a class="dropdown-item"
							href="${pageContext.request.contextPath}/items"><i class="fas fa-th-list"></i> Items List</a>
					</div></li>
				<li><a href="${pageContext.request.contextPath}/help"><i class="fas fa-question-circle"></i>
						Help</a></li>
				<li><sec:authorize access="isAuthenticated()">
						<a href="${pageContext.request.contextPath}/logout"><i
							class="fas fa-sign-out-alt"></i> Logout</a>
					</sec:authorize></li>
			</ul>
		</nav>
	</div>

	<main class="main">
		<div class="content">
			<jsp:include page="${page}" />
		</div>
	</main>
</body>
</html>