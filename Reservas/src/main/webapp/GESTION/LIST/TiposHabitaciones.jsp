<%@page import="java.util.List"%>
<%@page import="Logica.TipoHabitacion"%>
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

            <!-- MODAL ADD TIPO HABITACIÓN -->
            <%@include file="../ADD/TipoHabitacionModalADD.jsp"%>

            <!-- MODAL EDITAR TIPO HABITACION -->
            <%@include file="../EDIT/TipoHabitacionModalEDIT.jsp"%>

            <!-- MODAL ELIMINAR EMPLEADO -->
            <%@include file="../DEL/TipoHabitacionModalDELETE.jsp"%>


            <!-- MAIN CONTENT -->
            <div class="content-wrapper">
                <!-- Content Header (Page header) -->
                <div class="content-header">
                    <div class="container">
                        <div class="row mb-2">
                            <div class="col-sm-9">
                                <h1> Gestión de Habitaciones</h1>
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
                                <p class="card-title" style="margin-top: 8px;">Tipos de Habitaciones registradas en el Sistema</p>
                                <button type="button" class="float-right btn btn-success" data-toggle="modal" data-target="#modal-lg-crear">
                                    Agregar Nuevo Tipo de Habitación
                                    <i class="fas fa-plus"></i>
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
                                                        <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" style="width:45%">Tipo Habitación</th>
                                                        <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" style="width:45%">Capacidad Personas</th>
                                                        <th tabindex="0"  rowspan="1" colspan="1" style="width:10%">Acciones</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <% 
                                                       String nombreTipo = "";
                                                       int capacidadPers = 0;
                                                       ControladoraLogica Cl_tipo_hab_list = new ControladoraLogica();
                                                       List<TipoHabitacion> listTipoHab = Cl_tipo_hab_list.listaTiposHabitaciones();
                                                       for (TipoHabitacion tipoHab: listTipoHab){
                                                           nombreTipo = tipoHab.getNombreHabitacion();
                                                           capacidadPers = tipoHab.getCapacidadPersonas();
                                                    %>
                                                    <tr id="<%=nombreTipo%>" class="odd">
                                                        <td class="dtr-control sorting_1" tabindex="0"><%=nombreTipo%></td>
                                                        <td><%=capacidadPers%></td>
                                                        <td class="align-content-center">
                                                            <button onclick="rellenarModalEdit('<%=nombreTipo%>')" type="button" class="btn btn-warning btn-xs" data-toggle="modal" data-target="#modal-lg-edit"><i class="far fa-edit"></i></button>
                                                            <button onclick="rellenarModalDelete('<%=nombreTipo%>')" type="button" class="btn btn-danger btn-xs"  data-toggle="modal" data-target="#modal-lg-delete"><i class="far fa-trash-alt"></i></button>
                                                        </td>
                                                    </tr>
                                                    <%
                                                        }
                                                        capacidadPers = 0;
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
            function rellenarModalEdit(id_TipoHabitacion) {
                $('#modal-lg-editar').modal('show');
                $.ajax({
                    url: '../../SvTipoHabitacion', // 
                    type: 'GET',
                    dataType: 'json',
                    data: {
                        'id_tipo_habitacion': id_TipoHabitacion,
                        'action': 'get_tipo_habitacion_data',
                    },
                    success: function (data) {
                        console.log(data);
                        document.getElementById('tipoHabNombre_edit').setAttribute("value", data.nombreHabitacion);
                        document.getElementById('capacidadPersonasTipo_edit').setAttribute("value", data.capacidadPersonas);
                    }
                });
            }
            
            function rellenarModalDelete(tipoHabitacionId){
                // Setea id de objeto en el botón de cerrar (modal DELETE)
                buttonD = document.getElementById('buttonDelete');
                buttonD.setAttribute("idObj", tipoHabitacionId); 
                
                // Genera mensaje de confirmación en modal DELETE y lo muestra
                pElement = document.getElementById('formMensajeDELETE');
                pElement.innerHTML = "¿Está seguro que desea eliminar el tipo de habitación '" + tipoHabitacionId +"'?";
                $('#modal-lg-delete').modal('show');
            }
            
            
            /* Función genérica de eliminación de objeto.
               Invocada en botón "Eliminar" de modal DELETE */
            function eliminarObjeto_tipHab(objID) {
                $.ajax({
                    url: '../../SvTipoHabitacion',
                    type: 'POST',
                    dataType: 'json',
                    data: {
                        'id_tipo_habitacion': objID.getAttribute("idObj"),
                        'action': 'delete',
                    },
                    success: function (data) {
                        location.replace(data[0]);
                    }
                });
            }
            
            function modificarObjeto(){
                $.ajax({
                    url: '../../SvTipoHabitacion', 
                    type: 'POST',
                    dataType: 'json',
                    data: {
                        'action': 'edit',
                        'id_tipo_habitacion' : document.getElementById('tipoHabNombre_edit').value,
                        'capacidadTipoHab' : document.getElementById('capacidadPersonasTipo_edit').value,
                    },
                    success: function (data) {
                        location.replace(data[0]);
                    }
                });
            }
        </script>
    </body>
</html>

