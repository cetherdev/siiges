<?php

/**
 * Archivo que gestiona los web services de la clase Plantel
 */

require_once "../models/modelo-plantel.php";
require_once "../models/modelo-domicilio.php";
require_once "../models/modelo-usuario.php";
require_once "../models/modelo-institucion.php";
require_once "../models/modelo-documento.php";
require_once "../models/modelo-persona.php";
require_once "../models/modelo-programa.php";
require_once "../utilities/utileria-general.php";
require_once "../models/modelo-formacion.php";
require_once "../models/modelo-nivel.php";
require_once "../models/modelo-experiencia.php";
require_once "../models/modelo-publicacion.php";
require_once "../models/modelo-plantel-dictamen.php";
require_once "../models/modelo-plantel-edificio-nivel.php";
require_once "../models/modelo-edificio-nivel.php";
require_once "../models/modelo-plantel-seguridad-sistema.php";
require_once "../models/modelo-seguridad-sistema.php";
require_once "../models/modelo-higiene.php";
require_once "../models/modelo-plantel-higiene.php";
require_once "../models/modelo-salud-institucion.php";
require_once "../models/modelo-infraestructura.php";
require_once "../models/modelo-tipo-instalacion.php";
require_once "../models/modelo-ratificacion-nombre.php";
require_once "../models/modelo-bitacora.php";
require_once "../models/modelo-solicitud.php";
session_start();


function retornarWebService($url, $resultado)
{
  if ($url != "") {
    header("Location: $url");
    exit();
  } else {
    echo json_encode($resultado);
    exit();
  }
}

//====================================================================================================

// Web service para consultar todos los registros
if ($_POST["webService"] == "consultarTodos") {
  $obj = new Plantel();
  $obj->setAttributes(array());
  $resultado = $obj->consultarTodos();
  // Registro en bitacora
  /* $bitacora = new Bitacora();
      $usuarioId= isset($_SESSION["id"])?$_SESSION["id"]:-1;
      $bitacora->setAttributes(["usuario_id"=>$usuarioId,"entidad"=>"planteles","accion"=>"consultarTodos","lugar"=>"control-plantel"]);
      $result = $bitacora->guardar(); */
  retornarWebService($_POST["url"], $resultado);
}

// Web service para consultar registro por id
if ($_POST["webService"] == "consultarId") {
  $obj = new Plantel();
  $aux = new Utileria();
  $_POST = $aux->limpiarEntrada($_POST);
  $obj->setAttributes(array("id" => $_POST["id"]));
  $resultado = $obj->consultarId();
  $domicilio = new Domicilio();
  if ($resultado["status"] != "404") {
    //print_r($resultado);
    $resultado['data']['domicilio'] = $domicilio->consultarPor('domicilios', array('id' => $resultado['data']['domicilio_id']), '*');
    $usuario = new Usuario();
    $usuario2 = new Usuario();
    if ($resultado['data']['rector_id']) {
      $resultado['data']['rector'] = $usuario->consultarPor('personas', array('id' => $resultado['data']['rector_id']), "*");
    }
    $resultado['data']['director'] = $usuario2->consultarPor('personas', array('id' => $resultado['data']['persona_id']), "*");
    unset($obj);
    unset($domicilio);
  }

  // Registro en bitacora
  /* $bitacora = new Bitacora();
      $usuarioId= isset($_SESSION["id"])?$_SESSION["id"]:-1;
      $bitacora->setAttributes(["usuario_id"=>$usuarioId,"entidad"=>"planteles","accion"=>"consultarId","lugar"=>"control-plantel"]);
      $result = $bitacora->guardar(); */
  retornarWebService($_POST["url"], $resultado);
}

