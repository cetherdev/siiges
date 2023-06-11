<?php
  /**
  * Clase que gestiona métodos de la tabla inspectores
  */

  require_once "base-catalogo.php";
  require_once "modelo-inspector.php";
  require_once "modelo-persona.php";
  require_once "modelo-domicilio.php";
  require_once "modelo-programa.php";
  require_once "modelo-plantel.php";
  require_once "modelo-institucion.php";


	define( "TABLA_INSPECTORES", "inspectores" );

  class Inspector extends Catalogo
  {
    protected $id;
    protected $persona_id;
    protected $programa_id;

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
      $resultado = parent::consultarTodosCatalogo( TABLA_INSPECTORES );
			return $resultado;
    }


		// Método para consultar registro por id
		public function consultarId( )
    {
      $resultado = parent::consultarIdCatalogo( TABLA_INSPECTORES );
			return $resultado;
    }


		// Método para guardar registro
		public function guardar( )
    {
			$resultado = parent::guardarCatalogo( TABLA_INSPECTORES );
			return $resultado;
    }


		// Método para eliminar registro
		public function eliminar( )
    {
			$resultado = parent::eliminarCatalogo( TABLA_INSPECTORES );
			return $resultado;
    }

    // Método para consultar inspecciones por inspector
    public function consultarInspeccionesInspector( )
    {
      $sql = "SELECT 
          inspectores.persona_id persona_id,
          inspecciones.id id_inspeccion,
          inspecciones.estatus_inspeccion_id estatus_inspeccion,
          inspecciones.fecha fecha_inspeccion,
          inspecciones.fecha_asignada fecha_realizar,
          inspecciones.folio folio_inspeccion,
          programas.id id_programa_educativo,
          programas.nombre nombre_programa_educativo,
          CONCAT('#',domicilios.numero_exterior, ' ', domicilios.calle, ' colonia ', domicilios.colonia, ', ', domicilios.municipio) plantel,
          domicilios.calle calle,
          domicilios.colonia colonia,
          domicilios.municipio municipio,
          instituciones.id id_institucion,
          instituciones.nombre nombre_institucion,
          personas.nombre nombre,
          personas.apellido_paterno apellido_paterno,
          personas.apellido_materno apellido_materno
  
          FROM " . TABLA_INSPECCIONES . "          
          LEFT JOIN " . TABLA_INSPECTORES . "
          ON inspectores.programa_id = inspecciones.programa_id
  
          LEFT JOIN " . TABLA_PROGRAMAS . "
          ON inspecciones.programa_id = programas.id
          
          LEFT JOIN " . TABLA_PLANTELES . "
          ON programas.plantel_id = planteles.id
          
          LEFT JOIN " . TABLA_DOMICILIOS . "
          ON domicilios.id = planteles.domicilio_id
          
          LEFT JOIN " . TABLA_INSTITUCIONES . "
          ON instituciones.id = planteles.institucion_id
  
          LEFT JOIN " . TABLA_PERSONAS . "
          ON inspectores.persona_id = personas.id
  
          WHERE inspectores.persona_id = '$this->persona_id'
          AND inspecciones.estatus_inspeccion_id != 5";
          $resultado = parent::consultarSQLCatalogo( $sql );
          return $resultado;
    }
  }
?>
