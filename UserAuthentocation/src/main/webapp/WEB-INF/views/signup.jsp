<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head><title>Signup</title></head>
<body>

<h2>User Signup</h2>

<form action="/signup" method="post">
    Name: <input type="text" name="name" required /><br><br>
    Email: <input type="email" name="email" required /><br><br>
    Password: <input type="password" name="password" required /><br><br>
    <button type="submit">Register</button>
</form>

<a href="/login">Already have an account?</a>

</body>
</html>
