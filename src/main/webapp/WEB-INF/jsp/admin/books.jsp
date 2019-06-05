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
        <h5 class="mb-0 text-white col-2">Book panel</h5>
        <div class="input-group">
            <input class="form-control" type="text" id="searchValue" placeholder="Search..." aria-label="Search">
            <button class="btn btn-dark my-2 my-sm-0" type="button" id="searchButton" onclick="searchBooks();">Search</button>
        </div>
    </div>

    <div class="card border-primary my-3">
        <h4 class="card-header">Book list</h4>
        <div class="card-body" align="center">

            <table class="table table-hover table-sm table-striped">
                <thead>
                <tr>
                    <th scope="col">Id</th>
                    <th scope="col">ISBN</th>
                    <th scope="col">Title</th>
                    <th scope="col">Author</th>
                    <th scope="col">Release date</th>
                    <th scope="col">Status</th>
                    <th scope="col">Choose</th>
                </tr>
                </thead>

                <tbody>
                <c:forEach var="book" items="${bookList}">
                <tr>
                    <td>${book.id}</td>
                    <td>${book.isbn}</td>
                    <td>${book.title}</td>
                    <td>${book.author}</td>
                    <td>${book.releaseDate}</td>
                    <td>${book.status}</td>
                    <td><a type="button" class="btn btn-outline-info" href="books/edit/${book.id}">Edit</a></td>
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

        function searchBooks() {
            var searchInput = document.getElementById('searchValue').value;
            var url = '${pageContext.request.contextPath}/admin/books';
            if (searchInput === "") {window.location.href=url;return;}
            window.location.href=url+'/search/'+searchInput;
        }
    </script>
</wrapper>
</body>
</html>