<?php

/**
 * Archivo que gestiona los web services de la clase Alumno
 */

require_once "../models/modelo-alumno.php";
require_once "../models/modelo-bitacora.php";
require_once "../models/modelo-persona.php";
require_once "../models/modelo-documento.php";
require_once "../utilities/utileria-general.php";

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
  $obj = new Alumno();
  $obj->setAttributes(array());
  $resultado = $obj->consultarTodos();
  // Registro en bitacora
  /* $bitacora = new Bitacora();
    $usuarioId= isset($_SESSION["id"])?$_SESSION["id"]:-1;
    $bitacora->setAttributes(["usuario_id"=>$usuarioId,"entidad"=>"alumnos","accion"=>"consultarTodos","lugar"=>"control-alumno"]);
    $result = $bitacora->guardar(); */
  retornarWebService($_POST["url"], $resultado);
}

// Web service para consultar registro por id
if ($_POST["webService"] == "consultarId") {
  $obj = new Alumno();
  $aux = new Utileria();
  $_POST = $aux->limpiarEntrada($_POST);
  $obj->setAttributes(array("id" => $_POST["id"]));
  $resultado = $obj->consultarId();
  // Registro en bitacora
  /* $bitacora = new Bitacora();
    $usuarioId= isset($_SESSION["id"])?$_SESSION["id"]:-1;
    $bitacora->setAttributes(["usuario_id"=>$usuarioId,"entidad"=>"alumnos","accion"=>"consultarId","lugar"=>"control-alumno"]);
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
  $obj = new Alumno();
  $obj->setAttributes($parametros);
  $resultado = $obj->guardar();

  // Registro en bitacora
  /* $bitacora = new Bitacora();
    $usuarioId= isset($_SESSION["id"])?$_SESSION["id"]:-1;
    $bitacora->setAttributes(["usuario_id"=>$usuarioId,"entidad"=>"alumnos","accion"=>"guardar","lugar"=>"control-alumno"]);
    $result = $bitacora->guardar(); */
  retornarWebService($_POST["url"], $resultado);
}

// Web service para eliminar registro
if ($_POST["webService"] == "eliminar") {
  $obj = new Alumno();
  $aux = new Utileria();
  $_POST = $aux->limpiarEntrada($_POST);
  $obj->setAttributes(array("id" => $_POST["id"]));
  $resultado = $obj->eliminar();
  // Registro en bitacora
  /* $bitacora = new Bitacora();
    $usuarioId= isset($_SESSION["id"])?$_SESSION["id"]:-1;
    $bitacora->setAttributes(["usuario_id"=>$usuarioId,"entidad"=>"alumnos","accion"=>"eliminar","lugar"=>"control-alumno"]);
    $result = $bitacora->guardar(); */
  retornarWebService($_POST["url"], $resultado);
}

