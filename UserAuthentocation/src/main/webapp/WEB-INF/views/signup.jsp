<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<title>Signup</title>
<style>
body {
	margin: 0;
	font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto,
		Arial;
	background: linear-gradient(120deg, #f7f8fa, #eaecef);
	height: 100vh;
	display: flex;
	justify-content: center;
	align-items: center;
}

.signup-container {
	width: 400px;
	background: white;
	border-radius: 10px;
	padding: 30px;
	box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
}

.signup-header {
	text-align: center;
	margin-bottom: 25px;
}

.signup-header h2 {
	margin: 0;
	color: #ffa116;
	font-size: 28px;
}

.signup-header p {
	margin-top: 8px;
	color: gray;
	font-size: 14px;
}

.form-group {
	margin-bottom: 18px;
}

.form-group label {
	display: block;
	font-size: 14px;
	margin-bottom: 6px;
	color: #555;
}

.form-group input {
	width: 100%;
	padding: 10px;
	border-radius: 6px;
	border: 1px solid #ccc;
	font-size: 14px;
	outline: none;
}

.form-group input:focus {
	border-color: #ffa116;
}

.signup-btn {
	width: 100%;
	background-color: #ffa116;
	color: white;
	border: none;
	padding: 12px;
	font-size: 15px;
	border-radius: 6px;
	cursor: pointer;
	font-weight: bold;
}

.signup-btn:hover {
	background-color: #e59400;
}

.links {
	text-align: center;
	margin-top: 15px;
}

.links a {
	font-size: 13px;
	color: #007bff;
	text-decoration: none;
}

.links a:hover {
	text-decoration: underline;
}

.error {
	background-color: #ffe0e0;
	color: #d8000c;
	padding: 10px;
	border-radius: 6px;
	font-size: 13px;
	margin-bottom: 15px;
	text-align: center;
}

.success {
	background-color: #e0ffe5;
	color: #2d8a34;
	padding: 10px;
	border-radius: 6px;
	font-size: 13px;
	margin-bottom: 15px;
	text-align: center;
}
</style>
</head>
<body>
	<div class="signup-container">
		<div class="signup-header">
			<h2>CodePractice</h2>
			<p>Create your account</p>
		</div>
		<form action="/signup" method="post">

			<div class="form-group">
				<label>Name</label> <input type="text" name="name"
					value="${user.name}" required placeholder="Enter your full name">
			</div>

			<div class="form-group">
				<label>Email</label> <input type="email" name="email"
					value="${user.email}" required placeholder="Enter your email">
			</div>

			<div class="form-group">
				<label>Password</label> <input type="password" name="password"
					required placeholder="Create a password">
			</div>


			<%--  <!-- Show error message -->
    <div style="color:red;">
        ${errorMessages}
    </div>
     --%>

			<%-- Showing All Error once  --%>

			<%
    List<String> errorMessages = (List<String>) request.getAttribute("errorMessages");
    if (errorMessages != null) {
        for(String msg : errorMessages) {
%>
			<div style="color: red;"><%= msg %></div>
			<%
        }
    }
%>

			<button type="submit" class="signup-btn">Create Account</button>
		</form>

		<!-- LINKS -->
		<div class="links">
			Already have an account? <a href="/login">Login</a>
		</div>

	</div>
</body>
</html>
