<?php
// Válida los permisos del usuario de la sesión
require_once "../utilities/utileria-general.php";
Utileria::validarSesion(basename(__FILE__));

//====================================================================================================

require_once "../models/modelo-programa.php";
require_once "../models/modelo-institucion.php";
require_once "../models/modelo-vdetalles-alumno.php";

$programa = new Programa();
$programa->setAttributes(array("id" => $_GET["programa_id"]));
$resultadoPrograma = $programa->consultarId();

$plantel = new Plantel();
$plantel->setAttributes(array("id" => $resultadoPrograma["data"]["plantel_id"]));
$resultadoPlantel = $plantel->consultarId();

$institucion = new Institucion();
$institucion->setAttributes(array("id" => $resultadoPlantel["data"]["institucion_id"]));
$resultadoInstitucion = $institucion->consultarId();
$datosInstitucion = $resultadoInstitucion["data"];

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
						<li><a href="ce-programas-plantel.php?institucion_id=<?php echo $datosInstitucion["id"] ?>&plantel_id=<?php echo $resultadoPlantel["data"]["id"] ?>">Programas de Estudios</a></li>
						<li class="active">Alumnos</li>
					</ol>
				</div>
			</div>

			<!-- CUERPO PRINCIPAL -->
			<div class="col-sm-12 col-md-12 col-lg-12">
				<!-- TÍTULO -->
				<h2 id="txtNombre">Alumnos</h2>
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
				<?php if (isset($_GET["codigo"]) && $_GET["codigo"] == 400) { ?>
					<div class="alert alert-danger">
						<p>Carga de archivo incorrecta.</p>
					</div>
				<?php } ?>
				<!-- CONTENIDO -->
				<div class="row">
					<div class="col-sm-12">
						<a href="ce-catalogo-alumno.php?programa_id=<?php echo $resultadoPrograma["data"]["id"]; ?>&proceso=alta" class="btn btn-primary pull-right"><i class="glyphicon glyphicon-plus"></i> Alta de Alumno</a>
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
									<th width="5%">Id</th>
									<th width="5%">Matr&iacute;cula</th>
									<th width="20%">Apellido Paterno</th>
									<th width="20%">Apellido Materno</th>
									<th width="20%">Nombre</th>
									<th width="10%">Situaci&oacute;n</th>
									<th width="10%">Acciones</th>
									<th width="10%">Acciones</th>
								</tr>
							</thead>
							<tbody>
								<?php
								$parametros["programa_id"] = $_GET["programa_id"];

								$detallesAlumnos = new VDetallesAlumno();
								$detallesAlumnos->setAttributes($parametros);
								$resultadoDetallesAlumnos = $detallesAlumnos->consultarAlumnosPrograma();

								$max = count($resultadoDetallesAlumnos["data"]);
								for ($i = 0; $i < $max; $i++) {
									$alumnoDetalle = $resultadoDetallesAlumnos["data"][$i];

									$nombreCompletoAlumno = $alumnoDetalle["apellido_paterno"] . " " . $alumnoDetalle["apellido_materno"] . " " . $alumnoDetalle["nombre"];

								?>
									<tr>
										<td><?php echo $alumnoDetalle["id"]; ?></td>
										<td><?php echo $alumnoDetalle["matricula"]; ?></td>
										<td><?php echo $alumnoDetalle["apellido_paterno"]; ?></td>
										<td><?php echo $alumnoDetalle["apellido_materno"]; ?></td>
										<td><?php echo $alumnoDetalle["nombre"]; ?></td>

										<!-- Situacion general -->
										<td>
											<?php
											echo $alumnoDetalle["situacion"];

											if (Rol::ROL_CONTROL_ESCOLAR_IES == $_SESSION["rol_id"] || (Rol::ROL_REPRESENTANTE_LEGAL == $_SESSION["rol_id"])) :
												echo "<br>";
												echo isset($alumnoDetalle["situacion_validacion"]) ? $alumnoDetalle["situacion_validacion"] : "Sin validar";
											endif;
											?>
										</td>
										<!-- Acciones -->
										<td>
											<!-- Acciones Institución -->
											<?php
											if (Rol::ROL_CONTROL_ESCOLAR_IES == $_SESSION["rol_id"] || (Rol::ROL_REPRESENTANTE_LEGAL == $_SESSION["rol_id"])) :
											?>
												<a href="ce-catalogo-alumno.php?programa_id=<?php echo $resultadoPrograma["data"]["id"]; ?>&alumno_id=<?php echo $alumnoDetalle["id"]; ?>&proceso=consulta"><span id="" title="Abrir" class="glyphicon glyphicon-eye-open col-sm-1 size_icon"></span></a>
												<a href="ce-catalogo-alumno.php?programa_id=<?php echo $resultadoPrograma["data"]["id"]; ?>&alumno_id=<?php echo $alumnoDetalle["id"]; ?>&proceso=edicion"><span id="" title="Editar" class="glyphicon glyphicon-edit col-sm-1 size_icon"></span></a>
												<a href="ce-catalogo-alumno.php?programa_id=<?php echo $resultadoPrograma["data"]["id"]; ?>&alumno_id=<?php echo $alumnoDetalle["id"]; ?>&proceso=edicion"><span id="" title="Eliminar" class="glyphicon glyphicon-trash col-sm-1 size_icon"></span></a>
											<?php
											endif;
											?>
											<!-- Acciones SICYT -->
											<?php
											if (Rol::ROL_ADMIN == $_SESSION["rol_id"] || (Rol::ROL_CONTROL_ESCOLAR_SICYT == $_SESSION["rol_id"])) :
											?>
												<a href="ce-catalogo-alumno.php?programa_id=<?php echo $resultadoPrograma["data"]["id"]; ?>&alumno_id=<?php echo $alumnoDetalle["id"]; ?>&proceso=consulta"><span id="" title="Abrir" class="glyphicon glyphicon-eye-open col-sm-1 size_icon"></span></a>
												<a href="ce-catalogo-alumno.php?programa_id=<?php echo $resultadoPrograma["data"]["id"]; ?>&alumno_id=<?php echo $alumnoDetalle["id"]; ?>&proceso=edicion"><span id="" title="Editar" class="glyphicon glyphicon-edit col-sm-1 size_icon"></span></a>
												<a href="#" onclick="Alumno.modalEliminarRegistro('<?php echo $alumnoDetalle['id'] ?>', '<?php echo $nombreCompletoAlumno ?>', '<?php echo $alumnoDetalle['matricula'] ?>', '<?php echo $resultadoPrograma['data']['id'] ?>')"><span id="" title="Eliminar" class="glyphicon glyphicon-trash col-sm-1 size_icon"></span></a>
											<?php
											endif;
											?>
										</td>

										</td>
										<td>
											<a href="ce-documentos.php?programa_id=<?php echo $resultadoPrograma["data"]["id"]; ?>&alumno_id=<?php echo $alumnoDetalle["id"]; ?>">Documentos</span></a>
											<?php if (Rol::ROL_CONTROL_ESCOLAR_IES == $_SESSION["rol_id"] || (Rol::ROL_REPRESENTANTE_LEGAL == $_SESSION["rol_id"])) : ?>
												<br />
												<a href="ce-validacion-alumno.php?programa_id=<?php echo $resultadoPrograma["data"]["id"]; ?>&alumno_id=<?php echo $alumnoDetalle["id"]; ?>&proceso=edicion">Validaci&oacute;n</a>
											<?php endif; ?>
											<br />
											<a href="ce-kardex.php?programa_id=<?php echo $resultadoPrograma["data"]["id"]; ?>&alumno_id=<?php echo $alumnoDetalle["id"]; ?>">Historial Academico</a>
										</td>
									</tr>
								<?php
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
						<h4 class="modal-title">Eliminar registro</h4>
					</div>
					<div class="modal-body">
						<div id="mensajeDocumentacion"></div>
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
	<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#tabla-reporte").DataTable({
				"language": {
					"url": "//cdn.datatables.net/plug-ins/1.10.19/i18n/Spanish.json"
				}
			});
		});
	</script>
	<!-- JS PROPIOS -->
	<script src="../js/alumnos.js"></script>

</body>

</html>