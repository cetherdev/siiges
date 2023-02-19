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
                <ol class="breadcrumb">
                    <li><a href="home.php"><i class="icon icon-home"></i></a></li>
                    <li><a href="home.php">SIIGES</a></li>
                    <?php if ($_SESSION["rol_id"] == 3 || $_SESSION["rol_id"] == 4) { ?>
                        <li><a href="mis-solicitudes.php">Solicitudes</a></li>
                    <?php } else { ?>
                        <li><a href="solicitudes.php">Solicitudes</a></li>
                    <?php } ?>
                    <li class="active">Revisión de documentos</li>
                </ol>

                <h2>Información de la solicitud</h2>
                <hr class="red">
                <div id="cargando" class="loader">

                </div>
                <div id="mensaje"></div>
                
                <!-- INICIA FORMULARIO -->
                <form class="form-horizontal" id="form-cotejamiento" action="../controllers/control-solicitud.php" enctype="multipart/form-data" method="post">
                    
                    <!-- Tipo de trámite -->
                    <div id="tipo-tramite" class="form-group">
                        <div class="col-sm-12 col-md-3">
                            <label class="control-label" for="">Tipo de trámite</label><br>
                            <select id="tipo_solicitud" class="form-control" readonly>
                                <option value="">Seleccione una opción</option>
                            </select>
                        </div>
                        <div class="col-sm-12 col-md-3">
                            <label class="control-label">Fecha de recepción</label>
                            <input type="text" id="fecha_recepcion_documentacion" class="form-control" value="" readonly>
                        </div>
                        <div class="col-sm-12 col-md-3">
                            <label class="control-label">Folio</label>
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
                                <option value="4">Semestral curriculum felxible</option>
                                <option value="5">Cuatrimestral curriculum felxible</option>
                            </select><br>
                        </div>
                        <div class="col-sm-12 col-md-4">
                            <label class="control-label" for="">Turno</label><br>
                            <select class="form-control selectpicker" id="turno_programa" name="PROGRAMA-turnos[]" multiple title="Seleccione una opción" disabled>
                            </select><br>
                        </div>
                    </div>
                    }
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
                    
                    <!-- Documentos -->
                    <br>
                    <h2>Recepción de formatos Administrativos</h2>
                    <hr class="red">
                    <div class="form-group col-sm-12 col-md-12">

                        <div class="col-sm-6 col-md-6">
                            <input id="fda01Checkbox" type="checkbox" style=" transform: scale(2.0)"> &nbsp; <a target="_blank" href=<?= "formatos/fda01.php?id=" . $_GET["solicitud"] ?>>FDA 01</a><br>
                            <br>
                        </div>
                        <div class="col-sm-6 col-md-6">
                            <input id="fda02Checkbox" type="checkbox" style=" transform: scale(2.0)"> &nbsp; <a target="_blank" id="fda02"></a><br>
                            <br>
                        </div>
                        <div class="col-sm-6 col-md-6">
                            <input id="fda03Checkbox" type="checkbox" style=" transform: scale(2.0)"> &nbsp; <a target="_blank" href=<?= "formatos/fda03.php?id=" . $_GET["solicitud"] ?> id="fda03l">FDA 03</a><br>
                            <br>
                        </div>
                        <div class="col-sm-6 col-md-6">
                            <input id="fda04Checkbox" type="checkbox" style=" transform: scale(2.0)"> &nbsp; <a target="_blank" id="fda04"></a><br>
                            <br>
                        </div>
                        <div class="col-sm-6 col-md-6">
                            <input id="fda05Checkbox" type="checkbox" style=" transform: scale(2.0)"> &nbsp; <a target="_blank" id="fda05">FDA 05</a><br>
                            <br>
                        </div>
                        <div class="col-sm-6 col-md-6">
                            <input id="fda06Checkbox" type="checkbox" style=" transform: scale(2.0)"> &nbsp; <a target="_blank" id="fda06"></a><br>
                            <br>
                        </div>
                        <div class="col-sm-12 col-md-12">
                            <label>Comentarios</label>
                            <textarea class="form-control" name="comentarios" rows="8" cols="80"></textarea>
                            <br><br>
                        </div>
                        <div class="col-sm-12 col-md-12">
                            <button type="button" class="btn btn-primary pull-left" onclick="Solicitudes.revisarDocumentacion()">Documentación completa</button>
                        </div>
                    </div>
                    <input type="hidden" name="fecha_recepcion" id="fecha_recepcion">
                    <input type="hidden" id="opcion" value="2">
                    <input type="hidden" id="id_solicitud" name="id_solicitud" value="<?= $_GET['solicitud'] ?>">
                    <input type="hidden" name="webService" value="cotejamiento">
                </form>
            </div>

        </section>
        
        <!-- Modal para mensajes -->
        <div class="modal fade" id="modalMensaje" tabindex="-1" role="dialog" aria-hidden="true">
            <div id="tamanoModalMensaje" class="modal-dialog">
                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Mensajes</h4>
                    </div>
                    <div id="cuerpoModal" class="modal-body">
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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/js/bootstrap-select.min.js"></script>
    <!-- SECCION PARA SCRIPTS -->
    <script src="../js/solicitudes-admin.js"></script>
    <script src="../js/documentos.js"></script>

</body>

</html>
