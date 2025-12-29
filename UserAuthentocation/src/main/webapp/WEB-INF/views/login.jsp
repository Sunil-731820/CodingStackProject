<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head><title>Login</title></head>
<body>

<h2>Login</h2>

<form action="/login" method="post">
    Email: <input type="email" name="email" required /><br><br>
    Password: <input type="password" name="password" required /><br><br>
    <button type="submit">Login</button>
</form>

<a href="/forgot-password">Forgot Password?</a><br>
<a href="/signup">New User?</a>

</body>
</html>