// Web service para guardar registro
if ($_POST["webService"] == "guardar") {
  $parametros = array();
  $aux = new Utileria();
  $_POST = $aux->limpiarEntrada($_POST);
  foreach ($_POST as $atributo => $valor) {
    $parametros[$atributo] = $valor;
  }
  $obj = new Plantel();
  $obj->setAttributes($parametros);
  $resultado = $obj->guardar();
  // Registro en bitacora
  /* $bitacora = new Bitacora();
      $usuarioId= isset($_SESSION["id"])?$_SESSION["id"]:-1;
      $bitacora->setAttributes(["usuario_id"=>$usuarioId,"entidad"=>"planteles","accion"=>"guardar","lugar"=>"control-plantel"]);
      $result = $bitacora->guardar(); */
  retornarWebService($_POST["url"], $resultado);
}

// Web service para eliminar registro
if ($_POST["webService"] == "eliminar") {
  $obj = new Plantel();
  $aux = new Utileria();
  $_POST = $aux->limpiarEntrada($_POST);
  $obj->setAttributes(array("id" => $_POST["id"]));
  $resultado = $obj->eliminar();
  // Registro en bitacora
  /* $bitacora = new Bitacora();
      $usuarioId= isset($_SESSION["id"])?$_SESSION["id"]:-1;
      $bitacora->setAttributes(["usuario_id"=>$usuarioId,"entidad"=>"planteles","accion"=>"eliminar","lugar"=>"control-plantel"]);
      $result = $bitacora->guardar(); */
  retornarWebService($_POST["url"], $resultado);
}
// Web service para guardar direccion de plantel
if ($_POST["webService"] == "guardarInformacion") {
  $aux = new Utileria();
  $_POST = $aux->limpiarEntrada($_POST);
  foreach ($_POST as $atributo => $valor) {
    $parametros[$atributo] = $valor;
  }
  $domicilio = new Domicilio();
  $domicilio->setAttributes($parametros);
  $res_domicilio = $domicilio->guardar();

  $rector = new Persona();
  $rector->setAttributes(array("domicilio_id" => $res_domicilio["data"]["id"], "nombre" => $_POST["nombre_rector"], "apellido_paterno" => $_POST["apellido_paterno_rector"], "apellido_materno" => $_POST["apellido_materno_rector"]));
  $res_rector = $rector->guardar();

  $director = new Persona();
  $director->setAttributes(array("domicilio_id" => $res_domicilio["data"]["id"], "nombre" => $_POST["nombre"], "apellido_paterno" => $_POST["apellido_paterno"], "apellido_materno" => $_POST["apellido_materno"]));
  $res_director = $director->guardar();

  $parametros["domicilio_id"] = $res_domicilio["data"]["id"];
  $parametros["rector_id"] = $res_rector["data"]["id"];
  $parametros["persona_id"] = $res_director["data"]["id"];

  $plantel = new Plantel();
  $plantel->setAttributes($parametros);
  $resultado = $plantel->guardar();

  // Registro en bitacora
  /* $bitacora = new Bitacora();
    $usuarioId= isset($_SESSION["id"])?$_SESSION["id"]:-1;
    $bitacora->setAttributes(["usuario_id"=>$usuarioId,"entidad"=>"planteles","accion"=>"guardarInformacion","lugar"=>"control-plantel"]);
    $result = $bitacora->guardar(); */
  retornarWebService($_POST["url"], $resultado);
}

