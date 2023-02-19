<?php
require("pdf.php");

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

// make new object
$pdf = new PDF();

$pdf->getData($_GET["id"]);
$pdf->AliasNbPages();

$pdf->AddPage("P", "Letter");
$pdf->SetFont("Nutmegb", "", 11);
$pdf->SetMargins(20, 20, 20);

// Nombre del formato
$pdf->SetFont("Nutmegb", "", 11);
$pdf->Ln(25);
$x = $pdf->SetX(20);
$y = $pdf->SetY(35);
$pdf->SetTextColor(255, 255, 255);
$pdf->SetFillColor(0, 127, 204);
$pdf->Cell(140, 5, "", 0, 0, "L");

$pdf->Cell(35, 6, "FDA03", 0, 0, "R", true);
$pdf->Ln(10);

$pdf->SetTextColor(0, 127, 204);
$pdf->Cell(0, 5, utf8_decode("SOLICITUD PARA LA AUTORIZACIÓN DE NOMBRE DE LA INSTITUCIÓN"), 0, 1, "L");
$pdf->SetTextColor(0, 0, 0);
$pdf->Ln(5);
// Fecha
$pdf->SetFont("Nutmeg", "", 9);
$fecha =  $pdf->fecha;
$pdf->Cell(0, 5, utf8_decode(mb_strtoupper($fecha)), 0, 1, "R");
$pdf->Ln(5);


//Datos del solicitante
$pdf->SetFont("Nutmegb", "", 9);
$pdf->SetFillColor(166, 166, 166);
$pdf->Cell(174, 5, utf8_decode("1. DATOS DEL PROPIETARIO O REPRESENTANTE LEGAL"), 1, 0, "C", true);
$pdf->Ln();

$pdf->SetFont("Nutmeg", "", 9);
$dataPersonaSolicitante = array(
  [
    "name" => utf8_decode("NOMBRE (S)"),
    "description" => utf8_decode(mb_strtoupper($pdf->usuarioR["persona"]["nombre"]))
  ],
  [
    "name" => utf8_decode("APELLIDO PATERNO"),
    "description" => utf8_decode(mb_strtoupper($pdf->usuarioR["persona"]["apellido_paterno"]))
  ],
  [
    "name" => utf8_decode("APELLIDO MATERNO"),
    "description" => utf8_decode(mb_strtoupper($pdf->usuarioR["persona"]["apellido_materno"]))
  ],
);

//set widht for each column (6 columns)
$pdf->SetWidths(array(80, 94));

//set line height
$pdf->SetLineHeight(5);

$pdf->SetColors([[191, 191, 191], []]);

foreach ($dataPersonaSolicitante as $item) {
  // write data using Row() method containing array of values
  $pdf->Row(array(
    $item['name'],
    $item['description']
  ));
}
$pdf->Ln();
$pdf->Ln();

if (!$pdf->institucion["es_nombre_autorizado"]) {
  // Propuesta de dombres

  //Datos de la propuesta de nombres
  $pdf->SetFont("Nutmegb", "", 9);
  $pdf->SetFillColor(166, 166, 166);
  $pdf->MultiCell(174, 5, utf8_decode("2. PROPUESTA DE NOMBRE"), 1, "C", true);

  $dataRatificacion = array(
    [
      "name" => utf8_decode("NOMBRE PROPUESTO No. 1"),
      "description" => utf8_decode(mb_strtoupper($pdf->ratificacion["nombre_propuesto1"]))
    ],
    [
      "name" => utf8_decode("NOMBRE PROPUESTO No. 2"),
      "description" => utf8_decode(mb_strtoupper($pdf->ratificacion["nombre_propuesto2"]))
    ],
    [
      "name" => utf8_decode("NOMBRE PROPUESTO No. 3"),
      "description" => utf8_decode(mb_strtoupper($pdf->ratificacion["nombre_propuesto3"]))
    ],
  );

  //set widht for each column (6 columns)
  $pdf->SetWidths(array(60, 114));

  //set line height
  $pdf->SetLineHeight(5);
  $pdf->SetFont("Nutmeg", "", 9);


  $pdf->SetColors([[191, 191, 191], []]);

  foreach ($dataRatificacion as $item) {
    // write data using Row() method containing array of values
    $pdf->Row(array(
      $item['name'],
      $item['description']
    ));
  }
}
if ($pdf->institucion["es_nombre_autorizado"]) {
  //Datos del nombre autorizado
  $pdf->SetFont("Nutmeg", "", 9);
  $pdf->SetFillColor(166, 166, 166);
  $pdf->MultiCell(174, 5, utf8_decode("4. EN CASO DE TENER NOMBRE AUTORIZADO"), 1, "C", true);

  $dataRatificacion = array(
    [
      "name" => utf8_decode("NOMBRE SOLICITADO"),
      "description" => utf8_decode(mb_strtoupper($pdf->ratificacion["nombre_solicitado"]))
    ],
    [
      "name" => utf8_decode("NOMBRE AUTORIZADO"),
      "description" => utf8_decode(mb_strtoupper($pdf->ratificacion["nombre_autorizado"]))
    ],
    [
      "name" => utf8_decode("NIVEL Y NOMBRE DEL PROGRAMA"),
      "description" => utf8_decode(mb_strtoupper($pdf->nivel["descripcion"] . " en " . $pdf->programa["nombre"]))
    ],
    [
      "name" => utf8_decode("RVOE"),
      "description" => utf8_decode(mb_strtoupper($pdf->ratificacion["acuerdo"]))
    ],
    [
      "name" => utf8_decode("INSTANCIA QUE AUTORIZA"),
      "description" => utf8_decode(mb_strtoupper($pdf->ratificacion["autoridad"]))
    ],
  );

  //set widht for each column (6 columns)
  $pdf->SetWidths(array(60, 114));

  //set line height
  $pdf->SetLineHeight(5);

  $pdf->SetColors([[191, 191, 191], []]);

  foreach ($dataRatificacion as $item) {
    // write data using Row() method containing array of values
    $pdf->Row(array(
      $item['name'],
      $item['description']
    ));
  }
}


$pdf->Ln(2);
$pdf->SetTextColor(127, 127, 127);
$pdf->SetFont("Nutmegbk", "", 8);
$pdf->MultiCell(0, 3, utf8_decode("NOMBRES DE PERSONAS FÍSICAS: Se deberá anexar la biografía o fundamento por el que se hace la propuesta de nombre. En su caso, se anexará la bibliografía que sirva de fuente de consulta (autor, título de la obra editorial, lugar y fecha de edición)."), 0, "J");
$pdf->Ln(30);

$pdf->SetTextColor(0, 0, 0);
$pdf->SetFont("Nutmeg", "", 11);
$pdf->Cell(0, 5, utf8_decode("BAJO PROTESTA DE DECIR VERDAD"), 0, 1, "C");
$pdf->SetFont("Nutmegb", "", 11);
$pdf->Cell(0, 5, utf8_decode(mb_strtoupper($pdf->nombreRepresentante)), 0, 1, "C");


$pdf->Output("I", "FDA03.pdf");
