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

// make new object
$pdf = new PDF();

$pdf->getData($_GET["id"]);
$pdf->getDataPlantel($pdf->plantel["id"]);
$pdf->AliasNbPages();

$pdf->AddPage("P", "Letter");
$pdf->SetMargins(20, 20, 20);

// Nombre del formato
$pdf->SetFont("Nutmegb", "", 11);
$pdf->Ln(25);
$x = $pdf->SetX(20);
$y = $pdf->SetY(35);
$pdf->SetTextColor(255, 255, 255);
$pdf->SetFillColor(0, 127, 204);
$pdf->Cell(140, 5, "", 0, 0, "L");

$pdf->Cell(35, 6, "FDA04", 0, 0, "R", true);
$pdf->Ln(10);

$pdf->SetTextColor(0, 127, 204);
$pdf->Cell(0, 5, utf8_decode("DESCRIPCIÓN DE LAS INSTALACIONES"), 0, 1, "L");
$pdf->Ln(5);
$pdf->SetTextColor(0, 0, 0);
// Fecha
$pdf->SetFont("Nutmeg", "", 9);
$fecha =  $pdf->fecha;
$pdf->Cell(0, 5, utf8_decode(mb_strtoupper("$fecha")), 0, 1, "R");
$pdf->Ln(5);

