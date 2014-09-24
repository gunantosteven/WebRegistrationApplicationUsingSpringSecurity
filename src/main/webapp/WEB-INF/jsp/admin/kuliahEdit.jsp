<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- 
    Document   : dosenEdit
    Created on : Nov 3, 2013, 12:33:53 PM
    Author     : edwin < edwinkun at gmail dot com >
--%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Detail Dosen</title>

        <jsp:include page="include/headerAdmin.jsp" />

    </head>

    <body>

        <jsp:include page="include/menuAdmin.jsp" />

        <div class="container">
            <div id="dynamic">
                <form class="form-horizontal" method="POST" action="${pageContext.request.contextPath}/admin/kuliah/save">
                    <fieldset>

                        <!-- Form Name -->
                        <c:choose>
                            <c:when test="${dosen != null}">
                                <legend>Kuliah ${dosen.nama}</legend>
                            </c:when>
                            <c:otherwise>
                                <legend>Kuliah</legend>
                            </c:otherwise>
                        </c:choose>
                        
                        <!-- Text input-->
                        <div class="control-group">
                            <label class="control-label" for="id">ID</label>
                            <div class="controls">
                                <input id="id" name="id" value="${kuliah.id.id}" placeholder="masukkan id" class="input-xlarge" required="" type="text">
                            </div>
                        </div>

                        <!-- Text input-->
                        <div class="control-group">
                            <label class="control-label" for="namamatakuliah">Nama Mata Kuliah</label>
                            <div class="controls">
                                <input id="nama" name="namamatakuliah" value="${kuliah.id.namamatakuliah}" placeholder="masukkan nama mata kuliah" class="input-xlarge" required="" type="text">

                            </div>
                        </div>
                                
                        <!-- Text input -->
                        <div class="control-group">
                            <label class="control-label" for="nik">NIK</label>
                            <div class="controls">                     
                                <input id="nik" name="nik" value="${kuliah.id.nik}" placeholder="masukkan nik" class="input-xlarge" required="" type="text">
                            </div>
                        </div>
                            
                        <!-- Text input-->
                        <div class="control-group">
                            <label class="control-label" for="nim">NIM</label>
                            <div class="controls">
                                <input id="nim" name="nim" value="${kuliah.id.nim}" placeholder="masukkan nim" class="input-xlarge" required="" type="text">

                            </div>
                        </div>
                          
                        <!-- submit -->
                        <div class="control-group">
                            <div class="controls">
                                <button type="submit" class="btn btn-default">Submit</button>
                            </div>
                        </div>
                        
                        <input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
                        
                    </fieldset>
                </form>

            </div>


        </div> <!-- /container -->

        <div class="modal-footer">
            &copy; Testing App
        </div>

        <jsp:include page="include/footerAdmin.jsp" />
    </body>
</html>

