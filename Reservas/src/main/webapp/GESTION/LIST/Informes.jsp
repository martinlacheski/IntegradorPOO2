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
                                <h1> Informes </h1>
                            </div>
                        </div><!-- /.row -->
                    </div><!-- /.container-fluid -->
                </div>
                <!-- /.content-header -->

                <!-- Main content CONTENT-->
                <div class="content">
                    <div class="container">


                        <!-- Lista de Reservas -->
                        <!--
                        -->
                        
                        <div class="card card-primary card-outline card-outline-tabs">
                            <div class="card-header p-0 border-bottom-0">
                                <ul class="nav nav-tabs" id="custom-tabs-four-tab" role="tablist">
                                    <li class="nav-item">
                                        <a class="nav-link active" id="custom-tabs-four-home-tab" data-toggle="pill" href="#custom-tabs-four-home" role="tab" aria-controls="custom-tabs-four-home" aria-selected="true">Reservas por Huesped</a>
                                    </li>
                                </ul>
                            </div>
                            <div class="card-body">
                                <div class="tab-content" id="custom-tabs-four-tabContent">
                                    <div class="tab-pane fade active show" id="custom-tabs-four-home" role="tabpanel" aria-labelledby="custom-tabs-four-home-tab">
                                            <div class="card-body">
                                                    <div class="row">
                                                        <!-- Sección Huesped Responsable -->
                                                        <div class="col-12">
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

                                                        <!-- Sección CHECK-IN -->
                                                        <div class="mt-3 col-4">
                                                            <label for="checkIn"> Desde </label>
                                                            <div class="input-group date" id="reservationdate" data-target-input="nearest">
                                                                <input id="checkIn" name="checkIn" type="text" class="form-control datetimepicker-input checks" data-target="#reservationdate">
                                                                <div class="input-group-append" data-target="#reservationdate" data-toggle="datetimepicker">
                                                                    <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <!-- Sección CHECK-OUT -->
                                                        <div class="mt-3 col-4">
                                                            <label for="checkOut"> Hasta </label>
                                                            <!-- el cambio de foco de este campo activa la funcionalidad de solapamiento de reservas -->
                                                            <div class="input-group date" id="reservationdate2" data-target-input="nearest">
                                                                <input id="checkOut" name="checkOut" type="text" class="form-control datetimepicker-input checks" data-target="#reservationdate2">
                                                                <div class="input-group-append" data-target="#reservationdate2" data-toggle="datetimepicker">
                                                                    <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="mt-4 col-4">
                                                            <div class="mt-4">
                                                                <button onclick="generarInforme()" id="btnGenInforme"
                                                                        type="button" class="ml-2 btn btn-success float-right">
                                                                    <i class="fas fa-check-circle"></i> Generar Informe
                                                                </button>
                                                                <p style="display: inline; color:red;" hidden id="pErrorFechaSalidaMenor">La fecha de check-out es menor que la de check-in. <strong>Verifique</strong><br></p>
                                                                <p style="display: inline; color:red;" hidden id="pErrorNingunDato">No ha ingresado alguno de los datos.<strong>Verifique</strong></p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    </div>
                                                    <hr>
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
                                                                                </tr>
                                                                            </thead>
                                                                            <tbody id="valores_tabla">
                                                                            </tbody>
                                                                        </table>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                            </div>
                                    </div>
                                    <div class="tab-pane fade" id="custom-tabs-four-profile-tab" role="tabpanel" aria-labelledby="custom-tabs-four-profile-tab">
                                        hola2
                                    </div>
                                    <div class="tab-pane fade" id="custom-tabs-four-messages" role="tabpanel" aria-labelledby="custom-tabs-four-messages-tab">
                                        hola3
                                    </div>
                                    <div class="tab-pane fade" id="custom-tabs-four-settings" role="tabpanel" aria-labelledby="custom-tabs-four-settings-tab">
                                        hola4
                                    </div>
                                </div>
                            </div>
                            <!-- /.card -->
                        </div>
                
                                                
                    </div><!-- /.container-fluid -->
                </div>
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
                    document.getElementById('btnGenInforme').setAttribute("class", "ml-2 btn btn-success float-right" )
                    
                    // Obtenemos datos
                    checkIn= new Date(document.getElementById('checkIn').value);
                    checkOut = new Date(document.getElementById('checkOut').value);
                    
                    if (checkIn.isValid() && checkOut.isValid()){
                        // Se le sum un día por implementación de Date object (al sumar se obtiene la fecha real)
                        checkIn.setDate(checkIn.getDate()+1);
                        checkOut.setDate(checkOut.getDate()+1);
                        // Se comprueba si el checkIn es menor que el checkOut
                        if (checkIn <= checkOut){
                            console.log("este error no corresponde a esta pantalla. Todo ok")
                        } else{
                            // Se desabilita el botón de generar reserva y se muestra el error
                            document.getElementById('pErrorFechaSalidaMenor').removeAttribute('hidden');
                            document.getElementById('btnGenInforme').setAttribute("class", "ml-2 btn btn-success float-right disabled");
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
                
                function generarInforme(){
                    // Se deshabilita el error por defecto.
                    document.getElementById('pErrorNingunDato').setAttribute('hidden', '');
                    
                    /*
                    console.log(document.getElementById('huesResponsable').value);
                    console.log(document.getElementById('checkIn').value);
                    console.log(document.getElementById('checkOut').value);
                     */
                    
                    huesped = document.getElementById('huesResponsable').value;
                    desde = document.getElementById('checkIn').value;
                    hasta = document.getElementById('checkIn').value;
                    
                    // Se controla si se rellenaron todos los datos del form
                    if (huesped !== '' && desde !== '' && hasta !== ''){
                            $.ajax({
                            url: '../../SvReserva', 
                            type: 'POST',
                            dataType: 'json',
                            data: {
                                'action': 'informe',
                                'huesped' : document.getElementById('huesResponsable').value,
                                'checkIn' : document.getElementById('checkIn').value,
                                'checkOut' : document.getElementById('checkOut').value,
                            },
                            success: function (data) {
                                tabla = document.getElementById('valores_tabla');
                                tabla.innerHTML = ""
                                for (const reserva in data) {
                                    if (data[reserva]['estado'] === true){
                                        data[reserva]['estado'] = '<small class="badge badge-success">Activa</small>';
                                    } else {
                                        data[reserva]['estado'] = '<span class="badge badge-danger">De baja</span>';
                                    }
                                    var valor = 
                                                '<tr class="odd">' +
                                                    '<td>' + data[reserva]['idReserva'] + '</td>' + 
                                                    '<td>' + data[reserva]['estado'] + '</td>' + 

                                                    '<td>' +
                                                            data[reserva]['checkIn']['year']+'-'+ 
                                                            data[reserva]['checkIn']['month']+'-'+
                                                            data[reserva]['checkIn']['day']+
                                                    '</td>' + 
                                                    '<td>' +
                                                            data[reserva]['checkOut']['year']+'-'+ 
                                                            data[reserva]['checkOut']['month']+'-'+
                                                            data[reserva]['checkOut']['day']+
                                                    '</td>' +

                                                    '<td>' + data[reserva]['habReservada']['nroHab'] + '</td>' + 

                                                    '<td>' + 
                                                         data[reserva]['huespedAsoc']['apellido'] + " " +
                                                          data[reserva]['huespedAsoc']['nombre']
                                                    + '</td>' +
                                                '</tr>'; 
                                    tabla.insertAdjacentHTML('afterbegin', valor);
                                    valor = "";

                                }
                            }
                            });
                    } else {
                        document.getElementById('pErrorNingunDato').removeAttribute('hidden');
                    }// end if
                    
                }
                    
            </script>

    </body>
</html>