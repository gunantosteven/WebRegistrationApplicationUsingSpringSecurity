<%-- 
    Document   : menu
    Created on : Sept 17, 2014, 12:52:42 PM
    Author     : gunanto < gunantosteven at gmail dot com >
--%>

    <div class="brand">Universitas Widya Kartika</div>
    <div class="address-bar">Jl. Sutorejo Prima Utara II/1 Surabaya | Jawa Timur | Indonesia</div>

    <!-- Navigation -->
    <nav class="navbar navbar-inverse" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <!-- navbar-brand is hidden on larger screens, but visible when the menu is collapsed -->
                <a class="navbar-brand" href="index.html">Universitas Widya Kartika</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li>
                        <a href="${pageContext.request.contextPath}/">Home</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/registrasi">Registrasi</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/about">About</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/contact">Contact</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/login">Login</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>

