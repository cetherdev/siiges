<?php

/**
 * Archivo que gestiona los web services de la clase AlumnoGrupo
 */

require_once "../models/modelo-alumno-grupo.php";
require_once "../models/modelo-bitacora.php";
require_once "../models/modelo-alumno.php";
require_once "../models/modelo-ciclo-escolar.php";
require_once "../models/modelo-calificacion.php";
require_once "../models/modelo-validacion.php";
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
if (!empty($_POST)) {
  if ($_POST["webService"] == "consultarTodos") {
    $obj = new AlumnoGrupo();
    $obj->setAttributes(array());
    $resultado = $obj->consultarTodos();
    // Registro en bitacora
    /* $bitacora = new Bitacora();
      $usuarioId= isset($_SESSION["id"])?$_SESSION["id"]:-1;
      $bitacora->setAttributes(["usuario_id"=>$usuarioId,"entidad"=>"alumnos_grupos","accion"=>"consultarTodos","lugar"=>"control-alumno-grupo"]);
      $result = $bitacora->guardar(); */
    retornarWebService($_POST["url"], $resultado);
  }

  // Web service para consultar registro por id
  if ($_POST["webService"] == "consultarId") {
    $obj = new AlumnoGrupo();
    $aux = new Utileria();
    $_POST = $aux->limpiarEntrada($_POST);
    $obj->setAttributes(array("id" => $_POST["id"]));
    $resultado = $obj->consultarId();
    // Registro en bitacora
    /* $bitacora = new Bitacora();
      $usuarioId= isset($_SESSION["id"])?$_SESSION["id"]:-1;
      $bitacora->setAttributes(["usuario_id"=>$usuarioId,"entidad"=>"alumnos_grupos","accion"=>"consultarId","lugar"=>"control-alumno-grupo"]);
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
    $obj = new AlumnoGrupo();
    $obj->setAttributes($parametros);
    $resultado = $obj->guardar();
    // Registro en bitacora
    /* $bitacora = new Bitacora();
      $usuarioId= isset($_SESSION["id"])?$_SESSION["id"]:-1;
      $bitacora->setAttributes(["usuario_id"=>$usuarioId,"entidad"=>"alumnos_grupos","accion"=>"guardar","lugar"=>"control-alumno-grupo"]);
      $result = $bitacora->guardar(); */
    retornarWebService($_POST["url"], $resultado);
  }

  // Web service para eliminar registro
  if ($_POST["webService"] == "eliminar") {
    $obj = new AlumnoGrupo();
    $aux = new Utileria();
    $_POST = $aux->limpiarEntrada($_POST);
    $obj->setAttributes(array("id" => $_POST["id"]));
    $resultado = $obj->eliminar();
    // Registro en bitacora
    /* $bitacora = new Bitacora();
      $usuarioId= isset($_SESSION["id"])?$_SESSION["id"]:-1;
      $bitacora->setAttributes(["usuario_id"=>$usuarioId,"entidad"=>"alumnos_grupos","accion"=>"eliminar","lugar"=>"control-alumno-grupo"]);
      $result = $bitacora->guardar(); */
    retornarWebService($_POST["url"], $resultado);
  }

  // Web service para guardar registro alumno grupo
  if ($_POST["webService"] == "guardarAlumnoGrupo") {
    $parametros = array();
    $parametros["id"] = "";
    $parametros["programa_id"] = $_POST["programa_id"];
    $parametros["matricula"] = $_POST["matricula"];
    $alumno = new Alumno();
    $alumno->setAttributes($parametros);
    $resultadoAlumno = $alumno->consultarMatricula();

    if (!$resultadoAlumno["data"][0]["id"]) {
      header("Location: ../views/ce-inscripcion.php?programa_id=" . $_POST["programa_id"] . "&ciclo_id=" . $_POST["ciclo_id"] . "&grado=" . $_POST["grado"] . "&grupo_id=" . $_POST["grupo_id"] . "&codigo=404&tramite=" . $_POST["tramite"]);
      exit();
    }
    if ($resultadoAlumno["data"][0]["situacion_id"] >= 2 && $resultadoAlumno["data"][0]["situacion_id"] <= 4) {
      header("Location: ../views/ce-inscripcion.php?programa_id=" . $_POST["programa_id"] . "&ciclo_id=" . $_POST["ciclo_id"] . "&grado=" . $_POST["grado"] . "&grupo_id=" . $_POST["grupo_id"] . "&codigo=403&tramite=" . $_POST["tramite"]);
      exit();
    }

    //Validando ciclo escolar
    $ciclo_escolar = new CicloEscolar();
    $aux = new Utileria();
    $_POST = $aux->limpiarEntrada($_POST);
    $ciclo_escolar->setAttributes(array("id" => $_POST["ciclo_id"]));
    $resultado_ciclo_escolar = $ciclo_escolar->consultarId();
    $ciclo_escolar_actual = str_split($resultado_ciclo_escolar["data"]["nombre"], 4);

    // Validación de grado para inscripción
    $grado = $_POST["grado"];
    if ($grado == "Primer semestre" || $grado == "Primer cuatrimestre") {
      $validar_grado = true;
    }

    //Validacion de alumno
    $validacion = new Validacion();
    $res_validacion = $validacion->consultarPor('validaciones', array("alumno_id" => $resultadoAlumno["data"][0]["id"], "deleted_at"), '*');
    if ((!$res_validacion["data"]
        || $res_validacion["data"][0]["situacion_validacion_id"] == 2)
      && (intval($ciclo_escolar_actual[0]) >= 2021 || $resultado_ciclo_escolar["data"]["nombre"] == "EQUIV")
      && ($validar_grado || $resultado_ciclo_escolar["data"]["nombre"] == "EQUIV")
    ) {
      header("Location: ../views/ce-inscripcion.php?programa_id=" . $_POST["programa_id"] . "&ciclo_id=" . $_POST["ciclo_id"] . "&grado=" . $_POST["grado"] . "&grupo_id=" . $_POST["grupo_id"] . "&codigo=403&tramite=" . $_POST["tramite"]);
      exit();
    }

    $parametros2 = array();
    $parametros2["alumno_id"] = $resultadoAlumno["data"][0]["id"];
    $parametros2["grupo_id"] = $_POST["grupo_id"];
    $parametros2["periodo_fecha_inicio"] = "0000:00:00";
    $parametros2["periodo_fecha_fin"] = "0000:00:00";
    $alumnoGrupo = new AlumnoGrupo();
    $alumnoGrupo->setAttributes($parametros2);
    $resultadoAlumnoGrupo = $alumnoGrupo->guardar();

    foreach ($_POST["asignaturas_grado"] as $asignatura_id) {
      $parametros3 = array();
      $parametros3["alumno_id"] = $resultadoAlumno["data"][0]["id"];
      $parametros3["grupo_id"] = $_POST["grupo_id"];
      $parametros3["asignatura_id"] = $asignatura_id;
      $parametros3["tipo"] = 1;

      $calificacion = new Calificacion();
      $calificacion->setAttributes($parametros3);
      $resultadoCalificacion = $calificacion->guardar();
    }

    foreach ($_POST["optativas_grado"] as $asignatura_id) {
      $parametros3 = array();
      $parametros3["alumno_id"] = $resultadoAlumno["data"][0]["id"];
      $parametros3["grupo_id"] = $_POST["grupo_id"];
      $parametros3["asignatura_id"] = $asignatura_id;
      $parametros3["tipo"] = 1;

      $calificacion = new Calificacion();
      $calificacion->setAttributes($parametros3);
      $resultadoCalificacion = $calificacion->guardar();
    }

    //Registro en bitacora
    /* $bitacora = new Bitacora();
      $usuarioId= isset($_SESSION["id"])?$_SESSION["id"]:-1;
      $bitacora->setAttributes(["usuario_id"=>$usuarioId,"entidad"=>"alumnos_grupos","accion"=>"guardarAlumnoGrupo","lugar"=>"control-alumno-grupo"]);
      $result = $bitacora->guardar(); */

    header("Location: ../views/ce-inscripcion.php?programa_id=" . $_POST["programa_id"] . "&ciclo_id=" . $_POST["ciclo_id"] . "&grado=" . $_POST["grado"] . "&grupo_id=" . $_POST["grupo_id"] . "&codigo=200&tramite=" . $_POST["tramite"]);
    exit();
  }
}

