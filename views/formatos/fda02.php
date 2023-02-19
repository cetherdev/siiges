<?php
// Include pdfc_mc_table.php
//require '../../fpdf181/pdf_mc_table.php';
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

// make new object
$pdf = new PDF();

$pdf->getData($_GET["id"]);
$pdf->AliasNbPages();

$pdf->AddPage("P", "Letter");
$pdf->SetFont("Nutmegb", "", 10);
$pdf->SetMargins(20, 20, 20);

// Nombre del formato
$pdf->SetFont("Nutmegb", "", 11);
$pdf->Ln(25);
$x = $pdf->SetX(20);
$y = $pdf->SetY(35);
$pdf->SetTextColor(255, 255, 255);
$pdf->SetFillColor(0, 127, 204);
$pdf->Cell(140, 5, "", 0, 0, "L");

$pdf->Cell(35, 6, "FDA02", 0, 0, "R", true);
$pdf->Ln(10);

$pdf->SetTextColor(0, 127, 204);
$pdf->Cell(0, 5, utf8_decode($tituloTipoSolicitud[$pdf->solicitud["tipo_solicitud_id"] - 1]), 0, 1, "L");
$pdf->SetTextColor(0, 0, 0);
$pdf->Ln(5);
// Fecha
$pdf->SetFont("Nutmeg", "", 9);
$fecha =  $pdf->fecha;
$pdf->Cell(0, 5, utf8_decode(mb_strtoupper($fecha)), 0, 1, "R");
$pdf->Ln(5);

// Tabla de encabezado Datos generales de la institución y programa 
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
    "name" => utf8_decode("DURACIÓN DEL PROGRAMA"),
    "description" => utf8_decode(mb_strtoupper($pdf->programa["duracion_periodos"] . ' PERIODOS ' . $cicloTxt[$pdf->ciclo["id"] - 1]))
  ],
  [
    "name" => utf8_decode("NOMBRE COMPLETO DE LA RAZÓN SOCIAL"),
    "description" => utf8_decode(mb_strtoupper($pdf->razonSocial))
  ],
);

//set widht for each column (6 columns)
$pdf->SetWidths(array(80, 95));

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


// Tabla de encabezado Datos del nivel
$sizeCell = 40;
$dataNivel = [];
$dataNivel = array(["description" => utf8_decode(mb_strtoupper($pdf->nivel["descripcion"]))]);

//set widht for each column (6 columns)
$pdf->SetWidths(array($sizeCell));

//set line height
$pdf->SetLineHeight(5);

$pdf->SetColors([]);

$x = $pdf->GetX();
$y = $pdf->GetY();

// add table heading using standard cells
$pdf->SetFont("Nutmegb", "", 9);
$pdf->SetFillColor(166, 166, 166);
$pdf->Cell($sizeCell, 5, "NIVEL DE ESTUDIO", 1, 0, "C", true);
$pdf->Ln();

$pdf->SetFont("Nutmeg", "", 9);
foreach ($dataNivel as $item) {
  // write data using Row() method containing array of values
  $pdf->Row(array(
    $item['description']
  ));
}


// Tabla de encabezado Datos del turno
$dataTurno = [];
foreach ($pdf->turnoArray as $turno) {
  array_push($dataTurno, array("description" => utf8_decode(mb_strtoupper($turno))));
}

//set widht for each column (6 columns)
$pdf->SetWidths(array($sizeCell));

//set line height
$pdf->SetLineHeight(5);

$pdf->SetColors([]);

$pdf->SetY($y);
// add table heading using standard cells
$pdf->SetFillColor(166, 166, 166);
$x = $sizeCell + 5;
$pdf->Cell($x);
$pdf->SetFont("Nutmegb", "", 9);
$pdf->Cell($sizeCell, 5, "TURNO", 1, 0, "C", true);
$pdf->Ln();

$pdf->SetFont("Nutmeg", "", 9);
foreach ($dataTurno as $item) {
  $pdf->SetX($x + $pdf->GetX());
  // write data using Row() method containing array of values
  $pdf->Row(array(
    $item['description']
  ));
}

// Tabla de encabezado Datos de la modalidad
$dataModalidad = [];
$dataModalidad = array(["description" => utf8_decode(mb_strtoupper($pdf->modalidad["nombre"]))]);

//set widht for each column (6 columns)
$pdf->SetWidths(array($sizeCell));

//set line height
$pdf->SetLineHeight(5);

$pdf->SetColors([]);

