<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en">
<!-- Head -->
<head>
    <%@include file="/WEB-INF/incl/head.app" %>
    <link rel="stylesheet" href="/resources/css/login.css" type="text/css">
<title><s:message code="title.login"/></title>
</head>
<body>
<wrapper class="d-flex flex-column">
<!-- Navigation -->
    <%@include file="/WEB-INF/incl/nav.app" %>
<!-- Page Content -->
<main class="container-fluid py-3 flex-fill">
<div class="container">

    <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
        <div class="card card-signin my-3">
            <div class="card-body">
                <h5 class="card-title text-center">Sign in</h5>

                <c:if test="${not empty param.error}">
                    <div class="alert alert-danger" role="alert">
                        <s:message code="error.login"/>
                    </div>
                </c:if>

    <form class="form-signin" action="/login" method="POST">
        <div class="form-label-group">
            <input type="email" name="email" id="inputLogin" class="form-control" placeholder="Email" required autofocus>
            <label for="inputLogin">Email</label>
        </div>

        <div class="form-label-group">
            <input type="password" name="password" id="inputPassword" class="form-control" placeholder="Password" required>
            <label for="inputPassword">Password</label><span toggle="#inputPassword" class="login-field-icon far fa-eye-slash input-password"></span>
        </div>

        <button class="btn btn-primary btn-block mb-2" type="submit">SIGN IN</button>
    </form>

                <div class="alert alert-info text-center" role="alert">
                    Don't have an account? Create it <a href="/register" class="alert-link">here</a>
                </div>

            </div>
        </div>
    </div>

</div>
</main>
<!-- Footer -->
    <%@include file="/WEB-INF/incl/footer.app" %>
</wrapper>
</body>
</html>