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
<title><s:message code="title.editProfile"/></title>
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
            <h4 class="card-header">Edit profile</h4>
            <div class="card-body">
                <c:if test="${not empty message}">
                    <div class="alert alert-info" role="alert">
                        <c:out value="${message}"/>
                    </div>
                </c:if>

                <sf:form id="usersForm" action="updateprofile" modelAttribute="user" enctype="multipart/form-data" method="POST">
                    <sf:hidden path="email"/>
                    <div class="form-group px-3">
                        <label for="login"><s:message code="register.login"/></label>
                        <sf:errors path="login"/>
                        <sf:input type="text" path="login" id="login" placeholder="Login" value="${user.login}" cssClass="form-control" pattern=".{3,30}" maxlength="30" title="3 to 30 characters" data-toggle="tooltip" data-placement="top" required="required"/>
                    </div>
                    <div class="form-group px-3">
                        <label for="firstName"><s:message code="register.firstName"/></label>
                        <sf:input type="text" path="firstName" id="firstName" placeholder="First name" value="${user.firstName}" cssClass="form-control" pattern=".{1,50}" maxlength="50" title="1 to 50 characters" data-toggle="tooltip" data-placement="top" required="required"/>
                    </div>
                    <div class="form-group px-3">
                        <label for="lastName"><s:message code="register.lastName"/></label>
                        <sf:input type="text" path="lastName" id="firstName" placeholder="Last name" value="${user.lastName}" cssClass="form-control" pattern=".{1,50}" maxlength="50" title="1 to 50 characters" data-toggle="tooltip" data-placement="top" required="required"/>
                    </div>
                    <div class="form-group px-3 text-center">
                        <button type="submit" class="btn btn-primary">Edit profile</button>
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