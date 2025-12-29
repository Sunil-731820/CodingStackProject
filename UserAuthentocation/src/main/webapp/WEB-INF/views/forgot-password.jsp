<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head><title>Forgot Password</title></head>
<body>

<h2>Forgot Password</h2>

<form action="/forgot-password" method="post">
    Enter Email: <input type="email" name="email" required /><br><br>
    <button type="submit">Send OTP</button>
</form>

<a href="/login">Back to Login</a>

</body>
</html>