$pdf->SetY($y);
// add table heading using standard cells
$pdf->SetFillColor(166, 166, 166);
$x = $x + $sizeCell + 5;
$pdf->Cell($x);
$pdf->SetFont("Nutmegb", "", 9);
$pdf->Cell($sizeCell, 5, "MODALIDAD", 1, 0, "C", true);
$pdf->Ln();

$pdf->SetFont("Nutmeg", "", 9);
$pdf->SetX($x + $pdf->GetX());
foreach ($dataModalidad as $item) {
  // write data using Row() method containing array of values
  $pdf->Row(array(
    $item['description']
  ));
}

// Tabla de encabezado Datos del ciclo
$dataCiclo = [];
$dataCiclo = array(["description" => utf8_decode(mb_strtoupper($pdf->ciclo["nombre"]))]);

//set widht for each column (6 columns)
$pdf->SetWidths(array($sizeCell));

//set line height
$pdf->SetLineHeight(5);

$pdf->SetColors([]);

$pdf->SetY($y);
// add table heading using standard cells
$pdf->SetFillColor(166, 166, 166);
$x = $x + $sizeCell + 5;
$pdf->Cell($x);
$pdf->SetFont("Nutmegb", "", 9);
$pdf->Cell($sizeCell, 5, "CICLO", 1, 0, "C", true);
$pdf->Ln();

$pdf->SetFont("Nutmeg", "", 9);
$pdf->SetX($x + $pdf->GetX());
foreach ($dataCiclo as $item) {
  // write data using Row() method containing array of values
  $pdf->Row(array(
    $item['description']
  ));
}

$pdf->Ln(20);

// Domicilio de la instituciones
$pdf->SetFillColor(166, 166, 166);
$pdf->SetFont("Nutmegb", "", 9);
$pdf->Cell(174, 5, utf8_decode("DOMICILIO DE LA INSTITUCIÓN"), 1, 1, "C", true);


// add table heading using standard cells
$pdf->SetFillColor(191, 191, 191);
$pdf->Cell(116, 5, utf8_decode("CALLE Y NÚMERO"), 1, 0, "C", true);
$pdf->Cell(58, 5, utf8_decode("COLONIA"), 1, 0, "C", true);
$pdf->Ln();

// Tabla de domicilio de la institucion
$dataDetalleDomicilioInstitucion1 = array(
  [
    "calle" => utf8_decode(mb_strtoupper($pdf->domicilioPlantel["calle"] . " " . $pdf->domicilioPlantel["numero_exterior"] . " " . $pdf->domicilioPlantel["numero_interior"])),
    "colonia" => utf8_decode(mb_strtoupper($pdf->domicilioPlantel["colonia"]))
  ]
);

//set widht for each column (6 columns)
$pdf->SetWidths(array(116, 58));

//set line height
$pdf->SetLineHeight(5);
$pdf->SetFont("Nutmeg", "", 9);

foreach ($dataDetalleDomicilioInstitucion1 as $item) {
  // write data using Row() method containing array of values
  $pdf->Row(array(
    $item['calle'],
    $item['colonia']
  ));
}

// Sergundo row de domicilio
// add table heading using standard cells
$pdf->SetFillColor(191, 191, 191);
$pdf->SetFont("Nutmegb", "", 9);
$pdf->Cell(58, 5, utf8_decode("CÓDIGO POSTAL"), 1, 0, "C", true);
$pdf->Cell(58, 5, utf8_decode("DELEGACIÓN O MUNICIPIO"), 1, 0, "C", true);
$pdf->Cell(58, 5, utf8_decode("ENTIDAD FEDERATIVA"), 1, 0, "C", true);
$pdf->Ln();
$dataDetalleDomicilioInstitucion2 = array(
  [
    "codigo_postal" => utf8_decode(mb_strtoupper($pdf->domicilioPlantel["codigo_postal"])),
    "municipio" => utf8_decode(mb_strtoupper($pdf->domicilioPlantel["municipio"])),
    "estado" => utf8_decode(mb_strtoupper($pdf->domicilioPlantel["estado"]))
  ]
);

//set widht for each column (6 columns)
$pdf->SetWidths(array(58, 58, 58));

//set line height
$pdf->SetLineHeight(5);
$pdf->SetFont("Nutmeg", "", 9);

foreach ($dataDetalleDomicilioInstitucion2 as $item) {
  // write data using Row() method containing array of values
  $pdf->Row(array(
    $item['codigo_postal'],
    $item['municipio'],
    $item['estado']
  ));
}


