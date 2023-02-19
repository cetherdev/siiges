<?php
  /**
  * Clase que gestiona métodos de la tabla personas
  */

  require_once "base-catalogo.php";

	define( "TABLA_PERSONAS", "personas" );

  class Persona extends Catalogo
  {
    protected $id;
    protected $domicilio_id;
    protected $nombre;
    protected $apellido_paterno;
    protected $apellido_materno;
    protected $fecha_nacimiento;
    protected $sexo;
    protected $nacionalidad;
    protected $correo;
    protected $correo_secundario;
    protected $telefono;
    protected $celular;
    protected $rfc;
    protected $curp;
    protected $ine;
    protected $titulo_cargo;
    protected $fotografia;

    CONST FOTO_DEFAULT = "uploads/fotos/img-usuario.png";

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
      $resultado = parent::consultarTodosCatalogo( TABLA_PERSONAS );
			return $resultado;
    }


		// Método para consultar registro por id
		public function consultarId( )
    {
      $resultado = parent::consultarIdCatalogo( TABLA_PERSONAS );
			return $resultado;
    }


		// Método para guardar registro
		public function guardar( )
    {
			$resultado = parent::guardarCatalogo( TABLA_PERSONAS );
			return $resultado;
    }


		// Método para eliminar registro
		public function eliminar( )
    {
			$resultado = parent::eliminarCatalogo( TABLA_PERSONAS );
			return $resultado;
    }


  }
?>
