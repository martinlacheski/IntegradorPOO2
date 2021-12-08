<%@page import="java.util.List"%>
<%@page import="Logica.ControladoraLogica"%>
<%@page import="Logica.Huesped"%>
<%@page contentType="text/html"%>

<!DOCTYPE html>


<html lang="es" charset="UTF-8">
    <%@include file="../../GENERALES/head.jsp"%>

    <body class="hold-transition layout-top-nav">
        <div class="wrapper">

            <!-- Navbar -->
            <%@include file="../../GENERALES/navbar.jsp"%>
            <!-- /.navbar -->

            <!-- MODAL ADD HUESPED -->
            <%@include file="../ADD/HuespedModalADD.jsp"%>

            <!-- MODAL EDITAR HUESPED -->
            <%@include file="../EDIT/HuespedModalEDIT.jsp"%>

            <!-- MODAL ELIMINAR HUESPED -->
            <%@include file="../DEL/HuespedModalDELETE.jsp"%>
            

            <!-- MAIN CONTENT -->
            <div class="content-wrapper">
                <!-- Content Header (Page header) -->
                <div class="content-header">
                    <div class="container">
                        <div class="row mb-2">
                            <div class="col-sm-9">
                                <h1> Gestión de Huespedes</h1>
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
                                <p class="card-title" style="margin-top: 8px;"> Huespedes registrados en el Sistema</p>
                                <button type="button" class="float-right btn btn-success" data-toggle="modal" data-target="#modal-lg-crear">
                                    Agregar Nuevo Huesped
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
                                                        <th class="sorting sorting_asc" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" style="width:10%">DNI</th>
                                                        <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1"  style="width:20%">Nombre</th>
                                                        <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" style="width:20%">Apellido</th>
                                                        <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" style="width:20%">Telefono</th>
                                                        <th tabindex="0"  rowspan="1" colspan="1" style="width:10%">Acciones</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <%  
                                                        int dni;
                                                        String nombre;
                                                        String apellido;
                                                        String telefono;
                                                        ControladoraLogica Cl_hues_list = new ControladoraLogica();
                                                        List<Huesped> listaHuspedes = Cl_hues_list.listaHuespedes();
                                                        for (Huesped hues : listaHuspedes) {
                                                            dni = hues.getDni();
                                                            nombre = hues.getNombre();
                                                            apellido = hues.getApellido();
                                                            telefono = hues.getTelefono();
                                                    %>
                                                    <tr id="<%=dni%>" class="odd">
                                                        <td class="dtr-control sorting_1" tabindex="0"><%=dni%></td>
                                                        <td><%=nombre%></td>
                                                        <td><%=apellido%></td>
                                                        <td><%=telefono%></td>
                                                        <td class="align-content-center">
                                                            <button onclick="rellenarModalEdit(<%=dni%>)" type="button" class="btn bg-warning btn-xs"><i class="far fa-edit"></i></button>
                                                            <button onclick="rellenarModalDelete(<%=dni%>)" type="button" class="btn btn-danger btn-xs"><i class="far fa-trash-alt"></i></button>
                                                        </td>
                                                    </tr>  
                                                    <%
                                                        }
                                                        dni = 0;
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
                $('#modal-lg-editar').modal('show');
                $.ajax({
                    url: '../../SvHuesped', // 
                    type: 'GET',
                    dataType: 'json',
                    data: {
                        'id_empleado': idObj,
                        'action': 'get_huesped_data'
                    },
                    success: function (data) {
                        console.log(data);
                        document.getElementById('dniEmp_edit').setAttribute("value", data.dni);
                        date_element = data.fechaNac.year + "-" + data.fechaNac.month + "-" + data.fechaNac.day;
                        document.getElementById('fechaNacEmp_edit').setAttribute("value", date_element);
                        document.getElementById('apellido_edit').setAttribute("value", data.apellido);
                        document.getElementById('nombre_edit').setAttribute("value", data.nombre);
                        document.getElementById('profesion_edit').setAttribute("value", data.profesion);
                        document.getElementById('telefono_edit').setAttribute("value", data.telefono);
                        document.getElementById('direccion_edit').setAttribute("value", data.direccion);
                    }
                });
            }
            
            function rellenarModalDelete(idObj){
                console.log(idObj);
                // Setea id de objeto en el botón de cerrar (modal DELETE)
                buttonD = document.getElementById('buttonDelete');
                buttonD.setAttribute("idObj", idObj); 
                
                // Genera mensaje de confirmación en modal DELETE y lo muestra
                pElement = document.getElementById('formMensajeDELETE');
                pElement.innerHTML = "¿Está seguro que desea eliminar al huesped con DNI '" + idObj +"'?";
                $('#modal-lg-delete').modal('show');
            }
            
            
            /* Función genérica de eliminación de objeto.
               Invocada en botón "Eliminar" de modal DELETE */
            function eliminarObjeto_huesped(objID) {
                $.ajax({
                    url: '../../SvHuesped',
                    type: 'POST',
                    dataType: 'json',
                    data: {
                        'id_huesped': objID.getAttribute("idObj"),
                        'action': 'delete',
                    },
                    success: function (data) {
                        location.replace(data[0]);
                    }
                }); 
            }
            
            function modificarObjeto(){
                $.ajax({
                    url: '../../SvHuesped', // 
                    type: 'POST',
                    dataType: 'json',
                    data: {
                        'action': 'edit',
                        'dni' : document.getElementById('dniEmp_edit').value,
                        'fechaNac' : document.getElementById('fechaNacEmp_edit').value,
                        'apellido' : document.getElementById('apellido_edit').value,
                        'nombre' : document.getElementById('nombre_edit').value,
                        'profesion' : document.getElementById('profesion_edit').value,
                        'telefono' : document.getElementById('telefono_edit').value,
                        'direccion': document.getElementById('direccion_edit').value
                    },
                    success: function (data) {
                        location.replace(data[0]);
                    }
                });
            }
            
            function addObjeto(){
                /*
                console.log(document.getElementById('dniHuespedADD').value);
                console.log(document.getElementById('fechaNacHuespedADD').value);
                console.log(document.getElementById('apellidoHuespedADD').value);
                console.log(document.getElementById('nombreHuespedADD').value);
                console.log(document.getElementById('profesionHuespedADD').value);
                console.log(document.getElementById('telefonoHuespedADD').value);
                console.log(document.getElementById('direccionHuespedADD').value); */
                
                $.ajax({
                    url: '../../SvHuesped', 
                    type: 'POST',
                    dataType: 'json',
                    data: {
                        'action': 'add',
                        'dni': document.getElementById('dniHuespedADD').value,
                        'fechaNac': document.getElementById('fechaNacHuespedADD').value,
                        'apellido': document.getElementById('apellidoHuespedADD').value,
                        'nombre' : document.getElementById('nombreHuespedADD').value,
                        'profesion' : document.getElementById('profesionHuespedADD').value,
                        'telefono' : document.getElementById('telefonoHuespedADD').value,
                        'direccion': document.getElementById('direccionHuespedADD').value
                    },
                    success: function (data) {
                        if (data.at(-1) == "repetido"){
                            document.getElementById('cardErroresADD').removeAttribute("hidden");
                            document.getElementById('erroresFormADD').innerHTML = "Ya existe un registro igual a este."; 
                        } else {
                            location.replace(data.at(-1));
                        }
                    }
                });
            }
            
             /* Función genérica de eliminación de objeto.
               Invocada en botón "Eliminar" de modal DELETE */
            function eliminarObjeto_huesped(objID) {
                $.ajax({
                    url: '../../SvHuesped',
                    type: 'POST',
                    dataType: 'json',
                    data: {
                        'id_huesped': objID.getAttribute("idObj"),
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
        </script>
    </body>
    
</html>

