<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
        <h5 class="mb-0 text-white col-2">User panel</h5>
        <div class="input-group">
            <input class="form-control" type="text" id="searchValue" placeholder="Search..." aria-label="Search">
            <button class="btn btn-dark my-2 my-sm-0" type="button" id="searchButton" onclick="searchUser();">Search</button>
        </div>
    </div>

    <div class="card border-primary my-3">
        <h4 class="card-header">User list</h4>
        <div class="card-body" align="center">

            <table class="table table-hover table-sm table-striped">
                <thead>
                <tr>
                    <th scope="col">Id</th>
                    <th scope="col">User type</th>
                    <th scope="col">Login</th>
                    <th scope="col">Email</th>
                    <th scope="col">First name</th>
                    <th scope="col">Last name</th>
                    <th scope="col">Active?</th>
                    <th scope="col">Choose</th>
                </tr>
                </thead>

                <tbody>
                <c:forEach var="user" items="${userList}">
                <tr>
                    <td>${user.id}</td>
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
                    <td>${user.login}</td>
                    <td>${user.email}</td>
                    <td>${user.firstName}</td>
                    <td>${user.lastName}</td>
                    <td>
                        <c:choose>
                            <c:when test="${user.active == 1 }">
                                <span data-feather="check-circle"></span>
                            </c:when>
                            <c:otherwise>
                                <span data-feather="x-circle"></span>
                            </c:otherwise>
                        </c:choose>
                     </td>
                    <td><a type="button" class="btn btn-outline-info" href="users/edit/${user.id}">Edit</a></td>
                </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

</div>
</main>
<!-- Footer -->
    <%@include file="/WEB-INF/incl/footer.app" %>
    <script>
        document.getElementById('searchValue').addEventListener('keyup', function(event) {
                if (event.keyCode === 13) {
                    event.preventDefault();
                    document.getElementById('searchButton').click();
                }
            });

        function searchUser() {
            var searchInput = document.getElementById('searchValue').value;
            var url = '${pageContext.request.contextPath}/admin/users';
            if (searchInput === "") {window.location.href=url;return;}
            window.location.href=url+'/search/'+searchInput;
        }
    </script>
</wrapper>
</body>
</html>