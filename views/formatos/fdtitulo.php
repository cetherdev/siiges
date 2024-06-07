<?php
require_once __DIR__ . '/../../vendor/autoload.php';
require("pdftitulo.php");

use Endroid\QrCode\QrCode;
use Endroid\QrCode\Encoding\Encoding;
use Endroid\QrCode\Writer\PngWriter;

session_start();

if (empty($_GET['id'])) {
    header("Location: ../home.php");
    exit;
}

$pdf = new PDF();
$pdf->getData($_GET['id']);

$pdf->AliasNbPages();
$pdf->AddPage("P", "Letter");
$pdf->AddFont('Nutmeg', '', 'Nutmeg-Regular.php');
$pdf->AddFont('Nutmegb', '', 'Nutmeg-Bold.php');
$pdf->AddFont('Nutmegbk', '', 'Nutmeg-Book.php');
$pdf->SetMargins(18, 35, 18);
$marIzq = 18;
$marDer = 198;
$primeraLinea = 71;

$pdf->AddFont('Nutmeg', '', 'Nutmeg-Regular.php');
//$pdf->Image( "../../images/encabezado.jpg",10,5,120);
$pdf->Image("../../images/titulo_fondo.png", -2, -3, 220);
$pdf->Ln(10);
$pdf->SetFont("Nutmeg", "", 8);
$pdf->Cell(0, 0, utf8_decode("SECRETARÍA DE INNOVACIÓN, CIENCIA"), 0, 0, "C", false);
$pdf->Ln(4);
$pdf->Cell(0, 0, utf8_decode("Y TECNOLOGÍA DE JALISCO."), 0, 0, "C", false);
$pdf->Ln(5);
$pdf->Cell(0, 0, utf8_decode("SUBSECRETARÍA DE EDUCACIÓN SUPERIOR."), 0, 0, "C", false);

$pdf->Ln(15);
// Leyenda de artículo
//Datos del titulo
$pdf->Ln(5);
$pdf->SetFont("Nutmegbk", "", 8.5);
$pdf->Cell(0, 0, utf8_decode("Con base en el capítulo 2 artículo 71 de la ley General de Educación Superior, se expide el presente título a:"), 0, 0, "L", false);
$pdf->Ln(5);

//Datos del titulado
$pdf->SetFillColor(198, 216, 236);
$pdf->SetFont("Nutmegb", "", 9);
$pdf->Cell(0, 5, utf8_decode("Datos del titulado"), 0, 1, "C", true);
$pdf->Ln(6);

$pdf->SetFont("Nutmegbk", "", 8.5);
$pdf->Cell(60, 5, utf8_decode($pdf->titulo["nombre"]), 0, 0, "C", false);
$pdf->Cell(60, 5, utf8_decode($pdf->titulo["primer_apellido"]), 0, 0, "C", false);
$pdf->Cell(60, 5, utf8_decode($pdf->titulo["segundo_apellido"]), 0, 1, "C", false);
$pdf->Ln(2);
$pdf->Line($marIzq, $primeraLinea, $marDer, $primeraLinea);
$pdf->Cell(60, 5, utf8_decode("Nombre(s)"), 0, 0, "C", false);
$pdf->Cell(60, 5, utf8_decode("Primer apellido"), 0, 0, "C", false);
$pdf->Cell(60, 5, utf8_decode("Segundo apellido"), 0, 1, "C", false);


$pdf->SetFont("Nutmegbk", "", 8.5);
if (strlen($pdf->titulo["nombre_carrera"]) > 45) {
  $pdf->Ln(4);
  $y = $pdf->GetY();
  $x = $pdf->GetX();
  $pdf->MultiCell(90, 4, utf8_decode("\n" . $pdf->titulo["curp"]), 0, "C");
  $pdf->SetXY($x + 90, $y);
  $pdf->MultiCell(90, 4, utf8_decode($pdf->titulo["nombre_carrera"]), 0,"C");
} else {
  $pdf->Ln(8);
  $pdf->Cell(90, 5, utf8_decode($pdf->titulo["curp"]), 0, 0, "C", false);
  $pdf->Cell(90, 5, utf8_decode($pdf->titulo["nombre_carrera"]), 0, 1, "C", false);
}
$pdf->Ln(2);
$pdf->Line($marIzq, ($primeraLinea + 20), $marDer, ($primeraLinea + 20));
$pdf->Cell(90, 5, utf8_decode("CURP"), 0, 0, "C", false);
$pdf->Cell(90, 5, utf8_decode("Nombre del programa"), 0, 1, "C", false);

