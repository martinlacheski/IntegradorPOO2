<%@page import="java.util.List"%>
<%@page import="Logica.ControladoraLogica"%>
<%@page import="Logica.Usuario"%>
<%@page import="Logica.Empleado"%>
<div class="modal fade" id="modal-lg-edit" style="display: none;" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header bg-warning color-palette">
                <h4 class="modal-title" >Editar Usuario</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="userFormEDIT" action="../SvUsuarioEDIT" method="POST">
                    <div class="card-body">
                        <div id="formModalEdit" class="form-group">
                            
                            <label for="nombreUsuarioAct">NOMBRE USUARIO ACTUAL</label>
                            <input readonly id="nombreUsuarioAct" autocomplete="off" value="" type="text" class="form-control" readonly="readonly" name="nombreUsuarioAct"><br>

                            <label for="passUser1">NUEVA CONTRASEÑA:</label>
                            <input id="passUser1" autocomplete="off" value="" type="password" class="form-control" name="passUser1"><br>

                            <label for="passUser2">REPITA NUEVA CONTRASEÑA:</label>
                            <p id="pErrorEDIT" hidden style="color:red"> <em>Las contraseñas no son iguales</em></p>
                            <input id="passUser2" autocomplete="off" value="" type="password" class="form-control" name="passUser2"><br>

                            <div class="form-group">
                                <label>EMPLEADO ASOCIADO:</label>
                                <select name="empleadoAsoc" id="selectEmpAsoc" class="form-control">
                                    <option id="defaultEmp_edit" value="---"> --- </option>
                                    <% 
                                        String nombreEmp_edit;
                                        int dniEmp_edit;
                                        ControladoraLogica Cl_edit_emp_edit = new ControladoraLogica();
                                        List<Empleado> listaEmpleado_edit = Cl_edit_emp_edit.listaEmpleados();
                                        for (Empleado EM : listaEmpleado_edit) {
                                            nombreEmp_edit = EM.getNombre() + " " + EM.getApellido();
                                            dniEmp_edit = EM.getDni();
                                        %>
                                            <option value="<%=dniEmp_edit%>"><%=nombreEmp_edit%></option>
                                        <% 
                                            }
                                        %>
                                </select>
                            </div>
                        </div>
                    </div>

                    <!-- Errores -->
                    <div id="cardErroresEDIT" hidden class="alert alert-danger alert-dismissible">
                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                        <h5><i class="icon fas fa-ban"></i> Errores Detectados</h5>
                        <p id="erroresFormEDIT"> </p>

                    </div>


                    <div class="card-footer">
                        <button onclick="modificarObjeto()" type="button" class="btn btn-warning float-right">Modificar Usuario</button>
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