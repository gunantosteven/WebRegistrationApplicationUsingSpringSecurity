<%-- 
    Document   : admin
    Created on : Sep 20, 2014, 6:35:40 PM
    Author     : Steven Gunanto
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Universitas Widya Kartika</title>
        
        <jsp:include page="include/headerAdmin.jsp" />
    </head>
    <body>
        
        <jsp:include page="include/menuAdmin.jsp" />
        
        <div class="container">
               <div id="dynamic">
                    <form class="form-horizontal" method="POST" action="${pageContext.request.contextPath}/admin/mahasiswa/save" >  
                        <fieldset>

                            <!-- Form Name -->
                            <legend>Identitas Mahasiswa</legend>


                            <!-- Text input-->
                            <div class="control-group">
                                <label class="control-label" for="noPendaftaran">No. Pendaftaran</label>
                                <div class="controls">
                                    <input id="noPendaftaran" name="noPendaftaran" value="${mahasiswa.noPendaftaran}" placeholder="masukkan no. pendaftaran" class="form-control" required="" type="text" readonly="readonly">
                                </div>
                            </div>

                            <!-- Select -->
                            <div class="control-group">
                                <label class="control-label" for="jurusan">Jurusan</label>
                                <div class="controls" >
                                    <select class="form-control" name="jurusan">
                                        <option value="informatika" ${mahasiswa.jurusan == 'informatika' ? "selected" : ""}>Informatika</option>
                                        <option value="akuntasi" ${mahasiswa.jurusan == 'akuntasi' ? "selected" : ""}>Akuntasi</option>
                                        <option value="inggris" ${mahasiswa.jurusan == 'inggris' ? "selected" : ""}>Sastra Inggris</option>
                                        <option value="mandarin" ${mahasiswa.jurusan == 'mandarin' ? "selected" : ""}>Sastra Mandarin</option>
                                        <option value="arsitektur" ${mahasiswa.jurusan == 'arsitektur' ? "selected" : ""}>Arsitektur</option>
                                      </select>
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="control-group">
                                <label class="control-label" for="nama">Nama Lengkap</label>
                                <div class="controls">
                                    <input id="nama" name="nama" value="${mahasiswa.nama}" placeholder="masukkan nama lengkap" class="form-control" required="" type="text">
                                </div>
                            </div>

                            <!-- Radio Button-->
                            <div class="control-group">
                                <label class="control-label" for="jenisKelamin">Jenis Kelamin</label>
                                <div class="controls" data-toggle="buttons">
                                    <label class="btn btn-default ${mahasiswa.jenisKelamin == 'l' ? "active" : ""}">
                                        <input type="radio" name="jenisKelamin" id="l" value="l" ${mahasiswa.jenisKelamin == 'l' ? "checked" : ""} >
                                    Laki-laki </label>
                                    <label class="btn btn-default ${mahasiswa.jenisKelamin == 'p' ? "active" : ""}">
                                        <input type="radio" name="jenisKelamin" id="p" value="p" ${mahasiswa.jenisKelamin == 'p' ? "checked" : ""} >
                                    Perempuan </label>
                                </div>
                            </div>

                            <!-- Text Input -->
                            <div class="control-group">
                                <label class="control-label" for="tempatLahir">Tempat Lahir</label>
                                <div class="controls">                     
                                    <input id="tempatLahir" name="tempatLahir" value="${mahasiswa.tempatLahir}" placeholder="masukan tempat lahir" class="form-control" required="" type="text">
                                </div>
                            </div>

                            <!-- Date Picker -->
                            <div class="control-group">
                                <label class="control-label" for="tanggalLahir">Tanggal Lahir</label>
                                 <input class="form-control" placeholder="click to show datepicker"  value="${mahasiswa.tanggalLahir}" id="datepicker" name="tanggalLahir" required type="date">
                            </div>

                             <!-- Select -->
                            <div class="control-group">
                                <label class="control-label" for="agama">Agama</label>
                                <div class="controls">
                                      <select class="form-control" name="agama">
                                        <option value="kristen">Kristen</option>
                                        <option value="katolik">Katolik</option>
                                        <option value="islam">Islam</option>
                                        <option value="hindu">Hindu</option>
                                        <option value="buddha">Buddha</option>
                                      </select>
                                </div>
                            </div>

                            <!-- Textarea -->
                            <div class="control-group">
                                <label class="control-label" for="alamat">Alamat</label>
                                <div class="controls">      
                                    <textarea id="alamat" name="alamat" class="form-control" rows="6">${mahasiswa.alamat}</textarea>
                                </div>
                            </div>

                            <!-- Text Input -->
                            <div class="control-group">
                                <label class="control-label" for="noTelpon">No. Telpon</label>
                                <div class="controls">                     
                                    <input id="noTelpon" name="noTelpon" value="${mahasiswa.noTelpon}" placeholder="masukan no. telpon" class="form-control" required="" type="text">
                                </div>
                            </div>

                            <!-- Text Input -->
                            <div class="control-group">
                                <label class="control-label" for="email">Alamat E-mail</label>
                                <div class="controls">                     
                                    <input id="email" name="email" value="${mahasiswa.email}" placeholder="masukan alamat e-mail" class="form-control" required="" type="email">
                                </div>
                            </div>

                            <br> <!--add distance between email and button submit-->

                            <!-- submit -->
                            <div class="control-group">
                                <div class="controls">
                                    <button type="submit" id="submit" class="btn btn-success">Update</button>
                                </div>
                            </div>

                            <br> <!--add distance between submit and footer-->

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
        
        <script type="text/javascript">
            // When the document is ready
            $(document).ready(function () {
                
                $('#datepicker').datepicker({
                    format: "yyyy-mm-dd"
                });  
            
            });
        </script>
        
    </body>
</html>

