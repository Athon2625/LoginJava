<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="vn.iostar.model.UserModel" %>
<!DOCTYPE html>
<html>
<head>
    <title>Welcome Page</title>
    <style>
        body { font-family: Arial, sans-serif; background-color: #f2f2f2; }
        .container {
            width: 400px; margin: 100px auto; padding: 20px;
            background-color: #fff; border-radius: 8px; box-shadow: 0 0 10px rgba(0,0,0,0.1);
            text-align: center;
        }
        a.logout {
            display: inline-block; margin-top: 20px; text-decoration: none;
            color: white; background-color: #f44336; padding: 10px 20px; border-radius: 4px;
        }
        a.logout:hover { background-color: #d32f2f; }
    </style>
</head>
<body>
<div class="container">
    <%
        UserModel user = (UserModel) session.getAttribute("currentUser");
        if (user != null) {
    %>
        <h2>Welcome, <%= user.getUsername() %>!</h2>
        <p>Your ID: <%= user.getId() %></p>
        <p>Your Password: <%= user.getPassword() %></p>

        <a href="logout.jsp" class="logout">Logout</a>
    <%
        } else {
            response.sendRedirect("login.jsp"); // chưa login → chuyển về login
        }
    %>
</div>
</body>
</html>
