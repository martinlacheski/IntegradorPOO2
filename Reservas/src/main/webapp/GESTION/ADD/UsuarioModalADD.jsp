<%@page import="Logica.ControladoraLogica"%>
<%@page import="Logica.Usuario"%>
<%@page import="Logica.Empleado"%>
<%@page import="java.util.List"%>
<div class="modal fade" id="modal-lg-crear" style="display: none;" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header bg-primary color-palette">
                <h4 class="modal-title" >Agregar Usuario</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="usuarioForm" action="../../SvUsuario" method="POST">
                    <div class="card-body">
                        <div class="form-group">
                            <label for="dni">NOMBRE DE USUARIO:</label>
                            <p id="pErrorADD" hidden style="color:red"> <em>Ya existe un usuario registrado con ese nombre.</em><strong>Ingrese otro</strong></p>
                            <input id="nombreUserInputADD" type="text" class="form-control" name="nombreUsuario"><br>

                            <label for="pass">NUEVA CONTRASEÑA: </label>
                            <input type="password" class="form-control" name="pass"><br>

                            <div class="form-group">
                                <label>EMPLEADO ASOCIADO:</label>
                                <select name="empleadoAsoc" class="form-control">
                                    <option value="---">--------</option>
                                    <%  String nombre_empleado;
                                        int dni_empleado;
                                        Usuario userModalADD;
                                        
                                        ControladoraLogica controlUserEmpModalADD = new ControladoraLogica();
                                        
                                        // Obtenemos todos los empleados y usuarios
                                        List<Empleado> listaEmpleados = controlUserEmpModalADD.listaEmpleados();

                                        // Filtramos y mostramos unicamente empleados que NO tengan usuario
                                        for (Empleado emp : listaEmpleados) {
                                            userModalADD = controlUserEmpModalADD.obtenerUsuarioPorDNI(emp);
                                            
                                            //Si no existe usuario para ese empleado, lo mostramoa
                                            if (userModalADD == null){
                                                nombre_empleado = emp.getNombre() + " " + emp.getApellido();
                                                dni_empleado = emp.getDni();
                                    %>
                                            <option value="<%=dni_empleado%>"> <%=nombre_empleado%> </option>           
                                            <% } %>
                                    <% } %>
                                </select>
                            </div>
                        </div>
                    </div>

                    <!-- Errores -->
                    <div id="cardErrores" hidden class="alert alert-danger alert-dismissible">
                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                        <h5><i class="icon fas fa-ban"></i> Errores Detectados</h5>
                        <p id="erroresForm"> </p>

                    </div>


                    <div class="card-footer">
                        <button id ="btnAddUsuario" type="submit" class="btn btn-primary float-right">Agregar Usuario</button>
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