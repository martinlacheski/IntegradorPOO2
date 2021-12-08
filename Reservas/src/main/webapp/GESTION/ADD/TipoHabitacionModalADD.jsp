<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="modal fade" id="modal-lg-crear" style="display: none;" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header bg-primary color-palette">
                <h4 class="modal-title" >Agregar Tipo Habitación</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="habitacionForm" action="" method="POST">
                    <div class="card-body">
                        <div class="form-group">
                            <label for="nroHabitacion">NOMBRE TIPO HABITACIÓN:</label>
                            <p id="pErrorADD" hidden style="color:red"> <em>Ya existe un tipo de habitación registrado con este nombre.</em><strong>Ingrese otro</strong></p>
                            <input id="tipoHabNombre_add" type="text" name="tipoHabNombre" class="form-control"<br>
                        </div>
                        <div class="form-group">
                            <label for="capacidadPersonas">CAPACIDAD DE PERSONAS</label>
                            <input autocomplete="off" value="" type="text"
                                   oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');"
                                   class="form-control" name="capacidadPersonas"
                                   id="capacidadPersonasTipo_add">
                         </div>
                    </div>

                    <!-- Errores -->
                    <div id="cardErroresADD" hidden class="alert alert-danger alert-dismissible">
                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                        <h5><i class="icon fas fa-ban"></i> Errores Detectados</h5>
                        <p id="erroresFormADD"> </p>

                    </div>


                    <div class="card-footer">
                        <button onclick="addObjeto()" id ="btnAddHabitacion" type="button" class="btn btn-primary float-right">Agregar Tipo Habitación</button>
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