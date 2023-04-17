<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<title>Sign In</title>
<link rel="stylesheet" type= "text/css" href="${pageContext.request.contextPath}/resources/css/style.css?version=51">
</head>
<body>
    <div class="form-container">
        <h1>Sign In</h1>

		<c:if test="${not empty message}">
			<div class="message-container">
				<div class="message">${message}</div>
			</div>
		</c:if>
		<c:if test="${not empty error}">
			<div class="error-container">
				<div class="error-message">${error}</div>
			</div>
		</c:if>
		
        <form name='login' action="<c:url value='/login' />" method='POST'>
            <label for="username">Username</label> 
            <input type="text" id="username" name="username" required>
            
            <label for="password">Password</label>
            <input type="password" id="password" name="password" required>
            
            <input type="submit" value="Sign In">
            
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
        </form>
        <div class="bottom-text">
            <span>Don't have an account?</span> <a href="${pageContext.request.contextPath}/signup">Sign Up</a>
        </div>
    </div>
</body>
</html>