<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Item form content goes here -->

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
