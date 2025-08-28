<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Header</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>

<!-- Header -->
<div class="container-fluid bg-light py-2">
    <div class="row">
        <c:choose>
            <c:when test="${sessionScope.account == null}">
                <!-- Khi chưa đăng nhập -->
                <div class="col-sm-6 ms-auto text-end">
                    <ul class="list-inline mb-0">
                        <li class="list-inline-item">
                            <a href="${pageContext.request.contextPath }/Login">Đăng nhập</a> 
                            <a href="${pageContext.request.contextPath }/register">Đăng ký</a>
                        </li>
                        <li class="list-inline-item">
                            <i class="fa fa-search search-button"></i>
                        </li>
                    </ul>
                </div>
            </c:when>
            <c:otherwise>
                <!-- Khi đã đăng nhập -->
                <div class="col-sm-6 ms-auto text-end">
                    <ul class="list-inline mb-0">
                        <li class="list-inline-item">
                            <a href="${pageContext.request.contextPath }/member/myaccount">
                                ${sessionScope.account.fullName}
                            </a> 
                            <a href="${pageContext.request.contextPath }/logout">Đăng Xuất</a>
                        </li>
                        <li class="list-inline-item">
                            <i class="fa fa-search search-button"></i>
                        </li>
                    </ul>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
