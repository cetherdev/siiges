const Calificacion = {};
const getAlumnosExtraordinarios = async () => {
  try {
    return await $.ajax({
      type: 'POST',
      url: '../controllers/control-alumno.php',
      dataType: 'json',
      data: {
        webService: 'consultarAlumnosExtraordinarios',
        url: '',
        ciclo_escolar_id: 1189,
      }
    })

  } catch (error) {
    console.log(error);
  }
}

const tableReport = (alumnosExtraordinarios)=> {
  console.log(alumnosExtraordinarios);
  $("#extraordinarios").DataTable({
    bDeferRender: true,
    sPaginationType: "full_numbers",
    data: alumnosExtraordinarios,
    columns: [
      { data: "matricula" },
      { data: "nombre" },
      { data: "apellido_paterno" },
      { data: "apellido_materno" },
      { data: "grado" },
      { data: "asignatura_id" }
    ],
    oLanguage: {
      sProcessing: "Procesando...",
      sLengthMenu:
        "Mostrar <select>" +
        '<option value="5">5</option>' +
        '<option value="10">10</option>' +
        '<option value="20">20</option>' +
        '<option value="30">30</option>' +
        '<option value="40">40</option>' +
        '<option value="-1">All</option>' +
        "</select> registros",
      sZeroRecords: "No se encontraron resultados",
      sEmptyTable: "Ningún dato disponible en esta tabla",
      sInfo:
        "Mostrando del (_START_ al _END_) de un total de _TOTAL_ registros",
      sInfoEmpty: "Mostrando del 0 al 0 de un total de 0 registros",
      sInfoFiltered: "(filtrado de un total de _MAX_ registros)",
      sInfoPostFix: "",
      sSearch: "Filtrar:",
      sUrl: "",
      sInfoThousands: ",",
      sLoadingRecords: "Por favor espere - cargando...",
      oPaginate: {
        sFirst: "Primero",
        sLast: "Último",
        sNext: "Siguiente",
        sPrevious: "Anterior",
      },
      oAria: {
        sSortAscending:
          ": Activar para ordenar la columna de manera ascendente",
        sSortDescending:
          ": Activar para ordenar la columna de manera descendente",
      },
    },
  });
} 



Calificacion.getCalificacionPorCiclo = async function () {
  const programaId =  document.getElementById('programa_id'); 
  const programa = await getPrograma(programaId.value);

	Calificacion.calificacionPromesa = $.ajax({
		type: 'POST',
		url: '../controllers/control-calificacion.php',
		dataType: 'json',
		data: {
			webService: 'consultarCalificacionPorAlumno',
			url: '',
			alumno_id: $('#alumno_id').val(),
      calificacion_aprobatoria: programa.data.calificacion_aprobatoria
		},
		success: function (data) {

      const creditosObtenidos = document.getElementById('creditos_obtenidos')
      creditosObtenidos.innerHTML = `${data.totalCreditos} de ${programa.data.creditos}`;

      const calificaciones = data.calificacionCiclo;
      
      let todasCalificaciones = [];

      for (const ciclo_escolar in calificaciones) {

        if (Object.hasOwnProperty.call(calificaciones, ciclo_escolar)) {

          const materias_ciclo = calificaciones[ciclo_escolar];

          materias_ciclo.sort((a, b) => {
            return a.consecutivo - b.consecutivo;
          })
          todasCalificaciones = todasCalificaciones.concat(materias_ciclo);
        }
      }
		},
		error: function (respuesta, errmsg, err) {
			console.log(respuesta.status + ': ' + respuesta.responseText);
		},
	});
};

document.addEventListener("DOMContentLoaded", async () => {
  try {
    const calificaciones = await getAlumnosExtraordinarios();

    const tabla = await tableReport(calificaciones.data);
    console.log("Hello World!");
  } catch (error) {
    
  }

});