<?php
require("../../fpdf181/fpdf.php");
require_once "../../models/modelo-solicitud.php";
require_once "../../models/modelo-programa.php";
require_once "../../models/modelo-nivel.php";
require_once "../../models/modelo-modalidad.php";
require_once "../../models/modelo-ciclo.php";
require_once "../../models/modelo-turno.php";
require_once "../../models/modelo-institucion.php";
require_once "../../models/modelo-ratificacion-nombre.php";
require_once "../../models/modelo-usuario.php";
require_once "../../models/modelo-solicitud-usuario.php";
require_once "../../models/modelo-tipo-solicitud.php";

class PDF extends FPDF
{
  // Cabecera de p�gina
  function Header()
  {
    $this->Image("../../images/encabezado.jpg", 0, 15, 75);
    $this->Image("../../images/direccion_sicyt.PNG", 155, 12, 40);
    $this->AddFont('Nutmeg', '', 'Nutmeg-Regular.php');
    $this->AddFont('Nutmegb', '', 'Nutmeg-Bold.php');
    $this->AddFont('Nutmegbk', '', 'Nutmeg-Book.php');
    $this->SetFont("Nutmegb", "", 11);
    $this->Ln(25);
    $this->SetTextColor(255, 255, 255);
    $this->SetFillColor(0, 127, 204);
    $this->Cell(140, 5, "", 0, 0, "L");
    $this->Cell(45, 6, "FDA01", 0, 0, "R", true);
    $this->Ln(10);
  }

  // Pie de p�gina
  function Footer()
  {
    $this->SetY(-30);
    $this->SetFont("Nutmegbk", "", 7);
    $this->SetTextColor(0, 0, 0);
    $this->Ln(5);
    $this->Image("../../images/jalisco.png", 20, 245, 20);
    $this->SetY(-20);
    $this->SetTextColor(166, 166, 166);
    $this->Cell(0, 5, utf8_decode("Página " . $this->PageNo()), 0, 0, "R");
  }
}

session_start();
if (!isset($_GET["id"]) && !$_GET["id"]) {
  header("Location: ../home.php");
  exit();
}

$tituloTipoSolicitud = [
  "SOLICITUD DE RECONOCIMIENTO DE VALIDEZ OFICIAL DE ESTUDIOS (RVOE)",
  "SOLICITUD DE REFRENDO A PLAN Y PROGRAMA DE ESTUDIO",
  "SOLICITUD DE CAMBIO DE DOMICILIO",
  "SOLICITUD DE CAMBIO DE REPRESENTANTE LEGAL"
];

// Solicitud
$solicitud = new Solicitud();
$solicitud->setAttributes(["id" => $_GET["id"]]);
$solicitud = $solicitud->consultarId();
$solicitud = !empty($solicitud["data"]) ? $solicitud["data"] : false;
if (!$solicitud) {
  $_SESSION["resultado"] = json_encode(["status" => "404", "message" => "Solicitud no encontrada.", "data" => []]);
  header("Location: ../home.php");
  exit();
}

// Programa
$programa = new Programa();
$programa = $programa->consultarPor("programas", ["solicitud_id" => $_GET["id"]], "*");
$programa = !empty($programa["data"][0]) ? $programa["data"][0] : false;
if (!$programa) {
  $_SESSION["resultado"] = json_encode(["status" => "404", "message" => "Programa no encontrado.", "data" => []]);
  header("Location: ../home.php");
  exit();
}

// Nivel
$nivel = new Nivel();
$nivel->setAttributes(["id" => $programa["nivel_id"]]);
$nivel = $nivel->consultarId();
$nivel = !empty($nivel["data"]) ? $nivel["data"] : false;
if (!$nivel) {
  $_SESSION["resultado"] = json_encode(["status" => "404", "message" => "Nivel no encontrado.", "data" => []]);
  header("Location: ../home.php");
  exit();
}

//Modalidad
$modalidad = new Modalidad();
$modalidad->setAttributes(["id" => $programa["modalidad_id"]]);
$modalidad = $modalidad->consultarId();
$modalidad = !empty($modalidad["data"]) ? $modalidad["data"] : false;
if (!$modalidad) {
  $_SESSION["resultado"] = json_encode(["status" => "404", "message" => "Modalidad no encontrada.", "data" => []]);
  header("Location: ../home.php");
  exit();
}

//Ciclo
$ciclo = new Ciclo();
$ciclo->setAttributes(["id" => $programa["ciclo_id"]]);
$ciclo = $ciclo->consultarId();
$ciclo = !empty($ciclo["data"]) ? $ciclo["data"] : false;
if (!$ciclo) {
  $_SESSION["resultado"] = json_encode(["status" => "404", "message" => "Ciclo no encontrado.", "data" => []]);
  header("Location: ../home.php");
  exit();
}
$turno = "";