// Tercer row de domicilio
// add table heading using standard cells
$pdf->SetFillColor(191, 191, 191);
$pdf->SetFont("Nutmegb", "", 9);
$pdf->Cell(58, 5, utf8_decode("NÚMERO TELEFÓNICO"), 1, 0, "C", true);
$pdf->Cell(58, 5, utf8_decode("REDES SOCIALES"), 1, 0, "C", true);
$pdf->Cell(58, 5, utf8_decode("CORREO ELECTRÓNICO"), 1, 0, "C", true);
$pdf->Ln();
$dataDetalleDomicilioInstitucion3 = array(
  [
    "telefono" => utf8_decode($pdf->plantel["telefono1"] . ",\n" . $pdf->plantel["telefono2"] . ",\n" . $pdf->plantel["telefono3"]),
    "redes_sociales" => utf8_decode($pdf->plantel["redes_sociales"]),
    "correo" => utf8_decode($pdf->plantel["email1"] . ",\n" . $pdf->plantel["email2"] . ",\n" . $pdf->plantel["email3"]),
  ]
);

//set widht for each column (6 columns)
$pdf->SetWidths(array(58, 58, 58));

//set line height
$pdf->SetLineHeight(5);
$pdf->SetFont("Nutmeg", "", 9);

foreach ($dataDetalleDomicilioInstitucion3 as $item) {
  // write data using Row() method containing array of values
  $pdf->Row(array(
    $item['telefono'],
    $item['redes_sociales'],
    $item['correo'],
  ));
}

$pdf->Ln();

//Datos del solicitante
$pdf->SetFillColor(166, 166, 166);
$pdf->SetFont("Nutmegb", "", 9);
$pdf->Cell(174, 5, utf8_decode("DATOS DEL SOLICITANTE (PERSONA FÍSICA O REPRESENTANTE LEGAL DE LA PERSONA JURÍDICA"), 1, 0, "C", true);
$pdf->Ln();

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
  [
    "name" => utf8_decode("NACIONALIDAD"),
    "description" => utf8_decode(mb_strtoupper($pdf->usuarioR["persona"]["nacionalidad"]))
  ],
);

//set widht for each column (6 columns)
$pdf->SetWidths(array(80, 94));

//set line height
$pdf->SetLineHeight(5);
$pdf->SetFont("Nutmeg", "", 9);

$pdf->SetColors([[191, 191, 191], []]);

foreach ($dataPersonaSolicitante as $item) {
  // write data using Row() method containing array of values
  $pdf->Row(array(
    $item['name'],
    $item['description']
  ));
}

// Domicilio del solicitante
// Primer row de domicilio
// Array of dataDetalleDomicilioSolicitante
$dataDetalleDomicilioSolicitante = array(
  [
    "domicilio_representante" => utf8_decode(mb_strtoupper($pdf->domicilioRepresentante["calle"] . " " . $pdf->domicilioRepresentante["numero_exterior"] . " " . $pdf->domicilioRepresentante["numero_interior"])),
    "colonia_representante" => utf8_decode(mb_strtoupper($pdf->domicilioRepresentante["colonia"])),
    "codigo_postal_representante" => utf8_decode(mb_strtoupper($pdf->domicilioRepresentante["codigo_postal"])),
    "municipio_representante" => utf8_decode(mb_strtoupper($pdf->domicilioRepresentante["municipio"])),
    "estado_representante" => utf8_decode(mb_strtoupper($pdf->domicilioRepresentante["estado"])),
    "correo_representante" => utf8_decode(($pdf->usuarioR["persona"]["correo"])),
    "telefono_representante" => utf8_decode(mb_strtoupper($pdf->usuarioR["persona"]["telefono"])),
  ]
);

// add table heading using standard cells
$pdf->SetFillColor(191, 191, 191);
$pdf->SetFont("Nutmegb", "", 9);
$pdf->Cell(116, 5, utf8_decode("CALLE Y NÚMERO"), 1, 0, "C", true);
$pdf->Cell(58, 5, utf8_decode("COLONIA"), 1, 0, "C", true);
$pdf->Ln();

//set widht for each column (6 columns)
$pdf->SetWidths(array(116, 58));

//set line height
$pdf->SetLineHeight(5);
$pdf->SetColors([]);
$pdf->SetFont("Nutmeg", "", 9);