$pdf->Ln(8);

//Datos de la institucion educativa
$pdf->SetFillColor(198, 216, 236);
$pdf->SetFont("Nutmegb", "", 9);
$pdf->Cell(0, 5, utf8_decode("Datos de la institución educativa"), 0, 1, "C", true);
$pdf->Ln(6);

$pdf->SetFont("Nutmegbk", "", 8.5);
$pdf->Cell(180, 5, utf8_decode($pdf->titulo["nombre_institucion"]), 0, 1, "C", false);
$pdf->Ln(2);
$pdf->Line($marIzq, ($primeraLinea + 51), $marDer, ($primeraLinea + 51));
$pdf->Cell(180, 5, utf8_decode("Nombre o denominación"), 0, 1, "C", false);

$pdf->Ln(8);

//Datos de expedición
$pdf->SetFillColor(198, 216, 236);
$pdf->SetFont("Nutmegb", "", 9);
$pdf->Cell(0, 5, utf8_decode("Datos de expedición"), 0, 1, "C", true);
$pdf->Ln(6);

$pdf->SetFont("Nutmegbk", "", 8.5);
$pdf->Cell(90, 5, utf8_decode($pdf->titulo["folio_control"]), 0, 0, "C", false);
$pdf->Cell(90, 5, utf8_decode($pdf->titulo["estado_txt"]), 0, 1, "C", false);
$pdf->Ln(2);
$pdf->Line($marIzq, ($primeraLinea + 82), $marDer, ($primeraLinea + 82));
$pdf->Cell(90, 5, utf8_decode("Folio"), 0, 0, "C", false);
$pdf->Cell(90, 5, utf8_decode("Entidad federativa"), 0, 1, "C", false);

$pdf->Ln(8);

$pdf->SetFont("Nutmegbk", "", 8.5);
$pdf->Cell(90, 5, utf8_decode($newDate = date("d/m/Y", strtotime($pdf->titulo["fecha_inicio"]))), 0, 0, "C", false);
$pdf->Cell(90, 5, utf8_decode($newDate = date("d/m/Y", strtotime($pdf->titulo["fecha_terminacion"]))), 0, 1, "C", false);
$pdf->Ln(2);
$pdf->Line($marIzq, ($primeraLinea + 102), $marDer, ($primeraLinea + 102));
$pdf->Cell(90, 5, utf8_decode("Fecha de inicio"), 0, 0, "C", false);
$pdf->Cell(90, 5, utf8_decode("Fecha de terminación"), 0, 1, "C", false);

$pdf->Ln(8);

isset($pdf->titulo["fecha_examen_profesional"]) ? $fecha_examen_profesional = $pdf->titulo["fecha_examen_profesional"] : $fecha_examen_profesional = $pdf->titulo["fecha_exencion_examen_profesional"];

$pdf->SetFont("Nutmegbk", "", 8.5);
if ($fecha_examen_profesional == "") {
  $pdf->Cell(90, 5, "", 0, 0, "C", false);
} else {
  $pdf->Cell(90, 5, utf8_decode($newDate = date("d/m/Y", strtotime($fecha_examen_profesional))), 0, 0, "C", false);
}
$pdf->Cell(90, 5, utf8_decode($newDate = date("d/m/Y", strtotime($pdf->titulo["fecha_expedicion"]))), 0, 1, "C", false);
$pdf->Ln(2);
$pdf->Line($marIzq, ($primeraLinea + 122), $marDer, ($primeraLinea + 122));
$pdf->Cell(90, 5, utf8_decode("Fecha de examen o exencion de examen profesional"), 0, 0, "C", false);
$pdf->Cell(90, 5, utf8_decode("Fecha de expedición"), 0, 1, "C", false);

$pdf->Ln(5);

