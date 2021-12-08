<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="modal fade" id="modal-lg-crear" style="display: none;" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header bg-primary color-palette">
                <h4 class="modal-title" >Agregar Cargo</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="cargoForm" action="" method="POST">
                    <div class="card-body">
                        <div class="form-group">
                            <label for="cargoNombre">NOMBRE CARGO:</label>
                            <p id="pErrorADD" hidden style="color:red"></p>
                            <input id="cargoNombreADD" name="cargo" type="text" class="form-control"><br>
                        </div>
                        <div class="form-group">
                            <label for="sueldo">SUELDO:</label>
                            <input id="sueldoADD" autocomplete="off" value="" type="text"
                                   oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');"
                                   class="form-control" name="sueldo">
                         </div>
                    </div>

                    <!-- Errores -->
                    <div id="cardErroresADD" hidden class="alert alert-danger alert-dismissible">
                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                        <h5><i class="icon fas fa-ban"></i> Errores Detectados</h5>
                        <p id="erroresFormADD"> </p>

                    </div>

                    <div class="card-footer">
                        <button onclick="addObjeto()" id="btnAddCargo" type="button" class="btn btn-primary float-right">Agregar Cargo</button>
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