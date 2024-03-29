<?php
  /**
  * Clase que gestiona métodos de la tabla validaciones
  */

  require_once "base-catalogo.php";

	define( "TABLA_EQUIVALENCIAS", "equivalencias" );

  class Equivalencia extends Catalogo
  {
    protected $id;
    protected $alumno_id;
    protected $folio_expediente;
    protected $archivo_certificado_parcial;
    protected $archivo_resolucion;
    protected $folio_resolucion;
    protected $fecha_resolucion;

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
      $resultado = parent::consultarTodosCatalogo( TABLA_EQUIVALENCIAS );
			return $resultado;
    }


		// Método para consultar registro por id
		public function consultarId( )
    {
      $resultado = parent::consultarIdCatalogo( TABLA_EQUIVALENCIAS );
			return $resultado;
    }


		// Método para guardar registro
		public function guardar( )
    {
			$resultado = parent::guardarCatalogo( TABLA_EQUIVALENCIAS );
			return $resultado;
    }


		// Método para eliminar registro
		public function eliminar( )
    {
			$resultado = parent::eliminarCatalogo( TABLA_EQUIVALENCIAS );
			return $resultado;
    }


  }
?>