foreach ($dataDetalleDomicilioSolicitante as $item) {
  // write data using Row() method containing array of values
  $pdf->Row(array(
    $item['domicilio_representante'],
    $item['colonia_representante'],
  ));
}
if ($pdf->checkNewPage()) {
  $pdf->Ln(15);
  $pdf->SetFont("Nutmegb", "", 11);
  $pdf->SetTextColor(255, 255, 255);
  $pdf->SetFillColor(0, 127, 204);
  $pdf->Cell(140, 5, "", 0, 0, "L");
  $pdf->Cell(35, 6, "FDA02", 0, 0, "R", true);
  $pdf->SetTextColor(0, 0, 0);
  $pdf->Ln(15);
}
// Segunda row de domicilio
// add table heading using standard cells
$pdf->SetFillColor(191, 191, 191);
$pdf->SetFont("Nutmegb", "", 9);
$pdf->Cell(58, 5, utf8_decode("CÓDIGO POSTAL"), 1, 0, "C", true);
$pdf->Cell(58, 5, utf8_decode("DELEGACIÓN O MUNICIPIO"), 1, 0, "C", true);
$pdf->Cell(58, 5, utf8_decode("ENTIDAD FEDERATIVA"), 1, 0, "C", true);
$pdf->Ln();

//set widht for each column (6 columns)
$pdf->SetWidths(array(58, 58, 58));

//set line height
$pdf->SetLineHeight(5);
$pdf->SetFont("Nutmeg", "", 9);

foreach ($dataDetalleDomicilioSolicitante as $item) {
  // write data using Row() method containing array of values
  $pdf->Row(array(
    $item['codigo_postal_representante'],
    $item['municipio_representante'],
    $item['estado_representante'],
  ));
}

if ($pdf->checkNewPage()) {
  $pdf->Ln(15);
  $pdf->SetFont("Nutmegb", "", 11);
  $pdf->SetTextColor(255, 255, 255);
  $pdf->SetFillColor(0, 127, 204);
  $pdf->Cell(140, 5, "", 0, 0, "L");
  $pdf->Cell(35, 6, "FDA02", 0, 0, "R", true);
  $pdf->SetTextColor(0, 0, 0);
  $pdf->Ln(15);
}

// Tercer row de domicilio
// add table heading using standard cells
$pdf->SetFillColor(191, 191, 191);
$pdf->SetFont("Nutmegb", "", 9);
$pdf->Cell(116, 5, utf8_decode("CORREO ELECTRÓNICO"), 1, 0, "C", true);
$pdf->Cell(58, 5, utf8_decode("TELÉFONO"), 1, 0, "C", true);
$pdf->Ln();

//set widht for each column (6 columns)
$pdf->SetWidths(array(116, 58));

//set line height
$pdf->SetLineHeight(5);
$pdf->SetColors([]);
$pdf->SetFont("Nutmeg", "", 9);

foreach ($dataDetalleDomicilioSolicitante as $item) {
  // write data using Row() method containing array of values
  $pdf->Row(array(
    $item['correo_representante'],
    $item['telefono_representante'],
  ));
}
$pdf->Ln();


if ($pdf->checkNewPage()) {
  $pdf->Ln(15);
  $pdf->SetFont("Nutmegb", "", 11);
  $pdf->SetTextColor(255, 255, 255);
  $pdf->SetFillColor(0, 127, 204);
  $pdf->Cell(140, 5, "", 0, 0, "L");
  $pdf->Cell(35, 6, "FDA02", 0, 0, "R", true);
  $pdf->SetTextColor(0, 0, 0);
  $pdf->Ln(15);
}

$pdf->Ln();
$pdf->Ln();

//Datos de Rector
$pdf->getRector($_GET["id"]);

if ($pdf->checkNewPage()) {
  $pdf->Ln(15);
  $pdf->SetFont("Nutmegb", "", 11);
  $pdf->SetTextColor(255, 255, 255);
  $pdf->SetFillColor(0, 127, 204);
  $pdf->Cell(140, 5, "", 0, 0, "L");
  $pdf->Cell(35, 6, "FDA02", 0, 0, "R", true);
  $pdf->SetTextColor(0, 0, 0);
  $pdf->Ln(15);
}

$pdf->SetFont("Nutmegb", "", 9);
$pdf->SetFillColor(166, 166, 166);
$pdf->MultiCell(174, 5, utf8_decode("DATOS GENERALES DEL RECTOR"), 1, "C", true);
// Primer row de rector
$dataRector = array(
  [
    "nombre_rector" => utf8_decode(mb_strtoupper($pdf->rector["nombre"])),
    "apellido_paterno_rector" => utf8_decode(mb_strtoupper($pdf->rector["apellido_paterno"])),
    "apellido_materno_rector" => utf8_decode(mb_strtoupper($pdf->rector["apellido_materno"])),
    "correo_rector_institucional" => utf8_decode(($pdf->rector["correo"])),
    "correo_rector_personal" => utf8_decode(($pdf->rector["correo_secundario"])),
    "celular_rector" => utf8_decode(mb_strtoupper($pdf->rector["celular"])),
  ]
);

