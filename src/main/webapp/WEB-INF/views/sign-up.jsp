<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<title>Sign Up</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css?version=51">
</head>
<body>
	<div class="form-container">
		<h1>Sign Up</h1>
		
		<c:if test="${not empty success}">
			<div class="message-container">
				<div class="success-message">${success}</div>
			</div>
		</c:if>
		<c:if test="${not empty error}">
			<div class="message-container">
				<div class="error-message">${error}</div>
			</div>
		</c:if>
		
		<form:form modelAttribute="user" method="post">
			<form:label path="username">Username</form:label>
			<form:input type="text" id="username" path="username" required="true" />
			<form:errors path="username" cssClass="error" />

			<form:label path="email">Email</form:label>
			<form:input type="text" id="email" path="email" required="true" />
			<form:errors path="email" cssClass="error" />

			<form:label path="password">Password</form:label>
			<form:password id="password" path="password" required="true" />
			<form:errors path="password" cssClass="error"/>

			<form:label path="confirmPassword">Confirm Password</form:label>
			<form:password id="confirmPassword" path="confirmPassword" required="true" />
			<form:errors path="confirmPassword" cssClass="error" />

			<input type="submit" value="Sign Up" />
		</form:form>
		<div class="bottom-text">
			<span>Already have an account?</span> <a href="${pageContext.request.contextPath}/login">Sign In</a>
		</div>
	</div>
</body>
</html>
