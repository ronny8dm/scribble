<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Dashboard - Scribble Shop</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">
</head>
<body>

    <header class="header">
        <div class="header-logo">
            <h3>Scribble Shop</h3>
        </div>
        <div class="header-search">
            <form>
                <input type="text" placeholder="Search...">
                <button type="submit">Search</button>
            </form>
        </div>
		<div class="header-user">
			<sec:authorize access="isAuthenticated()">
				<span>Hello,<span class="user-name"><sec:authentication
							property="name" /></span></span>
				<a href="${pageContext.request.contextPath}/logout">Logout</a>
			</sec:authorize>
			<sec:authorize access="isAnonymous()">
				<a href="${pageContext.request.contextPath}/login">Login</a>
			</sec:authorize>
		</div>
	</header>

    <div class="sidebar">
        <nav class="menu">
            <ul>
                <li><a href="#">Home</a></li>
                <li><a href="items">Catalog</a></li>
                <li><a href="#">Cart</a></li>
                <li><a href="#">Wishlist</a></li>
                <li><a href="#">Orders</a></li>
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