// add table heading using standard cells
$pdf->SetFillColor(191, 191, 191);
$pdf->SetFont("Nutmegb", "", 9);
$pdf->Cell(58, 5, utf8_decode("NOMBRE (S)"), 1, 0, "C", true);
$pdf->Cell(58, 5, utf8_decode("APELLIDO PATERNO"), 1, 0, "C", true);
$pdf->Cell(58, 5, utf8_decode("APELLIDO MATERNO"), 1, 0, "C", true);
$pdf->Ln();

//set widht for each column (6 columns)
$pdf->SetWidths(array(58, 58, 58));

//set line height
$pdf->SetLineHeight(5);
$pdf->SetColors([]);
$pdf->SetFont("Nutmeg", "", 9);

foreach ($dataRector as $item) {
  // write data using Row() method containing array of values
  $pdf->Row(array(
    $item['nombre_rector'],
    $item['apellido_paterno_rector'],
    $item['apellido_materno_rector'],
  ));
}


$pdf->SetFont("Nutmegb", "", 9);

// add table heading using standard cells
$pdf->SetFillColor(191, 191, 191);
$pdf->Cell(58, 5, utf8_decode("CORREO INSTITUCIONAL"), 1, 0, "C", true);
$pdf->Cell(58, 5, utf8_decode("CORREO PERSONAL"), 1, 0, "C", true);
$pdf->Cell(58, 5, utf8_decode("NÚMERO DE TELÉFONO CELULAR"), 1, 0, "C", true);
$pdf->Ln();

//set widht for each column (6 columns)
$pdf->SetWidths(array(58, 58, 58));

//set line height
$pdf->SetLineHeight(5);
$pdf->SetColors([]);
$pdf->SetFont("Nutmeg", "", 9);

foreach ($dataRector as $item) {
  // write data using Row() method containing array of values
  $pdf->Row(array(
    $item['correo_rector_institucional'],
    $item['correo_rector_personal'],
    $item['celular_rector'],
  ));
}
if ($pdf->formaciones1) {

  $pdf->Ln();
  $pdf->SetFont("Nutmegb", "", 9);
  $pdf->SetFillColor(166, 166, 166);
  $pdf->MultiCell(174, 5, utf8_decode("FORMACIÓN ACADÉMICA"), 1, "C", true);

  foreach ($pdf->formaciones1 as $key => $formacion) {

    if ($pdf->checkNewPage()) {
      $pdf->Ln(15);
      $pdf->SetFont("Nutmegb", "", 11);
      $pdf->SetTextColor(255, 255, 255);
      $pdf->SetFillColor(0, 127, 204);
      $pdf->Cell(140, 5, "", 0, 0, "L");
      $pdf->Cell(35, 6, "FDA02", 0, 0, "R", true);
      $pdf->SetTextColor(0, 0, 0);
      $pdf->Ln(15);
    }

    $dataFormacionesRector = array(
      [
        "nivel_formacion" => utf8_decode(mb_strtoupper($formacion["nivel"])),
        "nombre_formacion" => utf8_decode(mb_strtoupper($formacion["nombre"])),
        "institucion_formacion" => utf8_decode(mb_strtoupper($formacion["institucion"])),
        "documento_formacion" => utf8_decode(mb_strtoupper($formacion["descripcion"])),
      ]
    );

    // add table heading using standard cells
    $pdf->SetFont("Nutmegb", "", 9);
    $pdf->SetFillColor(191, 191, 191);
    $pdf->Cell(87, 5, utf8_decode("GRADO EDUCATIVO"), 1, 0, "C", true);
    $pdf->Cell(87, 5, utf8_decode("NOMBRE DE LOS ESTUDIOS"), 1, 0, "C", true);
    $pdf->Ln();

    //set widht for each column (6 columns)
    $pdf->SetWidths(array(87, 87));

    //set line height
    $pdf->SetLineHeight(5);
    $pdf->SetColors([]);
    $pdf->SetFont("Nutmeg", "", 9);

    foreach ($dataFormacionesRector as $item) {
      // write data using Row() method containing array of values
      $pdf->Row(array(
        $item['nivel_formacion'],
        $item['nombre_formacion'],
      ));
    }

    // add table heading using standard cells
    if ($pdf->checkNewPage()) {
      $pdf->Ln(15);
      $pdf->SetFont("Nutmegb", "", 11);
      $pdf->SetTextColor(255, 255, 255);
      $pdf->SetFillColor(0, 127, 204);
      $pdf->Cell(140, 5, "", 0, 0, "L");
      $pdf->Cell(35, 6, "FDA02", 0, 0, "R", true);
      $pdf->SetTextColor(0, 0, 0);
      $pdf->Ln(15);
    }
    $pdf->SetFillColor(191, 191, 191);
    $y = $pdf->GetY();
    $x = $pdf->GetX();
    $pdf->SetFont("Nutmegb", "", 9);
    $pdf->MultiCell(87, 5, utf8_decode("NOMBRE DE LA INSTITUCIÓN EDUCATIVA DE PROCEDENCIA"), 1, "C", true);
    $pdf->SetXY($x + 87, $y);
    $pdf->MultiCell(87, 10, utf8_decode("DOCUMENTO QUE ACREDITA SUS ESTUDIOS"), 1, "C", true);

    //set widht for each column (6 columns)
    $pdf->SetWidths(array(87, 87));

    //set line height
    $pdf->SetLineHeight(5);
    $pdf->SetColors([]);
    $pdf->SetFont("Nutmeg", "", 9);

    foreach ($dataFormacionesRector as $item) {
      // write data using Row() method containing array of values
      $pdf->Row(array(
        $item['institucion_formacion'],
        $item['documento_formacion'],
      ));
    }


    if (sizeof($pdf->formaciones1) > $key + 1) {
      $pdf->SetFillColor(166, 166, 166);
      $pdf->Cell(174, 5, "", 1, 1, "C", true);
    }
  }
}

