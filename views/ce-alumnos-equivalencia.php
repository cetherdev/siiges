<?php
// Válida los permisos del usuario de la sesión
require_once "../utilities/utileria-general.php";
Utileria::validarSesion(basename(__FILE__));

//====================================================================================================

require_once "../models/modelo-programa.php";
require_once "../models/modelo-alumno.php";
require_once "../models/modelo-persona.php";
require_once "../models/modelo-situacion.php";
require_once "../models/modelo-institucion.php";
require_once "../models/modelo-validacion.php";
require_once "../models/modelo-situacion-validacion.php";

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
  <?php
  $resultadoInstitucion = isset($resultadoInstitucion["data"][0]) ? $resultadoInstitucion["data"][0] : $resultadoInstitucion["data"];
  ?>

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
            <li><a href="ce-programas-plantel-equivalencia.php?institucion_id=<?php echo $resultadoInstitucion["id"] ?>&plantel_id=<?php echo $resultadoPlantel["data"]["id"] ?>">Programas de Estudios</a></li>
            <li class="active">Alumnos</li>
          </ol>
        </div>
      </div>

      <!-- CUERPO PRINCIPAL -->
      <div class="col-sm-12 col-md-12 col-lg-12">
        <!-- TÍTULO -->
        <h2 id="txtNombre">Alumnos Equivalentes</h2>
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
            <a href="ce-catalogo-alumno.php?programa_id=<?php echo $_GET["programa_id"]; ?>&proceso=alta&tramite=equiv" class="btn btn-primary pull-right"><i class="glyphicon glyphicon-plus"></i> Alta de Alumno</a>
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

                $alumno = new Alumno();
                $alumno->setAttributes($parametros);
                $resultadoAlumno = $alumno->consultarAlumnosTramite();

                $max = count($resultadoAlumno["data"]);

                for ($i = 0; $i < $max; $i++) {
                  $parametros2["id"] = $resultadoAlumno["data"][$i]["persona_id"];

                  $persona = new Persona();
                  $persona->setAttributes($parametros2);
                  $resultadoPersona = $persona->consultarId();

                  $parametros3["id"] = $resultadoAlumno["data"][$i]["situacion_id"];

                  $situacion = new Situacion();
                  $situacion->setAttributes($parametros3);
                  $resultadoSituacion = $situacion->consultarId();

                  $validacion = new Validacion();
                  $resultadoValidacion = $validacion->consultarPor("validaciones", array("alumno_id" => $resultadoAlumno["data"][$i]["id"], "deleted_at"), "*");
                  
                  isset($resultadoValidacion["data"][0]) ? $parametros4["id"] = $resultadoValidacion["data"][0]["situacion_validacion_id"] : $parametros4["id"] = "";
                  $situacionValidacion = new SituacionValidacion();
                  $situacionValidacion->setAttributes($parametros4);
                  $resultadoSituacionValidacion = $situacionValidacion->consultarId();
                ?>
                  <tr>
                    <td><?php echo $resultadoAlumno["data"][$i]["id"]; ?></td>
                    <td><?php echo $resultadoAlumno["data"][$i]["matricula"]; ?></td>
                    <td><?php echo $resultadoPersona["data"]["apellido_paterno"]; ?></td>
                    <td><?php echo $resultadoPersona["data"]["apellido_materno"]; ?></td>
                    <td><?php echo $resultadoPersona["data"]["nombre"]; ?></td>
                    <!-- Situacion general -->
                    <td>
                      <?php
                      echo $resultadoSituacion["data"]["nombre"];

                      if (Rol::ROL_CONTROL_ESCOLAR_IES == $_SESSION["rol_id"] || (Rol::ROL_REPRESENTANTE_LEGAL == $_SESSION["rol_id"])) :
                        echo "<br>";
                        echo isset($resultadoSituacionValidacion["data"]["nombre"]) ? $resultadoSituacionValidacion["data"]["nombre"] : "Sin validar";
                      endif;
                      ?>
                    </td>
                    <td>
                      <a href="ce-catalogo-alumno.php?programa_id=<?php echo $_GET["programa_id"]; ?>&alumno_id=<?php echo $resultadoAlumno["data"][$i]["id"]; ?>&proceso=consulta&tramite=equiv"><span id="" title="Abrir" class="glyphicon glyphicon-eye-open col-sm-1 size_icon"></span></a>
                      <a href="ce-catalogo-alumno.php?programa_id=<?php echo $_GET["programa_id"]; ?>&alumno_id=<?php echo $resultadoAlumno["data"][$i]["id"]; ?>&proceso=edicion&tramite=equiv"><span id="" title="Editar" class="glyphicon glyphicon-edit col-sm-1 size_icon"></span></a>
                      <a href="ce-catalogo-alumno.php?programa_id=<?php echo $_GET["programa_id"]; ?>&alumno_id=<?php echo $resultadoAlumno["data"][$i]["id"]; ?>&proceso=edicion&tramite=equiv"><span id="" title="Eliminar" class="glyphicon glyphicon-trash col-sm-1 size_icon"></span></a>
                    </td>
                    <td>
                      <a href="ce-equivalencia-expediente.php?programa_id=<?php echo $_GET["programa_id"]; ?>&alumno_id=<?php echo $resultadoAlumno["data"][$i]["id"]; ?>&proceso=edicion">Expediente</span></a>
                      <?php if (Rol::ROL_CONTROL_ESCOLAR_IES == $_SESSION["rol_id"] || (Rol::ROL_REPRESENTANTE_LEGAL == $_SESSION["rol_id"])) : ?>
                        <br />
                        <a href="ce-validacion-alumno.php?programa_id=<?php echo $resultadoPrograma["data"]["id"]; ?>&alumno_id=<?php echo  $resultadoAlumno["data"][$i]["id"]; ?>&proceso=edicion&tramite=equiv">Validaci&oacute;n</a>
                      <?php endif; ?>
                      <br />
                      <a href="ce-kardex.php?programa_id=<?php echo $_GET["programa_id"]; ?>&alumno_id=<?php echo $resultadoAlumno["data"][$i]["id"]; ?>">Historial Académico</a>
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
</body>

</html>