// Web service para guardar registro alumno persona
if ($_POST["webService"] == "guardarAlumnoPersona") {
  $parametros = array();
  $parametros["id"] = $_POST["id"];
  $parametros["programa_id"] = $_POST["programa_id"];
  $parametros["matricula"] = $_POST["matricula"];

  $alumno = new Alumno();
  $alumno->setAttributes($parametros);
  $resultadoAlumno = $alumno->consultarMatricula();

  if (isset($resultadoAlumno["data"][0]["id"])) {
    if ($_POST["tramite"] == "equiv") {
      header("Location: ../views/ce-catalogo-alumno.php?programa_id=" . $_POST["programa_id"] . "&alumno_id=" . $_POST["id"] . "&proceso=" . $_POST["proceso"] . "&tramite=" . $_POST["tramite"] . "&codigo=404");
      exit();
    } else {
      header("Location: ../views/ce-catalogo-alumno.php?programa_id=" . $_POST["programa_id"] . "&alumno_id=" . $_POST["id"] . "&proceso=" . $_POST["proceso"] . "&codigo=404");
      exit();
    }
  }

  $parametros2 = array();
  $parametros2["id"] = $_POST["persona_id"];
  $parametros2["nombre"] = $_POST["nombre"];
  $parametros2["apellido_paterno"] = $_POST["apellido_paterno"];
  $parametros2["apellido_materno"] = $_POST["apellido_materno"];
  $parametros2["fecha_nacimiento"] = $_POST["fecha_nacimiento"];
  $parametros2["sexo"] = $_POST["sexo"];
  $parametros2["nacionalidad"] = $_POST["nacionalidad"];
  $parametros2["correo"] = $_POST["correo"];
  $parametros2["telefono"] = $_POST["telefono"];
  $parametros2["celular"] = $_POST["celular"];
  $parametros2["curp"] = $_POST["curp"];

  $persona = new Persona();
  $persona->setAttributes($parametros2);
  $resultadoPersona = $persona->guardar();

  $parametros3 = array();
  $parametros3["id"] = $_POST["id"];
  $parametros3["persona_id"] = $resultadoPersona["data"]["id"];
  $parametros3["situacion_id"] = $_POST["situacion_id"];
  $parametros3["programa_id"] = $_POST["programa_id"];
  $parametros3["tipo_tramite_id"] = isset($_POST["tipo_tramite_id"]) ? $_POST["tipo_tramite_id"] : "";
  $parametros3["matricula"] = $_POST["matricula"];
  $parametros3["adeudo_materias"] = 0;
  $parametros3["estatus"] = 1;

  $alumno = new Alumno();
  $alumno->setAttributes($parametros3);
  $resultadoAlumno = $alumno->guardar();

  // Registro en bitacora
  /* $bitacora = new Bitacora();
    $usuarioId= isset($_SESSION["id"])?$_SESSION["id"]:-1;
    $bitacora->setAttributes(["usuario_id"=>$usuarioId,"entidad"=>"alumnos","accion"=>"guardarAlumnoPersona","lugar"=>"control-alumno"]);
    $result = $bitacora->guardar(); */
  retornarWebService($_POST["url"], $resultadoAlumno);
}

