<?php
// Válida los permisos del usuario de la sesión
require_once "../utilities/utileria-general.php";
Utileria::validarSesion(basename(__FILE__));
//====================================================================================================
if (isset($_GET['tps'])) {
  $_GET['tps'] = (int)$_GET['tps'];
  //echo $_GET['tps'];
}

if (!isset($_GET['tps']) || $_GET['tps'] == null || $_GET['tps'] > 6 || is_string($_GET['tps'])) {
  echo "entra";
  //header( "Location: home.php" );
  //exit( );
}
?>
<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Editar Solicitud</title>
  <!-- CSS GOB.MX -->
  <link href="../favicon.ico" rel="shortcut icon">
  <link href="https://framework-gb.cdn.gob.mx/assets/styles/main.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/css/bootstrap-select.min.css">

  <!-- CSS SIIGES -->
  <link rel="stylesheet" type="text/css" href="../css/estilos.css">
</head>

<body>
  <div id="cargando" class="loader"></div>
  <div id="cargandoOtro" class="loader"></div>
  <!-- HEADER Y BARRA DE NAVEGACION -->
  <?php require_once "menu.php"; ?>
  <!-- Contenedor -->
  <div class="container">
    <section class="main row margin-section-formularios">
      <div class="col-sm-12 col-md-12 col-lg-12">
        <!-- BARRA DE USUARIO -->
        <ol class="breadcrumb pull-right">
          <li><i class="icon icon-user"></i></li>
          <li><?php echo $_SESSION["nombre_rol"]; ?></li>
          <li class="active"><?php echo $_SESSION["nombre"] . " " . $_SESSION["apellido_paterno"] . " " . $_SESSION["apellido_materno"]; ?></li>
        </ol>
        <!-- Menu GOB  -->
        <ol class="breadcrumb">
          <li><a href="home.php"><i class="icon icon-home"></i></a></li>
          <li><a href="home.php">SIIGES</a></li>
          <li><a href="mis-solicitudes.php">Mis solicitudes</a></li>
          <li class="active">Solicitudes</li>
        </ol>
        <h1 id="tipo-solicitud-txt">Solicitudes</h1>
        <br>
        <div id="mensaje"></div>
        <ul class="nav nav-tabs col-sm-12 col-md-12">
          <li class="active"><a data-toggle="tab" href="#tab-01">Datos generales</a></li>
          <li><a data-toggle="tab" href="#tab-02">Programa de estudios</a></li>
          <li><a data-toggle="tab" href="#tab-03">Plantel</a></li>
          <li><a data-toggle="tab" href="#tab-04">Anexos</a></li>
          <li><a id="tab-evaluacion" data-toggle="tab" href="#tab-05">Evaluaci&oacute;n curricular</a></li>
        </ul>
        <!-- Mensajes generales para todo el formulario -->

        <form id="solicitudes" class="form-horizontal" action="../controllers/control-solicitud.php" enctype="multipart/form-data" method="post">
          <div class="tab-content col-sm-12">
            <!-- Institución -->
            <div class="tab-pane active" id="tab-01">
              <!-- Contenedor de acordion -->
              <div class="panel-group ficha-collapse" role="tablist" id="acordion">
                <!-- Datos institucionales -->
                <input type="hidden" id="id-institucion" name="INSTITUCION-id">
                <?php if ($_GET['tps'] == 1) { ?>
                  <div class="panel panel-default">
                    <div class="panel-heading">
                      <h4 class="panel-tittle">
                        <a data-parent="#acordion" data-toggle="collapse" href="#datos-institucion" aria-expanded="false" aria-controls="datos-institucion" class="collapsed">Institución</a>
                        <button type="button" class="collpase-button collapsed" data-parent="#acordion" data-toggle="collapse" href="#datos-institucion" aria-expanded="false"></button>
                      </h4>
                    </div>
                    <div id="datos-institucion" class="panel-collapse collapse">
                      <div class="panel-body">
                        <div class="form-group">
                          <div class="col-sm-col-md-12">
                            <h2>Datos de la institución</h2>
                            <hr class="red">
                            <div id="institucion-noautorizada" class="col-sm-12 col-md-12">
                              <input type="hidden" id="nombre-institucion" name="INSTITUCION-nombre" value="NO AUTORIZADO">
                            </div>
                          </div>
                          <div class="col-sm-12 col-md-12">
                            <label class="control-label" for="razon_social">Razón Social *</label><br>
                            <input type="text" class="form-control revision" campo="Razón social" id="razon_social" name="INSTITUCION-razon_social">
                          </div>
                          <div id="institucion-autorizada" class="col-sm-12 col-md-12" style="display:none">
                            <label class="control-label" for="nombre">Nombre de la institución</label><br>
                            <input type="text" id="autorizado" class="form-control" name="INSTITUCION-nombre">
                          </div>
                          <div class="col-sm-12 col-md-12">
                            <label class="control-label" for="historia">Historia </label><br>
                            <textarea class="form-control" id="historia" campo="Historia" ubicacion="Datos generales apartado Datos institución" name="INSTITUCION-historia" rows="8" placeholder="Por favor detalle la historia de la institución"></textarea>
                          </div>
                          <div class="col-sm-12 col-md-12">
                            <label class="control-label" for="vision">Visión </label><br>
                            <textarea class="form-control" id="vision" name="INSTITUCION-vision" rows="8" placeholder="Escriba la visión de la Institución"></textarea>
                          </div>
                          <div class="col-sm-12 col-md-12">
                            <label class="control-label" for="mision">Misión </label><br>
                            <textarea class="form-control" id="mision" name="INSTITUCION-mision" rows="8" placeholder="Escriba la misíon de la institución"></textarea>
                          </div>
                          <div class="col-sm-12 col-md-12">
                            <label class="control-label" for="valores_instiucionales">Valores Institucionales </label><br>
                            <textarea class="form-control" id="valores_institucionales" name="INSTITUCION-valores_institucionales" rows="8" placeholder="Enliste los valores con los que cuenta la institución"></textarea>
                          </div>
                          <div class="col-sm-12 col-md-12">
                            <label class="control-label" for="">Logotipo de la institución</label><br>
                            <input type="hidden" id="logotipo-id" name="INSTITUCION-logotipo-id" value="">
                            <input type="file" onchange="Solicitud.verificarArchivo(this)" name="INSTITUCION-logotipo" class="form-control" value="">
                            <br>
                          </div>
                          <div class="col-sm-12 col-md-12" id="contendorLogotipo" style="display: none">
                            <a id="enlace-logotipo" class="enlaces" href="" target="_blank">Ver Logotipo</a>
                            <br>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                <?php } ?>
                <!-- Representante legal -->
                <div class="panel panel-default">
                  <div class="panel-heading">
                    <h4 class="panel-tittle">
                      <a data-parent="#acordion" data-toggle="collapse" href="#representante-legal" aria-expanded="false" aria-controls="representante-legal" class="collapsed">Representante legal</a>
                      <button type="button" class="collpase-button collapsed" data-parent="#acordion" data-toggle="collapse" href="#representante-legal" aria-expanded="false"></button>
                    </h4>
                  </div>
                  <div id="representante-legal" class="panel-collapse collapse">
                    <div class="panel-body">
                      <div class="form-group">
                        <div class="col-sm-col-md-12">
                          <h2>Representante legal</h2>
                          <hr class="red">
                        </div>
                        <div class="col-sm-6 col-md-6">
                          <label class="control-label" for="">Nombre(s)</label><br>
                          <input type="hidden" id="id-representante" name="REPRESENTANTE-id" value="">
                          <input type="hidden" id="domicilio-id-representante" name="REPRESENTANTE-domicilio_id" value="">
                          <input type="text" id="nombre" name="REPRESENTANTE-nombre" class="form-control " campo="Nombre del representante" ubicacion="Datos generales - Representante legal" value="" placeholder="Nombre del representante legal">
                          <br>
                        </div>
                        <div class="col-sm-6 col-md-6">
                          <label class="control-label" for="">Apellido paterno</label><br>
                          <input type="text" id="apellido_paterno" name="REPRESENTANTE-apellido_paterno" class="form-control " campo="Apellido paterno del representante" ubicacion="Datos generales - Representante legal" value="" placeholder="Apellido paterno del representante legal">
                          <br>
                        </div>
                        <div class="col-sm-6 col-md-6">
                          <label class="control-label" for="">Apellido materno</label><br>
                          <input type="text" id="apellido_materno" name="REPRESENTANTE-apellido_materno" class="form-control" value="" placeholder="Apellido materno del representante legal">
                          <br>
                        </div>
                        <div class="col-sm-6 col-md-6">
                          <label class="control-label" for="">Nacionalidad</label><br>
                          <input type="text" id="nacionalidad_representante" name="REPRESENTANTE-nacionalidad" class="form-control " campo="Nacionaliad del representante" ubicacion="Datos generales - Representante legal" value="" placeholder="Nacionalidad del representante legal">
                          <br>
                        </div>
                        <div class="col-sm-6 col-md-6">
                          <label class="control-label" for="">Calle</label><br>
                          <input type="text" id="calle_representante" name="REPRESENTANTE-calle" class="form-control " campo="Domicilio del representante" ubicacion="Datos generales - Representante legal" value="" placeholder="Nombre de la calle, avenida">
                          <br>
                        </div>
                        <div class="col-sm-6 col-md-6">
                          <label class="control-label" for="">Número exterior</label><br>
                          <input type="text" id="numero_exterior_representante" name="REPRESENTANTE-numero_exterior" class="form-control " campo="Domicilio del representante" ubicacion="Datos generales - Representante legal" value="" placeholder="Número exterior">
                          <br>
                        </div>
                        <div class="col-sm-6 col-md-6">
                          <label class="control-label" for="">Número interior</label><br>
                          <input type="text" id="numero_interior_representante" name="REPRESENTANTE-numero_interior" class="form-control" value="" placeholder="Número interior en caso de tener">
                          <br>
                        </div>
                        <div class="col-sm-6 col-md-6">
                          <label class="control-label" for="">Colonia</label><br>
                          <input type="text" id="colonia_representante" name="REPRESENTANTE-colonia" class="form-control " campo="Domicilio del representante" ubicacion="Datos generales - Representante legal" value="" placeholder="Nombre de la colonia">
                          <br>
                        </div>
                        <div class="col-sm-6 col-md-6">
                          <label class="control-label" for="">CP</label><br>
                          <input type="text" id="codigo_representante" name="REPRESENTANTE-codigo_postal" class="form-control " campo="Domicilio del representante" ubicacion="Datos generales - Representante legal" value="" placeholder="Código postal">
                          <br>
                        </div>
                        <div class="col-sm-6 col-md-6">
                          <label class="control-label" for="">Municipio</label><br>
                          <div id="municipios">
                            <select class="form-control " campo="Domicilio del representante" ubicacion="Datos generales - Representante legal" id="municipio_representante" name="REPRESENTANTE-municipio">
                              <option value="">Seleccione municipio</option>
                            </select>
                            <br>
                          </div>
                          <br>
                        </div>
                        <div class="col-sm-12 col-md-6">
                          <label class="control-label" for="">Correo electrónico:</label><br>
                          <input type="email" id="correo_representante" name="REPRESENTANTE-correo" class="form-control  " campo="Domicilio del representante" ubicacion="Datos generales - Representante legal" value="" placeholder="correo@dominio.com">
                          <br>
                        </div>
                        <div class=" form-group col-sm-12 col-md-6">
                          <div class="col-md-12">
                            <label class="control-label" for="">Teléfono:</label><br>
                            <input type="tel" id="telefono_representante" name="REPRESENTANTE-telefono" class="form-control " campo="Telefono del representante" ubicacion="Datos generales - Representante legal" value="" placeholder="33-15-14-15-48">
                            <br>
                          </div>
                        </div>
                        <div class=" form-group col-sm-12 col-md-6">
                          <div class="col-md-12">
                            <label class="control-label" for="">Celular:</label><br>
                            <input type="tel" id="celular_representante" name="REPRESENTANTE-celular" class="form-control  " campo="Celular del representante" ubicacion="Datos generales - Representante legal" value="" placeholder="33-15-14-15-48">
                            <br>
                          </div>
                        </div>
                        <div class="col-sm-12 col-md-12">
                          <label class="control-label" for="">Firma</label><br>
                          <input type="hidden" id="firma-id" name="REPRESENTANTE-firma_representante-id" value="">
                          <input type="file" onchange="Solicitud.verificarArchivo(this)" name="REPRESENTANTE-firma_representante" class="form-control" value="">
                          <br>
                        </div>
                        <div class="col-sm-12 col-md-12" id="contenedorFirma" style="display: none">
                          <a id="enlace-firma" class="enlaces" href="" target="_blank">Ver firma</a>
                          <br>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <!-- Personas para diligencias -->
                <div class="panel panel-default">
                  <div class="panel-heading">
                    <h4 class="panel-tittle">
                      <a data-parent="#acordion" data-toggle="collapse" href="#personas-involucradas" aria-expanded="false" aria-controls="personas-involucradas" class="collapsed collapsed-tittle">Diligencias</a>
                      <button type="button" class="collpase-button collapsed" data-parent="#acordion" data-toggle="collapse" href="#personas-involucradas" aria-expanded="false"></button>
                    </h4>
                  </div>
                  <div id="personas-involucradas" class="panel-collapse collapse">
                    <div class="panel-body">
                      <div class="form-group">
                        <div class="col-sm-col-md-12">
                          <h2>Personal desigando para diligencias</h2>
                          <hr class="red">
                        </div>
                        <!-- Inputs que para POST -->
                        <div id="inputsSeguimiento"></div>
                        <!-- Mensajes -->
                        <div id="mensajesSeguimiento"></div>
                        <!-- Campos para insertar a tabla -->
                        <div class="form-group col-sm-12 col-md-12">
                          <div class="col-sm-12 col-md-6">
                            <label class="control-label" for="">Nombre(s) *</label><br>
                            <input type="text" id="nombrep" class="form-control" value="" placeholder="Nombre del personal para diligencias">
                          </div>
                          <div class="col-sm-12 col-md-6">
                            <label class="control-label" for="">Apellido paterno *</label><br>
                            <input type="text" id="apellidop" class="form-control" value="" placeholder="Apellido paterno del personal para diligencias">
                          </div>
                          <div class="col-sm-12 col-md-6">
                            <label class="control-label" for="">Apellido materno</label><br>
                            <input type="text" id="apellidom" class="form-control" value="" placeholder="Apellido materno del personal para diligencias">
                          </div>
                          <div class="col-sm-12 col-md-6">
                            <label class="control-label" for="">Cargo</label><br>
                            <input type="text" id="cargo" class="form-control" value="" placeholder="Cargo del personal para diligencias">
                          </div>
                          <div class="col-sm-12 col-md-3">
                            <label class="control-label" for="">Teléfono *</label><br>
                            <input type="tel" id="tel" class="form-control" value="" placeholder="Teléfono del personal para diligencias">
                          </div>
                          <div class="col-sm-12 col-md-3">
                            <label class="control-label" for="">Celular *</label>
                            <input type="tel" id="cel" class="form-control" value="" placeholder="Celular del personal para diligencias">
                          </div>
                          <div class="col-sm-12 col-md-6">
                            <label class="control-label" for="">Correo electrónico *</label><br>
                            <input type="email" id="email" class="form-control" value="" placeholder="Correo electrónico del personal para diligencias">
                          </div>
                          <div class="col-sm-12 col-md-6">
                            <label class="control-label" for="">Horario de trabajo *</label><br>
                            <input type="text" id="horario" class="form-control" value="" placeholder="Horario de trabajo del personal para diligencias"> <br>
                          </div>
                          <div class="col-sm-4 col-md-4">
                            <br>
                            <button class="btn btn-secundary" type="button" name="button" onclick="agregarPersonal()">Agregar personal</button><br><br>
                          </div>
                        </div>
                        <!-- Tabla -->
                        <div class="col-sm-12 col-md-12">
                          <div class="table-responsive">
                            <table class="table  table-bordered">
                              <thead>
                                <tr>
                                  <th class="size" scope="col">Nombre</th>
                                  <th class="size" scope="col">Cargo</th>
                                  <th class="size" scope="col">Teléfono</th>
                                  <th class="size" scope="col">Celular</th>
                                  <th class="size" scope="col">Correo electrónico</th>
                                  <th class="size" scope="col">Horario de trabajo</th>
                                  <th class="size" scope="col">Acción</th>

                                </tr>
                              </thead>
                              <tbody id="encomiendas">
                                <tr>
                                </tr>
                              </tbody>
                            </table>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <?php if ($_GET['tps'] == 1 || $_GET['tps'] == 2 || $_GET['tps'] == 3) { ?>

                  <!-- Rector -->
                  <div class="panel panel-default">
                    <div class="panel-heading">
                      <h4 class="panel-tittle">
                        <a data-parent="#acordion" data-toggle="collapse" href="#rector" aria-expanded="false" aria-controls="rector" class="collapsed">Rector </a>
                        <button type="button" class="collpase-button collapsed" data-parent="#acordion" data-toggle="collapse" href="#rector" aria-expanded="false"></button>
                      </h4>
                    </div>
                    <div id="rector" class="panel-collapse collapse">
                      <div class="panel-body">
                        <!-- Datos generales  -->
                        <div class="form-group">
                          <div class="col-sm-col-md-12">
                            <h2>Datos generales rector</h2>
                            <input type="hidden" id="id-rector" value="">
                            <hr class="red">
                          </div>
                          <div class="col-sm-6 col-md-6">
                            <label class="control-label" for="">Nombre(s)</label><br>
                            <input type="text" id="nombre_rector" name="RECTOR-nombre" class="form-control " campo="Nombre del rector" ubicacion="Datos generales apartado Rector" value="" placeholder="Nombre del rector">
                          </div>
                          <div class="col-sm-6 col-md-6">
                            <label class="control-label" for="">Apellido paterno</label><br>
                            <input type="text" id="apellido_paterno_rector" name="RECTOR-apellido_paterno" class="form-control " campo="Apellido paterno del rector" ubicacion="Datos generales apartado Rector" value="" placeholder="Apellido paterno del rector">
                          </div>
                          <div class="col-sm-6 col-md-6">
                            <label class="control-label" for="">Apellido materno</label><br>
                            <input type="text" id="apellido_materno_rector" name="RECTOR-apellido_materno" class="form-control" value="" placeholder="Apellido materno del rector">
                          </div>
                          <div class="col-sm-6 col-md-2">
                            <label class="control-label" for="">Nacionalidad</label><br>
                            <input type="text" id="nacionalidad_rector" name="RECTOR-nacionalidad" class="form-control " campo="Nacionalidad del rector" ubicacion="Datos generales apartado Rector" value="" placeholder="Mexicano">
                          </div>
                          <div class="col-sm-6 col-md-4">
                            <label class="control-label" for="">Clave CURP</label><br>
                            <input type="text" id="curp_rector" name="RECTOR-curp" class="form-control" value="" placeholder="CURP del rector">
                          </div>
                          <div class="col-sm-6 col-md-3">
                            <label class="control-label" for="">Género</label><br>
                            <select class="form-control " campo="Genero del rector" ubicacion="Datos generales apartado rector" id="sexo_rector" name="RECTOR-sexo">
                              <option value="">Seleccione una opción</option>
                              <option value="Masculino">Masculino</option>
                              <option value="Femenino">Femenino</option>
                            </select>
                            <br>
                          </div>
                          <div class="col-sm-6 col-md-3">
                            <label class="control-label" for="">Teléfono celular</label><br>
                            <input type="text" id="celular_rector" name="RECTOR-celular" class="form-control" campo="Celular del rector" ubicacion="Datos generales apartado Rector" value="" placeholder="(33) 00 00 00 00">
                          </div>
                          <div class="col-sm-6 col-md-3">
                            <label class="control-label" for="">Correo institucional</label><br>
                            <input type="text" id="correo_rector_institucional" name="RECTOR-correo" class="form-control" campo="Correo institucional del rector" ubicacion="Datos generales apartado Rector" value="" placeholder="correo@mail.com">
                          </div>
                          <div class="col-sm-6 col-md-3">
                            <label class="control-label" for="">Correo personal</label><br>
                            <input type="text" id="correo_rector_personal" name="RECTOR-correo_secundario" class="form-control" campo="Correo personal del rector" ubicacion="Datos generales apartado Rector" value="" placeholder="correo@mail.com">
                          </div>
                        </div>
                        <!-- Formación del rector -->
                        <div class="form-group">
                          <div class="col-sm-col-md-12">
                            <h2>Formación rector</h2>
                            <hr class="red">
                          </div>
                          <!-- Inputs para POST -->
                          <div id="inputsFormacionRector"></div>
                          <!-- Mensajes -->
                          <div id="mensajesFromacionRector"></div>
                          <!-- Campos para llenar la tabla  -->
                          <div class=" form-group col-sm-12 col-md-12">
                            <div class="col-sm-12 col-md-4">
                              <label>Nivel educativo *</label>
                              <select class="form-control" id="nivel_educativo_rector">
                                <option value="">Seleccione una opción</option>
                              </select>
                            </div>
                            <div class="col-sm-12 col-md-8">
                              <label>Nombre de los estudios *</label>
                              <input id="estudios_rector" class="form-control" type="text" placeholder="Nombre de los estudios"><br>
                            </div>
                            <div class="col-sm-12 col-md-8">
                              <label>Nombre de la institución *</label>
                              <input id="institucion_estudios_rector" class="form-control" type="text" placeholder="Nombre de la institución"><br>
                            </div>
                            <div class="col-sm-12 col-md-4">
                              <label>Documento *</label>
                              <select class="form-control" id="documento_acredita_rector">
                                <option value="">Seleccione una opción</option>
                                <option value="TÍtulo">TÍtulo</option>
                                <option value="Cedula">Cedula</option>
                                <option value="Constancia">Constancia</option>
                              </select>
                              <br>
                            </div>
                            <div class="col-sm-12 col-md-5">
                              <button class="btn btn-secundary" type="button" name="button" onclick="agregarFormacionRector()">Agregar formación</button>
                            </div>
                          </div>
                          <!-- Tabla que muestra los campos -->
                          <div class="col-sm-12 col-md-12">
                            <div class="table-responsive">
                              <table class="table  table-bordered">
                                <thead>
                                  <tr>
                                    <th class="size" scope="col">Nivel educativo</th>
                                    <th class="size" scope="col">Nombre de los estudios</th>
                                    <th class="size" scope="col">Nombre de la institución</th>
                                    <th class="size" scope="col">Documento que lo acredita</th>
                                    <th class="size" scope="col">Acción</th>
                                  </tr>
                                </thead>
                                <tbody id="formacion_rector">
                                  <tr>
                                  </tr>
                                </tbody>
                              </table><br><br>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>


                  <!-- Director -->
                  <div class="panel panel-default">
                    <div class="panel-heading">
                      <h4 class="panel-tittle">
                        <a data-parent="#acordion" data-toggle="collapse" href="#director" aria-expanded="false" aria-controls="director" class="collapsed">Director </a>
                        <button type="button" class="collpase-button collapsed" data-parent="#acordion" data-toggle="collapse" href="#director" aria-expanded="false"></button>
                      </h4>
                    </div>
                    <div id="director" class="panel-collapse collapse">
                      <div class="panel-body">
                        <!-- Datos generales  -->
                        <div class="form-group">
                          <div class="col-sm-col-md-12">
                            <h2>Datos generales director</h2>
                            <input type="hidden" id="id-director" value="">
                            <hr class="red">
                          </div>
                          <div class="col-sm-6 col-md-6">
                            <label class="control-label" for="">Nombre(s)</label><br>
                            <input type="text" id="nombre_director" name="DIRECTOR-nombre" class="form-control " campo="Nombre del director" ubicacion="Datos generales apartado Director" value="" placeholder="Nombre del director">
                          </div>
                          <div class="col-sm-6 col-md-6">
                            <label class="control-label" for="">Apellido paterno</label><br>
                            <input type="text" id="apellido_paterno_director" name="DIRECTOR-apellido_paterno" class="form-control " campo="Apellido paterno del director" ubicacion="Datos generales apartado Director" value="" placeholder="Apellido paterno del director">
                          </div>
                          <div class="col-sm-6 col-md-6">
                            <label class="control-label" for="">Apellido materno</label><br>
                            <input type="text" id="apellido_materno_director" name="DIRECTOR-apellido_materno" class="form-control" value="" placeholder="Apellido materno del director">
                          </div>
                          <div class="col-sm-6 col-md-2">
                            <label class="control-label" for="">Nacionalidad</label><br>
                            <input type="text" id="nacionalidad_director" name="DIRECTOR-nacionalidad" class="form-control " campo="Nacionalidad del director" ubicacion="Datos generales apartado Director" value="" placeholder="Mexicano">
                          </div>
                          <div class="col-sm-6 col-md-4">
                            <label class="control-label" for="">Clave CURP</label><br>
                            <input type="text" id="curp_director" name="DIRECTOR-curp" class="form-control" value="" placeholder="CURP del director">
                          </div>
                          <div class="col-sm-6 col-md-3">
                            <label class="control-label" for="">Género</label><br>
                            <select class="form-control " campo="Genero del director" ubicacion="Datos generales apartado Director" id="sexo_director" name="DIRECTOR-sexo">
                              <option value="">Seleccione una opción</option>
                              <option value="Masculino">Masculino</option>
                              <option value="Femenino">Femenino</option>
                            </select>
                            <br>
                          </div>
                          <div class="col-sm-6 col-md-3">
                            <label class="control-label" for="">Teléfono celular</label><br>
                            <input type="text" id="celular_director" name="DIRECTOR-celular" class="form-control" campo="Celular del director" ubicacion="Datos generales apartado Director" value="" placeholder="(33) 00 00 00 00">
                          </div>
                          <div class="col-sm-6 col-md-3">
                            <label class="control-label" for="">Correo institucional</label><br>
                            <input type="text" id="correo_director_institucional" name="DIRECTOR-correo" class="form-control" campo="Correo institucional del director" ubicacion="Datos generales apartado Director" value="" placeholder="correo@mail.com">
                          </div>
                          <div class="col-sm-6 col-md-3">
                            <label class="control-label" for="">Correo personal</label><br>
                            <input type="text" id="correo_director_personal" name="DIRECTOR-correo_secundario" class="form-control" campo="Correo personal del director" ubicacion="Datos generales apartado Director" value="" placeholder="correo@mail.com">
                          </div>
                        </div>
                        <!-- Formación del director -->
                        <div class="form-group">
                          <div class="col-sm-col-md-12">
                            <h2>Formación director</h2>
                            <hr class="red">
                          </div>
                          <!-- Inputs para POST -->
                          <div id="inputsFormacionDirector"></div>
                          <!-- Mensajes -->
                          <div id="mensajesFromacionDirector"></div>
                          <!-- Campos para llenar la tabla  -->
                          <div class=" form-group col-sm-12 col-md-12">
                            <div class="col-sm-12 col-md-4">
                              <label>Nivel educativo *</label>
                              <select class="form-control" id="nivel_educativo_director">
                                <option value="">Seleccione una opción</option>
                              </select>
                            </div>
                            <div class="col-sm-12 col-md-8">
                              <label>Nombre de los estudios *</label>
                              <input id="estudios_director" class="form-control" type="text" placeholder="Nombre de los estudios"><br>
                            </div>
                            <div class="col-sm-12 col-md-8">
                              <label>Nombre de la institución *</label>
                              <input id="institucion_estudios_director" class="form-control" type="text" placeholder="Nombre de la institución"><br>
                            </div>
                            <div class="col-sm-12 col-md-4">
                              <label>Documento *</label>
                              <select class="form-control" id="documento_acredita_director">
                                <option value="">Seleccione una opción</option>
                                <option value="TÍtulo">TÍtulo</option>
                                <option value="Cedula">Cedula</option>
                                <option value="Constancia">Constancia</option>
                              </select>
                              <br>
                            </div>
                            <div class="col-sm-12 col-md-5">
                              <button class="btn btn-secundary" type="button" name="button" onclick="agregarFormacionDirector()">Agregar formación</button>
                            </div>
                          </div>
                          <!-- Tabla que muestra los campos -->
                          <div class="col-sm-12 col-md-12">
                            <div class="table-responsive">
                              <table class="table  table-bordered">
                                <thead>
                                  <tr>
                                    <th class="size" scope="col">Nivel educativo</th>
                                    <th class="size" scope="col">Nombre de los estudios</th>
                                    <th class="size" scope="col">Nombre de la institución</th>
                                    <th class="size" scope="col">Documento que lo acredita</th>
                                    <th class="size" scope="col">Acción</th>
                                  </tr>
                                </thead>
                                <tbody id="formacion_director">
                                  <tr>
                                  </tr>
                                </tbody>
                              </table><br><br>
                            </div>
                          </div>
                        </div>
                        <!-- Experiencia del director -->
                        <div class="form-group">
                          <div class="col-sm-col-md-12">
                            <h2>Experiencia docente o profesional</h2>
                            <hr class="red">
                          </div>
                          <!-- Inputs para POST -->
                          <div id="inputsExperienciaDirector"></div>
                          <!-- Mensajes -->
                          <div id="mensajesExperienciaDirector"></div>
                          <!-- Campos para llenar tabla  -->
                          <div class="col-sm-12 col-md-12">
                            <div class="col-sm-12 col-md-3">
                              <label>Tipo de experiencia *</label>
                              <select class="form-control" id="tipo_experiencia_director">
                                <option value="">Seleccione una opción</option>
                                <option value="1">Docente</option>
                                <option value="2">Profesional</option>
                                <option value="3">Directiva</option>
                              </select>
                            </div>
                            <div class="col-sm-12 col-md-9">
                              <label>Asignatura o Puesto *</label>
                              <input id="nombre_experiencia_director" class="form-control" type="text" placeholder="Nombre del cargo"><br>
                            </div>
                            <div class="col-sm-12 col-md-7">
                              <label>Función *</label>
                              <input id="funcion_experiencia_director" class="form-control" type="text" placeholder="Función en la cual se desempeña o desempeñaba"><br>
                            </div>
                            <div class="col-sm-12 col-md-5">
                              <label>Institución o empresa *</label>
                              <input id="institucion_experiencia_director" class="form-control" type="text" placeholder="Institución en la que se desempeña o desempeñaba"><br>
                              <br>
                            </div>
                            <div class="col-sm-12 col-md-3">
                              <label>Fecha inicio *</label>
                              <input id="fecha_inicio_experiencia_director" class="form-control" type="date"><br>
                              <br>
                            </div>
                            <div class="col-sm-12 col-md-3">
                              <label>Fecha fin *</label>
                              <input id="fecha_fin_experiencia_director" class="form-control" type="date"><br>
                              <br>
                            </div>
                            <div class="col-sm-12 col-md-5">
                              <br>
                              <button class="btn btn-secundary" type="button" name="button" onclick="agregarExperiencia()">Agregar experiencia</button>
                            </div>
                          </div>
                          <!-- Tabla -->
                          <div class="col-sm-12 col-md-12">
                            <div class="table-responsive">
                              <table class="table  table-bordered">
                                <thead>
                                  <tr>
                                    <th class="size" scope="col">Tipo experiencia</th>
                                    <th class="size" scope="col">Proyecto o puesto</th>
                                    <th class="size" scope="col">Función</th>
                                    <th class="size" scope="col">Institución</th>
                                    <th class="size" scope="col">Periodo</th>
                                    <th class="size" scope="col">Acción</th>
                                  </tr>
                                </thead>
                                <tbody id="experiencia_director">
                                  <tr>
                                  </tr>
                                </tbody>
                              </table><br><br>
                            </div>
                          </div>
                          <!-- Trabaja gobierno -->
                          <div class="col-sm-12 col-md-12">
                            <!--<label class="control-label">¿Labora en ámbito gubernamental?</label>
                            <select class="form-control" id="ambito_gubernamental" name="DIRECTOR-ambito_gubernamental">
                                <option value="">Seleccione una opción</option>
                                <option value="Si">Si</option>
                                <option value="No">No</option>
                            </select><br>
                            <textarea class="form-control" id="descripcion_ambito_gubernamental" name="DIRECTOR-descripcion_ambito_gubernamental" rows="4" placeholder="Detalle tanto como sea posible en el ámbito gubernamental"></textarea>-->
                          </div>
                        </div>
                        <!-- Publicaciones director -->
                        <div class="form-group">
                          <div class="col-sm-col-md-12">
                            <h2>Publicaciones director</h2>
                            <hr class="red">
                          </div>
                          <!-- Inputs para POST -->
                          <div id="inputsPublicacionesDirector"></div>
                          <!-- Mensaje -->
                          <div id="mensajesPublicacionesDirector"></div>
                          <!-- Insertar campos -->
                          <div class="col-sm-12 col-md-12">
                            <div class="col-sm-12 col-md-9">
                              <label>Título *</label>
                              <input class="form-control" type="text" id="titulo_publicacion" placeholder="Título de la publicación">
                            </div>
                            <div class="col-sm-12 col-md-3">
                              <label>Vólumen *</label>
                              <input id="volumen_publicacion" class="form-control" type="text" placeholder="Vólumen de la publicación hecha"><br>
                            </div>
                            <div class="col-sm-12 col-md-7">
                              <label>Editorial *</label>
                              <input id="editorial_publicacion" class="form-control" type="text" placeholder="Nombre de la editorial"><br>
                            </div>
                            <div class="col-sm-12 col-md-5">
                              <label>Año *</label>
                              <input id="ano_publicacion" class="form-control" type="text" placeholder="Año de la publicación"><br>
                              <br>
                            </div>
                            <div class="col-sm-12 col-md-5">
                              <label>País *</label>
                              <input id="pais_publicacion" class="form-control" type="text" placeholder="País de la publicación"><br>
                              <br>
                            </div>
                            <div class="col-sm-12 col-md-7">
                              <label>Otros datos</label>
                              <input id="otro_publicacion" class="form-control" type="text" placeholder="Datos que considere pertinentes"><br>
                              <br>
                            </div>
                            <div class="col-sm-12 col-md-5">
                              <button class="btn btn-secundary" type="button" name="button" onclick="agregarPublicacion()">Agregar publicación</button>
                            </div>
                          </div>
                          <!-- tabla que muestra los valores -->
                          <div class="col-sm-12 col-md-12">
                            <div class="table-responsive">
                              <br>
                              <table class="table  table-bordered">
                                <thead>
                                  <tr>
                                    <th class="size" scope="col">Título</th>
                                    <th class="size" scope="col">Vólumen</th>
                                    <th class="size" scope="col">Editorial</th>
                                    <th class="size" scope="col">Año</th>
                                    <th class="size" scope="col">País</th>
                                    <th class="size" scope="col">Otros datos</th>
                                    <th class="size" scope="col">Acción</th>
                                  </tr>
                                </thead>
                                <tbody id="publicaciones_director">
                                  <tr>
                                  </tr>
                                </tbody>
                              </table><br><br>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                <?php } ?>
              </div>
            </div>

            <!-- Programa de estudios -->
            <div class="tab-pane" id="tab-02">
              <div class="panel-group ficha-collapse" role="tablist" id="acordion3">

                <!-- Datos generales  -->
                <div class="panel panel-default">
                  <div class="panel-heading">
                    <h4 class="panel-tittle">
                      <a data-parent="#acordion3" data-toggle="collapse" href="#datos-generales-programa" aria-expanded="false" aria-controls="datos-generales-programa" class="collapsed">Datos del plan de estudios</a>
                      <button type="button" class="collpase-button collapsed" data-parent="#acordion3" data-toggle="collapse" href="#datos-generales-programa" aria-expanded="false"></button>
                    </h4>
                  </div>
                  <div id="datos-generales-programa" class="panel-collapse collapse">
                    <div class="panel-body">
                      <!-- Datos generales  -->
                      <div class="form-group">
                        <div class="col-sm-col-md-12">
                          <h2>Datos generales</h2>
                          <input type="hidden" name="PROGRAMA-id" value="<?= $_GET["dt"] ?>">
                          <hr class="red">
                          <div class="col-sm-12 col-md-4">
                            <label class="control-label" for="">Nivel</label><br>
                            <select class="form-control revision" campo="Nivel del programa" ubicacion="Programas de estudios - Datos generales" id="nivel_id" name="PROGRAMA-nivel_id">
                              <option value="">Seleccione una opción</option>
                            </select><br>
                          </div>
                          <div class="col-sm-12 col-md-8">
                            <label class="control-label" for="">Nombre</label><br>
                            <input type="text" id="nombre_programa" name="PROGRAMA-nombre" class="form-control revision" campo="Nombre del programa" ubicacion="Programas de estudios - Datos generales" value="" placeholder="Nombre del programa de estudio"><br>
                          </div>
                          <div class="col-sm-12 col-md-4">
                            <label class="control-label" for="">Modalidad</label><br>
                            <input type="hidden" <?php if (1 == $_GET['tps']) : $modalidad = $_GET['modalidad'];
                                                    echo "name='PROGRAMA-modalidad_id' value='$modalidad'";
                                                  endif; ?>>
                            <select class="form-control revision" campo="Modalidad del programa" ubicacion="Programas de estudios - Datos generales" id="modalidad_id" <?php if (1 != $_GET['tps']) : echo "name='PROGRAMA-modalidad_id'";
                                                                                                                                                                        endif; ?>>
                              <option value="">Seleccione una opción</option>
                            </select><br>
                          </div>
                          <div class="col-sm-12 col-md-4">
                            <label class="control-label" for="">Periodo</label><br>
                            <select class="form-control revision" campo="Periodo del programa" ubicacion="Programas de estudios - Datos generales" id="ciclo_id" name="PROGRAMA-ciclo_id">
                              <option value="">Seleccione una opción</option>
                              <option value="1">Semestral</option>
                              <option value="2">Cuatrimestral</option>
                              <option value="4">Semestral curriculum flexible</option>
                              <option value="5">Cuatrimestral curriculum flexible</option>
                            </select><br>
                          </div>
                          <div class="col-sm-12 col-md-4">
                            <label class="control-label" for="">Turno</label><br>
                            <select class="form-control selectpicker" id="turno_programa" name="PROGRAMA-turnos[]" multiple title="Seleccione una opción">
                            </select><br>
                          </div>
                          <div class="col-sm-12 col-md-5">
                            <label class="control-label" for="">Duración del programa</label><br>
                            <input type="number" id="duracion_periodos" name="PROGRAMA-duracion_periodos" class="form-control revision" campo="Duración del programa" ubicacion="Programas de estudios - Datos generales" value="" placeholder="#">
                          </div>
                          <div class="col-sm-12 col-md-3">
                            <p style="padding-top: 35px;" id="txt_duracion_periodos">Periodos</p>
                          </div>
                          <div class="col-sm-12 col-md-7">
                            <label class="control-label" for="">Créditos necesarios para concluir el programa</label><br>
                            <input type="number" id="creditos" name="PROGRAMA-creditos" class="form-control revision" campo="Créditos del programa" ubicacion="Programas de estudios - Datos generales" value="0" placeholder="" step="0.01" onchange="Solicitud.dosNumerosDecimal(this)"><br>
                          </div>
                          <div class="col-sm-12 col-md-7">
                            <label class="control-label">Nivel educativo previo *</label>
                            <select class="form-control " id="antecedente_academico" campo="Antecedente académico de ingreso" name="PROGRAMA-antecedente_academico">
                              <option value="">Seleccione una opción</option>
                            </select><br>
                          </div>
                          <?php if ($_GET['tps'] == 1 || $_GET['tps'] == 2) { ?>
                            <div class="col-sm-12 col-md-12">
                              <label class="control-label" for="">Objetivo general</label><br>
                              <textarea id="objetivo_general" name="PROGRAMA-objetivo_general" class="form-control revision" campo="Objetivo general del programa" ubicacion="Programas de estudios - Datos generales" value="" placeholder="Deberá expresar una descripción de los resultados que deben obtenerse en el proceso educativo y centrarse en satisfacer las necesidades sociales"></textarea><br>
                            </div>
                            <div class="col-sm-12 col-md-12">
                              <label class="control-label" for="">Objetivos particulares</label><br>
                              <textarea id="objetivos_particulares" name="PROGRAMA-objetivos_particulares" class="form-control revision" campo="Objetivos particulares del programa" ubicacion="Programas de estudios - Datos generales" value="" placeholder="Deberán diseñarse como logros a mediano plazo del aprendizaje, estos son consecuencia del proceso educativo"></textarea><br>
                            </div>
                          <?php } ?>
                        </div>
                      </div>
                      <!-- Coordinador -->
                      <?php if ($_GET['tps'] == 1 ||  $_GET['tps'] == 2) {  ?>
                        <div class="form-group">
                          <div class="col-sm-col-md-12">
                            <h2>Coordinador del programa</h2>
                            <hr class="red">
                          </div>
                          <div class="col-sm-12 col-md-6">
                            <label class="control-label" for="">Nombre(s) del coordinador</label><br>
                            <input type="text" id="nombre_coordinador_programa" name="COORDINADOR-nombre" class="form-control revision" campo="Nombre del coordinador" ubicacion="Programa estudios - Datos generales" value="" placeholder="Nombre(s) del coordinador del programa"><br>
                          </div>
                          <div class="col-sm-12 col-md-6">
                            <label class="control-label" for="">Apellido paterno del coordinador</label><br>
                            <input type="text" id="apellido_paterno_coordinador_programa" name="COORDINADOR-apellido_paterno" class="form-control revision" campo="Apellido paterno del coordinador" ubicacion="Programa estudios - Datos generales" value="" placeholder="Apellido paterno del coordinador del programa"><br>
                          </div>
                          <div class="col-sm-12 col-md-6">
                            <label class="control-label" for="">Apellido materno del coordinador</label><br>
                            <input type="text" id="apellido_materno_coordinador_programa" name="COORDINADOR-apellido_materno" class="form-control revision" value="" placeholder="Apellido materno del coordinador del programa"><br>
                          </div>
                          <div class="col-sm-12 col-md-6">
                            <label class="control-label" for="">Perfil académico del coordinador</label><br>
                            <input type="text" id="perfil_coordinador_programa" name="COORDINADOR-formacion" class="form-control revision" campo="Perfil del coordinador" ubicacion="Programa estudios - Datos generales" value="" placeholder="Perfil del coordinador del programa"><br>
                          </div>
                        </div>
                      <?php } ?>
                    </div>
                  </div>
                </div>


                <!-- Estudios de pertinencia y oferta/demanda -->
                <div class="panel panel-default">
                  <div class="panel-heading">
                    <h4 class="panel-tittle">
                      <a data-parent="#acordion3" data-toggle="collapse" href="#estudios-programa" aria-expanded="false" aria-controls="estudios-programa" class="collapsed">Fundamentación del plan de estudios</a>
                      <button type="button" class="collpase-button collapsed" data-parent="#acordion3" data-toggle="collapse" href="#estudios-programa" aria-expanded="false"></button>
                    </h4>
                  </div>
                  <div id="estudios-programa" class="panel-collapse collapse">
                    <div class="panel-body">
                      <!--Estudio de pertinencia-->
                      <div class="form-group">
                        <div class="col-sm-12 col-md-6">
                          <label class="control-label">FDP01 *</label>
                          <input type="hidden" id="fdp_01-id" name="PROGRAMA-formato_pedagogico_01-id" value="">
                          <input class="form-control" type="file" name="PROGRAMA-formato_pedagogico_01" value="">
                        </div>
                        <div class="col-sm-12 col-md-6" id="contendorFDP01" style="display: none">
                          <label for=""></label><br>
                          <a id="enlace-fdp_01" class="enlaces" href="" target="_blank">Ver archivo</a>
                        </div>
                        <div class="col-sm-12 col-md-12">
                          <br>
                          <p class="text-muted small">
                            <strong>¡Nota importante! </strong>
                            <br>
                            Adjuntar archivo que describa el estudio de pertinencia y factibilidad así como el estudio de oferta y demanda
                            con las especificaciones señaladas en el Instructivo para la Obtención del Reconocimiento de Validez Oficial de Estudios de Educación Superior
                            del Estado de Jalisco. <a href="plantillas/FDP01.docx">(Descargar plantilla). </a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <?php if ($_GET['tps'] == 1 || $_GET['tps'] == 2) {  ?>
                  <!-- Perfil de ingreso/egreso -->
                  <div class="panel panel-default">
                    <div class="panel-heading">
                      <h4 class="panel-tittle">
                        <a data-parent="#acordion3" data-toggle="collapse" href="#perfil-programa" aria-expanded="false" aria-controls="perfil-programa" class="collapsed">Ingreso - Egreso</a>
                        <button type="button" class="collpase-button collapsed" data-parent="#acordion3" data-toggle="collapse" href="#perfil-programa" aria-expanded="false"></button>
                      </h4>
                    </div>
                    <div id="perfil-programa" class="panel-collapse collapse">
                      <div class="panel-body">
                        <!--Ingreso-->
                        <div class="form-group">
                          <div class="col-sm-12 col-md-12">
                            <h2>Ingreso<h2>
                                <hr class="red">
                          </div>
                          <div class="col-sm-12 col-md-12">
                            <label class="control-label">Métodos de inducción</label>
                            <textarea class="form-control" id="metodos_induccion" name="PROGRAMA-metodos_induccion" rows="8" placeholder="Mencionar los medios a traves de los cuales se dará a conocer al aspirante toda la información relativa al plan de estudios, requisitos de admisión, Matricula, cuotas, libros e insumos, requisitos técnicos y de supervisión, examenes y servisios de apoyo antes de la adminsión"></textarea><br>
                          </div>
                          <div class="form-group col-sm-12 col-md-12">
                            <div class="col-sm-12 col-md-12">
                              <label class="control-label">Perfil ingreso</label><br><br>
                            </div>
                            <div class="col-sm-12 col-md-12">
                              <p>Conocimientos</p>
                              <textarea class="form-control" id="perfil_ingreso_conocimientos" name="PROGRAMA-perfil_ingreso_conocimientos" rows="4" placeholder="Conocimientos necesarios"></textarea><br>
                            </div>
                            <div class="col-sm-12 col-md-12">
                              <p>Habilidades</p>
                              <textarea class="form-control" id="perfil_ingreso_habilidades" name="PROGRAMA-perfil_ingreso_habilidades" rows="4" placeholder="Habilidades necesarias"></textarea><br>
                            </div>
                            <div class="col-sm-12 col-md-12">
                              <p>Actitudes</p>
                              <textarea class="form-control" id="perfil_ingreso_actitudes" name="PROGRAMA-perfil_ingreso_actitudes" rows="4" placeholder="Actitudes necesarias"></textarea>
                            </div>
                          </div>
                          <div class="col-sm-12 col-md-12">
                            <label class="control-label">Proceso de selección</label>
                            <textarea class="form-control" id="proceso_seleccion" name="PROGRAMA-proceso_seleccion" rows="6" placeholder="Mencionar el porceso a detalle de selección"></textarea><br>
                          </div>
                        </div>
                        <!--Egreso-->
                        <div class="form-group">
                          <div class="col-sm-12 col-md-12">
                            <h2>Egreso</h2>
                            <hr class="red">
                          </div>
                          <div class="form-group col-sm-12 col-md-12">
                            <div class="col-sm-12 col-md-12">
                              <label class="control-label">Perfil egreso</label><br><br>
                            </div>
                            <div class="col-sm-12 col-md-12">
                              <p>Conocimientos</p>
                              <textarea class="form-control" id="perfil_egreso_conocimientos" name="PROGRAMA-perfil_egreso_conocimientos" rows="4" placeholder="Conocimientos adquiridos"></textarea><br>
                            </div>
                            <div class="col-sm-12 col-md-12">
                              <p>Habilidades</p>
                              <textarea class="form-control" id="perfil_egreso_habilidades" name="PROGRAMA-perfil_egreso_habilidades" rows="4" placeholder="Habilidades adquiridas"></textarea><br>
                            </div>
                            <div class="col-sm-12 col-md-12">
                              <p>Actitudes</p>
                              <textarea class="form-control" id="perfil_egreso_actitudes" name="PROGRAMA-perfil_egreso_actitudes" rows="4" placeholder="Actitudes adquiridas"></textarea>
                            </div>
                          </div>
                          <div class="col-sm-12 col-md-12">
                            <label class="control-label">Proyecto seguimiento a egresados</label>
                            <textarea class="form-control" id="seguimiento_egresados" name="PROGRAMA-seguimiento_egresados" rows="8" placeholder="Instancias, mecanismos de evaluación, formas y periodicidad"></textarea><br>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>

                  <!-- Curricula  -->
                  <div class="panel panel-default">
                    <div class="panel-heading">
                      <h4 class="panel-tittle">
                        <a data-parent="#acordion3" data-toggle="collapse" href="#curricula-programa" aria-expanded="false" aria-controls="curricula-programa" class="collapsed">Currícula</a>
                        <button type="button" class="collpase-button collapsed" data-parent="#acordion3" data-toggle="collapse" href="#curricula-programa" aria-expanded="false"></button>
                      </h4>
                    </div>
                    <div id="curricula-programa" class="panel-collapse collapse">
                      <div class="panel-body">
                        <div class="form-group">
                          <div class="col-sm-12 col-md-12">
                            <h2>Currícula</h2>
                            <hr class="red">
                          </div>
                          <div class="col-sm-12 col-md-12">
                            <label class="control-label">Mapa curricular</label>
                            <textarea class="form-control" id="mapa_curricular" name="PROGRAMA-mapa_curricular" rows="4" placeholder="Síntesis del plan de estudios "></textarea><br>
                          </div>
                          <div class="col-sm-12 col-md-12">
                            <label class="control-label">Flexibilidad curricular</label>
                            <textarea class="form-control" id="flexibilidad_curricular" name="PROGRAMA-flexibilidad_curricular" rows="4" placeholder="Permitir al estudiante conjuntamente con su comité tutorial diseñar su trayectoria académica"></textarea><br>
                          </div>
                          <div class="col-sm-12 col-md-12">
                            <label class="control-label">Líneas de generación del conocimiento</label>
                            <textarea class="form-control" id="lineas_generacion_aplicacion_conocimiento" name="PROGRAMA-lineas_generacion_aplicacion_conocimiento" rows="4" placeholder="Describir las líneas de generación y aplicación del conocimiento de acuerdo a la naturaleza del programa educativo, así como la participación de los estudiantes en proyectos de investigación y/o trabajo profesional, derivados de éstas"></textarea><br>
                          </div>
                          <div class="col-sm-12 col-md-12">
                            <label class="control-label">Actualización del plan de estudios</label>
                            <textarea class="form-control" id="actualizacion" name="PROGRAMA-actualizacion" rows="4" placeholder="Instancias, criterios, formas y periodicidad"></textarea><br>
                          </div>
                          <div class="col-sm-12 col-md-12">
                            <label class="control-label">Vinculación con colegios de profesionista, academias, asociaciones profesionales entre otras</label>
                            <textarea class="form-control" id="convenios_vinculacion" name="PROGRAMA-convenios_vinculacion" rows="4" placeholder="Señalar los convenios de vinculación o colaboración afines a la profesión de egreso, que se tengan o se pretendan establecer"></textarea><br>
                          </div>
                          <div class="col-sm-12 col-md-6">
                            <label class="control-label">Mapa curricular<sup>1</sup> </label>
                            <input type="hidden" id="curricular-id" name="PROGRAMA-archivo_mapa_curricular-id" value="">
                            <input class="form-control" type="file" name="PROGRAMA-archivo_mapa_curricular" value=""><br>
                          </div>
                          <div class="col-sm-12 col-md-6">
                            <label class="control-label">Reglas de operación de las academias <sup>2</sup> </label>
                            <input type="hidden" id="academias-id" name="PROGRAMA-archivo_reglas_academias-id" value="">
                            <input class="form-control" type="file" name="PROGRAMA-archivo_reglas_academias"><br>
                          </div>
                          <div class="col-sm-12 col-md-6" id="contendorMapaCurricular" style="display: none">
                            <a id="enlace-mapaCurricular" class="enlaces" href="" target="_blank">Ver mapa curricular</a>
                            <br>
                          </div>
                          <div class="col-sm-12 col-md-6" id="contendorReglasAcademia" style="display: none">
                            <a id="enlace-reglasAcademia" class="enlaces" href="" target="_blank">Ver reglas de las académias</a>
                            <br>
                            <br>
                          </div>
                          <div class="col-sm-12 col-md-6">
                            <label class="control-label">Asignaturas a detalle <sup>3</sup> </label>
                            <input type="hidden" id="asignaturas-id" name="PROGRAMA-archivo_asignaturas_detalle-id" value="">
                            <input class="form-control" type="file" name="PROGRAMA-archivo_asignaturas_detalle">
                            <br>
                          </div>
                          <div class="col-sm-12 col-md-6">
                            <label class="control-label">Propuesta hemerobibliográfica <sup>4</sup> </label>
                            <input type="hidden" id="propuesta_hemerobibliografica-id" name="PROGRAMA-propuesta_hemerobibliografica-id" value="">
                            <input class="form-control" type="file" name="PROGRAMA-propuesta_hemerobibliografica">
                            <br>
                          </div>
                          <div class="col-sm-12 col-md-6" id="contendorAsignaturas" style="display: none">
                            <a id="enlace-asignaturas" class="enlaces" href="" target="_blank">Ver detalles de las asignaturas</a>
                            <br>
                          </div>
                          <div class="col-sm-12 col-md-6" id="contendorPropuestaHemerobibliografica" style="display: none">
                            <a id="enlace-propuesta_hemerobibliografica" class="enlaces" href="" target="_blank">Ver propuesta hemerobibliográfica</a>
                            <br>
                          </div>
                          <div class="col-sm-12 col-md-12">
                            <p class="small">
                              <br>
                              <sup>1</sup> Archivo que muestre de manera esquemática la distribución de las unidades de aprendizaje,
                              secuencias (verticalidad y horizontalidad), flexibilidad para seleccionar trayectorias de estudio, número de unidades de
                              aprendizaje por periodo lectivo (semestre o cuatrimestre),
                              las unidades de aprendizaje obligatorias y optativas
                              <br><br>
                              <sup>2</sup>Reglamento de academias o documento que contenga las reglas de operación de dichos cuerpos colegiados
                              <br><br>
                              <sup>3</sup>Documento que describa a detalla cada asignatura <a href="plantillas/FDP03.docx">(Descargar plantilla). </a> <br> <br>

                              <sup>4</sup>Documento en donde se especifique la hemerobibliografía por asignatura <a href="plantillas/FDP04.docx">(Descargar plantilla). </a>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                <?php } ?>
                <?php if ($_GET['tps'] == 1 || $_GET['tps'] == 2 || $_GET['tps'] == 3) {  ?>
                  <!-- Asignaturas -->
                  <div class="panel panel-default">
                    <div class="panel-heading">
                      <h4 class="panel-tittle">
                        <a data-parent="#acordion3" data-toggle="collapse" href="#asignaturas-programa" aria-expanded="false" aria-controls="asignaturas-programa" class="collapsed">Asignaturas</a>
                        <button type="button" class="collpase-button collapsed" data-parent="#acordion3" data-toggle="collapse" href="#asignaturas-programa" aria-expanded="false"></button>
                      </h4>
                    </div>
                    <div id="asignaturas-programa" class="panel-collapse collapse">
                      <div class="panel-body">
                        <div class="form-group">
                          <div class="col-sm-12 col-md-12">
                            <h2>Asignaturas</h2>
                            <hr class="red">
                            <p class="text-muted small">
                              <strong>Nota:</strong>
                              Asegúrese de asignarle algún tipo de insfraestructura y un docente a las asginaturas para que éstas queden registradas.
                            </p>
                          </div>
                          <!-- insertar valores -->
                          <div class=" form-group col-sm-12 col-md-12">
                            <div id="inputsAsignaturas"></div>
                            <div id="mensajesAsignaturas"></div>
                            <?php if ($_GET['tps'] != 3) {  ?>
                              <div class="col-sm-12 col-md-3">
                                <label>Grado *</label>
                                <select class="form-control" id="gradoAsignatura" name="">
                                  <option value="">Seleccione una opción</option>
                                  <optgroup label="Semestres">
                                    <option value="Primer semestre">Primero</option>
                                    <option value="Segundo semestre">Segundo</option>
                                    <option value="Tercero semestre">Tercero</option>
                                    <option value="Cuarto semestre">Cuarto</option>
                                    <option value="Quinto semestre">Quinto</option>
                                    <option value="Sexto semestre">Sexto</option>
                                    <option value="Septimo semestre">Septimo</option>
                                    <option value="Octavo semestre">Octavo</option>
                                    <option value="Noveno semestre">Noveno</option>
                                    <option value="Decimo semestre">Decimo</option>
                                  </optgroup>
                                  <optgroup label="Cuatrimestres">
                                    <option value="Primer cuatrimestre">Primero</option>
                                    <option value="Segundo cuatrimestre">Segundo</option>
                                    <option value="Tercero cuatrimestre">Tercero</option>
                                    <option value="Cuarto cuatrimestre">Cuarto</option>
                                    <option value="Quinto cuatrimestre">Quinto</option>
                                    <option value="Sexto cuatrimestre">Sexto</option>
                                    <option value="Septimo cuatrimestre">Septimo</option>
                                    <option value="Octavo cuatrimestre">Octavo</option>
                                    <option value="Noveno cuatrimestre">Noveno</option>
                                    <option value="Decimo cuatrimestre">Decimo</option>
                                    <option value="Undecimo cuatrimestre">Undecimo</option>
                                    <option value="Duodecimo cuatrimestre">Duodecimo</option>
                                  </optgroup>
                                  <optgroup label="Curriculum Flexible">
                                    <option value="Flexible Cuatrimestral">Listado Cuatrimestral</option>
                                    <option value="Flexible Semestral">Listado Semestral</option>
                                  </optgroup>
                                </select>
                              </div>
                              <div class="col-sm-12 col-md-4">
                                <label>Nombre *</label>
                                <input id="nombreAsignatura" class="form-control" type="text" placeholder="Nombre de la asignatura"><br>
                              </div>
                              <div class="col-sm-12 col-md-3">
                                <label>Clave *</label>
                                <input id="clave" class="form-control" type="text" placeholder="Clave de la asignatura"><br>
                              </div>
                              <div class="col-sm-12 col-md-2">
                                <label>Créditos *</label>
                                <input id="credito" class="form-control" type="number" placeholder="No." step="0.01" onchange="Solicitud.dosNumerosDecimal(this)"><br>
                              </div>
                              <div class="col-sm-12 col-md-6">
                                <label>Área *</label>
                                <select class="form-control" id="area" name="">
                                  <option value="">Seleccione una opción</option>
                                  <optgroup label="Área">
                                    <option value="1">Formación General</option>
                                    <option value="2">Formación Básica</option>
                                    <option value="3">Formación Disciplinar</option>
                                    <option value="5">Formación Técnica</option>
                                    <option value="6">Formación Especializante</option>
                                  </optgroup>
                                </select>
                              </div>
                              <div class="col-sm-12 col-md-12">
                                <label>Seriación</label>
                                <select id="seriacion" class="selectpicker form-control" data-style="btn-default" multiple title="Seriacion" disabled="true">
                                </select><br><br>
                                <!-- <textarea id="seriacion" class="form-control" type="text" placeholder="Clave(s) de la(s) asignatura(s) como requisito"></textarea><br> -->
                              </div>
                              <div class="col-sm-12 col-md-3">
                                <label>Horas docente</label>
                                <input id="docente" class="form-control" type="number" value="0"><br>
                              </div>
                              <div class="col-sm-12 col-md-3">
                                <label>Horas independientes</label>
                                <input id="independiente" class="form-control" type="number" value="0"><br>
                              </div>
                              <div class="col-sm-12 col-md-6">
                                <label>Academia *</label>
                                <input id="academiaAsiganatura" class="form-control" type="text" value="" placeholder="Nombre de la academia a la que pertenece"><br>
                              </div>
                              <div class="col-sm-4 col-md-4">
                                <button class="btn btn-secundary" type="button" name="button" onclick="agregarMateria()">Registrar materia</button><br><br>
                              </div>
                              <div class="form-group col-sm-12 col-md-12">
                                <div class="col-sm-12 col-md-4">
                                  <label> Total Horas docentes:</label><input type="number" id="totalHorasDocentes" class="form-control" value="0" disabled><br>
                                </div>
                                <div class="col-sm-12 col-md-4">
                                  <label> Total Horas independientes:</label><input type="number" id="totalHorasIndependientes" class="form-control" value="0" disabled><br>
                                </div>
                              </div>
                            <?php } ?>
                          </div>
                          <!-- tabla que muestra los valores -->
                          <div class="col-sm-12 col-md-12">
                            <div class="table-responsive">
                              <table class="table  table-bordered">
                                <thead>
                                  <tr>
                                    <th class="size" scope="col">Grado</th>
                                    <th class="size" scope="col">Nombre</th>
                                    <th class="size" scope="col">Clave</th>
                                    <th class="size" scope="col">Seriación</th>
                                    <th class="size" scope="col">Horas docente</th>
                                    <th class="size" scope="col">Horas independientes</th>
                                    <th class="size" scope="col">Créditos</th>
                                    <th class="size" scope="col">Área</th>
                                    <th class="size" scope="col">Acción</th>
                                  </tr>
                                </thead>
                                <tbody id="materias">
                                  <tr>
                                  </tr>
                                </tbody>
                              </table>
                            </div>
                          </div>


                        </div>
                      </div>
                    </div>
                  </div>

                  <!-- Optativas -->
                  <div class="panel panel-default">
                    <div class="panel-heading">
                      <h4 class="panel-tittle">
                        <a data-parent="#acordion3" data-toggle="collapse" href="#optativas-programa" aria-expanded="false" aria-controls="optativas-programa" class="collapsed">Formación Electiva</a>
                        <button type="button" class="collpase-button collapsed" data-parent="#acordion3" data-toggle="collapse" href="#optativas-programa" aria-expanded="false"></button>
                      </h4>
                    </div>
                    <div id="optativas-programa" class="panel-collapse collapse">
                      <div class="panel-body">
                        <div class="form-group">
                          <div class="col-sm-12 col-md-12">
                            <h2>Asignaturas de Formación Electiva</h2>
                            <hr class="red">
                          </div>
                          <!-- insertar valores -->
                          <div class=" form-group col-sm-12 col-md-12">
                            <div id="inputsOptativas"></div>
                            <div id="mensajesOptativas"></div>
                            <input type="hidden" id="gradoOptativa" value="Optativa">
                            <?php if ($_GET['tps'] != 3) {  ?>
                              <div class="col-sm-12 col-md-7">
                                <label>Nombre *</label>
                                <input id="nombreOptativa" class="form-control" type="text" placeholder="Nombre de la asignatura"><br>
                              </div>
                              <div class="col-sm-12 col-md-3">
                                <label>Clave *</label>
                                <input id="claveOptativa" class="form-control" type="text" placeholder="Clave de la asignatura"><br>
                              </div>
                              <div class="col-sm-12 col-md-2">
                                <label>Créditos *</label>
                                <input id="creditoOptativa" class="form-control" type="number" placeholder="No." step="0.01" onchange="Solicitud.dosNumerosDecimal(this)"><br>
                              </div>
                              <div class="col-sm-12 col-md-6">
                                <label>Área *</label>
                                <select class="form-control" id="areaOptativa" name="">
                                  <option value="">Seleccione una opción</option>
                                  <optgroup label="Área">
                                    <option value="4">Formación Electiva</option>
                                  </optgroup>
                                </select>
                              </div>
                              <div class="col-sm-12 col-md-12">
                                <label>Seriación</label>
                                <select id="seriacionOptativa" class="selectpicker form-control" data-style="btn-default" multiple title="Seriacion" disabled="true"><br>
                                </select>
                                <br><br>
                                <!-- <textarea id="seriacionOptativa" class="form-control" type="text" placeholder="Clave(s) de la(s) asignatura(s) como requisito"></textarea><br> -->
                              </div>
                              <div class="col-sm-12 col-md-3">
                                <label>Horas docente</label>
                                <input id="docenteOptativa" class="form-control" type="number" value="0"><br>
                              </div>
                              <div class="col-sm-12 col-md-3">
                                <label>Horas independientes</label>
                                <input id="independienteOptativa" class="form-control" type="number" value="0"><br>
                              </div>
                              <div class="col-sm-12 col-md-6">
                                <label>Academia *</label>
                                <input id="academiaOptativa" class="form-control" type="text" value="" placeholder="Nombre de la academia a la que pertenece"><br>
                              </div>
                              <div class="col-sm-4 col-md-4">
                                <br>
                                <button class="btn btn-secundary" type="button" name="button" onclick="agregarOptativa()">Registrar materia optativa</button><br><br>
                              </div>
                              <div class="form-group col-sm-12 col-md-12">
                                <div class="col-sm-12 col-md-4">
                                  <label> Total Horas docentes:</label><input type="number" id="totalHorasDocentesOptativa" class="form-control" value="0" disabled><br>
                                </div>
                                <div class="col-sm-12 col-md-4">
                                  <label> Total Horas independientes:</label><input type="number" id="totalHorasIndependientesOptativa" class="form-control" value="0" disabled><br>
                                </div>
                              </div>
                            <?php } ?>
                          </div>
                          <!-- tabla que muestra los valores -->
                          <div class="col-sm-12 col-md-12">
                            <div class="table-responsive">
                              <table class="table  table-bordered">
                                <thead>
                                  <tr>
                                    <th class="size" scope="col">Grado</th>
                                    <th class="size" scope="col">Nombre</th>
                                    <th class="size" scope="col">Clave</th>
                                    <th class="size" scope="col">Seriación</th>
                                    <th class="size" scope="col">Horas docente</th>
                                    <th class="size" scope="col">Horas independientes</th>
                                    <th class="size" scope="col">Créditos</th>
                                    <th class="size" scope="col">Área</th>
                                    <th class="size" scope="col">Acción</th>
                                  </tr>
                                </thead>
                                <tbody id="materiasOptativas">
                                  <tr>
                                  </tr>
                                </tbody>
                              </table>
                            </div>
                          </div>

                          <div class="form-group col-sm-12 col-md-12">
                            <div class="col-sm-12 col-md-12">
                              <br><br>
                              <label class="control-label">Número mínimo de horas que se deberan acreditar bajo la conducción de un docente</label>
                            </div>
                            <div class="col-sm-12 col-md-3">
                              <input type="number" id="minimo_horas" name="PROGRAMA-minimo_horas_optativas" class="form-control" value=""><br>
                            </div>
                            <div class="col-sm-12 col-md-12">
                              <label class="control-label">Número mínimo de créditos que se deberán acreditar</label>
                            </div>
                            <div class="col-sm-12 col-md-3">
                              <input type="number" id="minimo_creditos" name="PROGRAMA-minimo_creditos_optativas" class="form-control" value="" step="0.01" onchange="Solicitud.dosNumerosDecimal(this)">
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                <?php } ?>
                <?php if ($_GET['tps'] == 1 || $_GET['tps'] == 2) {  ?>
                  <!-- Docentes -->
                  <div class="panel panel-default">
                    <div class="panel-heading">
                      <h4 class="panel-tittle">
                        <a data-parent="#acordion3" data-toggle="collapse" href="#docentes-programa" aria-expanded="false" aria-controls="docentes-programa" class="collapsed">Docentes</a>
                        <button type="button" class="collpase-button collapsed" data-parent="#acordion3" data-toggle="collapse" href="#docentes-programa" aria-expanded="false"></button>
                      </h4>
                    </div>
                    <div id="docentes-programa" class="panel-collapse collapse">
                      <div class="panel-body">
                        <div class="form-group">
                          <div class="col-sm-12 col-md-12">
                            <h2>Docentes</h2>
                            <hr class="red">
                          </div>
                          <!-- insertar valores -->
                          <div class=" form-group col-sm-12 col-md-12">

                            <div id="inputsDocentes">

                            </div>
                            <div id="mesajesDocentes">

                            </div>
                            <div class="col-sm-12 col-md-5">
                              <label>Tipo de docente *</label>
                              <select class="form-control" id="tipoDocente">
                                <option value="">Seleccione una opción</option>
                                <option value="1">Docente de asignatura</option>
                                <option value="2">Docente de tiempo completo</option>
                              </select>
                            </div>
                            <div class="col-sm-12 col-md-7">
                              <label>Nombre(s) *</label>
                              <input id="nombreDocente" class="form-control" type="text" placeholder="Nombre(s) del docente"><br>
                            </div>
                            <div class="col-sm-12 col-md-6">
                              <label>Apellido paterno *</label>
                              <input id="apellidoPaternoDocente" class="form-control" type="text" placeholder="Apellido paterno del docente"><br>
                            </div>
                            <div class="col-sm-12 col-md-6">
                              <label>Apellido materno</label>
                              <input id="apellidoMaternoDocente" class="form-control" type="text" placeholder="Apellido paterno del docente"><br>
                            </div>
                            <div class="form-group col-sm-12 col-md-12">
                              <div class="col-sm-12 col-md-12">
                                <label>Último grado*</label>
                              </div>
                              <div class="col-sm-12 col-md-3">
                                <label>Nivel</label>
                                <select class="form-control" id="nivelUltimoGradoDocente">
                                  <option value="">Seleccione opción</option>
                                </select>
                              </div>
                              <div class="col-sm-12 col-md-6">
                                <label>Nombre</label>
                                <input class="form-control" type="text" id="nombreUltimoGradoDocente" placeholder="Nombre del grado"><br>
                              </div>
                              <div class="col-sm-12 col-md-3">
                                <label>Documento presentado </label>
                                <select class="form-control" id="documentacionUltimoGradoDocente">
                                  <option value="">Seleccione opción</option>
                                  <option value="Título">Título</option>
                                  <option value="Cédula">Cédula</option>
                                </select>
                              </div>
                            </div>

                            <div class=" form-group col-sm-12 col-md-12">
                              <div class="col-sm-12 col-md-12">
                                <label>Penúltimo grado</label>
                              </div>
                              <div class="col-sm-12 col-md-3">
                                <label>Nivel</label>
                                <select class="form-control" id="nivelPenultimoGradoDocente">
                                  <option value="">Seleccione opción</option>
                                </select>
                              </div>
                              <div class="col-sm-12 col-md-6">
                                <label>Nombre</label>
                                <input class="form-control" type="text" id="nombrePenultimoGradoDocente" placeholder="Nombre del grado"><br>
                              </div>
                              <div class="col-sm-12 col-md-3">
                                <label>Documento presentado </label>
                                <select class="form-control" id="documentacionPenultimoGradoDocente">
                                  <option value="">Seleccione opción</option>
                                  <option value="Título">Título</option>
                                  <option value="Cédula">Cédula</option>
                                </select>
                              </div>
                            </div>

                            <div class="col-sm-12 col-md-12">
                              <label>Asignatura para la que se propone *</label><br>
                              <select id="asignaturaDocente" class="selectpicker form-control" data-style="btn-default" multiple title="Materias para las que se propone" disabled="true">
                              </select>
                              <br><br><br>
                            </div>
                            <div class="col-sm-12 col-md-3">
                              <label>Tipo contratación *</label>
                              <select class="form-control" id="tipoContratacionDocente">
                                <option value="">Selecione una opción</option>
                                <option value="1">Contrato</option>
                                <option value="2">Tiempo indefinido</option>
                                <option value="3">Otro</option>
                              </select>
                            </div>
                            <div class="col-sm-12 col-md-3">
                              <label>Antiguedad </label>
                              <input class="form-control" type="text" id="antiguedadDocente" placeholder="antiguedad"><br>
                            </div>
                            <div class="col-sm-12 col-md-12">
                              <label>Experiencia laboral</label>
                              <textarea id="experienciaDocente" class="form-control" rows="4" placeholder="Sólo en caso de no tener cédula o penúltimo grado"></textarea><br><br>
                            </div>
                            <div class="col-sm-12 col-md-6">
                              <button class="btn btn-secundary" type="button" name="button" onclick="agregarDocente()">Agregar docente</button><br><br>
                            </div>

                          </div>
                          <!-- tabla que muestra los valores -->
                          <div class="col-sm-12 col-md-12">
                            <div class="table-responsive">
                              <table class="table  table-bordered">
                                <thead>
                                  <tr>
                                    <th class="size" scope="col">Nombre</th>
                                    <th class="size" scope="col">Tipo</th>
                                    <th class="size" scope="col">Formacion profesional</th>
                                    <th class="size" scope="col">Asignatura</th>
                                    <th class="size" scope="col">Experiencia</th>
                                    <th class="size" scope="col">Contratación y antiguedad</th>
                                    <th class="size" scope="col">Acción</th>
                                  </tr>
                                </thead>
                                <tbody id="docentes">
                                  <tr>
                                  </tr>

                                </tbody>
                              </table>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>

                  <!-- Trayectoria educativa-->
                  <div class="panel panel-default">
                    <div class="panel-heading">
                      <h4 class="panel-tittle">
                        <a data-parent="#acordion3" data-toggle="collapse" href="#trayectoria-programa" aria-expanded="false" aria-controls="trayectoria-programa" class="collapsed">Trayectoria educativa</a>
                        <button type="button" class="collpase-button collapsed" data-parent="#acordion3" data-toggle="collapse" href="#trayectoria-programa" aria-expanded="false"></button>
                      </h4>
                    </div>
                    <div id="trayectoria-programa" class="panel-collapse collapse">
                      <div class="panel-body">
                        <div class="form-group">
                          <div class="col-sm-12 col-md-12">
                            <h2>Trayectoria educativa y tutoría de los estudiantes</h2>
                            <input type="hidden" id="trayectoria_id" name="TRAYECTORIA-id" value="">
                            <hr class="red">
                          </div>
                          <div class="col-sm-12 col-md-12">
                            <label class="contorl-label">Programa de seguimiento</label>
                            <textarea class="form-control" id="programa_seguimiento" name="TRAYECTORIA-programa_seguimiento" rows="4" placeholder="Elaborar un proyecto de seguimiento de la trayectoria académica de los estudiantes desde su ingreso hasta el egreso del programa"></textarea><br>
                          </div>
                          <div class="col-sm-12 col-md-12">
                            <label class="contorl-label">Función tutorial</label>
                            <textarea class="form-control" id="funcion_tutorial" name="TRAYECTORIA-funcion_tutorial" rows="4" placeholder="Describir la función de la tutoría para la formación integral del estudiante, en los siguientes aspectos: Académica, Administrativa, Psicológica"></textarea><br>
                          </div>
                          <div class="col-sm-12 col-md-12">
                            <label class="contorl-label">Tipo de tutoría</label>
                            <textarea class="form-control" id="tipo_tutoria" name="TRAYECTORIA-tipo_tutoria" rows="4" placeholder="Señale la forma en que implementa la tutoría de acuerdo a la natulareza del plan de estudios y el número de estudiantes que tiene el programa e indique la modalidad(Presencial, Virtual o Mixta)"></textarea><br>
                          </div>
                          <div class="col-sm-12 col-md-12">
                            <label class="contorl-label">Tasa de egreso</label>
                            <textarea class="form-control" id="tasa_egreso" name="TRAYECTORIA-tasa_egreso" rows="4" placeholder="Tiempo mínimo para concluir el plan de estudios Tiempo máximo para concluir el plan de estudios Tiempo aproximado de titulación"></textarea><br>
                          </div>
                          <div class="col-sm-12 col-md-12">
                            <label class="contorl-label">Estadísticas titulación</label>
                            <textarea class="form-control" id="estadisticas_titulacion" name="TRAYECTORIA-estadisticas_titulacion" rows="4" placeholder="Propuesta de la Base de Datos para emitir los reportes estadísticos de titulación por cohorte generacional, entre otros (por modalidad de titulación)"></textarea><br>
                          </div>
                          <div class="col-sm-12 col-md-12">
                            <label class="contorl-label">Modalidades de titulación</label>
                            <textarea class="form-control" id="modalidades_titulacion" name="TRAYECTORIA-modalidades_titulacion" rows="4" placeholder="Indique las modalidades de titulación que utiliza de acuerdo a su reglamento institucional"></textarea><br>
                          </div>
                          <div class="col-sm-12 col-md-12">
                            <label class="control-label">Informe de resultados </label>
                            <input type="hidden" id="informe-id" name="TRAYECTORIA-archivo_informe_resultados_trayectoria_educativa-id" value="">
                            <input class="form-control" type="file" name="TRAYECTORIA-archivo_informe_resultados_trayectoria_educativa"><br>
                          </div>
                          <div class="col-sm-12 col-md-12" id="contendorInformeResultados" style="display: none">
                            <a id="enlace-informeResultados" class="enlaces" href="" target="_blank">Ver informe de resultados</a>
                            <br>
                          </div>
                          <div class="col-sm-12 col-md-12">
                            <label class="control-label">Instrumentos o formatos utilizados para dar seguimiento al programa de trayectoria y tutoría académica <sup>1</sup> </label>
                            <input type="hidden" id="instrumentos-id" name="TRAYECTORIA-archivo_instrumentos_trayectoria_educativa-id" value="">
                            <input class="form-control" type="file" name="TRAYECTORIA-archivo_instrumentos_trayectoria_educativa"><br>
                          </div>
                          <div class="col-sm-12 col-md-12" id="contendorInstrumentos" style="display: none">
                            <a id="enlace-instrumentos" class="enlaces" href="" target="_blank">Ver instrumentos utilizados</a>
                            <br>
                          </div>
                          <div class="col-sm-12 col-md-12">
                            <label class="control-label">Trayectoria educativa y tutoría de los estudiantes (opcional) <sup>2</sup> </label>
                            <input type="hidden" id="trayectoria-id" name="TRAYECTORIA-archivo_trayectoria_educativa-id" value="">
                            <input class="form-control" type="file" name="TRAYECTORIA-archivo_trayectoria_educativa">
                          </div>
                          <div class="col-sm-12 col-md-12" id="contendorTrayectoria" style="display: none">
                            <a id="enlace-trayectoria" class="enlaces" href="" target="_blank">Ver trayectoria educativa</a>
                            <br>
                          </div>
                          <div class="col-sm-12 col-md-12">
                            <p class="small">
                              <br>
                              <sup>1</sup>Incluir el acta de creación del comité tutorial <br>
                              <sup>2</sup> En caso de que los campos programa seguimiento, función tutorial, tipo tutoría, tasa egreso, estadísticas de titulación y modalidades de titulación incluyan cualquier tipo de ilustración o el texto sea demasiado
                              incluya un resumen en los campos y suba su archivo completo tomando como referencia <a href="plantillas/FDP05.docx">(Descargar plantilla). </a>
                            </p>
                          </div>


                        </div>
                      </div>
                    </div>
                  </div>
                <?php } ?>
                <?php if (($_GET['tps'] == 1 &&  ($_GET['modalidad'] > 1 && $_GET['modalidad'] < 4)) || ($_GET['tps'] == 2 && ($_GET['modalidad'] > 1 && $_GET['modalidad'] < 4))) {  ?>

                  <!-- Herramientas educativas -->
                  <div id="mixta-herramientas" class="panel panel-default">
                    <div class="panel-heading">
                      <h4 class="panel-tittle">
                        <a data-parent="#acordion3" data-toggle="collapse" href="#herramientas-programa" aria-expanded="false" aria-controls="herramientas-programa" class="collapsed">Herramientas educativas</a>
                        <button type="button" class="collpase-button collapsed" data-parent="#acordion3" data-toggle="collapse" href="#herramientas-programa" aria-expanded="false"></button>
                      </h4>
                    </div>
                    <div id="herramientas-programa" class="panel-collapse collapse">
                      <div class="panel-body">
                        <!--FDA 05-->
                        <div class="form-group">
                          <div class="col-sm-12 col-md-6">
                            <label class="control-label">FDA05 *</label>
                            <input type="hidden" id="fda_05-id" name="PROGRAMA-formato_herramientas_05-id" value="">
                            <input class="form-control" type="file" name="PROGRAMA-formato_herramientas_05" value="">
                          </div>
                          <div class="col-sm-12 col-md-6" id="contendorFDA05" style="display: none">
                            <label for=""></label><br>
                            <a id="enlace-fda_05" class="enlaces" href="" target="_blank">Ver archivo</a>
                          </div>
                          <div class="col-sm-12 col-md-12">
                            <br>
                            <p class="text-muted small">
                              <strong>¡Nota importante! </strong>
                              <br>
                              Este formato solamente aplica para modalidad mixta y no escolarizada <a href="plantillas/FDA05.docx">(Descargar plantilla). </a>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                <?php } ?>
              </div>
            </div>

            <!-- Plantel -->
            <div class="tab-pane" id="tab-03">
              <div class="panel-group ficha-collapse" role="tablist" id="acordion2">
                <!-- Datos generales -->
                <div class="panel panel-default">
                  <div class="panel-heading">
                    <h4 class="panel-tittle">
                      <a data-parent="#acordion2" data-toggle="collapse" href="#datos-plantel" aria-expanded="false" aria-controls="datos-plantel" class="collapsed">Datos del plantel</a>
                      <button type="button" class="collpase-button collapsed" data-parent="#acordion2" data-toggle="collapse" href="#datos-plantel" aria-expanded="false"></button>
                    </h4>
                  </div>
                  <div id="datos-plantel" class="panel-collapse collapse">
                    <div class="panel-body">
                      <div class="form-group">
                        <div class="col-sm-col-md-12">
                          <h2>Datos generales</h2>
                          <input type="hidden" id="plantel-id" value="">
                          <hr class="red">
                        </div>
                        <div class="col-sm-12 col-md-8">
                          <label class="control-label" for="">Clave de centro de trabajo:</label><br>
                          <input id="clave_centro_trabajo" type="text" name="PLANTEL-clave_centro_trabajo" class="form-control PLANTEL" value="" placeholder="En caso de contar">
                        </div>
                        <div class="col-sm-12 col-md-8">
                          <label class="control-label" for="">Correo(s) electrónico(s)<sub>(1 correo por dominio institucional y 2 sin dominio)</sub>:</label><br>
                          <input type="email" id="email1" name="PLANTEL-email1" class="form-control PLANTEL" value="" placeholder="correo@dominio.com">
                          <br>
                          <input type="email" id="email2" name="PLANTEL-email2" class="form-control PLANTEL" value="" placeholder="correo@dominio.com">
                          <br>
                          <input type="email" id="email3" name="PLANTEL-email3" class="form-control PLANTEL" value="" placeholder="correo@dominio.com">
                          <br>
                        </div>
                        <div class=" form-group col-sm-12 col-md-12">
                          <div class="col-md-12">
                            <label class="control-label" for="">Teléfono(s):</label><br>
                          </div>
                          <div class="col-sm-12 col-md-4">
                            <input type="tel" id="telefono1" name="PLANTEL-telefono1" class="form-control PLANTEL" value="" placeholder="33-45-58-25-54">
                          </div>
                          <div class="col-sm-12 col-md-4">
                            <input type="tel" id="telefono2" name="PLANTEL-telefono2" class="form-control PLANTEL" value="" placeholder="33-45-58-25-54">
                          </div>
                          <div class="col-sm-12 col-md-4">
                            <input type="tel" id="telefono3" name="PLANTEL-telefono3" class="form-control PLANTEL" value="" placeholder="33-45-58-25-54">
                          </div>
                        </div>
                        <div class="col-sm-12 col-md-8">
                          <label class="control-label" for="">Redes sociales:</label><br>
                          <textarea class="form-control PLANTEL" id="redes_sociales" name="PLANTEL-redes_sociales" rows="8" cols="20" placeholder="Facebook:&#10;Twitter:&#10;Instagram:"></textarea>
                        </div>
                        <div class="col-sm-12 col-md-8">
                          <label class="control-label" for="">Página web:</label><br>
                          <input type="url" id="paginaweb" name="PLANTEL-paginaweb" class="form-control PLANTEL" value="" placeholder="https://www.universidad.com">
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <!-- Ubicación del plantel -->
                <div class="panel panel-default">
                  <div class="panel-heading">
                    <h4 class="panel-tittle">
                      <a data-parent="#acordion2" data-toggle="collapse" href="#domicilio-plantel" aria-expanded="false" aria-controls="domicilio-plantel" class="collapsed">Ubicación</a>
                      <button type="button" class="collpase-button collapsed" data-parent="#acordion2" data-toggle="collapse" href="#domicilio-plantel" aria-expanded="false"></button>
                    </h4>
                  </div>
                  <div id="domicilio-plantel" class="panel-collapse collapse">
                    <div class="panel-body">
                      <!-- Domicilio -->
                      <div class="form-group">
                        <div class="col-sm-col-md-12">
                          <h2>Ubicación del plantel</h2>
                          <input type="hidden" id="id_domiclio_plantel" value="">
                          <hr class="red">
                        </div>
                        <div class="col-sm-6 col-md-8">
                          <label class="control-label" for="">Calle</label><br>
                          <input type="text" id="calle" name="DOMICILIOPLANTEL-calle" class="form-control " campo="Nombre de la calle del plantel" ubicacion="Plantel apartado Ubicación" value="" placeholder="Nombre de la calle, avenida">
                        </div>
                        <div class="col-sm-6 col-md-6">
                          <label class="control-label" for="">Número exterior</label><br>
                          <input type="text" id="numero_exterior" name="DOMICILIOPLANTEL-numero_exterior" class="form-control " campo="Número exterior del plantel" ubicacion="Plantel apartado Ubicación" value="" placeholder="Número exterior">
                        </div>
                        <div class="col-sm-6 col-md-6">
                          <label class="control-label" for="">Número interior</label><br>
                          <input type="text" id="numero_interior" name="DOMICILIOPLANTEL-numero_interior" class="form-control" value="" placeholder="Número interior en caso de tener">
                        </div>
                        <div class="col-sm-6 col-md-6">
                          <label class="control-label" for="">Colonia</label><br>
                          <input type="text" id="colonia" name="DOMICILIOPLANTEL-colonia" class="form-control " campo="Colonia donde se ubica del plantel" ubicacion="Plantel apartado Ubicación" value="" placeholder="Nombre de la colonia">
                        </div>
                        <div class="col-sm-6 col-md-6">
                          <label class="control-label" for="">CP</label><br>
                          <input type="number" id="codigo_postal" name="DOMICILIOPLANTEL-codigo_postal" class="form-control " campo="Código postal del plantel" ubicacion="Plantel apartado Ubicación" value="" placeholder="Código postal">
                        </div>
                        <div class="col-sm-6 col-md-8">
                          <label class="control-label" for="">Municipio</label><br>
                          <div id="municipios">
                            <select class="form-control " campo="Municipio del plantel" ubicacion="Plantel apartado Ubicación" id="municipio" name="DOMICILIOPLANTEL-municipio">
                              <option value="">Seleccione municipio</option>
                            </select>
                          </div>
                          <br>
                        </div>
                        <div class="col-sm-12 col-md-12">
                          <label class="control-label">Mapa </label><br>
                          <div id="map" class="col-sm-12 col-md-12" style="height: 500px">

                          </div>
                        </div>
                        <div class="col-sm-6 col-md-8">
                          <label class="control-label" for="">Coordenadas</label><br>
                          <input type="hidden" id="latitud" name="DOMICILIOPLANTEL-latitud">
                          <input type="hidden" id="longitud" name="DOMICILIOPLANTEL-longitud">
                          <input class="form-control" id="coordenadas" name="PLANTEL-coordenadas" placeholder="125.154, 103.45" readonly>
                        </div>
                        <div class="col-sm-6 col-md-12">
                          <label class="control-label" for="">Especificaciones</label><br>
                          <textarea class="form-control" id="especificaciones" name="PLANTEL-especificaciones" rows="8" placeholder="Escriba la especificaciones del plantel"></textarea>
                        </div>
                        <input type="hidden" name="DOMICILIOPLANTEL-estado" value="Jalisco">
                        <input type="hidden" name="DOMICILIOPLANTEL-pais" value="Mexico">

                      </div>
                    </div>
                  </div>
                </div>
                <?php if ($_GET['tps'] == 1  ||  $_GET['tps'] == 3) { ?>
                  <!-- Descripcion -->
                  <div class="panel panel-default">
                    <div class="panel-heading">
                      <h4 class="panel-tittle">
                        <a data-parent="#acordion2" data-toggle="collapse" href="#descripcion-plantel" aria-expanded="false" aria-controls="descripcion-plantel" class="collapsed">Descripción</a>
                        <button type="button" class="collpase-button collapsed" data-parent="#acordion2" data-toggle="collapse" href="#descripcion-plantel" aria-expanded="false"></button>
                      </h4>
                    </div>
                    <div id="descripcion-plantel" class="panel-collapse collapse">
                      <div class="panel-body">
                        <div class="form-group">
                          <div class="col-sm-col-md-12">
                            <h2>Descripción del plantel</h2>
                            <hr class="red">
                          </div>
                          <div class="form-group col-sm-12 col-md-12">
                            <div class="col-sm-12 col-md-6">
                              <label class="control-label" for="">Caracteristicas del inmueble</label><br>
                              <select class="form-control" id="caracteristica_inmueble" name="PLANTEL-caracteristica_inmueble">
                                <option value="">Seleccione una opción</option>
                                <option value="Construido">Construido para escuela</option>
                                <option value="Adaptado">Adaptado</option>
                                <option value="Mixto">Mixto</option>
                              </select>
                            </div>
                            <div class="col-sm-12 col-md-6">
                              <label class="control-label" for="">Dimensiones del plantel:</label><br>
                              <input id="dimensiones" type="number" name="PLANTEL-dimensiones" class="form-control" value="" placeholder="Área de la supercie en metros cuadrados">
                            </div>
                          </div>
                          <div class="col-sm-12 col-md-3">
                            <br>
                            <label class="control-label" for="">Edificios y/o niveles</label><br>
                            <div>
                              <p>
                                <input id="sotano" type="checkbox" name="EDIFICIO-sotano" value="10"> Sótano
                              </p>
                            </div>
                            <div>
                              <p>
                                <input id="planta_baja" type="checkbox" name="EDIFICIO-planta_baja" value="20"> Planta baja
                              </p>
                            </div>
                            <div>
                              <p>
                                <input id="primer_piso" type="checkbox" name="EDIFICIO-primer_piso" value="1"> Primer piso
                              </p>
                            </div>
                            <div>
                              <p>
                                <input id="segundo_piso" type="checkbox" name="EDIFICIO-segundo_piso" value="2"> Segundo piso
                              </p>
                            </div>
                            <div>
                              <p>
                                <input id="tercer_piso" type="checkbox" name="EDIFICIO-tercer_piso" value="3"> Tercer piso
                              </p>
                            </div>
                            <div>
                              <p>
                                <input id="cuarto_piso" type="checkbox" name="EDIFICIO-cuarto_piso" value="4"> Cuarto piso
                              </p>
                            </div>
                          </div>
                          <div class="col-sm-12 col-md-9">
                            <br>
                            <div class=" col-sm-12 col-md-12">
                              <label class="control-label" for="">Sistemas de seguridad</label><br><br>
                            </div>
                            <div class="col-sm-12 col-md-8">
                              <p>Recubrimientos plásticos en pisos y escalones</p>
                            </div>
                            <div class="col-sm-12 col-md-4"><input id="recubrimiento_plastico" type="number" name="SEGURIDAD-recubrimiento_plastico" class="form-control" value="" placeholder="Cantidad"><br></div>
                            <div class="col-sm-12 col-md-8">
                              <p>Alarma contra incendios y/o terremotos</p>
                            </div>
                            <div class="col-sm-12 col-md-4"><input id="alarma" type="number" name="SEGURIDAD-alarma" class="form-control" value="" placeholder="Cantidad"><br></div>
                            <div class="col-sm-12 col-md-8">
                              <p>Señalamientos de evacuación</p>
                            </div>
                            <div class="col-sm-12 col-md-4"><input id="senal_evacuacion" type="number" name="SEGURIDAD-senal_evacuacion" class="form-control" value="" placeholder="Cantidad"><br></div>
                            <div class="col-sm-12 col-md-8">
                              <p>Botiquín</p>
                            </div>
                            <div class="col-sm-12 col-md-4"><input id="botiquin" type="number" name="SEGURIDAD-botiquin" class="form-control" value="" placeholder="Cantidad"><br></div>
                            <div class="col-sm-12 col-md-8">
                              <p>Escaleras de emergencia</p>
                            </div>
                            <div class="col-sm-12 col-md-4"><input id="escalera_emergencia" type="number" name="SEGURIDAD-escalera_emergencia" class="form-control" value="" placeholder="Cantidad"><br></div>
                            <div class="col-sm-12 col-md-8">
                              <p>Área de seguridad</p>
                            </div>
                            <div class="col-sm-12 col-md-4"><input id="area_seguridad" type="number" name="SEGURIDAD-area_seguridad" class="form-control" value="" placeholder="Cantidad"><br></div>
                            <div class="col-sm-12 col-md-8">
                              <p>Extintores</p>
                            </div>
                            <div class="col-sm-12 col-md-4"><input id="extintor" type="number" name="SEGURIDAD-extintor" class="form-control" value="" placeholder="Cantidad"><br></div>
                            <div class="col-sm-12 col-md-8">
                              <p>Puntos de reunión para evacuación</p>
                            </div>
                            <div class="col-sm-12 col-md-4"><input id="punto_reunion" type="number" name="SEGURIDAD-punto_reunion" class="form-control" value="" placeholder="Cantidad"><br></div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <!-- Higiene -->
                  <div class="panel panel-default">
                    <div class="panel-heading">
                      <h4 class="panel-tittle">
                        <a data-parent="#acordion2" data-toggle="collapse" href="#higiene-plantel" aria-expanded="false" aria-controls="higiene-plantel" class="collapsed">Higiene</a>
                        <button type="button" class="collpase-button collapsed" data-parent="#acordion2" data-toggle="collapse" href="#higiene-plantel" aria-expanded="false"></button>
                      </h4>
                    </div>
                    <div id="higiene-plantel" class="panel-collapse collapse">
                      <div class="panel-body">
                        <div class="form-group">
                          <div class="col-sm-col-md-12">
                            <h2>Higiene del plantel</h2>
                            <hr class="red">
                          </div>
                          <div class="col-sm-12 col-md-12">
                            <label class="control-label" for="">Sanitarios en todo el plantel para alumnos</label><br><br>
                            <div class="col-sm-12 col-md-12">
                              <div class="col-sm-12 col-md-3">
                                <p>Hombres</p>
                              </div>
                              <div class="col-sm-12 col-md-5">
                                <input type="number" id="sanitarios_alumnos_hombres" name="HIGIENE-sanitarios_alumnos_hombres" class="form-control" value="" placeholder="Número de sanitarios para alumnos"><br>
                              </div>
                            </div>
                            <div class="col-sm-12 col-md-12">
                              <div class="col-sm-12 col-md-3">
                                <p>Mujeres</p>
                              </div>
                              <div class="col-sm-12 col-md-5">
                                <input type="number" id="sanitarios_alumnos_mujeres" name="HIGIENE-sanitarios_alumnos_mujeres" class="form-control" value="" placeholder="Número de sanitarios para alumnos">
                              </div>
                            </div>
                          </div>
                          <div class="col-sm-12 col-md-12">
                            <br>
                            <label class="control-label" for="">Sanitarios en todo el plantel para docentes y administrativos</label><br><br>
                            <div class="col-sm-12 col-md-12">
                              <div class="col-sm-12 col-md-3">
                                <p>Hombres</p>
                              </div>
                              <div class="col-sm-12 col-md-5">
                                <input type="number" id="sanitarios_administrativos_hombres" name="HIGIENE-sanitarios_administrativos_hombres" class="form-control" value="" placeholder="Número de sanitarios para alumnos"><br>
                              </div>
                            </div>
                            <div class="col-sm-12 col-md-12">
                              <div class="col-sm-12 col-md-3">
                                <p>Mujeres</p>
                              </div>
                              <div class="col-sm-12 col-md-5">
                                <input type="number" id="sanitarios_administrativos_mujeres" name="HIGIENE-sanitarios_administrativos_mujeres" class="form-control" value="" placeholder="Número de sanitarios para alumnos">
                              </div>
                            </div>
                          </div>
                          <div class="col-sm-12 col-md-12">
                            <br>
                            <label for="">Limpieza del plantel</label><br><br>
                            <div class="col-sm-12 col-md-12">
                              <div class="col-sm-12 col-md-3">
                                <p>Personas encargadas de la limpieza</p>
                              </div>
                              <div class="col-sm-12 col-md-5">
                                <input type="number" id="personal_limpieza" name="HIGIENE-personal_limpieza" class="form-control" value="" placeholder="Cantidad de personas">
                              </div>
                            </div>
                            <div class="col-sm-12 col-md-12">
                              <div class="col-sm-12 col-md-3">
                                <p>Cestos de basura</p>
                              </div>
                              <div class="col-sm-12 col-md-5">
                                <input type="number" id="cestos_basura" name="HIGIENE-cestos_basura" class="form-control" value="" placeholder="Cantidad de cestos">
                              </div>
                            </div>
                          </div>
                          <div class="col-sm-12 col-md-12">
                            <br>
                            <label for="">Aulas</label><br><br>
                            <div class="col-sm-12 col-md-12">
                              <div class="col-sm-12 col-md-3">
                                <p>Número de aulas</p>
                              </div>
                              <div class="col-sm-12 col-md-5">
                                <input type="number" id="numero_aulas" name="HIGIENE-numero_aulas" class="form-control" value="" placeholder="Cantidad de aulas"><br>
                              </div>
                            </div>
                            <div class="col-sm-12 col-md-12">
                              <div class="col-sm-12 col-md-3">
                                <p>Butacas por aula</p>
                              </div>
                              <div class="col-sm-12 col-md-5">
                                <input type="number" id="butacas_aula" name="HIGIENE-butacas_aula" class="form-control" value="" placeholder="Cantidad de butacas">
                              </div>
                            </div>
                          </div>
                          <div class="col-sm-12 col-md-12">
                            <br>
                            <label for="">Ventilación</label><br><br>
                            <div class="col-sm-12 col-md-12">
                              <div class="col-sm-12 col-md-3">
                                <p>Ventanas que pueden abrirse por aula</p>
                              </div>
                              <div class="col-sm-12 col-md-5">
                                <input type="number" id="ventanas" name="HIGIENE-ventanas" class="form-control" value="" placeholder="Ventanas que pueden abrirse"><br>
                              </div>
                            </div>
                            <div class="col-sm-12 col-md-12">
                              <div class="col-sm-12 col-md-3">
                                <p>Ventiladores</p>
                              </div>
                              <div class="col-sm-12 col-md-5">
                                <input type="text" id="ventilador" name="HIGIENE-ventilador" class="form-control" value="" placeholder="Ventiladores">
                              </div>
                            </div>
                            <div class="col-sm-12 col-md-12">
                              <div class="col-sm-12 col-md-3">
                                <p>Aire acondicionado</p>
                              </div>
                              <div class="col-sm-12 col-md-5">
                                <input type="text" id="acondicionado" name="HIGIENE-acondicionado" class="form-control" value="" placeholder="Aires acondicionados">
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <!-- Instituciones de salud -->
                  <div class="panel panel-default">
                    <div class="panel-heading">
                      <h4 class="panel-tittle">
                        <a data-parent="#acordion2" data-toggle="collapse" href="#salud-plantel" aria-expanded="false" aria-controls="salud-plantel" class="collapsed">Instituciones de salud</a>
                        <button type="button" class="collpase-button collapsed" data-parent="#acordion2" data-toggle="collapse" href="#salud-plantel" aria-expanded="false"></button>
                      </h4>
                    </div>
                    <div id="salud-plantel" class="panel-collapse collapse">
                      <div class="panel-body">
                        <div class="form-group">
                          <div class="col-sm-col-md-12">
                            <h2>Instituciones de salud alenadañas, servicios de ambulancia u otros servicios de emergencia</h2>
                            <hr class="red">
                          </div>
                          <!-- Inputs que para POST -->
                          <div id="inputsSaludInstituciones"></div>
                          <!-- Mensajes -->
                          <div id="mensajesSaludInstituciones"></div>
                          <!-- Campos para insertar a tabla -->
                          <div class="form-group col-sm-12 col-md-12">
                            <div class="col-sm-12 col-md-6">
                              <label class="control-label" for="">Nombre *</label><br>
                              <input type="text" id="nombreSalud" class="form-control" value="" placeholder="Nombre de la clinica o servicio de salud">
                            </div>
                            <div class="col-sm-12 col-md-6">
                              <label class="control-label" for="">Tiempo aproximado para llegar (minutos) *</label><br>
                              <input type="number" id="tiempoSalud" class="form-control" value="">
                            </div>
                            <div class="col-sm-4 col-md-4">
                              <br>
                              <button class="btn btn-secundary" type="button" name="button" onclick="agregarInstitucionSalud()">Agregar institución de salud</button><br><br>
                            </div>
                          </div>
                          <!-- Tabla -->
                          <div class="col-sm-12 col-md-12">
                            <div class="table-responsive">
                              <table class="table  table-bordered">
                                <thead>
                                  <tr>
                                    <th class="size" scope="col">Nombre de la institución</th>
                                    <th class="size" scope="col">Tiempo de llegada (mins)</th>
                                    <th class="size" scope="col">Acción</th>

                                  </tr>
                                </thead>
                                <tbody id="institucionesSalud">
                                  <tr>
                                  </tr>
                                </tbody>
                              </table>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                <?php } ?>
                <!-- Infraestructura -->
                <?php if ($_GET['tps'] == 1 || $_GET['tps'] == 2 || $_GET['tps'] == 3) { ?>
                  <div class="panel panel-default">
                    <div class="panel-heading">
                      <h4 class="panel-tittle">
                        <a data-parent="#acordion2" data-toggle="collapse" href="#infraestructura-plantel" aria-expanded="false" aria-controls="infraestructura-plantel" class="collapsed">Infraestructura</a>
                        <button type="button" class="collpase-button collapsed" data-parent="#acordion2" data-toggle="collapse" href="#infraestructura-plantel" aria-expanded="false"></button>
                      </h4>
                    </div>
                    <div id="infraestructura-plantel" class="panel-collapse collapse">
                      <div class="panel-body">
                        <div class="form-group">
                          <div class="col-sm-col-md-12">
                            <h2>Infraestructura</h2>
                            <hr class="red">
                          </div>
                          <!-- Inputs que para POST -->
                          <div id="inputsInfraestructuras"></div>
                          <!-- Mensajes -->
                          <div id="mensajesInfraestructuras"></div>
                          <!-- Campos para insertar a tabla -->
                          <div class="form-group col-sm-12 col-md-12">
                            <div class="col-sm-12 col-md-4">
                              <label class="control-label" for="">Instalación *</label><br>
                              <select class="form-control" id="tipoInfraestructura">
                                <option value="">Seleccione una opción</option>
                              </select>
                            </div>
                            <div class="col-sm-12 col-md-8">
                              <label class="control-label" for="">Nombre </label><br>
                              <input class="form-control" type="text" id="nombreInfraestructura" value="" placeholder="Nombre del taller o laboratorio"> <br>
                            </div>
                            <div class="col-sm-12 col-md-3">
                              <label class="control-label" for="">Capacidad promedio *</label><br>
                              <input class="form-control" type="number" id="capacidadInfraestructura" value="0" placeholder="Capacidad promedio de alumnos">
                            </div>
                            <div class="col-sm-12 col-md-4">
                              <label class="control-label" for="">Metros cuadrados * </label><br>
                              <input class="form-control" type="number" id="metrosInfraestructura" placeholder="Si es virtual elegir 0" value="0"><br>
                            </div>
                            <div class="col-sm-12 col-md-4">
                              <label class="control-label" for="">Ubicación </label><br>
                              <input class="form-control" type="text" id="ubicacionInfraestructura" placeholder="Planta baja"><br>
                            </div>
                            <div class="col-sm-12 col-md-5">
                              <label class="control-label" for="">Recursos materiales *</label><br>
                              <textarea class="form-control" id="recursosInfraestructura" rows="4" placeholder="Butacas,pizarrones en caso de ser virtual escribir NA"></textarea>
                            </div>
                            <div class="col-sm-12 col-md-7">
                              <label class="control-label" for="">Asginaturas que atiende *</label><br>
                              <select id="asignaturaInfraestructura" class="selectpicker form-control" data-style="btn-default" multiple title="Asignaturas">
                                <option value="COMUN">Uso común</option>
                              </select><br><br><br><br>
                            </div>
                            <div class="col-sm-4 col-md-4">
                              <br>
                              <button class="btn btn-secundary" type="button" name="button" onclick="agregarInfraestructura()">Agregar infraestructura</button><br><br>
                            </div>
                          </div>
                          <!-- Tabla -->
                          <div class="col-sm-12 col-md-12">
                            <div class="table-responsive">
                              <table class="table  table-bordered">
                                <thead>
                                  <tr>
                                    <th class="size" scope="col">Instalación</th>
                                    <th class="size" scope="col">Capacidad (alumnos)</th>
                                    <th class="size" scope="col">Mts<sup>2</sup></th>
                                    <th class="size" scope="col">Recursos materiales</th>
                                    <th class="size" scope="col">Ubicación</th>
                                    <th class="size" scope="col">Asignaturas</th>
                                    <th class="size" scope="col">Acción</th>

                                  </tr>
                                </thead>
                                <tbody id="infraestructuras">
                                  <tr>
                                  </tr>
                                </tbody>
                              </table>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                <?php } ?>
                <?php if ($_GET['tps'] == 1) { ?>
                  <!-- Ratificación nombre -->
                  <div class="panel panel-default">
                    <div class="panel-heading">
                      <h4 class="panel-tittle">
                        <a data-parent="#acordion2" data-toggle="collapse" href="#ratificacion-nombre-plantel" aria-expanded="false" aria-controls="ratificacion-nombre-plantel" class="collapsed">Ratificación de nombre</a>
                        <button type="button" class="collpase-button collapsed" data-parent="#acordion2" data-toggle="collapse" href="#ratificacion-nombre-plantel" aria-expanded="false"></button>
                      </h4>
                    </div>
                    <div id="ratificacion-nombre-plantel" class="panel-collapse collapse">
                      <div class="panel-body">
                        <input type="hidden" id="id-ratificacion">
                        <!-- Nombres propuestos  -->
                        <div id="ratificacion-nombre" class="form-group">
                          <div class="col-sm-12 col-md-12">
                            <h2>Nombres propuestos para la institución educativa <sup>1</sup> </h2>
                            <hr class="red">
                          </div>
                          <div class="col-sm-12 col-md-8">
                            <label class="control-label" for="">Nombre propuesto:</label><br>
                            <input id="nombre_propuesto1" type="text" name="RATIFICACION-nombre_propuesto1" class="form-control " campo="Nombre propuesto para la institución" ubicacion="Plantel - Ratificación de nombre" value="" placeholder="Nombre propuesto como principal"><br>
                          </div>
                          <div class="col-sm-12 col-md-8">
                            <label class="control-label" for="">Nombre propuesto:</label><br>
                            <input id="nombre_propuesto2" type="text" name="RATIFICACION-nombre_propuesto2" class="form-control" value="" placeholder="Nombre propuesto como opcional"><br>
                          </div>
                          <div class="col-sm-12 col-md-8">
                            <label class="control-label" for="">Nombre propuesto:</label><br>
                            <input id="nombre_propuesto3" type="text" name="RATIFICACION-nombre_propuesto3" class="form-control" value="" placeholder="Nombre propuesto como opcional">
                          </div>
                          <div class="col-sm-12 col-md-8">
                            <label class="control-label" for="">Biografía o Fundamento</label>
                            <input type="hidden" id="biografia-id" name="RATIFICACION-biografia-id" value="">
                            <input type="file" onchange="Solicitud.verificarArchivo(this)" id="biografia" name="RATIFICACION-biografia" class="form-control">
                          </div>
                          <div class="col-sm-12 col-md-12" id="contenedorBiografia" style="display: none">
                            <a id="enlace-biografia" class="enlaces" href="" target="_blank">Ver archivo</a>
                            <br><br>
                          </div>
                          <div class="col-sm-12 col-md-8">
                            <label class="control-label" for="">Bibliografía para fuente de consulta</label>
                            <input type="hidden" id="bibliografia-id" name="RATIFICACION-bibliografia-id" value="">
                            <input type="file" onchange="Solicitud.verificarArchivo(this)" id="bibliografia" name="RATIFICACION-bibliografia" class="form-control">
                          </div>
                          <div class="col-sm-12 col-md-12" id="contenedorBibliografia" style="display: none">
                            <a id="enlace-bibliografia" class="enlaces" href="" target="_blank">Ver archivo</a>
                            <br><br>
                          </div>
                          <div class="col-sm-12 col-md-8">
                            <p class="text-muted small">
                              <br>
                              *Nombre de personas físicas: Se deberá anexar la biografía o fundamento por el que se hace la propuesta de nombre. En su caso, se anexará la bibliografía que sirva de fuente de consulta (autor, título de la obra, editorial, lugar y fecha de edición).

                            </p>
                          </div>
                          <div class="col-sm-12 col-md-8">
                            <br>
                            <p class="small"><sup>1</sup>Ignorar si la Institución cuenta con nombre autorizado</p>
                          </div>
                        </div>
                        <!-- Ratificación de nombre -->
                        <div id="ratificacion" class="form-group" style="display:none">
                          <div class="col-sm-12 col-md-12">
                            <h2>Ratificación de nombre</h2>
                            <hr class="red">
                          </div>
                          <div class="col-sm-12 col-md-8">
                            <label class="control-label" for="">Nombre solicitado:</label><br>
                            <input id="nombre_solicitado" type="text" name="RATIFICACION-nombre_solicitado" class="form-control" value="" placeholder="Nombre propuesto como principal"><br>
                          </div>
                          <div class="col-sm-12 col-md-8">
                            <label class="control-label" for="">Nombre autorizado:</label><br>
                            <input id="nombre_autorizado" type="text" name="RATIFICACION-nombre_autorizado" class="form-control" value="" placeholder="Nombre autorizado"><br>
                            <!-- Input de control para solicitudes 2021 -->
                            <input id="es_nombre_autorizado" type="hidden" class="form-control" value="">
                          </div>
                          <div class="col-sm-12 col-md-8">
                            <label class="control-label" for="">Acuerdo:</label><br>
                            <input id="acuerdo" type="text" name="RATIFICACION-acuerdo" class="form-control" value="" placeholder="Número de acuerdo"><br>
                          </div>
                          <div class="col-sm-12 col-md-8">
                            <label class="control-label" for="">Instancia que autoriza:</label><br>
                            <input id="autoridad" type="text" name="RATIFICACION-autoridad" class="form-control" value="" placeholder="Nombre de la instancia que autorizó"><br>
                          </div>
                        </div>

                      </div>
                    </div>
                  </div>
                <?php } ?>
              </div>
            </div>

            <!-- Anexos  -->
            <div class="tab-pane" id="tab-04">
              <div class="form-group col-sm-12 col-md-12">
                <!-- Identificación oficial -->
                <div class="col-sm-12 col-md-8">
                  <label class="control-label" for="">Identificación oficial con fotografía de la persona física, o acta constitutiva de la persona moral y poder de su Representante Legal</label><br>
                  <input type="hidden" id="identificacion-id" name="REPRESENTANTE-identificacion_representante-id" value="">
                  <input type="file" onchange="Solicitud.verificarArchivo(this)" name="REPRESENTANTE-identificacion_representante" class="form-control"><br>
                </div>
                <div class="col-sm-12 col-md-4" id="contendorIdentificacionRepresentante" style="display: none">
                  <br>
                  <br>
                  <a id="enlace-identificacionRepresentante" class="enlaces" href="" target="_blank">Ver archivo</a>
                </div>
                <!-- Comprobante de pago -->
                <div class="col-sm-12 col-md-8" id="comprobante_pago">
                  <label class="control-label" for="">Comprobante de pago</label><br>
                  <input type="hidden" id="pago-id" name="SOLICITUD-comprobante_pago-id" value="">
                  <input type="file" onchange="Solicitud.verificarArchivo(this)" name="SOLICITUD-comprobante_pago" class="form-control"><br>
                </div>
                <div class="col-sm-12 col-md-4" id="contendorPago" style="display: none">
                  <br>
                  <br>
                  <a id="enlace-pago" class="enlaces" href="" target="_blank">Ver archivo</a>
                </div>
                <?php if ($_GET['tps'] == 1 ||  $_GET['tps'] == 3) { ?>
                  <!-- Fotografías del inmueble -->
                  <div class="col-sm-12 col-md-8">
                    <label class="control-label" for="">Fotografías inmuebles </label><br>
                    <input type="hidden" id="fotografia-id" name="PLANTEL-fotografia_inmueble-id" value="">
                    <input type="file" onchange="Solicitud.verificarArchivo(this)" name="PLANTEL-fotografia_inmueble" class="form-control"><br>
                  </div>
                  <div class="col-sm-12 col-md-4" id="contendorFotografias" style="display: none">
                    <br>
                    <br>
                    <a id="enlace-fotografias" class="enlaces" href="" target="_blank">Ver archivo</a>
                  </div>
                  <!-- Infejal -->
                  <div class="col-sm-12 col-md-8">
                    <label class="control-label" for="">Constancia INFEJAL</label><br>
                    <input type="hidden" id="infejal-id" name="PLANTEL-constancia_infejal-id" value="">
                    <input type="file" onchange="Solicitud.verificarArchivo(this)" name="PLANTEL-constancia_infejal" class="form-control"><br>
                  </div>
                  <div class="col-sm-12 col-md-4" id="contendorinfejal" style="display: none">
                    <br>
                    <br>
                    <a id="enlace-infejal" class="enlaces" href="" target="_blank">Ver archivo</a>
                  </div>
                  <!-- Licencia municipal -->
                  <div class="col-sm-12 col-md-8">
                    <label class="control-label" for="">Licencia municipal</label><br>
                    <input type="hidden" id="municipal-id" name="PLANTEL-licencia_municipal-id" value="">
                    <input type="file" onchange="Solicitud.verificarArchivo(this)" name="PLANTEL-licencia_municipal" class="form-control"><br>
                  </div>
                  <div class="col-sm-12 col-md-4" id="contendormunicipal" style="display: none">
                    <br>
                    <br>
                    <a id="enlace-municipal" class="enlaces" href="" target="_blank">Ver archivo</a>
                  </div>
                  <!-- Dictamen del IMPI -->
                  <div class="col-sm-12 col-md-8">
                    <label class="control-label" for="">Dictamen del Instituto Mexicano de Propiedad Intelectual (IMPI)</label><br>
                    <input type="hidden" id="impi-id" name="INSTITUCION-dictamen_impi-id" value="">
                    <input type="file" onchange="Solicitud.verificarArchivo(this)" name="INSTITUCION-dictamen_impi" class="form-control"><br>
                  </div>
                  <div class="col-sm-12 col-md-4" id="contendorimpi" style="display: none">
                    <br>
                    <br>
                    <a id="enlace-impi" class="enlaces" href="" target="_blank">Ver archivo</a>
                  </div>
                  <!-- Salud -->
                  <div class="col-sm-12 col-md-8">
                    <label class="control-label" for="">Aviso funcionamiento de Secretaría de Salud ó Carta bajo protesta de decir verdad de NO venta de alimentos.</label><br>
                    <input type="hidden" id="salud-id" name="PLANTEL-secretaria_salud-id" value="">
                    <input type="file" onchange="Solicitud.verificarArchivo(this)" name="PLANTEL-secretaria_salud" class="form-control"><br>
                  </div>
                  <div class="col-sm-12 col-md-4" id="contendorsalud" style="display: none">
                    <br>
                    <br>
                    <a id="enlace-salud" class="enlaces" href="" target="_blank">Ver archivo</a>
                  </div>
                  <!-- Comprobante telefono -->
                  <div class="col-sm-12 col-md-8">
                    <label class="control-label" for="">Comprobante de línea telefónica</label><br>
                    <input type="hidden" id="telefonos-id" name="PLANTEL-comprobante_telefono-id" value="">
                    <input type="file" onchange="Solicitud.verificarArchivo(this)" name="PLANTEL-comprobante_telefono" class="form-control"><br>
                  </div>
                  <div class="col-sm-12 col-md-4" id="contendortelefono" style="display: none">
                    <br>
                    <br>
                    <a id="enlace-telefono" class="enlaces" href="" target="_blank">Ver archivo</a>
                  </div>
                <?php } ?>
                <?php if ($_GET["tps"] != 1) { ?>
                  <!-- Acuerdo anterior -->
                  <div class="col-sm-12 col-md-8">
                    <label class="control-label" for="">Acuerdo anterior</label><br>
                    <input type="hidden" id="acuerdoAnterior-id" name="PROGRAMA-acuerdo_anterior-id" value="">
                    <input type="file" onchange="Solicitud.verificarArchivo(this)" name="PROGRAMA-acuerdo_anterior" class="form-control"><br>
                  </div>
                  <div class="col-sm-12 col-md-4" id="contendoracuerdo" style="display: none">
                    <br>
                    <br>
                    <a id="enlace-acuerdo" class="enlaces" href="" target="_blank">Ver archivo</a>
                  </div>
                <?php } ?>
                <?php if ($_GET['tps'] == 1 ||  $_GET['tps'] == 2) { ?>
                  <!-- Vinculacion y movilidad -->
                  <div class="col-sm-12 col-md-8">
                    <label class="control-label" for="">Proyecto de vinculación y movilidad</label><br>
                    <input type="hidden" id="vinculacion-id" name="PROGRAMA-proyecto_vinculacion-id" value="">
                    <input type="file" onchange="Solicitud.verificarArchivo(this)" name="PROGRAMA-proyecto_vinculacion" class="form-control"><br>
                  </div>
                  <div class="col-sm-12 col-md-4" id="contendorvinculacion" style="display: none">
                    <br>
                    <br>
                    <a id="enlace-vinculacion" class="enlaces" href="" target="_blank">Ver archivo</a>
                  </div>
                  <!-- Plan mejora -->
                  <div class="col-sm-12 col-md-8">
                    <label class="control-label" for="">Plan de mejora</label><br>
                    <input type="hidden" id="mejora-id" name="PROGRAMA-plan_mejora-id" value="">
                    <input type="file" onchange="Solicitud.verificarArchivo(this)" name="PROGRAMA-plan_mejora" class="form-control"><br>
                  </div>
                  <div class="col-sm-12 col-md-4" id="contendormejora" style="display: none">
                    <br>
                    <br>
                    <a id="enlace-mejora" class="enlaces" href="" target="_blank">Ver archivo</a>
                  </div>
                  <!-- Programa de superacion -->
                  <div class="col-sm-12 col-md-8">
                    <label class="control-label" for="">Programa de superación</label><br>
                    <input type="hidden" id="superacion-id" name="PROGRAMA-programa_superacion-id" value="">
                    <input type="file" onchange="Solicitud.verificarArchivo(this)" name="PROGRAMA-programa_superacion" class="form-control"><br>
                  </div>
                  <div class="col-sm-12 col-md-4" id="contendorsuperacion" style="display: none">
                    <br>
                    <br>
                    <a id="enlace-superacion" class="enlaces" href="" target="_blank">Ver archivo</a>
                  </div>
                <?php } ?>
              </div>
            </div>

            <!-- Evaluación curricular -->
            <div class="tab-pane" id="tab-05">
              <div class="panel-group ficha-collapse" role="tablist" id="acordion5">
                <!-- Evaluación -->
                <div class="panel panel-default">
                  <div class="panel-heading">
                    <h4 class="panel-tittle">
                      <a data-parent="#acordion5" data-toggle="collapse" href="#evaluacion" aria-expanded="false" aria-controls="evaluacion" class="collapsed">Datos de la evaluaci&oacute;n </a>
                      <button type="button" class="collpase-button collapsed" data-parent="#acordion5" data-toggle="collapse" href="#evaluacion" aria-expanded="false"></button>
                    </h4>
                  </div>
                  <div id="evaluacion" class="panel-collapse collapse">
                    <div class="panel-body">
                      <!-- Datos generales de evaluación -->
                      <div class="form-group">
                        <div class="col-sm-col-md-12">
                          <h2>Datos generales de la evaluaci&oacute;n curricular</h2>
                          <input type="hidden" id="evaluacion_id" name="EVALUACION-id" value="">
                          <hr class="red">
                        </div>
                        <div class="row">
                          <div class="col-sm-6 col-md-6">
                            <label class="control-label" for="">Nombre del programa</label><br>
                            <input type="text" id="programa_evaluacion" name="EVALUACION-programa" class="form-control " campo="Nombre del programa" ubicacion="Datos generales apartado evaluacion" value="" placeholder="Nombre del programa" disabled>
                            <input type="hidden" id="programa_id_evaluacion" name="EVALUACION-programa_id" class="form-control " ubicacion="Datos generales apartado evaluacion" value="">
                          </div>
                          <div class="col-sm-6 col-md-4">
                            <label class="control-label" for="">Fecha de dictamen *</label><br>
                            <input type="text" id="fecha_evaluacion" name="EVALUACION-fecha" class="form-control " campo="Fecha de evaluacion" ubicacion="Datos generales apartado evaluacion" value="" placeholder="Fecha de evaluacion">
                          </div>
                        </div>
                        <br>
                        <div class="row">
                          <div class="col-sm-6 col-md-6">
                            <label class="control-label" for="">Evaluador *</label><br>
                            <select class="form-control selectpicker" id="lista_evaluadores" name="EVALUACION-evaluador_id" title="Seleccione una opción">
                              <option value=""></option>
                            </select><br>
                          </div>
                        </div>
                        <br>
                        <div class="row">
                          <div class="col-sm-6 col-md-3">
                            <label class="control-label" for="">Cumplimiento num&eacute;rico *</label><br>
                            <input type="text" id="numero_evaluacion" name="EVALUACION-numero" class="form-control " campo="Numero de evaluación" ubicacion="Datos generales apartado evaluacion" value="" onchange='EditarSolicitud.resultadoEvaluacion(this)' placeholder="Puntuación">
                          </div>
                          <div class="col-sm-6 col-md-3">
                            <label class="control-label" for="">Porcentaje</label><br>
                            <input type="text" id="cumplimiento_evaluacion" name="EVALUACION-cumplimiento" class="form-control" value="" placeholder="Cumplimiento %" disabled>
                            <input type="hidden" id="cumplimiento_evaluacion_input" name="EVALUACION-cumplimiento" class="form-control" value="" placeholder="Cumplimiento %">
                          </div>
                          <div class="col-sm-6 col-md-6">
                            <label class="control-label" for="">Calificaci&oacute;n</label><br>
                            <input type="text" id="tipo_cumplimiento_evaluacion" class="form-control" ubicacion="Datos generales apartado evaluacion" value="" placeholder="" disabled>
                            <input type="hidden" id="cumplimiento_id_evaluacion" name="EVALUACION-cumplimiento_id" class="form-control" campo="cumplimiento_id" ubicacion="Datos generales apartado evaluacion" value="" placeholder="">
                          </div>
                        </div>
                        <div class="row">
                          <div class="col-sm-12 col-md-12">
                            <label class="control-label" for="">Valoraci&oacute;n Cualitativa</label><br>
                            <textarea class="form-control" id="valoracion_evaluacion" campo="Valoración cualitativa" ubicacion="Datos generales apartado evaluacion" name="EVALUACION-valoracion" rows="3" placeholder=""></textarea>
                            <br>
                          </div>
                        </div>
                        <div class="row">
                          <!-- Dictamen de evaluación -->
                          <div class="col-sm-12 col-md-8">
                            <label class="control-label" for="">Dictamen de evaluaci&oacute;n</label><br>
                            <input type="hidden" id="dictamen-id" name="EVALUACION-dictamen_evaluacion-id" value="">
                            <input type="file" onchange="Solicitud.verificarArchivo(this)" name="EVALUACION-dictamen_evaluacion" class="form-control"><br>
                          </div>
                          <div class="col-sm-12 col-md-4" id="contendordictamen" style="display: none">
                            <br>
                            <br>
                            <a id="enlace-dictamen" class="enlaces" href="" target="_blank">Ver archivo</a>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <!-- Mensajes generales para todo el formulario -->
            <div id="mesage">
              <?php if (isset($resultado) && isset($resultado->status) && $resultado->status != "200") : ?>
                <div class="alert alert-danger">
                  <p><?= $resultado->message ?></p>
                </div>
              <?php endif; ?>
            </div>

            <!-- Controles formulario  -->
            <div class="col-sm-12 col-md-12">
              <input type="hidden" id="webService" name="webService" value="guardarSolicitud" />
              <input type="hidden" id="url" name="url" value="../views/mis-solicitudes.php" />
              <!-- TODO: asignar estatus y tipo de solicitud -->
              <input type="hidden" name="opcion_guardado" value="2">
              <input type="hidden" id="editar" value="<?= $_GET["editar"] ?>">
              <input type="hidden" id="id_solicitud" name="SOLICITUD-id" value="<?= $_GET["solicitud"] ?>">
              <input type="hidden" id="estatus_solicitud" name="SOLICITUD-estatus_solicitud_id" value="1" />
              <input type="hidden" id="tipo" name="SOLICITUD-tipo_solicitud_id" value="<?= $_GET["tps"] ?>" />
              <input type="hidden" id="id_usuario" value="<?= $_SESSION["id"] ?>" />
              <input type="hidden" id="convocatoria" name="SOLICITUD-convocatoria" value="" />
              <?php if ([$_SESSION][0]["rol_id"] == 3) { ?>
                <button id="btnTerminar" type="button" class="btn btn-primary pull-right" onclick="Solicitud.camposLlenos()">Terminar solicitud</button>
              <?php } ?>
              <button id="btnGuardar" type="button" name="" class="btn btn-default pull-right" style="margin-right: 10px;" onclick="limpiarInputs()"> Guardar solicitud</button>
              <!-- Filtrar informacion a cargar  -->
              <input type="hidden" id="opcionSolicitud" name="opcionSolicitud" value="">
              <!-- <input type="hidden" id="informacionCargar" value="2"> -->
              <input type="hidden" id="datosNecesarios" value="<?= $_GET["dt"] ?>">
              <input type="hidden" id="auxmodalidad" value="<?= $_GET["modalidad"] ?>">
              <input type="hidden" id="masDatos" value="<?= $_GET["odt"] ?>">
            </div>
          </div>
        </form>
      </div>
    </section>
    <!-- Modal para mensaje de errores -->
    <div class="modal fade" id="modalErrores" tabindex="-1" role="dialog" aria-hidden="true">
      <div id="tamanoModal" class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title">Campos por llenar</h4>
          </div>
          <div class="modal-body">
            <div id="mensajesError">

            </div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
          </div>
        </div>

      </div>
    </div>
    <!-- Modal para confirmación -->
    <div class="modal fade" id="modalConfirmacion" role="dialog">
      <div id="tamanoModales" class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title">Confirmación</h4>
          </div>
          <div class="modal-body">
            <div id="mensajesTerminar" class="alert alert-info">
              <p class="text-justify">
              <p class="text-center">Estimada Institución, recuerda que la fecha oficial de recepción de la solicitud será al momento de la entrega de la documentación en físico.<br>
                No olvides llenar todos los campos y respetar las reglas gramaticales (mayúsculas y minúsculas).
              </p>
            </div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
            <button id="boton-terminar" type="button" class="btn btn-primary" onclick="Solicitud.terminar()">Aceptar</button>
          </div>
        </div>
      </div>
    </div>

    <!-- Modal para convocatoria 2021 -->
    <div class="modal fade" id="modalFueraDeConvocatoria" role="dialog">
      <div id="tamanoModal2021" class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title">¡Aviso importante!</h4>
          </div>
          <div class="modal-body">
            <div id="mensajeConvocatoria2021" class="">
              <p class="text-justify">
              <p class="text-center">¡Estimada institución!</p>
              El periodo de envío de solicitudes para la obtención de RVOE se habilitará en los meses de Enero/Febrero 2022
              Está atento a las fechas para envío de solicitudes.
              Antes del envío de solicitud, se recomienda llenar todos los campos de la solicitud dando clic en el botón Guardar Solicitud. "
              Recuerda que la fecha de recepción oficial será la fecha de entrega de documentos de forma física.
              No olvides llenar todos los campos y respetar las reglas gramaticales (mayúsculas y minúsculas).<br>
              </p>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Modal para aviso de término de convocatoria 2019 -->
    <div class="modal fade" id="modalConvocatoria" role="dialog">
      <div id="tamanoModalConvocatoria" class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title">¡Aviso importante!</h4>
          </div>
          <div class="modal-body">
            <div id="mensajeConvocatoriaExpirada" class="">
              <p class="text-justify">
              <p class="text-center">¡Estimada institución!</p>
              El periodo para subir tu solicitud para la convocatoria de RVOE 2020 con vigencia el día 18 de Diciembre de 2020 ha expirado.<br>
              Está atento a las fechas de nuestra próxima convocatoria de RVOE 2021.<br>
              </p>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Modal para mostrar archivos -->
    <div class="modal fade" id="modalArchivos" tabindex="-1" role="dialog" aria-hidden="true">
      <div id="tamanoModalArchivo" class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title">Campos por llenar</h4>
          </div>
          <div class="modal-body">
            <iframe id="archivo-mostrar" src="" width="100%" height="50%"></iframe>
          </div>
          <div class="modal-footer">
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
  <!-- JS CALENDAR -->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <!-- JS MAPS -->
  <script src="https://unpkg.com/leaflet@1.3.3/dist/leaflet.js" integrity="sha512-tAGcCfR4Sc5ZP5ZoVz0quoZDYX5aCtEm/eu1KhSLj2c9eFrylXZknQYmxUssFaVJKvvc0dJQixhGjG2yXWiV9Q==" crossorigin=""></script>
  <script src="https://unpkg.com/esri-leaflet@2.2.2/dist/esri-leaflet.js" integrity="sha512-cll/dcqNKG7yfQBrTbRNzGQ70Bh4m+J5jnvU97tPyMnWsD1Ry+CXi0JE+T7Rk54pdJEYlRgXtpwxa9sUqzUAyg==" crossorigin=""></script>
  <script src="https://unpkg.com/esri-leaflet-geocoder@2.2.13/dist/esri-leaflet-geocoder.js" integrity="sha512-zdT4Pc2tIrc6uoYly2Wp8jh6EPEWaveqqD3sT0lf5yei19BC1WulGuh5CesB0ldBKZieKGD7Qyf/G0jdSe016A==" crossorigin=""></script>
  <script src="../js/funciones.js"></script>
  <script src="../js/solicitudes.js"></script>
  <script src="../js/editar-solicitudes.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA_4zHAnZD2kXiCf3UIyoWn2lpB4FK3fy0&amp;callback=setMapa" async="" defer=""></script>

</body>

</html>