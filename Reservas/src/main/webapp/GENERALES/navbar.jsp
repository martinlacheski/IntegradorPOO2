<nav class="main-header navbar navbar-expand-md navbar-light navbar-white">
    <div class="container">
        <a href="../INICIO/index.jsp" class="navbar-brand">
            <img src="../../dist/img/AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image img-circle" style="opacity: .8">
            <span class="brand-text font-weight-light">Reservas</span>
        </a>

        <button class="navbar-toggler order-1" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse order-3" id="navbarCollapse">
            <!-- Left navbar links -->
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a href="../INICIO/index.jsp" class="nav-link"><i class="fas fa-home"></i> Inicio</a>
                </li>
                <li class="nav-item">
                    <a href="../LIST/Reservas.jsp" class="nav-link"><i class="far fa-list-alt"></i> Crear Reserva</a>
                </li>
                <li class="nav-item">
                    <a href="../LIST/Informes.jsp" class="nav-link"><i class="far fa-chart-bar"></i> Informes</a>
                </li>
                <li class="nav-item dropdown">
                    <a id="dropdownSubMenu1" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="nav-link dropdown-toggle">Administración</a>
                    <ul aria-labelledby="dropdownSubMenu1" class="dropdown-menu border-0 shadow">
                        <li><a href="../LIST/Cargos.jsp" class="dropdown-item"><i class="fas fa-user-tag"></i>Gestión de Cargos</a></li>
                        <li><a href="../LIST/Empleados.jsp" class="dropdown-item"><i class="far fa-address-card"></i> Gestión de Empleados</a></li>
                        <li><a href="../LIST/Huespedes.jsp" class="dropdown-item"><i class="fas fa-address-book"></i>  Gestión de Huespedes</a></li>
                        <li><a href="../LIST/TiposHabitaciones.jsp" class="dropdown-item"><i class="fas fa-project-diagram"></i> Gestión de Tipos de Habitaciones </a></li>
                        <li><a href="../LIST/Habitaciones.jsp" class="dropdown-item"><i class="fas fa-city"></i> Gestión de Habitaciones</a></li>
                        <li><a href="../LIST/Usuarios.jsp" class="dropdown-item"><i class="fas fa-users"></i> Gestión de Usuarios</a></li>
                        
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>