$pdf->Ln(10);

//Datos de Director
$pdf->getDirector($_GET["id"]);

if ($pdf->checkNewPage()) {
  $pdf->Ln(15);
  $pdf->SetFont("Nutmegb", "", 11);
  $pdf->SetTextColor(255, 255, 255);
  $pdf->SetFillColor(0, 127, 204);
  $pdf->Cell(140, 5, "", 0, 0, "L");
  $pdf->Cell(35, 6, "FDA02", 0, 0, "R", true);
  $pdf->SetTextColor(0, 0, 0);
  $pdf->Ln(15);
}

$pdf->SetFont("Nutmegb", "", 9);
$pdf->SetFillColor(166, 166, 166);
$pdf->MultiCell(174, 5, utf8_decode("DATOS GENERALES DEL DIRECTOR"), 1, "C", true);
// Primer row de director
$dataDirector = array(
  [
    "nombre_director" => utf8_decode(mb_strtoupper($pdf->director["nombre"])),
    "apellido_paterno_director" => utf8_decode(mb_strtoupper($pdf->director["apellido_paterno"])),
    "apellido_materno_director" => utf8_decode(mb_strtoupper($pdf->director["apellido_materno"])),
    "correo_director_institucional" => utf8_decode(($pdf->director["correo"])),
    "correo_director_personal" => utf8_decode(($pdf->director["correo_secundario"])),
    "celular_director" => utf8_decode(mb_strtoupper($pdf->director["celular"])),
  ]
);

// add table heading using standard cells
$pdf->SetFillColor(191, 191, 191);
$pdf->SetFont("Nutmegb", "", 9);
$pdf->Cell(58, 5, utf8_decode("NOMBRE (S)"), 1, 0, "C", true);
$pdf->Cell(58, 5, utf8_decode("APELLIDO PATERNO"), 1, 0, "C", true);
$pdf->Cell(58, 5, utf8_decode("APELLIDO MATERNO"), 1, 0, "C", true);
$pdf->Ln();

//set widht for each column (6 columns)
$pdf->SetWidths(array(58, 58, 58));

//set line height
$pdf->SetLineHeight(5);
$pdf->SetColors([]);
$pdf->SetFont("Nutmeg", "", 9);

foreach ($dataDirector as $item) {
  // write data using Row() method containing array of values
  $pdf->Row(array(
    $item['nombre_director'],
    $item['apellido_paterno_director'],
    $item['apellido_materno_director'],
  ));
}


$pdf->SetFont("Nutmegb", "", 9);

// add table heading using standard cells
$pdf->SetFillColor(191, 191, 191);
$pdf->Cell(58, 5, utf8_decode("CORREO INSTITUCIONAL"), 1, 0, "C", true);
$pdf->Cell(58, 5, utf8_decode("CORREO PERSONAL"), 1, 0, "C", true);
$pdf->Cell(58, 5, utf8_decode("NÚMERO DE TELÉFONO CELULAR"), 1, 0, "C", true);
$pdf->Ln();

//set widht for each column (6 columns)
$pdf->SetWidths(array(58, 58, 58));

