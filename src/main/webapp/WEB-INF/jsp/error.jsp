<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en">
<!-- Head -->
<head>
    <%@include file="/WEB-INF/incl/head.app" %>
<title><s:message code="title.error"/></title>
</head>
<body>
<wrapper class="d-flex flex-column">
<!-- Navigation -->
    <%@include file="/WEB-INF/incl/nav.app" %>
<!-- Page Content -->
<main class="container-fluid py-3 flex-fill">
<div class="container">

    <div class="col-md-4 offset-md-4 text-center">
        <div class="card text-white bg-danger border-dark mb-3">
            <h3 class="card-header">Error</h3>
            <div class="card-body">
                <h5 class="card-title">Page not found!</h5>
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