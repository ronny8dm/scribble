<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>

<head>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.0/css/all.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="${pageContext.request.contextPath}/.../resources/js/script.js"></script>
</head>

<body>

	<div class="container">
		<div class="row mt-4">
			<div class="col-md-12 text-right">
				<div class="header-search">
					<form action="items/search" method="GET" id="form">
						<input type="text" name="q" placeholder="Search items">
						<button type="submit" class="btn btn-primary">Search</button>
					</form>
				</div>
				<div id="search-results"></div>
			</div>
		</div>
		<div class="row">
			<c:forEach items="${categories}" var="category">
				<div class="col-md-4 mb-4">
					<div class="card">
						<div class="card-body">
							<h5 class="card-title">${category.name}</h5>
							<a href="#" class="btn btn-primary catalog-details-btn"><i
								class="fas fa-eye"></i> Details</a> <a
								href="categories/edit/?categoryId=${category.id}"
								class="btn btn-warning catalog-edit-btn"><i
								class="fas fa-pencil-alt"></i> Edit</a> <a
								href="categories/delete?categoryId=${category.id}"
								onclick="if (!(confirm('Are you sure you want to delete this category?'))) return false"
								class="btn btn-danger catalog-delete-btn"><i
								class="fas fa-trash"></i> Delete</a>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>

	</div>

</body>
</html>
