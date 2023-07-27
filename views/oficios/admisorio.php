<?php
require("pdfoficio.php");
session_start();
if (!isset($_GET["id"]) || empty($_GET["id"])) {
  header('Location: ../home.php');
}
class OficioPDF extends PDF
{
  // Cabecera de pagina
  function Header()
  {
    //$this->Image( "../../images/marcaDeAguaSicyt.jpg",0,0,215,279);
    $this->Image("../../images/encabezado.jpg", 0, 15, 75);
    $this->Image("../../images/direccion_sicyt.PNG", 155, 12, 40);
    $this->AddFont('Nutmeg', '', 'Nutmeg-Regular.php');
    $this->AddFont('Nutmegb', '', 'Nutmeg-Bold.php');
    $this->AddFont('Nutmegbk', '', 'Nutmeg-Book.php');
  }
  function Footer()
  {
    $this->Image("../../images/jalisco.png", 20, 245, 20);
  }
}
$pdf = new OficioPDF();
$pdf->AliasNbPages();
$pdf->AddPage("P", "Letter");
$pdf->SetFont("Nutmegb", "", 10);
$pdf->SetMargins(20, 20, 20);
// Obtener datos
$pdf->getProgramaPorSolicitud($_GET["id"]);
$pdf->getPlantel($pdf->programa["plantel_id"]);
$pdf->getInstitucion($pdf->plantel["institucion_id"]);
$pdf->getRepresentante($pdf->institucion["usuario_id"]);
$pdf->getSolicitud($_GET["id"]);

$registro["solicitud_id"] = $_GET["id"];
$registro["documento"] = "OficioAdmisorio";

$oficio = $pdf->getOficio($registro);

switch ($pdf->solicitud["tipo_solicitud_id"]) {
  case 1:
    $titulo_txt = "RECONOCIMIENTO DE VALIDEZ";
    $texto1_txt = " obtener el ";
    $texto2_txt = " ofertar e impartir ";
    break;
  case 2:
    $titulo_txt = "REFRENDO DEL RECONOCIMIENTO DE VALIDEZ";
    $texto1_txt = " refrendo (actualización) del ";
    $texto2_txt = " continuar impartiendo ";
    break;
  case 3:
    $titulo_txt = "CAMBIO DE DOMICILIO DEL RECONOCIMIENTO DE VALIDEZ";
    $texto1_txt = " cambio de domicilio del ";
    $texto2_txt = " continuar impartiendo ";
    break;
  default:
    # code...
    break;
}
$pdf->Ln(30);
$pdf->Cell(0, 5, utf8_decode("SECRETARÍA DE INNOVACIÓN CIENCIA Y TECNOLOGÍA"), 0, 1, "R");
$pdf->Cell(0, 5, utf8_decode("SUBSECRETARÍA DE EDUCACIÓN SUPERIOR"), 0, 1, "R");
$pdf->Cell(0, 5, utf8_decode("DIRECCIÓN GENERAL DE INCORPORACIÓN Y SERVICIOS ESCOLARES"), 0, 1, "R");
$pdf->Cell(0, 5, utf8_decode("NUMERO DE OFICIO " . $oficio["oficio"]), 0, 1, "R");
$pdf->Ln(3);
$pdf->SetFont("Nutmegb", "", 10);
$fecha = $pdf->convertirFecha($pdf->solicitud["fecha_recepcion"]);
$pdf->Cell(0, 5, "Guadalajara, Jalisco; " . $fecha, 0, 1, "R");
$pdf->Ln(10);
$pdf->SetFont("Nutmegb", "", 11);
$pdf->Cell(0, 5, utf8_decode("AUTO ADMISORIO DE " . $titulo_txt), 0, 1, "C");
$pdf->Cell(0, 5, utf8_decode("OFICIAL DE ESTUDIOS"), 0, 1, "C");
$pdf->Ln(3);
$pdf->SetFont("Nutmegb", "", 11);
$pdf->Cell(0, 5, utf8_decode(mb_strtoupper("C." . $pdf->representante["persona"]["nombre"] . " " . $pdf->representante["persona"]["apellido_materno"] . " " . $pdf->representante["persona"]["apellido_materno"])), 0, 1, "L");
$pdf->Cell(0, 5, utf8_decode(mb_strtoupper("" . $pdf->institucion["nombre"])), 0, 1, "L");
$pdf->Cell(0, 5, utf8_decode("PRESENTE"), 0, 1, "L");
$pdf->Ln(3);
$pdf->SetFont("Nutmeg", "", 10);
$generoTxt = "Masculino" == $pdf->representante["persona"]["sexo"] ? "el" : "la";
$pdf->MultiCell(0, 5, utf8_decode("Que en relación a su solicitud para" . $texto1_txt . "Reconocimiento de Validez Oficial de Estudios (RVOE) presentada en esta Dirección General de Incorporación y Servicios Escolares, con fecha " . $fecha . " a través de la cual pretende" . $texto2_txt . "el plan y programas de estudio de la '" . $pdf->programa["nivel"]["descripcion"] . " en " . $pdf->programa["nombre"] . "' con número de Folio " . $pdf->solicitud["folio"] . ", " . "en el domicilio calle " . $pdf->plantel["domicilio"]["calle"] . ", numero " . $pdf->plantel["domicilio"]["numero_exterior"] . ", colonia " . $pdf->plantel["domicilio"]["colonia"] . ", " . $pdf->plantel["domicilio"]["estado"] . ", me permito informarle que esta Dirección tiene a bien emitir el presente auto admisorio en virtud de haber presentado toda la documentación administrativa y académica requerida para continuar con cada una de las etapas establecidas en el Instructivo para la obtención del Reconocimiento de Validez Oficial de Estudios de Educación Superior del Estado de Jalisco 2023."), 0, "J");
$pdf->Ln(5);
$pdf->MultiCell(0, 5, utf8_decode("En uso de las facultades que me confiere el artículo 3° fracción VI de la Constitución Política de los Estados Unidos Mexicanos; capítulo II del Reconocimiento de Validez Oficial de Estudios de la Ley de Educación Superior del Estado de Jalisco."), 0, "J");
$pdf->Ln();
$pdf->MultiCell(0, 5, utf8_decode("Sin otro particular, hago propicia la ocasión para enviarle un cordial saludo."), 0, "J");
$pdf->Ln();
$pdf->SetFont("Nutmegb", "", 10);
$pdf->Ln(3);
$pdf->Cell(0, 5, utf8_decode("ATENTAMENTE"), 0, 1, "C");
$pdf->Ln(10);
$pdf->Ln(10);
$pdf->Cell(0, 5, utf8_decode("ING. MARCO ARTURO CASTRO AGUILERA"), 0, 1, "C");
$pdf->Cell(0, 5, utf8_decode("DIRECTOR GENERAL DE INCORPORACIÓN Y"), 0, 1, "C");
$pdf->Cell(0, 5, utf8_decode("SERVICIOS ESCOLARES"), 0, 1, "C");
$pdf->Ln(3);
$pdf->Output("I", "NotificaciónRVOE.pdf");