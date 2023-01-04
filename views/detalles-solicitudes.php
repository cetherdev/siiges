<?php
// Válida los permisos del usuario de la sesión
require_once "../utilities/utileria-general.php";
require_once "../models/modelo-rol.php";
Utileria::validarSesion(basename(__FILE__));
//====================================================================================================
$resultado = "";
if (isset($_SESSION["resultado"])) {
  $resultado = json_decode($_SESSION["resultado"]);
  unset($_SESSION["resultado"]);
}
?>
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Detalles del proceso</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/css/bootstrap-select.min.css">

  <!-- CSS GOB.MX -->
  <link href="../favicon.ico" rel="shortcut icon">
  <link href="https://framework-gb.cdn.gob.mx/assets/styles/main.css" rel="stylesheet">
  <link rel="stylesheet" type="text/css" href="../css/estilos.css">
</head>

<body class="">

  <!-- HEADER Y BARRA DE NAVEGACION -->
  <?php require_once "menu.php"; ?>

  <!-- CUERPO DEL FORMULARIO -->
  <div class="container">
    <section class="main row margin-section-formularios">
      <div class="col-sm-12 col-md-12">
        <!-- BARRA DE USUARIO -->
        <ol class="breadcrumb pull-right">
          <li><i class="icon icon-user"></i></li>
          <li><?php echo $_SESSION["nombre_rol"]; ?></li>
          <li class="active"><?php echo $_SESSION["nombre"] . " " . $_SESSION["apellido_paterno"] . " " . $_SESSION["apellido_materno"]; ?></li>
        </ol>
        <ol class="breadcrumb">
          <li><a href="home.php"><i class="icon icon-home"></i></a></li>
          <li><a href="home.php">SIIGES</a></li>
          <?php if ($_SESSION["rol_id"] == 3 || $_SESSION["rol_id"] == 4) { ?>
            <li><a href="mis-solicitudes.php">Solicitudes</a></li>
          <?php } else { ?>
            <li><a href="solicitudes.php">Solicitudes</a></li>
          <?php } ?>
          <li class="active">Detalles del proceso</li>
        </ol>

        <h2>Detalles de la solicitud</h2>
        <hr class="red">
        <div id="cargando" class="loader">

        </div>
        <div id="mensaje"></div>
        <!-- INICIA FORMULARIO -->
        <form class="form-horizontal" action="" enctype="multipart/form-data" method="post">
          <!-- Tipo de trámite -->
          <div id="tipo-tramite" class="form-group">
            <div class="col-sm-12 col-md-3">
              <label class="control-label" for="">Tipo de trámite</label><br>
              <select id="tipo_solicitud" class="form-control" readonly>
                <option value="">Seleccione una opción</option>
              </select>
            </div>
            <input type="hidden" id="tipo_control">
            <div class="col-sm-12 col-md-3">
              <label class="control-label">Fecha de recepción</label>
              <input type="text" id="fecha_recepcion_documentacion" class="form-control" value="" readonly>
            </div>
            <div class="col-sm-12 col-md-3">
              <label class="control-label">Folio de captura</label>
              <input type="text" id="folio" name="" class="form-control" value="" readonly>
            </div>
            <div class="col-sm-12 col-md-3">
              <label class="control-label">RVOE</label>
              <input type="text" id="rvoe" name="" class="form-control" value="" readonly>
            </div>
          </div>
          <!-- Programa de estudios -->
          <div id="programa-estudios" class="form-group">
            <div class="col-sm-12 col-md-4">
              <label class="control-label" for="">Nivel</label><br>
              <select class="form-control" id="nivel_id" name="PROGRAMA-nivel_id" readonly>
                <option value="">Seleccione una opción</option>
              </select><br>
            </div>
            <div class="col-sm-12 col-md-8">
              <label class="control-label" for="">Nombre</label><br>
              <input type="text" id="nombre_programa" name="PROGRAMA-nombre" class="form-control" placeholder="Nombre del programa de estudios" readonly><br>
            </div>
            <div class="col-sm-12 col-md-4">
              <label class="control-label" for="">Modalidad</label><br>
              <select class="form-control" id="modalidad_id" name='PROGRAMA-modalidad_id' readonly>
                <option value="">Seleccione una opción</option>
              </select><br>
            </div>
            <div class="col-sm-12 col-md-4">
              <label class="control-label" for="">Periodo</label><br>
              <select class="form-control" id="ciclo_id" name="PROGRAMA-ciclo_id" readonly>
                <option value="">Seleccione una opción</option>
                <option value="1">Semestral</option>
                <option value="2">Cuatrimestral</option>
                <option value="4">Semestral curriculum flexible</option>
                <option value="5">Cuatrimestral curriculum flexible</option>
              </select><br>
            </div>
            <div class="col-sm-12 col-md-4">
              <label class="control-label" for="">Turno</label><br>
              <select class="form-control selectpicker" id="turno_programa" name="PROGRAMA-turnos[]" multiple title="Seleccione una opción" disabled>
              </select><br>
            </div>
          </div>
          <!-- Dirección del plantel -->
          <div id="direccion-plantel" class="form-group">
            <div class="col-sm-12 col-md-4">
              <label class="control-label" for="">Clave de centro de trabajo</label><br>
              <input type="text" id="cct" name="" class="form-control" value="" placeholder="Clave de centro de trabajo" readonly>
            </div>
            <div class="col-sm-12 col-md-6">
              <label class="control-label" for="">Calle</label><br>
              <input type="text" id="calle" name="" class="form-control" value="" placeholder="Nombre de la calle" readonly>
            </div>
            <div class="col-sm-12 col-md-2">
              <label class="control-label" for="">Número</label><br>
              <input type="text" id="numero" name="" class="form-control" value="" placeholder="Número exterior" readonly>
            </div>
            <div class="col-sm-12 col-md-2">
              <label class="control-label" for="">Interior</label><br>
              <input type="text" id="interior" name="" class="form-control" value="" placeholder="Número interior" readonly>
            </div>
            <div class="col-sm-12 col-md-4">
              <label class="control-label" for="">Colonia</label><br>
              <input type="text" id="colonia" name="" class="form-control" value="" placeholder="Colonia" readonly>
            </div>
            <div class="col-sm-12 col-md-2">
              <label class="control-label" for="">CP</label><br>
              <input type="text" id="cp" name="" class="form-control" value="" placeholder="Código postal" readonly>
            </div>
            <div class="col-sm-12 col-md-4">
              <label class="control-label" for="">Municipio</label><br>
              <input type="text" id="municipio" name="" class="form-control" value="" placeholder="Municipio" readonly><br>
            </div>
          </div>
          <!-- Institución -->
          <div id="institucion" class="form-group">
            <div class="col-sm-12 col-md-6">
              <label class="control-label" for="">Institución</label><br>
              <input type="text" id="institucion_nombre" name="" class="form-control" value="" placeholder="Nombre completo de la Institución" readonly>
            </div>
            <div class="col-sm-12 col-md-3">
              <label class="control-label" for="">Fecha en que se dió de alta</label><br>
              <input type="text" id="alta_institucion" name="" class="form-control" value="" readonly>
            </div>
            <div class="col-sm-12 col-md-6">
              <label class="control-label" for="">Representante Legal</label><br>
              <input type="text" id="nombre_representante" name="" class="form-control" value="" placeholder="Nombre del Representante Legal" readonly>
            </div>
            <div class="col-sm-12 col-md-3">
              <label for="" class="control-label">Email</label>
              <input type="text" class="form-control" id="email_representante" value="email@example.com" readonly>
            </div>
            <div class="col-sm-12 col-md-3">
              <label for="" class="control-label">Celular</label>
              <input type="text" class="form-control" id="celular_representante" value="33-82-24-89-60" readonly>
            </div>
          </div>
          <!-- Progeso -->
          <div id="progreso" class="form-group">
            <div class="col-sm-12 col-md-12">
              <h4>Progreso de la solicitud</h4>
              <div class="progress">
                <div id="barra-porcentaje" class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100">
                  <span id="porcentaje-progreso"></span>
                </div>
              </div>
            </div>
            <div class="col-sm-12 col-md-12">
              <h4>Observaciones del proceso</h4>
              <textarea id="observaciones" class="form-control" name="name" rows="8" cols="80" readonly></textarea>
            </div>
            <!-- <div class="col-sm-12 col-md-5">
                                <label class="control-label" for="">Fecha limite para atender observaciones</label><br>
                                <input type="text" id="" name="" class="form-control" value="" placeholder="Fecha" readonly>
                            </div> -->
          </div>
        </form>
        <form class="form-horizontal" action="../controllers/contoller.programa" method="post">
          <input type="hidden" id="opcion" value="2">
          <input type="hidden" id="id_solicitud" value="<?= $_GET['solicitud'] ?>">
        </form>
      </div>
    </section>

    <div class="container">
      <section class="main row margin-section-formularios">
        <div class="col-sm-12 col-md-12 col-lg-12">

          <h2>Descarga de documentos</h2>
          <hr class="red">

          <div class="form-group col-sm-6 col-md-4">
            <h4>Formatos Administrativos</h4>
            <a target="_blank" href=<?= "formatos/fda01.php?id=" . $_GET["solicitud"] ?>>FDA 01</a><br>
            <a target="_blank" id="fda02"></a><br>
            <a target="_blank" href=<?= "formatos/fda03.php?id=" . $_GET["solicitud"] ?> id="fda03">FDA 03</a><br>
            <a target="_blank" id="fda04"></a><br>
            <a target="_blank" id="fda05"></a><br>
            <a target="_blank" href=<?= "formatos/fda06.php?id=" . $_GET["solicitud"] ?> id="fda06">FDA 06</a><br>
          </div>

          <div class="form-group col-sm-6 col-md-4">
            <h4>Formatos Pedagógicos</h4>
            <a target="_blank" href=<?= "formatos/fdp01.php?id=" . $_GET["solicitud"] ?>>FDP 01</a><br>
            <a target="_blank" id="fdp02"></a><br>
            <a target="_blank" id="fdp03">FDP 03</a><br>
            <a target="_blank" id="fdp04">FDP 04</a><br>
            <a target="_blank" href=<?= "formatos/fdp05.php?id=" . $_GET["solicitud"] ?>>FDP 05</a><br>
            <a target="_blank" href=<?= "formatos/fdp06.php?id=" . $_GET["solicitud"] ?>>FDP 06</a><br>
          </div>
          <?php if (Rol::ROL_REPRESENTANTE_LEGAL == $_SESSION["rol_id"] || Rol::ROL_GESTOR == $_SESSION["rol_id"]) : ?>
            <div class="form-group col-sm-6 col-md-4">
              <h4>Documentos</h4>
              <a target="_blank" href=<?= "oficios/orden-inspeccion.php?id=" . $_GET["solicitud"] ?> id="OrdenInspección" name="<?= $_GET["solicitud"] ?>">Orden de Inspección</a><br>
              <!-- <a target="_blank" href="oficios/orden-inspeccion.php" id="OrdenInspección" name="<?= $_GET["solicitud"] ?>" class="get">Orden de Inspección</a><br> -->
              <!-- <a target="_blank" href="oficios/observaciones.php" id="Observaciones" name="<?= $_GET["solicitud"] ?>" class="get">Observaciones</a><br> -->
            </div>
          <?php endif; ?>

          <?php if (Rol::ROL_ADMIN == $_SESSION["rol_id"] || Rol::ROL_SICYT_EDITAR == $_SESSION["rol_id"]) : ?>
            <div class="form-group col-sm-6 col-md-4" id="rvoe">
              <h4>RVOE</h4>
              <a target="_blank" href="oficios/acuerdo-cambio-domicilio.php" id="AcuerdoCambioDomicilio" name="<?= $_GET["solicitud"] ?>" class="get" hidden>Acuerdo de Cambio de Domicilio</a><br>

              <a target="_blank" href="oficios/acuerdo-cambio-representante-legal.php" id="AcuerdoCambioRepresentanteLegal" name="<?= $_GET["solicitud"] ?>" class="post" hidden>Acuerdo de Cambio de Representante Legal</a><br>

              <a target="_blank" href="oficios/refrendo-rvoe.php" id="RefrendoRVOE" name="<?= $_GET["solicitud"] ?>" class="get" hidden>Refrendo de RVOE</a><br>

              <a target="_blank" href="oficios/acuerdo-rvoe.php" id="AcuerdoRVOE" name="<?= $_GET["solicitud"] ?>" class="get" hidden>Acuerdo de RVOE</a><br><br><br>

            </div>

            <div class="form-group col-sm-6 col-md-4">
              <h4>Evaluación</h4>
              <a target="_blank" href=<?= "dictamenes/carta-aceptacion.php?id=" . $_GET["solicitud"] ?> id="CartaAceptacion">Carta de Aceptación</a><br>
              <a target="_blank" href=<?= "dictamenes/carta-asignacion-evaluador.php?id=" . $_GET["solicitud"] ?> id="CartaAsignacion">Carta de Asignación de Evaluador</a><br>
              <a target="_blank" href=<?= "dictamenes/carta-imp-con.php?id=" . $_GET["solicitud"] ?> id="CartaImpCon">Carta de Imparcialidad y Confidencialidad</a><br>
            </div>

            <div class="form-group col-sm-6 col-md-4">
              <h4>Inspección</h4>
              <a target="_blank" href=<?= "oficios/orden-inspeccion.php?id=" . $_GET["solicitud"] ?> id="OrdenInspección" name="<?= $_GET["solicitud"] ?>">Orden de Inspección</a><br>
              <a target="_blank" href="oficios/acta-inspeccion.php" id="ActaDeInspeccion" name="<?= $_GET["solicitud"] ?>" class="post">Acta de Inspección</a><br>
              <a target="_blank" href="oficios/acta-cierre.php" id="ActaDeCierre" name="<?= $_GET["solicitud"] ?>" class="post">Acta de Cierre</a><br>
            </div>

            <div class="form-group col-sm-6 col-md-4">
              <h4>Otros</h4>
              <a target="_blank" href=<?= "oficios/admisorio.php?id=" . $_GET["solicitud"] ?> id="Admisorio" name="<?= $_GET["solicitud"] ?>" class="post">Oficio Admisorio</a><br>
              <a target="_blank" href="oficios/desistimiento.php" id="Desistimiento" name="<?= $_GET["solicitud"] ?>" class="post">Desistimiento</a><br>

            </div>
          <?php endif; ?>
        </div>
      </section>
    </div>
  </div>

  <!-- Modal Oficio-->
  <div id="modalOficio" class="modal fade">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
          <h4 class="modal-title">Oficio</h4>
        </div>
        <div class="modal-body">
          <p>Ingrese el número de oficio para generar este documento</p>
          <label for="" class="control-label">Número de oficio</label>
          <input type="text" class="form-control" id="modal-numero-oficio" required>
          <label for="" class="control-label">Fecha en que surte efecto</label>
          <input type="date" class="form-control" id="modal-fecha_surte_efecto" required>

        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
          <button id="modal-aceptar" type="button" class="btn btn-danger" data-dismiss="modal">Aceptar</button>
        </div>
      </div>
    </div>
    <input type="hidden" id="modal-solicitud-id">
    <input type="hidden" id="modal-enlace">
  </div>

  <!-- Modal Acta de Cierre-->
  <div id="modalActaDeCierre" class="modal fade">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
          <h4 class="modal-title">Acta de Cierre</h4>
        </div>
        <form class="form-horizontal" id="form-acta-cierre" action="oficios/acta-cierre.php" enctype="multipart/form-data" method="post" target="_blank">
          <div class="modal-body">
            <p>Ingrese Observaciones para generar este documento</p>
            <label for="" class="control-label">Observaciones</label>
            <textarea class="form-control" id="modal-acta-cierre-observaciones" name="observaciones" required maxlength="255"></textarea>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
            <button id="modal-acta-cierre-aceptar" type="button" class="btn btn-danger" data-dismiss="modal">Aceptar</button>
          </div>
          <input type="hidden" id="modal-acta-cierre-solicitud-id" name="id">
        </form>
      </div>
    </div>
  </div>

  <!-- Modal Acta de Inspeccion-->
  <div id="modalActaDeInspeccion" class="modal fade">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
          <h4 class="modal-title">Acta de Inspección</h4>
        </div>
        <form class="form-horizontal" id="form-acta-inspeccion" action="oficios/acta-inspeccion.php" enctype="multipart/form-data" method="post" target="_blank">
          <div class="modal-body">
            <p>Ingrese la información requerida para generar este documento</p>
            <p>Se le otorga la palabra al 'PARTICULAR'</p>
            <label for="" class="control-label">Respuesta del particular</label>
            <textarea class="form-control" name="respuesta_particular" required maxlength="255"></textarea>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
            <button id="modal-acta-inspeccion-aceptar" type="button" class="btn btn-danger" data-dismiss="modal">Aceptar</button>
          </div>
          <input type="hidden" id="modal-acta-inspeccion-solicitud-id" name="id">
        </form>
      </div>
    </div>
  </div>

  <!-- Modal Desistimiento-->
  <div id="modalDesistimiento" class="modal fade">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
          <h4 class="modal-title">Desistimiento</h4>
        </div>
        <form class="form-horizontal" id="form-desistimiento" action="oficios/desistimiento.php" enctype="multipart/form-data" method="post" target="_blank">
          <div class="modal-body">
            <p>Ingrese el número de oficio para generar este documento</p>
            <label for="" class="control-label">Número de oficio</label>
            <input type="text" class="form-control" id="modal-desistimiento-oficio" name="oficio" required>
            <label for="" class="control-label">Consideraciones</label>
            <textarea class="form-control" name="consideraciones" required maxlength="255"></textarea>
            <label for="" class="control-label">Resolución</label>
            <textarea class="form-control" name="resolucion" required maxlength="255"></textarea>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
            <button id="modal-desistimiento-aceptar" type="button" class="btn btn-danger" data-dismiss="modal">Aceptar</button>
          </div>
          <input type="hidden" id="modal-desistimiento-solicitud-id" name="id">
        </form>
      </div>
    </div>
  </div>

  <!-- Modal Acuerdo cambio de representante legal-->
  <div id="modalAcuerdoCambioRepresentante" class="modal fade">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
          <h4 class="modal-title">Acuero de Cambio de Representante Legal</h4>
        </div>
        <form class="form-horizontal" id="form-acuerdo-cambio-representante" action="oficios/acuerdo-cambio-representante-legal.php" enctype="multipart/form-data" method="post" target="_blank">
          <div class="modal-body">
            <p>Ingrese el número de oficio para generar este documento</p>
            <label for="" class="control-label">Número de oficio</label>
            <input type="text" class="form-control" id="modal-acuerdo-cambio-representante-oficio" name="oficio" required>
            <label for="" class="control-label">Acuerdo RVOE Anterior</label>
            <input type="text" class="form-control" name="acuerdo_rvoe_anterior" required>
            <label for="" class="control-label">Fecha del acuerdo de RVOE Anterior</label>
            <input type="date" class="form-control" name="fecha_anterior" required>
            <label for="" class="control-label">Nombre completo del representante legal anterior</label>
            <input type="text" class="form-control" name="representante_anterior" required>
            <label for="" class="control-label">Acta Notariada</label>
            <textarea class="form-control" name="acta_notariada" required maxlength="255"></textarea>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
            <button id="modal-acuerdo-cambio-representante-aceptar" type="button" class="btn btn-danger" data-dismiss="modal">Aceptar</button>
          </div>
          <input type="hidden" id="modal-acuerdo-cambio-representante-solicitud-id" name="id">
        </form>
      </div>
    </div>
  </div>

  <!-- JS GOB.MX -->
  <script src="https://framework-gb.cdn.gob.mx/gobmx.js"></script>
  <!-- JS JQUERY -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/js/bootstrap-select.min.js"></script>
  <!-- SECCION PARA SCRIPTS -->
  <script src="../js/solicitudes-admin.js"></script>
  <script src="../js/documentos.js"></script>

</body>

</html>
