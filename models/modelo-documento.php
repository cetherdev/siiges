<?php
  /**
  * Clase que gestiona métodos de la tabla documentos
  */

  require_once "base-catalogo.php";

	define( "TABLA_DOCUMENTOS", "documentos" );

/*
id
archivo = path
nombre = nombre_documento
tipo_documento = id tipo documentos
entidad_id = id_tabla_pertenece
tipo_entidad = id_tabla
*/
  class Documento extends Catalogo
  {
    protected $id;
    protected $tipo_entidad;
    protected $entidad_id;
    protected $tipo_documento;
    protected $nombre;
    protected $archivo;
    public static $tipos_documentos= array (
      array('id'=>1,'nombre'=>'Acta constitutiva','formulario'=>'ratificacion_nombre','descripcion'=>'Documento que acredita al representante legal'),
      array('id'=>2,'nombre'=>'Ratificacion','formulario'=>'acta_constitutiva','descripcion'=>'Documento que acredita a la institución con un nombre autorizado emitido por alguna autridad'),
      array('id'=>3,'nombre'=>'Logotipo','formulario'=>'logotipo','descripcion'=>'Logotipo del plantel')
    );
    public static $tablas = array(1 =>'instituciones',2=>'ratificacion_nombres');

    public static $tipoEntidad = array("INSTITUCION"=>1,"RATIFICACION"=>2,"PERSONA"=>3,"REPRESENTANTE"=>4,"PROGRAMA"=>5,"TRAYECTORIA"=>6,"PLANTEL"=>7,"SOLICITUD"=>8, "EVALUACION"=>9);
    public static $nombresDocumentos = array("logotipo"=>1,
                                              "firma_representante"=>2,
                                              "estudio_pertinencia"=>3,
                                              "archivo_oferta_demanda"=>4,
                                              "convenios"=>5,
                                              "archivo_mapa_curricular"=>6,
                                              "archivo_reglas_academias"=>7,
                                              "archivo_asignaturas_detalle"=>8,
                                              "propuesta_hemerobibliografica"=>9,
                                              "archivo_informe_resultados_trayectoria_educativa"=>10,
                                              "archivo_instrumentos_trayectoria_educativa"=>11,
                                              "archivo_trayectoria_educativa"=>12,
                                              "biografia"=>13,
                                              "bibliografia"=>14,
                                              "identificacion_representante"=>15,
                                              "comprobante_pago"=>16,
                                              "acreditacion_inmueble"=>17,
                                              "fotografia_inmueble"=>18,
                                              "plano"=>19,
                                              "dictamenes"=>20,
                                              "constancia_infejal"=>21,
                                              "licencia_municipal"=>22,
                                              "secretaria_salud"=>23,
                                              "comprobante_telefono"=>24,
                                              "propuesta_calendario"=>25,
                                              "proyecto_vinculacion"=>26,
                                              "programa_superacion"=>27,
                                              "plan_mejora"=>28,
                                              "reglamento_institucional"=>29,
                                              "cct"=>30,
                                              "fotografia_persona"=>31,
                                              "propuesta_horario"=>32,
                                              "forma_migratoria"=>33,
                                              "acta_constitutiva"=>34,
                                              "acuerdo_anterior"=>35,
                                              "dictamen_evaluacion"=>36,
                                              "formato_pedagogico_01"=>37,
                                              "dictamen_impi"=>38,
                                              "formato_herramientas_05"=>39,
                                            );

    public static $dir_subida = '../uploads/';
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
      $resultado = parent::consultarTodosCatalogo( TABLA_DOCUMENTOS );
			return $resultado;
    }


		// Método para consultar registro por id
		public function consultarId( )
    {
      $resultado = parent::consultarIdCatalogo( TABLA_DOCUMENTOS );
			return $resultado;
    }


		// Método para guardar registro
		public function guardar( )
    {
			$resultado = parent::guardarCatalogo( TABLA_DOCUMENTOS );
			return $resultado;
    }


		// Método para eliminar registro
		public function eliminar( )
    {
			$resultado = parent::eliminarCatalogo( TABLA_DOCUMENTOS );
			return $resultado;
    }


  }
