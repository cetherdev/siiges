var Solicitudes = {};
var tabla;
//Obtener las solicitudes
Solicitudes.getSolicitudes = function () {
  $.ajax({
    type: "post",
    url: "../controllers/control-solicitud.php",
    dataType: "json",
    data: {
      webService: "solicitudes",
      url: "",
    },
    success: function (dataSet) {
      tabla = $("#solicitudes").DataTable({
        bDeferRender: true,
        sPaginationType: "full_numbers",
        order: [[2, "asc"]],
        data: dataSet,
        columns: [
          { data: "folio" },
          { data: "programa_estudio" },
          { data: "estatus" },
          { data: "plantel" },
          { data: "institucion" },
          { data: "acciones" },
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
    },
    error: function (respuesta, errmsg, err) {
      console.log(respuesta);
    },
  });
};

//Obtener los niveles educativos
Solicitudes.getNiveles = function () {
  Solicitudes.nivelesPromesa = $.ajax({
    type: "POST",
    url: "../controllers/control-nivel.php",
    dataType: "json",
    data: { webService: "consultarTodos", url: "" },
    success: function (respuesta) {
      var nivelPrograma = $("#nivel_id");
      for (var i = 0; i < respuesta.data.length - 1; i++) {
        if (i > 0) {
          nivelPrograma.append(
            '<option value ="' +
              respuesta.data[i].id +
              '">' +
              respuesta.data[i].descripcion +
              "</option>"
          );
        }
      }
    },
    error: function (respuesta, errmsg, err) {
      console.log(respuesta);
    },
  });
};
//Obtener las modaliades de los programas
Solicitudes.getModalidades = function () {
  Solicitudes.modalidadesPromesa = $.ajax({
    type: "POST",
    url: "../controllers/control-modalidad.php",
    dataType: "json",
    data: { webService: "consultarTodos", url: "" },
    success: function (respuesta) {
      var modalidadPrograma = $("#modalidad_id");
      for (var i = 0; i < respuesta.data.length; i++) {
        modalidadPrograma.append(
          '<option value ="' +
            respuesta.data[i].id +
            '">' +
            respuesta.data[i].nombre +
            "</option>"
        );
      }
    },
    error: function (respuesta, errmsg, err) {
      console.log(respuesta);
    },
  });
};
//Obtener los turnos en los que se imparte un programa
Solicitudes.getTurnos = function () {
  Solicitudes.turnosPromesa = $.ajax({
    type: "POST",
    url: "../controllers/control-turno.php",
    dataType: "json",
    data: { webService: "consultarTodos", url: "" },
    success: function (respuesta) {
      var turnoPrograma = $("#turno_programa");
      for (var i = 0; i < respuesta.data.length; i++) {
        turnoPrograma.append(
          '<option value ="' +
            respuesta.data[i].id +
            '">' +
            respuesta.data[i].nombre +
            "</option>"
        );
      }
      turnoPrograma.selectpicker("refresh");
    },
    error: function (respuesta, errmsg, err) {
      console.log(respuesta);
    },
  });
};
//Obtener los tipos de solictudes que existen
Solicitudes.getTipos = function () {
  Solicitudes.tiposPromesa = $.ajax({
    type: "POST",
    url: "../controllers/control-tipo-solicitud.php",
    dataType: "json",
    data: { webService: "consultarTodos", url: "" },
    success: function (respuesta) {
      var select = $("#tipo_solicitud");
      $.each(respuesta.data, function (key, registro) {
        select.append(
          "<option value=" + registro.id + ">" + registro.nombre + "</option>"
        );
      });
    },
    fail: function (jqXHR, textStatus, errorThrown) {
      if (jqXHR.status === 0) {
        alert("Not connect: Verify Network.");
      } else if (jqXHR.status == 404) {
        alert("Requested page not found [404]");
      } else if (jqXHR.status == 500) {
        alert("Internal Server Error [500].");
      } else if (textStatus === "parsererror") {
        alert("Requested JSON parse failed.");
      } else if (textStatus === "timeout") {
        alert("Time out error.");
      } else if (textStatus === "abort") {
        alert("Ajax request aborted.");
      } else {
        alert("Uncaught Error: " + jqXHR.responseText);
      }
    },
  });
};

Solicitudes.tiposControl = {
  1: { dictamenId: "DictamenRVOE", acuerdoId: "AcuerdoRVOE" },
  2: {
    acuerdoId: "RefrendoRVOE",
  },
  3: {
    acuerdoId: "AcuerdoCambioDomicilio",
  },
  4: {
    acuerdoId: "AcuerdoCambioRepresentanteLegal",
  },
};

Solicitudes.ESTATUS = {
  ENTREGA_DOCUMENTOS: 3,
  INSPECCION: 7,
  CIMPRESION: 9,
  EVALUACION: 5,
  REVISION: 8,
  RECHAZADA: 100,
};
//Obtener los detalles de la solicitud
Solicitudes.getDetalles = function () {
  Solicitudes.promesaDetalles = $.ajax({
    type: "POST",
    url: "../controllers/control-solicitud.php",
    dataType: "json",
    data: {
      webService: "detallesSolicitud",
      url: "",
      id: $("#id_solicitud").val(),
    },
    success: function (respuesta) {
      if (respuesta.data != "") {
        respuesta = respuesta.data;
        const solicitud = respuesta.solicitud;
        //Comprobamos que tenga formato correcto
        const convocatoria = Number(solicitud.convocatoria);

        const fdp02 = document.getElementById("fdp02");
        if (fdp02) {
          fdp02.setAttribute("href", `formatos/fdp02.php?id=${solicitud.id}`);
          fdp02.innerHTML = "FDP 02";
        }

        if (convocatoria < 2020 || convocatoria == 0) {
          const fda02 = document.getElementById("fda02");
          const fda04 = document.getElementById("fda04");
          const fda05 = document.getElementById("fda05");
          const fda06 = document.getElementById("fda06");
          const fdp08 = document.getElementById("fdp08");

          fda02.setAttribute("href", `formatos/fda02.php?id=${solicitud.id}`);
          fda02.innerHTML = "FDA 02";

          fda04.setAttribute("href", `formatos/fda04.php?id=${solicitud.id}`);
          fda04.innerHTML = "FDA 04";

          fda05.setAttribute("href", `formatos/fda05.php?id=${solicitud.id}`);
          fda05.innerHTML = "FDA 05";

          fda06.setAttribute("href", `formatos/fda06.php?id=${solicitud.id}`);
          fda06.innerHTML = "FDA 06";

          if (fdp08) {
            fdp08.setAttribute("href", `formatos/fdp08.php?id=${solicitud.id}`);
            fdp08.innerHTML = "FDP 08";
          }

          console.log("Migacion");
        } else {
          const fda02 = document.getElementById("fda02");
          const fda04 = document.getElementById("fda04");
          const fda05 = document.getElementById("fda05");
          const fda06 = document.getElementById("fda06");
          const fda06Checkbox = document.getElementById("fda06Checkbox");
          const fdp08 = document.getElementById("fdp08");

          fda02.setAttribute(
            "href",
            `formatos/fda02-2020.php?id=${solicitud.id}`
          );
          fda02.innerHTML = "FDA 02";

          fda04.setAttribute(
            "href",
            `formatos/fda04-2020.php?id=${solicitud.id}`
          );
          fda04.innerHTML = "FDA 04";

          fda05.setAttribute(
            "href",
            `formatos/fda05-2020.php?id=${solicitud.id}`
          );
          fda05.innerHTML = "FDA 05";

          fda06.remove();
          if (fda06Checkbox) {
            fda06Checkbox.remove();
          }

          console.log("Convocatoria actual");
        }

        if (solicitud != undefined) {
          $("#tipo_solicitud").val(solicitud.tipo);
          if (solicitud.fecha_recepcion) {
            $("#fecha_recepcion_documentacion").val(
              solicitud.fecha_recepcion.substring(0, 10)
            );
          }

          $("#folio").val(solicitud.folio);

          if (
            solicitud.estatus > Solicitudes.ESTATUS.ENTREGA_DOCUMENTOS &&
            solicitud.estatus != Solicitudes.ESTATUS.RECHAZADA &&
            solicitud.estatus != 200
          ) {
            $("#Admisorio").show();
          } else {
            $("#Admisorio").hide();
          }

          if (
            solicitud.estatus >= Solicitudes.ESTATUS.INSPECCION &&
            solicitud.estatus != Solicitudes.ESTATUS.RECHAZADA &&
            solicitud.estatus != 200
          ) {
            $("#OrdenInspección").show();
          } else {
            $("#OrdenInspección").hide();
          }

          /* if (
            solicitud.estatus >= Solicitudes.ESTATUS.CIMPRESION &&
            solicitud.estatus != Solicitudes.ESTATUS.RECHAZADA &&
            solicitud.estatus != 200
          ) {
            console.log(solicitud.estatus);
            $("#Notificacion").show();
            $("#" + Solicitudes.tiposControl[solicitud.tipo].acuerdoId).show();
          } else {
            $("#Notificacion").hide();
            $("#" + Solicitudes.tiposControl[solicitud.tipo].acuerdoId).hide();
          } */
          if (
            solicitud.estatus >= Solicitudes.ESTATUS.REVISION &&
            solicitud.estatus != Solicitudes.ESTATUS.RECHAZADA &&
            solicitud.estatus != 200
          ) {
            $("#ActaDeInspeccion").show();
            $("#ActaDeCierre").show();
            $("#Desistimiento").show();
            $("#" + Solicitudes.tiposControl[solicitud.tipo].acuerdoId).show();
          } else {
            $("#ActaDeInspeccion").hide();
            $("#ActaDeCierre").hide();
            $("#Desistimiento").hide();
            $("#" + Solicitudes.tiposControl[solicitud.tipo].acuerdoId).hide();
          }
          if (
            solicitud.estatus >= Solicitudes.ESTATUS.EVALUACION &&
            solicitud.estatus != Solicitudes.ESTATUS.RECHAZADA
          ) {
            $("#CartaAceptacion").show();
            $("#CartaAsignacion").show();
            $("#CartaImpCon").show();
            $("#OficioTurnarCIFRHS").show();
          } else {
            $("#CartaAceptacion").hide();
            $("#CartaAsignacion").hide();
            $("#CartaImpCon").hide();
            $("#OficioTurnarCIFRHS").hide();
          }
          if (respuesta.institucion.es_nombre_autorizado == 1) {
            $("#fda03").on("click", function (e) {
              e.preventDefault();
              Solicitudes.mostrarMensaje(
                "error",
                "La institución tiene nombre autorizado"
              );
            });
            $("#fda03").attr("checked", true);
            $("#fda03l").on("click", function (e) {
              e.preventDefault();
              Solicitudes.mostrarMensaje(
                "error",
                "La institución tiene nombre autorizado"
              );
            });
          }
        }
        var programa = respuesta.programa;
        if (programa != undefined) {
          if (programa.rvoe == "") {
            $("#rvoe").val("En proceso");
          } else {
            $("#rvoe").val(programa.rvoe);
          }

          $("#nivel_id").val(programa.nivel);
          $("#nombre_programa").val(programa.nombre);
          $("#modalidad_id").val(programa.modalidad);
          $("#ciclo_id").val(programa.ciclo);
        }

        var turnos = respuesta.turno;
        if (turnos != undefined) {
          var opcionesTurnos = [];
          for (var m = 0; m < turnos.length; m++) {
            opcionesTurnos.push(turnos[m].turno_id);
          }
          $("#turno_programa").val(opcionesTurnos).selectpicker("refresh");
        }

        var plantel = respuesta.plantel;
        if (plantel != undefined) {
          $("#cct").val(plantel.cct);
        }

        var domicilio = respuesta.domicilio;
        if (domicilio != undefined) {
          $("#calle").val(domicilio.calle);
          $("#numero").val(domicilio.numero_exterior);
          $("#interior").val(domicilio.numero_interior);
          $("#colonia").val(domicilio.colonia);
          $("#cp").val(domicilio.codigo_postal);
          $("#municipio").val(domicilio.municipio);
        }

        var institucion = respuesta.institucion;
        if (institucion != undefined) {
          $("#institucion_nombre").val(institucion.nombre);
          $("#alta_institucion").val(institucion.created_at.substr(0, 10));
        }

        var representante = respuesta.representante;
        if (representante != undefined) {
          $("#nombre_representante").val(
            representante.nombre +
              " " +
              representante.apellido_paterno +
              " " +
              representante.apellido_materno
          );
          $("#email_representante").val(representante.correo);
          $("#celular_representante").val(representante.celular);
        }

        var avances = respuesta.avance;
        if (avances != undefined) {
          var por;
          var tam = avances.length;
          var ultimo = avances[tam - 1].estatus_solicitud_id;
          if (ultimo > 99) {
            ultimo = avances[tam - 2].estatus_solicitud_id;
            if (ultimo < 11) {
              por = ultimo * 9;
              $("#barra-porcentaje").attr("style", "width:" + por + "%");
              $("#porcentaje-progreso").html(por + "%");
            }
          } else {
            if (ultimo == 11) {
              por = 100;
              $("#barra-porcentaje").attr("style", "width:" + por + "%");
              $("#porcentaje-progreso").html(por + "%");
            } else {
              por = ultimo * 9;
              $("#barra-porcentaje").attr("style", "width:" + por + "%");
              $("#porcentaje-progreso").html(por + "%");
            }
          }
          var observaciones = "";
          for (var i = 0; i < avances.length; i++) {
            if (avances[i].comentario != null) {
              observaciones =
                observaciones +
                avances[i].detalles.nombre +
                ": " +
                avances[i].comentario +
                "\n";
            }
            // Se inhabilita hasta que este lista toda migracion en siiges
            /* if (avances[i].estatus_solicitud_id == 3) {
              observaciones =
                observaciones +
                "USTED DEBE DE ENTREGAR LOS DOCUMENTOS (FDA01 al FDA06) ASÍ COMO EL COMPROBANTE DE PAGO ORIGINAL, EL DOCUMENTO DE INFEJAL Y PROTECCIÓN CIVIL EL DÍA:  " +
                solicitud.cita +
                "\n";
            } */
            // if(avances[i].estatus_solicitud_id == 200 || avances[i].estatus_solicitud_id == 100){
            //     observaciones =  observaciones + avances[i].comentario +"\n";
            // }
          }

          if (observaciones.length > 0) {
            $("#observaciones").val(observaciones);
          }
        }
      }
    },
    error: function (respuesta, errmsg, err) {
      console.log(respuesta.status + ": " + respuesta.responseText);
    },
  });
};
//Obtener los comentarios de la revisión
Solicitudes.getComentariosRevision = function () {
  Solicitudes.comentariosRevisionPromesa = $.ajax({
    type: "POST",
    url: "../controllers/control-solicitud-estatus.php",
    dataType: "json",
    data: { webService: "estatus", url: "", id: $("#idSolicitud").val() },
    success: function (respuesta) {
      if (respuesta.length > 0) {
        var comentarios = respuesta[0];
        $("#comentarios").val(comentarios.comentario);
      }
    },
    error: function (respuesta, errmsg, err) {
      console.log(respuesta);
    },
  });
};
//Oculta mensaje al dar click sobre el mismo
Solicitudes.ocultarMensaje = function () {
  $("#mensaje")
    .removeClass("alert alert-danger")
    .removeClass("alert alert-success")
    .hide();
};
//Muestra el mensaje correspondiene
Solicitudes.mostrarMensaje = function (tipo, texto) {
  var mensaje = $("#mensaje");
  if ("success" == tipo)
    mensaje
      .removeClass("alert alert-danger")
      .addClass("alert alert-success")
      .show();
  else if ("error" == tipo)
    mensaje
      .removeClass("alert alert-success")
      .addClass("alert alert-danger")
      .show();

  mensaje.html(texto);
  $("html, body").animate({ scrollTop: 0 }, "slow");
};
//Guardar cambios de la revisión
Solicitudes.guardarComentarios = function (opcion) {
  $("#opcion-comentarios").val(opcion);
  if (opcion == 2) {
    if ($("#terminarRevision").val() == "") {
      Solicitud.mostrarMensaje(
        "error",
        "Para poder terminar la resivisión debe de responder ¿El llenado es correcto?"
      );
      $("#terminarRevision").focus();
    } else {
      //console.log("Form comentarios");
      $("#form-comentarios").submit();
    }
  } else {
    //console.log("Form comentarios");
    $("#form-comentarios").submit();
  }
};
//Guardar revisión de documentación
Solicitudes.revisarDocumentacion = function () {
  $("#modalMensaje").modal();
  $("#tamanoModalMensaje").attr("style", "margin-top:20px;");
  var mensajes = $("#mensajeDocumentacion");

  // En convocatoria 2020 no se recibe el archivo fda06
  let inputs = document.getElementsByTagName("input");
  inputs = [...inputs];
  let checkboxes = inputs.filter(
    (input) => input.type.toLowerCase() == "checkbox"
  );
  let i;
  for (let checkbox of checkboxes) {
    if (checkbox.checked == true) {
      i = 1;
    } else {
      //Checkboxes incompletos
      i = 0;
      break;
    }
  }

  if (i == 1) {
    mensajes.removeClass("alert alert-danger");
    mensajes.addClass("alert alert-info");
    mensajes.html(
      "<p class='text-left'><strong>¿La documentación fue recibida?</strong></p>"
    );

    const cuerpo = $("#cuerpoModal");

    const child = document.createElement("div");
    child.innerHTML = `<div class="col-sm-12 col-md-12">
    <label class="control-label" for="">Ingresar la fecha de recepción de la solicitud</label><br>
    <input type="date" id="fecha_recepcion_modal" class="form-control">
    <br></div>`;

    cuerpo.append(child);

    var boton = $("<button/>", {
      id: "boton_si",
      type: "button",
      class: "btn btn-primary",
      text: "SI",
      onclick: "Solicitudes.completarCotejamiento()",
    });
    let btnConfirmar = document.getElementById("boton_si");
    if (btnConfirmar == null) {
      $("#mensaje-footer").append(boton);
    }
  } else if (i == 0) {
    mensajes.removeClass("alert alert-info");
    mensajes.addClass("alert alert-danger");
    mensajes.html(
      "<p class='text-left'><strong>Toda la documentación debe de ser recibida.</strong></p>"
    );
  }
};
//Confirmar revisión de documentacion
Solicitudes.completarCotejamiento = function () {
  if ($("#fecha_recepcion_modal").val() != "") {
    const fecha_recepcion_modal = $("#fecha_recepcion_modal").val();
    $("#fecha_recepcion").val(fecha_recepcion_modal);

    let btnConfirmar = document.getElementById("boton_si");
    btnConfirmar.classList.remove("active");
    btnConfirmar.classList.add("disabled");
    btnConfirmar.setAttribute("disabled", "");

    $("#form-cotejamiento").submit();
  } else {
    $("#fecha_recepcion_modal").focus();
  }
};
//Entregar rvoe
Solicitudes.recogerRVOE = function (obj) {
  Solicitudes.entregar = obj;
  $("#modalEntregarRVOE").modal();
  $("#messageRVOE").html(obj.programa);
};
Solicitudes.entregarRVOE = function () {
  $.ajax({
    type: "POST",
    url: "../controllers/control-solicitud.php",
    dataType: "json",
    data: {
      webService: "entregarRVOE",
      solicitud_id: Solicitudes.entregar.solicitud,
      comentarios: $("#mensajeFinal").val(),
    },
    success: function (respuesta) {
      location.reload();
      //tabla.ajax.reload();
    },
    error: function (respuesta, errmsg, err) {
      console.log(respuesta.status + ": " + respuesta.responseText);
    },
  });
};
//Eliminar solicitud (cambiar a estatus 100)
Solicitudes.modalEliminar = function (obj) {
  Solicitudes.eliminar = obj;
  $("#modalEliminar").modal();
  $("#mensajeEliminacion").html(obj.folio);
};
Solicitudes.eliminarSolicitud = function () {
  if ($("#motivoEliminacion").val() != "") {
    $.ajax({
      type: "POST",
      url: "../controllers/control-solicitud.php",
      dataType: "json",
      data: {
        webService: "eliminarSolicitud",
        solicitud_id: Solicitudes.eliminar.solicitud,
        comentarios: $("#motivoEliminacion").val(),
      },
      success: function (respuesta) {},
      error: function (respuesta, errmsg, err) {
        console.log(respuesta.status + ": " + respuesta.responseText);
      },
    });
    location.reload();
    //tabla.ajax.reload();
  }
};

//Cargar
$(document).ready(function ($) {
  $("#mensaje").on("click", Solicitudes.ocultarMensaje);
  if ($("#opcion").val() == 1) {
    Solicitudes.getSolicitudes();
  }
  if ($("#opcion").val() == 2) {
    Solicitudes.getNiveles();
    Solicitudes.getModalidades();
    Solicitudes.getTurnos();
    Solicitudes.getTipos();
    $.when(
      Solicitudes.nivelesPromesa,
      Solicitudes.modalidadesPromesa,
      Solicitudes.turnosPromesa,
      Solicitudes.tiposPromesa
    )
      .then(function () {
        console.log(" Promesas completadas para alta solicitud");
      })
      .done(function () {
        console.log("Todo listo para cargar la informacion necesaria");
        Solicitudes.getDetalles();
        Solicitudes.promesaDetalles.done(function () {
          document.getElementById("cargando").style.display = "none";
        });
      })
      .fail(function () {
        console.log("Pero algo fallo");
      });
  }

  //Cargar los comentarios de la solicitud
  if ($("#auxRol").val() == 7) {
    console.log("debe aparecer la caja de comentarios");
    Solicitudes.getComentariosRevision();
    Solicitudes.comentariosRevisionPromesa.done(function () {
      document.getElementById("apartado-comentarios").style.display = "block";
    });
  }
});
