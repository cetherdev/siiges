
<?php
/**
 * Archivo que gestiona los web services de la clase Solicitud
 */

require_once "../models/modelo-solicitud.php";
require_once "../models/modelo-vdetalles-solicitud.php";
require_once "../models/modelo-solicitud-estatus.php";
require_once "../models/modelo-institucion.php";
require_once "../models/modelo-plantel.php";
require_once "../models/modelo-mixta-noescolarizada.php";
require_once "../models/modelo-ratificacion-nombre.php";
require_once "../models/modelo-programa.php";
require_once "../models/modelo-persona.php";
require_once "../models/modelo-formacion.php";
require_once "../models/modelo-experiencia.php";
require_once "../models/modelo-domicilio.php";
require_once "../models/modelo-infraestructura.php";
require_once "../models/modelo-salud-institucion.php";
require_once "../models/modelo-plantel-dictamen.php";
require_once "../models/modelo-espejo.php";
require_once "../models/modelo-trayectoria.php";
require_once "../models/modelo-respaldo.php";
require_once "../models/modelo-publicacion.php";
require_once "../models/modelo-plantel-edificio-nivel.php";
require_once "../models/modelo-plantel-dictamen.php";
require_once "../models/modelo-plantel-seguridad-sistema.php";
require_once "../models/modelo-oficio.php";
require_once "../models/modelo-seguridad-sistema.php";
require_once "../models/modelo-higiene.php";
require_once "../models/modelo-plantel-higiene.php";
require_once "../models/modelo-solicitud-usuario.php";
require_once "../models/modelo-nivel.php";
require_once "../models/modelo-evaluador.php";
require_once "../models/modelo-programa-evaluacion.php";
require_once "../models/modelo-programa-turno.php";
require_once "../models/modelo-asignatura.php";
require_once "../models/modelo-docente.php";
require_once "../models/modelo-documento.php";
require_once "../models/modelo-rol.php";
require_once "../models/modelo-modalidad.php";
require_once "../models/modelo-usuario.php";
require_once "../models/modelo-estatus-solicitud.php";
require_once "../utilities/utileria-general.php";
require_once "../models/modelo-bitacora.php";

