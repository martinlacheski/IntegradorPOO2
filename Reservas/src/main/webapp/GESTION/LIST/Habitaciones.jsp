<%@page import="Logica.TipoHabitacion"%>
<%@page import="Logica.Habitacion"%>
<%@page import="Logica.ControladoraLogica"%>

<%// @page import="java.time.LocalDate"%>
<%// @page import="java.util.List"%>
<%// @page import="Persistencia.ControladoraPersistencia"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="es" charset="UTF-8">
    <%@include file="../../GENERALES/head.jsp"%>

    <body class="hold-transition layout-top-nav">
        <div class="wrapper">

            <!-- Navbar -->
            <%@include file="../../GENERALES/navbar.jsp"%>
            <!-- /.navbar -->

            <!-- MODAL ADD HABITACIÓN -->
            <%@include file="../ADD/HabitacionModalADD.jsp"%>
            
             <!-- MODAL EDITAR HABITACION -->
            <%@include file="../EDIT/HabitacionModalEDIT.jsp"%>
            
            <!-- MODAL DELETE HABITACIÓN -->
            <%@include file="../DEL/HabitacionModalDELETE.jsp"%>
            
            <!-- MODAL BAJA HABITACIÓN -->
            <%@include file="../DEL/HabitacionModalBAJA.jsp"%>
            
            <!-- MODAL ALTA HABITACIÓN -->
            <%@include file="../DEL/HabitacionModalALTA.jsp"%>
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
                            <div class=" card-header bg-dark">
                                <p class="card-title" style="margin-top: 8px;"> Habitaciones registradas en el Sistema</p>
                                <button type="button" class="float-right btn bg-primary" data-toggle="modal" data-target="#modal-lg-crear">
                                    Agregar Nueva Habitación
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
                                                        <th class="sorting sorting_asc" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" style="width:23%">Número</th>
                                                        <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1"  style="width:10%">Piso</th>
                                                        <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" style="width:23%">Tipo Habitación</th>
                                                        <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" style="width:23%">Estado</th>
                                                        <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" style="width:23%">Precio por Noche</th>
                                                        <th tabindex="0"  rowspan="1" colspan="1" style="width:8%">Acciones</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <%  
                                                        boolean estado;
                                                        int nroHab;
                                                        String pisoHab;
                                                        TipoHabitacion tipo;
                                                        int precioNocheHab;
                                                        ControladoraLogica Cl_hab_list = new ControladoraLogica();
                                                        List<Habitacion> listaHabitaciones = Cl_hab_list.listaHabitaciones();
                                                        for (Habitacion hab : listaHabitaciones) {
                                                            nroHab = hab.getNroHab();
                                                            pisoHab = hab.getPiso();
                                                            tipo = hab.getTipo();
                                                            precioNocheHab = hab.getPrecioNoche();
                                                            estado = hab.isEstado();
                                                    %>
                                                    <tr id="<%=nroHab%>" class="odd">
                                                        <td class="dtr-control sorting_1" tabindex="0"><%=nroHab%></td>
                                                        <td><%=pisoHab%></td>
                                                        <td><%=tipo%></td>
                                                        <% if (estado){ %>
                                                            <td><small class="badge badge-success">Activo</small></td>
                                                        <% }else { %>
                                                            <td><span class="badge badge-danger">Inactivo</span></td>
                                                        <%} %>
                                                        <td>$<%=precioNocheHab%></td>
                                                        <td class="align-content-center">
                                                            <button onclick="rellenarModalEdit(<%=nroHab%>)" type="button" class="btn bg-gray-dark btn-xs"><i class="far fa-edit"></i></button>
                                                            <button onclick="rellenarModalDelete(<%=nroHab%>)" type="button" class="btn btn-danger btn-xs"><i class="far fa-trash-alt"></i></button>
                                                            <% if (estado) { %>
                                                            <button id="<%=nroHab%>" 
                                                                    onclick="rellenarModalBaja(<%=nroHab%>)"
                                                                    type="button"
                                                                    class="btn btn-danger btn-xs"
                                                                    data-toggle="modal"
                                                                    data-target="#modal-lg-baja">
                                                                <i class="fas fa-chevron-down"></i>
                                                            </button>
                                                        <% }else{ %>
                                                            <button id="<%=nroHab%>" 
                                                                    onclick="rellenarModalAlta(<%=nroHab%>)"
                                                                    type="button"
                                                                    class="btn btn-success btn-xs"
                                                                    data-toggle="modal"
                                                                    data-target="#modal-lg-alta">
                                                                <i class="fas fa-chevron-up"></i>
                                                            </button>  
                                                        <% } %>
                                                        </td>
                                                    </tr>  
                                                    <%
                                                        }
                                                        nroHab = 0;
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
            function rellenarModalEdit(numeroHabitacion) {
                console.log(numeroHabitacion);
                $('#modal-lg-editar').modal('show');
                $.ajax({
                    url: '../../SvHabitacion', // 
                    type: 'GET',
                    dataType: 'json',
                    data: {
                        'id_habitacion': numeroHabitacion,
                        'action': 'get_habitacion_data',
                    },
                    success: function (data) {
                        console.log(data);
                        document.getElementById('nroHabitacion_edit').setAttribute("value", data.nroHab);
                        document.getElementById('pisoHabitacion_edit').setAttribute("value", data.piso);
                        document.getElementById('precioNocheHabitacion_edit').setAttribute("value", data.precioNoche);
                        document.getElementById('defaultTipo_edit').setAttribute("value", data.tipo.nombreHabitacion);
                        document.getElementById('defaultTipo_edit').innerHTML = data.tipo.nombreHabitacion;
                    }
                });
            }
            
            function rellenarModalDelete(numeroHabitacion){
                // Setea id de objeto en el botón de cerrar (modal DELETE)
                buttonD = document.getElementById('buttonDelete');
                buttonD.setAttribute("idObj", numeroHabitacion); 
                
                // Genera mensaje de confirmación en modal DELETE y lo muestra
                pElement = document.getElementById('formMensajeDELETE');
                pElement.innerHTML = "¿Está seguro que desea eliminar la habitación Nro° " + numeroHabitacion +"?";
                $('#modal-lg-delete').modal('show');
            }
            
            
            /* Función genérica de eliminación de objeto.
               Invocada en botón "Eliminar" de modal DELETE */
            function eliminarObjeto(objID) {
                $.ajax({
                    url: '../../SvHabitacion',
                    type: 'POST',
                    dataType: 'json',
                    data: {
                        'id_habitacion': objID.getAttribute("idObj"),
                        'action': 'delete',
                    },
                    success: function (data) {
                        if (data.at(-1) == "dependencia"){
                            document.getElementById('cardErroresDEL').removeAttribute("hidden");
                            document.getElementById('erroresFormDEL').innerHTML = "Existen registros que dependen de éste. No puede ser eliminado"; 
                        } else {
                            location.replace(data.at(-1));
                        }
                    }
                });
            }
            
            function modificarObjeto(){
                $.ajax({
                    url: '../../SvHabitacion', // 
                    type: 'POST',
                    dataType: 'json',
                    data: {
                        'action': 'edit',
                        'nroHabitacion' : document.getElementById('nroHabitacion_edit').value,
                        'pisoHabitacion' : document.getElementById('pisoHabitacion_edit').value,
                        'tipoHabitacion' : document.getElementById('selectHabitacion_edit').value,
                        'precioNocheHabitacion': document.getElementById('precioNocheHabitacion_edit').value
                    },
                    success: function (data) {
                        location.replace(data[0]);
                    }
                });
            }
            
            function addObjeto(){
                /* console.log(document.getElementById('nroHabitacion').value);
                console.log(document.getElementById('pisoHabitacion').value);
                console.log(document.getElementById('tipoHabitacion').value);
                console.log(document.getElementById('precioNocheHabitacion').value); */
                
                $.ajax({
                    url: '../../SvHabitacion', 
                    type: 'POST',
                    dataType: 'json',
                    data: {
                        'action': 'add',
                        'nroHabitacion' : document.getElementById('nroHabitacion').value,
                        'pisoHabitacion' : document.getElementById('pisoHabitacion').value,
                        'tipoHabitacion' : document.getElementById('tipoHabitacion').value,
                        'precioNocheHabitacion' : document.getElementById('precioNocheHabitacion').value,
                    },
                    success: function (data) {
                        console.log(data);
                        if (data.at(-1) == "repetido"){
                            document.getElementById('cardErroresADD').removeAttribute("hidden");
                            document.getElementById('erroresFormADD').innerHTML = "Ya existe un registro igual a este."; 
                        } else {
                            location.replace(data.at(-1));
                        }
                    }
                });
            }
            
            function rellenarModalBaja(idObj){
                console.log(idObj);
                // Setea id de objeto en el botón de cerrar (modal baja)
                buttonD = document.getElementById('buttonBaja');
                buttonD.setAttribute("idObj", idObj); 
                
                // Genera mensaje de confirmación en modal baja y lo muestra
                pElement = document.getElementById('formMensajeBAJA');
                pElement.innerHTML = "¿Está seguro que desea dar de baja a la Habitación '" + idObj +"'?";
                $('#modal-lg-baja').modal('show');
            }
            
            function rellenarModalAlta(idObj){
                console.log(idObj);
                // Setea id de objeto en el botón de cerrar (modal ALTA)
                buttonD = document.getElementById('buttonAlta');
                buttonD.setAttribute("idObj", idObj); 
                
                // Genera mensaje de confirmación en modal ALTA y lo muestra
                pElement = document.getElementById('formMensajeALTA');
                pElement.innerHTML = "¿Está seguro que desea dar de baja a la Habitación '" + idObj +"'?";
                $('#modal-lg-alta').modal('show');
            }
            
            function bajaObjeto_habitacion(objID){
                $.ajax({
                    url: '../../SvHabitacion',
                    type: 'POST',
                    dataType: 'json',
                    data: {
                        'nroHabitacion': objID.getAttribute("idObj"),
                        'action': 'baja',
                    },
                    success: function (data) {
                        location.replace(data.at(-1));
                    }
                });
            }
            
            function altaObjeto_habitacion(objID){
                $.ajax({
                    url: '../../SvHabitacion',
                    type: 'POST',
                    dataType: 'json',
                    data: {
                        'nroHabitacion': objID.getAttribute("idObj"),
                        'action': 'alta',
                    },
                    success: function (data) {
                        location.replace(data.at(-1));
                    }
                });
            }
            
        </script>
    </body>
</html>