//set line height
$pdf->SetLineHeight(5);
$pdf->SetColors([]);
$pdf->SetFont("Nutmeg", "", 9);

foreach ($dataDirector as $item) {
  // write data using Row() method containing array of values
  $pdf->Row(array(
    $item['correo_director_institucional'],
    $item['correo_director_personal'],
    $item['celular_director'],
  ));
}

if ($pdf->formaciones2) {

  $pdf->Ln();
  $pdf->SetFont("Nutmegb", "", 9);
  $pdf->SetFillColor(166, 166, 166);
  $pdf->MultiCell(174, 5, utf8_decode("FORMACIÓN ACADÉMICA"), 1, "C", true);

  foreach ($pdf->formaciones2 as $key => $formacion) {

    if ($pdf->checkNewPage()) {
      $pdf->Ln(15);
      $pdf->SetFont("Nutmegb", "", 11);
      $pdf->SetTextColor(255, 255, 255);
      $pdf->SetFillColor(0, 127, 204);
      $pdf->Cell(140, 5, "", 0, 0, "L");
      $pdf->Cell(35, 6, "FDA02", 0, 0, "R", true);
      $pdf->SetTextColor(0, 0, 0);
      $pdf->Ln(15);
    }

    $dataFormacionesDirector = array(
      [
        "nivel_formacion" => utf8_decode(mb_strtoupper($formacion["nivel"])),
        "nombre_formacion" => utf8_decode(mb_strtoupper($formacion["nombre"])),
        "institucion_formacion" => utf8_decode(mb_strtoupper($formacion["institucion"])),
        "documento_formacion" => utf8_decode(mb_strtoupper($formacion["descripcion"])),
      ]
    );

    // add table heading using standard cells
    $pdf->SetFont("Nutmegb", "", 9);
    $pdf->SetFillColor(191, 191, 191);
    $pdf->Cell(87, 5, utf8_decode("GRADO EDUCATIVO"), 1, 0, "C", true);
    $pdf->Cell(87, 5, utf8_decode("NOMBRE DE LOS ESTUDIOS"), 1, 0, "C", true);
    $pdf->Ln();

    //set widht for each column (6 columns)
    $pdf->SetWidths(array(87, 87));

    //set line height
    $pdf->SetLineHeight(5);
    $pdf->SetColors([]);
    $pdf->SetFont("Nutmeg", "", 9);

    foreach ($dataFormacionesDirector as $item) {
      // write data using Row() method containing array of values
      $pdf->Row(array(
        $item['nivel_formacion'],
        $item['nombre_formacion'],
      ));
    }

    // add table heading using standard cells
    if ($pdf->checkNewPage()) {
      $pdf->Ln(15);
      $pdf->SetFont("Nutmegb", "", 11);
      $pdf->SetTextColor(255, 255, 255);
      $pdf->SetFillColor(0, 127, 204);
      $pdf->Cell(140, 5, "", 0, 0, "L");
      $pdf->Cell(35, 6, "FDA02", 0, 0, "R", true);
      $pdf->SetTextColor(0, 0, 0);
      $pdf->Ln(15);
    }
    $pdf->SetFillColor(191, 191, 191);
    $y = $pdf->GetY();
    $x = $pdf->GetX();
    $pdf->SetFont("Nutmegb", "", 9);
    $pdf->MultiCell(87, 5, utf8_decode("NOMBRE DE LA INSTITUCIÓN EDUCATIVA DE PROCEDENCIA"), 1, "C", true);
    $pdf->SetXY($x + 87, $y);
    $pdf->MultiCell(87, 10, utf8_decode("DOCUMENTO QUE ACREDITA SUS ESTUDIOS"), 1, "C", true);

    //set widht for each column (6 columns)
    $pdf->SetWidths(array(87, 87));

    //set line height
    $pdf->SetLineHeight(5);
    $pdf->SetColors([]);
    $pdf->SetFont("Nutmeg", "", 9);

    foreach ($dataFormacionesDirector as $item) {
      // write data using Row() method containing array of values
      $pdf->Row(array(
        $item['institucion_formacion'],
        $item['documento_formacion'],
      ));
    }


    if (sizeof($pdf->formaciones2) > $key + 1) {
      $pdf->SetFillColor(166, 166, 166);
      $pdf->Cell(174, 5, "", 1, 1, "C", true);
    }
  }
}

$pdf->Ln(10);

