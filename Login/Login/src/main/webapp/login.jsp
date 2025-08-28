<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body class="bg-light">

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-5">
            <form action="login" method="post" enctype="application/x-www-form-urlencoded" class="p-4 bg-white shadow rounded">
                <h2 class="mb-4 text-center">Login</h2>

                <c:if test="${alert != null}">
                    <h3 class="alert alert-danger">${alert}</h3>
                </c:if>

                <section class="mb-3">
                    <label class="input login-input w-100">
                        <div class="input-group">
                            <span class="input-group-text"><i class="fa fa-user"></i></span>
                            <input type="text" placeholder="Username" name="username" class="form-control" required>
                        </div>
                    </label>
                </section>

                <section class="mb-3">
                    <label class="input login-input w-100">
                        <div class="input-group">
                            <span class="input-group-text"><i class="fa fa-lock"></i></span>
                            <input type="password" placeholder="Password" name="password" class="form-control" required>
                        </div>
                    </label>
                </section>

                <button type="submit" class="btn btn-primary w-100">Login</button>
            </form>
        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
