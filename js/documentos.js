var Documento = {};

Documento.ocultarMensaje = function () {
  $("#mensaje")
    .removeClass("alert alert-danger")
    .removeClass("alert alert-success")
    .hide();
};

Documento.mostrarMensaje = function (tipo, texto) {
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

Documento.getFormatos = function () {
  var entidadId = $("#id_solicitud").val();
  var tipoEntidad = 5; // PROGRAMA
  var tipoDocumentoFDP03 = 8; // 8 -> FDP03
  var tipoDocumentoFDP04 = 9; //  9 -> FDP04
  var tipoDocumentoFDA05 = 39;

  var ajaxPath = "../controllers/control-documento.php";
  var datos = {};
  datos.webService = "consultarFormato";
  datos.url = "";
  datos.tipo_entidad = tipoEntidad;
  datos.solicitud_id = entidadId;
  datos.tipo_documento = tipoDocumentoFDP03;

  $.ajax({
    type: "POST",
    url: ajaxPath,
    data: datos,
    dataType: "json",
    success: function (response) {
      if ($.isArray(response.data) && !response.data.length > 0) {
        console.log(response.message + " FDP03 para la solicitud " + entidadId);
        $("#fdp03").on("click", function (e) {
          e.preventDefault();
          Documento.mostrarMensaje(
            "error",
            response.message + " FDP03 para la solicitud " + entidadId
          );
        });
      } else {
        $("#fdp03").attr("href", response.data.archivo);
      }
    },
    error: function (response) {
      console.log("ERROR");
      console.log(response);
    },
  });

  datos.tipo_documento = tipoDocumentoFDP04;
  $.ajax({
    type: "POST",
    url: ajaxPath,
    data: datos,
    dataType: "json",
    success: function (response) {
      if ($.isArray(response.data) && !response.data.length > 0) {
        console.log(response.message + " FDP04 para la solicitud " + entidadId);
        $("#fdp04").on("click", function (e) {
          e.preventDefault();
          Documento.mostrarMensaje(
            "error",
            response.message + " FDP04 para la solicitud " + entidadId
          );
        });
      } else {
        $("#fdp04").attr("href", response.data.archivo);
      }
    },
    error: function (response) {
      console.log("ERROR");
      console.log(response);
    },
  });

  datos.tipo_documento = tipoDocumentoFDA05;
  $.ajax({
    type: "POST",
    url: ajaxPath,
    data: datos,
    dataType: "json",
    success: function (response) {
      if ($.isArray(response.data) && !response.data.length > 0) {
        console.log(response.message + " FDA05 para la solicitud " + entidadId);
        $("#fda05").on("click", function (e) {
          e.preventDefault();
          Documento.mostrarMensaje(
            "error",
            response.message + " FDA05 para la solicitud " + entidadId
          );
        });
      } else {
        $("#fda05").attr("href", response.data.archivo);
      }
    },
    error: function (response) {
      console.log("ERROR");
      console.log(response);
    },
  });

};

Documento.showOficio = function (e) {
  e.preventDefault();
  var enlace = this;
  var solicitudId = this.name;
  var documento = this.id;

  var ajaxPath = "../controllers/control-oficio.php";
  var datos = {};
  datos.webService = "consultarOficio";
  datos.url = "";
  datos.solicitud_id = solicitudId;
  datos.documento = documento;

  $.ajax({
    type: "POST",
    url: ajaxPath,
    data: datos,
    dataType: "json",
    success: function (response) {
      console.log("SUCCESS");
      if (!response) {
        if ("get" == enlace.className) {
          $("#modal-solicitud-id").val(solicitudId);
          $("#modal-enlace").val(enlace.href);
          $("#modalOficio").modal("show");
        } else {
          if ("ActaDeCierre" == documento) {
            $("#modal-acta-cierre-solicitud-id").val(solicitudId);
            $("#modal-acta-cierre-enlace").val(enlace.href);
            $("#modalActaDeCierre").modal("show");
          } else if ("ActaDeInspeccion" == documento) {
          } else if ("AcuerdoCambioRepresentanteLegal" == documento) {
          } else if ("Desistimiento" == documento) {
          }
        }
      } else {
        var url =
          enlace.href +
          "?id=" +
          response.solicitud_id +
          "&oficio=" +
          response.oficio;
        window.open(url, "_blank");
      }
    },
    error: function (response) {
      console.log("ERROR");
      console.log(response);
    },
  });
};

Documento.nuevoOficio = function () {
  var enlace = $("#modal-enlace").val();
  var solicitudId = $("#modal-solicitud-id").val();
  var oficio = $("#modal-numero-oficio").val();
  var fecha_surte_efecto = $("#modal-fecha_surte_efecto").val();
  $("#modal-numero-oficio").val("");
  var url = enlace + "?id=" + solicitudId + "&oficio=" + oficio + "&fecha_surte_efecto=" + fecha_surte_efecto;
  window.open(url, "_blank");
};

Documento.showOficioActa = function (e) {
  e.preventDefault();
  var enlace = this;
  var solicitudId = this.name;
  var documento = this.id;

  var ajaxPath = "../controllers/control-oficio.php";
  var datos = {};
  datos.webService = "consultarOficio";
  datos.url = "";
  datos.solicitud_id = solicitudId;
  datos.documento = documento;

  $.ajax({
    type: "POST",
    url: ajaxPath,
    data: datos,
    dataType: "json",
    success: function (response) {
      console.log("SUCCESS");
      // console.log(response); return false;
      if (!response) {
        if ("ActaDeCierre" == documento) {
          $("#modal-acta-cierre-solicitud-id").val(solicitudId);
          $("#modalActaDeCierre").modal("show");
        } else if ("ActaDeInspeccion" == documento) {
          $("#modal-acta-inspeccion-solicitud-id").val(solicitudId);
          $("#modalActaDeInspeccion").modal("show");
        } else if ("Desistimiento" == documento) {
          $("#modal-desistimiento-solicitud-id").val(solicitudId);
          $("#modalDesistimiento").modal("show");
        } else if ("AcuerdoCambioRepresentanteLegal" == documento) {
          $("#modal-acuerdo-cambio-representante-solicitud-id").val(
            solicitudId
          );
          $("#modalAcuerdoCambioRepresentante").modal("show");
        }
      } else {
        if ("ActaDeCierre" == documento) {
          $("#modal-acta-cierre-solicitud-id").val(response.solicitud_id);
          $("#modal-acta-cierre-oficio").val(response.oficio);
          $("#form-acta-cierre").submit();
        } else if ("ActaDeInspeccion" == documento) {
          $("#modal-acta-inspeccion-solicitud-id").val(response.solicitud_id);
          $("#modal-acta-inspeccion-oficio").val(response.oficio);
          $("#form-acta-inspeccion").submit();
        } else if ("Desistimiento" == documento) {
          $("#modal-desistimiento-solicitud-id").val(response.solicitud_id);
          $("#modal-desistimiento-oficio").val(response.oficio);
          $("#form-desistimiento").submit();
        } else if ("AcuerdoCambioRepresentanteLegal" == documento) {
          $("#modal-acuerdo-cambio-representante-solicitud-id").val(
            response.solicitud_id
          );
          $("#modal-acuerdo-cambio-representante-oficio").val(response.oficio);
          $("#form-acuerdo-cambio-representante").submit();
        }
      }
    },
    error: function (response) {
      console.log("ERROR");
      console.log(response);
    },
  });
};

Documento.nuevoActaDeCierre = function () {
  $("#form-acta-cierre").submit();
};

Documento.nuevoActaDeInspeccion = function () {
  $("#form-acta-inspeccion").submit();
};

Documento.nuevoDesistimiento = function () {
  $("#form-desistimiento").submit();
};
Documento.nuevoAcuerdoCambioRepresentanteLegal = function () {
  $("#form-acuerdo-cambio-representante").submit();
};

$(document).ready(function ($) {
  Documento.getFormatos();
  $("#mensaje").on("click", Documento.ocultarMensaje);
  $(".get").on("click", Documento.showOficio);
  $("#ActaDeCierre").on("click", Documento.showOficioActa);
  $("#ActaDeInspeccion").on("click", Documento.showOficioActa);
  $("#Desistimiento").on("click", Documento.showOficioActa);
  $("#AcuerdoCambioRepresentanteLegal").on("click", Documento.showOficioActa);
  $("#modal-aceptar").on("click", Documento.nuevoOficio);
  $("#modal-acta-cierre-aceptar").on("click", Documento.nuevoActaDeCierre);
  $("#modal-acta-inspeccion-aceptar").on(
    "click",
    Documento.nuevoActaDeInspeccion
  );
  $("#modal-desistimiento-aceptar").on("click", Documento.nuevoDesistimiento);
  $("#modal-acuerdo-cambio-representante-aceptar").on(
    "click",
    Documento.nuevoAcuerdoCambioRepresentanteLegal
  );
});
