<?php
  /**
  * Clase que gestiona métodos de la tabla alumnos
  */

  require_once "base-catalogo.php";
  require_once "modelo-persona.php";
  require_once "modelo-calificacion.php";
  require_once "modelo-grupo.php";
  require_once "modelo-ciclo-escolar.php";

	define( "TABLA_ALUMNOS", "alumnos" );

  class Alumno extends Catalogo
  {
    protected $id;
    protected $persona_id;
    protected $tipo;
    protected $situacion_id;
    protected $programa_id;
    protected $tipo_tramite_id;
    protected $matricula;
    protected $adeudos_materias;
    protected $estatus;
    protected $descripcion_estatus;
    protected $archivo_certificado;
    protected $archivo_nacimiento;
    protected $archivo_curp;
    protected $estatus_certificado;
    protected $estatus_nacimiento;
    protected $estatus_curp;
    protected $observaciones1;
    protected $observaciones2;
    protected $fecha_baja;
    protected $observaciones_baja;
    protected $ciclo_escolar_id;

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
      $resultado = parent::consultarTodosCatalogo( TABLA_ALUMNOS );
			return $resultado;
    }


		// Método para consultar registro por id
		public function consultarId( )
    {
      $resultado = parent::consultarIdCatalogo( TABLA_ALUMNOS );
			return $resultado;
    }


		// Método para guardar registro
		public function guardar( )
    {
			$resultado = parent::guardarCatalogo( TABLA_ALUMNOS );
			return $resultado;
    }


		// Método para eliminar registro
		public function eliminar( )
    {
			$resultado = parent::eliminarCatalogo( TABLA_ALUMNOS );
			return $resultado;
    }

		// Método para consultar por matrícula
    public function consultarMatricula( )
    {
      $sql = "select * from " . TABLA_ALUMNOS . " where id!='$this->id' and programa_id='$this->programa_id' and matricula='$this->matricula' and deleted_at is null order by id";

			$resultado = parent::consultarSQLCatalogo( $sql );
			return $resultado;
    }

		// Método para consultar alumnos por programa
    public function consultarAlumnosPrograma( )
    {
      $sql = "select * from " . TABLA_ALUMNOS . " where programa_id='$this->programa_id' and deleted_at is null order by id";

			$resultado = parent::consultarSQLCatalogo( $sql );
			return $resultado;
    }

    //Método para consultar alumnos por programa y tramite de revalidación
    public function consultarAlumnosTramite( )
    {
      $sql = "select * from " . TABLA_ALUMNOS . " where programa_id='$this->programa_id' and tipo_tramite_id > 0 and deleted_at is null order by id";

			$resultado = parent::consultarSQLCatalogo( $sql );
			return $resultado;
    }

      // Método para consultar alumnos con extraordinatios por ciclo
      public function consultarAlumnosExtraordinarios( )
      {
    //"select * from " . TABLA_CALIFICACIONES . " where tipo='$this->tipo' and deleted_at is null order by id";
    $sql = " SELECT extraordinarios.calificacion calificacion,
        extraordinarios.tipo tipo,
        extraordinarios.alumno_id alumno_id,
        extraordinarios.asignatura_id asignatura_id,
        grupos.grado grado,
        ciclos_escolares.id ciclo_escolar_id,
        ciclos_escolares.nombre ciclo_escolar,
        ciclos_escolares.programa_id programa_id,
        alumnos.matricula matricula,
        alumnos.persona_id persona_id,
        personas.nombre nombre,
        personas.apellido_paterno apellido_paterno,
        personas.apellido_materno apellido_materno
        FROM " . TABLA_CALIFICACIONES . " extraordinarios

        LEFT JOIN " . TABLA_GRUPOS . "
        ON extraordinarios.grupo_id = grupos.id

        LEFT JOIN " . TABLA_CICLOS_ESCOLARES . "
        ON grupos.ciclo_escolar_id = ciclos_escolares.id

        LEFT JOIN " . TABLA_ALUMNOS . " ON extraordinarios.alumno_id = alumnos.id

        LEFT JOIN " . TABLA_PERSONAS . " ON alumnos.persona_id = personas.id

        WHERE extraordinarios.tipo = 2
        AND extraordinarios.calificacion REGEXP '^[0-9]+\\.?[0-9]*$'
        AND ciclos_escolares.id = '$this->ciclo_escolar_id'
        AND extraordinarios.deleted_at is null
        AND alumnos.deleted_at is null";

        $resultado = parent::consultarSQLCatalogo( $sql );
        return $resultado;
      }
  }
?>
