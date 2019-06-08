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
    <title><s:message code="title.books"/></title>
</head>
<body>
<wrapper class="d-flex flex-column">
    <!-- Navigation -->
    <%@include file="/WEB-INF/incl/nav.app" %>
    <%@include file="/WEB-INF/incl/librarynav.app" %>
    <!-- Page Content -->
    <main class="col-md-10 ml-sm-auto py-3 flex-fill">
        <div class="container">

            <div class="d-flex align-items-center p-3 my-3 text-white-50 bg-primary rounded shadow-sm">
                <h5 class="mb-0 text-white col-2">Book panel</h5>
            </div>
            <div class="card border-primary my-3">
                <h4 class="card-header">Your Wallet</h4>
                <div>
                    <h1 class="card-header" >    You must pay penalty</h1>
                    <h2 class="card-header" > ${costs}</h2>
                    </div>
                <div class="card-body" align="center">
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
            var url = '${pageContext.request.contextPath}/books';
            if (searchInput === "") {window.location.href=url;return;}
            window.location.href=url+'/search/'+searchInput;
        }
    </div>
</wrapper>
</body>
</html>