if ($_POST["webService"] == "actualizarInformacion") {
  $aux = new Utileria();
  $_POST = $aux->limpiarEntrada($_POST);
  foreach ($_POST as $atributo => $valor) {
    $parametros[$atributo] = $valor;
  }
  $parametros["id"] = $_POST["domicilio_id"];
  $domicilio = new Domicilio();
  $domicilio->setAttributes($parametros);
  $domicilio->guardar();

  $parametros_rector["id"] = $_POST["rector_id"];
  $parametros_rector["nombre"] = $_POST["nombre_rector"];
  $parametros_rector["apellido_paterno"] = $_POST["apellido_paterno_rector"];
  $parametros_rector["apellido_materno"] = $_POST["apellido_materno_rector"];
  $rector = new Persona();
  $rector->setAttributes($parametros_rector);
  $res_rector = $rector->guardar();

  $parametros["id"] = $_POST["director_id"];
  $director = new Persona();
  $director->setAttributes($parametros);
  $director->guardar();

  $parametros["id"] = $_POST["plantel_id"];
  $parametros["rector_id"] = $res_rector["data"]["id"];
  $plantel = new Plantel();
  $plantel->setAttributes($parametros);
  $resultado = $plantel->guardar();

  // Registro en bitacora
  /* $bitacora = new Bitacora();
    $usuarioId= isset($_SESSION["id"])?$_SESSION["id"]:-1;
    $bitacora->setAttributes(["usuario_id"=>$usuarioId,"entidad"=>"planteles","accion"=>"actualizarInformacion","lugar"=>"control-plantel"]);
    $result = $bitacora->guardar(); */
  retornarWebService($_POST["url"], $resultado);
}