if ($pdf->checkNewPage()) {
  $pdf->Ln(15);
  $pdf->SetFont("Nutmegb", "", 11);
  $pdf->SetTextColor(255, 255, 255);
  $pdf->SetFillColor(0, 127, 204);
  $pdf->Cell(140, 5, "", 0, 0, "L");
  $pdf->Cell(35, 6, "FDA02", 0, 0, "R", true);
  $pdf->SetTextColor(0, 0, 0);
  $pdf->Ln(15);
}

//Diligencias
//Datos del o los diligentes
$pdf->SetFont("Nutmegb", "", 9);
$pdf->SetFillColor(166, 166, 166);
$pdf->MultiCell(174, 5, utf8_decode("PERSONAL DESIGNADO PARA REALIZAR LAS DILIGENCIAS PARA EL DESARROLLO Y SEGUIMIENTO DE LA SOLICITUD DE RVOE"), 1, "C", true);
foreach ($pdf->nombresDiligencias as $key => $diligencia) {

  if ($pdf->checkNewPage()) {
    $pdf->Ln(15);
    $pdf->SetFont("Nutmegb", "", 11);
    $pdf->SetTextColor(255, 255, 255);
    $pdf->SetFillColor(0, 127, 204);
    $pdf->Cell(140, 5, "", 0, 0, "L");
    $pdf->Cell(35, 6, "FDA02", 0, 0, "R", true);
    $pdf->SetTextColor(0, 0, 0);
    $pdf->Ln(15);
  }

  $dataDiligencias = array(
    [
      "name" => utf8_decode("NOMBRE COMPLETO"),
      "description" => utf8_decode(mb_strtoupper($diligencia["nombre"]))
    ],
    [
      "name" => utf8_decode("CARGO"),
      "description" => utf8_decode(mb_strtoupper($diligencia["cargo"]))
    ],
    [
      "name" => utf8_decode("NÚMERO TELEFÓNICO"),
      "description" => utf8_decode(mb_strtoupper($diligencia["telefono"] . ", " . $diligencia["celular"]))
    ],
    [
      "name" => utf8_decode("CORREO ELECTRÓNICO"),
      "description" => utf8_decode(($diligencia["correo"]))
    ],
    [
      "name" => utf8_decode("HORARIO DE ATENCIÓN"),
      "description" => utf8_decode(mb_strtoupper($diligencia["horario"]))
    ],
  );

  //set widht for each column (6 columns)
  $pdf->SetWidths(array(80, 94));

  //set line height
  $pdf->SetLineHeight(5);
  $pdf->SetFont("Nutmeg", "", 9);

  $pdf->SetColors([[191, 191, 191], []]);

  foreach ($dataDiligencias as $item) {
    // write data using Row() method containing array of values
    $pdf->Row(array(
      $item['name'],
      $item['description']
    ));
  }

  if (sizeof($pdf->nombresDiligencias) > $key + 1) {
    $pdf->SetFillColor(166, 166, 166);
    $pdf->Cell(174, 5, "", 1, 1, "C", true);
  }
}
$pdf->Ln(10);

if ($pdf->checkNewPage()) {
  $pdf->Ln(15);
  $pdf->SetFont("Nutmegb", "", 11);
  $pdf->SetTextColor(255, 255, 255);
  $pdf->SetFillColor(0, 127, 204);
  $pdf->Cell(140, 5, "", 0, 0, "L");
  $pdf->Cell(35, 6, "FDA02", 0, 0, "R", true);
  $pdf->SetTextColor(0, 0, 0);
  $pdf->Ln(15);
}
//Ratificación de nombre autorizado
if (!$pdf->institucion["es_nombre_autorizado"]) {

  //Datos de la propuesta de nombres
  $pdf->SetFont("Nutmegb", "", 9);
  $pdf->SetFillColor(166, 166, 166);
  $pdf->MultiCell(174, 5, utf8_decode("NOMBRES PROPUESTOS PARA LA INSTITUCIÓN EDUCATIVA"), 1, "C", true);

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
} else {

  //Datos del nombre autorizado
  $pdf->SetFont("Nutmegb", "", 9);
  $pdf->SetFillColor(166, 166, 166);
  $pdf->MultiCell(174, 5, utf8_decode("RATIFICACIÓN DE NOMBRE"), 1, "C", true);

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

$pdf->Ln(25);
$pdf->SetFont("Nutmeg", "", 11);
$pdf->Cell(0, 5, utf8_decode("BAJO PROTESTA DE DECIR VERDAD"), 0, 1, "C");
$pdf->SetFont("Nutmegb", "", 11);
$pdf->Cell(0, 5, utf8_decode(mb_strtoupper($pdf->nombreRepresentante)), 0, 1, "C");

$pdf->Output("I", "FDA02.pdf");
