<%-- 
    Document   : index.jsp
    Created on : Sep 17, 2014, 1:03:24 PM
    Author     : Steven Gunanto
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Universitas Widya Kartika</title>
        
        <jsp:include page="include/header.jsp" />
    </head>
    <body onload="messageRegistrasion();">
        
        <jsp:include page="include/menu.jsp" />

        <h1>${message}</h1>
        
        
        <jsp:include page="include/footer.jsp" />
        
        <!-- Script to Activate the Carousel -->
        <script>
        $('.carousel').carousel({
            interval: 5000 //changes the speed
        })
        </script>
      
    </body>
</html>