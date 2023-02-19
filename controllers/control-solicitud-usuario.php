<?php

/**
 * Archivo que gestiona los web services de la clase SolicitudUsuario
 */

require_once "../models/modelo-solicitud-usuario.php";
require_once "../models/modelo-solicitud.php";
require_once "../utilities/utileria-general.php";
require_once "../models/modelo-tipo-solicitud.php";
require_once "../models/modelo-estatus-solicitud.php";
require_once "../models/modelo-programa.php";
require_once "../models/modelo-plantel.php";
require_once "../models/modelo-domicilio.php";
require_once "../models/modelo-usuario.php";
require_once "../models/modelo-ciclo.php";
require_once "../models/modelo-modalidad.php";
require_once "../models/modelo-nivel.php";
require_once "../models/modelo-persona.php";
require_once "../models/modelo-institucion.php";
require_once "../models/modelo-formacion.php";
require_once "../models/modelo-experiencia.php";
require_once "../models/modelo-ratificacion-nombre.php";
require_once "../models/modelo-plantel-dictamen.php";
require_once "../models/modelo-salud-institucion.php";
require_once "../models/modelo-asignatura.php";
require_once "../models/modelo-infraestructura.php";
require_once "../models/modelo-docente.php";
require_once "../models/modelo-tipo-instalacion.php";
require_once "../models/modelo-trayectoria.php";
require_once "../models/modelo-mixta-noescolarizada.php";
require_once "../models/modelo-respaldo.php";
require_once "../models/modelo-espejo.php";
require_once "../models/modelo-publicacion.php";
require_once "../models/modelo-programa-turno.php";
require_once "../models/modelo-programa-evaluacion.php";
require_once "../models/modelo-cumplimiento.php";
require_once "../models/modelo-evaluador.php";
require_once "../models/modelo-edificio-nivel.php";
require_once "../models/modelo-plantel-edificio-nivel.php";
require_once "../models/modelo-plantel-seguridad-sistema.php";
require_once "../models/modelo-seguridad-sistema.php";
require_once "../models/modelo-higiene.php";
require_once "../models/modelo-plantel-higiene.php";
require_once "../models/modelo-documento.php";
require_once "../models/modelo-bitacora.php";

session_start();
function retornarWebService($url, $resultado)
{
  if ($url != "") {
    $_SESSION["solicitud"] = $resultado;
    header("Location: $url");
    exit();
  } else {
    echo  json_encode($resultado);
    exit();
  }
}

//====================================================================================================

