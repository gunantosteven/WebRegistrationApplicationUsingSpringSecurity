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
        <title>Home</title>
        
        <jsp:include page="include/header.jsp" />
    </head>
    <body>
        
        <jsp:include page="include/menu.jsp" />
        
        <div class="container">

        <div class="row">
            <div class="box">
                <div class="col-lg-12 text-center">
                    <div id="carousel-example-generic" class="carousel slide">
                        <!-- Indicators -->
                        <ol class="carousel-indicators hidden-xs">
                            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                            <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                            <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                        </ol>

                        <!-- Wrapper for slides -->
                        <div class="carousel-inner">
                            <div class="item active">
                                <img class="img-responsive img-full" src="${pageContext.request.contextPath}/img/slide-1.jpg" alt="">
                            </div>
                            <div class="item">
                                <img class="img-responsive img-full" src="${pageContext.request.contextPath}/img/slide-2.jpg" alt="">
                            </div>
                            <div class="item">
                                <img class="img-responsive img-full" src="${pageContext.request.contextPath}/img/slide-3.jpg" alt="">
                            </div>
                        </div>

                        <!-- Controls -->
                        <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                            <span class="icon-prev"></span>
                        </a>
                        <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                            <span class="icon-next"></span>
                        </a>
                    </div>
                    <h2 class="brand-before">
                        <small>Welcome to</small>
                    </h2>
                    <h1 class="brand-name">Universitas Widya Kartika</h1>
                    <hr class="tagline-divider">
                    <h2>
                        <small>By
                            <strong>Steven Gunanto</strong>
                        </small>
                    </h2>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="box">
                <div class="col-lg-12">
                    <hr>
                    <h2 class="intro-text text-center">Sekilasi Sejarah
                        <strong>Widya Kartika</strong>
                    </h2>
                    <hr>
                    <img class="img-responsive img-border img-left" src="img/intro-pic.jpg" alt="">
                    <hr class="visible-xs">
                        <p>Pendirian Universitas Widya Kartika pada tahun 1986 merupakan ujud nyata dari mimpi pengurus YPPI saat itu. Universitas Widya Kartika didirikan untuk melengkapi sistem pendidikan yang sudah dimiliki oleh YPPI menjadi pendidikan yang berkesinambungan, yaitu dari TK, SD, SMP, SMA dan Perguruan Tinggi.</p>
                        <p>Pengurus yang terlibat aktif dalam persiapan pendirian Universitas Widya Kartika adalah Bpk. Moch. Achwan, SH (Ketua), Bpk. Widyanto Tedja, SH, Bpk. Dipl. Ing. Johannes Kumala, Bpk. Hidayat, Bpk. Yusuf Arief Yudoyono, dan Bpk. Soeroto dan Bpk Oemar (alm). Pendirian Universitas Widya Kartika menjadi kebanggaan dari pengurus YPPI sebagai keberhasilan mereka dalam mengelola pendidikan di negeri tercinta ini.</p>
                        <p>Pengurus pada waktu itu melihat bahwa banyak lulusan siswa SMA YPPI yang tidak dapat melanjutkan ke perguruan tinggi karena masalah besarnya biaya yang harus dibayar untuk dapat masuk ke perguruan tinggi swasta. Tetapi kalau mau masuk ke perguruan tinggi negeri sangatlah sulit waktu itu terutama untuk anak-anak keturunan Tionghoa. Dari hasil angket yang dilakukan ke orang tua dan siswa SMA YPPI I dan SMA YPPI II, maka dipilih 6 (enam) jurusan yang terbagi dalam 2 fakultas yaitu:</p>
                
                        <p>Fakultas Ekonomi</p>
                        <ul>
                            <li>Jurusan Manajemen</li>
                            <li>Jurusan Akuntansi</li>
                            <li>Fakultas Teknik:</li>
                        </ul>
                        <p>Jurusan Teknik Sipil</p>
                        <ul>
                            <li>Jurusan Teknik Arsitektur</li>
                            <li>Jurusan Teknik Elektro</li>
                            <li>Jurusan Informatika</li>
                        </ul>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="box">
                <div class="col-lg-12">
                    <hr>
                    <center>
                        <h1>Penerimaan Mahasiswa</h1>
                    </center>
                    <hr>
                    <p>Calon mahasiswa Uwika dapat memilih cara pendaftaran:</p>
                    <ol>
                        <li><strong>Online Enrollment</strong><br />
                            Calon mahasiswa dapat melakukan pendaftaran secara online dengan mengakses website Universitas Widya Kartika (Uwika) Surabaya www.widyakartika.ac.id, lalu pilih menu <strong>Penerimaan Mahasiswa</strong> dan klik tombol <strong><span>Online Enrollment </span></strong>di bawah ini. MCC (Marketing &amp; Corporate Communication) staf akan segera merespon setiap berkas Online Enrollment yang masuk dan memberikan informasi tahap administrasi selanjutnya yang wajib dilakukan oleh calon mahasiswa.<p><center><a class="btn btn-primary btn-lg" href="${pageContext.request.contextPath}/registrasi" role="button">Online Enrollment</a></center></p></li>
                        <li><strong>Direct Enrollment</strong><br />
                        Calon mahasiswa dapat melakukan pendaftaran langsung dengan mendatangi kampus Uwika dan membeli formulir pendaftaran sebesar Rp. 200.000. Dapatkan juga Formulir Pendaftaran kami di sekolah dengan menghubungi Guru BK anda.</li>
                        <li><strong>Scholarship</strong><br />
                        Kami percaya setiap siswa memiliki prestasi baik akademis maupun non-akademis (prestasi seni,olahraga) karenanya kami memberikan keistimewaan dalam bentuk beasiswa prestasi akademik,beasiswa prestasi non-akademik, beasiswa USR dan beasiswa khusus sebagai wujud terima kasih kami bagi putra/putri Guru, PNS, staf Media. Hubungi MCC untuk mendapatkan informasi selengkapnya.</li>
                    </ol>
                    <p>&#8212;&#8211; &#8212;&#8212; &#8212;&#8212; &#8212;&#8211; &#8212;&#8211;</p>
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
