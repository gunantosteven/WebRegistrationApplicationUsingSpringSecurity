<%-- 
    Document   : dosen
    Created on : Nov 3, 2013, 4:25:20 AM
    Author     : edwin < edwinkun at gmail dot com >
--%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Test Application</title>
       
        <jsp:include page="include/headerAdmin.jsp" />

    </head>

    <body>

        <jsp:include page="include/menuAdmin.jsp" />

        <div class="container">

            <h1>Kuliah</h1> <br />
            <div id="dynamic">
                <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered"id="example">
                    <thead>
                        <tr>
                            <th width="20%">ID</th>
                            <th width="30%">Nama Mata Kuliah</th>
                            <th width="15%">NIK</th>
                            <th width="15%">NIM</th>
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
                    "sAjaxSource": "kuliah/list?${_csrf.parameterName}=${_csrf.token}",
                    "sServerMethod": "POST", 
                    "sPaginationType": "full_numbers",
                    "aaSorting": [[0,'desc']],  
                    "aoColumns" : [   
                         { sWidth: '20%', 
                        "bSortable": true,
                        "aTargets": [0]}, 
                        { sWidth: '30%', "bSortable": false }, 
                        { sWidth: '15%', "bSortable": false },
                        { sWidth: '15%', "bSortable": false },
                        {sWidth: '20%', 
                            "mRender": function( data, type, row ) {
                                    return '<a href="kuliah/delete/'+row[0]+'/'+row[1]+'/'+row[2]+'/'+row[3]+'">Delete</a>';
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
