<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.0/css/all.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/.../resources/css/style.css">
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
				<a href="items/new" class="btn btn-success mb-3"><i
					class="fas fa-plus"></i> Add</a>
			</div>
		</div>
		<div class="row">
			<c:forEach items="${items}" var="item">
				<div id="items"></div>
				<div class="col-md-4 mb-4">
					<div class="card">
						<img class="card-img-top"
							src="${empty item.imageUrl ? 'https://via.placeholder.com/150x100?text=Item' : item.imageUrl}"
							alt="Product image">
						<div class="card-body">
							<h5 class="card-title">${item.name}</h5>
							<p class="card-text">${item.description}</p>
							<a href="#" class="btn btn-primary catalog-details-btn"><i
								class="fas fa-eye"></i> Details</a> <a
								href="items/edit/?itemId=${item.id}"
								class="btn btn-warning catalog-edit-btn"><i
								class="fas fa-pencil-alt"></i> Edit</a> <a
								href="items/delete?itemId=${item.id}"
								onclick="if (!(confirm('Are you sure you want to delete this item?'))) return false"
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