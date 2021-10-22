<%@page import="Logica.TipoHabitacion"%>
<%@page import="Logica.ControladoraLogica"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="modal fade" id="modal-lg-crear" style="display: none;" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header bg-primary color-palette">
                <h4 class="modal-title" >Agregar Habitación</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="habitacionForm" action="../../SvHabitacion" method="POST">
                    <div class="card-body">
                        <div class="form-group">
                            <label for="nroHabitacion">NÚMERO HABITACIÓN:</label>
                            <input id="nroHabitacion" type="text" 
                                   oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" 
                                   class="form-control" name="nroHabitacion"><br>

                           <label for="pisoHabitacion">PISO HABITACIÓN:</label>
                            <input id="pisoHabitacion" type="text" 
                                   oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" 
                                   class="form-control" name="pisoHabitacion"><br>

                            <div class="form-group">
                                <label>TIPO HABITACIÓN:</label>
                                <select name="tipoHabitacion" class="disabled form-control">
                                    <option value="---"> --- </option>
                                    <% 
                                        String tipoHab;
                                        ControladoraLogica Cl = new ControladoraLogica();
                                        List<TipoHabitacion> listaTipos = Cl.listaTiposHabitaciones();
                                        for (TipoHabitacion TA : listaTipos) {
                                            tipoHab = TA.getNombreHabitacion();
                                        %>
                                            <option value="<%=tipoHab%>"><%=tipoHab%></option>
                                        <% 
                                            }
                                        %>
                                </select>
                            </div>
                            <label for="precioNocheHabitacion">PRECIO POR NOCHE ($$$)</label>
                            <input autocomplete="off" value=""
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
                        <button id ="btnAddHabitacion" type="submit" class="btn btn-primary float-right">Agregar Habitación</button>
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