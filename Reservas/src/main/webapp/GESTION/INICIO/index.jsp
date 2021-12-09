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

            <!-- MAIN CONTENT -->
            <div class="content-wrapper">
                <!-- Content Header (Page header) -->
                <div class="content-header">
                    <div class="container">
                        <div class="row mb-2">
                            <div class="col-sm-9">
                                <h1> BIENVENIDO </h1>
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
             // INICIALIZACIONES DE MENSAJES DE ERROR (para que se escondan)
            $(document).ready(function(){
                document.getElementById('cardErroresADD').setAttribute("hidden", "");
            });
            $("#btnADDShowModal").click(function(){
                document.getElementById('cardErroresADD').setAttribute("hidden", "");
            });
            $('[data-target="#modal-lg-delete"]').click(function(){
                document.getElementById('cardErroresDEL').setAttribute("hidden", "");
            });
            
            function rellenarModalEdit(idObj) {
                //console.log(idObj[0].id);
                $('#modal-lg-editar').modal('show');
                $.ajax({
                    url: '../../SvUsuario', // 
                    type: 'GET',
                    dataType: 'json',
                    data: {
                        'id_user':idObj[0].id,
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
                console.log(idObj[0].id);
                // Setea id de objeto en el botón de cerrar (modal DELETE)
                buttonD = document.getElementById('buttonDelete');
                buttonD.setAttribute("idObj", idObj[0].id); 
                
                // Genera mensaje de confirmación en modal DELETE y lo muestra
                pElement = document.getElementById('formMensajeDELETE');
                pElement.innerHTML = "¿Está seguro que desea eliminar al usuario '" + idObj[0].id +"'?";
                $('#modal-lg-delete').modal('show');
            } 
            
            function rellenarModalBaja(idObj){
                console.log(idObj[0].id);
                // Setea id de objeto en el botón de cerrar (modal baja)
                buttonD = document.getElementById('buttonBaja');
                buttonD.setAttribute("idObj", idObj[0].id); 
                
                // Genera mensaje de confirmación en modal baja y lo muestra
                pElement = document.getElementById('formMensajeBAJA');
                pElement.innerHTML = "¿Está seguro que desea dar de baja al usuario '" + idObj[0].id +"'?";
                $('#modal-lg-baja').modal('show');
            }
            
            function rellenarModalAlta(idObj){
                console.log(idObj[0].id);
                // Setea id de objeto en el botón de cerrar (modal ALTA)
                buttonD = document.getElementById('buttonAlta');
                buttonD.setAttribute("idObj", idObj[0].id); 
                
                // Genera mensaje de confirmación en modal ALTA y lo muestra
                pElement = document.getElementById('formMensajeALTA');
                pElement.innerHTML = "¿Está seguro que desea dar de alta al usuario '" + idObj[0].id +"'?";
                $('#modal-lg-alta').modal('show');
            }
            
            function bajaObjeto_usuario(objID){
                $.ajax({
                    url: '../../SvUsuario',
                    type: 'POST',
                    dataType: 'json',
                    data: {
                        'id_user': objID.getAttribute("idObj"),
                        'action': 'baja',
                    },
                    success: function (data) {
                        location.replace(data.at(-1));
                    }
                });
            }
            
            function altaObjeto_usuario(objID){
                $.ajax({
                    url: '../../SvUsuario',
                    type: 'POST',
                    dataType: 'json',
                    data: {
                        'id_user': objID.getAttribute("idObj"),
                        'action': 'alta',
                    },
                    success: function (data) {
                        location.replace(data.at(-1));
                    }
                });
            }
            
            
            /* Función genérica de eliminación de objeto.
               Invocada en botón "Eliminar" de modal DELETE */

            function eliminarObjeto_usuario(objID) {
                $.ajax({
                    url: '../../SvUsuario',
                    type: 'POST',
                    dataType: 'json',
                    data: {
                        'id_user': objID.getAttribute("idObj"),
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
            
            function addObjeto(){
                /*
                console.log(document.getElementById('nombreUserInputADD').value);
                console.log(document.getElementById('passUser1ADD').value);
                console.log(document.getElementById('selectEmpAsocADD').value); */
                $.ajax({
                    url: '../../SvUsuario', 
                    type: 'POST',
                    dataType: 'json',
                    data: {
                        'action': 'add',
                        'id_user' : document.getElementById('nombreUserInputADD').value,
                        'pass' : document.getElementById('passUser1ADD').value,
                        'empleadoAsoc' : document.getElementById('selectEmpAsocADD').value,
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
        </script>
    </body>
</html>