// Turnos
$turnos = new Turno();

$turnos = $turnos->consultarPor("programas_turnos", array("programa_id" => $programa["id"], "deleted_at"), "*");
$turnos = !empty($turnos["data"]) ? $turnos["data"] : false;
if (!$turnos) {
  $_SESSION["resultado"] = json_encode(["status" => "404", "message" => "Turno no encontrada.", "data" => []]);
  header("Location: ../home.php");
  exit();
}
foreach ($turnos as $value) {
  $objTurno = new Turno();
  $objTurno->setAttributes(["id" => $value["turno_id"]]);
  $objTurno = $objTurno->consultarId();
  $objTurno = !empty($objTurno["data"]) ? $objTurno["data"] : false;
  if (!$objTurno) {
    $_SESSION["resultado"] = json_encode(["status" => "404", "message" => "Turno no encontrado.", "data" => []]);
    header("Location: ../home.php");
    exit();
  }
  $turno .= $objTurno["nombre"] . ", ";
}

$nombreInstitucion = "";
// Institución
$institucion = new Institucion();
$institucion = $institucion->consultarPor("instituciones", ["usuario_id" => $solicitud["usuario_id"]], "*");
$institucion = !empty($institucion["data"][0]) ? $institucion["data"][0] : false;
if (!$institucion) {
  $_SESSION["resultado"] = json_encode(["status" => "404", "message" => "Institució no encontrada.", "data" => []]);
  header("Location: ../home.php");
  exit();
}
if ($institucion["es_nombre_autorizado"]) {
  $nombreInstitucion = $institucion["nombre"];
} else {
  // Institución
  $ratificacion = new RatificacionNombre();
  $ratificacion = $ratificacion->consultarPor("ratificacion_nombres", ["institucion_id" => $institucion["id"]], "*");
  $ratificacion = !empty($ratificacion["data"][0]) ? $ratificacion["data"][0] : false;
  if (!$ratificacion) {
    $_SESSION["resultado"] = json_encode(["status" => "404", "message" => "Ratificación no encontrada.", "data" => []]);
    header("Location: ../home.php");
    exit();
  }
  $nombreInstitucion .= $ratificacion["nombre_propuesto1"] . ", " . $ratificacion["nombre_propuesto2"] . ", " . $ratificacion["nombre_propuesto3"];
}

$usuarioR = new Usuario();
$usuarioR->setAttributes(["id" => $institucion["usuario_id"]]);
$usuarioR = $usuarioR->consultarId();
$usuarioR = !empty($usuarioR["data"]) ? $usuarioR["data"] : false;
if (!$usuarioR) {
  $_SESSION["resultado"] = json_encode(["status" => "404", "message" => "Usuario representante no encontrado.", "data" => []]);
  header("Location: ../home.php");
  exit();
}
$nombreRepresentante = $usuarioR["persona"]["nombre"] . " " . $usuarioR["persona"]["apellido_paterno"] . " " . $usuarioR["persona"]["apellido_materno"];

// Domicilio REPRESENTANTE
$domicilioRepresentante = new Domicilio();
$domicilioRepresentante->setAttributes(["id" => $usuarioR["persona"]["domicilio_id"]]);
$domicilioRepresentante = $domicilioRepresentante->consultarId();
$domicilioRepresentante = !empty($domicilioRepresentante["data"]) ? $domicilioRepresentante["data"] : false;
if (!$domicilioRepresentante) {
  $_SESSION["resultado"] = json_encode(["status" => "404", "message" => "Domicilio del representante no encontrado.", "data" => []]);
  header("Location: ../home.php");
  exit();
}

//usuario
// Institución
$usuarioR = new Usuario();
$usuarioR->setAttributes(["id" => $institucion["usuario_id"]]);
$usuarioR = $usuarioR->consultarId();
$usuarioR = !empty($usuarioR["data"]) ? $usuarioR["data"] : false;
if (!$usuarioR) {
  $_SESSION["resultado"] = json_encode(["status" => "404", "message" => "Usuario representante no encontrado.", "data" => []]);
  header("Location: ../home.php");
  exit();
}
$nombreRepresentante = $usuarioR["persona"]["nombre"] . " " . $usuarioR["persona"]["apellido_paterno"] . " " . $usuarioR["persona"]["apellido_materno"];

