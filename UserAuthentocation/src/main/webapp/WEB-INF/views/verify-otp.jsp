<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head><title>Verify OTP</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/verify-otp.css">
</head>
<body>
<div class="otp-container">

    <div class="otp-header">
        <h2>OTP Verification</h2>
        <p>Enter the OTP sent to your email</p>
    </div>
<form action="/verify-otp" method="post">
    
     <div class="form-group">
            <label>Email</label>
            <input type="email" name="email" required
                   value="<%= request.getAttribute("email") != null ? request.getAttribute("email") : "" %>"
                   placeholder="Enter your email">
        </div>

        <div class="form-group">
            <label>OTP</label>
            <input type="text" name="otp" maxlength="6" required placeholder="Enter OTP">
        </div>

        <button type="submit" class="submit-btn">Verify OTP</button>
    
    
</form>

<div class="links">
        <a href="/login">Back to Login</a> |
        <a href="/forgot-password">Resend OTP</a>
    </div>

</div>


</body>
</html>
