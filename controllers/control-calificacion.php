<?php

/**
 * Archivo que gestiona los web services de la clase Calificacion
 */

require_once "../models/modelo-calificacion.php";
require_once "../models/modelo-asignatura.php";
require_once "../models/modelo-grupo.php";
require_once "../models/modelo-ciclo-escolar.php";
require_once "../models/modelo-bitacora.php";
require_once "../models/modelo-alumno-grupo.php";
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
	$obj = new Calificacion();
	$obj->setAttributes(array());
	$resultado = $obj->consultarTodos();
	// Registro en bitacora
	/* $bitacora = new Bitacora();
    $usuarioId= isset($_SESSION["id"])?$_SESSION["id"]:-1;
    $bitacora->setAttributes(["usuario_id"=>$usuarioId,"entidad"=>"calificaciones","accion"=>"consultarTodos","lugar"=>"control-calificacion"]);
    $result = $bitacora->guardar(); */
	retornarWebService($_POST["url"], $resultado);
}

// Web service para consultar registro por id
if ($_POST["webService"] == "consultarId") {
	$obj = new Calificacion();
	$aux = new Utileria();
	$_POST = $aux->limpiarEntrada($_POST);
	$obj->setAttributes(array("id" => $_POST["id"]));
	$resultado = $obj->consultarId();
	// Registro en bitacora
	/* $bitacora = new Bitacora();
    $usuarioId= isset($_SESSION["id"])?$_SESSION["id"]:-1;
    $bitacora->setAttributes(["usuario_id"=>$usuarioId,"entidad"=>"calificaciones","accion"=>"consultarId","lugar"=>"control-calificacion"]);
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
	$obj = new Calificacion();
	$obj->setAttributes($parametros);
	$resultado = $obj->guardar();
	// Registro en bitacora
	/* $bitacora = new Bitacora();
    $usuarioId= isset($_SESSION["id"])?$_SESSION["id"]:-1;
    $bitacora->setAttributes(["usuario_id"=>$usuarioId,"entidad"=>"calificaciones","accion"=>"guardar","lugar"=>"control-calificacion"]);
    $result = $bitacora->guardar(); */
	retornarWebService($_POST["url"], $resultado);
}

// Web service para eliminar registro
if ($_POST["webService"] == "eliminar") {
	$obj = new Calificacion();
	$aux = new Utileria();
	$_POST = $aux->limpiarEntrada($_POST);
	$obj->setAttributes(array("id" => $_POST["id"]));
	$resultado = $obj->eliminar();
	// Registro en bitacora
	/* $bitacora = new Bitacora();
    $usuarioId= isset($_SESSION["id"])?$_SESSION["id"]:-1;
    $bitacora->setAttributes(["usuario_id"=>$usuarioId,"entidad"=>"calificaciones","accion"=>"eliminar","lugar"=>"control-calificacion"]);
    $result = $bitacora->guardar(); */
	retornarWebService($_POST["url"], $resultado);
}

// Web service para calificaciones ordinarios de grupo por asignatura
if ($_POST["webService"] == "guardarCalificacionesGrupoAsignatura") {
	$parametros["grupo_id"] = $_POST["grupo_id"];

	$alumnoGrupo = new AlumnoGrupo();
	$alumnoGrupo->setAttributes($parametros);
	$resultadoAlumnoGrupo = $alumnoGrupo->consultarAlumnosGrupo();

	$max = count($resultadoAlumnoGrupo["data"]);

	$j = 0;
	for ($i = 0; $i < $max; $i++) {
		$parametros2["alumno_id"] = $resultadoAlumnoGrupo["data"][$i]["alumno_id"];
		$parametros2["grupo_id"] = $resultadoAlumnoGrupo["data"][$i]["grupo_id"];
		$parametros2["asignatura_id"] = $_POST["asignatura_id"];
		$parametros2["tipo"] = "1";

		$calificacion = new Calificacion();
		$calificacion->setAttributes($parametros2);
		$resultadoCalificacion = $calificacion->consultarAlumnoAsignatura();

		$max2 = count($resultadoCalificacion["data"]);

		if ($max2 > 0) {
			$parametros3["id"] = $resultadoCalificacion["data"][0]["id"];
			$parametros3["calificacion"] = $_POST["calificacion"][$j];
			$parametros3["fecha_examen"] = $_POST["fecha_examen"][$j];

			$calificacion2 = new Calificacion();
			$calificacion2->setAttributes($parametros3);
			$resultadoCalificacion2 = $calificacion2->guardar();
			$j++;
		}
	}

	// Registro en bitacora
	/* $bitacora = new Bitacora();
    $usuarioId= isset($_SESSION["id"])?$_SESSION["id"]:-1;
    $bitacora->setAttributes(["usuario_id"=>$usuarioId,"entidad"=>"calificaciones","accion"=>"guardarCalificacionesGrupoAsignatura","lugar"=>"control-calificacion"]);
    $result = $bitacora->guardar(); */

	header("Location: ../views/ce-ordinarios.php?programa_id=" . $_POST["programa_id"] . "&ciclo_id=" . $_POST["ciclo_id"] . "&grado=" . $_POST["grado"] . "&grupo_id=" . $_POST["grupo_id"] . "&asignatura_id=" . $_POST["asignatura_id"] . "&codigo=200" . "&tramite=" . $_POST["tramite"]);
	exit();
}

