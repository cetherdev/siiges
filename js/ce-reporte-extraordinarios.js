const getAlumnosExtraordinarios = async (ciclo_escolar_id) => {
  try {
    return await $.ajax({
      type: 'POST',
      url: '../controllers/control-alumno.php',
      dataType: 'json',
      data: {
        webService: 'consultarAlumnosExtraordinarios',
        url: '',
        ciclo_escolar_id,
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
      { data: "clave_asignatura" }
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

document.addEventListener("DOMContentLoaded", async () => {
  try {
    const ciclo_escolar_id = document.getElementById('ciclo_escolar_id');
    const calificaciones = await getAlumnosExtraordinarios(ciclo_escolar_id.value);

    const totalExtraordinarios = document.getElementById('totalExtraordinarios');
    totalExtraordinarios.innerHTML = calificaciones.data.length;

    const tabla = await tableReport(calificaciones.data);
  } catch (error) {
    console.log(error);
  }

});