//Datos del plan de estudios
$pdf->SetFont("Nutmegb", "", 9);
$pdf->SetFillColor(166, 166, 166);
$pdf->Cell(174, 5, utf8_decode("1. DATOS DEL PLAN DE ESTUDIOS"), 1, 0, "C", true);
$pdf->Ln();
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
    [
      "name" => utf8_decode("NOMBRE COMPLETO DE LA PERSONA FÍSICA O JURIDICA"),
      "description" => utf8_decode(mb_strtoupper($pdf->nombreRepresentante))
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
    [
      "name" => utf8_decode("NOMBRE COMPLETO DE LA PERSONA FÍSICA O JURIDICA"),
      "description" => utf8_decode(mb_strtoupper($pdf->nombreRepresentante))
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

// Tabla de domicilio de la institucion
// Domicilio de la instituciones
$pdf->SetFillColor(166, 166, 166);
$pdf->SetFont("Nutmegb", "", 9);
$pdf->Cell(174, 5, utf8_decode("2. DOMICILIO DE LA INSTITUCIÓN"), 1, 1, "C", true);

$dataDetalleDomicilioInstitucion = array(
  [
    "calle_institucion" => utf8_decode(mb_strtoupper($pdf->domicilioPlantel["calle"] . " " . $pdf->domicilioPlantel["numero_exterior"] . " " . $pdf->domicilioPlantel["numero_interior"])),
    "colonia_institucion" => utf8_decode(mb_strtoupper($pdf->domicilioPlantel["colonia"])),
    "codigo_postal_institucion" => utf8_decode(mb_strtoupper($pdf->domicilioPlantel["codigo_postal"])),
    "municipio_institucion" => utf8_decode(mb_strtoupper($pdf->domicilioPlantel["municipio"])),
    "estado_institucion" => utf8_decode(mb_strtoupper($pdf->domicilioPlantel["estado"])),
    "telefono_institucion" => utf8_decode($pdf->plantel["telefono1"] . ",\n" . $pdf->plantel["telefono2"] . ",\n" . $pdf->plantel["telefono3"]),
    "redes_sociales_institucion" => utf8_decode($pdf->plantel["redes_sociales"]),
    "correo_institucion" => utf8_decode($pdf->plantel["email1"] . ",\n" . $pdf->plantel["email2"] . ",\n" . $pdf->plantel["email3"]),

  ]
);

$pdf->SetFillColor(191, 191, 191);
$pdf->Cell(116, 5, utf8_decode("CALLE Y NÚMERO"), 1, 0, "C", true);
$pdf->Cell(58, 5, utf8_decode("COLONIA"), 1, 0, "C", true);
$pdf->Ln();

//set widht for each column (6 columns)
$pdf->SetWidths(array(116, 58));

//set line height
$pdf->SetLineHeight(5);
$pdf->SetColors([]);
$pdf->SetFont("Nutmeg", "", 9);

foreach ($dataDetalleDomicilioInstitucion as $item) {
  // write data using Row() method containing array of values
  $pdf->Row(array(
    $item['calle_institucion'],
    $item['colonia_institucion']
  ));
}

// Sergundo row de domicilio
// add table heading using standard cells
$pdf->SetFont("Nutmegb", "", 9);
$pdf->SetFillColor(191, 191, 191);
$pdf->Cell(58, 5, utf8_decode("CÓDIGO POSTAL"), 1, 0, "C", true);
$pdf->Cell(58, 5, utf8_decode("DELEGACIÓN O MUNICIPIO"), 1, 0, "C", true);
$pdf->Cell(58, 5, utf8_decode("ENTIDAD FEDERATIVA"), 1, 0, "C", true);
$pdf->Ln();

//set widht for each column (6 columns)
$pdf->SetWidths(array(58, 58, 58));

//set line height
$pdf->SetLineHeight(5);
$pdf->SetFont("Nutmeg", "", 9);

foreach ($dataDetalleDomicilioInstitucion as $item) {
  // write data using Row() method containing array of values
  $pdf->Row(array(
    $item['codigo_postal_institucion'],
    $item['municipio_institucion'],
    $item['estado_institucion']
  ));
}


// Tercer row de domicilio
// add table heading using standard cells
$pdf->SetFont("Nutmegb", "", 9);
$pdf->SetFillColor(191, 191, 191);
$pdf->Cell(58, 5, utf8_decode("NÚMERO TELEFÓNICO"), 1, 0, "C", true);
$pdf->Cell(58, 5, utf8_decode("REDES SOCIALES"), 1, 0, "C", true);
$pdf->Cell(58, 5, utf8_decode("CORREO ELECTRÓNICO"), 1, 0, "C", true);
$pdf->Ln();

//set widht for each column (6 columns)
$pdf->SetWidths(array(58, 58, 58));

//set line height
$pdf->SetLineHeight(5);
$pdf->SetFont("Nutmeg", "", 9);

foreach ($dataDetalleDomicilioInstitucion as $item) {
  // write data using Row() method containing array of values
  $pdf->Row(array(
    $item['telefono_institucion'],
    $item['redes_sociales_institucion'],
    $item['correo_institucion'],
  ));
}

$pdf->Ln();
$pdf->Ln();

if ($pdf->checkNewPage()) {
  $pdf->Ln(15);
  $pdf->SetFont("Nutmegb", "", 11);
  $pdf->SetTextColor(255, 255, 255);
  $pdf->SetFillColor(0, 127, 204);
  $pdf->Cell(140, 5, "", 0, 0, "L");
  $pdf->Cell(35, 6, "FDA04", 0, 0, "R", true);
  $pdf->SetTextColor(0, 0, 0);
  $pdf->Ln(15);
}


// Tabla de encabezado Datos de caracteristiacas del inmueble
// Dictamenes expedidos para el plantel
$pdf->SetFillColor(166, 166, 166);
$pdf->SetFont("Nutmegb", "", 9);
$pdf->Cell(174, 5, utf8_decode("3. DESCRIPCIÓN DEL PLANTEL"), 1, 1, "C", true);
$pdf->Ln();


$sizeCell = 60;
$dataInmueble = [];
$dataInmueble = array(["description" => utf8_decode(mb_strtoupper($pdf->plantel["caracteristica_inmueble"]))]);

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
$pdf->Cell($sizeCell, 5, "CARACTERISTICAS DEL INMUEBLE", 1, 0, "C", true);
$pdf->Ln();

$pdf->SetFont("Nutmeg", "", 9);
foreach ($dataInmueble as $item) {
  // write data using Row() method containing array of values
  $pdf->Row(array(
    $item['description']
  ));
}


// Tabla de encabezado Datos del edificio
$dataEdificio = [];
foreach ($pdf->edificioNiveles as $nivel) {
  array_push($dataEdificio, array("description" => utf8_decode(mb_strtoupper($nivel["nivel"]))));
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
$pdf->Cell($sizeCell, 5, "EDIFICIOS Y/O NIVELES", 1, 0, "C", true);
$pdf->Ln();

$pdf->SetFont("Nutmeg", "", 9);
foreach ($dataEdificio as $item) {
  $pdf->SetX($x + $pdf->GetX());
  // write data using Row() method containing array of values
  $pdf->Row(array(
    $item['description']
  ));
}

$pdf->Ln();
$pdf->Ln();

if ($pdf->checkNewPage()) {
  $pdf->Ln(15);
  $pdf->SetFont("Nutmegb", "", 11);
  $pdf->SetTextColor(255, 255, 255);
  $pdf->SetFillColor(0, 127, 204);
  $pdf->Cell(140, 5, "", 0, 0, "L");
  $pdf->Cell(35, 6, "FDA04", 0, 0, "R", true);
  $pdf->SetTextColor(0, 0, 0);
  $pdf->Ln(15);
}

// Seguridad
// Sistemas de seguridad
$pdf->SetFillColor(166, 166, 166);
$pdf->SetFont("Nutmegb", "", 9);
$pdf->Cell(146, 5, utf8_decode("SISTEMA DE SEGURIDAD"), 1, 1, "C", true);

$pdf->SetFillColor(191, 191, 191);
$pdf->Cell(88, 5, utf8_decode("DESCRIPCIÓN"), 1, 0, "C", true);
$pdf->Cell(58, 5, utf8_decode("CANTIDAD"), 1, 0, "C", true);
$pdf->Ln();

foreach ($pdf->seguridadSistemas as $key => $seguridad) {

  $dataSistema = array(
    [
      "sistema_seguridad" => utf8_decode(mb_strtoupper($seguridad["sistema"])),
      "cantidad_seguridad" => utf8_decode(mb_strtoupper($seguridad["cantidad"])),
    ]
  );

  //set widht for each column (6 columns)
  $pdf->SetWidths(array(88, 58));

  //set line height
  $pdf->SetLineHeight(5);
  $pdf->SetColors([]);
  $pdf->SetFont("Nutmeg", "", 9);

  foreach ($dataSistema as $item) {
    // write data using Row() method containing array of values
    $pdf->Row(array(
      $item['sistema_seguridad'],
      $item['cantidad_seguridad'],
    ));
  }
}


if ($pdf->checkNewPage()) {
  $pdf->Ln(15);
  $pdf->SetFont("Nutmegb", "", 11);
  $pdf->SetTextColor(255, 255, 255);
  $pdf->SetFillColor(0, 127, 204);
  $pdf->Cell(140, 5, "", 0, 0, "L");
  $pdf->Cell(35, 6, "FDA04", 0, 0, "R", true);
  $pdf->SetTextColor(0, 0, 0);
  $pdf->Ln(15);
}

// Higiene
// Higiene del plantel
$pdf->SetFillColor(166, 166, 166);
$pdf->SetFont("Nutmegb", "", 9);
$pdf->Cell(174, 5, utf8_decode("4. HIGIENE DEL PLANTEL"), 1, 1, "C", true);

$pdf->SetFillColor(191, 191, 191);
$pdf->Cell(116, 5, utf8_decode("DESCRIPCIÓN"), 1, 0, "C", true);
$pdf->Cell(58, 5, utf8_decode("CANTIDAD"), 1, 0, "C", true);
$pdf->Ln();

foreach ($pdf->higienes as $key => $higiene) {

  $dataHigiene = array(
    [
      "descripcion_higiene" => utf8_decode(mb_strtoupper($higiene["higiene"])),
      "cantidad_higiene" => utf8_decode(mb_strtoupper($higiene["cantidad"])),
    ]
  );

  //set widht for each column (6 columns)
  $pdf->SetWidths(array(116, 58));

  //set line height
  $pdf->SetLineHeight(5);
  $pdf->SetColors([]);
  $pdf->SetFont("Nutmeg", "", 9);

  foreach ($dataHigiene as $item) {
    // write data using Row() method containing array of values
    $pdf->Row(array(
      $item['descripcion_higiene'],
      $item['cantidad_higiene'],
    ));
  }
}

if ($pdf->checkNewPage()) {
  $pdf->Ln(15);
  $pdf->SetFont("Nutmegb", "", 11);
  $pdf->SetTextColor(255, 255, 255);
  $pdf->SetFillColor(0, 127, 204);
  $pdf->Cell(140, 5, "", 0, 0, "L");
  $pdf->Cell(35, 6, "FDA04", 0, 0, "R", true);
  $pdf->SetTextColor(0, 0, 0);
  $pdf->Ln(15);
}

$pdf->Ln();

// Infraestructura del plantel
$pdf->SetFillColor(166, 166, 166);
$pdf->SetFont("Nutmegb", "", 9);
$pdf->Cell(175, 5, utf8_decode("5. INFRAESTRUCTURA PARA EL PROGRAMA"), 1, 1, "C", true);
$pdf->SetFillColor(191, 191, 191);
$pdf->SetFont("Nutmeg", "", 9);
$pdf->Cell(175, 5, utf8_decode("ESPACIOS Y EQUIPAMIENTO"), 1, 1, "C", true);

$pdf->SetFillColor(191, 191, 191);

$pdf->SetFont("Nutmeg", "", 9);
$y = $pdf->GetY();
$x = $pdf->GetX();
$pdf->MultiCell(38, 10, utf8_decode("INSTALACIONES"), 1, "C", true);
$pdf->SetXY($x + 38, $y);
$y = $pdf->GetY();
$x = $pdf->GetX();
$pdf->MultiCell(25, 5, utf8_decode("CAPACIDAD PROMEDIO"), 1, "C", true);
$pdf->SetXY($x + 25, $y);
$y = $pdf->GetY();
$x = $pdf->GetX();
$pdf->MultiCell(18, 10, utf8_decode("METROS"), 1, "C", true);
$pdf->SetXY($x + 18, $y);
$y = $pdf->GetY();
$x = $pdf->GetX();
$pdf->MultiCell(40, 5, utf8_decode("RECURSOS MATERIALES"), 1, "C", true);
$pdf->SetXY($x + 40, $y);
$y = $pdf->GetY();
$x = $pdf->GetX();
$pdf->MultiCell(23, 10, utf8_decode("UBICACION"), 1, "C", true);
$pdf->SetXY($x + 23, $y);
$y = $pdf->GetY();
$x = $pdf->GetX();
$pdf->MultiCell(31, 5, utf8_decode("ASIGNATURAS QUE ATIENDE"), 1, "C", true);

$pdf->SetFont("Nutmegbk", "", 8);
foreach ($pdf->tiposInstalacion as $key => $instalacion) {

  $dataInstalacion = array(
    [
      "tipo_instalacion" => utf8_decode(mb_strtoupper($instalacion["instalacion"])),
      "capacidad_instalacion" => utf8_decode(mb_strtoupper($instalacion["capacidad"])),
      "metros_instalacion" => utf8_decode(mb_strtoupper($instalacion["metros"])),
      "recursos_instalacion" => utf8_decode(mb_strtoupper($instalacion["recursos"])),
      "ubicacion_instalacion" => utf8_decode(mb_strtoupper($instalacion["ubicacion"])),
      "asignaturas_instalacion" => utf8_decode(mb_strtoupper($instalacion["asignaturas"])),
    ]
  );

  //set widht for each column (6 columns)
  $pdf->SetWidths(array(38, 25, 18, 40, 23, 31));

  //set line height
  $pdf->SetLineHeight(5);
  $pdf->SetColors([]);
  $pdf->SetFont("Nutmegbk", "", 8);

  foreach ($dataInstalacion as $item) {
    // write data using Row() method containing array of values
    $pdf->Row(array(
      $item['tipo_instalacion'],
      $item['capacidad_instalacion'],
      $item['metros_instalacion'],
      $item['recursos_instalacion'],
      $item['ubicacion_instalacion'],
      $item['asignaturas_instalacion'],
    ));

    if ($pdf->checkNewPage()) {
      $pdf->Ln(15);
      $pdf->SetFont("Nutmegb", "", 11);
      $pdf->SetTextColor(255, 255, 255);
      $pdf->SetFillColor(0, 127, 204);
      $pdf->Cell(140, 5, "", 0, 0, "L");
      $pdf->Cell(35, 6, "FDA04", 0, 0, "R", true);
      $pdf->SetTextColor(0, 0, 0);
      $pdf->Ln(15);
    }
  }
}

if ($pdf->checkNewPage()) {
  $pdf->Ln(15);
  $pdf->SetFont("Nutmegb", "", 11);
  $pdf->SetTextColor(255, 255, 255);
  $pdf->SetFillColor(0, 127, 204);
  $pdf->Cell(140, 5, "", 0, 0, "L");
  $pdf->Cell(35, 6, "FDA04", 0, 0, "R", true);
  $pdf->SetTextColor(0, 0, 0);
  $pdf->Ln(15);
}

$pdf->Ln();
$pdf->Ln();


// Instituciones de salud aledañas
$pdf->SetFillColor(166, 166, 166);
$pdf->SetFont("Nutmegb", "", 9);
$pdf->MultiCell(174, 5, utf8_decode("6. RELACIÓN DE INSTITUCIONES DE SALUD ALEDAÑAS, SERVICIOS DE AMBULANCIA U OTROS SERVICIOS DE EMERGENCIA A LOS CUALES RECURRIRÁ LA INSTITUCIÓN EN CASO DE ALGUNA CONTINGENCIA"), 1, "C", true);

if ($pdf->checkNewPage()) {
  // Nombre del formato
  $pdf->SetFont("Nutmegb", "", 9);
  $pdf->Ln(10);
  $pdf->SetTextColor(255, 255, 255);
  $pdf->SetFillColor(0, 127, 204);
  $pdf->Cell(140, 5, "", 0, 0, "L");
  $pdf->Cell(35, 6, "FDA04", 0, 0, "R", true);
  $pdf->Ln(10);
  $pdf->SetTextColor(0, 0, 0);
}

$y = $pdf->GetY();
$x = $pdf->GetX();
$pdf->SetFillColor(191, 191, 191);
$pdf->MultiCell(96, 10, utf8_decode("NOMBRE DE LA INSTITUCIÓN"), 1, "C", true);
$pdf->SetXY($x + 96, $y);
$pdf->MultiCell(78, 5, utf8_decode("TIEMPO APROXIMADO REQUERIDO PARA LLEGAR A LA ESCUELA EN MINUTOS"), 1, "C", true);

foreach ($pdf->salud as $key => $salud) {
    $dataAledanas = array(
      [
        "nombre_salud" => utf8_decode(mb_strtoupper($salud["nombre"])),
        "tiempo_salud" => utf8_decode(mb_strtoupper($salud["tiempo"])),
      ]
    );
 
  if ($pdf->checkNewPage()) {
    // Nombre del formato
    $pdf->SetFont("Nutmegb", "", 11);
    $pdf->Ln(10);
    $pdf->SetTextColor(255, 255, 255);
    $pdf->SetFillColor(0, 127, 204);
    $pdf->Cell(140, 5, "", 0, 0, "L");
    $pdf->Cell(35, 6, "FDA04", 0, 0, "R", true);
    $pdf->Ln(10);
    $pdf->SetTextColor(0, 0, 0);
  }

  //set widht for each column (6 columns)
  $pdf->SetWidths(array(96, 78));

  //set line height
  $pdf->SetLineHeight(5);
  $pdf->SetColors([]);
  $pdf->SetFont("Nutmeg", "", 9);

  foreach ($dataAledanas as $item) {
    // write data using Row() method containing array of values
    $pdf->Row(array(
      $item['nombre_salud'],
      $item['tiempo_salud'],
    ));

    if ($pdf->checkNewPage()) {
      $pdf->Ln(15);
      $pdf->SetFont("Nutmegb", "", 11);
      $pdf->SetTextColor(255, 255, 255);
      $pdf->SetFillColor(0, 127, 204);
      $pdf->Cell(140, 5, "", 0, 0, "L");
      $pdf->Cell(35, 6, "FDA04", 0, 0, "R", true);
      $pdf->SetTextColor(0, 0, 0);
      $pdf->Ln(15);
    }  }
}

$pdf->Ln(30);

$pdf->SetTextColor(0, 0, 0);
$pdf->SetFont("Nutmeg", "", 11);
$pdf->Cell(0, 5, utf8_decode("BAJO PROTESTA DE DECIR VERDAD"), 0, 1, "C");
$pdf->SetFont("Nutmegb", "", 11);
$pdf->Cell(0, 5, utf8_decode(mb_strtoupper($pdf->nombreRepresentante)), 0, 1, "C");


$pdf->Output("I", "FDA04.pdf");