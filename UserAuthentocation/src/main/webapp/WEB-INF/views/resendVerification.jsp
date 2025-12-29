<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h2>Welcome Please Enter Your email So that you Can verify Your
		Email</h2>
	<form action="/resend-verification"
		method="get">
		<label>Email:</label> <input type="email" name="email" required /> <br />
		<br />
		<button type="submit">Resend Verification Email</button>
	</form>

	<div style="color: red;">${errorMessage}</div>
	<div style="color: green;">${successMessage}</div>

</body>
</html>