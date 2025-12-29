<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head><title>Reset Password</title></head>
<body>

<h2>Reset Password</h2>

<form action="/reset-password" method="post">
    Email: <input type="email" name="email" required /><br><br>
    New Password: <input type="password" name="password" required /><br><br>
    <button type="submit">Reset Password</button>
</form>
 
</body>
</html>
