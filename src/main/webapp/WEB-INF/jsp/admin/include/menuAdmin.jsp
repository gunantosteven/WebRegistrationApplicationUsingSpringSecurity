<%-- 
    Document   : menu
    Created on : Oktober 3, 2014, 5:27:34 AM
    Author     : gunanto 
--%>

<div class="navbar navbar-inverse navbar-fixed-top">
    <div class="navbar-inner">
        <div class="container">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">Admin UWIKA</a>
            <div class="navbar-collapse collapse">
                <ul class="nav navbar-nav">
                    <li class="dropdown">
                        <a data-toggle="dropdown" class="dropdown-toggle" role="button" href="#" id="drop1"><b class="caret white-caret"></b> &nbsp;Dosen </a>
                        <ul aria-labelledby="drop1" role="menu" class="dropdown-menu">
                            <li role="presentation"><a href="${pageContext.request.contextPath}/admin/dosen"><i class="icon-star icon-white"> </i>&nbsp;List Dosen</a></li>
                            <li class="divider"></li>
                            <li role="presentation"><a href="${pageContext.request.contextPath}/admin/dosen/new"><i class="icon-star icon-white"> </i>&nbsp;Buat Dosen</a></li>
                        </ul>
                    </li>   
                    <li><a href="${pageContext.request.contextPath}/admin/mahasiswa"><i class="icon-cog icon-white"> </i>&nbsp;Mahasiswa</a></li>
                    <li class="dropdown">
                        <a data-toggle="dropdown" class="dropdown-toggle" role="button" href="#" id="drop1"><b class="caret white-caret"></b> &nbsp;Kuliah </a>
                        <ul aria-labelledby="drop1" role="menu" class="dropdown-menu">
                            <li role="presentation"><a href="${pageContext.request.contextPath}/admin/kuliah"><i class="icon-star icon-white"> </i>&nbsp;List Kuliah</a></li>
                            <li class="divider"></li>
                            <li role="presentation"><a href="${pageContext.request.contextPath}/admin/kuliah/new"><i class="icon-star icon-white"> </i>&nbsp;Buat Kuliah</a></li>
                        </ul>
                    </li>  
                    <li><a href="javascript:formSubmit()"><i class="icon-bar icon-white"> </i> &nbsp;Log Out</a></li>
                </ul>
            </div><!--/.nav-collapse -->
        </div>
    </div>
                        
    <form action="${pageContext.request.contextPath}/j_spring_security_logout" method="post" id="logoutForm">
            <input type="hidden" name="${_csrf.parameterName}"
                    value="${_csrf.token}" />
    </form>
    <script>
            function formSubmit() {
                    document.getElementById("logoutForm").submit();
            }
    </script>        
    
</div>
