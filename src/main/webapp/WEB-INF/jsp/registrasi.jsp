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
        
        
        
        <div class="container">
            
            <div id="dynamic">
                <form class="form-horizontal" method="POST" action="${pageContext.request.contextPath}/registrasi/export" >  
                    <fieldset>

                        <!-- Form Name -->
                        <legend>Identitas Mahasiswa</legend>
                        
                        <!-- Text input-->
                        <div class="control-group">
                            <label class="control-label" for="noPendaftaran">No. Pendaftaran</label>
                            <div class="controls">
                                <input id="noPendaftaran" name="noPendaftaran" value="${noPendaftaran}" placeholder="masukkan no. pendaftaran" class="form-control" required="" type="text" readonly="readonly">
                            </div>
                        </div>
                        
                        <!-- Select -->
                        <div class="control-group">
                            <label class="control-label" for="jurusan">Jurusan</label>
                            <div class="controls" >
                                <select name="jurusan"  id="e1">
                                    <option></option>
                                    <optgroup label="Teknik">
                                        <option value="informatika">Informatika</option>
                                        <option value="sipil">Sipil</option>
                                        <option value="arsitektur">Arsitektur</option>
                                        <option value="elektro">Elekto</option>
                                    </optgroup>
                                    <optgroup label="Sastra">
                                        <option value="inggris">Inggris</option>
                                        <option value="mandarin">Mandarin</option>
                                    </optgroup>
                                    <optgroup label="Ekonomi">
                                        <option value="manajemen">Manajemen</option>
                                        <option value="ibp">Internationl Business Program</option>
                                        <option value="akuntasi">Akuntasi</option>
                                    </optgroup>
                                </select>
                            </div>
                        </div>

                        <!-- Text input-->
                        <div class="control-group">
                            <label class="control-label" for="nama">Nama Lengkap</label>
                            <div class="controls">
                                <input id="nama" name="nama" placeholder="masukkan nama lengkap" class="form-control" required="" type="text">
                            </div>
                        </div>
                        
                        <!-- Radio Button-->
                        <div class="control-group">
                            <label class="control-label" for="jenisKelamin">Jenis Kelamin</label>
                            <div class="controls" data-toggle="buttons">
                                <label class="btn btn-default active">
                                    <input type="radio" name="jenisKelamin" id="l" value="l" checked>
                                Laki-laki </label>
                                <label class="btn btn-default">
                                    <input type="radio" name="jenisKelamin" id="p" value="p">
                                Perempuan </label>
                            </div>
                        </div>
                        
                        <!-- Text Input -->
                        <div class="control-group">
                            <label class="control-label" for="tempatLahir">Tempat Lahir</label>
                            <div class="controls">                     
                                <input id="tempatLahir" name="tempatLahir" placeholder="masukan tempat lahir" class="form-control" required="" type="text">
                            </div>
                        </div>
                        
                        <!-- Date Picker -->
                        <div class="control-group">
                            <label class="control-label" for="tanggalLahir">Tanggal Lahir</label>
                             <input class="form-control" placeholder="click to show datepicker"  id="datepicker" name="tanggalLahir" required type="date">
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
                                <textarea id="alamat" name="alamat" class="form-control" rows="6"></textarea>
                            </div>
                        </div>
                        
                        <!-- Text Input -->
                        <div class="control-group">
                            <label class="control-label" for="noTelpon">No. Telpon</label>
                            <div class="controls">                     
                                <input id="noTelpon" name="noTelpon" placeholder="masukan no. telpon" class="form-control" required="" type="text">
                            </div>
                        </div>
                        
                        <!-- Text Input -->
                        <div class="control-group">
                            <label class="control-label" for="email">Alamat E-mail</label>
                            <div class="controls">                     
                                <input id="email" name="email" placeholder="masukan alamat e-mail" class="form-control" required="" type="email">
                            </div>
                        </div>
                        
                        <br> <!--add distance between email and button submit-->
                        
                        <!-- submit -->
                        <div class="control-group">
                            <div class="controls">
                                <button type="submit" id="submit" class="btn btn-success">Submit</button>
                            </div>
                        </div>
                        
                        <br> <!--add distance between submit and footer-->
                        
                        <input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
                        
                    </fieldset>
                </form>

            </div>


        </div> <!-- /container -->
        <jsp:include page="include/footer.jsp" />
        
        <!-- Script to Activate the Carousel -->
        <script>
        $('.carousel').carousel({
            interval: 5000 //changes the speed
        })
        </script>
        
        <script type="text/javascript">
            // When the document is ready
            $(document).ready(function () {
                
                $('#datepicker').datepicker({
                    format: "yyyy-mm-dd"
                });  
            
            });
        </script>
        
        <script type="text/javascript">
            function messageRegistrasion() {
                var validation = "${validasi}";
                if(validation != null && validation != "")
                {
                    alert(validation);
                    window.location.href = "${pageContext.request.contextPath}" + "/registrasi";
                }
                    
            }
        </script>
        
        <script>
            $(document).ready(function() { $("#e1").select2({placeholder: "Pilih Jurusan",width: '100%'}); });
        </script>
      
    </body>
</html>
