<%@page import="Logica.Reserva"%>
<%@page import="java.time.LocalDate"%>
<%@page import="Logica.TipoHabitacion"%>
<%@page import="Logica.Habitacion"%>
<%@page import="Logica.Huesped"%>
<%@page import="java.util.List"%>
<%@page import="Logica.ControladoraLogica"%>
<%@page contentType="text/html"%>

<!DOCTYPE html>


<html lang="es" charset="UTF-8">
    <%@include file="../../GENERALES/head.jsp"%>

    <body class="hold-transition layout-top-nav">

        <!-- MODAL BAJA RESERVA-->
        <%@include file="../DEL/ReservaModalBAJA.jsp"%>

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
                                <h1> Creación de Reservas</h1>
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

                            <div class="card-header">
                                <h3 class=" mt-2 card-title">Completar Datos de Reserva</h3>
                            </div>
                            <div class="card-body">
                                <form id="reservaForm" action="" method="POST">


                                    <div class="row">

                                        <!-- Sección Huesped Responsable -->
                                        <div class="col-6">
                                            <label for="huespedResponsable"> Huesped Responsable </label>
                                            <div class="input-group">
                                                <select id="huesResponsable" name="huespedResponsable" class="form-control">    
                                                    <option> --- </option> 
                                                    <%  
                                                        String nombre_hues = "";
                                                        int dni_huesped;
                                                        ControladoraLogica controlHues = new ControladoraLogica();
                                                        List<Huesped> listaHuespedes = controlHues.listaHuespedes();
                                                        for (Huesped hues : listaHuespedes) {
                                                            nombre_hues = hues.getNombre();
                                                            nombre_hues = nombre_hues + " " + hues.getApellido();
                                                            dni_huesped = hues.getDni();
                                                    %>
                                                    <option value="<%=dni_huesped%>"> <%=nombre_hues%> </option>           
                                                    <% } %>
                                                </select>        
                                            </div>
                                        </div>

                                        <!-- Sección Cantidad de personas -->        
                                        <div class="col-6">
                                            <label for="cantPersonas"> Cantidad de Personas </label>
                                            <div class="input-group">
                                                <input id="cantPersonas" name="cantPersonas" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" type="text" class="form-control checkCantPer">
                                            </div>
                                        </div>

                                        <!-- Sección habitación -->
                                        <div class=" mt-4 col-md-12">
                                            <div class="input-group">
                                                <label>Habitación a reservar</label>
                                                <select id="habAReservar" name="habitacionesSeleccionadas" data-placeholder="Seleccione una habitación"
                                                        style="width: 100%;" class="form-control checks checkCantPer">
                                                    <option> --- </option>
                                                    <%
                                                        int nroHab;
                                                        String pisoHab;
                                                        String tipoHab;
                                                        int capacidad;
                                                        int precioNoche;
                                                        ControladoraLogica controlHab = new ControladoraLogica();
                                                        List<Habitacion> listaHabitaciones = controlHab.listaHabitaciones();
                                                        for (Habitacion hab : listaHabitaciones) {
                                                            nroHab = hab.getNroHab();
                                                            pisoHab = hab.getPiso();
                                                            tipoHab = hab.getTipo().toString();
                                                            capacidad = hab.getTipo().getCapacidadPersonas();
                                                            precioNoche = hab.getPrecioNoche();
                                                    %>
                                                    <option class="checks opcionesHabitaciones" value="<%=nroHab%>" precio="<%=precioNoche%>" capacidad="<%=capacidad%>"> Habitación <%=nroHab%>, Piso <%=pisoHab%>, Capacidad <%=capacidad%> </option>
                                                    <% }%>
                                                </select>
                                            </div>
                                        </div>

                                        <!-- Sección CHECK-IN -->
                                        <div class="mt-3 col-5">
                                            <label for="checkIn"> Check- In </label>
                                            <div class="input-group date" id="reservationdate" data-target-input="nearest">
                                                <input id="checkIn" name="checkIn" type="text" class="form-control datetimepicker-input checks" data-target="#reservationdate">
                                                <div class="input-group-append" data-target="#reservationdate" data-toggle="datetimepicker">
                                                    <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                                                </div>
                                            </div>
                                        </div>

                                        <!-- Sección CHECK-OUT -->
                                        <div class="mt-3 col-5">
                                            <label for="checkOut"> Check- Out </label>
                                            <!-- el cambio de foco de este campo activa la funcionalidad de solapamiento de reservas -->
                                            <div class="input-group date" id="reservationdate2" data-target-input="nearest">
                                                <input id="checkOut" name="checkOut" type="text" class="form-control datetimepicker-input checks" data-target="#reservationdate2">
                                                <div class="input-group-append" data-target="#reservationdate2" data-toggle="datetimepicker">
                                                    <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                                                </div>
                                            </div>
                                        </div>


                                        <!-- Sección Precio Reserva -->        
                                        <div class="mt-3 col-2">
                                            <!-- El precio tiene que variar conforme a habitación elegida Y 
                                                fechas de entrada y salida -->
                                            <label for="precioReserva"> Precio Reserva </label>
                                            <div class="input-group">
                                                <input readonly id="precioReserva" name="precioReserva" type="text" class="form-control">
                                            </div>
                                        </div>

                                        <!-- Sección usuario que realiza la reserva (escondida por defecto)-->
                                        <!-- <input hidden value="<//%=userRegistrado%>" name="userAsoc"> </input> -->
                                    </div>
                                    <!-- /.card-body -->
                                    <hr>
                                    <div class="col-12">
                                        <p style="display: inline; color:red;" hidden id="pErrorNoHab">No ha seleccionado ninguna habitación<strong> Seleccione alguna</strong><br></p>
                                        <p style="display: inline; color:red;" hidden id="pErrorNoCheckInOut">No ha ingresado <em>check-In</em> o <em>check-out</em>.<strong> Verifique que hayan dos fechas</strong><br></p>
                                        <p style="display: inline; color:red;" hidden id="pErrorOverlap">Las fechas de <em>check-In</em> y <em>check-out</em> se superponen con otras reservas.<strong> Ingrese otras fechas o cambie la habitación</strong><br></p>
                                        <p style="display: inline; color:red;" hidden id="pErrorCantPersonas">La cantidad de personas de la reserva es mayor a la capacidad de la habitación elegida<br></p>
                                        <p style="display: inline; color:red;" hidden id="pErrorHuespedResp">No ha seleccionado un Huesped Responsable<br></p>
                                        <p style="display: inline; color:red;" hidden id="pErrorFechaSalidaMenor">La fecha de check-out es menor que la de check-in. <strong>Verifique</strong><br></p>
                                        <p style="display: inline; color:green;" hidden id="pTodoOkOverlap"><strong>Todo ok</strong><br></p>
                                        <button onclick="generarReserva()" id="btnAddReserva" type="button" class="ml-2 btn btn-success float-right"><i class="fas fa-check-circle"></i> Generar Reserva</button>
                                    </div>
                                </form>
                            </div>
                        </div>

                        <!-- Lista de Reservas -->
                        <div class="mt-3 card">
                            <div class="card-header bg-primary">
                                <h3 class="card-title">Reservas registradas en Sistema</h3>
                            </div>
                            <div class="card-body">
                                <div class="dataTables_wrapper dt-bootstrap4">
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <table id="example1" class="table table-bordered table-striped dataTable dtr-inline" role="grid">
                                                <thead>
                                                    <tr>
                                                        <th class="sorting sorting_asc" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" style="width:5%">ID Reserva</th>
                                                        <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1"  style="width:10%">Estado</th>
                                                        <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" style="width:10%">Check In</th>
                                                        <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" style="width:10%">Check Out</th>
                                                        <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" style="width:10%">Habitación</th>
                                                        <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" style="width:20%">Huesped Responsable</th>
                                                        <th tabindex="0"  rowspan="1" colspan="1" style="width:10%">Acciones</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <%  
                                                        int idReser;
                                                        boolean estado;
                                                        LocalDate checkInReser;
                                                        LocalDate checkOutReser;
                                                        int habitacion;
                                                        String huespedReser; 
                                                        ControladoraLogica controlReser = new ControladoraLogica();
                                                        List<Reserva> listaReservas = controlReser.listaReservas();
                                                        for (Reserva reser : listaReservas) {
                                                            idReser = reser.getIdReserva();
                                                            estado = reser.getEstado();
                                                            checkInReser = reser.getCheckIn();
                                                            checkOutReser = reser.getCheckOut();
                                                            habitacion = reser.getHabReservada().getNroHab();
                                                            huespedReser = reser.getHuespedAsoc().getApellido() + " " + reser.getHuespedAsoc().getNombre();
                                                            
                                                    %>
                                                    <tr class="odd">
                                                        <td class="dtr-control sorting_1" tabindex="0"><%=idReser%></td>
                                                        <% if (estado){ %>
                                                            <td><small class="badge badge-success">Activa</small></td>
                                                        <% }else { %>
                                                            <td><span class="badge badge-danger">De baja</span></td>
                                                        <%} %>
                                                        <td><%=checkInReser%></td>
                                                        <td><%=checkOutReser%></td>
                                                        <td><%=habitacion%></td>
                                                        <td><%=huespedReser%></td>
                                                        <td class="align-content-center">
                                                             <% if (estado){ %>
                                                            <button onclick='rellenarModalBaja(<%=idReser%>)' class="bajaReserva btn bg-danger btn-xs"
                                                                    data-toggle="modal" data-target="#modal-lg-delete">
                                                                <i class="fas fa-minus-circle"></i> Dar de baja</button>
                                                            <% } %>
                                                        </td>
                                                    </tr>  

                                                    <%}
                                                        idReser = 0;
                                                    %>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                                                
                    </div><!-- /.container-fluid -->
                </div>
            </div>


            <!-- Main Footer -->
            <%//@include file="../../GENERALES/footer.jsp"%>

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
            <!-- Select2 -->
            <script src="../../plugins/select2/js/select2.full.min.js"></script>
            <!-- Bootstrap4 Duallistbox -->
            <script src="../../plugins/bootstrap4-duallistbox/jquery.bootstrap-duallistbox.min.js"></script>
            <!-- InputMas -->
            <script src="../../plugins/moment/moment.min.js"></script>
            <script src="../../plugins/inputmask/jquery.inputmask.min.js"></script>
            <!-- date-range-picker -->
            <script src="../../plugins/daterangepicker/daterangepicker.js"></script>
            <!-- bootstrap color picker -->
            <script src="../../plugins/bootstrap-colorpicker/js/bootstrap-colorpicker.min.js"></script>
            <!-- Tempusdominus Bootstrap 4 -->
            <script src="../../plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
            <!-- Bootstrap Switch -->
            <script src="../../plugins/bootstrap-switch/js/bootstrap-switch.min.js"></script>
            <!-- BS-Stepper -->
            <script src="../../plugins/bs-stepper/js/bs-stepper.min.js"></script>
            <!-- dropzonejs -->
            <script src="../../plugins/dropzone/min/dropzone.min.js"></script>
            <!-- AdminLTE App -->
            <script src="../../dist/js/adminlte.min.js"></script>
            <script>
                                                                //Initialize Select2 Elements
                                                                $('.select2').select2();

                                                                //Initialize Select2 Elements
                                                                $('.select2bs4').select2({
                                                                    theme: 'bootstrap4'
                                                                });

                                                                //Datemask dd/mm/yyyy
                                                                $('#datemask').inputmask('yyyy/mm/dd', {'placeholder': 'yyyy/mm/dd'});
                                                                //Datemask2 mm/dd/yyyy
                                                                $('#datemask2').inputmask('yyyy/mm/dd', {'placeholder': 'yyyy/mm/dd'});
                                                                //Money Euro
                                                                $('[data-mask]').inputmask();

                                                                //Date picker
                                                                $('#reservationdate').datetimepicker({
                                                                    format: 'yyyy-MM-DD'
                                                                });

                                                                $('#reservationdate2').datetimepicker({
                                                                    format: 'yyyy-MM-DD'
                                                                });


                                                                //Date and time picker
                                                                $('#reservationdatetime').datetimepicker({icons: {time: 'far fa-clock'}});

                                                                //Date range picker
                                                                $('#reservation').daterangepicker();
                                                                //Date range picker with time picker
                                                                $('#reservationtime').daterangepicker({
                                                                    timePicker: true,
                                                                    timePickerIncrement: 30,
                                                                    locale: {
                                                                        format: 'YYYY/MM/DD hh:mm A'
                                                                    }
                                                                });
                                                                //Date range as a button
                                                                $('#daterange-btn').daterangepicker(
                                                                        {
                                                                            ranges: {
                                                                                'Today': [moment(), moment()],
                                                                                'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
                                                                                'Last 7 Days': [moment().subtract(6, 'days'), moment()],
                                                                                'Last 30 Days': [moment().subtract(29, 'days'), moment()],
                                                                                'This Month': [moment().startOf('month'), moment().endOf('month')],
                                                                                'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
                                                                            },
                                                                            startDate: moment().subtract(29, 'days'),
                                                                            endDate: moment()
                                                                        },
                                                                        function (start, end) {
                                                                            $('#reportrange span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));
                                                                        }
                                                                );
            </script>
                
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
                //check de fechas
                Date.prototype.isValid = function () {
                    return this.getTime() === this.getTime();
                }; 
                
                // Generación de precio de Reserva y checks
                $(".checks").on("click focus blur", function(){
                    // Escondemos errores
                    document.getElementById('pErrorFechaSalidaMenor').setAttribute('hidden', '');
                    document.getElementById('btnAddReserva').setAttribute("class", "ml-2 btn btn-success float-right" )
                    
                    // Obtenemos datos
                    checkIn= new Date(document.getElementById('checkIn').value);
                    checkOut = new Date(document.getElementById('checkOut').value);
                    preciohab = $('#habAReservar option:selected').attr('precio');
                    
                    if (checkIn.isValid() && checkOut.isValid() && preciohab){
                        // Se le sum un día por implementación de Date object (al sumar se obtiene la fecha real)
                        checkIn.setDate(checkIn.getDate()+1);
                        checkOut.setDate(checkOut.getDate()+1);
                        // Se comprueba si el checkIn es menor que el checkOut
                        if (checkIn <= checkOut){
                            cant_dias_reserva = parseInt((checkOut - checkIn) / (1000 * 60 * 60 * 24), 10);  
                            document.getElementById('precioReserva').setAttribute("value", cant_dias_reserva * parseInt(preciohab));
                        } else{
                            // Se desabilita el botón de generar reserva y se muestra el error
                            document.getElementById('pErrorFechaSalidaMenor').removeAttribute('hidden');
                            document.getElementById('btnAddReserva').setAttribute("class", "ml-2 btn btn-success float-right disabled");
                        }
                    }
                });
                
                // Control de cantidad de Personas
                $(".checkCantPer").on("click focus blur keyup", function(){
                     // Escondemos errores
                    document.getElementById('pErrorCantPersonas').setAttribute('hidden', '');
                    document.getElementById('btnAddReserva').setAttribute("class", "ml-2 btn btn-success float-right" )
                    
                    cant_personas_hab = $('#habAReservar option:selected').attr('capacidad');
                    cant_personas_reser = document.getElementById('cantPersonas').value;
                    
                    // Muestra errores y desactiva botón de reserva
                    if (cant_personas_hab && cant_personas_reser){
                        if (parseInt(cant_personas_hab) < parseInt(cant_personas_reser)){
                            document.getElementById('pErrorCantPersonas').removeAttribute('hidden');
                            document.getElementById('btnAddReserva').setAttribute("class", "ml-2 btn btn-success float-right disabled");
                        }
                    }
                })
                
                
                    
                function generarReserva(){
                    document.getElementById('pErrorOverlap').setAttribute("hidden", "");
                    
                    /*
                    console.log(document.getElementById('huesResponsable').value);
                    console.log(document.getElementById('cantPersonas').value);
                    console.log(document.getElementById('habAReservar').value);
                    console.log(document.getElementById('checkIn').value);
                    console.log(document.getElementById('checkOut').value);
                    console.log(document.getElementById('precioReserva').value);
                    */
                    
                    
                    $.ajax({
                        url: '../../SvReserva', 
                        type: 'POST',
                        dataType: 'json',
                        data: {
                            'action': 'add',
                            'huesped' : document.getElementById('huesResponsable').value,
                            'cant_personas' : document.getElementById('cantPersonas').value,
                            'habAReservar' : document.getElementById('habAReservar').value,
                            'checkIn' : document.getElementById('checkIn').value,
                            'checkOut' : document.getElementById('checkOut').value,
                            'precioReserva' : document.getElementById('precioReserva').value,
                        },
                        success: function (data) {
                            console.log(data);
                            if (data.at(-1) == "superposicion"){
                                document.getElementById('pErrorOverlap').removeAttribute("hidden");
                            } else {
                                location.replace(data.at(-1));
                            }
                        }
                    });
                }
                
                function rellenarModalBaja(idObj){
                    // Setea id de objeto en el botón de cerrar (modal DELETE)
                    buttonD = document.getElementById('buttonDelete');
                    buttonD.setAttribute("idObj", idObj); 

                    // Genera mensaje de confirmación en modal DELETE y lo muestra
                    pElement = document.getElementById('formMensajeDELETE');
                    pElement.innerHTML = "¿Está seguro que desea dar de baja a la Reserva Nro° " + idObj +"?";
                    $('#modal-lg-delete').modal('show');
                }
                
                function eliminarObjeto_Reserva(e){
                    console.log(e.getAttribute("idObj"));
                    
                    $.ajax({
                        url: '../../SvReserva', 
                        type: 'POST',
                        dataType: 'json',
                        data: {
                            'action': 'baja',
                            'idReserva' : e.getAttribute("idObj"),
                        },
                        success: function (data) {
                            location.replace(data.at(-1));
                        }
                    });
                }
                
                    
            </script>

    </body>
</html>