//Obtener informacion del plantel con sus tablas relacionadas
if ($_POST["webService"] == "plantelPorId") {

  //session_start();
  $resultado["status"] = "200";
  $resultado["mesagge"] = "OK";
  if (isset($_SESSION["id"])) {
    $institucion = new Institucion();
    $res_institucion = $institucion->consultarPor("instituciones", array("usuario_id" =>  $_SESSION["id"], "deleted_at"), "*");
    if (sizeof($res_institucion["data"]) > 0) {
      $plantel = new Plantel();
      $plantel->setAttributes(array("id" => $_POST["plantelId"]));
      $respuestaPlantel = $plantel->informacionRelacionada();

      if ($respuestaPlantel["status"] == "200" && $respuestaPlantel["data"]["institucion_id"] == $res_institucion["data"][0]["id"]) {
        $resultado["data"]["institucion"] = $res_institucion["data"][0];

        $ratificacion = new RatificacionNombre();
        $resultado_ratificacion = $ratificacion->consultarPor("ratificacion_nombres", array("institucion_id" =>  $res_institucion["data"][0]["id"], "deleted_at"), "*");
        if (sizeof($resultado_ratificacion["data"]) > 0) {
          $resultado["data"]["ratificacion"] =  $resultado_ratificacion["data"][0];
        }
        $resultado["data"]["plantel"] = $respuestaPlantel["data"];
        //Dictamenes
        $dictamen = new PlantelDictamen();
        $dictamenes = $dictamen->consultarPor("plantel_dictamenes", array("plantel_id" => $resultado["data"]["plantel"]["id"], "deleted_at"), "*");
        if (sizeof($dictamenes["data"]) > 0) {
          $resultado["data"]["plantel"]["dictamenes"] = $dictamenes["data"];
        }
        //Plantel edificios
        $edificio = new PlantelEdificioNivel();
        $niveles = $edificio->consultarPor("planteles_edificios_niveles", array("plantel_id" => $resultado["data"]["plantel"]["id"], "deleted_at"), "*");
        if (sizeof($niveles["data"]) > 0) {
          foreach ($niveles["data"] as $posicionNivel => $arregloNiveles) {
            $nivel = new EdificioNivel();
            $nivel->setAttributes(array('id' => $arregloNiveles["edificio_nivel_id"]));
            $nivel_temp = $nivel->consultarId();
            $niveles["data"][$posicionNivel]["nivel"] = $nivel_temp["data"];
          }
          $resultado["data"]["plantel"]["edificios"] = $niveles["data"];
        }

        //Seguridades
        $seguridad = new PlantelSeguridadSistema();
        $seguridades = $seguridad->consultarPor("planteles_seguridad_sistemas", array("plantel_id" => $resultado["data"]["plantel"]["id"], "deleted_at"), "*");
        if (sizeof($seguridades["data"]) > 0) {
          foreach ($seguridades["data"] as $indiceSeguridad => $arregloSeguridad) {
            $seguridad = new SeguridadSistema();
            $seguridad->setAttributes(array('id' => $arregloSeguridad["seguridad_sistema_id"]));
            $seguridad_temp = $seguridad->consultarId();
            $seguridades["data"][$indiceSeguridad]["tipo_seguridad"] = $seguridad_temp["data"];
          }
          $resultado["data"]["plantel"]["seguridades"] =   $seguridades["data"];
        }

        //Plantel higienes
        $plantelHigiene = new PlantelHigiene();
        $higienes = $plantelHigiene->consultarPor("planteles_higienes", array("plantel_id" => $resultado["data"]["plantel"]["id"], "deleted_at"), "*");
        if (sizeof($higienes["data"]) > 0) {
          foreach ($higienes["data"] as $indiceHigiene => $arregloHigiene) {
            $higiene = new Higiene();
            $higiene->setAttributes(array('id' => $arregloHigiene["higiene_id"]));
            $higiene_temp = $higiene->consultarId();
            $higienes["data"][$indiceHigiene]["tipo_higiene"] = $higiene_temp["data"];
          }
          $resultado["data"]["plantel"]["higienes"] =   $higienes["data"];
        }
        //Institcuiones de salud
        $salud = new SaludInstitucion();
        $instituciones_salud = $salud->consultarPor("salud_instituciones", array("plantel_id" => $resultado["data"]["plantel"]["id"], "deleted_at"), "*");
        $instituciones_salud = $instituciones_salud["data"];
        if (sizeof($instituciones_salud) > 0) {
          $resultado["data"]["plantel"]["instituciones_salud"] = $instituciones_salud;
        }
        //Infraestructura del plantel (No se imparten clase)
        $infraestructura = new Infraestructura();
        $infraestructuras = $infraestructura->consultarPor("infraestructuras", array("plantel_id" => $resultado["data"]["plantel"]["id"], "deleted_at"), '*');
        $infraestructuras = $infraestructuras["data"];

        if (sizeof($infraestructuras) > 0) {
          //Obtener infraestructuras de uso común
          $infraestructura_final = array();
          foreach ($infraestructuras as $key => $value) {
            if ($value["tipo_instalacion_id"] == 2 ||  $value["tipo_instalacion_id"] == 3 || $value["tipo_instalacion_id"] == 9 || $value["tipo_instalacion_id"] == 10 || $value["tipo_instalacion_id"] == 11) {
              $value["instalacion"] = [];
              $temporal_instalacion = new TipoInstalacion();
              $temporal_instalacion->setAttributes(array('id' => $value["tipo_instalacion_id"]));
              $resultado_temp = $temporal_instalacion->consultarId();
              $value["instalacion"] = $resultado_temp["data"];
              array_push($infraestructura_final, $value);
              //$infraestructuras_final["instalacion"] = $resultado_temp["data"];
            }
          }
          $resultado["data"]["plantel"]["infraestructura"] = $infraestructura_final;
        }
      } else {
        $resultado["data"] = "";
      }
    } else {
      $resultado["data"] = "";
    }
  } else {
    $resultado["status"] = "202";
    $resultado["mesagge"] = "NO DATA";
    $resultado["data"]  = "";
  }

  // Registro en bitacora
  /* $bitacora = new Bitacora();
      $usuarioId= isset($_SESSION["id"])?$_SESSION["id"]:-1;
      $bitacora->setAttributes(["usuario_id"=>$usuarioId,"entidad"=>"planteles","accion"=>"plantelPorId","lugar"=>"control-plantel"]);
      $result = $bitacora->guardar(); */
  retornarWebService($_POST["url"], $resultado);
}
//Obtener la información basica de los planteles para la vista de mis solicitudes
if ($_POST["webService"] == "informacionBasica") {
  //session_start();
  $resultado["status"] = "200";
  $resultado["mesagge"] = "OK";
  if (isset($_SESSION["id"])) {
    $institucion = new Institucion();
    $idUsuario = $_SESSION["id"];
    if ($_SESSION["rol_id"] == 4) {
      $gestor = new Usuario();
      $representanteGestor = $gestor->consultarPor("usuario_usuarios", array("secundario_id" => $_SESSION["id"]), "*");
      $idUsuario = $representanteGestor["data"][0]["principal_id"];
    } else if ($_SESSION["rol_id"] == 2 || $_SESSION["rol_id"] >= 7) {
      $solicitud = new Solicitud();
      $solicitud->setAttributes(array("id" => $_POST["solicitud_id"]));
      $res_solicitud = $solicitud->consultarId();
      $idUsuario = $res_solicitud["data"]["usuario_id"];
    }
    $res_institucion = $institucion->consultarPor("instituciones", array("usuario_id" =>  $idUsuario, "deleted_at"), "*");

    if (sizeof($res_institucion["data"]) > 0) {
      $resultado["data"]["institucion"] = $res_institucion["data"][0];
      $ratificacion = new RatificacionNombre();
      $resultado_ratificacion = $ratificacion->consultarPor("ratificacion_nombres", array("institucion_id" =>  $res_institucion["data"][0]["id"]), "*");
      if (sizeof($resultado_ratificacion["data"]) > 0) {
        $resultado["data"]["ratificacion"] =  $resultado_ratificacion["data"][0];
      }
      $plantel = new Plantel();
      $planteles = $plantel->consultarPor("planteles", array("institucion_id" =>  $res_institucion["data"][0]["id"], "deleted_at"), "id,domicilio_id");
      if (sizeof($planteles["data"]) > 0) {
        $resultado["data"]["planteles"] = $planteles["data"];
        foreach ($resultado["data"]["planteles"] as $indice => $arreglo) {
          //Domicilio del plantel
          $domicilio = new Domicilio();
          $domicilio->setAttributes(array("id" => $resultado["data"]["planteles"][$indice]["domicilio_id"]));
          $res_domicilio = $domicilio->consultarId();
          if (sizeof($res_domicilio["data"]) > 0) {
            $resultado["data"]["planteles"][$indice]["domicilio"] = $res_domicilio["data"];
          }
        }
      }
    } else {
      $resultado["data"] = "";
    }
  } else {
    $resultado["status"] = "202";
    $resultado["mesagge"] = "NO DATA";
    $resultado["data"]  = "";
  }

  // Registro en bitacora
  /* $bitacora = new Bitacora();
      $usuarioId= isset($_SESSION["id"])?$_SESSION["id"]:-1;
      $bitacora->setAttributes(["usuario_id"=>$usuarioId,"entidad"=>"planteles","accion"=>"informacionBasica","lugar"=>"control-plantel"]);
      $result = $bitacora->guardar(); */
  retornarWebService($_POST["url"], $resultado);
}