$diligencias = new SolicitudUsuario();
$diligencias = $diligencias->consultarPor("solicitudes_usuarios", array("solicitud_id" => $solicitud["id"], "deleted_at"), "*");
$diligencias = !empty($diligencias["data"]) ? $diligencias["data"] : false;
if (!$diligencias) {
  $_SESSION["resultado"] = json_encode(["status" => "404", "message" => "Personal para diligencias no encontrados.", "data" => []]);
  header("Location: ../home.php");
  exit();
}

$fecha = Solicitud::convertirFecha($solicitud['fecha']);

$pdf = new PDF();

$pdf->AliasNbPages();
$pdf->AddPage("P", "Letter");
$pdf->SetFont("Nutmegb", "", 11);
$pdf->SetMargins(20, 20, 20);
$pdf->Ln();
$pdf->SetTextColor(0, 127, 204);
$pdf->Cell(0, 5, utf8_decode("OFICIO DE ENTREGA DE DOCUMENTACIÓN"), 0, 1, "L");
$pdf->SetTextColor(0, 0, 0);
$pdf->Ln(10);
$pdf->Cell(0, 5, utf8_decode("SUBSECRETARÍA DE EDUCACIÓN SUPERIOR"), 0, 1, "L");
$pdf->Ln(5);
$pdf->Cell(0, 5, utf8_decode("AT´N: DIRECTOR GENERAL DE INCORPORACIÓN Y SERVICIOS ESCOLARES."), 0, 1, "R");

$pdf->Ln(5);
$pdf->SetFont("Nutmeg", "", 9);

$pdf->Cell(0, 5, utf8_decode(mb_strtoupper("$fecha")), 0, 1, "R");
$pdf->Ln(5);
$pdf->MultiCell(0, 5, utf8_decode("Por este conducto manifiesto que estoy en condiciones para iniciar el trámite de "
  . mb_strtoupper($tituloTipoSolicitud[$solicitud["tipo_solicitud_id"] - 1])
  . " del programa " . mb_strtoupper($nivel['descripcion'])
  . " en " . mb_strtoupper($programa['nombre'])
  . ", modalidad " . mb_strtoupper($modalidad['nombre'])
  . ", en periodos " . mb_strtoupper($ciclo["nombre"])
  . ", turno " . mb_strtoupper($turno)
  . " de la Institución " . mb_strtoupper($nombreInstitucion) . "."), 0, "J");
$pdf->Ln(5);

$pdf->MultiCell(0, 5, utf8_decode("Así mismo declaro Bajo Protesta de Decir la Verdad que la información y los documentos anexos en la presente solicitud son verídicos y fueron elaborados siguiendo principios éticos profesionales, que son de mi conocimiento las penas en que incurren quienes se conducen con falsedad ante autoridad distinta de la judicial, y señalo como domicilio para recibir notificaciones:"), 0, "J");
$pdf->Ln(5);
$pdf->SetTextColor(0, 0, 0);

$pdf->MultiCell(0, 5, utf8_decode(
  "Calle / Av. " . mb_strtoupper($domicilioRepresentante["calle"])
    . ", N° " . mb_strtoupper($domicilioRepresentante["numero_exterior"])
    . ($domicilioRepresentante["numero_interior"] ? ", int. " . mb_strtoupper($domicilioRepresentante["numero_interior"]) : "")
    . ", Col. "  . mb_strtoupper($domicilioRepresentante["colonia"])
    . ", Municipio " . mb_strtoupper($domicilioRepresentante["municipio"]) . "."
), 0, "J");

$pdf->Cell(0, 5, utf8_decode($usuarioR["persona"]["telefono"] ? ("Número telefónico particular: " . $usuarioR["persona"]["telefono"]) : ""), 0, 1, "L");
$pdf->Cell(0, 5, utf8_decode($usuarioR["persona"]["celular"] ? ("Número telefónico celular: " . $usuarioR["persona"]["celular"]) : ""), 0, 1, "L");

$pdf->Ln(5);

$pdf->MultiCell(0, 5, utf8_decode("Quedo enterado de todas las disposiciones establecidas en la Ley General de Educación, La Ley General de Educación Superior, la Ley de Educación del Estado Libre y Soberano de Jalisco, la Ley de Educación Superior del Estado de Jalisco, así como del Instructivo para la obtención de Reconocimiento de Validez Oficial de Estudios de Educación Superior del Estado de Jalisco."), 0, "J");
$pdf->Ln(30);
$pdf->SetFont("Nutmegb", "", 11);
$pdf->Cell(0, 5, (utf8_decode(mb_strtoupper("Bajo protesta de decir verdad"))), 0, 1, "C");
$pdf->SetFont("Nutmeg", "", 11);
$pdf->Cell(0, 5, utf8_decode(mb_strtoupper($nombreRepresentante)), 0, 1, "C");

$pdf->Output("I", "FDA01.pdf");
