<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head><title>Verify OTP</title></head>
<body>

<h2>Verify OTP</h2>

<form action="/verify-otp" method="post">
    Email: <input type="email" name="email" required /><br><br>
    OTP: <input type="text" name="otp" maxlength="6" required /><br><br>
    <button type="submit">Verify OTP</button>
</form>

</body>
</html>
