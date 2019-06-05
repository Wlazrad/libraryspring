<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en">
<!-- Head -->
<head>
    <%@include file="/WEB-INF/incl/head.app" %>
<title><s:message code="title.profile"/></title>
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
            <h4 class="card-header"><c:out value="${user.login}"/>'s profile</h4>
            <div class="card-body">

                <table class="table table-borderless">
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
                        <td>
                            <c:choose>
                            <c:when test="${user.roleNumber == 1 }">
                                <s:message code="usertype.admin"/>
                            </c:when>
                            <c:otherwise>
                                <s:message code="usertype.user"/>
                            </c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                    </tbody>
                </table>

                <div class="text-center mb-2">
                    <button class="btn btn-outline-primary mr-3" type="button" onclick="window.location.href='${pageContext.request.contextPath}/editprofile'">Edit profile</button>
                </div>

                <div class="text-center">
                    <button class="btn btn-outline-primary mr-3" type="button" onclick="window.location.href='${pageContext.request.contextPath}/changepassword'">Change password</button>
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