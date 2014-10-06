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
                <form class="form-horizontal" method="POST" action="${pageContext.request.contextPath}/admin/dosen/save">
                    <fieldset>

                        <!-- Form Name -->
                        <c:choose>
                            <c:when test="${dosen != null}">
                                <legend>Dosen ${dosen.nama}</legend>
                            </c:when>
                            <c:otherwise>
                                <legend>Dosen</legend>
                            </c:otherwise>
                        </c:choose>
                        
                        <!-- Text input-->
                        <div class="control-group">
                            <label class="control-label" for="nik">NIK</label>
                            <div class="controls">
                                <input id="nik" name="nik" value="${dosen.nik}" placeholder="masukkan nik" class="form-control input-xlarge" required="" type="text">
                            </div>
                        </div>

                        <!-- Text input-->
                        <div class="control-group">
                            <label class="control-label" for="nama">Nama</label>
                            <div class="controls">
                                <input id="nama" name="nama" value="${dosen.nama}" placeholder="masukkan nama" class="form-control input-xlarge" required="" type="text">

                            </div>
                        </div>

                        <!-- Textarea -->
                        <div class="control-group">
                            <label class="control-label" for="alamat">Alamat</label>
                            <div class="controls">                     
                                <textarea class="form-control" id="alamat" name="alamat"> ${dosen.alamat}</textarea>
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

