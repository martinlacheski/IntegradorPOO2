<%@page import="Logica.Cargo"%>
<%@page import="java.util.List"%>
<%@page import="Logica.ControladoraLogica"%>
<div class="modal fade" id="modal-lg-crear" style="display: none;" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header bg-primary color-palette">
                <h4 class="modal-title" >Agregar Empleado</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">�</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="empleadoForm" action="../../SvEmpleado" method="POST">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-6">
                                <label for="dni">DNI:</label>
                                <p id="pErrorADD" hidden style="color:red"> <em>Ya existe un empleado registrado con el DNI ingresado.</em><strong>Ingrese otro</strong></p>
                                <input id="dniInputADD" type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" class="form-control" name="dni"><br>
                            </div>
                            <div class="col-6">
                                <label for="fechaNac">Fecha de Nacimiento:</label>
                                <input id="fechaNacADDEmpleado" type="date" class="form-control" name="fechaNac"><br>
                            </div>
                        </div>
                        <div class="row">
                              <div class="col-6">
                                <label for="apellido">Apellido:</label>
                                <input type="text" class="form-control" name="apellido"><br>
                            </div>
                            <div class="col-6">
                                <label for="nombre">Nombre:</label>
                                <input type="text" class="form-control" name="nombre"><br>
                            </div>
                        </div>
                        <div class="row">
                              <div class="col-6">
                                 <label for="apellido">Cargo:</label>
                                <select name="cargo" class="disabled form-control">
                                    <option value="---"> --- </option>
                                    <% 
                                        String nombreCargo;
                                        ControladoraLogica Cl_edit_cargo = new ControladoraLogica();
                                        List<Cargo> listaCargos = Cl_edit_cargo.listaCargos();
                                        for (Cargo CA : listaCargos) {
                                            nombreCargo = CA.getCargo();
                                        %>
                                            <option value="<%=nombreCargo%>"><%=nombreCargo%></option>
                                        <% 
                                            }
                                        %>
                                </select>
                            </div>
                            <div class="col-6">
                                <label for="telefono">Telefono:</label>
                                <input type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" class="form-control" name="telefono"><br>
                            </div>
                        </div>
                            <label for="direccion">Direcci�n:</label>
                            <input type="text" class="form-control" name="direccion"><br>

                            
                            
                    </div>

                    <!-- Errores -->
                    <div id="cardErrores" hidden class="alert alert-danger alert-dismissible">
                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">�</button>
                        <h5><i class="icon fas fa-ban"></i> Errores Detectados</h5>
                        <p id="erroresForm"> </p>
                    </div>

                    <div class="card-footer">
                        <button type="submit" class="btn btn-primary float-right">Agregar Empleado</button>
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