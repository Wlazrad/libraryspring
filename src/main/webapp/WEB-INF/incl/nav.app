<nav class="navbar sticky-top navbar-expand-md navbar-dark bg-dark">
    <div class="container">
        <a class="navbar-brand" href="/index">Portal</a>

        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link active" id="nav-home" href="/index">Start
                    <span class="sr-only">(current)</span>
                    </a>
                </li>

                <sec:authorize access="hasRole('ANONYMOUS')">
                <li class="nav-item">
                    <a class="nav-link" id="nav-login" href="/login">Log in</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" id="nav-register" href="/register">Register</a>
                </li>
                </sec:authorize>

                <sec:authorize access="hasRole('ROLE_ADMIN')">
                <li class="nav-item">
                    <a class="nav-link text-danger" id="nav-admin" href="/admin">Admin</a>
                </li>
                </sec:authorize>

                <sec:authorize access="isAuthenticated()">
                <li class="nav-item">
                    <a class="nav-link" id="nav-library" href="/books">Library</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" id="nav-profile" href="/profile">Profile</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/logout">Log out</a>
                </li>
                </sec:authorize>
            </ul>
        </div>
    </div>
</nav>