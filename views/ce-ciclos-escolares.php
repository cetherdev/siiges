<?php
// Válida los permisos del usuario de la sesión
require_once "../utilities/utileria-general.php";
Utileria::validarSesion(basename(__FILE__));

//====================================================================================================

require_once "../models/modelo-programa.php";
require_once "../models/modelo-ciclo-escolar.php";
require_once "../models/modelo-institucion.php";

$programa = new Programa();
$programa->setAttributes(array("id" => $_GET["programa_id"]));
$resultadoPrograma = $programa->consultarId();

$plantel = new Plantel();
$plantel->setAttributes(array("id" => $resultadoPrograma["data"]["plantel_id"]));
$resultadoPlantel = $plantel->consultarId();

$institucion = new Institucion();
$institucion->setAttributes(array("id" => $resultadoPlantel["data"]["institucion_id"]));
$resultadoInstitucion = $institucion->consultarId();

?>


<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>SIIGES</title>
	<!-- CSS GOB.MX -->
	<link href="../favicon.ico" rel="shortcut icon">
	<link href="https://framework-gb.cdn.gob.mx/assets/styles/main.css" rel="stylesheet">
	<!-- CSS DATATABLE -->
	<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">
	<!-- CSS PROPIO -->
	<link rel="stylesheet" type="text/css" href="../css/estilos.css">
</head>

