<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="csrf" uri="http://www.springframework.org/security/tags" %>

<head>
<link rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.0/css/all.min.css">
<link rel="stylesheet" type="text/css"
    href="${pageContext.request.contextPath}/resources/css/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath}/.../resources/js/script.js"></script>
</head>

<div class="add-item-form">

<form method="Post" action="${pageContext.request.contextPath}/users/edit">

    <div class="form-group">
        <label for="username">Username:</label>
        <input type="text" class="form-control" id="username" name="username" value="${user.username}" readonly>
    </div>

    <div class="form-group">
        <label for="email">Email:</label>
        <input type="text" class="form-control" id="email" name="email" value="${user.email}" required>
    </div>

    <div class="form-group">
        <label for="password">Password:</label>
        <input type="password" class="form-control" id="password" name="password" minlength="8" required>
    </div>

    <div class="form-group">
        <label for="confirmPassword">Confirm Password:</label>
        <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" minlength="8" required>
        
        
    </div>
    
    <div class="form-group row">
			<div class="col-sm-10 offset-sm-2">
				<button type="submit" class="btn btn-primary btn-sm">Update</button>
				<a href="${pageContext.request.contextPath}/users/delete?username=${user.username}" class="btn btn-warning btn-sm catalog-delete-btn" onclick="if (!(confirm('Are you sure you want to delete this user?'))) return false"><i class="fas fa-trash"></i> Delete</a>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			</div>
		</div>
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

</form>

</div>