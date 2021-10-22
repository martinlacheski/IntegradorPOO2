<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Logica.TipoHabitacion"%>
<%@page import="Logica.ControladoraLogica"%>
<%@page import="java.util.List"%>
<div class="modal fade" id="modal-lg-editar" style="display: none;" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header bg-warning color-palette">
                <h4 class="modal-title" >Editar Habitación</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="habitacionForm" action="../../SvHabitacion" method="POST">
                    <div class="card-body">
                        <div class="form-group">
                            <label for="nroHabitacion">NÚMERO HABITACIÓN:</label>
                            <input readonly id="nroHabitacion_edit" type="text" 
                                   oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" 
                                   class="form-control" name="nroHabitacion"><br>

                           <label for="pisoHabitacion">PISO HABITACIÓN:</label>
                            <input id="pisoHabitacion_edit" type="text" 
                                   oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" 
                                   class="form-control" name="pisoHabitacion"><br>

                            <div class="form-group">
                                <label>TIPO HABITACIÓN:</label>
                                <select name="tipoHabitacion" id="selectHabitacion_edit" class="disabled form-control">
                                    <option id="defaultTipo_edit">  </option>
                                    <% 
                                        String tipoHab_edit;
                                        ControladoraLogica Cl_edit = new ControladoraLogica();
                                        List<TipoHabitacion> listaTipos_edit = Cl_edit.listaTiposHabitaciones();
                                        for (TipoHabitacion TA : listaTipos_edit) {
                                            tipoHab_edit = TA.getNombreHabitacion();
                                        %>
                                            <option value="<%=tipoHab_edit%>"><%=tipoHab_edit%></option>
                                        <% 
                                            }
                                        %>
                                </select>
                            </div>
                            <label for="precioNocheHabitacion">PRECIO POR NOCHE ($$$)</label>
                            <input autocomplete="off" value="" id="precioNocheHabitacion_edit"
                                   type="text"
                                   oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
                                   class="form-control" name="precioNocheHabitacion">
                        </div>
                    </div>

                    <!-- Errores -->
                    <div id="cardErrores" hidden class="alert alert-danger alert-dismissible">
                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                        <h5><i class="icon fas fa-ban"></i> Errores Detectados</h5>
                        <p id="erroresForm"> </p>

                    </div>


                    <div class="card-footer">
                        <button type="button" onclick="modificarObjeto()" class="btn btn-warning float-right">Modificar Habitación</button>
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