if (session_status() === PHP_SESSION_NONE) {
  session_start();
}
function retornarWebService($url, $resultado)
{
  if ($url != "") {

    $_SESSION["resultado"] = json_encode($resultado);
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
  $obj = new Solicitud();
  $obj->setAttributes(array());
  $resultado = $obj->consultarTodos();
  // Registro en bitacora
  /* $bitacora = new Bitacora();
  $usuarioId = isset($_SESSION["id"]) ? $_SESSION["id"] : -1;
  $bitacora->setAttributes(["usuario_id" => $usuarioId, "entidad" => "solicitudes", "accion" => "consultarTodos", "lugar" => "control-solicitud"]);
  $result = $bitacora->guardar(); */
  retornarWebService($_POST["url"], $resultado);
}

// Web service para consultar registro por id
if ($_POST["webService"] == "consultarId") {
  $obj = new Solicitud();
  $aux = new Utileria();
  $_POST = $aux->limpiarEntrada($_POST);
  $obj->setAttributes(array("id" => $_POST["id"]));
  $resultado = $obj->consultarId();
  // Registro en bitacora
  /* $bitacora = new Bitacora();
  $usuarioId = isset($_SESSION["id"]) ? $_SESSION["id"] : -1;
  $bitacora->setAttributes(["usuario_id" => $usuarioId, "entidad" => "solicitudes", "accion" => "consultarId", "lugar" => "control-solicitud"]);
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
  $obj = new Solicitud();
  $obj->setAttributes($parametros);
  $resultado = $obj->guardar();
  // Registro en bitacora
  /* $bitacora = new Bitacora();
  $usuarioId = isset($_SESSION["id"]) ? $_SESSION["id"] : -1;
  $bitacora->setAttributes(["usuario_id" => $usuarioId, "entidad" => "solicitudes", "accion" => "guardar", "lugar" => "control-solicitud"]);
  $result = $bitacora->guardar(); */
  retornarWebService($_POST["url"], $resultado);
}

// Web service para eliminar registro
if ($_POST["webService"] == "eliminar") {
  $obj = new Solicitud();
  $aux = new Utileria();
  $_POST = $aux->limpiarEntrada($_POST);
  $obj->setAttributes(array("id" => $_POST["id"]));
  $resultado = $obj->eliminar();
  // Registro en bitacora
  /* $bitacora = new Bitacora();
  $usuarioId = isset($_SESSION["id"]) ? $_SESSION["id"] : -1;
  $bitacora->setAttributes(["usuario_id" => $usuarioId, "entidad" => "solicitudes", "accion" => "eliminar", "lugar" => "control-solicitud"]);
  $result = $bitacora->guardar(); */
  retornarWebService($_POST["url"], $resultado);
}

//Web service para guardar una solicitud
if ($_POST["webService"] == "guardarSolicitud") {
  $aux = new Utileria();
  $_POST = $aux->limpiarEntrada($_POST);
  $parametrosEdificio = [];
  $parametrosDictamenPlantel = [];
  $parametrosSalud = [];
  $parametrosIfraestructura = [];
  foreach ($_POST as $atributo => $valor) {
    if (strstr($atributo, '-', true) == "INSTITUCION") {
      $parametrosInstitucion[substr(strstr($atributo, '-'), 1)] = $valor;
    }
    if (strstr($atributo, '-', true) == "RATIFICACION") {
      $parametrosRatificacion[substr(strstr($atributo, '-'), 1)] = $valor;
    }
    if (strstr($atributo, '-', true) == "RECTOR") {
      $parametrosRector[substr(strstr($atributo, '-'), 1)] = $valor;
    }
    if (strstr($atributo, '-', true) == "DIRECTOR") {
      $parametrosDirector[substr(strstr($atributo, '-'), 1)] = $valor;
    }
    if (strstr($atributo, '-', true) == "DOMICILIOPLANTEL") {
      $parametrosDomicilioPlantel[substr(strstr($atributo, '-'), 1)] = $valor;
    }
    if (strstr($atributo, '-', true) == "PLANTEL") {
      $parametrosPlantel[substr(strstr($atributo, '-'), 1)] = $valor;
    }
    if (strstr($atributo, '-', true) == "EDIFICIO") {
      $parametrosEdificio[substr(strstr($atributo, '-'), 1)] = $valor;
    }
    if (strstr($atributo, '-', true) == "DICTAMEN") {
      $parametrosDictamenPlantel[substr(strstr($atributo, '-'), 1)] = $valor;
    }
    if (strstr($atributo, '-', true) == "SEGURIDAD") {
      $parametrosSeguridad[substr(strstr($atributo, '-'), 1)] = $valor;
    }
    if (strstr($atributo, '-', true) == "HIGIENE") {
      $parametrosHigiene[substr(strstr($atributo, '-'), 1)] = $valor;
    }
    if (strstr($atributo, '-', true) == "SALUD") {
      $parametrosSalud[substr(strstr($atributo, '-'), 1)] = $valor;
    }
    if (strstr($atributo, '-', true) == "INFRAESTRUCTURA") {
      $parametrosIfraestructura[substr(strstr($atributo, '-'), 1)] = $valor;
    }
    if (strstr($atributo, '-', true) == "MIXTA") {
      $parametrosMixta[substr(strstr($atributo, '-'), 1)] = $valor;
    }
    if (strstr($atributo, '-', true) == "ESPEJO") {
      $parametrosEspejo[substr(strstr($atributo, '-'), 1)] = $valor;
    }
    if (strstr($atributo, '-', true) == "RESPALDO") {
      $parametrosRespaldo[substr(strstr($atributo, '-'), 1)] = $valor;
    }
    if (strstr($atributo, '-', true) == "DILIGENCIAS") {
      $parametrosDiligencias[substr(strstr($atributo, '-'), 1)] = $valor;
    }
    if (strstr($atributo, '-', true) == "COORDINADOR") {
      $parametrosCoordinador[substr(strstr($atributo, '-'), 1)] = $valor;
    }
    if (strstr($atributo, '-', true) == "PROGRAMA") {
      $parametrosPrograma[substr(strstr($atributo, '-'), 1)] = $valor;
    }
    if (strstr($atributo, '-', true) == "DOCENTE") {
      $parametrosDocente[substr(strstr($atributo, '-'), 1)] = $valor;
    }
    if (strstr($atributo, '-', true) == "ASIGNATURA") {
      $parametrosAsignatura[substr(strstr($atributo, '-'), 1)] = $valor;
    }
    if (strstr($atributo, '-', true) == "TRAYECTORIA") {
      $parametrosTrayectoria[substr(strstr($atributo, '-'), 1)] = $valor;
    }
    if (strstr($atributo, '-', true) == "REPRESENTANTE") {
      $parametrosRepresentante[substr(strstr($atributo, '-'), 1)] = $valor;
    }
    if (strstr($atributo, '-', true) == "EVALUACION") {
      $parametrosEvaluacion[substr(strstr($atributo, '-'), 1)] = $valor;
    }
  }

  $opcion_guardado = isset($_POST["opcion_guardado"]) ? $_POST["opcion_guardado"] : "1"; //Auxiliar para actulizar las tablas de que se crean en las solicitudes
  $errores = "";
  $entidadesIds = [];
  $idUsuario = "";

  //Actuliazar información del representante
  $personaRepresentante = new Persona();
  $personaRepresentante->setAttributes($parametrosRepresentante);
  $personaRepresentante->guardar();
  $domicilioRepresentante = new Domicilio();

  if ($parametrosRepresentante["domicilio_id"] == 1) {
    $domicilioRepresentante->setAttributes(array("calle" => $parametrosRepresentante["calle"], "numero_exterior" => $parametrosRepresentante["numero_exterior"], "numero_interior" => $parametrosRepresentante["numero_interior"], "colonia" => $parametrosRepresentante["colonia"], "municipio" => $parametrosRepresentante["municipio"], "estado" => "Jalisco", "codigo_postal" => $parametrosRepresentante["codigo_postal"], "pais" => "México"));
  } else {
    $parametrosRepresentante["id"] = $parametrosRepresentante["domicilio_id"];
    $domicilioRepresentante->setAttributes($parametrosRepresentante);
  }

  $res_domicilio = $domicilioRepresentante->guardar();
  $actualizarDomicilio = new Persona();
  $actualizarDomicilio->setAttributes(array("id" => $parametrosRepresentante["id"], "domicilio_id" => $res_domicilio["data"]["id"]));
  $actualizarDomicilio->guardar();

  // Institucion
  try {
    if (session_status() === PHP_SESSION_NONE) {
      session_start();
    }
    // Solo los representantes legales pueden crear una nueva solicitud
    if (Rol::ROL_REPRESENTANTE_LEGAL == $_SESSION["rol_id"] || Rol::ROL_GESTOR  == $_SESSION["rol_id"]) {
      $parametrosInstitucion["usuario_id"] =  $_SESSION["id"];
      if (Rol::ROL_GESTOR  == $_SESSION["rol_id"]) {
        $gestor = new Usuario();
        $representanteGestor = $gestor->consultarPor("usuario_usuarios", array("secundario_id" => $_SESSION["id"]), "*");
        $id_usuario = $representanteGestor["data"][0]["principal_id"];
        $parametrosInstitucion["usuario_id"] =  $id_usuario;
      }
    } else if (!isset($parametrosInstitucion["usuario_id"])) {
      // representante es el usuario_id
      // No permite continual
      //throw new Exception("INSTITUCION - representante no existe.");
    }
    $institucion = new Institucion();
    $institucion->setAttributes($parametrosInstitucion);
    $institucion = $institucion->guardar();
    $entidadesIds["INSTITUCION"] = isset($institucion["data"]["id"]) ? $institucion["data"]["id"] : false;
    $entidadesIds["REPRESENTANTE"] = $parametrosInstitucion["usuario_id"];

    // Ratificacion
    if (!$entidadesIds["INSTITUCION"]) {
      throw new Exception("INSTITUCION - error al guardar");
    } else {
      $institucion = new Institucion();
      $institucion->setAttributes(["id" => $entidadesIds["INSTITUCION"]]);
      $institucion = $institucion->consultarId();
      $institucion = isset($institucion["data"]) ? $institucion["data"] : false;

      // Si no tiene nombre autorizado se requiere ratificacion de nombre
      if (!$institucion["es_nombre_autorizado"]) {

        // Al menos es necesario un nombre propuesto
        if (
          !empty($parametrosRatificacion["nombre_propuesto1"]) ||
          !empty($parametrosRatificacion["nombre_propuesto2"]) ||
          !empty($parametrosRatificacion["nombre_propuesto3"])
        ) {
          $ratificacion = new RatificacionNombre();
          $parametrosRatificacion["institucion_id"] = $entidadesIds["INSTITUCION"];
          $ratificacion->setAttributes($parametrosRatificacion);
          $ratificacion = $ratificacion->guardar();
          $entidadesIds["RATIFICACION"] = isset($ratificacion["data"]["id"]) ? $ratificacion["data"]["id"] : false;
          if (!$entidadesIds["RATIFICACION"]) throw new Exception("RATIFICACION - error al guardar");
        } else {
          $errores .= "<br>" . "RATIFICACION - Almenos se necesita un nombre propuesto.";
        }
      }

      // Domicilio
      if (empty($parametrosDomicilioPlantel["calle"])) {
        $entidadesIds["DOMICILIO"] = false;
      } else {
        $domicilio = new Domicilio();
        $domicilio->setAttributes($parametrosDomicilioPlantel);
        $domicilio = $domicilio->guardar();
        $entidadesIds["DOMICILIO"] = isset($domicilio["data"]["id"]) ? $domicilio["data"]["id"] : false;
      }

      // Rector
      if (!$entidadesIds["DOMICILIO"]) {
        $entidadesIds["RECTOR"] = false;
        throw new Exception("DOMICILIO - error al guardar");
      } else if (!empty($parametrosRector["nombre"])) {
        $rector = new Persona();
        $parametrosRector["domicilio_id"] = $entidadesIds["DOMICILIO"];
        $parametrosRector["fotografia"] = Persona::FOTO_DEFAULT;
        $rector->setAttributes($parametrosRector);
        $rector = $rector->guardar();
        $entidadesIds["RECTOR"] = isset($rector["data"]["id"]) ? $rector["data"]["id"] : false;

        if ($entidadesIds["RECTOR"]) {
          // Formaciones Rector
          $formaciones = isset($parametrosRector["formaciones"]) ? $parametrosRector["formaciones"] : [];
          foreach ($formaciones as $cadena) {
            $cadena = str_replace('\\', '', $cadena);
            $formacion = json_decode($cadena);
            $objFormacion = new Formacion();
            if (isset($formacion->borrar) && $formacion->borrar == 1) {
              $objFormacion->setAttributes(array("id" => $formacion->id));
              $objFormacion->eliminar();
            } else {
              $formacion->persona_id = $rector["data"]["id"];
              $objFormacion->setAttributes((array)$formacion);
              $objFormacion->guardar();
            }
          }
        }
      }

      // Director
      if (!$entidadesIds["DOMICILIO"]) {
        $entidadesIds["DIRECTOR"] = false;
        throw new Exception("DOMICILIO - error al guardar");
      } else if (!empty($parametrosDirector["nombre"])) {

        $director = new Persona();
        $parametrosDirector["domicilio_id"] = $entidadesIds["DOMICILIO"];
        $parametrosDirector["fotografia"] = Persona::FOTO_DEFAULT;
        $director->setAttributes($parametrosDirector);
        $director = $director->guardar();
        $entidadesIds["DIRECTOR"] = isset($director["data"]["id"]) ? $director["data"]["id"] : false;

        if (!$entidadesIds["DIRECTOR"]) {

          throw new Exception("DIRECTOR - error al guardar");
        } else {

          // Publicaciones Director
          $publicaciones = isset($parametrosDirector["publicaciones"]) ? $parametrosDirector["publicaciones"] : [];
          foreach ($publicaciones as $cadena) {
            $cadena = str_replace('\\', '', $cadena);
            $publicacion = json_decode($cadena);
            $objPublicacion = new Publicacion();
            if (isset($publicacion->borrar) && $publicacion->borrar == 1) {
              $objPublicacion->setAttributes(array("id" => $publicacion->id));
              $objPublicacion->eliminar();
            } else {
              $publicacion->persona_id = $entidadesIds["DIRECTOR"];
              $objPublicacion->setAttributes((array)$publicacion);
              $objPublicacion->guardar();
            }
          }

          // Formaciones Director
          $formaciones = isset($parametrosDirector["formaciones"]) ? $parametrosDirector["formaciones"] : [];
          foreach ($formaciones as $cadena) {
            $cadena = str_replace('\\', '', $cadena);
            $formacion = json_decode($cadena);
            $objFormacion = new Formacion();
            if (isset($formacion->borrar) && $formacion->borrar == 1) {
              $objFormacion->setAttributes(array("id" => $formacion->id));
              $objFormacion->eliminar();
            } else {
              $formacion->persona_id = $director["data"]["id"];
              $objFormacion->setAttributes((array)$formacion);
              $objFormacion->guardar();
            }
          }

          // Experiencia Director
          $experiencias = isset($parametrosDirector["experiencias"]) ? $parametrosDirector["experiencias"] : [];
          foreach ($experiencias as $cadena) {
            $cadena = str_replace('\\', '', $cadena);
            $experiencia = json_decode($cadena);
            $objExperiencia = new Experiencia();
            if (isset($experiencia->borrar) && $experiencia->borrar == 1) {
              $objExperiencia->setAttributes(array("id" => $experiencia->id));
              $objExperiencia->eliminar();
            } else {
              $experiencia->persona_id = $director["data"]["id"];
              $objExperiencia->setAttributes((array)$experiencia);
              $objExperiencia->guardar();
            }
          }
        }

        //Plantel
        $plantel = new Plantel();
        $parametrosPlantel["institucion_id"] = $entidadesIds["INSTITUCION"];
        $parametrosPlantel["domicilio_id"] = $entidadesIds["DOMICILIO"];
        $parametrosPlantel["rector_id"] = $entidadesIds["RECTOR"];
        $parametrosPlantel["persona_id"] = $entidadesIds["DIRECTOR"];
        $plantel->setAttributes($parametrosPlantel);
        $plantel = $plantel->guardar();
        $entidadesIds["PLANTEL"] = isset($plantel["data"]["id"]) ? $plantel["data"]["id"] : false;

        if (!$entidadesIds["PLANTEL"]) {
          throw new Exception("PLANTEL - error al guardar");
        } else {

          //Edificios
          foreach ($parametrosEdificio as $key => $nivel) {
            $plantelEdificio = new PlantelEdificioNivel();
            $niveles["edificio_nivel_id"] = $nivel;
            $niveles["plantel_id"] = $entidadesIds["PLANTEL"];
            $objEdificio = new PlantelEdificioNivel();
            $resObjEdificio = $objEdificio->consultarPor("planteles_edificios_niveles", array("plantel_id" => $entidadesIds["PLANTEL"], "edificio_nivel_id" => $nivel), "id");
            if (sizeof($resObjEdificio["data"]) > 0) {
              $niveles["id"] = $resObjEdificio["data"][0]["id"];
            }
            $plantelEdificio->setAttributes($niveles);
            $plantelEdificio->guardar();
          }

          //Elimna los edificios
          if ($opcion_guardado == 2) {
            $edificio = new PlantelEdificioNivel();
            $edificiosActuales = $edificio->consultarPor("planteles_edificios_niveles", array("plantel_id" => $entidadesIds["PLANTEL"], "deleted_at"), "id,edificio_nivel_id");
            foreach ($edificiosActuales["data"] as $key => $campo) {
              $existe = in_array($campo["edificio_nivel_id"], $parametrosEdificio);
              if (!$existe) {
                $edificioBorrar = new PlantelEdificioNivel();
                $edificioBorrar->setAttributes(array("id" => $campo["id"]));
                $edificioBorrar->eliminar();
              }
            }
          }

          // Dictamenes Plantel
          $dictamenes = isset($parametrosDictamenPlantel["dictamenes"]) ? $parametrosDictamenPlantel["dictamenes"] : [];
          foreach ($dictamenes as $cadena) {
            $cadena = str_replace('\\', '', $cadena);
            $dictamenPlantel = json_decode($cadena);
            $dictamenPlantel->plantel_id = $entidadesIds["PLANTEL"];
            $objPlantelDictamen = new PlantelDictamen();
            if (isset($dictamenPlantel->borrar) && $dictamenPlantel->borrar == 1) {
              $objPlantelDictamen->setAttributes(array("id" => $dictamenPlantel->id));
              $objPlantelDictamen->eliminar();
            } else {
              $objPlantelDictamen->setAttributes((array)$dictamenPlantel);
              $objPlantelDictamen->guardar();
            }
          }

          // Seguridad Plantel
          if (isset($parametrosSeguridad)) {
            foreach ($parametrosSeguridad as $key => $value) {
              $seguridad["plantel_id"] = $entidadesIds["PLANTEL"];
              $seguridad["seguridad_sistema_id"] = SeguridadSistema::$seguridad[$key];
              $seguridad["cantidad"] = $value;
              $actualizarSeguridad = new PlantelSeguridadSistema();
              $res_actulizarSeguridad =  $actualizarSeguridad->consultarPor("planteles_seguridad_sistemas", array("plantel_id" => $entidadesIds["PLANTEL"], "seguridad_sistema_id" => $seguridad["seguridad_sistema_id"]), "id");
              if (sizeof($res_actulizarSeguridad["data"]) > 0) {
                $seguridad["id"] = $res_actulizarSeguridad["data"][0]["id"];
              }

              $objPlantelSeguridad = new PlantelSeguridadSistema();
              $objPlantelSeguridad->setAttributes($seguridad);
              $objPlantelSeguridad->guardar();
            }
          }

          // Higiene Plantel
          if (isset($parametrosSeguridad)) {
            foreach ($parametrosHigiene as $key => $value) {
              $higiene["plantel_id"] = $entidadesIds["PLANTEL"];
              $higiene["higiene_id"] = Higiene::$higiene[$key];
              $higiene["cantidad"] = $value;
              $actualizarHigiene = new PlantelHigiene();
              $res_actulizarHigiene = $actualizarHigiene->consultarPor("planteles_higienes", array("plantel_id" => $higiene["plantel_id"], "higiene_id" => $higiene["higiene_id"]), "id");
              if (sizeof($res_actulizarHigiene["data"]) > 0) {
                $higiene["id"] = $res_actulizarHigiene["data"][0]["id"];
              }

              $objPlanteHigiene = new PlantelHigiene();
              $objPlanteHigiene->setAttributes($higiene);
              $objPlanteHigiene->guardar();
            }
          }

          // Salud Plantel
          $institucionesSalud = isset($parametrosSalud["nombresInstitucionSalud"]) ? $parametrosSalud["nombresInstitucionSalud"] : [];
          foreach ($institucionesSalud as $cadena) {
            $cadena = str_replace('\\', '', $cadena);
            $salud = json_decode($cadena);
            $objSalud = new SaludInstitucion();

            $salud->plantel_id = $entidadesIds["PLANTEL"];
            if (isset($salud->borrar) && $salud->borrar == 1) {
              $objSalud->setAttributes(array("id" => $salud->id));
              $objSalud->eliminar();
            } else {
              $objSalud->setAttributes((array)$salud);
              $objSalud->guardar();
            }
          }

          // Infraestructura Plantel
          $asignaturaInfraestructura = [];
          $infraestructuras = isset($parametrosIfraestructura["infraestructuras"]) ? $parametrosIfraestructura["infraestructuras"] : [];
          foreach ($infraestructuras as $cadena) {
            $cadena = str_replace('\\', '', $cadena);
            $infraestructura = json_decode($cadena);
            $objInfraestructura = new Infraestructura();

            if (isset($infraestructura->borrar) && $infraestructura->borrar == 1) {
              $objInfraestructura->setAttributes(array("id" => $infraestructura->id));
              $objInfraestructura->eliminar();
            } else {
              $infraestructura->plantel_id = $entidadesIds["PLANTEL"];

              if (isset($_POST["SOLICITUD-id"])) {
                $infraestructura->solicitud_id = $_POST["SOLICITUD-id"];
              }
              $objInfraestructura->setAttributes((array)$infraestructura);
              $resultadoInfraestructura = $objInfraestructura->guardar();

              if (!isset($resultadoInfraestructura["data"]["id"])) {
                $errores .= "INFRAESTRUCTURA - error al guardar";
              } else {
                if ($infraestructura->asignaturas !== 'USO COMÚN') {
                  foreach ($infraestructura->asignaturas as $asignatura) {
                    $asignaturaInfraestructura[$asignatura] = $resultadoInfraestructura["data"]["id"];
                  }
                }
              }
            }
          }
        }

        // Solicitud
        try {
          if (!isset($_POST["SOLICITUD-tipo_solicitud_id"])) {
            $entidadesIds["SOLICITUD"] = false;
            throw new Exception("SOLICITUD - tipo de solicitud no seleccionada");
          } else {
            $solicitud = new Solicitud();
            if (isset($_POST["SOLICITUD-id"])) {
              $parametrosSolicitud["id"] = $_POST["SOLICITUD-id"];
            }
            $parametrosSolicitud["tipo_solicitud_id"] = $_POST["SOLICITUD-tipo_solicitud_id"];
            $parametrosSolicitud["usuario_id"] = $parametrosInstitucion["usuario_id"];
            $parametrosSolicitud["convocatoria"] = $_POST["SOLICITUD-convocatoria"];

            //$parametrosSolicitud["fecha"]
            $parametrosSolicitud["estatus_solicitud_id"] = isset($_POST["SOLICITUD-estatus_solicitud_id"]) ? $_POST["SOLICITUD-estatus_solicitud_id"] : Solicitud::NUEVA;
            $solicitud->setAttributes($parametrosSolicitud);
            $solicitud = $solicitud->guardar();

            if ($parametrosSolicitud["estatus_solicitud_id"] == 2) {
              $solicutd_estatus = new  SolicitudEstatus();
              $solicutd_estatus->setAttributes(array("estatus_solicitud_id" => $parametrosSolicitud["estatus_solicitud_id"], "solicitud_id" => $_POST["SOLICITUD-id"]));
              // var_dump(  $solicutd_estatus);

              $estatusSolicitud = new  SolicitudEstatus();
              $resEstatus = $estatusSolicitud->consultarPor("solicitudes_estatus_solicitudes", array("solicitud_id" => $_POST["SOLICITUD-id"], "estatus_solicitud_id" => 5), "*");

              if (sizeof($resEstatus["data"]) == 2) {
                $evaluacionN = sizeof($resEstatus["data"]);
                $solicutd_estatus->setAttributes(array("estatus_solicitud_id" => 4, "solicitud_id" => $_POST["SOLICITUD-id"], $evaluacionN));
                $solicitudN = new Solicitud();
                $solicitudN->setAttributes(array("id" => $_POST["SOLICITUD-id"], "estatus_solicitud_id" => 4));
                $solicitudN->guardar();
              }

              if (sizeof($resEstatus["data"]) == 3) {
                $solicutd_estatus->setAttributes(array("id" => $idEstatus["id"], "estatus_solicitud_id" => 100, "solicitud_id" => $_POST["SOLICITUD-id"], $evaluacionN));
              }
              $solicutd_estatus->guardar();
            }
            $entidadesIds["SOLICITUD"] = isset($solicitud["data"]["id"]) ? $solicitud["data"]["id"] : false;
          }

          // Actualización de folio
          if (!$entidadesIds["SOLICITUD"]) {
            throw new Exception("SOLICITUD - error al guardar");
          } else {
            if (!isset($_POST["SOLICITUD-id"])) {
              $consecutivo = new Solicitud();
              $parametrosConsecutivo["id"] = $entidadesIds["SOLICITUD"];
              // Construccion del folio
              if (isset($_POST["PROGRAMA-nivel_id"]) && !empty($_POST["PROGRAMA-nivel_id"])) {
                //$numeroConsecutivo2021 = $entidadesIds["SOLICITUD"] - 584;
                //$numeroConsecutivo2022 = $entidadesIds["SOLICITUD"] - 1413;
                $numeroConsecutivo2023 = $entidadesIds["SOLICITUD"] - 1823;
                $parametrosConsecutivo["folio"] = Nivel::$niveles[$_POST["PROGRAMA-nivel_id"]] . date("Y") . str_pad($numeroConsecutivo2023, 3, "0", STR_PAD_LEFT);
              }

              // Guardado de folio
              $consecutivo->setAttributes($parametrosConsecutivo);
              $consecutivo->guardar();
            }
          }

          // Personas Diligencias
          // ya se valido anteriormente la solicitud y el domicilio
          $personasDiligencias = isset($parametrosDiligencias["personasDiligencias"]) ? $parametrosDiligencias["personasDiligencias"] : [];
          foreach ($personasDiligencias as $cadena) {

            $cadena = str_replace('\\', '', $cadena);
            $cadena = json_decode($cadena);
            $persona = $cadena;
            if (isset($cadena->borrar) && $cadena->borrar == 1) {
              $diligenciaBorrar =  new SolicitudUsuario();
              $res_diligenciaBorrar = $diligenciaBorrar->consultarPor("solicitudes_usuarios", array("solicitud_id" => $entidadesIds["SOLICITUD"], "usuario_id" => $cadena->id), "id");
              $diligenciaActualizar = new SolicitudUsuario();
              $diligenciaActualizar->setAttributes(array("id" => $res_diligenciaBorrar["data"][0]["id"]));
              $diligenciaActualizar->eliminar();
            } else {
              if ($cadena->id === null) {
                $persona->domicilio_id = $entidadesIds["DOMICILIO"];
                $persona->fotografia = Persona::FOTO_DEFAULT;
                $persona->rfc = $persona->horario;
                $diligencia = new Persona();
                $diligencia->setAttributes((array)$persona);
                $diligencia = $diligencia->guardar();

                if (!isset($diligencia["data"]["id"])) {
                  $errores .= "DILIGENCIA - error al guardar";
                } else {
                  $parametrosInforma["solicitud_id"] = $entidadesIds["SOLICITUD"];
                  $parametrosInforma["usuario_id"] = $diligencia["data"]["id"];
                  $objSolucitudUsuario = new SolicitudUsuario();
                  $objSolucitudUsuario->setAttributes($parametrosInforma);
                  $resultado = $objSolucitudUsuario->guardar();
                }
              }
            }
          }

          // Coordinador
          // ya se validó anteriormente el domicilio
          $coordinador = new Persona();
          $parametrosCoordinador["domicilio_id"] = $entidadesIds["DOMICILIO"];
          $parametrosCoordinador["fotografia"] = Persona::FOTO_DEFAULT;
          $parametrosCoordinador["titulo_cargo"] = (isset($parametrosCoordinador["formacion"])) ? $parametrosCoordinador["formacion"] : "";
          $coordinador->setAttributes($parametrosCoordinador);
          $coordinador = $coordinador->guardar();
          $entidadesIds["COORDINADOR"] = isset($coordinador["data"]["id"]) ? $coordinador["data"]["id"] : false;

          // otros rvoes
          $otrosRvoes = [];
          $rvoes = isset($parametrosPrograma["otrosRVOE"]) ? $parametrosPrograma["otrosRVOE"] : [];

          foreach ($rvoes as $cadena) {
            $cadena = str_replace('\\', '', $cadena);
            $otro = json_decode($cadena);
            array_push($otrosRvoes, $otro);
          }
          $otrosRvoes = json_encode($otrosRvoes, JSON_UNESCAPED_UNICODE);

          // Programa
          try {
            $details = "";
            $details .= !$entidadesIds["COORDINADOR"] ? "COORDINADOR no existe, " : "";
            $details .= empty($parametrosPrograma["ciclo_id"]) ? "CICLO no existe, " : "";
            $details .= empty($parametrosPrograma["nivel_id"]) ? "NIVEL no existe, " : "";
            $details .= empty($parametrosPrograma["modalidad_id"]) ? "MODALIDAD no existe, " : "";
            if ($details != "") {
              $entidadesIds["PROGRAMA"] = false;
              throw new Exception("PROGRAMA - No se puede guardar por falta de datos: " . $details);
            } else {
              $programa = new Programa();
              isset($parametrosEvaluacion["evaluador_id"]) && !empty($parametrosEvaluacion["evaluador_id"]) ? $parametrosPrograma["evaluador_id"] = $parametrosEvaluacion["evaluador_id"] : $parametrosPrograma["evaluador_id"] = Evaluador::NO_DEFINIDO;
              $parametrosPrograma["solicitud_id"] = $entidadesIds["SOLICITUD"];
              $parametrosPrograma["plantel_id"] = $entidadesIds["PLANTEL"];
              $parametrosPrograma["persona_id"] = $entidadesIds["COORDINADOR"];
              $parametrosPrograma["otros_rvoes"] = $otrosRvoes;
              $programa->setAttributes($parametrosPrograma);
              $programa = $programa->guardar();
              $entidadesIds["PROGRAMA"] = isset($programa["data"]["id"]) ? $programa["data"]["id"] : false;
            }
            //Programa evaluacion
            $evaluacionCurricular = new ProgramaEvaluacion();
            isset($parametrosEvaluacion["programa_id"]) && !empty($parametrosEvaluacion["programa_id"]) ? "" : $parametrosEvaluacion["programa_id"] = $entidadesIds["PROGRAMA"];
            if (
              isset($parametrosEvaluacion["programa_id"])
              && !empty($parametrosEvaluacion["programa_id"])
              && isset($parametrosEvaluacion["cumplimiento_id"])
              && !empty($parametrosEvaluacion["cumplimiento_id"])
              && isset($parametrosEvaluacion["evaluador_id"])
              && !empty($parametrosEvaluacion["evaluador_id"])
              && isset($parametrosEvaluacion["fecha"])
              && !empty($parametrosEvaluacion["fecha"])
            ) {

              $parametrosEvaluacion["estatus"] = 2;
              $evaluacionCurricular->setAttributes($parametrosEvaluacion);
              $evaluacionCurricular = $evaluacionCurricular->guardar();
              $entidadesIds["EVALUACION"] = isset($evaluacionCurricular["data"]["id"]) ? $evaluacionCurricular["data"]["id"] : false;

              if (!isset($parametrosEvaluacion["id"]) || empty($parametrosEvaluacion["id"])) {
                $usuarioNotificar = new Solicitud();
                $usuarioNotificar->setAttributes(array("id" => $entidadesIds["SOLICITUD"]));
                $resUsuarioNotificar = $usuarioNotificar->consultarId();
                $resUsuarioNotificar = $resUsuarioNotificar["data"];
                $notificacion = new Usuario();
                $msj = "Su programa de estudios obtuvo un " . $parametrosEvaluacion["cumplimiento"] .  "% en la evaluación técnico currilar";
                $notificacion->notificacionIdUsuario($resUsuarioNotificar["usuario_id"], "Evaluación técnico curricular", $msj);
              }
            }

            // Programa Turnos
            try {
              if (!$entidadesIds["PROGRAMA"]) {
                throw new Exception("PROGRAMA - error al guardar");
              } else {
                $turnos = isset($parametrosPrograma["turnos"]) ? $parametrosPrograma["turnos"] : [];
                foreach ($turnos as $turno_id) {
                  $programaTurnos = new ProgramaTurno();
                  $consultarTurnos = new ProgramaTurno();
                  $res_turno = $consultarTurnos->consultarPor("programas_turnos", array("programa_id" => $entidadesIds["PROGRAMA"], "turno_id" => $turno_id, "deleted_at"), "*");
                  if (sizeof($res_turno["data"]) > 0) {
                    $parametros["id"] = $res_turno["data"][0]["id"];
                  }
                  $parametros["programa_id"] = $entidadesIds["PROGRAMA"];
                  $parametros["turno_id"] = $turno_id;
                  $programaTurnos->setAttributes($parametros);
                  $programaTurnos->guardar();
                }
              }

              // Docentes
              // ya se valido anteriormente el domicilio
              $asignaturaDocentes = [];
              $docentes = isset($parametrosDocente["docentes"]) ? $parametrosDocente["docentes"] : [];
              foreach ($docentes as $cadena) {
                $cadena = str_replace('\\', '', $cadena);
                $docente = json_decode($cadena);

                if (isset($docente->borrar) && $docente->borrar == 1) {
                  $docenteBorrar = new Docente();
                  $docenteBorrar->setAttributes(array("id" => $docente->id));
                  $res_docenteBorrar = $docenteBorrar->eliminar();
                } else {
                  $docente->domicilio_id = $entidadesIds["DOMICILIO"];
                  $docente->fotografia = Persona::FOTO_DEFAULT;
                  $personaDocente = new Persona();

                  if (!isset($docente->id)) {
                    $personaDocente->setAttributes((array)$docente);
                    $personaDocente = $personaDocente->guardar();
                  } else {
                    $res_docente = new Docente();
                    $res_docente->setAttributes(array("id" => $docente->id));
                    $res_docente = $res_docente->consultarId();
                    $personaDocente->setAttributes(array("id" => $res_docente["data"]["persona_id"]));
                    $personaDocente = $personaDocente->consultarId();
                  }
                  // Revisa si la persona Docente se guarda
                  if (!isset($personaDocente["data"]["id"])) {
                    $errores .= "PERSONA DOCENTE - error al guardar";
                  } else {
                    // Guardar docente
                    $docente->persona_id = $personaDocente["data"]["id"];
                    $objDocente = new Docente();

                    if (!isset($docente->id)) {
                      $objDocente->setAttributes((array)$docente);
                      $resultadoDocente = $objDocente->guardar();
                    } else {
                      $objDocente->setAttributes(array("id" => $docente->id));
                      $resultadoDocente = $objDocente->consultarId();
                    }
                    if (!isset($resultadoDocente["data"]["id"])) {
                      $errores .= "DOCENTE - error al guardar";
                    } else {
                      // Relacion Docente con asignatura
                      foreach ($docente->asignaturas as $asignatura) {
                        $asignaturaDocentes[$asignatura] = $resultadoDocente["data"]["id"];
                      }
                    }
                    // Guarda formaciones del docente
                    if (isset($docente->formaciones)) {
                      foreach ($docente->formaciones as $formacion) {
                        $objFormacion = new Formacion();
                        $formacion->persona_id = $personaDocente["data"]["id"];
                        if (is_numeric($formacion->nivel)) {
                          $objFormacion->setAttributes((array)$formacion);
                          $objFormacion->guardar();
                        }
                      }
                    }
                    //Termina guardado de formmación del docente
                  } //Termina el guardado del docente
                }
              }

              // Asignaturas
              // ya se valido anteriormente el programa
              $asignaturas = isset($parametrosAsignatura["asignaturas"]) ? $parametrosAsignatura["asignaturas"] : [];

              foreach ($asignaturas as $cadena) {
                $cadena = str_replace('\\', '', $cadena);
                $asignatura = json_decode($cadena);
                $objAsignaturas = new Asignatura();

                if (isset($asignatura->borrar) && $asignatura->borrar == 1) {
                  $objAsignaturas->setAttributes(array("id" => $asignatura->id));
                  $objAsignaturas->eliminar();
                } else {
                  //print_r($asignaturaInfraestructura[$asignatura->clave]);
                  if (!isset($asignaturaInfraestructura[$asignatura->clave])) {
                    $asignatura->infraestructura_id = 83;
                  } else {
                    $asignatura->infraestructura_id = $asignaturaInfraestructura[$asignatura->clave];
                  }
                  if (!isset($asignaturaDocentes[$asignatura->clave])) {
                    $asignatura->docente_id = 23;
                  } else {
                    $asignatura->docente_id = $asignaturaDocentes[$asignatura->clave];
                  }
                  $asignatura->programa_id = $entidadesIds["PROGRAMA"];
                  $objAsignaturas->setAttributes((array)$asignatura);
                  $objAsignaturas->guardar();
                }
              }

              // Trayectorias
              // ya se valido anteriormente el programa
              $trayectoria = new Trayectoria();
              $parametrosTrayectoria["programa_id"] = $entidadesIds["PROGRAMA"];
              $trayectoria->setAttributes($parametrosTrayectoria);
              $trayecotria = $trayectoria->guardar();
              $entidadesIds["TRAYECTORIA"] = isset($trayecotria["data"]["id"]) ? $trayecotria["data"]["id"] : false;


              /*
                *
                * MIXTA NO ESCOLARIZADA
                *
                */
              // Si la modalidad no es escolarizada se requieren los datos de mixta NO escolarizada
              if (Modalidad::ESCOLARIZADA == $parametrosPrograma["modalidad_id"] || Modalidad::DUAL == $parametrosPrograma["modalidad_id"]) {
                $entidadesIds["MIXTA"] = false;
                throw new Exception("");
              } else {
                // Licencias mixta no escolarizada
                $parametrosMixta["programa_id"] = $programa["data"]["id"];
                $res_mixta = new MixtaNoescolarizada();
                $id_mixta["id"] = $res_mixta->consultarPor("mixta_noescolarizadas", array("programa_id" => $parametrosMixta["programa_id"]), "id");
                $id_mixta = end($id_mixta["id"]["data"]);
                if (isset($id_mixta)) {
                  $parametrosMixta["id"] = $id_mixta["id"];
                }

                $licencias = [];
                $licenciasMixta = isset($parametrosMixta["licencias"]) ? $parametrosMixta["licencias"] : [];
                foreach ($licenciasMixta as $cadena) {
                  $cadena = str_replace('\\', '', $cadena);
                  $licencia = json_decode($cadena);
                  array_push($licencias, $licencia);
                }
                $licencias = json_encode($licencias, JSON_UNESCAPED_UNICODE);
                //Mixta no escolarizada
                // ya se valido anteriormente programa
                $mixtaNoescolarizada = new MixtaNoescolarizada();
                $parametrosMixta["licencias_software"] = $licencias;
                $parametrosMixta["tecnologias_informacion_comunicacion"] =  "INGRESO:" . $parametrosMixta["ti_ingreso"] .
                  "ESTRUCTURA:" . $parametrosMixta["ti_estructura"] .
                  "CONTRATOS:" . $parametrosMixta["ti_contratos"];
                $parametrosMixta["programa_id"] = $entidadesIds["PROGRAMA"];
                $mixtaNoescolarizada->setAttributes($parametrosMixta);
                $mixtaNoescolarizada = $mixtaNoescolarizada->guardar();
                $entidadesIds["MIXTA"] = isset($mixtaNoescolarizada["data"]["id"]) ? $mixtaNoescolarizada["data"]["id"] : false;
                if (!$entidadesIds["MIXTA"]) {
                  throw new Exception("MIXTA - error al guardar");
                } else {
                  // Espejo Mixta no escolarizada
                  $espejos = isset($parametrosEspejo["espejos"]) ? $parametrosEspejo["espejos"] : [];
                  foreach ($espejos as $cadena) {
                    $cadena = str_replace('\\', '', $cadena);
                    $espejo = json_decode($cadena);
                    $espejo->mixta_noescolarizada_id = $entidadesIds["MIXTA"];
                    $objEspejo = new Espejo();
                    if (isset($espejo->borrar) && $espejo->borrar == 1) {
                      $objEspejo->setAttributes(array("id" => $espejo->id));
                      $objEspejo->eliminar();
                    } else {
                      $objEspejo->setAttributes((array)$espejo);
                      $result = $objEspejo->guardar();
                    }
                  }

                  // Respaldo Mixta no escolarizada
                  $respaldos = isset($parametrosRespaldo["respaldos"]) ? $parametrosRespaldo["respaldos"] : [];
                  foreach ($respaldos as $cadena) {
                    $cadena = str_replace('\\', '', $cadena);
                    $respaldo = json_decode($cadena);
                    $respaldo->mixta_noescolarizada_id = $entidadesIds["MIXTA"];
                    $objRespaldo = new Respaldo();
                    if (isset($respaldo->borrar) && $respaldo->borrar == 1) {
                      $objRespaldo->setAttributes(array("id" => $respaldo->id));
                      $objRespaldo->eliminar();
                    } else {
                      $objRespaldo->setAttributes((array)$respaldo);
                      $resultado = $objRespaldo->guardar();
                    }
                  }
                }
              }
            } catch (Exception $e) {
              $errores .= !empty($e->getMessage()) ? "1" . $e->getMessage() : "";
            }
          } catch (Exception $e) {
            // RollBack a inserciones hasta le momento
            if (isset($entidadesIds["SOLICITUD"])) {
              $rollBack = new Solicitud();
              $rollBack->setAttributes(["id" => $entidadesIds["SOLICITUD"]]);
              $resultado = $rollBack->rollbackSolicitud();
            }
            $errores .= !empty($e->getMessage()) ? "2" . $e->getMessage() : "";
          }
        } catch (Exception $e) {
          $errores .= !empty($e->getMessage()) ? "3" . $e->getMessage() : "";
        }
      } else {
        $errores .= "<br>" . "DIRECTOR - Nombre del director es obligatorio";
      }
    }
  } catch (Exception $e) {
    $errores .= !empty($e->getMessage()) ? "4" . $e->getMessage() : "";
  }

  // Archivos
  foreach ($_FILES as $campo => $archivo) {
    $nombreInput = $campo . "-id";
    isset($_POST[$nombreInput]) ? $idDocumento = $_POST[$nombreInput] : $idDocumento = null;

    $tipoEntidad = strstr($campo, '-', true);
    $nombreFormulario = substr(strstr($campo, '-'), 1);
    if (empty($archivo["name"])) {
      continue;
    }
    if (!isset($entidadesIds[$tipoEntidad])) {
      $errores .= "<br>ARCHIVO - error al guardar archivo: " . $nombreFormulario;
      continue;
    }

    $nombreArchivo = $nombreFormulario . "_" . date("Ymdhi") . strrchr($archivo["name"], '.');
    $primerDirectorio = Documento::$dir_subida . "Institucion" . $entidadesIds["INSTITUCION"] . "/";
    $segundoDirectorio = $primerDirectorio . $tipoEntidad . "/";
    $uploadFile = $segundoDirectorio . $nombreArchivo;
    // Creacion de direcotrios
    !is_dir($primerDirectorio) ? mkdir($primerDirectorio, 0755) : false;
    !is_dir($segundoDirectorio) ? mkdir($segundoDirectorio, 0755) : false;

    // Guardado de archivos
    if (move_uploaded_file($archivo['tmp_name'], $uploadFile)) {
      $documento = new Documento();
      $parametrosDocumento["id"] = $idDocumento;
      $parametrosDocumento["tipo_entidad"] = Documento::$tipoEntidad[$tipoEntidad];
      $parametrosDocumento["tipo_documento"] = Documento::$nombresDocumentos[$nombreFormulario];
      $parametrosDocumento["entidad_id"] = $entidadesIds[$tipoEntidad];
      $parametrosDocumento["nombre"] = $nombreArchivo;
      $parametrosDocumento["archivo"] = $uploadFile;
      $documento->setAttributes($parametrosDocumento);
      $documento->guardar();
    }
  }

  // Retorno
  $estatus = $errores != "" ? "400" : "200";
  $mensaje = $errores != "" ? $errores : "Solicitud creada exitosamente";
  $datos = (isset($solicitud["data"]) && !empty($solicitud["data"])) ? $solicitud["data"] : [];
  $resultado = ["status" => $estatus, "message" => $mensaje, "data" => $datos];

  // Registro en bitacora
  /* $bitacora = new Bitacora();
  $usuarioId = isset($_SESSION["id"]) ? $_SESSION["id"] : -1;
  $bitacora->setAttributes(["usuario_id" => $usuarioId, "entidad" => "solicitudes", "accion" => "guardarSolicitud", "lugar" => "control-solicitud"]);
  $result = $bitacora->guardar(); */

  retornarWebService($_POST["url"], $resultado);
}

// Web Service para agendar Cita
if ($_POST["webService"] == "agendarCita") {

  $parametros = array();
  $aux = new Utileria();
  $_POST = $aux->limpiarEntrada($_POST);
  foreach ($_POST as $atributo => $valor) {
    $parametros[$atributo] = $valor;
  }
  // Horario de 9:00 a 14:00 y de 15:00 a 17:00
  $horaInicio = '09:00:00';
  $horaMitad = '13:00:00';
  $horaInicio2 = '15:00:00';
  $horaFin = '16:00:00';

  // Obtener ultima fecha de cita
  date_default_timezone_set('America/Mexico_City');
  $ultimaSolicitud = new Solicitud();
  $ultimaSolicitud = $ultimaSolicitud->consultarUltimaCita();
  $ultimaSolicitud = (isset($ultimaSolicitud["data"]) && !empty($ultimaSolicitud["data"])) ? $ultimaSolicitud["data"] : false;
  // Ultima fecha de cita
  $ultimaFechaCita = ($ultimaSolicitud && isset($ultimaSolicitud['cita'])) ? date('Y-m-d H:i:s', strtotime($ultimaSolicitud['cita'])) : date('Y-m-d H:i:s', strtotime(date('Y-m-d H:i:s') . " + 1 week"));

  // Siguiente fecha de cita en
  $hoy = date('Y-m-d');
  $nextDate = date('Y-m-d', strtotime("$hoy + 3 days"));
  $nextDiaSemana = date('N', strtotime("$nextDate"));
  if ('7' === $nextDiaSemana) {
    $nextDate = date('Y-m-d', strtotime("$nextDate + 1 days"));
  } else if ('6' === $nextDiaSemana) {
    $nextDate = date('Y-m-d', strtotime("$nextDate + 2 days"));
  }
  $ultimaFecha = strstr($ultimaFechaCita, ' ', true);

  // Si la fecha de hoy es mayor a la ultima inicializar la hora
  if ($nextDate > $ultimaFecha) {
    $hora = $horaInicio;
  } else { // sino obtener la hora siguiente
    $nextDate = $ultimaFecha;
    $ultimaHora = substr(strstr($ultimaFechaCita, ' '), 1);
    if ($ultimaHora == $horaMitad) {
      $hora = date('H:i:s', strtotime($horaInicio2));
    } else if ($ultimaHora == $horaFin) {
      $hora = date('H:i:s', strtotime($horaInicio));
      $diaSemana = date('N', strtotime("$ultimaFechaCita"));
      // viernes 5
      if ('5' == $diaSemana) {
        $nextDate = date('Y-m-d', strtotime("$ultimaFecha + 3 days"));
      } else {
        $nextDate = date('Y-m-d', strtotime("$ultimaFecha + 1 day"));
      }
    } else {
      $hora = date('H:i:s', strtotime($ultimaHora) + (60 * 60));
    }
  }

  $cita = $nextDate . " " . $hora;
  $parametros["cita"] = $cita;
  $solicitud = new Solicitud();
  $solicitud->setAttributes($parametros);
  $resultado = $solicitud->guardar();
  $resultado["message"] = "$cita Fecha de cita para la solicitud: " . $resultado["data"]["id"];

  // Registro en bitacora
  /* $bitacora = new Bitacora();
  $usuarioId = isset($_SESSION["id"]) ? $_SESSION["id"] : -1;
  $bitacora->setAttributes(["usuario_id" => $usuarioId, "entidad" => "solicitudes", "accion" => "agendarCita", "lugar" => "control-solicitud"]);
  $result = $bitacora->guardar(); */
  retornarWebService($_POST["url"], $resultado);
}

//Mostrar todas las solicitudes (administradores y roles de sicyt).
if ($_POST["webService"] == "solicitudes") {
  //$solicitud = new Solicitud();
  $vdetalles_solicitud = new VDetallesSolicitud();
  if ((isset($_SESSION["rol_id"]) && $_SESSION["rol_id"] == 7)) {
    $vdetalles_solicitudes = $vdetalles_solicitud->consultarPor("vdetalles_solicitudes", array("estatus_solicitud_id" => 2, "deleted_at"), "*");
    //$solicitudes = $solicitud->consultarPor("solicitudes", array("estatus_solicitud_id" => 2, "deleted_at"), "*");
    $otras = new VDetallesSolicitud();

    $res_otras = $otras->consultarPor("vdetalles_solicitudes", array("estatus_solicitud_id" => 3, "deleted_at"), "*");
    //$res_otras = $otras->consultarPor("solicitudes", array("estatus_solicitud_id" => 3, "deleted_at"), "*");

    $entregarRVOE = new VDetallesSolicitud();
    $res_rvoe = $entregarRVOE->consultarPor("vdetalles_solicitudes", array("estatus_solicitud_id" => 10, "deleted_at"), "*");
    //$res_rvoe = $entregarRVOE->consultarPor("solicitudes", array("estatus_solicitud_id" => 10, "deleted_at"), "*");

    if (sizeof($res_otras["data"]) > 0) {
      foreach ($res_otras["data"] as $key => $value) {
        array_push($vdetalles_solicitudes["data"], $value);
      }
    }
    if (sizeof($res_rvoe["data"]) > 0) {
      foreach ($res_rvoe["data"] as $key => $value) {
        array_push($vdetalles_solicitudes["data"], $value);
      }
    }
  }

  if ((isset($_SESSION["rol_id"]) && $_SESSION["rol_id"] == 2) ||  (isset($_SESSION["rol_id"]) && $_SESSION["rol_id"] > 7)) {
    if ($_SESSION["rol_id"] == 11) {
      $vdetalles_solicitudes = $vdetalles_solicitud->consultarPor("vdetalles_solicitudes", array("estatus_solicitud_id" => 6, "deleted_at"), "*");
      //$solicitudes = $solicitud->consultarPor("solicitudes", array("estatus_solicitud_id" => 6, "deleted_at"), "*");
    } else if ($_SESSION["rol_id"] == 10) {
      $vdetalles_solicitudes = $vdetalles_solicitud->consultarPor("vdetalles_solicitudes", array("estatus_solicitud_id" => 4, "deleted_at"), "*");
      //$solicitudes = $solicitud->consultarPor("solicitudes", array("estatus_solicitud_id" => 4, "deleted_at"), "*");
    } else {
      $vdetalles_solicitudes = $vdetalles_solicitud->consultarTodos();
    }
  }

  $resultado = array();
  if ((isset($_SESSION["rol_id"]) && $_SESSION["rol_id"] > 6) || (isset($_SESSION["rol_id"]) && $_SESSION["rol_id"] == 2)) {
    if (sizeof($vdetalles_solicitudes["data"]) > 0) {

      $vdetalles_solicitudes = $vdetalles_solicitudes["data"];
      foreach ($vdetalles_solicitudes as $posicion => $arreglo) {
        $respuesta["id"] = $arreglo["id"];
        $respuesta["tipo_solicitud"] = $arreglo["tipo_solicitud"];
        $respuesta["usuario_id"] = $arreglo["usuario_id"];
        $respuesta["folio"] = $arreglo["folio"];
        $respuesta["acuerdo_rvoe"] = $arreglo["acuerdo_rvoe"];
        $respuesta["alta"] = $arreglo["created_at"];
        $respuesta["estatus_solicitud"] = $arreglo["estatus_solicitud"];
        $respuesta["programa"]["nombre"] = $arreglo["nombre_programa"];
        $respuesta["programa"]["id"] = $arreglo["programa_id"];
        $respuesta["instituto"]["nombre"] = $arreglo["nombre_institucion"];
        $respuesta["domicilio"]["numero_exterior"] = $arreglo["numero_exterior"];
        $respuesta["domicilio"]["calle"] = $arreglo["calle"];
        $respuesta["domicilio"]["municipio"] = $arreglo["municipio"];
        $respuesta["programa"]["modalidad_id"] = $arreglo["modalidad_id"];
        $respuesta["tipo_solicitud_id"] = $arreglo["tipo_solicitud_id"];
        $respuesta["estatus_solicitud_id"] = $arreglo["estatus_solicitud_id"];


        if (isset($respuesta["domicilio"])) {
          $respuesta["plantel"] = $respuesta["domicilio"]["numero_exterior"] . " " . $respuesta["domicilio"]["calle"] . " " . $respuesta["domicilio"]["municipio"];
        } else {
          $respuesta["plantel"] = "S/N";
        }

        // Opciones de edición
        $txt_aux = "?solicitud=" . $respuesta["id"];
        $espacio = "&nbsp;&nbsp;&nbsp;";
        $json = [];
        $json["solicitud"] = $respuesta["id"];
        $json["folio"] = $respuesta["folio"];
        $json["tipo_solicitud"] = $respuesta["tipo_solicitud"];
        $json["programa_id"] = $respuesta["programa"]["id"];
        $json["programa"] = $respuesta["programa"]["nombre"];
        $json = json_encode($json);

        // USUARIO CONTROL DOCUMENTAL
        if ($_SESSION["rol_id"] == 7) {
          //Filtra las que son por revisión de solicitud y entrega de documentación
          if ($respuesta["estatus_solicitud_id"] == 2) {
            $txt_aux = "&modalidad=" . $respuesta["programa"]["modalidad_id"] . "&tps=" . $respuesta["tipo_solicitud_id"] . "&dt=" . $respuesta["programa"]["id"] . "&odt=1";
            $opciones_edicion  =  "<a title='Revisar documentación' href='ver-solicitudes.php?solicitud=" . $respuesta["id"] . "&tipo=4" . $txt_aux . "'><span class='glyphicon glyphicon-pencil' ></span></a>";
          }
          if ($respuesta["estatus_solicitud_id"] == 3) {
            $opciones_edicion = "<a title='Revisar documentos en físico' href='cotejamiento-solicitudes.php?solicitud=" . $respuesta["id"] . "'><span class='glyphicon glyphicon-folder-open' ></span></a>";
          }
          if ($respuesta["estatus_solicitud_id"] == 10) {
            $opciones_edicion = "<a title='Entregar RVOE' onclick='Solicitudes.recogerRVOE(" . htmlentities($json) . ")'><span class='glyphicon glyphicon-print' ></span></a>";
          }
        }

        // USUARIO SICYT EDITAR / ADMIN 
        if ($_SESSION["rol_id"] == 9  || $_SESSION["rol_id"] == 2) {
          $txt_auxi = "&modalidad=" . $respuesta["programa"]["modalidad_id"] . "&tps=" . $respuesta["tipo_solicitud_id"] . "&dt=" . $respuesta["programa"]["id"] . "&odt=1";

          if ($respuesta["estatus_solicitud_id"] >= 2 && $respuesta["estatus_solicitud_id"] < 100) {
            $opciones_edicion  =  "<a title='Detalles de la solicitud' href='detalles-solicitudes.php?solicitud=" . $respuesta["id"] . $txt_auxi . "'><span class='glyphicon glyphicon-list-alt'></span></a>" . $espacio . "<a title='Ver solicitud' href='ver-solicitudes.php?solicitud=" . $respuesta["id"] . "&tipo=4" . $txt_auxi . "'><span class='glyphicon glyphicon-eye-open'></span></a>" . $espacio . "<a title='Eliminar solicitud'  onclick='Solicitudes.modalEliminar(" . htmlentities($json) . ")' href='#'><span class='glyphicon glyphicon-trash'></span></a>";
          }
          if ($respuesta["estatus_solicitud_id"] == 200) {
            $opciones_edicion  =  "<a title='Detalles de la solicitud' href='detalles-solicitudes.php?solicitud=" . $respuesta["id"] . $txt_auxi . "'><span class='glyphicon glyphicon-list-alt'></span></a>" . $espacio . "<a title='Ver solicitud' href='ver-solicitudes.php?solicitud=" . $respuesta["id"] . "&tipo=4" . $txt_auxi . "'><span class='glyphicon glyphicon-eye-open'></span></a>" . $espacio . "<a title='Eliminar solicitud'  onclick='Solicitudes.modalEliminar(" . htmlentities($json) . ")' href='#'><span class='glyphicon glyphicon-trash'></span></a>";
          }
          if ($respuesta["estatus_solicitud_id"] == 100) {
            $opciones_edicion  =  "<a title='Detalles de la solicitud' href='detalles-solicitudes.php?solicitud=" . $respuesta["id"] . $txt_auxi . "'><span class='glyphicon glyphicon-list-alt'></span></a>" . $espacio . "<a title='Ver solicitud' href='ver-solicitudes.php?solicitud=" . $respuesta["id"] . "&tipo=4" . $txt_auxi . "'><span class='glyphicon glyphicon-eye-open'></span></a>";
          }
          if ($respuesta["estatus_solicitud_id"] == 1) {
            $opciones_edicion = "<a title='Ver solicitud' href='ver-solicitudes.php?solicitud=" . $respuesta["id"] . "&tipo=4" . $txt_auxi . "'><span class='glyphicon glyphicon-eye-open'></span></a>";
          }
        }

        // SICYT LECTURA
        if ($_SESSION["rol_id"] == 8) {
          $txt_auxi = "&modalidad=" . $respuesta["programa"]["modalidad_id"] . "&tps=" . $respuesta["tipo_solicitud_id"] . "&dt=" . $respuesta["programa"]["id"] . "&odt=1";
          $opciones_edicion  =  "<a href='detalles-solicitudes.php?solicitud=" . $respuesta["id"] . $txt_auxi . "'><span  class='glyphicon glyphicon glyphicon-list-alt'></span></a>" . $espacio . "<a href='ver-solicitudes.php?solicitud=" . $respuesta["id"] . "&tipo=4" . $txt_auxi . "'><span class='glyphicon glyphicon-eye-open'></span></a>";
        }

        // COMITE EVALUACION
        if ($_SESSION["rol_id"] == 10) {
          $txt_auxi = "&modalidad=" . $respuesta["programa"]["modalidad_id"] . "&tps=" . $respuesta["tipo_solicitud_id"] . "&dt=" . $respuesta["programa"]["id"] . "&odt=1";
          $opciones_edicion =  "<a title='Asignar Evaluación ' href='asignacion-evaluacion.php?solicitud=" . $respuesta["id"] . $txt_auxi . "'><span class='glyphicon glyphicon-edit'></span></a>";
        }

        //JEFE INSPECTOR
        if ($_SESSION["rol_id"] == 11) {
          $txt_auxi = "&modalidad=" . $respuesta["programa"]["modalidad_id"] . "&tps=" . $respuesta["tipo_solicitud_id"] . "&dt=" . $respuesta["programa"]["id"] . "&odt=1";
          $opciones_edicion  =  "<a href='asignacion-inspeccion.php?solicitud=" . $respuesta["id"] . $txt_auxi . "'><span  class='glyphicon glyphicon glyphicon-edit'></span></a>";
        }

        $respuesta["folio"] = isset($respuesta["folio"]) ? $respuesta["folio"] . "<br>" . $respuesta["tipo_solicitud"]  : "En proceso";
        $respuesta["programa_estudio"] = isset($respuesta["programa"]["nombre"]) ? $respuesta["programa"]["nombre"] : "En proceso";
        $respuesta["alta"] = isset($respuesta["alta"]) ? $respuesta["alta"] : "";
        $respuesta["estatus"] = isset($respuesta["estatus_solicitud"]) ? $respuesta["estatus_solicitud"] . "<br>" . $respuesta["acuerdo_rvoe"] : "";
        $respuesta["institucion"]  = isset($respuesta["instituto"]["nombre"]) ? $respuesta["instituto"]["nombre"] : "";

        $respuesta["acciones"] = $opciones_edicion;

        array_push($resultado, $respuesta);
      }

      $tabla = "";

      /* foreach ($solicitudes as $posicion => $arreglo) {
        $respuesta["id"] = $arreglo["id"];
        $respuesta["tipo_solicitud_id"] = $arreglo["tipo_solicitud_id"];
        $respuesta["usuario_id"] = $arreglo["usuario_id"];
        $respuesta["folio"] = $arreglo["folio"];
        $respuesta["alta"] = $arreglo["created_at"];
        $respuesta["estatus_solicitud_id"] = $arreglo["estatus_solicitud_id"];
        $respuesta["tipo_solicitud_id"] = $arreglo["tipo_solicitud_id"];

        //Tipo de solicitud
        $tipo_solicitud = new TipoSolicitud();
        $tipo_solicitud->setAttributes(array('id' => $respuesta["tipo_solicitud_id"]));
        $respuestas = $tipo_solicitud->consultarId();
        $respuesta["tipo_solicitud"] = $respuestas["data"]["nombre"];

        //Estatus de la solicitud
        $estatus_solicitud = new EstatusSolicitud();
        $estatus_solicitud->setAttributes(array('id' => $respuesta["estatus_solicitud_id"]));
        $respuestas = $estatus_solicitud->consultarId();
        $respuesta["estatus_solicitud"] = $respuestas["data"]["nombre"];
        $programa = new Programa();
        $respuestas = $programa->consultarPor("programas", array("solicitud_id" => $respuesta["id"]), array("id", "nombre", "plantel_id", "modalidad_id"));
        if (sizeof($respuestas["data"]) > 0) {
          $respuesta["programa"] = $respuestas["data"][0];
          $plantel = new Plantel();
          $respuestas = $plantel->consultarPor("planteles", array("id" => $respuesta["programa"]["plantel_id"]), array("id", "domicilio_id"));
          $respuesta["plantel"] = $respuestas["data"][0];

          //INSTITUCION
          $institucion = new Institucion();
          $respuestas = $institucion->consultarPor("instituciones", array("usuario_id" => $respuesta["usuario_id"]), array("id", "nombre"));
          $respuesta["instituto"] = $respuestas["data"][0];
          $domicilio = new Domicilio();
          $respuestas = $domicilio->consultarPor("domicilios", array("id" => $respuesta["plantel"]["domicilio_id"]), array("id", "calle", "numero_exterior", "municipio"));
          $respuesta["domicilio"] = $respuestas["data"][0];


          // Opciones de edición
          $txt_aux = "?solicitud=" . $respuesta["id"];
          $espacio = "&nbsp;&nbsp;&nbsp;";
          $json = [];
          $json["solicitud"] = $respuesta["id"];
          $json["folio"] = $respuesta["folio"];
          $json["tipo_solicitud"] = $respuesta["tipo_solicitud_id"];
          $json["programa_id"] = $respuesta["programa"]["id"];
          $json["programa"] = $respuesta["programa"]["nombre"];
          $json = json_encode($json);

          // USUARIO CONTROL DOCUMENTAL
          if ($_SESSION["rol_id"] == 7) {
            //Filtra las que son por revisión de solicitud y entrega de documentación
            if ($respuesta["estatus_solicitud_id"] == 2) {
              $txt_aux = "&modalidad=" . $respuesta["programa"]["modalidad_id"] . "&tps=" . $respuesta["tipo_solicitud_id"] . "&dt=" . $respuesta["programa"]["id"] . "&odt=1";
              $opciones_edicion  =  "<a title='Revisar documentación' href='ver-solicitudes.php?solicitud=" . $respuesta["id"] . "&tipo=4" . $txt_aux . "'><span class='glyphicon glyphicon-pencil' ></span></a>";
            }
            if ($respuesta["estatus_solicitud_id"] == 3) {
              $opciones_edicion = "<a title='Revisar documentos en físico' href='cotejamiento-solicitudes.php?solicitud=" . $respuesta["id"] . "'><span class='glyphicon glyphicon-folder-open' ></span></a>";
            }
            if ($respuesta["estatus_solicitud_id"] == 10) {
              $opciones_edicion = "<a title='Entregar RVOE' onclick='Solicitudes.recogerRVOE(" . htmlentities($json) . ")'><span class='glyphicon glyphicon-print' ></span></a>";
            }
          }

          // USUARIO SICYT EDITAR / ADMIN 
          if ($_SESSION["rol_id"] == 9  || $_SESSION["rol_id"] == 2) {
            $txt_auxi = "&modalidad=" . $respuesta["programa"]["modalidad_id"] . "&tps=" . $respuesta["tipo_solicitud_id"] . "&dt=" . $respuesta["programa"]["id"] . "&odt=1";
            // if( $respuesta["estatus_solicitud_id"] == 4){
            //   $opciones_edicion =   $opciones_edicion."<br></br>"."<a title='Asignar Evaluación ' href='asignacion-evaluacion.php".$txt_aux."'><span class='glyphicon glyphicon-edit'></span></a>";
            // }
            if ($respuesta["estatus_solicitud_id"] >= 2 && $respuesta["estatus_solicitud_id"] < 100) {
              $opciones_edicion  =  "<a title='Detalles de la solicitud' href='detalles-solicitudes.php?solicitud=" . $respuesta["id"] . $txt_auxi . "'><span class='glyphicon glyphicon-list-alt'></span></a>" . $espacio . "<a title='Ver solicitud' href='ver-solicitudes.php?solicitud=" . $respuesta["id"] . "&tipo=4" . $txt_auxi . "'><span class='glyphicon glyphicon-eye-open'></span></a>" . $espacio . "<a title='Eliminar solicitud'  onclick='Solicitudes.modalEliminar(" . htmlentities($json) . ")' href='#'><span class='glyphicon glyphicon-trash'></span></a>";
            }
            if ($respuesta["estatus_solicitud_id"] == 200) {
              $opciones_edicion  =  "<a title='Detalles de la solicitud' href='detalles-solicitudes.php?solicitud=" . $respuesta["id"] . $txt_auxi . "'><span class='glyphicon glyphicon-list-alt'></span></a>" . $espacio . "<a title='Ver solicitud' href='ver-solicitudes.php?solicitud=" . $respuesta["id"] . "&tipo=4" . $txt_auxi . "'><span class='glyphicon glyphicon-eye-open'></span></a>" . $espacio . "<a title='Eliminar solicitud'  onclick='Solicitudes.modalEliminar(" . htmlentities($json) . ")' href='#'><span class='glyphicon glyphicon-trash'></span></a>";
            }
            if ($respuesta["estatus_solicitud_id"] == 100) {
              $opciones_edicion  =  "<a title='Detalles de la solicitud' href='detalles-solicitudes.php?solicitud=" . $respuesta["id"] . $txt_auxi . "'><span class='glyphicon glyphicon-list-alt'></span></a>" . $espacio . "<a title='Ver solicitud' href='ver-solicitudes.php?solicitud=" . $respuesta["id"] . "&tipo=4" . $txt_auxi . "'><span class='glyphicon glyphicon-eye-open'></span></a>";
            }
            if ($respuesta["estatus_solicitud_id"] == 1) {
              $opciones_edicion = "<a title='Ver solicitud' href='ver-solicitudes.php?solicitud=" . $respuesta["id"] . "&tipo=4" . $txt_auxi . "'><span class='glyphicon glyphicon-eye-open'></span></a>";
            }
          }

          // SICYT LECTURA
          if ($_SESSION["rol_id"] == 8) {
            $txt_auxi = "&modalidad=" . $respuesta["programa"]["modalidad_id"] . "&tps=" . $respuesta["tipo_solicitud_id"] . "&dt=" . $respuesta["programa"]["id"] . "&odt=1";
            $opciones_edicion  =  "<a href='detalles-solicitudes.php?solicitud=" . $respuesta["id"] . $txt_auxi . "'><span  class='glyphicon glyphicon glyphicon-list-alt'></span></a>" . $espacio . "<a href='ver-solicitudes.php?solicitud=" . $respuesta["id"] . "&tipo=4" . $txt_auxi . "'><span class='glyphicon glyphicon-eye-open'></span></a>";
          }

          // COMITE EVALUACION
          if ($_SESSION["rol_id"] == 10) {
            $txt_auxi = "&modalidad=" . $respuesta["programa"]["modalidad_id"] . "&tps=" . $respuesta["tipo_solicitud_id"] . "&dt=" . $respuesta["programa"]["id"] . "&odt=1";
            $opciones_edicion =  "<a title='Asignar Evaluación ' href='asignacion-evaluacion.php?solicitud=" . $respuesta["id"] . $txt_auxi . "'><span class='glyphicon glyphicon-edit'></span></a>";
          }

          //JEFE INSPECTOR
          if ($_SESSION["rol_id"] == 11) {
            $txt_auxi = "&modalidad=" . $respuesta["programa"]["modalidad_id"] . "&tps=" . $respuesta["tipo_solicitud_id"] . "&dt=" . $respuesta["programa"]["id"] . "&odt=1";
            $opciones_edicion  =  "<a href='asignacion-inspeccion.php?solicitud=" . $respuesta["id"] . $txt_auxi . "'><span  class='glyphicon glyphicon glyphicon-edit'></span></a>";
          }

          $respuesta["folio"] = isset($respuesta["folio"]) ? $respuesta["folio"] : "En proceso";
          $respuesta["programa"] = isset($respuesta["programa"]["nombre"]) ? $respuesta["programa"]["nombre"] : "En proceso";
          $respuesta["alta"] = isset($respuesta["alta"]) ? $respuesta["alta"] : "";
          $respuesta["estatus"] = isset($respuesta["estatus_solicitud"]) ? $respuesta["estatus_solicitud"] : "";
          $respuesta["institucion"]  = isset($respuesta["instituto"]["nombre"]) ? $respuesta["instituto"]["nombre"] : "";
          if (isset($respuesta["domicilio"])) {
            $respuesta["plantel"] = $respuesta["domicilio"]["numero_exterior"] . " " . $respuesta["domicilio"]["calle"] . " " . $respuesta["domicilio"]["municipio"];
          } else {
            $respuesta["plantel"] = "S/N";
          }
          $respuesta["acciones"] = $opciones_edicion;
        }

        array_push($resultado, $respuesta);
      }
      $tabla = ""; */

      retornarWebService($_POST["url"], $resultado);
    } else {
      $resultado = array(
        "status" => "204",
        "message" => "No Content",
        "data" => ""
      );
      retornarWebService($_POST["url"], $resultado);
    }
  } else {
    $resultado = array(
      "status" => "403",
      "message" => "Permiso Denegado",
      "data" => ""
    );

    // Registro en bitacora
    /* $bitacora = new Bitacora();
    $usuarioId = isset($_SESSION["id"]) ? $_SESSION["id"] : -1;
    $bitacora->setAttributes(["usuario_id" => $usuarioId, "entidad" => "solicitudes", "accion" => "solicitudes", "lugar" => "control-solicitud"]);
    $result = $bitacora->guardar(); */
    retornarWebService($_POST["url"], $resultado);
  }
}

//Obtener los detalles de una solicitud
if ($_POST["webService"] == "detallesSolicitud") {
  $aux = new Utileria();
  $_POST = $aux->limpiarEntrada($_POST);
  $solicitud = new Solicitud;
  if ($_SESSION["rol_id"] == 3 || $_SESSION["rol_id"] == 4) {
    $res_solicitud = $solicitud->consultarPor("solicitudes", array("id" => $_POST["id"], "deleted_at"), "*");
    if (sizeof($res_solicitud["data"]) == 0) {
      $res_solicitud["status"] = "404";
    } else {
      $res_solicitud["data"] = $res_solicitud["data"][0];
    }
  }
  if ($_SESSION["rol_id"] == 2 || $_SESSION["rol_id"] > 6) {
    $solicitud->setAttributes(array("id" => $_POST["id"]));
    $res_solicitud = $solicitud->consultarId();
  }
  if ($res_solicitud["status"] != "404") {
    $respuesta["status"] = "200";
    $respuesta["message"] = "OK";
    if ($_SESSION["rol_id"] == 4) {

      $gestor = new Usuario();
      $representanteGestor = $gestor->consultarPor("usuario_usuarios", array("secundario_id" => $_SESSION["id"]), "*");
      $representanteGestor = $representanteGestor["data"][0]["principal_id"];
    }
    if ($res_solicitud["data"]["usuario_id"] == $_SESSION["id"] || $_SESSION["rol_id"] > 6 || $_SESSION["rol_id"] == 2 || (isset($representanteGestor) && $representanteGestor == $res_solicitud["data"]["usuario_id"])) {
      $respuesta["data"]["solicitud"]["id"] = $res_solicitud["data"]["id"];
      $respuesta["data"]["solicitud"]["folio"] = $res_solicitud["data"]["folio"];
      $respuesta["data"]["solicitud"]["alta"] = $res_solicitud["data"]["created_at"];
      $respuesta["data"]["solicitud"]["estatus"] = $res_solicitud["data"]["estatus_solicitud_id"];
      $respuesta["data"]["solicitud"]["tipo"] = $res_solicitud["data"]["tipo_solicitud_id"];
      $respuesta["data"]["solicitud"]["cita"] = $res_solicitud["data"]["cita"];
      $respuesta["data"]["solicitud"]["fecha_recepcion"] = $res_solicitud["data"]["fecha_recepcion"];
      $respuesta["data"]["solicitud"]["convocatoria"] = $res_solicitud["data"]["convocatoria"];
      $programa =  new Programa();
      $res_programa = $programa->consultarPor("programas", array("solicitud_id" => $res_solicitud["data"]["id"]), "*");
      $temp_programa = new Programa();
      $temp_programa->setAttributes(array("id" => $res_programa["data"][0]["id"]));
      $res_programa = $temp_programa->informacionRelacionada(2);
      $respuesta["data"]["programa"]["id"] = $res_programa["data"]["id"];
      $respuesta["data"]["programa"]["nombre"] = $res_programa["data"]["nombre"];
      $respuesta["data"]["programa"]["ciclo"] = $res_programa["data"]["ciclo"]["id"];
      $respuesta["data"]["programa"]["nivel"] = $res_programa["data"]["nivel"]["id"];
      $respuesta["data"]["programa"]["modalidad"] = $res_programa["data"]["modalidad"]["id"];
      $respuesta["data"]["programa"]["rvoe"] = $res_programa["data"]["acuerdo_rvoe"];
      $respuesta["data"]["plantel"]["cct"] = $res_programa["data"]["plantel"]["clave_centro_trabajo"];
      $respuesta["data"]["domicilio"] = $res_programa["data"]["plantel"]["domicilio"];
      $institucion = new Institucion();
      $institucion->setAttributes(array("id" => $res_programa["data"]["plantel"]["institucion_id"]));
      $res_institucion = $institucion->consultarId();
      $respuesta["data"]["institucion"] = $res_institucion["data"];
      $usuario = new Usuario();
      $usuario->setAttributes(array("id" => $res_institucion["data"]["usuario_id"]));
      $persona = $usuario->consultarId();
      $persona = $persona["data"]["persona_id"];
      $repre = new Persona();
      $repre->setAttributes(array("id" => $persona));
      $representante = $repre->consultarId();
      $respuesta["data"]["representante"] =   $representante["data"];
      $avance = new Solicitud();
      $avances = $avance->consultarPor("solicitudes_estatus_solicitudes", array("solicitud_id" => $res_solicitud["data"]["id"], "deleted_at"), "*");
      if (sizeof($avances["data"]) > 0) {
        //Detalles de los avances
        $detallesAvances = [];
        foreach ($avances["data"] as $posAvance => $valueAvance) {
          $estatus = new EstatusSolicitud();
          $estatus->setAttributes(array("id" => $valueAvance["estatus_solicitud_id"]));
          $resEstatusAvance = $estatus->consultarId();
          $resEstatusAvance = $resEstatusAvance["data"];
          $avances["data"][$posAvance]["detalles"] = $resEstatusAvance;
        }
        $respuesta["data"]["avance"] = $avances["data"];
      }
      //$respuesta["data"]["coordinador"] = $res_programa["data"]["coordinador"];
      $turno  =  new ProgramaTurno();
      $turnos = $turno->consultarPor("programas_turnos", array("programa_id" => $res_programa["data"]["id"]), "turno_id");
      if (sizeof($turnos["data"]) > 0) {
        $respuesta["data"]["turno"] = $turnos["data"];
      }
    } else {
      $respuesta["status"] = "200";
      $respuesta["message"] = "OK";
      $respuesta["data"] = "";
    }
  } else {
    $respuesta["status"] = "200";
    $respuesta["message"] = "OK";
    $respuesta["data"] = "";
  }

  // Registro en bitacora
  /* $bitacora = new Bitacora();
  $usuarioId = isset($_SESSION["id"]) ? $_SESSION["id"] : -1;
  $bitacora->setAttributes(["usuario_id" => $usuarioId, "entidad" => "solicitudes", "accion" => "detallesSolicitud", "lugar" => "control-solicitud"]);
  $result = $bitacora->guardar(); */
  retornarWebService($_POST["url"], $respuesta);
}

//Web service para guardar comentarios sobre la solicitud (Revisión de documentación)
if ($_POST["webService"] == "revisionDocumentacion") {
  $aux = new Utileria();
  $_POST = $aux->limpiarEntrada($_POST);
  $id_solicitud = $_POST["id-solicitud"];
  $comentarios = $_POST["comentarios"];
  $solicitud = new Solicitud();
  $estatus = $solicitud->consultarPor("solicitudes_estatus_solicitudes", array("solicitud_id" => $id_solicitud), "*");
  //Opción para guaradar los comentarios de la solicitud y continuar despues con la revisión
  if ($_POST["opcion"] == 1) {
    if (sizeof($estatus["data"]) > 0) {
      $estatus = $estatus["data"][0];
      $estatus_solicitud = new SolicitudEstatus();
      $estatus_solicitud->setAttributes(array("id" => $estatus["id"], "comentario" => $comentarios));
      $resultado = $estatus_solicitud->guardar();
    }
  }
  //Opción para terminar con la revisión de la solicitud
  if ($_POST["opcion"] == 2) {
    if (sizeof($estatus["data"]) > 0) {
      ($_POST["resultado"] == 2) ? $estatusF = 200 : $estatusF = 3;
      $comentariosF = $_POST["comentarios"];
      $estatus["id"] = $estatus["data"][0]["id"];
      if (sizeof($estatus["data"]) >= 2) {
        $tam = sizeof($estatus["data"]);
        $estatus["id"] = $estatus["data"][$tam - 1]["id"];
      }
      $estatus_solicitudes = new SolicitudEstatus();
      $estatus_solicitudes->setAttributes(array("id" => $estatus["id"], "comentario" => $comentariosF));
      $resultado = $estatus_solicitudes->guardar();
      if ($estatusF == 3) {
        $fecha = date("Y-m-d");
      } else {
        $fecha = "";
      }
      $solicitudF = new Solicitud();
      $solicitudF->setAttributes(array("id" => $id_solicitud, "estatus_solicitud_id" => $estatusF, "fecha" => $fecha));
      $res_solicitudF = $solicitudF->guardar();
      if ($res_solicitudF["data"]["id"]) {
        $new_estatus = new SolicitudEstatus();
        $new_estatus->setAttributes(array("estatus_solicitud_id" => $estatusF, "solicitud_id" => $res_solicitudF["data"]["id"]));
        $resF = $new_estatus->guardar();
        if ($resF["data"]["id"]) {
          //Se agregó
          // Horario de 9:00 a 14:00 y de 15:00 a 17:00
          $horaInicio = '09:00:00';
          $horaMitad = '13:00:00';
          $horaInicio2 = '15:00:00';
          $horaFin = '16:00:00';

          // Obtener ultima fecha de cita
          date_default_timezone_set('America/Mexico_City');
          $ultimaSolicitud = new Solicitud();
          $ultimaSolicitud = $ultimaSolicitud->consultarUltimaCita();
          $ultimaSolicitud = (isset($ultimaSolicitud["data"]) && !empty($ultimaSolicitud["data"])) ? $ultimaSolicitud["data"] : false;
          // Ultima fecha de cita
          $ultimaFechaCita = ($ultimaSolicitud && isset($ultimaSolicitud['cita'])) ? date('Y-m-d H:i:s', strtotime($ultimaSolicitud['cita'])) : date('Y-m-d H:i:s', strtotime(date('Y-m-d H:i:s') . " + 1 week"));
          // Siguiente fecha de cita en
          $hoy = date('Y-m-d');
          $nextDate = date('Y-m-d', strtotime("$hoy + 3 days"));
          $nextDiaSemana = date('N', strtotime("$nextDate"));
          if ('7' === $nextDiaSemana) {
            $nextDate = date('Y-m-d', strtotime("$nextDate + 1 days"));
          } else if ('6' === $nextDiaSemana) {
            $nextDate = date('Y-m-d', strtotime("$nextDate + 2 days"));
          }
          $ultimaFecha = strstr($ultimaFechaCita, ' ', true);

          // Si la fecha de hoy es mayor a la ultima inicializar la hora
          if ($nextDate > $ultimaFecha) {
            $hora = $horaInicio;
          } else { // sino obtener la hora siguiente
            $nextDate = $ultimaFecha;
            $ultimaHora = substr(strstr($ultimaFechaCita, ' '), 1);
            if ($ultimaHora == $horaMitad) {
              $hora = date('H:i:s', strtotime($horaInicio2));
            } else if ($ultimaHora == $horaFin) {
              $hora = date('H:i:s', strtotime($horaInicio));
              $diaSemana = date('N', strtotime("$ultimaFechaCita"));
              // viernes 5
              if ('5' == $diaSemana) {
                $nextDate = date('Y-m-d', strtotime("$ultimaFecha + 3 days"));
              } else {
                $nextDate = date('Y-m-d', strtotime("$ultimaFecha + 1 day"));
              }
            } else {
              $hora = date('H:i:s', strtotime($ultimaHora) + (60 * 60));
            }
          }

          $cita = $nextDate . " " . $hora;
          $parametros["cita"] = $cita;
          $parametros["id"] = $id_solicitud;
          $solicitud = new Solicitud();
          $solicitud->setAttributes($parametros);
          $resultado = $solicitud->guardar();
          $resultado["message"] = "$cita Fecha de cita para la solicitud: " . $resultado["data"]["id"];
          //Notificación a apps
          $usuarioNotificar = new Solicitud();
          $usuarioNotificar->setAttributes(array("id" => $id_solicitud));
          $resUsuarioNotificar = $usuarioNotificar->consultarId();
          $resUsuarioNotificar = $resUsuarioNotificar["data"];
          $notificacion = new Usuario();
          $msj = "Debe de pasar a entregar su documentación.";
          $notificacion->notificacionIdUsuario($resUsuarioNotificar["usuario_id"], "Avances", $msj);
          //
          $resultado = $resF;
        } else {
          $resultado = "Error al guardar";
        }
      } else {
        $resultado = "Error al guardar";
      }
    }
  }
  // Registro en bitacora
  /* $bitacora = new Bitacora();
  $usuarioId = isset($_SESSION["id"]) ? $_SESSION["id"] : -1;
  $bitacora->setAttributes(["usuario_id" => $usuarioId, "entidad" => "solicitudes", "accion" => "revisionDocumentacion", "lugar" => "control-solicitud"]);
  $result = $bitacora->guardar(); */
  retornarWebService($_POST["url"], $resultado);
}

//Web service para obtener todas las instituciones que por lo menos tienen una solicitud (APPS)
if ($_POST["webService"] == "institucionesSolicitudes") {
  $arreglo_solicitudes = array();
  $resultado["status"] = "200";
  $resultado["message"] = "OK";
  $resultado["data"] = array();
  $aux = new Utileria();
  $_POST = $aux->limpiarEntrada($_POST);
  $objusuario = new Usuario();
  $objusuario->setAttributes(array("id" => $_POST["usuario_id"]));
  $usuario = $objusuario->consultarId();
  $programa = new Programa();
  if ($usuario["status"] == "200") {
    if ($usuario["data"]["rol_id"] == 3) {
      $solicitudes = $programa->consultarPor("instituciones", array("usuario_id" => $_POST["usuario_id"]), array("id,nombre"));
      if (sizeof($solicitudes["data"]) > 0) {
        $tempInstitucion[0]["id"] = $solicitudes["data"][0]["id"];
        $tempInstitucion[0]["institucion"] = $solicitudes["data"][0]["nombre"];
        $resultado["data"]["instituciones"] = $tempInstitucion;
      }
    }
    if ($usuario["data"]["rol_id"] == 2 ||  $usuario["data"]["rol_id"] > 7) {
      $solicitudes = $programa->consultarTodos();
      if (sizeof($solicitudes["data"]) > 0) {
        foreach ($solicitudes["data"] as $posicion => $valores) {
          $plantel = new Plantel();
          $res_plantel = $plantel->consultarPor("planteles", array("id" => $valores["plantel_id"], "deleted_at"), array("id", "institucion_id", "deleted_at"));
          if (sizeof($res_plantel["data"]) > 0) {
            $id_institucion = $res_plantel["data"][0]["institucion_id"];
            $institucion = new Institucion();
            $res_institucion = $institucion->consultarPor("instituciones", array("id" => $id_institucion, "deleted_at"), array("id", "nombre"));
            if (sizeof($res_institucion["data"]) > 0) {
              $res_institucion = $res_institucion["data"][0];
              $temp["id"] = $res_institucion["id"];
              $temp["institucion"] = $res_institucion["nombre"];
              array_push($arreglo_solicitudes, $temp);
            }
          }
        }
        if (sizeof($arreglo_solicitudes) > 0) {
          //Agrupar por instituciones
          function arraySort($input, $sortkey)
          {
            foreach ($input as $key => $val) {
              $output[$val[$sortkey]][] = $val;
            }
            return $output;
          }
          $myArray = arraySort($arreglo_solicitudes, 'institucion_id');
          //Construir resultado
          $result = array();
          foreach ($myArray as $indice => $valores) {
            $tempInst["id"] = $valores[0]["id"];
            $tempInst["institucion"] = $valores[0]["institucion"];
            array_push($result, $tempInst);
          }
          $resultado["data"]["instituciones"] = $result;
        }
      }
    }
  }
  // Registro en bitacora
  /* $bitacora = new Bitacora();
  $usuarioId = isset($_SESSION["id"]) ? $_SESSION["id"] : -1;
  $bitacora->setAttributes(["usuario_id" => $usuarioId, "entidad" => "solicitudes", "accion" => "institucionesSolicitudes", "lugar" => "control-solicitud"]);
  $result = $bitacora->guardar(); */

  retornarWebService($_POST["url"], $resultado);
}
//Web service para obtener las solicitudes de una institucion se requiere id de la institución
if ($_POST["webService"] == "solicitudesInstitucion") {
  $resultado["status"] = "200";
  $resultado["message"] = "OK";
  $resultado["data"] = array();
  $aux = new Utileria();
  $_POST = $aux->limpiarEntrada($_POST);
  //Consulta los planteles de la institucion
  $plantel = new Plantel();
  $planteles = $plantel->consultarPor("planteles", array("institucion_id" => $_POST["id"], "deleted_at"), array("id,domicilio_id"));
  if (sizeof($planteles["data"]) > 0) {
    $programas = array();
    foreach ($planteles["data"] as $posicion => $campo) {
      //Consultar los programas de estudios con los que cuenta cada plantel de la institución
      $programa = new Programa();
      $programas_temp = $programa->consultarPor("programas", array("plantel_id" => $campo["id"], "deleted_at"), array("id", "solicitud_id"));
      if (sizeof($programas_temp["data"]) > 0) {
        array_push($programas, $programas_temp["data"]);
      }
    }
    $programasFinal = array();
    for ($i = 0; $i < sizeof($programas); $i++) {
      foreach ($programas[$i] as $key => $value) {
        array_push($programasFinal, $value);
      }
    }
    $result = array();
    foreach ($programasFinal as $llave => $campos) {
      $solicitud = new Solicitud();
      $res_solicitud = $solicitud->consultarPor("solicitudes", array("id" => $campos["solicitud_id"], "deleted_at"), array("id,folio"));
      if (sizeof($res_solicitud["data"]) > 0) {
        array_push($result, $res_solicitud["data"][0]);
      }
    }

    if (sizeof($result) > 0) {
      $resultado["data"]["solicitudes"] = $result;
    }
  }
  // Registro en bitacora
  /* $bitacora = new Bitacora();
  $usuarioId = isset($_SESSION["id"]) ? $_SESSION["id"] : -1;
  $bitacora->setAttributes(["usuario_id" => $usuarioId, "entidad" => "solicitudes", "accion" => "solicitudesInstitucion", "lugar" => "control-solicitud"]);
  $result = $bitacora->guardar(); */
  retornarWebService($_POST["url"], $resultado);
}
//Web service que detalla una solicitud se requiere id de la solicitud (APPS)
if ($_POST["webService"] == "avanceSolicitud") {
  $resultado["status"] = "200";
  $resultado["message"] = "OK";
  $resultado["data"] = array();
  $aux = new Utileria();
  $_POST = $aux->limpiarEntrada($_POST);
  $solicitud = new Solicitud;
  $res_solicitud = $solicitud->consultarPor("solicitudes", array("id" => $_POST["id"], "deleted_at"), array("id,folio,created_at"));
  if (sizeof($res_solicitud["data"]) > 0) {
    $temp["id_solicitud"] = $res_solicitud["data"][0]["id"];
    $temp["folio"] = $res_solicitud["data"][0]["folio"];
    $temp["fecha"] = $res_solicitud["data"][0]["created_at"];
    $temp["porcentaje"] = 0;
    $temp["etapas"] = array();
    $estatus = new SolicitudEstatus();
    $avance = $estatus->consultarPor("solicitudes_estatus_solicitudes", array("solicitud_id" => $temp["id_solicitud"], "deleted_at"), array("id,estatus_solicitud_id,solicitud_id,comentario"));
    if (sizeof($avance["data"]) > 0) {
      $ultima_posicion = sizeof($avance["data"]);
      $avances = array();
      foreach ($avance["data"] as $posicion => $campos) {
        $estado = new EstatusSolicitud();
        $estado->setAttributes(array("id" => $campos["estatus_solicitud_id"]));
        if ($campos["estatus_solicitud_id"] < 11) {
          $temp["porcentaje"] =  $campos["estatus_solicitud_id"] *  9;
        }
        if ($campos["estatus_solicitud_id"] == 11) {
          $temp["porcentaje"] = 100;
        }
        $temporal = $estado->consultarId();
        $detalles["nombre"] = $temporal["data"]["nombre"];
        $detalles["descripcion"] = $temporal["data"]["descripcion"];
        $detalles["comentario"] = $campos["comentario"];
        $detalles["status"] = 1;
        if (($posicion + 1) == $ultima_posicion) {
          $detalles["status"] = 0;
        }
        array_push($avances, $detalles);
        //$detalles["status"]
      }
      $temp["etapas"] = $avances;
    }
    $resultado["data"] = $temp;
  }
  // Registro en bitacora
  /* $bitacora = new Bitacora();
  $usuarioId = isset($_SESSION["id"]) ? $_SESSION["id"] : -1;
  $bitacora->setAttributes(["usuario_id" => $usuarioId, "entidad" => "solicitudes", "accion" => "avanceSolicitud", "lugar" => "control-solicitud"]);
  $result = $bitacora->guardar(); */
  retornarWebService($_POST["url"], $resultado);
}

//Web service para el guardar el cotejamiento de la documentación
if ($_POST["webService"] == "cotejamiento") {
  $resultado["status"] = "200";
  $resultado["message"] = "OK";
  $resultado["data"] = array();
  $aux = new Utileria();
  $_POST = $aux->limpiarEntrada($_POST);

  $estatus = new SolicitudEstatus();
  $res_estatus = $estatus->consultarPor("solicitudes_estatus_solicitudes", array("solicitud_id" => $_POST["id_solicitud"], "estatus_solicitud_id" => 3), "*");
  $id_estatus  = $res_estatus["data"][0];

  $actu_coment = new SolicitudEstatus();
  $actu_coment->setAttributes(array("id" => $id_estatus["id"], "comentario" => $_POST["comentarios"]));
  $actu_coment->guardar();

  $estatus_solicitud = new SolicitudEstatus();
  $estatus_solicitud->setAttributes(array("estatus_solicitud_id" => 6, "solicitud_id" => $_POST["id_solicitud"]));
  $res = $estatus_solicitud->guardar();

  $solicitud = new Solicitud;
  $solicitud->setAttributes(array("id" => $_POST["id_solicitud"], "estatus_solicitud_id" => 6, "fecha_recepcion" => $_POST["fecha_recepcion"]));
  $solicitud->guardar();
  
  $oficio = new Oficio;
  $oficio->setAttributes(array("oficio" => $_POST["folio_admisorio"], "documento" => "OficioAdmisorio", "solicitud_id" => $_POST["id_solicitud"], "fecha" => $_POST["fecha_recepcion"]));
  $oficio->guardar();

  //Notificación a apps
  $usuarioNotificar = new Solicitud();
  $usuarioNotificar->setAttributes(array("id" => $_POST["id_solicitud"]));
  $resUsuarioNotificar = $usuarioNotificar->consultarId();
  $resUsuarioNotificar = $resUsuarioNotificar["data"];
  $notificacion = new Usuario();
  $msj = "Su solicitud está por ser asignada para inspección.";
  $notificacion->notificacionIdUsuario($resUsuarioNotificar["usuario_id"], "Avances", $msj);


  if ($res["data"]["id"] > 0) {
    /* $bitacora = new Bitacora();
    $usuarioId = isset($_SESSION["id"]) ? $_SESSION["id"] : -1;
    $bitacora->setAttributes(["usuario_id" => $usuarioId, "entidad" => "solicitudes", "accion" => "agendarCita", "lugar" => "control-solicitud"]);
    $result = $bitacora->guardar(); */
  }


  retornarWebService("../views/solicitudes.php", $resultado);
}

if ($_POST["webService"] == "entregarRVOE") {
  $solicitud = new Solicitud;
  $solicitud->setAttributes(array("id" => $_POST["solicitud_id"], "estatus_solicitud_id" => 11));
  $solicitud->guardar();
  $estatus_solicitud = new SolicitudEstatus();
  $estatus_solicitud->setAttributes(array("estatus_solicitud_id" => 11, "solicitud_id" => $_POST["solicitud_id"], "comentario" => $_POST["comentarios"]));
  $resultado = $estatus_solicitud->guardar();
  retornarWebService("", $resultado);
}

//Web service para graficas
if ($_POST["webService"] == "numeroSolicitudes") {
  $solicitud = new Solicitud();
  $solicitudes = $solicitud->consultarTodos();
  $resultado["data"] = [];
  $proceso = 0;
  $terminadas = 0;
  $rechazadas = 0;
  if (sizeof($solicitudes["data"]) > 0) {
    $solicitudes = $solicitudes["data"];
    foreach ($solicitudes as $key => $value) {
      if ($value["estatus_solicitud_id"] == 11) {
        $terminadas++;
      }
      if ($value["estatus_solicitud_id"] != 100 && $value["estatus_solicitud_id"] != 11) {
        $proceso++;
      }
      if ($value["estatus_solicitud_id"] == 100) {
        $rechazadas++;
      }
    }
    $resultado["data"]["proceso"] = $proceso;
    $resultado["data"]["terminadas"] = $terminadas;
    $resultado["data"]["rechazadas"] = $rechazadas;
  }
  retornarWebService("", $resultado);
}
//Web service para graficas
if ($_POST["webService"] == "numeroSolicitudesEstatus") {
  $estatus = new EstatusSolicitud();
  $res_estatus = $estatus->consultarTodos();
  $resultadosf["data"] = [];
  if (sizeof($res_estatus["data"]) > 0) {
    $res_estatus = $res_estatus["data"];
    foreach ($res_estatus as $value) {
      $temp = new Solicitud();
      $res_temp = $temp->consultarPor("solicitudes", array("estatus_solicitud_id" => $value["id"], "deleted_at"), "*");
      $solicitudes[] = array(
        'estatus'   => $value["nombre"],
        'cantidad'  => count($res_temp["data"])
      );
    }
    $resultadosf["data"] = $solicitudes;
  }

  retornarWebService("", $resultadosf);
}

//Cambiar a estatus "SOLICITUD RECHAZADA" a una solicitud
if ($_POST["webService"] == "eliminarSolicitud") {
  $solicitud = new Solicitud;
  $solicitud->setAttributes(array("id" => $_POST["solicitud_id"], "estatus_solicitud_id" => 100));
  $solicitud->guardar();
  $estatus_solicitud = new SolicitudEstatus();
  $estatus_solicitud->setAttributes(array("estatus_solicitud_id" => 100, "solicitud_id" => $_POST["solicitud_id"], "comentario" => $_POST["comentarios"]));
  $resultado = $estatus_solicitud->guardar();
  retornarWebService("", $resultado);
}
?>
