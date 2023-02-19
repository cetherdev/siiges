<?php
require("pdf.php");

session_start();

if (!isset($_GET["id"]) && !$_GET["id"]) {
  header("../home.php");
}

$cicloTxt = [
  "SEMESTRALES",
  "CUATRIMESTRALES",
  "ANUALES",
  "SEMESTRALES",
  "CUATRIMESTRALES"
];

$pdf = new PDF();

$pdf->getData($_GET["id"]);
$pdf->getDataPlantel($pdf->plantel["id"]);
$pdf->AliasNbPages();

$pdf->AddPage("P", "Letter");
$pdf->SetMargins(20, 35, 20);
$pdf->SetAutoPageBreak(true, 30);

// Nombre del formato
$pdf->SetFont("Nutmegb", "", 11);
$pdf->Ln(25);
$x = $pdf->SetX(20);
$y = $pdf->SetY(35);
$pdf->SetTextColor(255, 255, 255);
$pdf->SetFillColor(0, 127, 204);
$pdf->Cell(140, 5, "", 0, 0, "L");

$pdf->Cell(35, 6, "FDP01", 0, 0, "R", true);
$pdf->Ln(10);

$pdf->SetTextColor(0, 127, 204);
$pdf->Cell(0, 5, utf8_decode("FUNDAMENTACIÓN DEL PLAN DE ESTUDIOS"), 0, 1, "L");
$pdf->Ln(5);
$pdf->SetTextColor(0, 0, 0);

//Datos del plan de estudios
$pdf->SetFont("Nutmeg", "", 9);

if ($pdf->institucion["es_nombre_autorizado"]) {
  $dataPlanEstudios = array(
    [
      "name" => utf8_decode("NOMBRE DE LA INSTITUCIÓN"),
      "description" => utf8_decode(mb_strtoupper($pdf->nombreInstitucion))
    ],
    [
      "name" => utf8_decode("NIVEL Y NOMBRE DEL PLAN DE ESTUDIOS"),
      "description" => utf8_decode(mb_strtoupper($pdf->nivel["descripcion"] . " EN " . $pdf->programa["nombre"]))
    ],
    [
      "name" => utf8_decode("MODALIDAD"),
      "description" => utf8_decode(mb_strtoupper($pdf->modalidad["nombre"]))
    ],
    [
      "name" => utf8_decode("DURACIÓN DEL PROGRAMA"),
      "description" => utf8_decode(mb_strtoupper($pdf->programa["duracion_periodos"] . ' PERIODOS ' . $cicloTxt[$pdf->ciclo["id"] - 1]))
    ],
  );
} else {
  $dataPlanEstudios = array(
    [
      "name" => utf8_decode("NIVEL Y NOMBRE DEL PLAN DE ESTUDIOS"),
      "description" => utf8_decode(mb_strtoupper($pdf->nivel["descripcion"] . " EN " . $pdf->programa["nombre"]))
    ],
    [
      "name" => utf8_decode("MODALIDAD"),
      "description" => utf8_decode(mb_strtoupper($pdf->modalidad["nombre"]))
    ],
    [
      "name" => utf8_decode("DURACIÓN DEL PROGRAMA"),
      "description" => utf8_decode(mb_strtoupper($pdf->programa["duracion_periodos"] . ' PERIODOS ' . $cicloTxt[$pdf->ciclo["id"] - 1]))
    ],
  );
}

//set widht for each column (6 columns)
$pdf->SetWidths(array(80, 94));

//set line height
$pdf->SetLineHeight(5);

$pdf->SetColors([[191, 191, 191], []]);

foreach ($dataPlanEstudios as $item) {
  // write data using Row() method containing array of values
  $pdf->Row(array(
    $item['name'],
    $item['description']
  ));
}
$pdf->Ln();
$pdf->Ln();

