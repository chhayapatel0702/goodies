<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="connection.DbCon" %>
<%@ page import="model.*" %>
<%@ page import="dao.*" %>
<%@ page import="java.util.*" %>
<%
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
	request.setAttribute("auth", auth);
   }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>main page</title>
<%@ include file="includes/head.jsp" %>
<link rel="stylesheet" href="style.css">
</head>
<body>
<%@ include file="includes/navbar.jsp" %>

<div class="container">
		<div class="card w-50 mx-auto my-5">
			<div class="card-header text-center">Sign Up</div>
			<div class="card-body">
				<form action="reg-user" method="post">
					<div class="form-group">
						<label>Name</label> 
						<input type="text" name="text1" class="form-control" placeholder="Enter your name">
					</div>
					<div class="form-group">
						<label>Address</label> 
						<input type="text" name="address" class="form-control" placeholder="Enter address">
					</div>
					<div class="form-group">
						<label>Email address</label> 
						<input type="email" name="login-email" class="form-control" placeholder="Enter email">
					</div>
					<div class="form-group">
						<label>Password</label> 
						<input type="password" name="login-password" class="form-control" placeholder="Password">
					</div>
					<div class="text-center">
						<button type="submit" class="btn btn-primary">Register</button>
					</div>
				</form>
			</div>
		</div>
	</div>

<%@ include file="includes/footer.jsp" %>
</body>
</html>