<body>
	<!-- HEADER Y MENÚ -->
	<?php require_once "menu.php"; ?>

	<!-- CUERPO DE PANTALLA -->
	<div class="container">
		<section class="main row margin-section-formularios">

			<!-- BARRA DE INFORMACION -->
			<div class="row" style="padding-left: 15px; padding-right: 15px;">
				<div class="col-sm-12 col-md-12 col-lg-12">
          <?php
          $resultadoInstitucion = isset($resultadoInstitucion["data"][0])
            ? $resultadoInstitucion["data"][0]
            : $resultadoInstitucion["data"];
          ?>
					<!-- BARRA DE USUARIO -->
					<ol class="breadcrumb pull-right">
						<li><i class="icon icon-user"></i></li>
						<li><?php echo $_SESSION["nombre_rol"]; ?></li>
						<li class="active"><?php echo $_SESSION["nombre"] . " " . $_SESSION["apellido_paterno"] . " " . $_SESSION["apellido_materno"]; ?></li>
					</ol>
					<!-- BARRA DE NAVEGACION -->
					<ol class="breadcrumb pull-left">
						<li><i class="icon icon-home"></i></li>
						<li><a href="home.php">SIIGES</a></li>
						<li><a href="ce-programas-plantel.php?institucion_id=<?php echo $resultadoInstitucion["id"] ?>&plantel_id=<?php echo $resultadoPlantel["data"]["id"] ?>">Programas de Estudios</a></li>
						<li class="active">Ciclos Escolares</li>
					</ol>
				</div>
			</div>

			<!-- CUERPO PRINCIPAL -->
			<div class="col-sm-12 col-md-12 col-lg-12">
				<!-- TÍTULO -->
				<h2 id="txtNombre">Ciclos Escolares</h2>
				<hr class="red">
				<div class="row">
					<div class="col-sm-12">
						<legend><?php echo $resultadoPrograma["data"]["nombre"]; ?></legend>
					</div>
				</div>
				<!-- NOTIFICACIÓN -->
				<?php if (isset($_GET["codigo"]) && $_GET["codigo"] == 200) { ?>
					<div class="alert alert-success">
						<p>Registro guardado.</p>
					</div>
				<?php } ?>
				<!-- CONTENIDO -->
				<div class="row">
					<div class="col-sm-12">
						<a href="ce-catalogo-ciclo-escolar.php?programa_id=<?php echo $_GET["programa_id"]; ?>&proceso=alta" class="btn btn-primary pull-right"><i class="glyphicon glyphicon-plus"></i> Alta de Ciclo</a>
					</div>
				</div>
				<div class="row" style="padding-top: 20px;">
					<div class="col-sm-12">
					</div>
				</div>
				<div class="row">
					<div class="col-sm-12">
						<table id="tabla-reporte" class="table table-striped table-bordered" cellspacing="0" width="100%">
							<thead>
								<tr>
									<th width="10%">Id</th>
									<th width="30%">Ciclo</th>
									<th width="30%">Descripci&oacute;n</th>
									<th width="15%">Acciones</th>
									<th width="15%">Acciones</th>
								</tr>
							</thead>
							<tbody>
								<?php
								$parametros["programa_id"] = $_GET["programa_id"];

								$cicloEscolar = new CicloEscolar();
								$cicloEscolar->setAttributes($parametros);
								$resultadoCicloEscolar = $cicloEscolar->consultarCiclosEscolaresPrograma();
								$resultadoCicloEscolar["data"] = Utileria::array_sort($resultadoCicloEscolar["data"], 'nombre', SORT_ASC);

								$max = count($resultadoCicloEscolar["data"]);

								foreach ($resultadoCicloEscolar["data"] as $key => $atributoCicloEscolar) {
									if (Rol::ROL_REVALIDACION_EQUIVALENCIA == $_SESSION["rol_id"] && $atributoCicloEscolar["nombre"] === "EQUIV") {
								?>
										<tr>
											<td><?php echo $atributoCicloEscolar["id"]; ?></td>
											<td><?php echo $atributoCicloEscolar["nombre"]; ?></td>
											<td><?php echo $atributoCicloEscolar["descripcion"]; ?></td>
											<td>
												<a href="ce-catalogo-ciclo-escolar.php?programa_id=<?php echo $_GET["programa_id"]; ?>&ciclo_id=<?php echo $atributoCicloEscolar["id"]; ?>&proceso=consulta"><span id="" title="Abrir" class="glyphicon glyphicon-eye-open col-sm-1 size_icon"></span></a>
												<a href="ce-catalogo-ciclo-escolar.php?programa_id=<?php echo $_GET["programa_id"]; ?>&ciclo_id=<?php echo $atributoCicloEscolar["id"]; ?>&proceso=edicion"><span id="" title="Editar" class="glyphicon glyphicon-edit col-sm-1 size_icon"></span></a>
												<a href="#" data-toggle="modal" data-target="#modalEliminar"><span id="" title="Eliminar" class="glyphicon glyphicon-trash col-sm-1 size_icon"></span></a>
											</td>
											<td>
												<a href="ce-grados.php?programa_id=<?php echo $_GET["programa_id"]; ?>&ciclo_id=<?php echo $atributoCicloEscolar["id"]; ?>">Grados</a>
											</td>
										</tr>
									<?php
									} else if (Rol::ROL_REVALIDACION_EQUIVALENCIA != $_SESSION["rol_id"] && $atributoCicloEscolar["nombre"] !== "EQUIV") {
									?>
										<tr>
											<td><?php echo $atributoCicloEscolar["id"]; ?></td>
											<td><?php echo $atributoCicloEscolar["nombre"]; ?></td>
											<td><?php echo $atributoCicloEscolar["descripcion"]; ?></td>
											<td>
												<a href="ce-catalogo-ciclo-escolar.php?programa_id=<?php echo $_GET["programa_id"]; ?>&ciclo_id=<?php echo $atributoCicloEscolar["id"]; ?>&proceso=consulta"><span id="" title="Abrir" class="glyphicon glyphicon-eye-open col-sm-1 size_icon"></span></a>
												<a href="ce-catalogo-ciclo-escolar.php?programa_id=<?php echo $_GET["programa_id"]; ?>&ciclo_id=<?php echo $atributoCicloEscolar["id"]; ?>&proceso=edicion"><span id="" title="Editar" class="glyphicon glyphicon-edit col-sm-1 size_icon"></span></a>
												<?php
												if (Rol::ROL_ADMIN == $_SESSION["rol_id"] || Rol::ROL_CONTROL_ESCOLAR_SICYT == $_SESSION["rol_id"]) :
												?>
													<a href="#" onclick="CicloEscolar.modalEliminarCiclo('<?php echo $atributoCicloEscolar['id'] ?>',
												 '<?php echo $atributoCicloEscolar['nombre']; ?>',
												 '<?php echo $parametros['programa_id'] ?>')">
														<span id="" title="Eliminar" class="glyphicon glyphicon-trash col-sm-1 size_icon"></span></a>
												<?php
												endif; ?>
											</td>
											<td>
                        <a href="ce-grados.php?programa_id=<?php echo $_GET["programa_id"]; ?>&ciclo_id=<?php echo $atributoCicloEscolar["id"]; ?>">Grados</a><br>
												<a href="ce-reporte-extraordinarios.php?programa_id=<?php echo $_GET["programa_id"]; ?>&ciclo_id=<?php echo $atributoCicloEscolar["id"]; ?>">Reporte extraordinarios</a>
											</td>
										</tr>
								<?php
									}
								}
								?>
							</tbody>
						</table>
					</div>
				</div>
			</div>

		</section>
		<div class="modal fade" id="modalMensaje" tabindex="-1" role="dialog" aria-hidden="true">
			<div id="tamanoModalMensaje" class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Eliminar grupo</h4>
					</div>
					<div class="modal-body">
						<div id="mensajeGrupos"></div>
					</div>
					<div id="mensaje-footer" class="modal-footer">
						<button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- JS GOB.MX -->
	<script src="https://framework-gb.cdn.gob.mx/gobmx.js"></script>
	<!-- JS JQUERY -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>}
	<script src="../js/ce-ciclos-escolares.js"></script>
</body>

</html>