$pdf->SetFillColor(166, 166, 166);
$pdf->SetFont("Nutmegb", "", 9);
$pdf->Cell(0, 5, utf8_decode("1. ESTUDIO DE PERTINENCIA Y FACTIBILIDAD"), 1, 1, "C", true);
$pdf->SetFillColor(191, 191, 191);
$pdf->Cell(0, 5, utf8_decode("CON REFERENCIA GENERAL"), 1, 1, "L", true);
$pdf->SetFont("Nutmeg", "", 9);
$pdf->MultiCell(0, 5, utf8_decode($pdf->programa["necesidad_social"]), 0, "J");
$pdf->SetFont("Nutmegb", "", 9);
$pdf->SetFont("Nutmegb", "", 9);
$pdf->Cell(0, 5, utf8_decode("CON REFERENCIA AL PERFIL DE NUEVO INGRESO"), 1, 1, "L", true);
$pdf->SetFont("Nutmeg", "", 9);
$pdf->MultiCell(0, 5, utf8_decode($pdf->programa["necesidad_institucional"]), 0, "J");
$pdf->Cell(0, 5, utf8_decode("CON REFERENCIA AL PERFIL DE EGRESO"), 1, 1, "L", true);
$pdf->SetFont("Nutmeg", "", 9);
$pdf->MultiCell(0, 5, utf8_decode($pdf->programa["necesidad_profesional"]), 0, "J");
$pdf->ln();
$pdf->SetFillColor(166, 166, 166);
$pdf->SetFont("Nutmegb", "", 9);
$pdf->Cell(0, 5, utf8_decode("2. ESTUDIO DE OFERTA Y DEMANDA"), 1, 1, "C", true);
$pdf->SetFont("Nutmeg", "", 9);
$pdf->MultiCell(0, 5, utf8_decode($pdf->programa["estudio_oferta_demanda"]), 0, "J");

$pdf->ln();

$pdf->SetFillColor(166, 166, 166);
$pdf->SetFont("Nutmegb", "", 9);
$pdf->Cell(0, 5, utf8_decode("3. FUENTES DE INFORMACIÓN"), 1, 1, "C", true);
$pdf->SetFont("Nutmeg", "", 9);
$pdf->MultiCell(0, 5, utf8_decode($pdf->programa["fuentes_informacion"]), 0, "L");

$pdf->ln();

$pdf->SetFillColor(166, 166, 166);
$pdf->SetFont("Nutmegb", "", 9);
$pdf->Cell(0, 5, utf8_decode("4 MODELO EDUCATIVO"), 1, 1, "C", true);
$pdf->SetFont("Nutmeg", "", 9);
$pdf->MultiCell(0, 5, utf8_decode(""), 0, "L");

$pdf->ln();

$pdf->ln();

$pdf->SetFillColor(166, 166, 166);
$pdf->SetFont("Nutmegb", "", 9);
$pdf->Cell(0, 5, utf8_decode("5 IDEARIO INSTITUCIONAL"), 1, 1, "C", true);
$pdf->SetFillColor(191, 191, 191);
$pdf->Cell(0, 5, utf8_decode("MISIÓN"), 1, 1, "L", true);
$pdf->SetFont("Nutmeg", "", 9);
$pdf->MultiCell(0, 5, utf8_decode($pdf->institucion["mision"]), 0, "J");
$pdf->ln();

$pdf->SetFont("Nutmegb", "", 9);
$pdf->SetFillColor(191, 191, 191);
$pdf->Cell(0, 5, utf8_decode("VISIÓN"), 1, 1, "L", true);
$pdf->SetFont("Nutmeg", "", 9);
$pdf->MultiCell(0, 5, utf8_decode($pdf->institucion["vision"]), 0, "J");
$pdf->ln();

$pdf->SetFont("Nutmegb", "", 9);
$pdf->SetFillColor(191, 191, 191);
$pdf->Cell(0, 5, utf8_decode("VALORES INSTITUCIONALES"), 1, 1, "L", true);
$pdf->SetFont("Nutmeg", "", 9);
$pdf->MultiCell(0, 5, utf8_decode($pdf->institucion["valores_institucionales"]), 0, "J");

$pdf->ln(15);

$pdf->SetTextColor(0, 0, 0);
$pdf->SetFont("Nutmeg", "", 11);
$pdf->Cell(0, 5, utf8_decode("BAJO PROTESTA DE DECIR VERDAD"), 0, 1, "C");
$pdf->SetFont("Nutmegb", "", 11);
$pdf->Cell(0, 5, utf8_decode(mb_strtoupper($pdf->nombreRepresentante)), 0, 1, "C");

$pdf->Output("I", "PDP01.pdf");
