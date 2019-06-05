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
            <h5 class="mb-0 text-white lh-100">Book panel</h5>
        </div>
    </div>

    <div class="card border-primary my-3">
        <h4 class="card-header">Add new book</h4>
        <div class="card-body" align="center">

            <sf:form id="bookForm" action="${pageContext.request.contextPath}/admin/addnewbook" modelAttribute="book" enctype="multipart/form-data" method="POST">
                <div class="form-group row">
                    <label for="isbn" class="col-sm-2 col-form-label">ISBN</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" pattern="[0-9]{10,13}" maxlength="13" title="ISBN requires 10 or 13 digits" data-toggle="tooltip" data-placement="top" name="isbn" id="isbn" placeholder="ISBN" required>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="title" class="col-sm-2 col-form-label">Title</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="title" id="title" placeholder="Title" required>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="author" class="col-sm-2 col-form-label">Author</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="author" id="author" placeholder="Author" required>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="releaseDate" class="col-sm-2 col-form-label">Release date</label>
                    <div class="col-sm-10">
                        <input type="number" class="form-control" name="releaseDate" id="releaseDate" placeholder="Release date">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="description" class="col-sm-2 col-form-label">Description</label>
                    <div class="col-sm-10">
                        <textarea rows="4" class="form-control" name="description" id="description" placeholder="Description..."></textarea>
                    </div>
                </div>
                <div class="text-center">
                    <button class="btn btn-primary" type="submit">Save</button>
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