<%@page import="Logica.Usuario"%>
<%@page import="java.util.List"%>
<%@page import="Logica.ControladoraLogica"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="es" charset="UTF-8">
    <%@include file="../../GENERALES/head.jsp"%>

    <body class="hold-transition layout-top-nav">
        <div class="wrapper">

            <!-- Navbar -->
            <%@include file="../../GENERALES/navbar.jsp"%>
            <!-- /.navbar -->

            <!-- MODAL ADD USUARIO -->
            <%@include file="../ADD/UsuarioModalADD.jsp"%>

            <!-- MODAL EDITAR USUARIO -->
            <%@include file="../EDIT/UsuarioModalEDIT.jsp"%>

            <!-- MODAL ELIMINAR EMPLEADO -->
            <%@include file="../DEL/UsuarioModalDELETE.jsp"%>


            <!-- MAIN CONTENT -->
            <div class="content-wrapper">
                <!-- Content Header (Page header) -->
                <div class="content-header">
                    <div class="container">
                        <div class="row mb-2">
                            <div class="col-sm-9">
                                <h1> Gestión de Usuarios</h1>
                            </div>
                        </div><!-- /.row -->
                    </div><!-- /.container-fluid -->
                </div>
                <!-- /.content-header -->

                <!-- Main content CONTENT-->
                <div class="content">
                    <div class="container">
                        <!-- TABLA DE LIST -->
                        <div class="card">
                            <div class=" card-header bg-primary">
                                <p class="card-title" style="margin-top: 8px;"> Usuarios registrados en el Sistema</p>
                                <button type="button" class="float-right btn btn-success" data-toggle="modal" data-target="#modal-lg-crear">
                                    Agregar Nuevo Usuario
                                    <i class="fas fa-user-plus"></i>
                                </button>
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body">
                                <div class="dataTables_wrapper dt-bootstrap4">
                                    <div class="row">

                                        <div class="col-sm-12">
                                            <table id="example1" class="table table-bordered table-striped dataTable dtr-inline" role="grid">
                                                <thead>
                                                    <tr>
                                                        <th class="sorting sorting_asc" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" style="width:44%">Nombre Usuario</th>
                                                        <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" style="width:44%">Empleado Asociado</th>
                                                        <th tabindex="0"  rowspan="1" colspan="1" style="width:12%">Acciones</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <%
                                                        String nombre_usuario;
                                                        String empleado_asociado;
                                                        ControladoraLogica controlUser = new ControladoraLogica();
                                                        List<Usuario> listaUsuarios = controlUser.listaUsers();
                                                        for (Usuario user : listaUsuarios) {
                                                            nombre_usuario = user.getNombreUsuario();
                                                            empleado_asociado = user.getEmpleadoAsoc().toString();
                                                    %>
                                                    <tr id="<%=nombre_usuario%>" class="odd">
                                                        <td class="dtr-control sorting_1" tabindex="0"><%=nombre_usuario%></td>
                                                        <td><%=empleado_asociado%></td>
                                                        <td class="align-content-center">
                                                            <button id="<%=nombre_usuario%>" onclick="rellenarModalEdit(<%=nombre_usuario%>)" type="button" class="btn btn-warning btn-xs" data-toggle="modal" data-target="#modal-lg-edit"><i class="far fa-edit"></i></button>
                                                            <button id="<%=nombre_usuario%>" onclick="rellenarModalDelete(<%=nombre_usuario%>)" type="button" class="btn btn-danger btn-xs"  data-toggle="modal" data-target="#modal-lg-delete"><i class="far fa-trash-alt"></i></button>
                                                        </td>
                                                    </tr>  

                                                    <%}
                                                        nombre_usuario = "";
                                                    %>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div><!-- /.container-fluid -->
            </div>
            <!-- /.content -->
        </div>
        <!-- /.content-wrapper -->


        <!-- Main Footer -->
        <%@include file="../../GENERALES/footer.jsp"%>

        <!-- REQUIRED SCRIPTS -->

        <!-- jQuery -->
        <script src="../../plugins/jquery/jquery.min.js"></script>
        <!-- Bootstrap 4 -->
        <script src="../../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
        <!-- DataTables  & Plugins -->
        <script src="../../plugins/datatables/jquery.dataTables.min.js"></script>
        <script src="../../plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
        <script src="../../plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
        <script src="../../plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
        <script src="../../plugins/datatables-buttons/js/dataTables.buttons.min.js"></script>
        <script src="../../plugins/datatables-buttons/js/buttons.bootstrap4.min.js"></script>
        <script src="../../plugins/jszip/jszip.min.js"></script>
        <script src="../../plugins/pdfmake/pdfmake.min.js"></script>
        <script src="../../plugins/pdfmake/vfs_fonts.js"></script>
        <script src="../../plugins/datatables-buttons/js/buttons.html5.min.js"></script>
        <script src="../../plugins/datatables-buttons/js/buttons.print.min.js"></script>
        <script src="../../plugins/datatables-buttons/js/buttons.colVis.min.js"></script>
        <!-- AdminLTE App -->
        <script src="../../dist/js/adminlte.min.js"></script>


        <!-- DataTable script para poner en Español y agregar funcionalidad adicional. No tocar-->
        <script>
                                                                $("#example1").DataTable({
                                                                    "language": {
                                                                        "sProcessing": "Procesando...",
                                                                        "sLengthMenu": "Mostrar _MENU_ registros",
                                                                        "sZeroRecords": "No se encontraron resultados",
                                                                        "sEmptyTable": "Ningún dato disponible en esta tabla",
                                                                        "sInfo": "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
                                                                        "sInfoEmpty": "Mostrando registros del 0 al 0 de un total de 0 registros",
                                                                        "sInfoFiltered": "(filtrado de un total de _MAX_ registros)",
                                                                        "sInfoPostFix": "",
                                                                        "sSearch": "Buscar:",
                                                                        "sUrl": "",
                                                                        "sInfoThousands": ",",
                                                                        "sLoadingRecords": "Cargando...",
                                                                        "oPaginate": {
                                                                            "sFirst": "Primero",
                                                                            "sLast": "Último",
                                                                            "sNext": "Siguiente",
                                                                            "sPrevious": "Anterior"
                                                                        },
                                                                        "oAria": {
                                                                            "sSortAscending": ": Activar para ordenar la columna de manera ascendente",
                                                                            "sSortDescending": ": Activar para ordenar la columna de manera descendente"
                                                                        }
                                                                    },
                                                                    "responsive": true, "lengthChange": false, "autoWidth": false,
                                                                    "buttons": ["copy", "csv", "excel", "pdf", "print", "colvis"]
                                                                }).buttons().container().appendTo('#example1 .col-md-6:eq(0)');
        </script>

        <script>
            function rellenarModalEdit(idObj) {
                //console.log(idObj.id);
                $('#modal-lg-editar').modal('show');
                $.ajax({
                    url: '../../SvUsuario', // 
                    type: 'GET',
                    dataType: 'json',
                    data: {
                        'id_user': idObj.id,
                        'action': 'get_user_data',
                    },
                    success: function (data) {
                        document.getElementById('nombreUsuarioAct').setAttribute("value", data.nombreUsuario);
                        document.getElementById('passUser1').setAttribute("value", data.passUsuario);
                        nombreEmp = data.empleadoAsoc.nombre + " " +  data.empleadoAsoc.apellido;
                        document.getElementById('defaultEmp_edit').setAttribute("value", data.empleadoAsoc.dni);
                        document.getElementById('defaultEmp_edit').innerHTML = nombreEmp;
                    }
                });
            }
            
            function rellenarModalDelete(idObj){
                console.log(idObj.id);
                // Setea id de objeto en el botón de cerrar (modal DELETE)
                buttonD = document.getElementById('buttonDelete');
                buttonD.setAttribute("idObj", idObj.id); 
                
                // Genera mensaje de confirmación en modal DELETE y lo muestra
                pElement = document.getElementById('formMensajeDELETE');
                pElement.innerHTML = "¿Está seguro que desea eliminar al usuario '" + idObj.id +"'?";
                $('#modal-lg-delete').modal('show');
            }
            
            /* Función genérica de eliminación de objeto.
               Invocada en botón "Eliminar" de modal DELETE */
            function eliminarObjeto_usuario(objID) {
                console.log(objID.getAttribute("idObj"));
                $.ajax({
                    url: '../../SvUsuario',
                    type: 'POST',
                    dataType: 'json',
                    data: {
                        'id_user': objID.getAttribute("idObj"),
                        'action': 'delete',
                    },
                    success: function (data) {
                        location.replace(data[0]);
                    }
                });
            }
            
            function modificarObjeto(){
                // Chequeo contraseña
                pass1 = document.getElementById('passUser1').value;
                pass2 =  document.getElementById('passUser2').value;
                errorPass = document.getElementById('pErrorEDIT');
                errorPass.setAttribute("hidden","");
                
                if (pass1 === pass2){
                    //Edición objeto
                    $.ajax({
                        url: '../../SvUsuario', 
                        type: 'POST',
                        dataType: 'json',
                        data: {
                            'action': 'edit',
                            'id_user' : document.getElementById('nombreUsuarioAct').value,
                            'new_pass' : document.getElementById('passUser1').value,
                            'empleadoAsoc' : document.getElementById('selectEmpAsoc').value,
                        },
                        success: function (data) {
                            location.replace(data[0]);
                        }
                    });
                }else{
                    errorPass.removeAttribute("hidden");
                }
            }
        </script>
    </body>
</html>