// Web service para guardar registro alumno persona
if ($_POST["webService"] == "guardarAlumnoCertificado") {
  $exito = 0;
  if (is_uploaded_file($_FILES["archivo_certificado"]["tmp_name"])) {
    if ($_FILES["archivo_certificado"]["size"] < 2000000) {
      if ($_FILES["archivo_certificado"]["type"] == "application/pdf") {
        $dir_certificados = '/certificados';
        $directorio = Documento::$dir_subida . $dir_certificados;
        !is_dir($directorio) ? mkdir($directorio, 0755, true) : false;
        move_uploaded_file($_FILES["archivo_certificado"]["tmp_name"], $directorio . "/documento1_" . $_POST["id"] . ".pdf");
        if (file_exists($directorio . "/documento1_" . $_POST["id"] . ".pdf")) {
          $exito = 1;
        }
      }
    }
  }

  if ($_FILES["archivo_certificado"]["name"] != null && $exito == 0) {
    header("Location: ../views/ce-documentos.php?programa_id=" . $_POST["programa_id"] . "&alumno_id=" . $_POST["id"] . "&codigo=404");
    exit();
  }

  $exito = 0;
  if (is_uploaded_file($_FILES["archivo_nacimiento"]["tmp_name"])) {
    if ($_FILES["archivo_nacimiento"]["size"] < 2000000) {
      if ($_FILES["archivo_nacimiento"]["type"] == "application/pdf") {
        $dir_certificados = '/certificados';
        $directorio = Documento::$dir_subida . $dir_certificados;
        !is_dir($directorio) ? mkdir($directorio, 0755, true) : false;
        move_uploaded_file($_FILES["archivo_nacimiento"]["tmp_name"], $directorio . "/documento2_" . $_POST["id"] . ".pdf");
        if (file_exists($directorio . "/documento2_" . $_POST["id"] . ".pdf")) {
          $exito = 1;
        }
      }
    }
  }

  if ($_FILES["archivo_nacimiento"]["name"] != null && $exito == 0) {
    header("Location: ../views/ce-documentos.php?programa_id=" . $_POST["programa_id"] . "&alumno_id=" . $_POST["id"] . "&codigo=404");
    exit();
  }

  $exito = 0;
  if (is_uploaded_file($_FILES["archivo_curp"]["tmp_name"])) {
    if ($_FILES["archivo_curp"]["size"] < 2000000) {
      if ($_FILES["archivo_curp"]["type"] == "application/pdf") {
        $dir_certificados = '/certificados';
        $directorio = Documento::$dir_subida . $dir_certificados;
        !is_dir($directorio) ? mkdir($directorio, 0755, true) : false;
        move_uploaded_file($_FILES["archivo_curp"]["tmp_name"], $directorio . "/documento3_" . $_POST["id"] . ".pdf");
        if (file_exists($directorio . "/documento3_" . $_POST["id"] . ".pdf")) {
          $exito = 1;
        }
      }
    }
  }

  if ($_FILES["archivo_curp"]["name"] != null && $exito == 0) {
    header("Location: ../views/ce-documentos.php?programa_id=" . $_POST["programa_id"] . "&alumno_id=" . $_POST["id"] . "&codigo=404");
    exit();
  }

  if (!$_POST["estatus_certificado"]) {
    $_POST["estatus_certificado"] = -1;
  }
  if (!$_POST["estatus_nacimiento"]) {
    $_POST["estatus_nacimiento"] = -1;
  }
  if (!$_POST["estatus_curp"]) {
    $_POST["estatus_curp"] = -1;
  }

  $parametros = array();

  if ($_POST["estatus_certificado"] == 1 && $_POST["estatus_nacimiento"] == 1 && $_POST["estatus_curp"] == 1) {
    $parametros["situacion_id"] = 1;
  } else {
    $parametros["situacion_id"] = 2;
  }

  $parametros["id"] = $_POST["id"];
  if ($_FILES["archivo_certificado"]["name"] != null) {
    $parametros["archivo_certificado"] = "documento1_" . $_POST["id"] . ".pdf";
  }
  if ($_FILES["archivo_nacimiento"]["name"] != null) {
    $parametros["archivo_nacimiento"] = "documento2_" . $_POST["id"] . ".pdf";
  }
  if ($_FILES["archivo_curp"]["name"] != null) {
    $parametros["archivo_curp"] = "documento3_" . $_POST["id"] . ".pdf";
  }
  
  $parametros["estatus_certificado"] = $_POST["estatus_certificado"];
  $parametros["estatus_nacimiento"] = $_POST["estatus_nacimiento"];
  $parametros["estatus_curp"] = $_POST["estatus_curp"];
  $parametros["observaciones1"] = $_POST["observaciones1"];
  $parametros["observaciones2"] = $_POST["observaciones2"];

  $alumno = new Alumno();
  $alumno->setAttributes($parametros);
  $resultadoAlumno = $alumno->guardar();

  // Registro en bitacora
  /* $bitacora = new Bitacora();
    $usuarioId= isset($_SESSION["id"])?$_SESSION["id"]:-1;
    $bitacora->setAttributes(["usuario_id"=>$usuarioId,"entidad"=>"alumnos","accion"=>"guardarAlumnoCertificado","lugar"=>"control-alumno"]);
    $result = $bitacora->guardar(); */
  retornarWebService($_POST["url"], $resultadoAlumno);
}

// Web service para consultar registro por programa id
if ($_POST["webService"] == "consultarAlumnosExtraordinarios") {
  $obj = new Alumno();
  $aux = new Utileria();
  $_POST = $aux->limpiarEntrada($_POST);
  $obj->setAttributes($_POST);
  $resultadoAlumnos = $obj->consultarAlumnosExtraordinarios();

  retornarWebService($_POST["url"], $resultadoAlumnos);
}
