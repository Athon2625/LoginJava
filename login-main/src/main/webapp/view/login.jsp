<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login Page</title>
    <style>
        body { font-family: Arial, sans-serif; background-color: #f2f2f2; }
        .login-container {
            width: 300px; margin: 100px auto; padding: 20px;
            background-color: #fff; border-radius: 8px; box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        input[type=text], input[type=password] {
            width: 100%; padding: 10px; margin: 8px 0; box-sizing: border-box;
        }
        input[type=submit] {
            width: 100%; padding: 10px; background-color: #4CAF50; color: white;
            border: none; border-radius: 4px; cursor: pointer;
        }
        input[type=submit]:hover { background-color: #45a049; }
        .error { color: red; margin-top: 10px; }
    </style>
</head>
<body>
<div class="login-container">
    <h2>Login</h2>
    <form action="login" method="post">
        Username:<br>
        <input type="text" name="username" required><br>
        Password:<br>
        <input type="password" name="password" required><br><br>
        <input type="submit" value="Login">
    </form>

    <!-- Hiển thị lỗi nếu có -->
    <%
        String errorMessage = (String) request.getAttribute("errorMessage");
        if (errorMessage != null) {
    %>
        <div class="error"><%= errorMessage %></div>
    <%
        }
    %>
</div>
</body>
</html>
