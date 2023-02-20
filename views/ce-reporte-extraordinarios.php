<?php
// Válida los permisos del usuario de la sesión
require_once "../utilities/utileria-general.php";
Utileria::validarSesion(basename(__FILE__));

//====================================================================================================

require_once "../models/modelo-programa.php";
require_once "../models/modelo-situacion.php";
require_once "../models/modelo-persona.php";
require_once "../models/modelo-calificacion.php";
require_once "../models/modelo-grupo.php";
require_once "../models/modelo-ciclo-escolar.php";
require_once "../models/modelo-asignatura.php";

$programa = new Programa();
$programa->setAttributes(array("id" => $_GET["programa_id"]));
$resultadoPrograma = $programa->consultarId();

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
              <li><a href="ce-alumnos-equivalencia.php?programa_id=<?php echo $_GET["programa_id"]; ?>">Alumnos</a></li>
              <li><a href="ce-alumnos.php?programa_id=<?php echo $_GET["programa_id"]; ?>">Alumnos</a></li>
            <li class="active">Reporte extraordinarios</li>
          </ol>
        </div>
      </div>

      <!-- CUERPO PRINCIPAL -->
      <div class="col-sm-12 col-md-12 col-lg-12">
        <!-- TÍTULO -->
        <h2 id="txtNombre">Reporte extraordinarios</h2>
        <hr class="red">
        <div class="row">
          <div class="col-sm-12">
            <legend><?php echo $resultadoPrograma["data"]["nombre"]; ?></legend>
          </div>
        </div>
        <!-- CONTENIDO -->
        <div class="row">
          <div class="col-sm-12 col-md-12">
            <table id="tabla-reporte1" class="table table-striped table-bordered" cellspacing="0" width="100%">
              <thead>
                <tr>
                  <th width="25%">Matr&iacute;cula</th>
                  <th width="25%">Situaci&oacute;n</th>
                  <th width="50%">Cr&eacute;ditos obtenidos</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td></td>
                  <td></td>
                  <td id="creditos_obtenidos"></td>
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
            <legend>ALUMNOS</legend>
          </div>
        </div>
        <div class="row" style="padding-top: 20px;">
          <div class="col-sm-12">
          </div>
        </div>
        <div class="row">
          <!-- Tabla de mis Solicitudes -->
          <div class="col-sm-12 col-md-12">
            <table id="extraordinarios" class="table table-striped table-bordered" cellspacing="0" width="100%">
              <thead>
                <tr>
                  <th width="10%">Matr&iacute;cula</th>
                  <th width="20%">Apellido Paterno</th>
                  <th width="20%">Apellido Materno</th>
                  <th width="20%">Nombre</th>
                  <th width="20%">Grado</th>
                  <th width="10%">Clave Asignatura</th>
                </tr>
              </thead>
            </table>
          </div>
        </div>
      </div>

    </section>
    <!-- inputs hidden -->
    <input id="programa_id" type="hidden" value="<?= $_GET["programa_id"] ?>">
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
  <script src="../js/ce-reporte-extraordinarios.js"></script>
</body>

</html>