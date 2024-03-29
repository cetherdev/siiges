<?php
  /**
  * Clase que gestiona métodos de la tabla validaciones
  */

  require_once "base-catalogo.php";

	define( "TABLA_VALIDACIONES", "validaciones" );

  class Validacion extends Catalogo
  {
    protected $id;
    protected $alumno_id;
    protected $usuario_id;
    protected $estado_id;
    protected $situacion_validacion_id;
    protected $tipo_validacion_id;
    protected $nivel_id;
    protected $folio;
    protected $fecha_expedicion;
    protected $nombre_institucion_emisora;
    protected $clave_centro_trabajo_emisor;
    protected $fecha_inicio_antecedente;
    protected $fecha_fin_antecedente;
    protected $cedula_profesional;
    protected $archivo_validacion;
    protected $fecha_validacion;
    
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
      $resultado = parent::consultarTodosCatalogo( TABLA_VALIDACIONES );
			return $resultado;
    }


		// Método para consultar registro por id
		public function consultarId( )
    {
      $resultado = parent::consultarIdCatalogo( TABLA_VALIDACIONES );
			return $resultado;
    }


		// Método para guardar registro
		public function guardar( )
    {
			$resultado = parent::guardarCatalogo( TABLA_VALIDACIONES );
			return $resultado;
    }


		// Método para eliminar registro
		public function eliminar( )
    {
			$resultado = parent::eliminarCatalogo( TABLA_VALIDACIONES );
			return $resultado;
    }


  }
?>
