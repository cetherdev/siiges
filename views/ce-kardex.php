<?php
// Válida los permisos del usuario de la sesión
require_once "../utilities/utileria-general.php";
Utileria::validarSesion(basename(__FILE__));

//====================================================================================================

require_once "../models/modelo-programa.php";
require_once "../models/modelo-situacion.php";
require_once "../models/modelo-alumno.php";
require_once "../models/modelo-persona.php";
require_once "../models/modelo-calificacion.php";
require_once "../models/modelo-grupo.php";
require_once "../models/modelo-ciclo-escolar.php";
require_once "../models/modelo-asignatura.php";

$programa = new Programa();
$programa->setAttributes(array("id" => $_GET["programa_id"]));
$resultadoPrograma = $programa->consultarId();

$situaciones = array(1 => 'Activo', 2 => 'Inactivo', 3 => 'Egresado', 4 => 'Baja');    

$alumno = new Alumno();
$alumno->setAttributes(array("id" => $_GET["alumno_id"]));
$resultadoAlumno = $alumno->consultarId();

$persona = new Persona();
$persona->setAttributes(array("id" => $resultadoAlumno["data"]["persona_id"]));
$resultadoPersona = $persona->consultarId();

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
            <li><a href="home.php">SIIGES</a></li>
            <?php if (Rol::ROL_REVALIDACION_EQUIVALENCIA == $_SESSION["rol_id"]) { ?>
              <li><a href="ce-alumnos-equivalencia.php?programa_id=<?php echo $_GET["programa_id"]; ?>">Alumnos</a></li>
            <?php } else { ?>
              <li><a href="ce-alumnos.php?programa_id=<?php echo $_GET["programa_id"]; ?>">Alumnos</a></li>
            <?php } ?>
            <li class="active">Consulta de Historial Acad&eacute;mico</li>
          </ol>
        </div>
      </div>

      <!-- CUERPO PRINCIPAL -->
      <div class="col-sm-12 col-md-12 col-lg-12">
        <!-- TÍTULO -->
        <h2 id="txtNombre">Consulta de Historial Acad&eacute;mico</h2>
        <hr class="red">
        <div class="row">
          <div class="col-sm-12">
            <legend><?php echo $resultadoPrograma["data"]["nombre"]; ?></legend>
          </div>
        </div>
        <!-- CONTENIDO -->
        <div class="row">
          <div class="col-sm-12 col-md-6">
            <table id="tabla-reporte1" class="table table-striped table-bordered" cellspacing="0" width="100%">
              <thead>
                <tr>
                  <th width="50%">Matr&iacute;cula</th>
                  <th width="50%">Situaci&oacute;n</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td><?php echo $resultadoAlumno["data"]["matricula"]; ?></td>
                  <td><?php 
                  echo $situaciones[$resultadoAlumno["data"]["situacion_id"]]; 
                  ?></td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
        <div class="row">
          <div class="col-sm-12 col-md-12">
            <table id="tabla-reporte1" class="table table-striped table-bordered" cellspacing="0" width="100%">
              <thead>
                <tr>
                  <th width="25%">Apellido Paterno</th>
                  <th width="25%">Apellido Materno</th>
                  <?php
                  if (Rol::ROL_ADMIN == $_SESSION["rol_id"] || (Rol::ROL_CONTROL_ESCOLAR_SICYT == $_SESSION["rol_id"])) {
                  ?>
                    <th width="25%">Nombre</th>
                    <th width="25%">Acciones</th>
                  <?php
                  } else {
                  ?>
                    <th width="50%">Nombre</th>
                  <?php
                  }
                  ?>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td><?php echo $resultadoPersona["data"]["nombre"]; ?></td>
                  <td><?php echo $resultadoPersona["data"]["apellido_materno"]; ?></td>
                  <td><?php echo $resultadoPersona["data"]["nombre"]; ?></td>
                  <?php
                  if (Rol::ROL_ADMIN == $_SESSION["rol_id"] || (Rol::ROL_CONTROL_ESCOLAR_SICYT == $_SESSION["rol_id"])) :
                  ?>
                    <td>
                      <a href="ce-catalogo-alumno.php?programa_id=<?php echo $resultadoPrograma["data"]["id"]; ?>&alumno_id=<?php echo $resultadoAlumno["data"]["id"]; ?>&proceso=consulta"><span id="" title="Abrir" class="glyphicon glyphicon-eye-open col-sm-1 size_icon"></span></a>
                      <a href="ce-catalogo-alumno.php?programa_id=<?php echo $resultadoPrograma["data"]["id"]; ?>&alumno_id=<?php echo $resultadoAlumno["data"]["id"]; ?>&proceso=edicion"><span id="" title="Editar" class="glyphicon glyphicon-edit col-sm-1 size_icon"></span></a>
                    </td>
                  <?php
                  endif;
                  ?>
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
            <legend>CALIFICACIONES</legend>
          </div>
        </div>
        <?php if (Rol::ROL_ADMIN == $_SESSION["rol_id"] || Rol::ROL_CONTROL_ESCOLAR_SICYT == $_SESSION["rol_id"] || Rol::ROL_REPRESENTANTE_LEGAL == $_SESSION["rol_id"] || Rol::ROL_CONTROL_ESCOLAR_IES == $_SESSION["rol_id"]) : ?>
          <div class="row">
            <div class="col-sm-10"></div>
            <div class="col-sm-2">
              <div class="btn-group" role="group">
                <a href="" class="btn btn-primary dropdown-toggle pull-right" data-toggle="dropdown" role="button" aria-expanded="false">Descargar <span class="caret"></span></a>
                <ul class="dropdown-menu" role="menu">
                  <li><a href="<?php echo './formatos/fkardex.php?programa_id=' . $resultadoPrograma["data"]["id"] . '&alumno_id=' . $resultadoAlumno["data"]["id"]; ?>" target="_blank"> .PDF</a></li>
                </ul>
              </div>
            </div>
          </div>
        <?php endif; ?>
        <div class="row" style="padding-top: 20px;">
          <div class="col-sm-12">
          </div>
        </div>
        <div class="row">
          <!-- Tabla de mis Solicitudes -->
          <div class="col-sm-12 col-md-12">
            <table id="calificacionesKardex" class="table table-striped table-bordered" cellspacing="0" width="100%">
              <thead>
                <tr>
                  <th width="10%">Ciclo</th>
                  <th width="10%">Clave</th>
                  <th width="10%">Seriaci&oacute;n</th>
                  <th width="35%">Asignatura</th>
                  <th width="10%">Tipo</th>
                  <th width="10%">Calificaci&oacute;n</th>
                  <th width="15%">Fecha de Examen</th>
                </tr>
              </thead>
            </table>
          </div>
        </div>
      </div>

    </section>
    <!-- alumno_id -->
    <input id="alumno_id" type="hidden" value="<?= $_GET["alumno_id"] ?>">
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
  <!-- SECCION PARA SCRIPTS -->
  <script src="../js/ce-kardex.js"></script>
</body>

</html>