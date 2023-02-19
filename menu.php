<header>
	<div class="container">
		<!-- BARRA DE NAVEGACION SUPERIOR -->
		<nav class="navbar navbar-inverse sub-navbar navbar-fixed-top">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#subenlaces">
						<span class="sr-only">Interruptor de Navegación</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="index.php"><img src="images/jalisco-logo.png" height="30"></a>
					<a class="navbar-brand" href="index.php">SIIGES</a>
				</div>

				<div class="collapse navbar-collapse" id="subenlaces">
					<ul class="nav navbar-nav navbar-right">
						<li><a id="navIniciarSesion" href="index.php"><span class="glyphicon glyphicon-user"></span> Iniciar Sesión</a>
						<li><a id="navLinea" href="#">|</a></li>
						<li><a id="navRegistrarme" href="registro.php"><span class="glyphicon glyphicon-user"></span> Registrarme</a>
						<li><a id="navLinea" href="#">|</a></li>
						<li><a id="navAcercaDe" href="#" data-toggle="modal" data-target="#modalAcercaDe"><span class="glyphicon glyphicon-info-sign"></span> Acerca de</a>
					</ul>
				</div>
			</div>
		</nav>
	</div>
</header>

<!-- MODAL ACERCA DE -->
<div class="modal fade" id="modalAcercaDe" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h5 class="modal-title" id="exampleModalLongTitle">Acerca de este sitio web</h5>
			</div>
			<div class="modal-body">
					El Sistema Integral de Información para la Gestión
					de la Educación Superior (SIIGES) ver 1.0
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
				<button type="button" class="btn btn-primary" data-dismiss="modal">Aceptar</button>
			</div>
		</div>
	</div>
</div>
