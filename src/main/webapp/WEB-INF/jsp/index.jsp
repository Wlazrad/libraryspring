<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en">
<!-- Head -->
<head>
    <%@include file="/WEB-INF/incl/head.app" %>
<title><s:message code="title.mainPage"/></title>
</head>
<body>
<wrapper class="d-flex flex-column">
<!-- Navigation -->
    <%@include file="/WEB-INF/incl/nav.app" %>
<!-- Page Content -->
    <div class="jumbotron">
        <div class="container text-white">
            <h1 class="display-3">Hello to our library!</h1>
            <sec:authorize access="hasRole('ANONYMOUS')">
            <p>Please log in first in order to use our library service and option to borrow books.</p>
            <p><a class="btn btn-primary btn-lg" href="/login" role="button">Log in &raquo;</a></p>
            </sec:authorize>
            <sec:authorize access="isAuthenticated()">
            <p>Check Library panel in order to borrow or return books.</p>
            <p><a class="btn btn-primary btn-lg" href="/books" role="button">Library &raquo;</a></p>
            </sec:authorize>
        </div>
    </div>

<main class="container-fluid py-3 flex-fill">
<div class="container">

    <div class="card border-primary">
        <h4 class="card-header">Check out our book list</h4>
        <div class="card-body" align="center">

            <table class="table table-hover table-sm table-striped">
                <thead>
                <tr>
                    <th scope="col">ISBN</th>
                    <th scope="col">Title</th>
                    <th scope="col">Author</th>
                    <th scope="col">Release date</th>
                    <th scope="col">Description</th>
                </tr>
                </thead>

                <tbody>
                <c:forEach var="book" items="${bookList}">
                    <tr>
                        <td>${book.isbn}</td>
                        <td>${book.title}</td>
                        <td>${book.author}</td>
                        <td>${book.releaseDate}</td>
                        <td>${book.description}</td>
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
</wrapper>
</body>
</html>