<?php
  /**
  * Clase que gestiona métodos de la tabla solicitudes
  */

  require_once "base-catalogo.php";
  require_once "modelo-tipo-solicitud.php";
  require_once "modelo-institucion.php";

	define( "TABLA_SOLICITUD", "solicitudes" );

  class Solicitud extends Catalogo
  {
    protected $id;
    protected $tipo_solicitud_id;
    protected $usuario_id;
    protected $fecha;
    protected $estatus_solicitud_id;
    protected $cita;
    protected $fecha_recepcion;
    protected $folio;
    protected $convocatoria;

    const NUEVA = 1;

		// Constructor
		public function __construct( )
    {
      parent::__construct( );
    }


		// Función para asignar atributos de la clase
    public function setAttributes( $parametros = array( ) )
    {
      foreach( $parametros as $atributo=>$valor )
			{
        $this->{$atributo} = $valor;
      }
    }


		// Método para consultar todos los registros
    public function consultarTodos( )
    {
      $resultado = parent::consultarTodosCatalogo( TABLA_SOLICITUD );
			return $resultado;
    }


		// Método para consultar registro por id
		public function consultarId( )
    {
      $resultado = parent::consultarIdCatalogo( TABLA_SOLICITUD );
			return $resultado;
    }


		// Método para guardar registro
		public function guardar( )
    {
			$resultado = parent::guardarCatalogo( TABLA_SOLICITUD );
			return $resultado;
    }


		// Método para eliminar registro
		public function eliminar( )
    {
			$resultado = parent::eliminarCatalogo( TABLA_SOLICITUD );
			return $resultado;
    }

    // Método para consultar ultima cita
		public function consultarUltimaCita( )
    {
      $status = "200";
      $message = "OK";
      $consulta = "select * from ".TABLA_SOLICITUD." ORDER BY cita DESC";
      $sql = $this->mysqli->prepare( $consulta );

      if( $sql->execute( ) )
      {
        //$res = $sql->get_result( );
        $sql->close( );
        unset( $sql );
        $res = $this->mysqli->query($consulta);
        $max = $res->num_rows;

      }else{
        $status = $sql->errno;
        $message = $sql->error;
      }
      $resultado = [];
      if($max > 0){
        $res->data_seek( 0 );
        $solicitud = $res->fetch_object( );
        foreach( $res->fetch_fields( ) as $valor )
        {
          $this->{$valor->name} = $solicitud->{$valor->name};
          $resultado["{$valor->name}"] = $this->{$valor->name};
        }
        $res->close( );
        $this->mysqli->close( );
      }

      return array(
      "status"=>$status,
      "message"=>$message,
      "data"=>$resultado );
    }
    public static function convertirFecha($fecha){
      if($fecha) {
        $meses = array("Enero","Febrero","Marzo","Abril","Mayo","Junio","Julio","Agosto","Septiembre","Octubre","Noviembre","Diciembre");
        return date('d',strtotime($fecha))." de ".$meses[date('n',strtotime($fecha))-1]. " del ".date('Y', strtotime($fecha)) ;
      }
    }

    public function consultarFda02(){
      $status = "200";
      $message = "OK";
      $resultado = [];

      // Solicitud
      $solicitud = $this->consultarId();
      $solicitud = !empty($solicitud["data"])?$solicitud["data"]:false;
      if(!$solicitud){
        $status = "404";
        $message = "Solicitud no encontrada";
      }else{
          $resultado["solicitud"] = $solicitud;
          // Tipo de solicitud
          $tipoSolicitud = new TipoSolicitud();
          $tipoSolicitud->setAttributes(["id"=>$solicitud["tipo_solicitud_id"]]);
          $tipoSolicitud = $tipoSolicitud->consultarId();
          $tipoSolicitud = !empty($tipoSolicitud["data"])?$tipoSolicitud["data"]:false;
          if(!$tipoSolicitud){
            $status = "404";
            $message = "Tipo de soliciditud no encontrada";
          }else{
            $resultado["tipo_solicitud"] = $tipoSolicitud;
            // Institución
            $institucion = new Institucion();
            $institucion = $institucion->consultarPor("instituciones",["usuario_id"=>$solicitud["usuario_id"]],"*");
            $institucion = !empty($institucion["data"][0])?$institucion["data"][0]:false;
            if(!$institucion){
              $status = "404";
              $message = "Institución no encontrada";
            }else{
              $resultado["institucion"] = $institucion;
            }
          }
      }
      var_dump($resultado);exit();



      return [
              "status"=>$status,
              "message" => $message,
              "data"=>$resultado
            ];
    }
    public function rollbackSolicitud(){
      $res = $this->mysqli->query( "DELETE FROM solicitudes WHERE id = ".$this->id );

      return [
        "status" => $res?"200":"404",
        "message" => $res?"OK":"ERROR",
        "data" => $res
      ];
    }
  }
?>
