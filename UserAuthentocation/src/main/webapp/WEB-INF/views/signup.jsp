<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head><title>Signup</title></head>
<body>

<h2>User Signup</h2>

<form action="/signup" method="post">
    Name: <input type="text" name="name" value="${user.name}" placeholder="Enter Your Name" /><br><br>
    Email: <input type="email" name="email" value="${user.email}" placeholder="Enter Your Email" /><br><br>
    Password: <input type="password" name="password" placeholder="Enter Password" /><br><br>
    
    <%--  <!-- Show error message -->
    <div style="color:red;">
        ${errorMessages}
    </div>
     --%>
     
     <%-- Showing All Error once  --%>

<%
    List<String> errorMessages = (List<String>) request.getAttribute("errorMessages");
    if (errorMessages != null) {
        for(String msg : errorMessages) {
%>
    <div style="color:red;"><%= msg %></div>
<%
        }
    }
%>     
     
    <button type="submit">Register</button>
</form>

<a href="/login">Already have an account?</a>

</body>
</html>
