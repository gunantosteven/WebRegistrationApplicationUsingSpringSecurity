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
            
            <div class="row">
                <div class="box">
                    <div class="col-lg-12">
                        
                        <form class="form-horizontal" method="POST" action="${pageContext.request.contextPath}/rekening/save" >  
                            <fieldset>

                                <!-- Form Name -->
                                <legend>Masukan Rekening</legend>


                                <!-- Text input-->
                                <div class="control-group">
                                    <label class="control-label" for="noPendaftaran">No. Pendaftaran</label>
                                    <div class="controls">
                                        <input id="noPendaftaran" name="noPendaftaran" value="${mahasiswa.noPendaftaran}" placeholder="masukkan no. pendaftaran" class="form-control" required="" type="text" readonly="readonly">
                                    </div>
                                </div>


                                <!-- Text input-->
                                <div class="control-group">
                                    <label class="control-label" for="noRekening">No Rekening</label>
                                    <div class="controls">
                                        <input id="noRekening" name="noRekening" value="${mahasiswa.rekening.noRekening}" placeholder="masukkan no rekening" class="form-control" required="" type="text">
                                    </div>
                                </div>

                                <!-- Text input-->
                                <div class="control-group">
                                    <label class="control-label" for="namaRekening">Nama Rekening</label>
                                    <div class="controls">
                                        <input id="namaRekening" name="namaRekening" value="${mahasiswa.rekening.namaRekening}" placeholder="masukkan nama rekening" class="form-control" required="" type="text">
                                    </div>
                                </div>

                                <!-- Text input-->
                                <div class="control-group">
                                    <label class="control-label" for="nominal">Nominal</label>
                                    <div class="controls">
                                        <input id="nominal" name="nominal" value="${mahasiswa.rekening.nominal}" placeholder="masukkan nominal" class="form-control" required="" type="number">
                                    </div>
                                </div>

                                <!-- Text input-->
                                <div class="control-group">
                                    <label class="control-label" for="status">Status</label>
                                    <div class="controls">
                                        <input id="status" name="status" value="${mahasiswa.status}" placeholder="masukkan no. status" class="form-control" required="" type="text" readonly="readonly">
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
                </div> 
            </div>                            


        </div> <!-- /container -->
        
        <jsp:include page="include/footer.jsp" />
        
        <!-- Script to Activate the Carousel -->
        <script>
        $('.carousel').carousel({
            interval: 5000 //changes the speed
        })
        </script>
      
    </body>
</html>
