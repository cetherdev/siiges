<?php
require("pdf.php");
require_once "../../models/modelo-solicitud.php";
require_once "../../models/modelo-docente.php";

session_start();

if (!isset($_GET["id"]) && !$_GET["id"]) {
  header("../home.php");
}

$tituloTipoSolicitud = [
  "SOLICITUD DE RECONOCIMIENTO DE VALIDEZ OFICIAL DE ESTUDIOS",
  "SOLICITUD DE REFRENDO A PLAN Y PROGRAMA DE ESTUDIO",
  "SOLICITUD DE CAMBIO DE DOMICILIO",
  "SOLICITUD DE CAMBIO DE REPRESENTANTE LEGAL"
];

$cicloTxt = [
  "SEMESTRALES",
  "CUATRIMESTRALES",
  "ANUALES",
  "SEMESTRALES",
  "CUATRIMESTRALES"
];

$pdf = new PDF();
//header('Content-Type: text/html; charset=UTF-8');
$pdf->getData($_GET["id"]);
$pdf->getDocentes(Docente::DOCENTE_ASIGNATURA) && getDocentes(Docente::DOCENTE_TIMEPO_COMPLETO);

$pdf->AddPage("P", "Letter");

$pdf->SetFont("Nutmegb", "", 11);
$pdf->SetMargins(20, 35, 20);
// Nombre del formato
$pdf->SetFont("Nutmegb", "", 11);
$pdf->Ln(25);
$x = $pdf->SetX(20);
$y = $pdf->SetY(35);
$pdf->SetTextColor(255, 255, 255);
$pdf->SetFillColor(0, 127, 204);
$pdf->Cell(140, 5, "", 0, 0, "L");

$pdf->Cell(35, 6, "FDP06", 0, 0, "R", true);

$pdf->SetTextColor(0, 127, 204);
// Nombre del formato
$pdf->Ln(15);

$pdf->SetTextColor(0, 127, 204);

$pdf->Cell(0, 5, utf8_decode("FORMATO PLANTILLA DE DOCENTES ( ASIGNATURA O TIEMPO COMPLETO)"), 0, 1, "L");
$pdf->SetTextColor(0, 0, 0);
$pdf->Ln(10);
$pdf->SetFont("Nutmeg", "", 9);
$dataPrograma = array(
  [
    "name" => utf8_decode("NOMBRE DE LA INSTITUCIÓN"),
    "description" => utf8_decode(mb_strtoupper($pdf->institucion["nombre"]))
  ],
  [
    "name" => utf8_decode("NIVEL Y NOMBRE DEL PLAN DE ESTUDIOS"),
    "description" => utf8_decode(mb_strtoupper($pdf->nivel["descripcion"] . " en " . $pdf->programa["nombre"]))
  ],
  [
    "name" => utf8_decode("MODALIDAD"),
    "description" => utf8_decode(mb_strtoupper($pdf->modalidad["nombre"]))
  ],
  [
    "name" => utf8_decode("DURACIÓN DEL PROGRAMA"),
    "description" => utf8_decode(mb_strtoupper($pdf->programa["duracion_periodos"] . ' PERIODOS ' . $cicloTxt[$pdf->ciclo["id"] - 1]))
  ],
  [
    "name" => utf8_decode("TIPO DE TRÁMITE"),
    "description" => utf8_decode($tituloTipoSolicitud[$pdf->solicitud["tipo_solicitud_id"] - 1])
  ],
  [
    "name" => utf8_decode("DOMICILIO"),
    "description" => utf8_decode("Calle / Av. " . mb_strtoupper($pdf->domicilioPlantel["calle"])
      . ", N° " . mb_strtoupper($pdf->domicilioPlantel["numero_exterior"])
      . ($pdf->domicilioPlantel["numero_interior"] ? ", int. " . mb_strtoupper($pdf->domicilioPlantel["numero_interior"]) : "")
      . ", Col. "  . mb_strtoupper($pdf->domicilioPlantel["colonia"])
      . ", Municipio " . mb_strtoupper($pdf->domicilioPlantel["municipio"]) . ".")
  ],
  [
    "name" => utf8_decode("NÚMERO TELEFÓNICO"),
    "description" => utf8_decode($pdf->plantel["telefono1"] . ",  " . $pdf->plantel["telefono2"] . ",  " . $pdf->plantel["telefono3"])
  ]
);

//set widht for each column (6 columns)
$pdf->SetWidths(array(75, 100));

//set line height
$pdf->SetLineHeight(5);

$pdf->SetColors([[191, 191, 191], []]);

foreach ($dataPrograma as $item) {
  // write data using Row() method containing array of values
  $pdf->Row(array(
    $item['name'],
    $item['description']
  ));
}

$pdf->Ln(5);