// Web service para calificaciones extraordinarios de grupo por asignatura
if ($_POST["webService"] == "guardarCalificacionesGrupoAsignaturaExtra") {
	$parametros["grupo_id"] = $_POST["grupo_id"];

	$alumnoGrupo = new AlumnoGrupo();
	$alumnoGrupo->setAttributes($parametros);
	$resultadoAlumnoGrupo = $alumnoGrupo->consultarAlumnosGrupo();

	$max = count($resultadoAlumnoGrupo["data"]);

	$j = 0;
	for ($i = 0; $i < $max; $i++) {
		$parametros2["alumno_id"] = $resultadoAlumnoGrupo["data"][$i]["alumno_id"];
		$parametros2["grupo_id"] = $resultadoAlumnoGrupo["data"][$i]["grupo_id"];
		$parametros2["asignatura_id"] = $_POST["asignatura_id"];
		$parametros2["tipo"] = "1";

		$calificacion = new Calificacion();
		$calificacion->setAttributes($parametros2);
		$resultadoCalificacion = $calificacion->consultarAlumnoAsignatura();

		$max2 = count($resultadoCalificacion["data"]);

		if ($max2 > 0) {
			if ($_POST["calificacion"][$j]) {
				$parametros3["alumno_id"] = $resultadoAlumnoGrupo["data"][$i]["alumno_id"];
				$parametros3["grupo_id"] = $resultadoAlumnoGrupo["data"][$i]["grupo_id"];
				$parametros3["asignatura_id"] = $_POST["asignatura_id"];
				$parametros3["tipo"] = "2";

				$calificacion2 = new Calificacion();
				$calificacion2->setAttributes($parametros3);
				$resultadoCalificacion2 = $calificacion2->consultarAlumnoAsignatura();

				$parametros4["id"] = isset($resultadoCalificacion2["data"][0]["id"]) ? $resultadoCalificacion2["data"][0]["id"] : "";
				$parametros4["alumno_id"] = $resultadoAlumnoGrupo["data"][$i]["alumno_id"];
				$parametros4["grupo_id"] = $resultadoAlumnoGrupo["data"][$i]["grupo_id"];
				$parametros4["asignatura_id"] = $_POST["asignatura_id"];
				$parametros4["calificacion"] = $_POST["calificacion"][$j];
				$parametros4["fecha_examen"] = $_POST["fecha_examen"][$j];
				$parametros4["tipo"] = "2";

				$calificacion3 = new Calificacion();
				$calificacion3->setAttributes($parametros4);
				$resultadoCalificacion3 = $calificacion3->guardar();
			}
			$j++;
		}
	}

	// Registro en bitacora
	/* $bitacora = new Bitacora();
    $usuarioId= isset($_SESSION["id"])?$_SESSION["id"]:-1;
    $bitacora->setAttributes(["usuario_id"=>$usuarioId,"entidad"=>"calificaciones","accion"=>"guardarCalificacionesGrupoAsignaturaExtra","lugar"=>"control-calificacion"]);
    $result = $bitacora->guardar(); */

	header("Location: ../views/ce-extraordinarios.php?programa_id=" . $_POST["programa_id"] . "&ciclo_id=" . $_POST["ciclo_id"] . "&grado=" . $_POST["grado"] . "&grupo_id=" . $_POST["grupo_id"] . "&asignatura_id=" . $_POST["asignatura_id"] . "&codigo=200" . "&tramite=" . $_POST["tramite"]);
	exit();
}

// Web service para consutlar registro
if ($_POST["webService"] == "consultarCalificacionPorAlumno") {
	$aux = new Utileria();
	$_POST = $aux->limpiarEntrada($_POST);
	$calificacionAlumno = new Calificacion;
	$res_calificacion_alumno = $calificacionAlumno->consultarPor("calificaciones", array("alumno_id" => $_POST["alumno_id"], "deleted_at"), "*");
	$res_calificacion_alumno = $res_calificacion_alumno["data"];

	$calificacionCiclo = [];
  $totalCreditos = 0;

	foreach ($res_calificacion_alumno as $key => $calificacion) {

    $asignatura = new Asignatura;
		$asignatura->setAttributes(array("id" => $calificacion["asignatura_id"]));
		$res_asignatura = $asignatura->consultarId();
		$res_asignatura = $res_asignatura["data"];

		$grupo = new Grupo();
		$grupo->setAttributes(array("id" => $calificacion["grupo_id"]));
		$res_grupo = $grupo->consultarId();
		$res_grupo = $res_grupo["data"];

		$cicloEscolar = new CicloEscolar();
		$cicloEscolar->setAttributes(array("id" => $res_grupo["ciclo_escolar_id"]));
		$res_ciclo_escolar = $cicloEscolar->consultarId();
		$res_ciclo_escolar = $res_ciclo_escolar["data"];

		switch ($calificacion["tipo"]) {
			case '1':
				$calificacion["tipo_txt"] = "Ordinario";
				break;
			case '2':
				$calificacion["tipo_txt"] = "Extraordinario";
				break;
		}

		$calificacion["consecutivo"] = (int)$res_asignatura["consecutivo"];
		$calificacion["asignatura"] = $res_asignatura;
		$calificacion["ciclo_escolar"] = $res_ciclo_escolar;

    // Sumar creditos aprobados
    if (is_numeric($calificacion["calificacion"]) && $calificacion["calificacion"] >= $_POST["calificacion_aprobatoria"]) {
      $totalCreditos += $calificacion["asignatura"]["creditos"];
    }

		if (!isset($calificacionCiclo[$calificacion["ciclo_escolar"]["nombre"]])) {
			$calificacionCiclo[$calificacion["ciclo_escolar"]["nombre"]] = [];
		}
		array_push($calificacionCiclo[$calificacion["ciclo_escolar"]["nombre"]], $calificacion);
	}

	$resultado['calificacionCiclo'] = $calificacionCiclo;
  $resultado['totalCreditos'] = $totalCreditos;

	retornarWebService($_POST["url"], $resultado);
}