// Web service para consultar todos los registros
if ($_POST["webService"] == "consultarTodos") {
  $obj = new SolicitudUsuario();
  $obj->setAttributes(array());
  $resultado = $obj->consultarTodos();
  // Registro en bitacora
  /* $bitacora = new Bitacora();
      $usuarioId= isset($_SESSION["id"])?$_SESSION["id"]:-1;
      $bitacora->setAttributes(["usuario_id"=>$usuarioId,"entidad"=>"solicitudes_usuarios","accion"=>"consultarTodos","lugar"=>"control-solicitud-usuario"]);
      $result = $bitacora->guardar(); */
  retornarWebService($_POST["url"], $resultado);
}
// Web service para consultar registro por id
if ($_POST["webService"] == "consultarId") {
  $obj = new SolicitudUsuario();
  $aux = new Utileria();
  $_POST = $aux->limpiarEntrada($_POST);
  $obj->setAttributes(array("id" => $_POST["id"]));
  $resultado = $obj->consultarId();  // Registro en bitacora
  /* $bitacora = new Bitacora();
      $usuarioId= isset($_SESSION["id"])?$_SESSION["id"]:-1;
      $bitacora->setAttributes(["usuario_id"=>$usuarioId,"entidad"=>"solicitudes_usuarios","accion"=>"consultarId","lugar"=>"control-solicitud-usuario"]);
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
  $obj = new SolicitudUsuario();
  $obj->setAttributes($parametros);
  $resultado = $obj->guardar();
  retornarWebService($_POST["url"], $resultado);
}
// Web service para eliminar registro
if ($_POST["webService"] == "eliminar") {
  $obj = new SolicitudUsuario();
  $aux = new Utileria();
  $_POST = $aux->limpiarEntrada($_POST);
  $obj->setAttributes(array("id" => $_POST["id"]));
  $resultado = $obj->eliminar();  // Registro en bitacora
  /* $bitacora = new Bitacora();
      $usuarioId= isset($_SESSION["id"])?$_SESSION["id"]:-1;
      $bitacora->setAttributes(["usuario_id"=>$usuarioId,"entidad"=>"solicitudes_usuarios","accion"=>"guardar","lugar"=>"control-solicitud-usuario"]);
      $result = $bitacora->guardar(); */
  retornarWebService($_POST["url"], $resultado);
}
//Web service que obtiene las solicitudes de un representante legal o sus gestores
if ($_POST["webService"] == "solicitudes") {
  $aux = new Utileria();
  $_POST = $aux->limpiarEntrada($_POST);
  if ($_POST["rol_id"] == 3) {
    $solicitudes_usuario = new Solicitud();
    $solicitudes_usuario = $solicitudes_usuario->consultarPor("solicitudes", array("usuario_id" => $_POST['usuario_id'], "deleted_at" => ""), "*");
  } else {
    $usuario_usuarios = new SolicitudUsuario();
    $representante = $usuario_usuarios->consultarPor("usuario_usuarios", array("secundario_id" => $_POST['usuario_id']), "*");
    $representante = $representante["data"][0]["principal_id"];
    $solicitudes_usuario = new SolicitudUsuario();
    $solicitudes_usuario = $solicitudes_usuario->consultarPor("solicitudes", array("usuario_id" => $representante, "deleted_at" => ""), "*");
  }
  //Comprueba si el usuario tiene solicitudes
  if (!empty($solicitudes_usuario["data"])) {

    //Obtine los id de las solicitudes
    // $id_usuario = $solicitudes_usuario["data"][0]["usuario_id"];
    $solicitudes = array();
    $resultado = array();

    foreach ($solicitudes_usuario["data"] as $index => $arreglo) {

      $solicitud = new Solicitud();
      $respuesta_solicitud = $solicitud->consultarPor("solicitudes", array("id" => $arreglo["id"]), "*");
      // var_dump($respuesta_solicitud);
      // exit();
      $respuesta["solicitud"] = $respuesta_solicitud["data"][0];

      $tipo_solicitud = new TipoSolicitud();
      $tipo_solicitud->setAttributes(array('id' => $respuesta_solicitud["data"][0]["tipo_solicitud_id"]));
      $respuestas = $tipo_solicitud->consultarId();
      $respuesta["solicitud"]["tipo_solicitud"] = $respuestas["data"]["nombre"];

      $estatus_solicitud = new EstatusSolicitud();
      $estatus_solicitud->setAttributes(array('id' => $respuesta_solicitud["data"][0]["estatus_solicitud_id"]));
      $respuestas = $estatus_solicitud->consultarId();
      $respuesta["solicitud"]["estatus_solicitud"] = $respuestas["data"]["nombre"];

      $programa = new Programa();
      $respuestas = $programa->consultarPor("programas", array("solicitud_id" => $respuesta_solicitud["data"][0]["id"]), "*");
      if (sizeof($respuestas["data"]) > 0) {
        $respuesta["programa"] = $respuestas["data"][0];
        $plantel = new Plantel();
        $respuestas = $plantel->consultarPor("planteles", array("id" => $respuesta["programa"]["plantel_id"]), "*");
        $respuesta["plantel"] = $respuestas["data"][0];

        $domicilio = new Domicilio();
        $respuestas = $domicilio->consultarPor("domicilios", array("id" => $respuesta["plantel"]["domicilio_id"]), "*");
        $respuesta["domicilio"] = $respuestas["data"][0];
      }



      array_push($resultado, $respuesta);
    }
    //Tabla para mostar solicitudes
    $tabla = "";
    foreach ($resultado as $registro => $campos) {
      $json = array();
      $folio = isset($campos["solicitud"]["folio"]) ? $campos["solicitud"]["folio"] : "Completar solicitud";
      $plan = isset($campos["programa"]["nombre"]) ? $campos["programa"]["nombre"] : "Completar solicitud";
      $alta = isset($campos["solicitud"]["created_at"]) ? $campos["solicitud"]["created_at"] : "";
      $estatus = isset($campos["solicitud"]["estatus_solicitud"]) ? $campos["solicitud"]["estatus_solicitud"] : "";
      $json["id"] = $campos["solicitud"]["id"];
      $json["folio"] = $folio;
      $json["programa"] = $plan;
      $json["plantel"] =  $campos["domicilio"]["numero_exterior"] . " " . $campos["domicilio"]["calle"] . " en el municipio de " . $campos["domicilio"]["municipio"];
      $json = json_encode($json);
      $txt_aux = "&modalidad=" . $campos["programa"]["modalidad_id"] . "&tps=" . $campos["solicitud"]["tipo_solicitud_id"] . "&dt=" . $campos["programa"]["id"] . "&odt=1";
      $editar = "<a href='editar-solicitudes.php?solicitud=" . $campos["solicitud"]["id"] . $txt_aux . "&editar=1'><span class='glyphicon glyphicon-pencil'></span></a>";
      $espacio = "&nbsp;&nbsp;&nbsp;";
      $eliminar = "<a  href='#' onclick='Solicitud.datosModal(" . htmlentities($json) . ")'><span class='glyphicon glyphicon-trash'></span></a>";
      $detalles =  "<a href='detalles-solicitudes.php?solicitud=" . $campos["solicitud"]["id"] . "'><span class='glyphicon glyphicon-list-alt'></span></a>";
      $ver =  "<a href='editar-solicitudes.php?solicitud=" . $campos["solicitud"]["id"] . $txt_aux . "&editar=0'><span class='glyphicon glyphicon-eye-open'></span></a>";
      if ($estatus == "COMPLETAR SOLICITUD") {
        if ($_POST["rol_id"] == 4) {
          $opciones_edicion = $editar . $espacio . $detalles;
        } else {
          $opciones_edicion = $editar . $espacio . $ver . $espacio . $eliminar . $espacio . $detalles;
        }
      } else if ($estatus == "ATENDER OBSERVACIONES") {
        $opciones_edicion = $detalles . $espacio . $editar;
      } else {
        $opciones_edicion = $detalles . $espacio . $ver;
      }
      if (isset($campos["domicilio"])) {
        $plantel = $campos["domicilio"]["numero_exterior"] . " " . $campos["domicilio"]["calle"] . " " . $campos["domicilio"]["municipio"];
      } else {
        $plantel = "S/N";
      }

      $tabla .= '{
                "folio":"' . $folio . '",
                "planestudios":"' . $plan . '",
                "alta":"' . $alta . '",
                "estatus":"' . $estatus . '",
                "plantel":"' . "$plantel" . '",
                "acciones":"' . $opciones_edicion . '"
              },';
    }
    $tabla = substr($tabla, 0, strlen($tabla) - 1);
    echo '{"data":[' . $tabla . ']}';
    //Solicitudes
    //var_dump($resultado);

  } else {
    $resultado = array(
      "status" => "204",
      "message" => "No Content",
      "data" => ""
    );
    // Registro en bitacora
    /* $bitacora = new Bitacora();
       $usuarioId= isset($_SESSION["id"])?$_SESSION["id"]:-1;
       $bitacora->setAttributes(["usuario_id"=>$usuarioId,"entidad"=>"solicitudes_usuarios","accion"=>"solicitudes","lugar"=>"control-solicitud-usuario"]);
       $result = $bitacora->guardar(); */
    retornarWebService($_POST["url"], $resultado);
  }
}

