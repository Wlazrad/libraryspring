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
<title><s:message code="title.admin"/></title>
</head>
<body>
<wrapper class="d-flex flex-column">
<!-- Navigation -->
    <%@include file="/WEB-INF/incl/nav.app" %>
    <%@include file="/WEB-INF/incl/anav.app" %>
<!-- Page Content -->
<main class="col-md-10 ml-sm-auto py-3 flex-fill">
<div class="container">

    <div class="d-flex align-items-center p-3 my-3 text-white-50 bg-primary rounded shadow-sm">
        <div class="lh-100">
            <h5 class="mb-0 text-white lh-100">User panel</h5>
        </div>
    </div>

    <div class="card border-primary my-3">
        <h4 class="card-header">User: ${user.login}</h4>
        <div class="card-body" align="center">

            <sf:form id="usersForm" action="${pageContext.request.contextPath}/admin/updateuser/${user.id}" modelAttribute="user" enctype="multipart/form-data" method="POST">
            <sf:hidden path="id" value="${user.id}"/>

            <table class="table table-sm table-borderless">
                <tbody>
                <tr>
                    <th>Login:</th>
                    <td><c:out value="${user.login}"/></td>
                </tr>
                <tr>
                    <th>Email:</th>
                    <td><c:out value="${user.email}"/></td>
                </tr>
                <tr>
                    <th>First name:</th>
                    <td><c:out value="${user.firstName}"/></td>
                </tr>
                <tr>
                    <th>Last name:</th>
                    <td><c:out value="${user.lastName}"/></td>
                </tr>
                <tr>
                    <th>User type:</th>
                    <td><sf:select path="roleNumber" items="${roleMap}" cssClass="custom-select custom-select-sm"/></td>
                </tr>
                <tr>
                    <th>Status:</th>
                    <td><sf:select path="active" items="${activityMap}" cssClass="custom-select custom-select-sm"/></td>
                </tr>
                </tbody>
            </table>

                <div class="text-center">
                    <button class="btn btn-primary" type="submit">Save</button>
                </div>
            </sf:form>

            <sf:form id="usersForm" action="${pageContext.request.contextPath}/admin/deleteuser/${user.id}" modelAttribute="user" enctype="multipart/form-data" method="POST">
            <sf:hidden path="id" value="${user.id}"/>
            <div class="text-center my-2">
                <button class="btn btn-danger" type="submit" onclick="return confirm('Delete this user?')">Delete</button>
            </div>
            </sf:form>

                <div class="text-center my-2">
                    <button class="btn btn-outline-primary" type="button" onclick="history.back();"><s:message code="button.return"/></button>
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