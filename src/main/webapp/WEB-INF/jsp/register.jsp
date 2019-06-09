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
    <title><s:message code="title.register"/></title>
</head>
<body>
<wrapper class="d-flex flex-column">
    <!-- Navigation -->
    <%@include file="/WEB-INF/incl/nav.app" %>
    <!-- Page Content -->
    <main class="container-fluid py-3 flex-fill">
        <div class="container">

            <div class="col-md-8 offset-md-2">
            <div class="card border-primary">
                <h4 class="card-header">Create new account</h4>
                <div class="card-body">
                    <div class="text-center mb-2">
                    Get started with your free account
                    </div>

            <sf:form id="usersForm" action="adduser" modelAttribute="user" enctype="multipart/form-data" method="POST">
            <div class="form-group row">
                <label for="login" class="col-sm-3 col-form-label"><s:message code="register.login"/></label>
                <div class="col-sm-9">
                    <sf:errors path="login"/>
                    <sf:input type="text" path="login" id="login" placeholder="Login" cssClass="form-control" pattern=".{3,30}" maxlength="30" title="3 to 30 characters" data-toggle="tooltip" data-placement="top" required="required"/>
                </div>
            </div>
            <div class="form-group row">
                <label for="email" class="col-sm-3 col-form-label"><s:message code="register.email"/></label>
                <div class="col-sm-9">
                    <sf:errors path="email"/>
                    <sf:input type="email" path="email" id="email" placeholder="user@example.com" cssClass="form-control" required="required"/>
                </div>
            </div>
            <div class="form-group row">
                <label for="password" class="col-sm-3 col-form-label"><s:message code="register.password"/></label>
                <div class="col-sm-9">
                    <sf:errors path="password"/>
                    <p class="card-text"><small class="text-muted"><s:message code="register.passwordRequirements"/></small></p>
                    <sf:input type="password" path="password" id="password" placeholder="Password" cssClass="form-control" required="required"/>
                    <span toggle="#password" class="field-icon far fa-eye-slash input-password"></span>
                </div>
            </div>
                <div class="form-group row">
                    <label for="password" class="col-sm-3 col-form-label"><s:message code="register.passwordConfirm"/></label>
                    <div class="col-sm-9">
                        <input type="password" class="form-control" id="password2" placeholder="Password" required>
                        <span toggle="#password2" class="field-icon far fa-eye-slash input-password"></span>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="firstName" class="col-sm-3 col-form-label"><s:message code="register.firstName"/></label>
                    <div class="col-sm-9">
                        <sf:input type="text" path="firstName" id="firstName" placeholder="First name" cssClass="form-control" pattern=".{1,50}" maxlength="50" title="1 to 50 characters" data-toggle="tooltip" data-placement="top" required="required"/>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="lastName" class="col-sm-3 col-form-label"><s:message code="register.lastName"/></label>
                    <div class="col-sm-9">
                        <sf:input type="text" path="lastName" id="lastName" placeholder="Last name" cssClass="form-control" pattern=".{1,50}" maxlength="50" title="1 to 50 characters" data-toggle="tooltip" data-placement="top" required="required"/>
                    </div>
                </div>

                <button class="btn btn-primary btn-lg btn-block mb-3" type="submit"><s:message code="button.register"/></button>

                <div class="text-center">
                    <button class="btn btn-outline-primary" type="button" onclick="window.location.href='${pageContext.request.contextPath}/'"><s:message code="button.return"/></button>
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