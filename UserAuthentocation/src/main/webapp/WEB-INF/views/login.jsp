<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head><title>Login</title>
 <style>
        body {
            margin: 0;
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Arial;
            background: linear-gradient(120deg, #f7f8fa, #eaecef);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .login-container {
            width: 380px;
            background: white;
            border-radius: 10px;
            padding: 30px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
        }

        .login-header {
            text-align: center;
            margin-bottom: 25px;
        }

        .login-header h2 {
            margin: 0;
            color: #ffa116;
            font-size: 28px;
        }

        .login-header p {
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

        .login-btn {
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

        .login-btn:hover {
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
            margin: 0 8px;
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
<div class="login-container">

 <div class="login-header">
        <h2>CodePractice</h2>
        <p>Login to practice coding</p>
    </div>
<!-- Show error or success messages -->
<div style="color:red;">
    ${errorMessage}
</div>

<div style="color:green;">
    ${successMessage}
</div>



<form action="/login" method="post">
<div class="form-group">
            <label>Email</label>
            <input type="email" name="email" required placeholder="Enter your email">
        </div>
    <div class="form-group">
            <label>Password</label>
            <input type="password" name="password" required placeholder="Enter your password">
        </div>
    <button type="submit" class="login-btn">Login</button>
</form>

 <!-- LINKS -->
    <div class="links">
        <a href="/signup">Create Account</a> |
        <a href="/forgot-password">Forgot Password?</a><br><br>
        <a href="${pageContext.request.contextPath}/resend-verification-page">
    Resend Email Verification
</a>
        
    </div>
</div>


</body>
</html>
