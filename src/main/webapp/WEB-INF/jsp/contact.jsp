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
    <body>
        
        <jsp:include page="include/menu.jsp" />
        

        <div class="container">

            <div class="row">
                <div class="box">
                    <div class="col-lg-12">
                        <hr>
                        <h2 class="intro-text text-center">Contact
                            <strong>Widya Kartika</strong>
                        </h2>
                        <hr>
                    </div>
                    <div class="col-md-8">
                        <!-- Embedded Google Map using an iframe - to select your location find it on Google maps and paste the link as the iframe src. If you want to use the Google Maps API instead then have at it! -->
                        <iframe width="100%" height="400" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1978.914400863264!2d112.794902!3d-7.260315999999971!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2dd7f9f6cec3c03d%3A0xf8798c0f7c0b11f5!2sUniversitas+Widya+Kartika!5e0!3m2!1sen!2sid!4v1415269673187"></iframe>
                    </div>
                    <div class="col-md-4">
                        <p>Phone:
                            <strong>+62-31-5922403 / 5926359</strong>
                        </p>
                        <p>Email:
                            <strong><a href="mailto:info@widyakartika.ac.id">info@widyakartika.ac.id</a></strong>
                        </p>
                        <p>Address:
                            <strong>JL. SUTOREJO PRIMA UTARA II/1 SURABAYA
                                <br>JAWA TIMUR, INDONESIA</strong>
                        </p>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>

            <div class="row">
                <div class="box">
                    <div class="col-lg-12">
                        <hr>
                        <h2 class="intro-text text-center">Contact
                            <strong>form</strong>
                        </h2>
                        <hr>
                        <p>Jika ada kritik dan saran, anda dapat mengisi contact form di bawah ini pastikan data yang anda masukan benar</p>
                        <form role="form">
                            <div class="row">
                                <div class="form-group col-lg-4">
                                    <label>Name</label>
                                    <input type="text" class="form-control">
                                </div>
                                <div class="form-group col-lg-4">
                                    <label>Email Address</label>
                                    <input type="email" class="form-control">
                                </div>
                                <div class="form-group col-lg-4">
                                    <label>Phone Number</label>
                                    <input type="tel" class="form-control">
                                </div>
                                <div class="clearfix"></div>
                                <div class="form-group col-lg-12">
                                    <label>Message</label>
                                    <textarea class="form-control" rows="6"></textarea>
                                </div>
                                <div class="form-group col-lg-12">
                                    <input type="hidden" name="save" value="contact">
                                    <button type="submit" class="btn btn-default">Submit</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

        </div>
        <!-- /.container -->        
        
        
        
        <jsp:include page="include/footer.jsp" />
        
        <!-- Script to Activate the Carousel -->
        <script>
        $('.carousel').carousel({
            interval: 5000 //changes the speed
        })
        </script>
        
    </body>
</html>
