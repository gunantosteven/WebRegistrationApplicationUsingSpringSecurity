<%-- 
    Document   : admin
    Created on : Sep 20, 2014, 6:35:40 PM
    Author     : Steven Gunanto
--%>

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

            <h1>Mahasiswa</h1> <br />
            <div id="dynamic">
                <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered"id="example">
                    <thead>
                        <tr>
                            <th width="20%">No. Pendaftaran</th>
                            <th width="20%">Jurusan</th>
                            <th width="25%">Nama Lengkap</th>
                            <th width="15%">Status</th>
                            <th width="20%">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td colspan="5" class="dataTables_empty">Loading data from server</td>
                        </tr>
                    </tbody>                    
                </table>
            </div>


        </div> <!-- /container -->
        
        <div class="modal-footer">
            &copy; Testing App
        </div>

        
        
        <jsp:include page="include/footerAdmin.jsp" />
        
        <script type="text/javascript" charset="utf-8">
            
            $.extend( $.fn.dataTableExt.oStdClasses, {
                "sWrapper": "dataTables_wrapper form-inline"
            } );
            
            $(document).ready(function() {
                var myTable = $('#example').dataTable( {
                    "bProcessing": true,
                    "bServerSide": true,
                    "sAjaxSource": "mahasiswa/list?${_csrf.parameterName}=${_csrf.token}",
                    "sServerMethod": "POST", 
                    "sPaginationType": "full_numbers",
                    "aaSorting": [[0,'desc']],  
                    "aoColumns" : [   
                         { sWidth: '20%', 
                            "mRender": function( data, type, row ) {
                                    return '<a href="mahasiswa/detail/'+row[0]+'">'+row[0]+'</a>';
                            },
                        "bSortable": true,
                        "aTargets": [0]}, 
                        { sWidth: '20%', "bSortable": false }, 
                        { sWidth: '25%', "bSortable": false },
                        { sWidth: '15%', "bSortable": false },
                        { sWidth: '20%', 
                            "mRender": function( data, type, row ) {
                                    return '<a href="mahasiswa/delete/'+row[0]+'">Delete</a>';
                            },
                        "bSortable": false}
                    ] 
                } );	
                
                $('#example_filter input').unbind();
                $('#example_filter input').bind('keyup', function(e) {
                    if(e.keyCode == 13) {
                        myTable.fnFilter(this.value);   
                    }
                });
                
            } );
        </script>
        
    </body>
</html>

