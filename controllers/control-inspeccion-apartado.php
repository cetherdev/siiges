<?php

/**
 * Archivo que gestiona los web services de la clase InspeccionApartado
 */

require_once "../models/modelo-inspeccion-apartado.php";
require_once "../utilities/utileria-general.php";
require_once "../models/modelo-bitacora.php";


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
  $obj = new InspeccionApartado();
  $obj->setAttributes(array());
  $resultado = $obj->consultarTodos();
  // Registro en bitacora
  /* $bitacora = new Bitacora();
      $usuarioId= isset($_SESSION["id"])?$_SESSION["id"]:-1;
      $bitacora->setAttributes(["usuario_id"=>$usuarioId,"entidad"=>"inspeccion_apartados","accion"=>"consultarTodos","lugar"=>"control-inspeccion-apartado"]);
      $result = $bitacora->guardar(); */
  retornarWebService($_POST["url"], $resultado);
}

// Web service para consultar registro por id
if ($_POST["webService"] == "consultarId") {
  $obj = new InspeccionApartado();
  $aux = new Utileria();
  $_POST = $aux->limpiarEntrada($_POST);
  $obj->setAttributes(array("id" => $_POST["id"]));
  $resultado = $obj->consultarId();
  // Registro en bitacora
  /* $bitacora = new Bitacora();
      $usuarioId= isset($_SESSION["id"])?$_SESSION["id"]:-1;
      $bitacora->setAttributes(["usuario_id"=>$usuarioId,"entidad"=>"inspeccion_apartados","accion"=>"consultarId","lugar"=>"control-inspeccion-apartado"]);
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
  $obj = new InspeccionApartado();
  $obj->setAttributes($parametros);
  $resultado = $obj->guardar();
  // Registro en bitacora
  /* $bitacora = new Bitacora();
      $usuarioId= isset($_SESSION["id"])?$_SESSION["id"]:-1;
      $bitacora->setAttributes(["usuario_id"=>$usuarioId,"entidad"=>"inspeccion_apartados","accion"=>"guardar","lugar"=>"control-inspeccion-apartado"]);
      $result = $bitacora->guardar(); */
  retornarWebService($_POST["url"], $resultado);
}

// Web service para eliminar registro
if ($_POST["webService"] == "eliminar") {
  $obj = new InspeccionApartado();
  $aux = new Utileria();
  $_POST = $aux->limpiarEntrada($_POST);
  $obj->setAttributes(array("id" => $_POST["id"]));
  $resultado = $obj->eliminar();
  // Registro en bitacora
  /* $bitacora = new Bitacora();
      $usuarioId= isset($_SESSION["id"])?$_SESSION["id"]:-1;
      $bitacora->setAttributes(["usuario_id"=>$usuarioId,"entidad"=>"inspeccion_apartados","accion"=>"eliminar","lugar"=>"control-inspeccion-apartado"]);
      $result = $bitacora->guardar(); */
  retornarWebService($_POST["url"], $resultado);
}