// Web service para eliminar registro alumno grupo
if ($_GET["webService"] == "eliminarAlumnoGrupo") {
  $parametros = array();
  $parametros["id"] = $_GET["id"];

  $alumnoGrupo = new AlumnoGrupo();
  $alumnoGrupo->setAttributes($parametros);
  $resultadoAlumnoGrupo = $alumnoGrupo->eliminar();

  $parametros2 = array();
  $parametros2["alumno_id"] = $_GET["alumno_id"];
  $parametros2["grupo_id"] = $_GET["grupo_id"];

  $calificacion = new Calificacion();
  $calificacion->setAttributes($parametros2);
  $resultadoCalificacion = $calificacion->eliminarAlumnoGrupoAsignaturas();

  // Registro en bitacora
  /* $bitacora = new Bitacora();
    $usuarioId= isset($_SESSION["id"])?$_SESSION["id"]:-1;
    $bitacora->setAttributes(["usuario_id"=>$usuarioId,"entidad"=>"alumnos_grupos","accion"=>"eliminarAlumnoGrupo","lugar"=>"control-alumno-grupo"]);
    $result = $bitacora->guardar(); */

  if ($_GET["tramite"] == "equiv") {
    header("Location: ../views/ce-inscripcion.php?programa_id=" . $_GET["programa_id"] . "&ciclo_id=" . $_GET["ciclo_id"] . "&grado=" . $_GET["grado"] . "&grupo_id=" . $_GET["grupo_id"] . "&tramite=" . $_GET["tramite"] . "&codigo=200");
  } else {
    header("Location: ../views/ce-inscripcion.php?programa_id=" . $_GET["programa_id"] . "&ciclo_id=" . $_GET["ciclo_id"] . "&grado=" . $_GET["grado"] . "&grupo_id=" . $_GET["grupo_id"] . "&codigo=200");
  }
  exit();
}
