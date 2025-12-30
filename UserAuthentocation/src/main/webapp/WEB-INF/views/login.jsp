<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head><title>Login</title></head>
<body>

<h2>Login</h2>

<!-- Show error or success messages -->
<div style="color:red;">
    ${errorMessage}
</div>

<div style="color:green;">
    ${successMessage}
</div>



<form action="/login" method="post">
    Email: <input type="email" name="email" required /><br><br>
    Password: <input type="password" name="password" required /><br><br>
    <button type="submit">Login</button>
</form>

<a href="/forgot-password">Forgot Password?</a><br>
<a href="/signup">New User?</a>
<h3>Resend Email verifications before Login This is for First Time User login </h3>
<div style="color:red;">${errorMessage}</div>

<h2>For Email Verifivcations please visit to Separate page</h2>
<a href="${pageContext.request.contextPath}/resend-verification-page">
    Resend Email Verification
</a>

</body>
</html>
