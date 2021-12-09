<%@page import="Logica.Cargo"%>
<%@page import="java.util.List"%>
<%@page import="Logica.ControladoraLogica"%>
<div class="modal fade" id="modal-lg-editar" style="display: none;" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header bg-primary color-palette">
                <h4 class="modal-title" >Modificar Empleado</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="empleadoForm" action="../../SvEmpleado" method="POST">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-6">
                                <label for="dni">DNI:</label>
                                <p id="pErrorADD" hidden style="color:red"></p>
                                <input readonly id="dniEmp_edit" type="text" oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');" class="form-control" name="dni"><br>
                            </div>
                            <div class="col-6">
                                <label for="fechaNac">Fecha de Nacimiento:</label>
                                <input id="fechaNacEmp_edit" type="date" class="form-control" name="fechaNac"><br>
                            </div>
                        </div>
                        <div class="row">
                              <div class="col-6">
                                <label for="apellido">Apellido:</label>
                                <input id="apellido_edit" type="text" class="form-control" name="apellido"><br>
                            </div>
                            <div class="col-6">
                                <label for="nombre">Nombre:</label>
                                <input id="nombre_edit" type="text" class="form-control" name="nombre"><br>
                            </div>
                        </div>
                        <div class="row">
                              <div class="col-6">
                                 <label for="apellido">Cargo:</label>
                                <select id="cargoEmpleado_edit" name="cargo" class="disabled form-control">
                                    <option id="defaultCargo_edit" value="---"> --- </option>
                                    <% 
                                        String nombreCargo_edit;
                                        ControladoraLogica Cl_edit_cargo_edit = new ControladoraLogica();
                                        List<Cargo> listaCargos_edit = Cl_edit_cargo_edit.listaCargos();
                                        for (Cargo CA : listaCargos_edit) {
                                            nombreCargo_edit = CA.getCargo();
                                        %>
                                            <option value="<%=nombreCargo_edit%>"><%=nombreCargo_edit%></option>
                                        <% 
                                            }
                                        %>
                                </select>
                            </div>
                            <div class="col-6">
                                <label  for="telefono">Telefono:</label>
                                <input id="telefono_edit" type="text" oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');" class="form-control" name="telefono"><br>
                            </div>
                        </div>
                            <label for="direccion">Dirección:</label>
                            <input id="direccion_edit" type="text" class="form-control" name="direccion"><br>
                    </div>

                    <!-- Errores -->
                    <div id="cardErrores" hidden class="alert alert-danger alert-dismissible">
                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                        <h5><i class="icon fas fa-ban"></i> Errores Detectados</h5>
                        <p id="erroresForm"> </p>
                    </div>

                    <div class="card-footer">
                        <button onclick="modificarObjeto()"type="button" class="btn btn-primary float-right">Modificar Empleado</button>
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