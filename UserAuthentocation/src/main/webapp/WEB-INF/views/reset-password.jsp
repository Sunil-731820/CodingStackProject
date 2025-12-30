<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head><title>Reset Password</title>
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

        .reset-container {
            width: 400px;
            background: white;
            border-radius: 10px;
            padding: 35px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
            text-align: center;
        }

        .reset-header h2 {
            margin: 0;
            color: #ffa116;
            font-size: 26px;
        }

        .reset-header p {
            margin-top: 10px;
            color: gray;
            font-size: 15px;
        }

        .message {
            margin: 20px 0;
            padding: 15px;
            border-radius: 6px;
            font-size: 14px;
        }

        .error {
            background-color: #ffe0e0;
            color: #d8000c;
        }

        .success {
            background-color: #e0ffe5;
            color: #2d8a34;
        }

        .submit-btn {
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

        .submit-btn:hover {
            background-color: #e59400;
        }

        .links {
            margin-top: 20px;
            font-size: 13px;
        }

        .links a {
            color: #007bff;
            text-decoration: none;
        }

        .links a:hover {
            text-decoration: underline;
        }

        .form-group {
            margin-bottom: 18px;
            text-align: left;
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
    </style>

</head>
<body>
<div class="reset-container">

    <div class="reset-header">
        <h2>Reset Password</h2>
        <p>Enter your new password</p>
    </div>
<form action="/reset-password" method="post">
    
    <div class="form-group">
            <label>Email</label>
            <input type="email" name="email" required
                   value="<%= request.getAttribute("email") != null ? request.getAttribute("email") : "" %>"
                   placeholder="Enter your registered email">
        </div>

        <div class="form-group">
            <label>New Password</label>
            <input type="password" name="password" required placeholder="Enter new password">
        </div>

        <button type="submit" class="submit-btn">Reset Password</button>
    
    
    
</form>

    <div class="links">
        <a href="login">Back to Login</a>
    </div>

</div>
 
</body>
</html>