//webService que obtiene los datos de una solicitud
if ($_POST["webService"] = "datosSolicitud") {

  $resultado["status"] = "200";
  $resultado["message"] = "OK";
  $url = "";

  $aux = new Utileria();
  $_POST = $aux->limpiarEntrada($_POST);
  if (isset($_POST["solicitud_id"])) {
    //Consulta la solicitud por id
    $solicitud = new Solicitud();

    $res_solicitud = $solicitud->consultarPor("solicitudes", array("id" => $_POST["solicitud_id"], "deleted_at"), "*");
    $res_solicitud = $res_solicitud["data"];

    //Decide que hacer si no existe solicitud
    if (sizeof($res_solicitud) > 0) {
      $res_solicitud = $res_solicitud[0];
      //Consulta el tipo de solicitud por id
      $tipoSolicitud = new TipoSolicitud();
      $res_tipo_solicitud = $tipoSolicitud->consultarPor("tipo_solicitudes", array("id" => $res_solicitud["tipo_solicitud_id"], "deleted_at"), "*");
      $res_tipo_solicitud = $res_tipo_solicitud["data"];
      $res_solicitud["tipo_solicitud"] = $res_tipo_solicitud[0];

      $resultado["data"]["solicitud"] = $res_solicitud;
      if ($_SESSION["rol_id"] == 4) {
        $gestor = new Usuario();
        $representanteGestor = $gestor->consultarPor("usuario_usuarios", array("secundario_id" => $_SESSION["id"]), "*");
        $representanteGestor = $representanteGestor["data"][0]["principal_id"];
      }
      //Verifica que sea el propietario de la solicitud
      if ($res_solicitud["usuario_id"] == $_SESSION["id"] || $_SESSION["rol_id"] == 2 || $_SESSION["rol_id"] >= 7 || (isset($representanteGestor) && $representanteGestor == $res_solicitud["usuario_id"])) {
        $programa = new Programa();
        $res_programa = $programa->consultarPor("programas", array("solicitud_id" => $res_solicitud["id"], "deleted_at"), array("id"));
        $res_programa = $res_programa["data"];
        //Verificar que el programa exista
        if (sizeof($res_programa) > 0) {
          //Información del programa con sus relaciones
          $res_programa = $res_programa[0];
          $datosPrograma = new Programa();
          $datosPrograma->setAttributes(array("id" => $res_programa["id"]));
          $resultado["data"]["programa"] = $datosPrograma->informacionRelacionada(2);
          $resultado["data"]["programa"] = $resultado["data"]["programa"]["data"];
          //Información del plantel con sus relaciones
          //Diligencias
          $usuarios_solicitudes = new Solicitud();
          $usuarios_diligencias = $usuarios_solicitudes->consultarPor("solicitudes_usuarios", array("solicitud_id" => $resultado["data"]["programa"]["solicitud_id"], "deleted_at"), array("id", "solicitud_id", "usuario_id"));
          $usuarios_diligencias = $usuarios_diligencias["data"];
          if (sizeof($usuarios_diligencias) > 0) {
            $diligencias_array = array();
            foreach ($usuarios_diligencias as $posicion => $campos) {
              $persona = new Persona();
              $persona->setAttributes(array("id" => $campos["usuario_id"]));
              $res_temp = $persona->consultarId();
              array_push($diligencias_array, $res_temp["data"]);
            }
            $resultado["data"]["diligencias"] = $diligencias_array;
          }
          //Campos solo para los programas No escolarizados o Mixtos
          if ($resultado["data"]["programa"]["modalidad_id"] > 1) {
            $mixta_noescolarizada = new MixtaNoEscolarizada();
            $res_mixta = $mixta_noescolarizada->consultarPor("mixta_noescolarizadas", array("programa_id" => $resultado["data"]["programa"]["id"]), "*");
            if (sizeof($res_mixta["data"]) > 0) {
              //Trae la ultima actualizaci��n de los campos MixtaNoEscolarizada
              //$resultado["data"]["programa"]["mixta"] = $res_mixta["data"][0];
              $resultado["data"]["programa"]["mixta"] = end($res_mixta["data"]);
              $respaldo = new Respaldo();
              $res_respaldo = $respaldo->consultarPor("respaldos", array("mixta_noescolarizada_id" => $resultado["data"]["programa"]["mixta"]["id"], "deleted_at"), "*");
              if (sizeof($res_respaldo["data"]) > 0) {
                $resultado["data"]["programa"]["mixta"]["respaldos"] = $res_respaldo["data"];
              }
              $espejo = new Espejo();
              $res_espejo = $espejo->consultarPor("espejos", array("mixta_noescolarizada_id" => $resultado["data"]["programa"]["mixta"]["id"], "deleted_at"), "*");
              if (sizeof($res_espejo["data"]) > 0) {
                $resultado["data"]["programa"]["mixta"]["espejos"] = $res_espejo["data"];
              }
            }
          }
          //Asignaturas
          $asignatura = new Asignatura();
          $asignaturas = $asignatura->consultarPor("asignaturas", array("programa_id" => $resultado["data"]["programa"]["id"], "deleted_at"), "*");

          if (sizeof($asignaturas["data"]) > 0) {
            $docentes = array();
            $infraestructuras = array();
            foreach ($asignaturas["data"] as $index => $campos) {
              $temporal_infraestructura = new Infraestructura();
              $temporal_infraestructura->setAttributes(array('id' => $campos["infraestructura_id"]));
              $resultado_temp = $temporal_infraestructura->consultarId();
              $resultado_temp["data"]["asignatura"] = $campos["clave"];
              if ($resultado_temp["data"]["deleted_at"] === null) {
                array_push($infraestructuras, $resultado_temp["data"]);
              }


              $temporal_docente = new Docente();
              $temporal_docente->setAttributes(array('id' => $campos["docente_id"]));
              $resultado_temp = $temporal_docente->consultarId();
              $resultado_temp["data"]["asignatura"] = $campos["clave"];

              $temp_persona = new Persona();
              $temp_persona->setAttributes(array('id' => $resultado_temp["data"]["persona_id"]));
              $respuesta_temp = $temp_persona->consultarId();
              $resultado_temp["data"]["persona"] =  $respuesta_temp["data"];
              if ($resultado_temp["data"]["deleted_at"] === null) {
                array_push($docentes, $resultado_temp["data"]);
              }
            }

            $resultado["data"]["asignaturas"] = $asignaturas["data"];
            //Agregar las claves de las asignaturas al docente (Se eliminan los docentes repetidos)
            $docentes_final = array();
            foreach ($docentes as $key => $value) {
              $value["asignaturas"] = [];
              if (empty($docentes_final)) {
                array_push($value["asignaturas"], $value["asignatura"]);
                array_push($docentes_final, $value);
              } else {
                $position = array_search($value["id"], array_column($docentes_final, 'id'));
                if ($position === false) {
                  array_push($value["asignaturas"], $value["asignatura"]);
                  array_push($docentes_final, $value);
                } else {
                  array_push($docentes_final[$position]["asignaturas"], $value["asignatura"]);
                }
              }
            }
            //Se elimina el campo "asignatura" ya que es innecesario y se agregan formaciones del docente
            foreach ($docentes_final as $key => $value) {
              unset($docentes_final[$key]["asignatura"]);
              $formacion_temp = new Formacion();
              $resultado_temp = $formacion_temp->consultarPor("formaciones", array("persona_id" => $value["persona_id"]), "*");
              $docentes_final[$key]["formaciones"] = $resultado_temp["data"];
              if (sizeof($docentes_final[$key]["formaciones"]) > 0) {
                foreach ($docentes_final[$key]["formaciones"] as $indice => $campos) {
                  $nivel_temp = new Nivel();
                  $nivel_temp->setAttributes(array('id' => $campos["nivel"]));
                  $resultado_temp = $nivel_temp->consultarId();
                  $docentes_final[$key]["formaciones"][$indice]["grado"] = $resultado_temp["data"];
                }
              }
            }
            //print_r($docentes_final);
            $resultado["data"]["docentes"] = $docentes_final;
            //Agregar las claves de las asignaturas a la infraestructura (Se eliminan  repetidos)
            $infraestructuras_final = array();
            foreach ($infraestructuras as $key => $value) {
              $value["asignaturas"] = [];
              if (empty($infraestructuras_final)) {
                array_push($value["asignaturas"], $value["asignatura"]);
                array_push($infraestructuras_final, $value);
              } else {
                $position = array_search($value["id"], array_column($infraestructuras_final, 'id'));
                if ($position === false) {
                  array_push($value["asignaturas"], $value["asignatura"]);
                  array_push($infraestructuras_final, $value);
                } else {
                  array_push($infraestructuras_final[$position]["asignaturas"], $value["asignatura"]);
                }
              }
            }
            //Se elimina el campo "asignatura" ya que es innecesario
            foreach ($infraestructuras_final as $key => $value) {
              unset($infraestructuras_final[$key]["asignatura"]);
              $temporal_instalacion = new TipoInstalacion();
              $temporal_instalacion->setAttributes(array('id' => $value["tipo_instalacion_id"]));
              $resultado_temp = $temporal_instalacion->consultarId();
              $infraestructuras_final[$key]["instalacion"] = $resultado_temp["data"];
            }
            $resultado["data"]["asignatura_infraestructura"] = $infraestructuras_final;
          }

          //Ratificación del nombre
          $ratificacion = new RatificacionNombre();
          $resultado_ratificacion = $ratificacion->consultarPor("ratificacion_nombres", array("institucion_id" => $resultado["data"]["programa"]["plantel"]["institucion_id"], "deleted_at"), "*");
          if (sizeof($resultado_ratificacion["data"]) > 0) {
            $resultado["data"]["ratificacion"] =  $resultado_ratificacion["data"][0];
          }

          //Dictamenes
          $dictamen = new PlantelDictamen();
          $dictamenes = $dictamen->consultarPor("plantel_dictamenes", array("plantel_id" => $resultado["data"]["programa"]["plantel"]["id"], "deleted_at"), "*");
          if (sizeof($dictamenes["data"]) > 0) {
            $resultado["data"]["plantel"]["dictamenes"] = $dictamenes["data"];
          }
          //Plantel edificios
          $edificio = new PlantelEdificioNivel();
          $niveles = $edificio->consultarPor("planteles_edificios_niveles", array("plantel_id" => $resultado["data"]["programa"]["plantel"]["id"], "deleted_at"), "*");
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
          $seguridades = $seguridad->consultarPor("planteles_seguridad_sistemas", array("plantel_id" => $resultado["data"]["programa"]["plantel"]["id"], "deleted_at"), "*");
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
          $higienes = $plantelHigiene->consultarPor("planteles_higienes", array("plantel_id" => $resultado["data"]["programa"]["plantel"]["id"], "deleted_at"), "*");
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
          $instituciones_salud = $salud->consultarPor("salud_instituciones", array("plantel_id" => $resultado["data"]["programa"]["plantel"]["id"], "deleted_at"), "*");
          $instituciones_salud = $instituciones_salud["data"];
          if (sizeof($instituciones_salud) > 0) {
            $resultado["data"]["plantel"]["instituciones_salud"] = $instituciones_salud;
          }

          //Infraestructura del plantel (No se imparten clase)
          $infraestructura = new Infraestructura();
          $infraestructuras = $infraestructura->consultarPor("infraestructuras", array("plantel_id" => $resultado["data"]["programa"]["plantel"]["id"], "deleted_at"), '*');
          $infraestructuras = $infraestructuras["data"];
          if (sizeof($infraestructuras) > 0) {
            //Obtener infraestructuras de uso común
            $infraestructura_final = array();
            foreach ($infraestructuras as $key => $value) {
              if ($value["tipo_instalacion_id"] >= 2) {
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

          // Evaluacion curricular
          $evaluacion = new ProgramaEvaluacion();
          $programa_evaluacion = $evaluacion->consultarPor("programa_evaluaciones", array("programa_id" => $resultado["data"]["programa"]["id"], "deleted_at"), '*');
          if (isset($programa_evaluacion["data"][0])) {
            $resultado["data"]["evaluacion"] = $programa_evaluacion["data"][0];

            //Programa evaluado
            $datos_programa_evaluacion = new Programa();
            $datos_programa_evaluacion->setAttributes(array('id' => $programa_evaluacion["data"][0]["programa_id"]));
            $res_datos_programa_evaluacion = $datos_programa_evaluacion->consultarId();
            $resultado["data"]["evaluacion"]["programa"] = $res_datos_programa_evaluacion["data"];


            // Tipo cumplimiento
            $tipo_cumplimiento = new Cumplimiento();
            $tipo_cumplimiento->setAttributes(array('id' => $programa_evaluacion["data"][0]["cumplimiento_id"]));
            $res_tipo_cumplimiento = $tipo_cumplimiento->consultarId();
            $resultado["data"]["evaluacion"]["tipo_cumplimiento"] = $res_tipo_cumplimiento["data"];

            // Evaluadores
            $evaluador = new Evaluador();
            $evaluador->setAttributes(array('id' => $programa_evaluacion["data"][0]["evaluador_id"]));
            $res_evaluador = $evaluador->consultarId();
            $resultado["data"]["evaluacion"]["evaluador"] = $res_evaluador["data"];
          }

          //Documentos
          $firma = new Documento();
          $res_firma = $firma->consultarPor("documentos", array("tipo_entidad" => Documento::$tipoEntidad["REPRESENTANTE"], "entidad_id" => $resultado["data"]["programa"]["solicitud"]["usuario_id"], "tipo_documento" => Documento::$nombresDocumentos["firma_representante"], "deleted_at"), "*");
          if (sizeof($res_firma["data"]) > 0) {
            $resultado["data"]["documentos"]["firma_representante"] = $res_firma["data"][0];
          }

          $logotipo = new Documento();
          $res_logotipo = $logotipo->consultarPor("documentos", array("tipo_entidad" => Documento::$tipoEntidad["INSTITUCION"], "entidad_id" => $resultado["data"]["programa"]["plantel"]["institucion_id"], "tipo_documento" => Documento::$nombresDocumentos["logotipo"], "deleted_at"), "*");
          if (sizeof($res_logotipo["data"]) > 0) {
            $resultado["data"]["documentos"]["logotipo"] = $res_logotipo["data"][0];
          }

          $estudioPertenencia = new Documento();
          $res_estudioPertenencia = $estudioPertenencia->consultarPor("documentos", array("tipo_entidad" => Documento::$tipoEntidad["PROGRAMA"], "entidad_id" => $resultado["data"]["programa"]["id"], "tipo_documento" => Documento::$nombresDocumentos["estudio_pertinencia"], "deleted_at"), "*");
          if (sizeof($res_estudioPertenencia["data"]) > 0) {
            $resultado["data"]["documentos"]["estudio_pertinencia"] = $res_estudioPertenencia["data"][0];
          }

          $FDP01 = new Documento();
          $res_fdp_01 = $FDP01->consultarPor("documentos", array("tipo_entidad" => Documento::$tipoEntidad["PROGRAMA"], "entidad_id" => $resultado["data"]["programa"]["id"], "tipo_documento" => Documento::$nombresDocumentos["formato_pedagogico_01"], "deleted_at"), "*");
          if (sizeof($res_fdp_01["data"]) > 0) {
            $resultado["data"]["documentos"]["formato_pedagogico_01"] = $res_fdp_01["data"][0];
          }

          $FDA05 = new Documento();
          $res_fda_05 = $FDA05->consultarPor("documentos", array("tipo_entidad" => Documento::$tipoEntidad["PROGRAMA"], "entidad_id" => $resultado["data"]["programa"]["id"], "tipo_documento" => Documento::$nombresDocumentos["formato_herramientas_05"], "deleted_at"), "*");
          if (sizeof($res_fda_05["data"]) > 0) {
            $resultado["data"]["documentos"]["formato_herramientas_05"] = $res_fda_05["data"][0];
          }

          $dictamenIMPI = new Documento();
          $res_dictamen_impi = $dictamenIMPI->consultarPor("documentos", array("tipo_entidad" => Documento::$tipoEntidad["INSTITUCION"], "entidad_id" => $resultado["data"]["programa"]["plantel"]["institucion_id"], "tipo_documento" => Documento::$nombresDocumentos["dictamen_impi"], "deleted_at"), "*");
          if (sizeof($res_dictamen_impi["data"]) > 0) {
            $resultado["data"]["documentos"]["dictamen_impi"] = $res_dictamen_impi["data"][0];
          }

          $ofertaDemanda = new Documento();
          $res_ofertaDemanda = $ofertaDemanda->consultarPor("documentos", array("tipo_entidad" => Documento::$tipoEntidad["PROGRAMA"], "entidad_id" => $resultado["data"]["programa"]["id"], "tipo_documento" => Documento::$nombresDocumentos["archivo_oferta_demanda"], "deleted_at"), "*");
          if (sizeof($res_ofertaDemanda["data"]) > 0) {
            $resultado["data"]["documentos"]["oferta_demanda"] = $res_ofertaDemanda["data"][0];
          }

          $convenios = new Documento();
          $res_convenios = $convenios->consultarPor("documentos", array("tipo_entidad" => Documento::$tipoEntidad["PROGRAMA"], "entidad_id" => $resultado["data"]["programa"]["id"], "tipo_documento" => Documento::$nombresDocumentos["convenios"], "deleted_at"), "*");
          if (sizeof($res_convenios["data"]) > 0) {
            $resultado["data"]["documentos"]["convenios"] = $res_convenios["data"][0];
          }

          $mapaCurricular = new Documento();
          $res_mapaCurricular = $mapaCurricular->consultarPor("documentos", array("tipo_entidad" => Documento::$tipoEntidad["PROGRAMA"], "entidad_id" => $resultado["data"]["programa"]["id"], "tipo_documento" => Documento::$nombresDocumentos["archivo_mapa_curricular"], "deleted_at"), "*");
          if (sizeof($res_mapaCurricular["data"]) > 0) {
            $resultado["data"]["documentos"]["mapa_curricular"] = $res_mapaCurricular["data"][0];
          }

          $reglasAcademia = new Documento();
          $res_reglasAcademia = $reglasAcademia->consultarPor("documentos", array("tipo_entidad" => Documento::$tipoEntidad["PROGRAMA"], "entidad_id" => $resultado["data"]["programa"]["id"], "tipo_documento" => Documento::$nombresDocumentos["archivo_reglas_academias"], "deleted_at"), "*");
          if (sizeof($res_reglasAcademia["data"]) > 0) {
            $resultado["data"]["documentos"]["reglas_academias"] = $res_reglasAcademia["data"][0];
          }

          $asignaturas = new Documento();
          $res_asignaturas = $asignaturas->consultarPor("documentos", array("tipo_entidad" => Documento::$tipoEntidad["PROGRAMA"], "entidad_id" => $resultado["data"]["programa"]["id"], "tipo_documento" => Documento::$nombresDocumentos["archivo_asignaturas_detalle"], "deleted_at"), "*");
          if (sizeof($res_asignaturas["data"]) > 0) {
            //print_r($res_asignaturas["data"]);
            $resultado["data"]["documentos"]["asignaturas"] = $res_asignaturas["data"][0];
          }

          $propuestaHemerobibliografica = new Documento();
          $res_propuestaHemerobibliografica = $propuestaHemerobibliografica->consultarPor("documentos", array("tipo_entidad" => Documento::$tipoEntidad["PROGRAMA"], "entidad_id" => $resultado["data"]["programa"]["id"], "tipo_documento" => Documento::$nombresDocumentos["propuesta_hemerobibliografica"], "deleted_at"), "*");
          if (sizeof($res_propuestaHemerobibliografica["data"]) > 0) {
            $resultado["data"]["documentos"]["propuesta_hemerobibliografica"] = $res_propuestaHemerobibliografica["data"][0];
          }

          if ($res_solicitud["tipo_solicitud_id"] != 3 && isset($resultado["data"]["programa"]["trayectoria"])) {
            $informeResultados = new Documento();
            $res_informeResultados = $informeResultados->consultarPor("documentos", array("tipo_entidad" => Documento::$tipoEntidad["TRAYECTORIA"], "entidad_id" => $resultado["data"]["programa"]["trayectoria"]["id"], "tipo_documento" => Documento::$nombresDocumentos["archivo_informe_resultados_trayectoria_educativa"], "deleted_at"), "*");
            if (sizeof($res_informeResultados["data"]) > 0) {
              $resultado["data"]["documentos"]["informe_resultados"] = $res_informeResultados["data"][0];
            }

            $instrumentosTrayectoria = new Documento();
            $res_instrumentosTrayectoria = $instrumentosTrayectoria->consultarPor("documentos", array("tipo_entidad" => Documento::$tipoEntidad["TRAYECTORIA"], "entidad_id" => $resultado["data"]["programa"]["trayectoria"]["id"], "tipo_documento" => Documento::$nombresDocumentos["archivo_instrumentos_trayectoria_educativa"], "deleted_at"), "*");
            if (sizeof($res_instrumentosTrayectoria["data"]) > 0) {
              $resultado["data"]["documentos"]["instrumentos_trayectoria"] = $res_instrumentosTrayectoria["data"][0];
            }

            $trayectoriaEducativa = new Documento();
            $res_trayectoriaEducativa = $trayectoriaEducativa->consultarPor("documentos", array("tipo_entidad" => Documento::$tipoEntidad["TRAYECTORIA"], "entidad_id" => $resultado["data"]["programa"]["trayectoria"]["id"], "tipo_documento" => Documento::$nombresDocumentos["archivo_trayectoria_educativa"], "deleted_at"), "*");
            if (sizeof($res_trayectoriaEducativa["data"]) > 0) {
              $resultado["data"]["documentos"]["trayectoria_educativa"] = $res_trayectoriaEducativa["data"][0];
            }
          }


          $biografia = new Documento();
          $res_biografia = $biografia->consultarPor("documentos", array("tipo_entidad" => Documento::$tipoEntidad["RATIFICACION"], "entidad_id" => $resultado["data"]["ratificacion"]["id"], "tipo_documento" => Documento::$nombresDocumentos["biografia"], "deleted_at"), "*");
          if (sizeof($res_biografia["data"]) > 0) {
            $resultado["data"]["documentos"]["biografia"] = $res_biografia["data"][0];
          }

          $bibliografia = new Documento();
          $res_bibliografia = $bibliografia->consultarPor("documentos", array("tipo_entidad" => Documento::$tipoEntidad["RATIFICACION"], "entidad_id" => $resultado["data"]["ratificacion"]["id"], "tipo_documento" => Documento::$nombresDocumentos["bibliografia"], "deleted_at"), "*");
          if (sizeof($res_bibliografia["data"]) > 0) {
            $resultado["data"]["documentos"]["bibliografia"] = $res_bibliografia["data"][0];
          }

          $identificacionRepresentante = new Documento();
          $res_identificacionRepresentante = $identificacionRepresentante->consultarPor("documentos", array("tipo_entidad" => Documento::$tipoEntidad["REPRESENTANTE"], "entidad_id" => $resultado["data"]["programa"]["solicitud"]["usuario_id"], "tipo_documento" => Documento::$nombresDocumentos["identificacion_representante"], "deleted_at"), "*");
          if (sizeof($res_identificacionRepresentante["data"]) > 0) {
            $resultado["data"]["documentos"]["identificacion_representante"] = $res_identificacionRepresentante["data"][0];
          }

          $pago = new Documento();
          $res_pago = $pago->consultarPor("documentos", array("tipo_entidad" => Documento::$tipoEntidad["SOLICITUD"], "entidad_id" => $resultado["data"]["programa"]["solicitud_id"], "tipo_documento" => Documento::$nombresDocumentos["comprobante_pago"], "deleted_at"), "*");
          if (sizeof($res_pago["data"]) > 0) {
            $resultado["data"]["documentos"]["pago"] = $res_pago["data"][0];
          }

          $inmueble = new Documento();
          $res_inmueble = $inmueble->consultarPor("documentos", array("tipo_entidad" => Documento::$tipoEntidad["PLANTEL"], "entidad_id" => $resultado["data"]["programa"]["plantel_id"], "tipo_documento" => Documento::$nombresDocumentos["acreditacion_inmueble"], "deleted_at"), "*");
          if (sizeof($res_inmueble["data"]) > 0) {
            $resultado["data"]["documentos"]["inmueble"] = $res_inmueble["data"][0];
          }

          $fotografias = new Documento();
          $res_fotografias = $fotografias->consultarPor("documentos", array("tipo_entidad" => Documento::$tipoEntidad["PLANTEL"], "entidad_id" => $resultado["data"]["programa"]["plantel_id"], "tipo_documento" => Documento::$nombresDocumentos["fotografia_inmueble"], "deleted_at"), "*");
          if (sizeof($res_fotografias["data"]) > 0) {
            $resultado["data"]["documentos"]["fotografias"] = $res_fotografias["data"][0];
          }

          $plano = new Documento();
          $res_plano = $plano->consultarPor("documentos", array("tipo_entidad" => Documento::$tipoEntidad["PLANTEL"], "entidad_id" => $resultado["data"]["programa"]["plantel_id"], "tipo_documento" => Documento::$nombresDocumentos["plano"], "deleted_at"), "*");
          if (sizeof($res_plano["data"]) > 0) {
            $resultado["data"]["documentos"]["plano"] = $res_plano["data"][0];
          }

          $dictamenes = new Documento();
          $res_dictamenes = $dictamenes->consultarPor("documentos", array("tipo_entidad" => Documento::$tipoEntidad["PLANTEL"], "entidad_id" => $resultado["data"]["programa"]["plantel_id"], "tipo_documento" => Documento::$nombresDocumentos["dictamenes"], "deleted_at"), "*");
          if (sizeof($res_dictamenes["data"]) > 0) {
            $resultado["data"]["documentos"]["dictamenes"] = $res_dictamenes["data"][0];
          }

          $infejal = new Documento();
          $res_infejal = $infejal->consultarPor("documentos", array("tipo_entidad" => Documento::$tipoEntidad["PLANTEL"], "entidad_id" => $resultado["data"]["programa"]["plantel_id"], "tipo_documento" => Documento::$nombresDocumentos["constancia_infejal"], "deleted_at"), "*");
          if (sizeof($res_infejal["data"]) > 0) {
            $resultado["data"]["documentos"]["infejal"] = $res_infejal["data"][0];
          }

          $licenciaMunicipal = new Documento();
          $res_licenciaMunicipal = $licenciaMunicipal->consultarPor("documentos", array("tipo_entidad" => Documento::$tipoEntidad["PLANTEL"], "entidad_id" => $resultado["data"]["programa"]["plantel_id"], "tipo_documento" => Documento::$nombresDocumentos["licencia_municipal"], "deleted_at"), "*");
          if (sizeof($res_licenciaMunicipal["data"]) > 0) {
            $resultado["data"]["documentos"]["licencia_municipal"] = $res_licenciaMunicipal["data"][0];
          }

          $secretariaSalud = new Documento();
          $res_secretariaSalud = $secretariaSalud->consultarPor("documentos", array("tipo_entidad" => Documento::$tipoEntidad["PLANTEL"], "entidad_id" => $resultado["data"]["programa"]["plantel_id"], "tipo_documento" => Documento::$nombresDocumentos["secretaria_salud"], "deleted_at"), "*");
          if (sizeof($res_secretariaSalud["data"]) > 0) {
            $resultado["data"]["documentos"]["secretaria_salud"] = $res_secretariaSalud["data"][0];
          }

          $telefono = new Documento();
          $res_telefono = $telefono->consultarPor("documentos", array("tipo_entidad" => Documento::$tipoEntidad["PLANTEL"], "entidad_id" => $resultado["data"]["programa"]["plantel_id"], "tipo_documento" => Documento::$nombresDocumentos["comprobante_telefono"], "deleted_at"), "*");
          if (sizeof($res_telefono["data"]) > 0) {
            $resultado["data"]["documentos"]["comprobante_telefono"] = $res_telefono["data"][0];
          }

          $calendario = new Documento();
          $res_calendario = $calendario->consultarPor("documentos", array("tipo_entidad" => Documento::$tipoEntidad["PROGRAMA"], "entidad_id" => $resultado["data"]["programa"]["id"], "tipo_documento" => Documento::$nombresDocumentos["propuesta_calendario"], "deleted_at"), "*");
          if (sizeof($res_calendario["data"]) > 0) {
            $resultado["data"]["documentos"]["propuesta_calendario"] = $res_calendario["data"][0];
          }

          $acuerdoAnterior = new Documento();
          $res_acuerdoAnterior = $acuerdoAnterior->consultarPor("documentos", array("tipo_entidad" => Documento::$tipoEntidad["PROGRAMA"], "entidad_id" => $resultado["data"]["programa"]["id"], "tipo_documento" => Documento::$nombresDocumentos["acuerdo_anterior"], "deleted_at"), "*");
          if (sizeof($res_acuerdoAnterior["data"]) > 0) {
            $resultado["data"]["documentos"]["acuerdo_anterior"] = $res_acuerdoAnterior["data"][0];
          }

          $vinculacion = new Documento();
          $res_vinculacion = $vinculacion->consultarPor("documentos", array("tipo_entidad" => Documento::$tipoEntidad["PROGRAMA"], "entidad_id" => $resultado["data"]["programa"]["id"], "tipo_documento" => Documento::$nombresDocumentos["proyecto_vinculacion"], "deleted_at"), "*");
          if (sizeof($res_vinculacion["data"]) > 0) {
            $resultado["data"]["documentos"]["proyecto_vinculacion"] = $res_vinculacion["data"][0];
          }

          $superacion = new Documento();
          $res_superacion = $superacion->consultarPor("documentos", array("tipo_entidad" => Documento::$tipoEntidad["PROGRAMA"], "entidad_id" => $resultado["data"]["programa"]["id"], "tipo_documento" => Documento::$nombresDocumentos["programa_superacion"], "deleted_at"), "*");
          if (sizeof($res_superacion["data"]) > 0) {
            $resultado["data"]["documentos"]["programa_superacion"] = $res_superacion["data"][0];
          }

          $mejora = new Documento();
          $res_mejora = $mejora->consultarPor("documentos", array("tipo_entidad" => Documento::$tipoEntidad["PROGRAMA"], "entidad_id" => $resultado["data"]["programa"]["id"], "tipo_documento" => Documento::$nombresDocumentos["plan_mejora"], "deleted_at"), "*");
          if (sizeof($res_mejora["data"]) > 0) {
            $resultado["data"]["documentos"]["plan_mejora"] = $res_mejora["data"][0];
          }

          $reglamento = new Documento();
          $res_reglamento = $reglamento->consultarPor("documentos", array("tipo_entidad" => Documento::$tipoEntidad["PROGRAMA"], "entidad_id" => $resultado["data"]["programa"]["id"], "tipo_documento" => Documento::$nombresDocumentos["reglamento_institucional"], "deleted_at"), "*");
          if (sizeof($res_reglamento["data"]) > 0) {
            $resultado["data"]["documentos"]["reglamento_institucional"] = $res_reglamento["data"][0];
          }

          if (isset($resultado["data"]["evaluacion"])) {
            $dictamen_evaluacion = new Documento();
            $res_dictamen_evaluacion = $dictamen_evaluacion->consultarPor("documentos", array("tipo_entidad" => Documento::$tipoEntidad["EVALUACION"], "entidad_id" => $resultado["data"]["evaluacion"]["id"], "tipo_documento" => Documento::$nombresDocumentos["dictamen_evaluacion"], "deleted_at"), "*");
            if (sizeof($res_dictamen_evaluacion["data"]) > 0) {
              $resultado["data"]["documentos"]["dictamen_evaluacion"] = $res_dictamen_evaluacion["data"][0];
            }
          }

          $horarios = new Documento();
          $res_horarios = $horarios->consultarPor("documentos", array("tipo_entidad" => Documento::$tipoEntidad["PROGRAMA"], "entidad_id" => $resultado["data"]["programa"]["id"], "tipo_documento" => Documento::$nombresDocumentos["propuesta_horario"], "deleted_at"), "*");
          if (sizeof($res_horarios["data"]) > 0) {
            $resultado["data"]["documentos"]["propuesta_horario"] = $res_horarios["data"][0];
          }
        } else {
          $resultado["status"] = "202";
          if ($_SESSION["rol_id"] == 2 || $_SESSION["rol_id"] >= 7) {
            $resultado["data"] = '../views/solicitudes.php';
          } else {
            $resultado["data"] = '../views/mis-solicitudes.php';
          }
        }
      } else //Redirecciona por que la solictud no te pertenece
      {
        $resultado["status"] = "202";
        $resultado["data"] = '../views/mis-solicitudes.php';
      }
    } else //Retornar a vista de solicitudes debido a que no existe la solicitud con el id
    {
      $resultado["status"] = "202";
      if ($_SESSION["rol_id"] == 2 || $_SESSION["rol_id"] >= 7) {
        $resultado["data"] = '../views/solicitudes.php';
      } else {
        $resultado["data"] = '../views/mis-solicitudes.php';
      }
    }
    // Registro en bitacora
    /* $bitacora = new Bitacora();
      $usuarioId= isset($_SESSION["id"])?$_SESSION["id"]:-1;
      $bitacora->setAttributes(["usuario_id"=>$usuarioId,"entidad"=>"solicitudes_usuarios","accion"=>"datosSolicitud","lugar"=>"control-solicitud-usuario"]);
      $result = $bitacora->guardar(); */
    retornarWebService($url, $resultado);
  }
}