foreach ($pdf->AsigPorGrado as $grado => $asignaturas) {
  $pdf->SetFillColor(166, 166, 166);
  $pdf->SetFont("Nutmegb", "", 6);
  $pdf->Cell(178, 5, utf8_decode(mb_strtoupper($grado)), 1, 1, "C", true);
  $pdf->SetFillColor(191, 191, 191);
  $y = $pdf->GetY();
  $x = $pdf->GetX();
  $pdf->MultiCell(20, 5, utf8_decode("NOMBRE DEL DOCENTE"), 1, "C", true);
  $pdf->SetXY($x + 20, $y);
  $pdf->Cell(35, 10, utf8_decode("FORMACIÓN PROFESIONAL"), 1, 0, "C", true);
  $y = $pdf->GetY();
  $x = $pdf->GetX();
  $pdf->MultiCell(18, 5, utf8_decode("DOCUMENTO PRESENTADO"), 1, 0, "C", true);
  $pdf->SetXY($x + 18, $y);
  $y = $pdf->GetY();
  $x = $pdf->GetX();
  $pdf->MultiCell(25, 5, utf8_decode("ASIGNATURA PROPUESTA"), 1, "C", true);
  $pdf->SetXY($x + 25, $y);
  $pdf->Cell(20, 10, utf8_decode("EXPERIENCIA"), 1, 0, "C", true);
  $y = $pdf->GetY();
  $x = $pdf->GetX();
  $pdf->MultiCell(25, 5, utf8_decode("CONTRATO, ANTIGUEDAD"), 1, "C", true);
  $pdf->SetXY($x + 25, $y);
  $y = $pdf->GetY();
  $x = $pdf->GetX();
  $pdf->MultiCell(15, 10, utf8_decode("SE ACEPTA"), 1, "C", true);
  $pdf->SetXY($x + 15, $y);
  $pdf->Cell(20, 10, utf8_decode("OBSERVACIONES"), 1, 0, "C", true);
  $pdf->SetXY($x + 15, $y);
  $pdf->Cell(20, 10, utf8_decode("TIPO DOCENTE"), 1, 0, "C", true);
  $pdf->Ln(10);

  foreach ($asignaturas as $asignatura => $detalle) {
    $pdf->SetFont("Nutmegbk", "", 6);

    $dataAsignaturasGrado = array(
      [
        "docente_docente" => utf8_decode(mb_strtoupper($detalle["docente"])),
        "formacion_docente" => utf8_decode(mb_strtoupper($detalle["formacion"])),
        "documento_docente" => utf8_decode(mb_strtoupper($detalle["documento"])),
        "asignatura_docente" => utf8_decode(mb_strtoupper($detalle["asignatura"])),
        "experiencia_docente" => utf8_decode(mb_strtoupper($detalle["experiencia"])),
        "contratacion_antiguedad_docente" => utf8_decode(mb_strtoupper($detalle["contratacion_antiguedad"])),
        "aceptado_docente" => utf8_decode(mb_strtoupper($detalle["aceptado"])),
        "observaciones_docente" => utf8_decode(mb_strtoupper($detalle["observaciones"])),
      ]
    );

    //set widht for each column (6 columns)
    $pdf->SetWidths(array(20, 35, 18, 25,  20, 25, 15, 20));

    //set line height
    $pdf->SetLineHeight(5);
    $pdf->SetColors([]);

    foreach ($dataAsignaturasGrado as $item) {

      // write data using Row() method containing array of values
      $pdf->Row(array(
        $item['docente_docente'],
        $item['formacion_docente'],
        $item['documento_docente'],
        $item['asignatura_docente'],
        $item['experiencia_docente'],
        $item['contratacion_antiguedad_docente'],
        $item['aceptado_docente'],
        $item['observaciones_docente']
      ));
      if ($pdf->checkNewPage()) {
        $pdf->Ln(15);
      }
    }
  }
  $pdf->Ln();
}

$pdf->Ln(30);

if ($pdf->programa["acuerdo_rvoe"]) {

  $pdf->SetFont("Nutmeg", "", 9);
  if ($pdf->programa["acuerdo_rvoe"]) {
    $y = $pdf->GetY();
    $x = $pdf->GetX();
    $pdf->MultiCell(60, 5, utf8_decode(mb_strtoupper($pdf->nombreRepresentante)), "T", "C");
    $pdf->SetXY($x + 60, $y);
    $pdf->Cell(50, 5, mb_strtoupper(Solicitud::convertirFecha(date("d-m-y"))), 0, 0, "C");
    $pdf->MultiCell(65, 5, utf8_decode("ING. MARCO ARTURO CASTRO AGUILERA\nDIRECTOR GENERAL DE INCORPORACIÓN Y SERVICIOS ESCOLARES"), "T", "C");
  } else {
    $pdf->Cell(0, 5, "BAJO PROTESTA DE DECIR VERDAD", 0, 0, "C");
    $pdf->Ln(5);
    $pdf->Cell(0, 5, utf8_decode(mb_strtoupper($pdf->nombreRepresentante)), 0, 0, "C");
  }
  $pdf->Ln(10);
} else {
  $pdf->SetFont("Arial", "", 11);
  $pdf->Cell(0, 5, "BAJO PROTESTA DE DECIR VERDAD", 0, 0, "C");
  $pdf->Ln(5);
  $pdf->SetFont("Arial", "B", 11);
  $pdf->Cell(0, 5, utf8_decode(mb_strtoupper($pdf->nombreRepresentante)), 0, 0, "C");
}
$pdf->Ln(5);

$pdf->Output("I", "FDP06.pdf");
