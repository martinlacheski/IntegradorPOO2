<div class="modal fade" id="modal-lg-crear" style="display: none;" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header bg-primary color-palette">
                <h4 class="modal-title" >Agregar Empleado</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="empleadoForm" action="../SvEmpleado" method="POST">
                    <div class="card-body">
                        <div class="form-group">
                            <label for="dni">DNI:</label>
                            <p id="pErrorADD" hidden style="color:red"> <em>Ya existe un empleado registrado con el DNI ingresado.</em><strong>Ingrese otro</strong></p>
                            <input id="dniInputADD" type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" class="form-control" name="dni"><br>

                            <label for="nombre">Nombre:</label>
                            <input type="text" class="form-control" name="nombre"><br>

                            <label for="apellido">Apellido:</label>
                            <input type="text" class="form-control" name="apellido"><br>


                            <label for="fechaNac">Fecha de Nacimiento:</label>
                            <p id="pErrorMenorEdadADD" hidden style="color:red"><em>El empleado es menor de edad.</em><strong>No puede ingresarlo en el Sistema</strong></p>
                            <input id="fechaNacADDEmpleado" type="date" class="form-control" name="fechaNac"><br>

                            <label for="direccion">Dirección:</label>
                            <input type="text" class="form-control" name="direccion"><br>

                            <label for="cargo">Cargo:</label>
                            <input type="text" class="form-control" name="cargo"><br>
                        </div>
                    </div>

                    <!-- Errores -->
                    <div id="cardErrores" hidden class="alert alert-danger alert-dismissible">
                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                        <h5><i class="icon fas fa-ban"></i> Errores Detectados</h5>
                        <p id="erroresForm"> </p>
                    </div>

                    <div class="card-footer">
                        <button id ="btnAddEmpleado" type="submit" class="btn btn-primary float-right">Agregar Empleado</button>
                        <button type="button" class="btn btn-danger" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">Cerrar</span>
                        </button>
                    </div>


                </form>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>