// QR Code
$qrCode = new QrCode('https://siiges.jalisco.gob.mx/consulta_titulo_electronico.php?folioControl=' . $pdf->titulo['folio_control']);
$qrCode->setEncoding(new Encoding('UTF-8'));
$qrCode->setSize(300);
$qrCode->setMargin(10);
$writer = new PngWriter();
$tempQRPath = sys_get_temp_dir() . '/qr_code.png';
$writer->write($qrCode)->saveToFile($tempQRPath);
$pdf->Image($tempQRPath, 150, 208, 52);
unlink($tempQRPath);


///Cadenas de titulo
// Firma de titulo
$pdf->SetFont("Nutmegb", "", 5);
$pdf->Cell(13, 3, utf8_decode("Folio digital:"), 0, 0, "L", false);
$pdf->SetFont("Nutmegbk", "", 5);
$pdf->Cell(107, 3, utf8_decode($pdf->titulo["folio_digital"]), 0, 1, "L", false);
$pdf->SetFont("Nutmegb", "", 5);
$pdf->Cell(23, 3, utf8_decode("Fecha de autenticación:"), 0, 0, "L", false);
$pdf->SetFont("Nutmegbk", "", 5);
$pdf->Cell(97, 3, utf8_decode($newDate = date("d/m/Y", strtotime($pdf->titulo["fecha_autenticacion"]))), 0, 1, "L", false);
$pdf->SetFont("Nutmegb", "", 5);
$pdf->Cell(120, 3, utf8_decode("Sello digital de título:"), 0, 1, "L", false);
$pdf->SetFont("Nutmegbk", "", 5);
$pdf->MultiCell(130, 2, utf8_decode($pdf->titulo["sello_titulo"]), 0, "L");
$pdf->Ln(2);

// Firmante Institución
$pdf->SetFont("Nutmegb", "", 5);
$pdf->Cell(20, 3, utf8_decode("Firmante institución:"), 0, 0, "L", false);
$pdf->SetFont("Nutmegbk", "", 5);
$pdf->Cell(100, 3, utf8_decode($pdf->titulo["nombre_responsable"] . " " . $pdf->titulo["primer_apellido_responsable"] . " " . $pdf->titulo["segundo_apellido_responsable"]), 0, 1, "L", false);
$pdf->Cell(120, 3, utf8_decode("No. de Certificado:   " . $pdf->titulo["no_certificado_responsable"]), 0, 1, "L", false);
$pdf->Cell(120, 3, utf8_decode("Sello digital firmante:"), 0, 1, "L", false);
$pdf->MultiCell(130, 2, utf8_decode($pdf->titulo["sello"]), 0, "L");
$pdf->Ln(2);

// Firmante Autoridad
$nombreAutoridad = ("00001000000506574908" == $pdf->titulo["no_certificado_autoridad"]) ? "JOSÉ ROSALÍO MUÑOZ CASTRO" :   "ILIANA JANETT HERNÁNDEZ PARTIDA";
$pdf->SetFont("Nutmegb", "", 5);
$pdf->Cell(20, 3, utf8_decode("Firmante autoridad:"), 0, 0, "L", false);
$pdf->SetFont("Nutmegbk", "", 5);
$pdf->Cell(100, 3, utf8_decode($nombreAutoridad), 0, 1, "L", false);
$pdf->Cell(120, 3, utf8_decode("No. de Certificado:   " . $pdf->titulo["no_certificado_autoridad"]), 0, 1, "L", false);
$pdf->Cell(120, 3, utf8_decode("Sello digital autoridad:"), 0, 1, "L", false);
$pdf->MultiCell(130, 2, utf8_decode($pdf->titulo["sello_autenticacion"]), 0, "L");
$pdf->Ln(2);

$pdf->SetFont("Nutmegbk", "", 7);
$pdf->AddPage("P", "Letter");
$names = file('../../uploads/Institucion' . $pdf->titulo["institucion_id"] . '/titulacion_electronica/constancia_titulo_' . $pdf->titulo["folio_control"] . '.xml');
// To check the number of lines
foreach ($names as $name) {
  $pdf->MultiCell(180, 4, utf8_decode($name), 0, "L");
}

// Finalización del PDF
$pdf->Output("I", $pdf->titulo['folio_control'] . "_CONSTANCIA_TITULO.pdf");
?>
