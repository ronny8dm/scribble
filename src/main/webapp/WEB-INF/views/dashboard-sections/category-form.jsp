<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.0/css/all.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath}/.../resources/js/script.js"></script>
</head>

<body>

<div class="add-item-form">
	<h2>Add a new category</h2>
	<form:form modelAttribute="category" method="POST"
		action="${pageContext.request.contextPath}/categories/save">
		<table>
			
			<tr>
				<td>Name:</td>
				<td><form:input path="name" /></td>
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