//Planteles activos para vista instituciones
if ($_POST["webService"] == "plantelesActivos") {
  $institucion = new Institucion();
  $instituciones = $institucion->consultarTodos();
  $tabla = "";
  if (sizeof($instituciones["data"]) > 0) {
    $instituciones = $instituciones["data"];
    $planteles = array();
    foreach ($instituciones as $posicion => $campo) {
      $plantel = new Plantel();
      $res_plantel = $plantel->consultarPor("planteles", array("institucion_id" => $campo["id"], "deleted_at"), array("id", "domicilio_id", "clave_centro_trabajo"));
      $res_plantel = $res_plantel["data"];
      if (sizeof($res_plantel) > 0) {
        foreach ($res_plantel as $key => $value) {
          $domicilio = new Domicilio();
          $domicilio->setAttributes(array("id" => $value["domicilio_id"]));
          $res_domicilio = $domicilio->consultarId();
          $repre = new Usuario();
          $id_persona = $repre->consultarPor("usuarios", array("id" => $campo["usuario_id"]), "persona_id");
          if (sizeof($id_persona["data"]) > 0) {
            $id_persona = $id_persona["data"][0]["persona_id"];
            $persona = new Persona();
            $nombre_representante = $persona->consultarPor("personas", array("id" => $id_persona), "*");
            $nombre_representante = $nombre_representante["data"][0];
          }
          $temp["id"] = $value["id"];
          $temp["cct"] = $value["clave_centro_trabajo"];
          $temp["domicilio"] = $res_domicilio["data"]["numero_exterior"] . " " . $res_domicilio["data"]["calle"] . " " . $res_domicilio["data"]["municipio"];
          $temp["institucion"] = $campo["nombre"];
          $temp["representante"] = $nombre_representante["nombre"] . " " . $nombre_representante["apellido_paterno"] . " " . $nombre_representante["apellido_materno"];
          $editar = "<a  href='#' onclick='Planteles.datosModal(" . $temp["id"] . ")'><span class='glyphicon glyphicon-pencil'></span></a>";
          $temp["acciones"] = $editar;

          array_push($planteles, $temp);
        }
      }
    }

    // Registro en bitacora
    /* $bitacora = new Bitacora();
          $usuarioId= isset($_SESSION["id"])?$_SESSION["id"]:-1;
          $bitacora->setAttributes(["usuario_id"=>$usuarioId,"entidad"=>"planteles","accion"=>"plantelesActivos","lugar"=>"control-plantel"]);
          $result = $bitacora->guardar(); */

    $resultado["data"] = "";
  } else {
    $resultado["status"] = "202";
    $resultado["mesagge"] = "NO DATA";
    $resultado["data"]  = "";
  }
  retornarWebService($_POST["url"], $planteles);
}

