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
                                <input id="id" name="id" value="${kuliah.id.id}" placeholder="masukkan id" class="form-control input-xlarge" required="" type="text">
                            </div>
                        </div>

                        <!-- Text input-->
                        <div class="control-group">
                            <label class="control-label" for="namamatakuliah">Nama Mata Kuliah</label>
                            <div class="controls">
                                <select name="namamatakuliah"  id="e3">
                                    <option></option>
                                    <optgroup label="Umum">
                                        <option value="ppkn">Pendidikan Kewarganegaraan</option>
                                        <option value="agama">Agama</option>
                                        <option value="inggris">Bahasa Inggris</option>
                                        <option value="mandarin">Bahasa Mandarin</option>
                                    </optgroup>
                                    <optgroup label="Teknik Informatika">
                                        <option value="alpro">Algoritama Pemrograman</option>
                                        <option value="pbo">Pemrograman Beriontasi Object</option>
                                        <option value="rpl">Rekyasa Perangkat Lunak</option>
                                    </optgroup>
                                </select>
                            </div>
                        </div>
                                
                        <!-- Text input -->
                        <div class="control-group">
                            <label class="control-label" for="nik">NIK</label>
                            <div class="controls">                     
                                <select name="nik"  id="e1">
                                    <option></option>
                                    <c:forEach items="${listNik}" var="item" varStatus="count">
                                        <option value="${item.nik}">${item.nik} ${item.nama}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                            
                        <!-- Text input-->
                        <div class="control-group">
                            <label class="control-label" for="nim">NIM</label>
                            <div class="controls">
                                <select name="nim"  id="e2">
                                    <option></option>
                                    <c:forEach items="${listNim}" var="item" varStatus="count">
                                        <option value="${item.noPendaftaran}">${item.noPendaftaran} ${item.nama}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                          
                        <br> <!--add distance !-->
                        
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
        
        <script>
            $(document).ready(function() { $("#e1").select2({placeholder: "Pilih Dosen",width: '100%'}); });
            
            $(document).ready(function() { $("#e2").select2({placeholder: "Pilih Mahasiswa",width: '100%'}); });
            
            $(document).ready(function() { $("#e3").select2({placeholder: "Pilih Jurusan",width: '100%'}); });
        </script>
    </body>
</html>

