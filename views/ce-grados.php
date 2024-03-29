<?php
// Válida los permisos del usuario de la sesión
require_once "../utilities/utileria-general.php";
Utileria::validarSesion(basename(__FILE__));

//====================================================================================================

require_once "../models/modelo-programa.php";
require_once "../models/modelo-asignatura.php";
require_once "../models/modelo-institucion.php";
require_once "../models/modelo-grado.php";


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
						<li><a href="ce-programas-plantel.php?institucion_id=<?php echo $resultadoInstitucion["data"]["id"] ?>&plantel_id=<?php echo $resultadoPlantel["data"]["id"] ?>">Programas de Estudios</a></li>
						<li><a href="ce-ciclos-escolares.php?programa_id=<?php echo $_GET["programa_id"]; ?>">Ciclos Escolares</a></li>
						<li class="active">Grados</li>
					</ol>
				</div>
			</div>

			<!-- CUERPO PRINCIPAL -->
			<div class="col-sm-12 col-md-12 col-lg-12">
				<!-- TÍTULO -->
				<h2 id="txtNombre">Grados</h2>
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
				<div class="row" style="padding-top: 20px;">
					<div class="col-sm-12">
					</div>
				</div>
				<div class="row">
					<div class="col-sm-12">
						<table id="tabla-reporte" class="table table-striped table-bordered" cellspacing="0" width="100%">
							<thead>
								<tr>
									<th width="90%">Grado</th>
									<th width="10%">Acciones</th>
								</tr>
							</thead>
							<tbody>
								<?php
								$asignatura = new Asignatura();
								$asignatura->setAttributes(array("programa_id" => $_GET["programa_id"]));
								$resultadoAsignatura = $asignatura->consultarGradosPrograma();

								$max = count($resultadoAsignatura["data"]);

								$resultadoGrados = [];
								foreach ($resultadoAsignatura["data"] as $key => $atributoAsignatura) {
									$grado = new Grado();
									$res_grado = $grado->consultarPor('grados', array("nombre" => $atributoAsignatura["grado"], "deleted_at"), '*');
									array_push($resultadoGrados, $res_grado["data"][0]);
								}

								$resultadoGrados = Utileria::array_sort($resultadoGrados, 'numero_grado', SORT_ASC);

								foreach ($resultadoGrados as $key => $atributoGrado) {

									if ($atributoGrado["nombre"] != "Optativa") {
								?>
										<tr>
											<td><?php echo $atributoGrado["nombre"]; ?></td>
											<td>
												<a href="ce-grupos.php?programa_id=<?php echo $_GET["programa_id"]; ?>&ciclo_id=<?php echo $_GET["ciclo_id"]; ?>&grado=<?php echo $atributoGrado["nombre"]; ?>">Grupos</a>
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
	</div>

	<!-- JS GOB.MX -->
	<script src="https://framework-gb.cdn.gob.mx/gobmx.js"></script>
	<!-- JS JQUERY -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
</body>

</html>