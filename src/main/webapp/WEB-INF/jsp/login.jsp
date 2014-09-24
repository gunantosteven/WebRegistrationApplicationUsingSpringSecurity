<%-- 
    Document   : admin
    Created on : Sep 20, 2014, 6:35:40 PM
    Author     : Steven Gunanto
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Universitas Widya Kartika</title>
        
        <style>
            .error {
                    padding: 15px;
                    margin-bottom: 20px;
                    border: 1px solid transparent;
                    border-radius: 4px;
                    color: #a94442;
                    background-color: #f2dede;
                    border-color: #ebccd1;
            }

            .msg {
                    padding: 15px;
                    margin-bottom: 20px;
                    border: 1px solid transparent;
                    border-radius: 4px;
                    color: #31708f;
                    background-color: #d9edf7;
                    border-color: #bce8f1;
            }
        </style>
        
        <jsp:include page="include/header.jsp" />
    </head>
    <body>
        
        <jsp:include page="include/menu.jsp" />
        
        <div class="container">
            
            <div id="dynamic">
                
                <c:if test="${not empty error}">
			<div class="error">${error}</div>
		</c:if>
		<c:if test="${not empty msg}">
			<div class="msg">${msg}</div>
		</c:if>

                
                <form class="form-horizontal" method="POST" action="${pageContext.request.contextPath}/j_spring_security_check" >  
                    <fieldset>

                        <!-- Form Name -->
                        <legend>Login Admin</legend>
                        
                        
                        <!-- Text input-->
                        <div class="control-group">
                            <label class="control-label" for="username">Username</label>
                            <div class="controls">
                                <input id="noPendaftaran" name="username" placeholder="Username" class="form-control" required="" type="text">
                            </div>
                        </div>
                        
                        <!-- Text input-->
                        <div class="control-group">
                            <label class="control-label" for="password">Password</label>
                            <div class="controls">
                                <input id="noPendaftaran" name="password" placeholder="Password" class="form-control" required="" type="password">
                            </div>
                        </div>
                        
                        <br>
                            
                        <!-- submit -->
                        <div class="control-group">
                            <div class="controls">
                                <button type="submit" id="submit" class="btn btn-success">Login</button>
                            </div>
                        </div>
                        
                        <input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
                        
                        <br>
                        
                    </fieldset>
                </form>

            </div>
        
        
        <jsp:include page="include/footer.jsp" />
        
        <!-- Script to Activate the Carousel -->
        <script>
        $('.carousel').carousel({
            interval: 5000 //changes the speed
        })
        </script>
        
    </body>
</html>

