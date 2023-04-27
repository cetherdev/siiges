<?php
// Válida los permisos del usuario de la sesión
require_once "../utilities/utileria-general.php";
Utileria::validarSesion(basename(__FILE__));

//====================================================================================================

require_once "../models/modelo-programa.php";
require_once "../models/modelo-grupo.php";
require_once "../models/modelo-turno.php";
require_once "../models/modelo-ciclo-escolar.php";
require_once "../models/modelo-asignatura.php";
require_once "../models/modelo-alumno-grupo.php";
require_once "../models/modelo-alumno.php";
require_once "../models/modelo-persona.php";
require_once "../models/modelo-calificacion.php";

$programa = new Programa();
$programa->setAttributes(array("id" => $_GET["programa_id"]));
$resultadoPrograma = $programa->consultarId();

$grupo = new Grupo();
$grupo->setAttributes(array("id" => $_GET["grupo_id"]));
$resultadoGrupo = $grupo->consultarId();

$parametros["id"] = $resultadoGrupo["data"]["turno_id"];

$turno = new Turno();
$turno->setAttributes($parametros);
$resultadoTurno = $turno->consultarId();

$parametros2["id"] = $resultadoGrupo["data"]["ciclo_escolar_id"];

$cicloEscolar = new CicloEscolar();
$cicloEscolar->setAttributes($parametros2);
$resultadoCicloEscolar = $cicloEscolar->consultarId();

$parametros3["id"] = $_GET["asignatura_id"];

