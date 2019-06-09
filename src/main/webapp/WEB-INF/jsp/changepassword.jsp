<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<!-- Head -->
<head>
    <%@include file="/WEB-INF/incl/head.app" %>
<title><s:message code="title.changePassword"/></title>
</head>
<body>
<wrapper class="d-flex flex-column">
<!-- Navigation -->
    <%@include file="/WEB-INF/incl/nav.app" %>
<!-- Page Content -->
<main class="container-fluid py-3 flex-fill">
<div class="container">

    <div class="col-md-6 offset-md-3">
        <div class="card border-primary">
            <h4 class="card-header">Change password</h4>
            <div class="card-body">
                <c:if test="${not empty message}">
                    <div class="alert alert-info" role="alert">
                        <c:out value="${message}"/>
                    </div>
                </c:if>

                <sf:form id="usersForm" action="updatepassword" modelAttribute="user" enctype="multipart/form-data" method="POST">
                    <sf:hidden path="email"/>
                    <div class="form-group px-3">
                        <label for="password">New password</label>
                        <p class="card-text"><small class="text-muted"><s:message code="register.passwordRequirements"/></small></p>
                        <sf:errors path="newPassword"/>
                        <sf:password path="newPassword" id="password" placeholder="Password" cssClass="form-control" required="required"/>
                        <span toggle="#password" class="field-icon far fa-eye-slash input-password"></span>
                    </div>
                    <div class="form-group px-3">
                        <label for="password2">Confirm new password</label>
                        <input type="password" class="form-control" id="password2" placeholder="Password" required>
                        <span toggle="#password2" class="field-icon far fa-eye-slash input-password"></span>
                    </div>
                    <div class="form-group px-3 text-center">
                        <button type="submit" class="btn btn-primary">Change password</button>
                    </div>
                </sf:form>
            </div>
        </div>
    </div>

</div>
</main>
<!-- Footer -->
    <%@include file="/WEB-INF/incl/footer.app" %>
    <script src="/resources/scripts/passconfirm.js"></script>
</wrapper>
</body>
</html>