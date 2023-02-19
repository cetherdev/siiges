<?php
// Válida los permisos del usuario de la sesión
require_once "../utilities/utileria-general.php";
Utileria::validarSesion(basename(__FILE__));

//====================================================================================================

require_once "../models/modelo-programa.php";
require_once "../models/modelo-alumno.php";
require_once "../models/modelo-persona.php";
require_once "../models/modelo-pais.php";
require_once "../models/modelo-situacion.php";
require_once "../models/modelo-tipo-tramite.php";
require_once "../models/modelo-rol.php";

$programa = new Programa();
$programa->setAttributes(array("id" => $_GET["programa_id"]));
$resultadoPrograma = $programa->consultarId();

if (Rol::ROL_REVALIDACION_EQUIVALENCIA == $_SESSION["rol_id"]) {
  if ($_GET["proceso"] == "alta") {
    $titulo = "Alta de Alumno Equivalente";
  }

  if ($_GET["proceso"] == "consulta") {
    $titulo = "Consulta de Alumno Equivalente";

    $alumno = new Alumno();
    $alumno->setAttributes(array("id" => $_GET["alumno_id"]));
    $resultadoAlumno = $alumno->consultarId();

    $persona = new Persona();
    $persona->setAttributes(array("id" => $resultadoAlumno["data"]["persona_id"]));
    $resultadoPersona = $persona->consultarId();
  }

  if ($_GET["proceso"] == "edicion") {
    $titulo = "Edici&oacute;n de Alumno Equivalente";

    $alumno = new Alumno();
    $alumno->setAttributes(array("id" => $_GET["alumno_id"]));
    $resultadoAlumno = $alumno->consultarId();

    $persona = new Persona();
    $persona->setAttributes(array("id" => $resultadoAlumno["data"]["persona_id"]));
    $resultadoPersona = $persona->consultarId();

    $json = [];
    $nombre =  $resultadoPersona["data"]["nombre"] . " " . $resultadoPersona["data"]["apellido_paterno"] . " " . $resultadoPersona["data"]["apellido_materno"];
    $json["id"] = $resultadoAlumno["data"]["id"];
    $json["nombre"] = $nombre;
    $json = json_encode($json);
  }
} else {
  if ($_GET["proceso"] == "alta") {
    $titulo = "Alta de Alumno";
  }

  if ($_GET["proceso"] == "consulta") {
    $titulo = "Consulta de Alumno";

    $alumno = new Alumno();
    $alumno->setAttributes(array("id" => $_GET["alumno_id"]));
    $resultadoAlumno = $alumno->consultarId();

    $persona = new Persona();
    $persona->setAttributes(array("id" => $resultadoAlumno["data"]["persona_id"]));
    $resultadoPersona = $persona->consultarId();
  }

  if ($_GET["proceso"] == "edicion") {
    $titulo = "Edici&oacute;n de Alumno";

    $alumno = new Alumno();
    $alumno->setAttributes(array("id" => $_GET["alumno_id"]));
    $resultadoAlumno = $alumno->consultarId();

    $persona = new Persona();
    $persona->setAttributes(array("id" => $resultadoAlumno["data"]["persona_id"]));
    $resultadoPersona = $persona->consultarId();

    $json = [];
    $nombre =  $resultadoPersona["data"]["nombre"] . " " . $resultadoPersona["data"]["apellido_paterno"] . " " . $resultadoPersona["data"]["apellido_materno"];
    $json["id"] = $resultadoAlumno["data"]["id"];
    $json["nombre"] = $nombre;
    $json = json_encode($json);
  }
}
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
            <li><a href="ce-programas.php">Programas de Estudios</a></li>
            <?php if (Rol::ROL_REVALIDACION_EQUIVALENCIA == $_SESSION["rol_id"]) { ?>
              <li><a href="ce-alumnos-equivalencia.php?programa_id=<?php echo $_GET["programa_id"]; ?>">Alumnos</a></li>
            <?php } else { ?>
              <li><a href="ce-alumnos.php?programa_id=<?php echo $_GET["programa_id"]; ?>">Alumnos</a></li>
            <?php } ?>
            <li class="active"><?php echo $titulo; ?></li>
          </ol>
        </div>
      </div>

      <!-- CUERPO PRINCIPAL -->
      <form name="form1" method="post" action="../controllers/control-alumno.php">
        <div class="col-sm-12 col-md-12 col-lg-12">
          <!-- TÍTULO -->
          <h2 id="txtNombre"><?php echo $titulo; ?></h2>
          <hr class="red">
          <div class="row">
            <div class="col-sm-12">
              <legend><?php echo $resultadoPrograma["data"]["nombre"]; ?></legend>
            </div>
          </div>
          <!-- NOTIFICACIÓN -->
          <?php if (isset($_GET["codigo"]) && $_GET["codigo"] == 404) { ?>
            <div class="alert alert-danger">
              <p>La matr&iacute;cula ingresada ya se encuentra registrada.</p>
            </div>
          <?php } ?>
          <!-- CONTENIDO -->
          <div class="row">
            <div class="col-sm-4">
              <div class="form-group">
                <label class="control-label" for="id">Id</label>
                <input type="text" id="id" name="id" value="<?php echo (isset($resultadoAlumno)) ? $resultadoAlumno["data"]["id"] : "";
                                                            ?>" maxlength="11" class="form-control" readonly />
              </div>
            </div>
            <div class="col-sm-4">
              <div class="form-group">
                <label class="control-label" for="persona_id">Persona Id</label>
                <input type="text" id="persona_id" name="persona_id" value="<?php echo (isset($resultadoAlumno)) ? $resultadoAlumno["data"]["persona_id"] : ""; ?>" maxlength="11" class="form-control" readonly />
              </div>
            </div>
            <div class="col-sm-4">
              <div class="form-group">
                <label class="control-label" for="programa_id">Programa Id</label>
                <input type="text" id="programa_id" name="programa_id" value="<?php echo $_GET["programa_id"]; ?>" maxlength="11" class="form-control" required readonly />
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-sm-8">
              <p class="text-muted small">
                <strong>¡Nota importante! </strong>
                El nombre del alumno se debe registrar tal y como aparece en el acta de nacimiento, en may&uacute;sculas y en caso de tener acentos, omitirlos.
              </p>
            </div>
          </div>
          <div class="row">
            <div class="col-sm-4">
              <div class="form-group">
                <label class="control-label" for="nombre">Nombre* </label>
                <input type="text" id="nombre" name="nombre" value="<?php echo (isset($resultadoPersona)) ? $resultadoPersona["data"]["nombre"] : ""; ?>" maxlength="255" class="form-control" required />
              </div>
            </div>
            <div class="col-sm-4">
              <div class="form-group">
                <label class="control-label" for="apellido_paterno">Apellido Paterno* </label>
                <input type="text" id="apellido_paterno" name="apellido_paterno" value="<?php echo (isset($resultadoPersona)) ? $resultadoPersona["data"]["apellido_paterno"] : ""; ?>" maxlength="255" class="form-control" required />
              </div>
            </div>
            <div class="col-sm-4">
              <div class="form-group">
                <label class="control-label" for="apellido_materno">Apellido Materno</label>
                <input type="text" id="apellido_materno" name="apellido_materno" value="<?php echo (isset($resultadoPersona)) ? $resultadoPersona["data"]["apellido_materno"] : ""; ?>" maxlength="255" class="form-control" />
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-sm-4">
              <div class="form-group">
                <label class="control-label" for="fecha_nacimiento">Fecha de nacimiento* </label>
                <input type="text" id="fecha_nacimiento" name="fecha_nacimiento" value="<?php echo (isset($resultadoPersona)) ? $resultadoPersona["data"]["fecha_nacimiento"] : ""; ?>" maxlength="10" class="form-control" required />
              </div>
            </div>
            <div class="col-sm-4">
              <div class="form-group">
                <label class="txt-label1" for="sexo">Sexo* </label>
                <select id="sexo" name="sexo" class="selectpicker" data-live-search="true" data-width="100%" required>
                  <option value=""> </option>
                  <option value="Masculino" <?php if (isset($resultadoPersona)) {
                                              if ($resultadoPersona["data"]["sexo"] == "Masculino") {
                                                echo "selected";
                                              }
                                            } ?>>Masculino</option>
                  <option value="Femenino" <?php if (isset($resultadoPersona)) {
                                              if ($resultadoPersona["data"]["sexo"] == "Femenino") {
                                                echo "selected";
                                              }
                                            } ?>>Femenino</option>
                </select>
              </div>
            </div>
            <div class="col-sm-4">
              <div class="form-group">
                <label class="control-label" for="nacionalidad">Nacionalidad* </label>
                <select name="nacionalidad" id="nacionalidad" onchange="cambiarCampoObligatorio()" class="selectpicker" data-live-search="true" data-width="100%" required>
                  <?php
                  $nacionalidadMexicana = "";
                  if (
                    isset($resultadoPersona)
                    && (strtoupper($resultadoPersona["data"]["nacionalidad"]) == "MEXICANA"
                      || strtoupper($resultadoPersona["data"]["nacionalidad"]) == "MEXICANO")
                  ) {
                    $nacionalidadMexicana = true;
                  } else if (isset($resultadoPersona["data"]["nacionalidad"])) {
                    $nacionalidadMexicana = false;
                  }
                  ?>
                  <option value="">Selecciona la nacionalidad</option>
                  <option <?php echo (isset($nacionalidadMexicana) && $nacionalidadMexicana) ? "selected" : "" ?> value="MEXICANA">MEXICANA</option>
                  <option <?php echo (isset($nacionalidadMexicana) && $nacionalidadMexicana === false) ? "selected" : "" ?> value="EXTRANJERA">EXTRANJERA</option>
                </select>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-sm-4">
              <div class="form-group">
                <label class="control-label" for="correo">Correo* </label>
                <input type="text" id="correo" name="correo" value="<?php echo (isset($resultadoPersona)) ? strtoupper($resultadoPersona["data"]["correo"]) : ""; ?>" maxlength="255" class="form-control" required />
              </div>
            </div>
            <div class="col-sm-4">
              <div class="form-group">
                <label class="control-label" for="telefono">Tel&eacute;fono* </label>
                <input type="text" id="telefono" name="telefono" value="<?php echo (isset($resultadoPersona)) ? $resultadoPersona["data"]["telefono"] : ""; ?>" maxlength="255" class="form-control" required />
              </div>
            </div>
            <div class="col-sm-4">
              <div class="form-group">
                <label class="control-label" for="celular">Celular</label>
                <input type="text" id="celular" name="celular" value="<?php echo (isset($resultadoPersona)) ? $resultadoPersona["data"]["celular"] : ""; ?>" maxlength="255" class="form-control" />
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-sm-4">
              <div class="form-group">
                <label class="control-label" for="curp" id="curpLabel">CURP <?php echo (isset($resultadoPersona) && $resultadoPersona["data"]["nacionalidad"] === "MEXICANA") ?  "*" : ""; ?></label>
                <input type="text" id="curp" name="curp" value="<?php echo (isset($resultadoPersona)) ? $resultadoPersona["data"]["curp"] : ""; ?>" maxlength="255" class="form-control" <?php echo (isset($resultadoPersona) && $resultadoPersona["data"]["nacionalidad"] === "MEXICANA") ?  "required" : ""; ?> />
              </div>
            </div>
            <div class="col-sm-4">
              <div class="form-group">
                <label class="control-label" for="matricula">Matr&iacute;cula* </label>
                <span class="glyphicon glyphicon-question-sign" data-toggle="tooltip" data-placement="top" title="La matrícula deberá ser generada por la Institución Educativa, considerando que debe ser única para cada alumno"></span>
                <input type="text" id="matricula" name="matricula" value="<?php echo (isset($resultadoAlumno)) ? $resultadoAlumno["data"]["matricula"] : ""; ?>" maxlength="255" class="form-control" required />
              </div>
            </div>
            <div class="col-sm-4">
              <div class="form-group">
                <label class="control-label" for="">Fecha de registro </label>
                <input type="text" id="" name="" value="<?php echo (isset($resultadoAlumno)) ? date_format(date_create($resultadoAlumno["data"]["created_at"]), 'Y-m-d') : ""; ?>" maxlength="10" class="form-control" readonly />
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-sm-4">
              <div class="form-group">
                <?php if (
                  Rol::ROL_REVALIDACION_EQUIVALENCIA == $_SESSION["rol_id"] ||
                  (Rol::ROL_REPRESENTANTE_LEGAL == $_SESSION["rol_id"] && isset($_GET["tramite"]) && $_GET["tramite"] == "equiv") ||
                  (Rol::ROL_CONTROL_ESCOLAR_IES == $_SESSION["rol_id"] && isset($_GET["tramite"]) && $_GET["tramite"] == "equiv")
                ) : ?>

                  <label class="control-label" for="revalidacion_equivalencia">Tipo de tr&aacute;mite</label>
                  <select onchange="changeFunc(
              <?php
                  echo (isset($json) ? htmlentities($json) : '');
              ?>
               );" id="tipo_tramite_id" name="tipo_tramite_id" class="selectpicker" data-live-search="true" data-width="100%" required>
                    <option value=""> </option>
                    <?php
                    $tipoTramite = new TipoTramite();
                    $tipoTramite->setAttributes(array());
                    $resultadoTipoTramite = $tipoTramite->consultarTodos();

                    $max = count($resultadoTipoTramite["data"]);

                    for ($i = 0; $i < $max; $i++) {
                      if ($resultadoTipoTramite["data"][$i]["id"] == $resultadoAlumno["data"]["tipo_tramite_id"]) {
                        echo "<option value='" . $resultadoTipoTramite["data"][$i]["id"] . "' selected>" . $resultadoTipoTramite["data"][$i]["nombre"] . "</option>";
                      } else {
                        echo "<option value='" . $resultadoTipoTramite["data"][$i]["id"] . "'>" . $resultadoTipoTramite["data"][$i]["nombre"] . "</option>";
                      }
                    }
                    ?>
                  </select>
                <?php endif; ?>
              </div>
            </div>
          </div>

          <!-- Permisos de administrador o control escolar SICYT para dar estatus a alumno -->
          <?php if (Rol::ROL_ADMIN == $_SESSION["rol_id"] || Rol::ROL_CONTROL_ESCOLAR_SICYT == $_SESSION["rol_id"]) : ?>
            <div class="row">
              <div class="col-sm-4">
                <div class="form-group">
                  <label class="txt-label1" for="situacion_id">Situaci&oacute;n</label>
                  <select onchange="changeFunc(
                    <?php
                    echo (isset($json) ? htmlentities($json) : '');
                    ?>
                  );" id="situacion_id" name="situacion_id" class="selectpicker" data-live-search="true" data-width="100%" required>
                    <option value=""> </option>
                    <?php
                    $situacion = new Situacion();
                    $situacion->setAttributes(array());
                    $resultadoSituacion = $situacion->consultarTodos();

                    $max = count($resultadoSituacion["data"]);

                    for ($i = 0; $i < $max; $i++) {
                      if ($resultadoSituacion["data"][$i]["id"] == $resultadoAlumno["data"]["situacion_id"]) {
                        echo "<option value='" . $resultadoSituacion["data"][$i]["id"] . "' selected>" . $resultadoSituacion["data"][$i]["nombre"] . "</option>";
                      } else {
                        echo "<option value='" . $resultadoSituacion["data"][$i]["id"] . "'>" . $resultadoSituacion["data"][$i]["nombre"] . "</option>";
                      }
                    }
                    ?>
                  </select>
                </div>
              </div>
              <?php if (isset($resultadoAlumno["data"]["situacion_id"]) && $resultadoAlumno["data"]["situacion_id"] == "4") : ?>
                <div class="col-sm-4">
                  <div class="form-group">
                    <label class="control-label" for="">Fecha de baja</label><br>
                    <input type="text" id="" class="form-control" value="<?php echo (isset($resultadoAlumno)) ? date_format(date_create($resultadoAlumno["data"]["fecha_baja"]), 'Y-m-d') : ""; ?>" readonly />
                  </div>
                </div>
                <div class="col-sm-4">
                  <div class="form-group">
                    <label class="control-label" for="">Motivos de baja</label><br>
                    <input type="text" id="" class="form-control" value="<?php echo (isset($resultadoAlumno)) ? $resultadoAlumno["data"]["observaciones_baja"] : ""; ?>" readonly />
                  </div>
                </div>
              <?php endif; ?>
            </div>
          <?php endif; ?>

          <!-- Rol control escolar IES y Representante legal no pueden editar el estatus del alumno -->
          <?php if (Rol::ROL_CONTROL_ESCOLAR_IES == $_SESSION["rol_id"] || Rol::ROL_REPRESENTANTE_LEGAL == $_SESSION["rol_id"] || Rol::ROL_REVALIDACION_EQUIVALENCIA == $_SESSION["rol_id"]) : ?>
            <div class="row">
              <div class="col-sm-4">
                <div class="form-group">
                  <label class="txt-label1" for="situacion_id">Situaci&oacute;n</label>
                  <select onchange="changeFunc(
                    <?php
                    echo (isset($json) ? htmlentities($json) : '');
                    ?>
                  );" id="situacion_id" name="situacion_id" class="selectpicker" data-live-search="true" data-width="100%"
                  <?php !isset($resultadoAlumno["data"]["situacion_id"]) ?>  required
                  >
                    <?php
                    $situacion = new Situacion();
                    $situacion->setAttributes(array());
                    $resultadoSituacion = $situacion->consultarTodos();

                    $max = count($resultadoSituacion["data"]);
                    if (isset($resultadoAlumno["data"]["id"])) {
                      switch ($resultadoAlumno["data"]["situacion_id"]) {
                        case 1:
                          for ($i = 0; $i < $max; $i++) {
                            if ($resultadoSituacion["data"][$i]["id"] == 1 || $resultadoSituacion["data"][$i]["id"] == 4) {
                              if ($resultadoSituacion["data"][$i]["id"] == $resultadoAlumno["data"]["situacion_id"]) {
                                echo "<option value='" . $resultadoSituacion["data"][$i]["id"] . "' selected>" . $resultadoSituacion["data"][$i]["nombre"] . "</option>";
                              } else {
                                echo "<option value='" . $resultadoSituacion["data"][$i]["id"] . "'>" . $resultadoSituacion["data"][$i]["nombre"] . "</option>";
                              }
                            }
                          }
                          break;
                        case 2:
                          echo "<option value='2' selected>" . "Inactivo" . "</option>";
                          break;
                        case 3:
                          echo "<option value='3' selected>" . "Egresado" . "</option>";
                          break;
                        case 4:
                          echo "<option value='4' selected>" . "Baja" . "</option>";
                        default:
                          # code...
                          break;
                      }
                    } else {
                      echo "<option value='2' selected>" . "Inactivo" . "</option>";
                    }
                    ?>
                  </select>
                </div>
              </div>
              <?php if (isset($resultadoAlumno["data"]["situacion_id"]) && $resultadoAlumno["data"]["situacion_id"] == "4") : ?>
                <div class="col-sm-4">
                  <div class="form-group">
                    <label class="control-label" for="">Fecha de baja</label><br>
                    <input type="text" id="" class="form-control" value="<?php echo (isset($resultadoAlumno)) ? date_format(date_create($resultadoAlumno["data"]["fecha_baja"]), 'Y-m-d') : ""; ?>" readonly />
                  </div>
                </div>
                <div class="col-sm-4">
                  <div class="form-group">
                    <label class="control-label" for="">Motivos de baja</label><br>
                    <input type="text" id="" class="form-control" value="<?php echo (isset($resultadoAlumno)) ? $resultadoAlumno["data"]["observaciones_baja"] : ""; ?>" readonly />
                  </div>
                </div>
              <?php endif; ?>
            </div>
          <?php endif; ?>
          <?php
          if ($_GET["proceso"] != "consulta") {
          ?>
            <div class="row">
              <div class="col-sm-12">
                <div class="form-group">
                  <input type="submit" id="submit" name="submit" value="Enviar" class="btn btn-primary" />
                  <input type="hidden" name="webService" value="guardarAlumnoPersona" />
                  <input type="hidden" name="proceso" value="<?php echo $_GET["proceso"]; ?>" />
                  <?php if (
                    Rol::ROL_REVALIDACION_EQUIVALENCIA == $_SESSION["rol_id"] ||
                    (Rol::ROL_REPRESENTANTE_LEGAL == $_SESSION["rol_id"] && isset($_GET["tramite"]) && $_GET["tramite"] == "equiv") ||
                    (Rol::ROL_CONTROL_ESCOLAR_IES == $_SESSION["rol_id"] && isset($_GET["tramite"]) && $_GET["tramite"] == "equiv")
                  ) { ?>
                    <input type="hidden" name="url" value="../views/ce-alumnos-equivalencia.php?programa_id=<?php echo $_GET["programa_id"]; ?>&codigo=200" />
                    <input type="hidden" name="tramite" value="<?php echo $_GET["tramite"]; ?>" />
                  <?php } else { ?>
                    <input type="hidden" name="url" value="../views/ce-alumnos.php?programa_id=<?php echo $_GET["programa_id"]; ?>&codigo=200" />
                  <?php } ?>
                </div>
              </div>
            </div>
          <?php
          }
          ?>
        </div>
      </form>
    </section>

    <!-- Modal para confirmación -->
    <div class="modal fade" id="modalConfirmacion" role="dialog">
      <div id="tamanoModales" class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
          <div class="modal-header">
            <h4 class="modal-title">Confirmación</h4>
          </div>
          <div class="modal-body">
            <div id="mensajesTerminar" class="alert alert-danger">
              <p id="textoConfirmacion" class="text-justify"></p>
            </div>
            <div class="col-sm-12 col-md-12">
              <label class="control-label" for="">Fecha de baja</label><br>
              <input type="date" id="fecha_baja" class="form-control">
              <br>
            </div>
            <div class="col-sm-12 col-md-12">
              <label class="control-label" for="">Motivos de baja</label><br>
              <input type="text" id="observaciones_baja" class="form-control">
              <br>
            </div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="Alumno.cancelarBaja()">Cancelar</button>
            <button id="boton-terminar" type="button" class="btn btn-primary" onclick="Alumno.baja()">Baja Alumno</button>
          </div>
        </div>
      </div>
    </div>
    <!-- Modal que muestra mensaje -->
    <div class="modal fade" id="modalMensaje" role="dialog">
      <div id="tamanoModal" class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title">Mensaje</h4>
          </div>
          <div class="modal-body">
            <div id="mensajesTerminar" class="alert alert-success">
              <p class="text-justify">Baja de alumno satisfactoria</p>
            </div>
          </div>
          <div class="modal-footer">
            <button id="boton-terminar" type="button" class="btn btn-primary" onclick="Alumno.listo()">Listo</button>
          </div>
        </div>
      </div>
    </div>
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

  <script>
    const curpInput = document.getElementById("curp");
    const nacionalidadInput = document.getElementById("nacionalidad");
    const curpLabel = document.getElementById("curpLabel");

    const cambiarCampoObligatorio = function() {
      if (nacionalidadInput.value == "MEXICANA" || nacionalidadInput.value == "") {
        curpInput.required = true
        curpLabel.innerHTML = "CURP *"
      } else {
        curpInput.required = false;
        curpLabel.innerHTML = "CURP"
      }
    }

    $(document).ready(function() {
      $("#fecha_nacimiento").datepicker({
        firstDay: 1,
        monthNames: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
        dayNamesMin: ['Do', 'Lu', 'Ma', 'Mi', 'Ju', 'Vi', 'Sá'],
        dateFormat: 'yy-mm-dd'
      });
    });

  </script>
  <!-- JS PROPIOS -->
  <script src="../js/alumnos.js"></script>

</body>

</html>