//Actualizar CCT del plantel
if ($_POST["webService"] == "actualizarCCT") {
  $parametros = array();
  $aux = new Utileria();
  $_POST = $aux->limpiarEntrada($_POST);
  foreach ($_POST as $atributo => $valor) {
    $parametros[$atributo] = $valor;
  }
  $obj = new Plantel();
  $obj->setAttributes($parametros);
  if (!empty($_FILES)) {
    $archivo = $_FILES["archivo_cct"];
    $extension =  strrchr($archivo["name"], '.');
    $nombre_archivo = "clave-centro-trabajo_" . $_POST["id"] . $extension;
    //Subimos el archivo
    $ruta = Documento::$dir_subida . "claves-cct/";
    $uploadFile = $ruta . $nombre_archivo;
    !is_dir($ruta) ? mkdir($ruta, 0755) : false;
    //Guardar el archivo
    if (move_uploaded_file($archivo["tmp_name"], $uploadFile)) {
      $id =   $obj->guardar();
      if (sizeof($id["data"]) > 0) {
        $id = $id["data"]["id"];
        $documento = new Documento();
        $parametrosDocumento["tipo_entidad"] = 5;
        $parametrosDocumento["tipo_documento"] = 30;
        $parametrosDocumento["entidad_id"] = $id;
        $parametrosDocumento["nombre"] = $nombre_archivo;
        $parametrosDocumento["archivo"] = $uploadFile;
        $documento->setAttributes($parametrosDocumento);
        $documento->guardar();
        $resultado = array(
          "status" => "200",
          "message" => "OK",
          "data" => ""
        );
      } else {
        $resultado = array(
          "status" => "500",
          "message" => "INTERNAL SERVER ERROR",
          "data" => "El archivo no se pudo subir al servidor"
        );
      }
    }
  }
  // Registro en bitacora
  /* $bitacora = new Bitacora();
        $usuarioId= isset($_SESSION["id"])?$_SESSION["id"]:-1;
        $bitacora->setAttributes(["usuario_id"=>$usuarioId,"entidad"=>"planteles","accion"=>"actualizarCCT","lugar"=>"control-plantel"]);
        $result = $bitacora->guardar(); */
  retornarWebService($_POST["url"], $resultado);
}
