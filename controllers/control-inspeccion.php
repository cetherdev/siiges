<?php
  /**
  * Archivo que gestiona los web services de la clase Inspeccion
  */
  require_once "../models/modelo-inspeccion.php";
  require_once "../utilities/utileria-general.php";
  require_once "../models/modelo-programa.php";
  require_once "../models/modelo-plantel.php";
  require_once "../models/modelo-institucion.php";
  require_once "../models/modelo-inspeccion-pregunta.php";
  require_once "../models/modelo-inspeccion-observacion.php";
  require_once "../models/modelo-inspeccion-tipo-pregunta.php";
  require_once "../models/modelo-inspeccion-apartado.php";
  require_once "../models/modelo-inspeccion-categoria.php";
  require_once "../models/modelo-tipo-instalacion.php";
  require_once "../models/modelo-infraestructura.php";
  require_once "../models/modelo-inspector.php";
  require_once "../models/modelo-persona.php";
  require_once "../models/modelo-inspecciones-preguntas.php";
  require_once "../models/modelo-inspeccion-observacion.php";
  require_once "../models/modelo-solicitud.php";
  require_once "../models/modelo-solicitud-estatus.php";
  require_once "../models/modelo-usuario.php";
  require_once "../models/modelo-bitacora.php";
  require_once "../models/modelo-estatus-inspeccion.php";



	function retornarWebService( $url, $resultado )
	{
    if( $url!="" )
		{
			header( "Location: $url" );
			exit( );
		}
		else
		{
			echo json_encode( $resultado );
			exit( );
		}
	}

	//====================================================================================================

  // Web service para consultar todos los registros
  if( $_POST["webService"]=="consultarTodos" )
  {
    $obj = new Inspeccion( );
		$obj->setAttributes( array( ) );
		$resultado = $obj->consultarTodos( );
    // Registro en bitacora
      $bitacora = new Bitacora();
      $usuarioId= isset($_SESSION["id"])?$_SESSION["id"]:-1;
      $bitacora->setAttributes(["usuario_id"=>$usuarioId,"entidad"=>"inspecciones","accion"=>"consultarTodos","lugar"=>"control-inspeccion"]);
      $result = $bitacora->guardar();
		retornarWebService( $_POST["url"], $resultado );
  }

  // Web service para consultar registro por id
  if( $_POST["webService"]=="consultarId" )
  {
    $obj = new Inspeccion();
    $aux = new Utileria( );
    $_POST = $aux->limpiarEntrada( $_POST );
		$obj->setAttributes( array( "id"=>$_POST["id"] ) );
    $resultado = $obj->consultarId( );
    // Registro en bitacora
      $bitacora = new Bitacora();
      $usuarioId= isset($_SESSION["id"])?$_SESSION["id"]:-1;
      $bitacora->setAttributes(["usuario_id"=>$usuarioId,"entidad"=>"inspecciones","accion"=>"consultarId","lugar"=>"control-inspeccion"]);
      $result = $bitacora->guardar();
		retornarWebService( $_POST["url"], $resultado );
  }

  // Web service para guardar registro
  if( $_POST["webService"]=="guardar" )
  {
    $parametros = array( );
    $aux = new Utileria( );
    $_POST = $aux->limpiarEntrada( $_POST );
		foreach( $_POST as $atributo=>$valor )
		{
			$parametros[$atributo] = $valor;
		}
		$obj = new Inspeccion( );
		$obj->setAttributes( $parametros );
    $resultado = $obj->guardar( );
    // Registro en bitacora
      $bitacora = new Bitacora();
      $usuarioId= isset($_SESSION["id"])?$_SESSION["id"]:-1;
      $bitacora->setAttributes(["usuario_id"=>$usuarioId,"entidad"=>"inspecciones","accion"=>"guardar","lugar"=>"control-inspeccion"]);
      $result = $bitacora->guardar();
		retornarWebService( $_POST["url"], $resultado );
  }

  // Web service para eliminar registro
  if( $_POST["webService"]=="eliminar" )
  {
    $obj = new Inspeccion( );
    $aux = new Utileria( );
    $_POST = $aux->limpiarEntrada( $_POST );
		$obj->setAttributes( array( "id"=>$_POST["id"] ) );
    $resultado = $obj->eliminar( );
    // Registro en bitacora
      $bitacora = new Bitacora();
      $usuarioId= isset($_SESSION["id"])?$_SESSION["id"]:-1;
      $bitacora->setAttributes(["usuario_id"=>$usuarioId,"entidad"=>"inspecciones","accion"=>"eliminar","lugar"=>"control-inspeccion"]);
      $result = $bitacora->guardar();
		retornarWebService( $_POST["url"], $resultado );
  }

  //Web service para cargar las preguntas de la guia de inspección (requiere id de la inspección)
  if( $_POST["webService"] == "guiaInspeccion")
  {
    $obj = new Inspeccion( );
    $aux = new Utileria( );
    $_POST = $aux->limpiarEntrada( $_POST );
    $resultado["status"] = "200";
    $resultado["message"] = "OK";

    $resultado["data"] = array();
    //id inspeccion
    $obj->setAttributes( array( "id" => $_POST["id"] ) );
    $respuesta = $obj->consultarId();
    if( $respuesta["status"] == "200" ){
        //Apartados para la guia de inspección
        $apartado = new InspeccionApartado( );
    		$apartados = $apartado->consultarPor("inspeccion_apartados", array("tipo_apartado"=>1), array("id,nombre") );
        $array_preguntas = array();
        //Agrupar las preguntas por apartados
        foreach ($apartados["data"] as $posicion => $valores) {
          //Consultar pregutnas del apartado
          $pregunta = new InspeccionPregunta();
          $preguntas = $pregunta->consultarPor("inspeccion_preguntas",array("id_inspeccion_apartado"=>$valores["id"]),array("id","pregunta","id_inspeccion_tipo_pregunta","id_inspeccion_categoria"));
          //Consultar información relacionada con cada pregunta del apartado
          if( sizeof($preguntas["data"] ) > 0 ){
            foreach ($preguntas["data"] as $indice => $arreglo) {
               //Tipo de pregunta
               $tipo_pregunta = new InspeccionTipoPregunta();
               $res_tipo_pregunta = $tipo_pregunta->consultarPor( "inspeccion_tipo_preguntas", array( "id" => $arreglo["id_inspeccion_tipo_pregunta"] ), array("nombre","descripcion"));
               //Categoria
               $categoria = new InspeccionCategoria();
               $res_categoria =   $categoria->consultarPor("inspeccion_categorias",array("id"=>$arreglo["id_inspeccion_categoria"]),array("nombre","descripcion","instruccion"));
               //Respuesta de la pregunta en caso de tener
               $respuesta = new Inspeccion();
               $res_respuesta = $respuesta->consultarPor("inspecciones_inspeccion_preguntas",array("inspeccion_id"=>$_POST["id"],"inspeccion_pregunta_id"=>$arreglo["id"]),array("respuesta"));
               if( sizeof($res_respuesta["data"]) > 0 ){
                 $res_respuesta["data"] = $res_respuesta["data"][0]["respuesta"];
               }else{
                 $res_respuesta["data"] ="";
               }
               //Agregar apartados creados
               $preguntas["data"][$indice]["tipo_pregunta"] =   $res_tipo_pregunta["data"][0];
               $preguntas["data"][$indice]["categoria"] =   $res_categoria["data"][0];
              $preguntas["data"][$indice]["respuesta"] =  $res_respuesta["data"];
            }

          }

          $observacion = new InspeccionObservacion( );
          $observaciones = $observacion->consultarPor("inspeccion_observaciones",array("inspeccion_apartado_id"=>$valores["id"]),array("comentario"));
          $temp["id"] = $valores["id"];
          $temp["apartado"] = $valores["nombre"];
          if( sizeof($observaciones["data"]) > 0 ){
            $temp["comentario"] = $observaciones["data"][0]["comentario"];
          }else{
            $temp["comentario"]="";
          }
          $temp["preguntas"] = $preguntas["data"];
          array_push($array_preguntas,$temp);
        }
        if( sizeof( $array_preguntas ) > 0 ) {
            $resultado["data"]["id"] = $_POST["id"];
            $resultado["data"]["reactivos"] =$array_preguntas;
        }
    }
    // Registro en bitacora
      $bitacora = new Bitacora();
      $usuarioId= isset($_SESSION["id"])?$_SESSION["id"]:-1;
      $bitacora->setAttributes(["usuario_id"=>$usuarioId,"entidad"=>"inspecciones","accion"=>"guiaInspeccion","lugar"=>"control-inspeccion"]);
      $result = $bitacora->guardar();
    retornarWebService( $_POST["url"], $resultado );
  }

  //Web service para cargar las opciones del acta de inspección (requiere id de la inspección)
  if( $_POST["webService"] == "informacionActaInspeccion" )
  {
    $obj = new Inspeccion( );
    $aux = new Utileria( );
    $_POST = $aux->limpiarEntrada( $_POST );
    $resultado["status"] = "200";
    $resultado["message"] = "OK";

    $resultado["data"] = array();

    //id inspeccion
    $obj->setAttributes( array( "id" => $_POST["id"] ) );
    $respuesta = $obj->consultarId();
    if( $respuesta["status"] == "200" ){
      $resultado["id_inspeccion"] = $respuesta["data"]["id"];
      //Apartados para la guia de inspección
      $apartado = new InspeccionApartado( );
      $apartados = $apartado->consultarPor("inspeccion_apartados", array("tipo_apartado"=>2), array("id","nombre","descripcion") );
      //Agrupar por apartados
      $array_acta = array();
      $plantel_id="";
      foreach ($apartados["data"] as $posicion => $valores) {
          $temp["id_apartado"] = $valores["id"];
          $temp["nombre_apartado"] = $valores["nombre"];
          $observacion = new InspeccionObservacion();
          $observaciones = $observacion->consultarPor("inspeccion_observaciones",array("inspeccion_apartado_id"=>$valores["id"],"inspeccion_id"=>$resultado["id_inspeccion"]),array("comentario"));
          if( sizeof($observaciones["data"])>0){
            $temp["observaciones"] =$observaciones["data"][0]["comentario"] ;
          }else{
            $temp["observaciones"] = "";
          }
          $temp["respuestas"]=array();
          if( $valores["descripcion"] == "caracteristica_inmueble" ){
            $programa = new Programa();
            $res_programa = $programa->consultarPor("programas",array("solicitud_id"=>$_POST["id"]),array("plantel_id"));
            if(sizeof($res_programa["data"])>0){
              $plantel_id = $res_programa["data"][0]["plantel_id"];
                $plantel = new Plantel();
                $plantel->setAttributes(array("id"=>$res_programa["data"][0]["plantel_id"]));
                $res_plantel = $plantel->consultarId();
                if($res_plantel["status"]=="200"){
                  $borrar[0] = array("respuesta"=>$res_plantel["data"]["caracteristica_inmueble"]);
                  $temp["respuestas"]= $borrar;
                }
            }
          }else if( $valores["descripcion"] != "tipo_instalaciones" ){
            $aux = new Inspeccion();
            $res_aux = $aux->consultarPor($valores["descripcion"],array("plantel_id"=>$plantel_id),"*");
            if(sizeof($res_aux["data"])>0){
              foreach ($res_aux["data"] as $posicion => $values) {
                if( array_key_exists('edificio_nivel_id', $values) ){
                  $tabla_consulta = "edificios_niveles";
                  $id_buscar = $values["edificio_nivel_id"];
                }
                if( array_key_exists('seguridad_sistema_id', $values) ){
                  $tabla_consulta = "seguridad_sistemas";
                  $id_buscar = $values["seguridad_sistema_id"];
                }
                if( array_key_exists('higiene_id', $values) ){
                  $tabla_consulta = "higienes";
                  $id_buscar = $values["higiene_id"];
                }
                $borrar = new Inspeccion();
                $res_borrar = $borrar->consultarPor($tabla_consulta,array("id"=>$id_buscar),"*");
                $res_borrar = $res_borrar["data"][0];
                $res_auxi[$posicion]["respuesta"] = $res_borrar["descripcion"];
                if(array_key_exists('cantidad', $values)){
                    $res_auxi[$posicion]["respuesta"] = $res_borrar["descripcion"].":". $values["cantidad"];
                }
                $temp["respuestas"] = $res_auxi;
              }
            }

          }else if( $valores["descripcion"] == "tipo_instalaciones" ) {
            $tipo_instalacion = new TipoInstalacion();
            $res_tipo_instalacion = $tipo_instalacion->consultarPor("tipo_instalaciones",array("descripcion"=>$valores["nombre"]),"*");
            if( sizeof( $res_tipo_instalacion["data"] ) > 0 ){
              $infraestructura = new Infraestructura();
              $res_infraestructura = $infraestructura->consultarPor("infraestructuras",array("plantel_id"=>$plantel_id,"tipo_instalacion_id"=>$res_tipo_instalacion["data"][0]["id"]),"*");
              if(sizeof($res_infraestructura["data"])>0){
                foreach ($res_infraestructura["data"] as $posicionn => $valuesn) {
                    $res_auxir[$posicionn]["respuesta"] = $valuesn["nombre"]." ubicado en ". $valuesn["ubicacion"]." con capacidad para ". $valuesn["capacidad"]." cuenta con ".$valuesn["metros"]." mts. Recursos con los que cuenta: ".$valuesn["recursos"];
                }
                $temp["respuestas"] = $res_auxir;
              }

            }

          }

          array_push($array_acta,$temp);
      }

      if( sizeof($array_acta)>0){
        $resultado["data"]["apartados"] = $array_acta;
      }else{
        $resultado["data"]["apartados"] = "";
      }

    }

    // Registro en bitacora
      $bitacora = new Bitacora();
      $usuarioId= isset($_SESSION["id"])?$_SESSION["id"]:-1;
      $bitacora->setAttributes(["usuario_id"=>$usuarioId,"entidad"=>"inspecciones","accion"=>"informacionActaInspeccion","lugar"=>"control-inspeccion"]);
      $result = $bitacora->guardar();
    retornarWebService( $_POST["url"], $resultado );

  }

  //Web service para obtener las inspecciones asignadas a un inspector recibe id del inspector
  if(  $_POST["webService"] == "inspeccionesInspector" )
  {
    $resultado["status"] = "200";
    $resultado["message"] = "OK";

    $resultado["data"] = array();

    $aux = new Utileria( );
    $_POST = $aux->limpiarEntrada( $_POST );
    //Consultar datos del inspector
    $persona = new Persona();
    $persona->setAttributes(array("id"=>$_POST["persona_id"]));
    $res_persona = $persona->consultarId();
    $inspector = new Inspector();
    $inspector->setAttributes(array("persona_id" => $_POST["persona_id"]));
    $inspecciones_realizadas = $inspector->consultarInspeccionesInspector();
    if( $res_persona["status"] == "200" )
    {
      /* $programas_inspeccionados = $inspeccion->consultarPor("inspectores",array("persona_id"=>$_POST["persona_id"], "deleted_at"),array("programa_id"));
      if( sizeof($programas_inspeccionados["data"]) > 0 )
      {
        $programas_inspeccionados = $programas_inspeccionados["data"];
        $res_inspector = $res_inspector["data"];
        $inspecciones = array();
        foreach ($programas_inspeccionados as $posicion => $campos)
        {
          $inspeccion = new Inspeccion();
          $res_inspeccion= $inspeccion->consultarPor("inspecciones",array("programa_id"=>$campos["programa_id"]),array("id","estatus_inspeccion_id","fecha","fecha_asignada","folio"));
          if( $res_inspeccion["data"][0]["estatus_inspeccion_id"] != 5){
          $temp["id_inspeccion"] = $res_inspeccion["data"][0]["id"];
          $temp["folio_inspeccion"] = $res_inspeccion["data"][0]["folio"];
          $temp["fecha_inspeccion"] = $res_inspeccion["data"][0]["fecha"];
          $temp["fecha_realizar"] = $res_inspeccion["data"][0]["fecha_asignada"];
          $temp["estatus_inspeccion"] = $res_inspeccion["data"][0]["estatus_inspeccion_id"];
          $programa = new Programa();
          $programa->setAttributes(array("id"=>$campos["programa_id"]));
          $res_programa = $programa->consultarId();
          $temp["id_programa_educativo"] = $res_programa["data"]["id"];
          $temp["nombre_programa_educativo"] = $res_programa["data"]["nombre"];
          $plantel = new Plantel();
          $plantel->setAttributes(array("id"=> $res_programa["data"]["plantel_id"]));
          $res_plantel = $plantel->informacionRelacionada();
          $temp["plantel"] = "#".$res_plantel["data"]["domicilio"]["numero_exterior"]. " ".$res_plantel["data"]["domicilio"]["calle"] ." colonia ".$res_plantel["data"]["domicilio"]["colonia"].", ".$res_plantel["data"]["domicilio"]["municipio"];
          $instituto = new Institucion();
          $instituto->setAttributes(array("id"=>$res_plantel["data"]["institucion_id"]));
          $res_instituto = $instituto->consultarId();
          $temp["id_institucion"] = $res_instituto["data"]["id"];
          $temp["nombre_institucion"] = $res_instituto["data"]["nombre"];
          array_push($inspecciones,$temp);
          }
        }

        if( sizeof($inspecciones)>0 )
        {
          $resultado["data"] = $inspecciones;
        }

      } */
      $resultado["data"] = $inspecciones_realizadas["data"];
    }


    // Registro en bitacora
      $bitacora = new Bitacora();
      $usuarioId= isset($_SESSION["id"])?$_SESSION["id"]:-1;
      $bitacora->setAttributes(["usuario_id"=>$usuarioId,"entidad"=>"inspecciones","accion"=>"inspeccionesInspector","lugar"=>"control-inspeccion"]);
      $result = $bitacora->guardar();
    retornarWebService( "", $resultado );

  }

  //Web service para actulizar el estatus de la inspección espera id y nuevo_estatus
  if ( $_POST["webService"] == "actualizarEstatus" )
  {
    $resultado["status"] = "200";
    $resultado["message"] = "OK";

    $resultado["data"] = array();

    $aux = new Utileria( );
    $_POST = $aux->limpiarEntrada( $_POST );
    if( !empty($_POST["id"]) )
    {
      $inspeccion = new Inspeccion();
      $inspeccion->setAttributes(array("id"=>$_POST["id"]));
      $res = $inspeccion->consultarId();
      if( $res["status"] == "200")
      {
        $temp = new Inspeccion();
        $temp->setAttributes(array("id"=>$_POST["id"],"estatus_inspeccion_id"=>$_POST["nuevo_estatus"]));
        $res_temp = $temp->guardar();
        if($res_temp["data"]["updated_at"] != null)
        {
          if( $_POST["nuevo_estatus"] == 5 )
          {
            $programa_id = $res["data"]["programa_id"];
            $programa_temp = new Programa();
            $res_temp = $programa_temp->consultarPor("programas",array("id"=>$programa_id),array("id","solicitud_id"));
            $res_temp = $res_temp["data"][0];
            $solicitud = new Solicitud();
            $solicitud->setAttributes(array("id"=>$res_temp["solicitud_id"],"estatus_solicitud_id"=>8));
            $solicitud->guardar();
            $estatus_solicitud = new SolicitudEstatus();
            $estatus_solicitud->setAttributes(array("solicitud_id"=>$res_temp["solicitud_id"],"estatus_solicitud_id"=>8));
            $estatus_solicitud->guardar();
            $resultado["data"] = "Ya se puede imprimir el acta de cierre, para ello entre al portal web";
            $estatus_solicitudInspeccion = new SolicitudEstatus();
            $res_estatusInspeccion = $estatus_solicitudInspeccion->consultarPor("solicitudes_estatus_solicitudes",array("solicitud_id"=>$res_temp["solicitud_id"],"estatus_solicitud_id"=>7),"*");
            $res_estatusInspeccion =   $res_estatusInspeccion["data"][0];
            //Actualizar estaus de la inspección.
            $tempEstatus = new SolicitudEstatus();
            $tempEstatus->setAttributes(array("id"=>$res_estatusInspeccion["id"],"comentario"=>"Su solicitud obtuvo un resultado favorable en la inspección física."));
            $tempEstatus->guardar();
            //Notificación apps
            $usuarioNotificar = new Solicitud();
            $usuarioNotificar->setAttributes(array("id"=>$res_temp["solicitud_id"]));
            $resUsuarioNotificar = $usuarioNotificar->consultarId();
            $resUsuarioNotificar = $resUsuarioNotificar["data"];
            $notificacion = new Usuario();
            $msj = "Su solicitud obtuvo un resultado favorable en la inspección física.";
            $notificacion->notificacionIdUsuario($resUsuarioNotificar["usuario_id"],"Inspección física",$msj);

          }else{
            $resultado["data"] = "Estatus actulizado";

          }
        }
      }
    }
    // Registro en bitacora
      $bitacora = new Bitacora();
      $usuarioId= isset($_SESSION["id"])?$_SESSION["id"]:-1;
      $bitacora->setAttributes(["usuario_id"=>$usuarioId,"entidad"=>"inspecciones","accion"=>"actulizarEstatus","lugar"=>"control-inspeccion"]);
      $result = $bitacora->guardar();
    retornarWebService( $_POST["url"], $resultado );

  }

  //Web service que tiene por lo menos una inspección
  if ( $_POST["webService"] == "inspecciones" )
  {
    $inspeccion = new Inspeccion();
    $inspecciones = $inspeccion->consultarTodos();
    $array_inspecciones = array();
    $resultado["status"] = "200";
    $resultado["message"] = "OK";
    $resultado["data"] = array();
    $aux = new Utileria( );
    $_POST = $aux->limpiarEntrada( $_POST );
    $objusuario = new Usuario();
    $objusuario->setAttributes(array("id"=>$_POST["usuario_id"]));
    $usuario = $objusuario->consultarId();
    if( $usuario["status"] == "200" )
    {
      if($usuario["data"]["rol_id"] == 3 )
      {
        $programa = new Programa();
        $solicitudes = $programa->consultarPor("instituciones",array("usuario_id"=>$_POST["usuario_id"]),array("id,nombre"));
        if( sizeof($solicitudes["data"])>0)
        {
          $tempInstitucion[0]["id"] = $solicitudes["data"][0]["id"];
          $tempInstitucion[0]["institucion"] = $solicitudes["data"][0]["nombre"];
          $resultado["data"]["instituciones"] = $tempInstitucion;
        }
      }
      if($usuario["data"]["rol_id"] == 2 ||  $usuario["data"]["rol_id"] > 7)
      {
        if (sizeof($inspecciones["data"]) > 0){
          foreach ($inspecciones["data"] as $posicion => $campos) {
            $programa = new Programa();
            $programa->setAttributes(array("id"=>$campos["programa_id"]));
            $res_programa = $programa->consultarId();
            if($res_programa["status"] != 404){
              $plantel = new Plantel();
              $res_plantel  = $plantel->consultarPor("planteles",array("id"=>$res_programa["data"]["plantel_id"],"deleted_at"),"*");
              if( sizeof($res_plantel["data"])>0 )
              {
                $id_institucion = $res_plantel["data"][0]["institucion_id"];
                $institucion = new Institucion();
                $res_institucion = $institucion->consultarPor("instituciones",array("id"=>$id_institucion,"deleted_at"),array("id","nombre"));
                if(sizeof($res_institucion["data"])>0)
                {
                  $res_institucion = $res_institucion["data"][0];
                  $temp["id"] = $res_institucion["id"];
                  $temp["institucion"] = $res_institucion["nombre"];
                  array_push($array_inspecciones,$temp);
                }
              }


            }
          }
          if(sizeof($array_inspecciones) > 0){
            //Agrupar por instituciones
            function arraySort($input,$sortkey){
              foreach ($input as $key => $val) {
                 $output[$val[$sortkey]][] = $val;
              }
              return $output;
            }
            $myArray = arraySort($array_inspecciones,'institucion_id');
            //Construir resultado
            $result = array();
            foreach ($myArray as $posicion => $campos) {
              $tempInst["id"] = $posicion;
              $tempInst["institucion"] = $campos[0]["institucion"];
              array_push($result,$tempInst);
            }
            $resultado["data"]["instituciones"] = $result;
          }
        }
      }
    }
    // Registro en bitacora
      $bitacora = new Bitacora();
      $usuarioId= isset($_SESSION["id"])?$_SESSION["id"]:-1;
      $bitacora->setAttributes(["usuario_id"=>$usuarioId,"entidad"=>"inspecciones","accion"=>"inspecciones","lugar"=>"control-inspeccion"]);
      $result = $bitacora->guardar();
    retornarWebService( $_POST["url"], $resultado );
  }

  //Web Service para obtener las inspecciones (APPS)
  if ( $_POST["webService"] == "inspeccionesInstitucion" )
  {
    $resultado["status"] = "200";
    $resultado["message"] = "OK";
    $resultado["data"] = array();

    $aux = new Utileria( );
    $_POST = $aux->limpiarEntrada( $_POST );
    //Consulta los planteles que pertenecen a la insitución
    $plantel = new Plantel();
    $planteles = $plantel->consultarPor("planteles", array("institucion_id" => $_POST["id"]), array("id,domicilio_id") );
    if( sizeof( $planteles["data"] ) > 0 ){
      $programas= array();
      foreach ($planteles["data"] as $posicion => $campo) {
        //Consultar los programas de estudios con los que cuenta cada plantel de la institución
        $programa = new Programa();
        $programas_temp = $programa->consultarPor("programas",array("plantel_id"=>$campo["id"],"deleted_at"),array("id,plantel_id"));
        if( sizeof($programas_temp["data"]) > 0){
          array_push($programas,$programas_temp["data"]);
        }
      }
      //Organizar los programas de estudios de los planteles en un solo arreglo para su facíl busqueda
      $programasFinal = array();
      for ($i=0; $i < sizeof($programas) ; $i++) {
        foreach ($programas[$i] as $key => $value) {
          array_push($programasFinal ,$value);
        }
      }
      $result = array();
      foreach ($programasFinal as $llave => $campos) {
        $inspeccion = new Inspeccion();
        $res_inspeccion = $inspeccion->consultarPor("inspecciones",array("programa_id"=>$campos["id"]),array("id,folio"));
        if( sizeof( $res_inspeccion["data"] ) > 0){
          array_push($result,$res_inspeccion["data"][0]);
        }
      }

      if( sizeof($result)>0){
        $resultado["data"]["inspecciones"] = $result;
      }
    }
    // Registro en bitacora
      $bitacora = new Bitacora();
      $usuarioId= isset($_SESSION["id"])?$_SESSION["id"]:-1;
      $bitacora->setAttributes(["usuario_id"=>$usuarioId,"entidad"=>"inspecciones","accion"=>"inspeccionesInstitucion","lugar"=>"control-inspeccion"]);
      $result = $bitacora->guardar();
    retornarWebService( $_POST["url"], $resultado );
  }

  //Web services que detalla una inspección realizada (APPS)
  if ( $_POST["webService"] == "detallesInspeccion" )
  {
    $inspeccion = new Inspeccion();
    $aux = new Utileria( );
    $_POST = $aux->limpiarEntrada( $_POST );
    $inspeccion->setAttributes(array("id"=>$_POST["id"]));
    $res_inspeccion = $inspeccion->consultarId();
    $resultado["status"] = "200";
    $resultado["message"] = "OK";

    $resultado["data"] = array();

    if( $res_inspeccion["status"] == "200" ){
        //Datos generales de la inspeccion
        $resultado["data"]["id"]= $res_inspeccion["data"]["id"];
        $resultado["data"]["folio"] = $res_inspeccion["data"]["folio"];
        $resultado["data"]["fecha_inspección"] = $res_inspeccion["data"]["fecha"];
        $inspector = new Inspector();
        $res_inspector = $inspector->consultarPor("inspectores",array("programa_id"=>$res_inspeccion["data"]["programa_id"]),"*");
        if( sizeof($res_inspector["data"]) > 0){
          $res_inspector = $res_inspector["data"][0];
          $datos_insp = new Persona();
          $datos_insp->setAttributes(array("id"=>$res_inspector["persona_id"]));
          $res_ins = $datos_insp->consultarId();
          $resultado["data"]["inspector"] =$res_ins["data"]["titulo_cargo"]." ".$res_ins["data"]["nombre"]." ".$res_ins["data"]["apellido_paterno"]." ". $res_ins["data"]["apellido_materno"];
        }
        //Obtener institucion
        $programa = new Programa();
        $programa->setAttributes(array("id"=>$res_inspeccion["data"]["programa_id"]));
        $res_programa = $programa->consultarId();
        if($res_programa["status"] == "200"){
          $plantel = new Plantel();
          $plantel->setAttributes(array("id"=>$res_programa["data"]["plantel_id"]));
          $res_plantel =$plantel->consultarId();
          $institucion = new Institucion();
          $institucion->setAttributes(array("id"=>$res_plantel["data"]["institucion_id"]));
          $res_institucion = $institucion->consultarId();
          $res_institucion = $res_institucion["data"];
           $resultado["data"]["institucion"] = $res_institucion["nombre"];
        }
    //Fabian de aquí en adelante
        //Obtener las preguntas con sus respuestas apartir del id de la inspección
        $respuestas = array();
        $respuestas_inspeccion = new Inspeccion();
        $res_respuestas = $respuestas_inspeccion->consultarPor("inspecciones_inspeccion_preguntas",array("inspeccion_id"=> $res_inspeccion["data"]["id"],"deleted_at"),array("inspeccion_pregunta_id","respuesta"));
        if( sizeof($res_respuestas["data"]) > 0 ){
          $res_respuestas = $res_respuestas["data"];
          foreach ($res_respuestas as $posicion => $campo) {
              $pregunta = new inspeccionPregunta();
              $pregunta->setAttributes(array("id" => $campo["inspeccion_pregunta_id"]));
              $res_pregunta = $pregunta->consultarId();
              $apartado = new InspeccionApartado();
              $apartado->setAttributes(array("id"=>$res_pregunta["data"]["id_inspeccion_apartado"]));
              $res_apartado = $apartado->consultarId();
              $temp["apartado"] = $res_apartado["data"]["nombre"];
              $temp["pregunta"] = $res_pregunta["data"]["pregunta"];
              $temp["respuesta"] = $campo["respuesta"];
              array_push($respuestas,$temp);
          }
          //Agrupar por apartados
          function arraySort($input,$sortkey){
            foreach ($input as $key => $val) {
               $output[$val[$sortkey]][] = $val;
            }
            return $output;
          }
          $myArray = arraySort($respuestas,'apartado');

          //Quita indices inecesarios y da el formato requerido
          $arrPreguntas = array();
          foreach ($myArray as $llave => $valor) {
              $res["apartado"] = $llave;
              $arrCampo = array();
              foreach ($valor as $key => $value) {
                $tempo["pregunta"] = $value["pregunta"];
                $tempo["respuesta"] = $value["respuesta"];
                array_push($arrCampo,$tempo);
              }
              $res["respuestas"]=$arrCampo ;
              array_push($arrPreguntas,$res);
          }

          //Agrega los campos del acta constitutiva
          $observacion = new InspeccionObservacion();
          $observaciones = $observacion->consultarPor("inspeccion_observaciones",array("inspeccion_id"=>$res_inspeccion["data"]["id"]),array("inspeccion_apartado_id","comentario"));
          if( sizeof($observaciones["data"]) > 0 ){
            foreach ($observaciones["data"] as $key => $value) {
              $apartado_observaciones = new InspeccionApartado();
              $apartado_observaciones->setAttributes(array("id"=>$value["inspeccion_apartado_id"]));
              $res_apar_obs = $apartado_observaciones->consultarId();
              $res_apar_obs = $res_apar_obs["data"];
              $tem_obser["apartado"] =  $res_apar_obs["nombre"];
              $tem_obser["respuestas"] = array();
              $otro["pregunta"] = "";
              $otro["respuesta"] = $value["comentario"];
              array_push($tem_obser["respuestas"],$otro);
              array_push($arrPreguntas,$tem_obser);
            }

          }
          $resultado["data"]["preguntas"] = $arrPreguntas;
        }
    }
    // Registro en bitacora
      $bitacora = new Bitacora();
      $usuarioId= isset($_SESSION["id"])?$_SESSION["id"]:-1;
      $bitacora->setAttributes(["usuario_id"=>$usuarioId,"entidad"=>"inspecciones","accion"=>"detallesInspeccion","lugar"=>"control-inspeccion"]);
      $result = $bitacora->guardar();
    retornarWebService( $_POST["url"], $resultado );

  }

  //Web service para guardar la inspección
  if( $_POST["webService"] == "guardarInspeccion")
  {

    $json = json_decode($_POST['datos'],true);
    $id_inspeccion = $json["inspeccion_id"];
    $respuestas = $json["preguntas"];
    $apartados = $json["apartados"];
    $resultado["status"] = "200";
    $resultado["message"] = "Inspección guardada";
    foreach ($respuestas as $posicion => $campos) {
      $respuesta = new InspeccionesPreguntas( );
      $obj_temp= new Inspeccion();
      $res_temp = $obj_temp->consultarPor("inspecciones_inspeccion_preguntas",array("inspeccion_id"=>$id_inspeccion,"inspeccion_pregunta_id"=>$campos["pregunta_id"]),"id");
      if( sizeof( $res_temp["data"] ) > 0 )
      {
        $id_respuesta =$res_temp["data"][0]["id"];
        $respuesta->setAttributes(array("id"=>$id_respuesta,"respuesta"=>$campos["respuesta"]));
      }else
      {
        $respuesta->setAttributes(array("id"=>null,"inspeccion_id"=>$id_inspeccion,"inspeccion_pregunta_id"=>$campos["pregunta_id"],"respuesta"=>$campos["respuesta"]));
      }
        $res_borrar = $respuesta->guardar();
        if( $res_borrar["data"]["id"] == 0 ){
          $apartados = null;
          break;
        }
    }
    if( $apartados === null)
    {
      $resultado["status"]="500";
      $resultado["message"] = "Error al intentar guardar la Inspección";
    }else
    {
      foreach ($apartados as $llave => $valores) {
          $temp_apartados = new InspeccionObservacion( );
          $obj_temp= new Inspeccion();
          $res_temp = $obj_temp->consultarPor("inspeccion_observaciones",array("inspeccion_id"=>$id_inspeccion,"inspeccion_apartado_id"=>$valores["apartado_id"]),"id");
          if( sizeof($res_temp["data"])>0)
          {
            $id = $res_temp["data"][0]["id"];
            $temp_apartados->setAttributes(array("id"=>$id,"comentario"=>$valores["comentario"]));
          }else
          {
            $temp_apartados->setAttributes(array("inspeccion_id"=>$id_inspeccion,"inspeccion_apartado_id"=>$valores["apartado_id"],"comentario"=>$valores["comentario"]));
          }
          $res_guardar = $temp_apartados->guardar();
          if( $res_guardar["data"]["id"] == 0 ){
            $resultado["status"]="500";
            $resultado["message"] = "Error al intentar guardar la Inspección";
            break;
          }
      }

    }

    // Registro en bitacora
      $bitacora = new Bitacora();
      $usuarioId= isset($_SESSION["id"])?$_SESSION["id"]:-1;
      $bitacora->setAttributes(["usuario_id"=>$usuarioId,"entidad"=>"inspecciones","accion"=>"guardarInspeccion","lugar"=>"control-inspeccion"]);
      $result = $bitacora->guardar();
    retornarWebService( $_POST["url"], $resultado );

  }

  //webService para obtener la inspecciones de un inspector
  if( $_POST["webService"] == "tablaInspecciones")
  {
    $aux = new Utileria( );
    $_POST = $aux->limpiarEntrada( $_POST );
    $inspeccion = new Inspeccion();
    if( $_POST["rol_id"] == 6 ){
      $programas_inspeccionados = $inspeccion->consultarPor("inspectores",array("persona_id"=>$_POST["persona_id"]),array("programa_id"));
    }else{
      $inspeccion = new Inspector();
      $programas_inspeccionados = $inspeccion->consultarTodos();
    }
      if( sizeof($programas_inspeccionados["data"]) > 0 )
      {
        $programas_inspeccionados = $programas_inspeccionados["data"];
        $inspecciones = array();
        foreach ($programas_inspeccionados as $posicion => $campos)
        {
          $inspeccion = new Inspeccion();
          $res_inspeccion= $inspeccion->consultarPor("inspecciones",array("programa_id"=>$campos["programa_id"]),array("id","estatus_inspeccion_id","fecha","fecha_asignada","folio"));
          $temp["folio"] = $res_inspeccion["data"][0]["folio"];
          $temp["fecha"] = $res_inspeccion["data"][0]["fecha"];
          $temp["asignacion"] = $res_inspeccion["data"][0]["fecha_asignada"];
          $id_estatus = $res_inspeccion["data"][0]["estatus_inspeccion_id"];
          $temp["id_estatus"] =$id_estatus;
          $borrar = new Inspeccion();
          $res_borrar = $borrar->consultarPor("estatus_inspeccion",array("id"=>$id_estatus),array("descripcion"));
          $temp["estatus"] = $res_borrar["data"][0]["descripcion"];
          $programa = new Programa();
          $programa->setAttributes(array("id"=>$campos["programa_id"]));
          $res_programa = $programa->consultarId();
          $temp["id_programa_educativo"] = $res_programa["data"]["id"];
          $temp["programa"] = $res_programa["data"]["nombre"];
          $temp["solicitud"] = $res_programa["data"]["solicitud_id"];
          $plantel = new Plantel();
          $plantel->setAttributes(array("id"=> $res_programa["data"]["plantel_id"]));
          $res_plantel = $plantel->informacionRelacionada();
          $temp["plantel"] = "#".$res_plantel["data"]["domicilio"]["numero_exterior"]. " ".$res_plantel["data"]["domicilio"]["calle"] ." colonia ".$res_plantel["data"]["domicilio"]["colonia"].", ".$res_plantel["data"]["domicilio"]["municipio"];
          $instituto = new Institucion();
          $instituto->setAttributes(array("id"=>$res_plantel["data"]["institucion_id"]));
          $res_instituto = $instituto->consultarId();
          $temp["id_institucion"] = $res_instituto["data"]["id"];
          $temp["institucion"] = $res_instituto["data"]["nombre"];
          array_push($inspecciones,$temp);
        }
        $tabla = "";
        if( sizeof($inspecciones)>0 )
        {
          foreach ($inspecciones as $registro => $campos) {
            $opciones_edicion = "";
            //Inspección lista para emitir acta de cierre
            if($campos["id_estatus"] == 5){
              // $opciones_edicion  = "<a tittle='Imprimir acta de cierre' href='oficios/acta-cierre.php?id=".$campos["solicitud"]."' ><span class='glyphicon glyphicon-print' ></span></a>";
              $opciones_edicion  = "<a tittle='Imprimir acta de cierre' href='#' onclick='Inspeccion.modalActaCierre(".$campos["solicitud"].")'><span class='glyphicon glyphicon-print' ></span></a>";
            }
            //Inspección para generar acta de inspección
            if($campos["id_estatus"] == 3 || $campos["id_estatus"] == 4 ){
              // $opciones_edicion  = "<a tittle='Imprimir acta de cierre' href='oficios/acta-cierre.php?id=".$campos["solicitud"]."' ><span class='glyphicon glyphicon-print' ></span></a>";
              $opciones_edicion  = "<a tittle='Imprimir acta de inspección' href='#' onclick='Inspeccion.modalActaInspeccion(".$campos["solicitud"].")'><span class='glyphicon glyphicon-print' ></span></a>";
            }
            $folio = isset($campos["folio"])?$campos["folio"]:"En proceso";
            $plan = isset($campos["programa"])?$campos["programa"]:"En proceso";
            $estatus = isset($campos["estatus"])?$campos["estatus"]:"";
            $plantel = isset($campos["plantel"])?$campos["plantel"]:"S/N";
            $institucion  = isset($campos["institucion"])?$campos["institucion"]:"";
            $fecha = isset($campos["fecha"])?$campos["fecha"]:"En proceso";
            if(isset($campos["asignacion"]))
            {

              $asignacion = new DateTime($campos["asignacion"]);
              $asignacion = date_format($asignacion, 'Y-m-d');
            }

            $tabla.='{
                  "folio":"'.$folio.'",
                  "programa":"'.$plan.'",
                  "estatus":"'.$estatus.'",
                  "fecha":"'.$fecha.'",
                  "asignacion":"'.$asignacion.'",
                  "plantel":"'.$plantel.'",
                  "institucion":"'.$institucion.'",
                  "acciones":"'.$opciones_edicion.'"
                },';
          }
        }
        // Registro en bitacora
          $bitacora = new Bitacora();
          $usuarioId= isset($_SESSION["id"])?$_SESSION["id"]:-1;
          $bitacora->setAttributes(["usuario_id"=>$usuarioId,"entidad"=>"inspecciones","accion"=>"tablaInspecciones","lugar"=>"control-inspeccion"]);
          $result = $bitacora->guardar();
        $tabla = substr($tabla,0, strlen($tabla) - 1);
        echo '{"data":['.$tabla.']}';

      }

  }

  //Web service para obtener todas las inspecciones e inspectores
  if($_POST["webService"]=="todasInspecciones")
  {
    $aux = new Utileria( );
    $tabla = "";
    $_POST = $aux->limpiarEntrada( $_POST );
    $inspeccion = new Inspeccion();
    $inspecciones = $inspeccion->consultarTodos();
    if(sizeof($inspecciones["data"])>0)
    {
      $datosInspecciones = [];
      $inspecciones = $inspecciones["data"];


      foreach ($inspecciones as $key => $value) {

        $estatus_inspeccion = new EstatusInspeccion();
        $estatus_inspeccion->setAttributes(array("id"=>$value["estatus_inspeccion_id"]));
        $res_estatus = $estatus_inspeccion->consultarId();
        $res_estatus = $res_estatus["data"];

        $programa = new Programa();
        $programa->setAttributes(array("id"=>$value["programa_id"]));
        $res_programa = $programa->informacionRelacionada(2);
        $res_programa = $res_programa["data"];

        $institucion = new Institucion();
        $institucion->setAttributes(array("id"=>$res_programa["plantel"]["institucion_id"]));
        $res_institucion = $institucion->consultarId();
        $res_institucion = $res_institucion["data"];

        $inspectorPrograma = new Inspector();
        $res_inspectorPrograma =   $inspectorPrograma->consultarPor("inspectores",array("programa_id"=>$value["programa_id"],"deleted_at"),"persona_id");
        $res_inspectorPrograma = $res_inspectorPrograma["data"][0];

        $persona = new Persona();
        $persona->setAttributes(array("id"=>$res_inspectorPrograma["persona_id"]));
        $res_persona = $persona->consultarId();
        $res_persona = $res_persona["data"];


        $temp["inspeccion"] = $value;
        $temp["estatus"] = $res_estatus;
        $temp["programa"] = $res_programa;
        $temp["institucion"] = $res_institucion;
        $temp["inspector"] = $res_persona;

        array_push($datosInspecciones,$temp);
      }
      if(sizeof($datosInspecciones)>0)
      {
          foreach ($datosInspecciones as $registro => $campos)
          {
            $opciones_edicion = "";
            if($campos["inspeccion"]["estatus_inspeccion_id"] == 5)
            {
              $opciones_edicion  = "<a tittle='Imprimir acta de cierre' href='#' ><span class='glyphicon glyphicon-print' ></span></a>";
            }
            $folio = isset($campos["inspeccion"]["folio"])?$campos["inspeccion"]["folio"]:"En proceso";
            $plan = isset($campos["programa"]["nombre"])?$campos["programa"]["nombre"]:"En proceso";
            $estatus = isset($campos["estatus"]["nombre"])?$campos["estatus"]["nombre"]:"";
            $fecha_inspeccion = $campos["inspeccion"]["fecha"];
            $fecha_asignacion = $campos["inspeccion"]["fecha_asignada"];
            $plantel = $campos["institucion"]["nombre"]." ".$campos["programa"]["plantel"]["domicilio"]["calle"]." #".$campos["programa"]["plantel"]["domicilio"]["numero_exterior"].",".$campos["programa"]["plantel"]["domicilio"]["municipio"];
            $inspector = $campos["inspector"]["nombre"]." ".$campos["inspector"]["apellido_paterno"]." ".$campos["inspector"]["apellido_materno"];
            $acciones = $opciones_edicion;
            $tabla.='{
                  "folio":"'.$folio.'",
                  "programa":"'.$plan.'",
                  "estatus":"'.$estatus.'",
                  "fecha":"'.$fecha_inspeccion.'",
                  "asignacion":"'.$fecha_asignacion.'",
                  "plantel":"'.$plantel.'",
                  "inspector":"'.$inspector.'",
                  "acciones":"'.$opciones_edicion.'"
                },';
          }
          $tabla = substr($tabla,0, strlen($tabla) - 1);
      }
    }
    echo '{"data":['.$tabla.']}';

  }

?>
