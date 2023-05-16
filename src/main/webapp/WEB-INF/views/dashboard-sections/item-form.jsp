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
<!-- Item form content goes here -->

<body>
	<div class="add-item-form">
		<h2>Add a new item</h2>
		<form:form modelAttribute="item" method="POST"
			action="${pageContext.request.contextPath}/items/save">
			<table>

				<tr>
					<td>Name:</td>
					<td><form:input path="name" /></td>
				</tr>
				<tr>
					<td>Description:</td>
					<td><form:input path="description" /></td>
				</tr>
				<tr>
					<td>Price:</td>
					<td><form:input path="price" /></td>
				</tr>
				<tr>
					<td>Image URL:</td>
					<td><form:input path="imageUrl" /></td>
				</tr>
				<tr>
					<td></td>
					<td><form:hidden path="id" /></td>
					<td><input type="submit" value="Save" /></td>
				</tr>
			</table>
		</form:form>
	</div>

</body>

</html>