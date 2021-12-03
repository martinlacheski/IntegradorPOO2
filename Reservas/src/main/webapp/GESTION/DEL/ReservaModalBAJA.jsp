<div class="modal fade" id="modal-lg-delete" style="display: none;" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header bg-danger color-palette">
                <h4 class="modal-title" >Dar de baja a Reserva</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="card-body">
                    <div class="form-group">
                        <p id="formMensajeDELETE"></p>
                    </div>
                    
                    <!-- Errores -->
                    <div id="cardErroresDEL" hidden class="alert alert-danger alert-dismissible">
                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                        <h5><i class="icon fas fa-ban"></i> Errores Detectados</h5>
                        <p id="erroresFormDEL"> </p>

                    </div>
                </div>
                    
                <div class="card-footer">
                    <button id="buttonDelete" type="button" idObj="" onclick="eliminarObjeto_Reserva(this)" class="btn btn-danger float-right">Dar de Baja</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">Cerrar</span>
                    </button>
                </div>
                    
            </div>
        </div>
    </div>
</div>