$asignatura = new Asignatura();
$asignatura->setAttributes($parametros3);
$resultadoAsignatura = $asignatura->consultarId();
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
	<!-- CSS LIVESELECT -->
	<link rel="stylesheet" type="text/css" href="../css/bootstrap-select.min.css">
	<!-- CSS CALENDAR -->
	<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
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
						<?php
						if (
							Rol::ROL_REVALIDACION_EQUIVALENCIA == $_SESSION["rol_id"] ||
							(Rol::ROL_REPRESENTANTE_LEGAL == $_SESSION["rol_id"] && $_GET["tramite"] == "equiv") ||
							(Rol::ROL_CONTROL_ESCOLAR_IES == $_SESSION["rol_id"] && $_GET["tramite"] == "equiv")
						) {
						?>
							<li><a href="ce-grados-equivalencia.php?programa_id=<?php echo $_GET["programa_id"]; ?>&ciclo_id=<?php echo $_GET["ciclo_id"]; ?>">Grados</a></li>
							<li><a href="ce-grupos-equivalencia.php?programa_id=<?php echo $_GET["programa_id"]; ?>&ciclo_id=<?php echo $_GET["ciclo_id"]; ?>&grado=<?php echo $_GET["grado"]; ?>">Grupos</a></li>
							<li><a href="ce-asignaturas.php?programa_id=<?php echo $_GET["programa_id"]; ?>&ciclo_id=<?php echo $_GET["ciclo_id"]; ?>&grado=<?php echo $_GET["grado"]; ?>&grupo_id=<?php echo $_GET["grupo_id"]; ?>&tramite=equiv">Asignaturas</a></li>
						<?php	} else { ?>
							<li><a href="ce-grados.php?programa_id=<?php echo $_GET["programa_id"]; ?>&ciclo_id=<?php echo $_GET["ciclo_id"]; ?>">Grados</a></li>
							<li><a href="ce-grupos.php?programa_id=<?php echo $_GET["programa_id"]; ?>&ciclo_id=<?php echo $_GET["ciclo_id"]; ?>&grado=<?php echo $_GET["grado"]; ?>">Grupos</a></li>
							<li><a href="ce-asignaturas.php?programa_id=<?php echo $_GET["programa_id"]; ?>&ciclo_id=<?php echo $_GET["ciclo_id"]; ?>&grado=<?php echo $_GET["grado"]; ?>&grupo_id=<?php echo $_GET["grupo_id"]; ?>">Asignaturas</a></li>
						<?php	} ?>
						<li class="active">Calificaciones Extraordinarios</li>
					</ol>
				</div>
			</div>

			<!-- CUERPO PRINCIPAL -->
			<form name="form1" method="post" action="../controllers/control-calificacion.php">
				<div class="col-sm-12 col-md-12 col-lg-12">
					<!-- TÍTULO -->
					<h2 id="txtNombre">Calificaciones Extraordinarios</h2>
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
							<table id="tabla-reporte1" class="table table-striped table-bordered" cellspacing="0" width="100%">
								<thead>
									<tr>
										<th width="15%">Grado</th>
										<th width="15%">Grupo</th>
										<?php
										if (!(Rol::ROL_REVALIDACION_EQUIVALENCIA == $_SESSION["rol_id"] ||
											(Rol::ROL_REPRESENTANTE_LEGAL == $_SESSION["rol_id"] && $_GET["tramite"] == "equiv") ||
											(Rol::ROL_CONTROL_ESCOLAR_IES == $_SESSION["rol_id"] && $_GET["tramite"] == "equiv"))) :
										?>
											<th width="15%">Turno</th>
										<?php
										endif; ?>
										<th width="15%">Ciclo</th>
										<th width="40%">Asignatura</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td><?php echo $_GET["grado"]; ?></td>
										<td><?php echo $resultadoGrupo["data"]["grupo"]; ?></td>
										<?php
										if (!(Rol::ROL_REVALIDACION_EQUIVALENCIA == $_SESSION["rol_id"] ||
											(Rol::ROL_REPRESENTANTE_LEGAL == $_SESSION["rol_id"] && $_GET["tramite"] == "equiv") ||
											(Rol::ROL_CONTROL_ESCOLAR_IES == $_SESSION["rol_id"] && $_GET["tramite"] == "equiv"))) :
										?>
											<td><?php echo $resultadoTurno["data"]["nombre"]; ?></td>
										<?php
										endif; ?>
										<td><?php echo $resultadoCicloEscolar["data"]["nombre"]; ?></td>
										<td><?php echo $resultadoAsignatura["data"]["nombre"]; ?></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>

					<div class="row" style="padding-top: 50px;">
						<div class="col-sm-12">
						</div>
					</div>
					<div class="row">
						<div class="col-sm-12">
							<legend>ALUMNOS INSCRITOS</legend>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-12">
							<table id="tabla-reporte2" class="table table-striped table-bordered" cellspacing="0" width="100%">
								<thead>
									<tr>
										<th width="15%">Matr&iacute;cula</th>
										<th width="30%">Nombre</th>
										<th width="15%">Calificaci&oacute;n Ordinario</th>
										<th width="20%">Calificaci&oacute;n Extraordinario</th>
										<th width="20%">
                      <?php if ($resultadoCicloEscolar && $_GET["tramite"] == "equiv") { ?>
												Fecha Equivalencia
											<?php } else { ?>
												Fecha de Examen
											<?php } ?>
                    </th>
									</tr>
								</thead>
								<tbody>
									<?php
									$parametros["grupo_id"] = $_GET["grupo_id"];

									$alumnoGrupo = new AlumnoGrupo();
									$alumnoGrupo->setAttributes($parametros);
									$resultadoAlumnoGrupo = $alumnoGrupo->consultarAlumnosGrupo();

									$max = count($resultadoAlumnoGrupo["data"]);

									for ($i = 0; $i < $max; $i++) {
										$parametros2["alumno_id"] = $resultadoAlumnoGrupo["data"][$i]["alumno_id"];
										$parametros2["grupo_id"] = $resultadoAlumnoGrupo["data"][$i]["grupo_id"];
										$parametros2["asignatura_id"] = $_GET["asignatura_id"];
										$parametros2["tipo"] = "1";

										$calificacion = new Calificacion();
										$calificacion->setAttributes($parametros2);
										$resultadoCalificacion = $calificacion->consultarAlumnoAsignatura();

										$max2 = count($resultadoCalificacion["data"]);

										if ($max2 > 0) {
											$parametros3["id"] = $resultadoAlumnoGrupo["data"][$i]["alumno_id"];

											$alumno = new Alumno();
											$alumno->setAttributes($parametros3);
											$resultadoAlumno = $alumno->consultarId();

											$parametros4["id"] = $resultadoAlumno["data"]["persona_id"];

											$persona = new Persona();
											$persona->setAttributes($parametros4);
											$resultadoPersona = $persona->consultarId();

											$parametros5["alumno_id"] = $resultadoAlumnoGrupo["data"][$i]["alumno_id"];
											$parametros5["grupo_id"] = $resultadoAlumnoGrupo["data"][$i]["grupo_id"];
											$parametros5["asignatura_id"] = $_GET["asignatura_id"];
											$parametros5["tipo"] = "2";

											$calificacion2 = new Calificacion();
											$calificacion2->setAttributes($parametros5);
											$resultadoCalificacion2 = $calificacion2->consultarAlumnoAsignatura();
									?>
											<tr>
												<td><?php echo $resultadoAlumno["data"]["matricula"]; ?></td>
												<td><?php echo $resultadoPersona["data"]["apellido_paterno"] . " " . $resultadoPersona["data"]["apellido_materno"] . " " . $resultadoPersona["data"]["nombre"]; ?></td>
												<td <?php if ($resultadoCalificacion["data"][0]["calificacion"] < $resultadoPrograma["data"]["calificacion_aprobatoria"]) {
															echo "style='color: red;'";
														} ?>><?php echo $resultadoCalificacion["data"][0]["calificacion"]; ?></td>
												<td id="calificaciones">
													<input list="datalist" id="calificacion[]" name="calificacion[]" value="<?php echo isset($resultadoCalificacion2["data"][0]["calificacion"]) ? $resultadoCalificacion2["data"][0]["calificacion"] : ""; ?>" class="form-control" 
                          <?php
                            if (($resultadoCalificacion["data"][0]["calificacion"] >= $resultadoPrograma["data"]["calificacion_aprobatoria"]) 
                            || (!isset($resultadoCalificacion["data"][0]["calificacion"]))) { echo "readonly"; }
                          ?> 
                          step="<?php echo ($resultadoPrograma["data"]["calificacion_decimal"] == 1) ? "0.1" : "1";?>" <?php if ($resultadoAlumno["data"]["situacion_id"] == 3) {echo "readonly"; } ?>/>
													<datalist id="datalist">
														<option value="NS (No solicitó)">
														<option value="NP (No presentó)">
														<option value="RC (Recursa)">
														<option value="SD (Sin Derecho)">
													</datalist>
												</td>
												<td><input type="date" id="fecha_examen[]" name="fecha_examen[]" value="<?php echo isset($resultadoCalificacion2["data"][0]["fecha_examen"]) ? $resultadoCalificacion2["data"][0]["fecha_examen"] : ""; ?>" maxlength="10" class="form-control" 
                          <?php
                            if (($resultadoCalificacion["data"][0]["calificacion"] >= $resultadoPrograma["data"]["calificacion_aprobatoria"]) 
                            || (!isset($resultadoCalificacion["data"][0]["calificacion"]))) { echo "readonly"; }
                          ?> />
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
					<div class="row">
						<div class="col-sm-12">
							<div class="form-group">
								<input type="submit" id="submit" name="submit" value="Enviar" class="btn btn-primary" />
								<input type="hidden" name="webService" value="guardarCalificacionesGrupoAsignaturaExtra" />
								<input type="hidden" name="programa_id" value="<?php echo $_GET["programa_id"]; ?>" />
								<input type="hidden" name="ciclo_id" value="<?php echo $_GET["ciclo_id"]; ?>" />
								<input type="hidden" name="grado" value="<?php echo $_GET["grado"]; ?>" />
								<input type="hidden" name="grupo_id" value="<?php echo $_GET["grupo_id"]; ?>" />
								<input type="hidden" name="asignatura_id" value="<?php echo $_GET["asignatura_id"]; ?>" />
								<input type="hidden" name="tramite" value="<?php echo $_GET["tramite"]; ?>" />
							</div>
						</div>
					</div>
				</div>
			</form>

		</section>
	</div>

	<!-- JS GOB.MX -->
	<script src="https://framework-gb.cdn.gob.mx/gobmx.js"></script>
	<!-- JS JQUERY -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<!-- JS DATATABLE -->
	<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
	<!-- JS LIVESELECT -->
	<script src="../js/bootstrap-select.min.js"></script>
	<!-- JS CALENDAR -->
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<!-- JS PROPIOS -->
	<script type="text/javascript">
		const inputs = document.querySelectorAll('#calificaciones');
		const input = [];
		const enteros = [1, 2, 3, 4, 5, 6, 7, 8, 9];

		for (let i = 0; i < inputs.length; i++) {
			input.push(inputs[i].children[0]);
			if (input[i].step === "0.1") {
				input[i].addEventListener('change', updateValueFloat);
			} else {
				input[i].addEventListener('change', updateValueInt);
			}
		}

		function updateValueFloat(e) {
			enteros.map(function(entero) {
				if (!isNaN(parseFloat(e.target.value))) {
					if (entero === parseFloat(e.target.value)) {
						e.target.value = parseFloat(e.target.value).toFixed(1);
					}
				}
			});
		}

		function updateValueInt(e) {
			if (!isNaN(parseFloat(e.target.value))) {
				e.target.value = parseFloat(e.target.value).toFixed(0);
			}
		}
	</script>

</body>

</html>