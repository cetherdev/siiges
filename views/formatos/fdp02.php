<?php
require("pdf.php");
require_once "../../models/modelo-solicitud.php";
require_once "../../models/modelo-ciclo.php";

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

$pdf->Cell(35, 6, "FDP02", 0, 0, "R", true);
$pdf->Ln(10);

$pdf->SetTextColor(0, 127, 204);
$pdf->Cell(0, 5, utf8_decode("PLAN DE ESTUDIOS"), 0, 1, "L");
$pdf->Ln(5);
$pdf->SetTextColor(0, 0, 0);

$pdf->getCoordinador();
$pdf->getAsignaturas();

$programa = $pdf->nivel["descripcion"] . " en " . $pdf->programa["nombre"];
$modalidad = $pdf->modalidad["nombre"];
$periodo = $pdf->ciclo["nombre"];

// Asignaturas por academia
$asignaturaAcademias = [];
$asignaturaGrados = [];
$asignaturaArea = [];
//print_r($pdf->TodasAsignaturas);
foreach ($pdf->TodasAsignaturas as $key => $asignatura) {
  if (
    isset($asignaturaAcademias[$asignatura["academia"]]) &&
    is_string($asignaturaAcademias[$asignatura["academia"]])
  ) {
    $asignaturaAcademias[$asignatura["academia"]] .= ", " . $asignatura["nombre"];
  } else {
    $asignaturaAcademias[$asignatura["academia"]] = $asignatura["nombre"];
  }
  // Asignaturas por Grado
  if (!isset($asignaturaGrados[$asignatura["grado"]])) {
    $asignaturaGrados[$asignatura["grado"]] = [];
  }
  array_push($asignaturaGrados[$asignatura["grado"]], $asignatura);

  // Asignaturas por Área
  if (!isset($asignaturaArea[$asignatura["area"]])) {
    $asignaturaArea[$asignatura["area"]] = [];
  }
  array_push($asignaturaArea[$asignatura["area"]], $asignatura);
}

$pdf->SetFont("Nutmeg", "", 10);

if ($pdf->nombreInstitucion) {
  $pdf->Cell(0, 5, utf8_decode(mb_strtoupper($pdf->nombreInstitucion)), 0, 1, "C");
} else if ($pdf->nombrePropuesto) {
  $pdf->Cell(0, 5, utf8_decode(mb_strtoupper($pdf->nombrePropuesto["nombre_propuesto1"])), 0, 1, "C");
}
$pdf->Cell(0, 5, utf8_decode(mb_strtoupper($programa)), 0, 1, "C");
$pdf->Ln(10);

$pdf->Cell(0, 5, utf8_decode(mb_strtoupper($pdf->coordinador["nombre"] . " " . $pdf->coordinador["apellido_paterno"] . " " . $pdf->coordinador["apellido_materno"])), 0, 1, "C");
$pdf->Cell(50, 5, "", 0, 0, "C");
$pdf->Cell(70, 5, utf8_decode(mb_strtoupper("Coordinador(a) - " . $pdf->coordinador["titulo_cargo"])), "T", 1, "C");
$pdf->Ln(5);

//Ciclo
$ciclo = new Ciclo();
$ciclo->setAttributes(["id" => $pdf->programa["ciclo_id"]]);
$ciclo = $ciclo->consultarId();
$ciclo = !empty($ciclo["data"]) ? $ciclo["data"] : false;
if (!$ciclo) {
  $_SESSION["resultado"] = json_encode(["status" => "404", "message" => "Ciclo no encontrado.", "data" => []]);
  header("Location: ../home.php");
  exit();
}

if ($pdf->institucion["es_nombre_autorizado"]) {
  $dataPlanEstudios = array(
    [
      "name" => utf8_decode("NOMBRE DE LA INSTITUCIÓN"),
      "description" => utf8_decode(mb_strtoupper($pdf->nombreInstitucion))
    ],
    [
      "name" => utf8_decode("MODALIDAD"),
      "description" => utf8_decode(mb_strtoupper($pdf->modalidad["nombre"]))
    ],
    [
      "name" => utf8_decode("DURACIÓN DEL CICLO"),
      "description" => utf8_decode(mb_strtoupper($pdf->ciclo["nombre"]))
    ],
    [
      "name" => utf8_decode("DURACIÓN DEL PLAN DE ESTUDIOS"),
      "description" => utf8_decode(mb_strtoupper($pdf->programa["duracion_periodos"] . ' PERIODOS ' . $cicloTxt[$pdf->ciclo["id"] - 1]))
    ],
  );
  if ($pdf->programa["acuerdo_rvoe"]) {
    array_push(($dataPlanEstudios), [
      "name" => utf8_decode("CLAVE DE PLAN DE ESTUDIOS"),
      "description" => utf8_decode(mb_strtoupper($pdf->programa["acuerdo_rvoe"]))
    ]);
  }
} else {
  $dataPlanEstudios = array(
    [
      "name" => utf8_decode("MODALIDAD"),
      "description" => utf8_decode(mb_strtoupper($pdf->modalidad["nombre"]))
    ],
    [
      "name" => utf8_decode("DURACIÓN DEL CICLO"),
      "description" => utf8_decode(mb_strtoupper($pdf->ciclo["nombre"]))
    ],
    [
      "name" => utf8_decode("DURACIÓN DEL PLAN DE ESTUDIOS"),
      "description" => utf8_decode(mb_strtoupper($pdf->programa["duracion_periodos"] . ' PERIODOS ' . $cicloTxt[$pdf->ciclo["id"] - 1]))
    ],
  );
  if ($pdf->programa["acuerdo_rvoe"]) {
    array_push(($dataPlanEstudios), [
      "name" => utf8_decode("CLAVE DE PLAN DE ESTUDIOS"),
      "description" => utf8_decode(mb_strtoupper($pdf->programa["acuerdo_rvoe"]))
    ]);
  }
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
$pdf->Cell(0, 5, utf8_decode("1. ANTECEDENTES ACADÉMICOS DE INGRESO"), 1, 1, "C", true);
$pdf->SetFont("Nutmeg", "", 9);
$pdf->MultiCell(0, 5, utf8_decode($pdf->programa["antecedente"]["descripcion"]), 0, "J");
$pdf->Ln();

if ($pdf->checkNewPage()) {
  $pdf->Ln(15);
}

$pdf->SetFillColor(166, 166, 166);
$pdf->SetFont("Nutmegb", "", 9);
$pdf->Cell(0, 5, utf8_decode("2. MÉTODOS DE INDUCCIÓN"), 1, 1, "C", true);
$pdf->SetFont("Nutmeg", "", 9);
$pdf->MultiCell(0, 5, utf8_decode($pdf->programa["metodos_induccion"]), 0, "J");

if ($pdf->checkNewPage()) {
  $pdf->Ln(15);
}
$pdf->Ln(5);

$pdf->SetFillColor(166, 166, 166);
$pdf->SetFont("Nutmegb", "", 9);
$pdf->Cell(0, 5, utf8_decode("3. PERFIL DE INGRESO "), 1, 1, "C", true);
$pdf->SetFillColor(191, 191, 191);
$pdf->Cell(0, 5, utf8_decode("Conocimientos:"), 1, 1, "L", true);
$pdf->SetFont("Nutmeg", "", 9);
$pdf->MultiCell(0, 5, utf8_decode($pdf->programa["perfil_ingreso_conocimientos"]), 0, "J");
$pdf->Ln();
if ($pdf->checkNewPage()) {
  $pdf->Ln(15);
}

$pdf->SetFont("Nutmegb", "", 9);
$pdf->Cell(0, 5, utf8_decode("Habilidades:"), 1, 1, "L", true);
$pdf->SetFont("Nutmeg", "", 9);
$pdf->MultiCell(0, 5, utf8_decode($pdf->programa["perfil_ingreso_habilidades"]), 0, "J");
$pdf->Ln();
if ($pdf->checkNewPage()) {
  $pdf->Ln(15);
}

$pdf->SetFont("Nutmegb", "", 9);
$pdf->Cell(0, 5, utf8_decode("Actitudes:"), 1, 1, "L", true);
$pdf->SetFont("Nutmeg", "", 9);
$pdf->MultiCell(0, 5, utf8_decode($pdf->programa["perfil_ingreso_actitudes"]), 0, "J");
$pdf->Ln();
if ($pdf->checkNewPage()) {
  $pdf->Ln(15);
}

$pdf->SetFillColor(166, 166, 166);
$pdf->SetFont("Nutmegb", "", 9);
$pdf->Cell(0, 5, utf8_decode("4. PROCESO DE SELECCIÓN DE ESTUDIANTES "), 1, 1, "C", true);
$pdf->SetFont("Nutmeg", "", 9);
$pdf->MultiCell(0, 5, utf8_decode($pdf->programa["proceso_seleccion"]), 0, "J");
$pdf->Ln();
if ($pdf->checkNewPage()) {
  $pdf->Ln(15);
}

$pdf->SetFillColor(166, 166, 166);
$pdf->SetFont("Nutmegb", "", 9);
$pdf->Cell(0, 5, utf8_decode("5. PERFIL DE EGRESO"), 1, 1, "C", true);
$pdf->SetFillColor(191, 191, 191);
$pdf->Cell(0, 5, utf8_decode("Conocimientos:"), 1, 1, "L", true);
$pdf->SetFont("Nutmeg", "", 9);
$pdf->MultiCell(0, 5, utf8_decode($pdf->programa["perfil_egreso_conocimientos"]), 0, "J");
$pdf->Ln();
if ($pdf->checkNewPage()) {
  $pdf->Ln(15);
}

$pdf->SetFont("Nutmegb", "", 9);
$pdf->Cell(0, 5, utf8_decode("Habilidades:"), 1, 1, "L", true);
$pdf->SetFont("Nutmeg", "", 9);
$pdf->MultiCell(0, 5, utf8_decode($pdf->programa["perfil_egreso_habilidades"]), 0, "J");
$pdf->Ln();
if ($pdf->checkNewPage()) {
  $pdf->Ln(15);
}

$pdf->SetFont("Nutmegb", "", 9);
$pdf->Cell(0, 5, utf8_decode("Actitudes:"), 1, 1, "L", true);
$pdf->SetFont("Nutmeg", "", 9);
$pdf->MultiCell(0, 5, utf8_decode($pdf->programa["perfil_egreso_actitudes"]), 0, "J");
if ($pdf->checkNewPage()) {
  $pdf->Ln(15);
}
$pdf->Ln(5);

$pdf->SetFillColor(166, 166, 166);
$pdf->SetFont("Nutmegb", "", 9);
$pdf->Cell(0, 5, utf8_decode("6. MAPA CURRICULAR "), 1, 1, "C", true);
$pdf->SetFont("Nutmeg", "", 9);
$pdf->MultiCell(0, 5, utf8_decode($pdf->programa["mapa_curricular"]), 0, "J");
if ($pdf->checkNewPage()) {
  $pdf->Ln(15);
}
// $pdf->SetFillColor( 166, 166, 166 );
$pdf->SetFont("Nutmegb", "", 9);
$pdf->Cell(0, 5, utf8_decode("7. FLEXIBILIDAD CURRICULAR "), 1, 1, "C", true);
$pdf->SetFont("Nutmeg", "", 9);
$pdf->MultiCell(0, 5, utf8_decode($pdf->programa["flexibilidad_curricular"]), 0, "J");
if ($pdf->checkNewPage()) {
  $pdf->Ln(15);
}
$pdf->Ln(5);

$pdf->SetFillColor(166, 166, 166);
$pdf->SetFont("Nutmegb", "", 9);
$pdf->Cell(0, 5, utf8_decode("8. OBJETIVO GENERAL DEL PLAN DE ESTUDIOS "), 1, 1, "C", true);
$pdf->SetFont("Nutmeg", "", 9);
$pdf->MultiCell(0, 5, utf8_decode($pdf->programa["objetivo_general"]), 0, "J");
if ($pdf->checkNewPage()) {
  $pdf->Ln(15);
}
$pdf->Ln(5);

$pdf->SetFillColor(166, 166, 166);
$pdf->SetFont("Nutmegb", "", 9);
$pdf->Cell(0, 5, utf8_decode("9. OBJETIVOS PARTICULARES DEL PLAN DE ESTUDIOS"), 1, 1, "C", true);
$pdf->SetFont("Nutmeg", "", 9);
$pdf->MultiCell(0, 5, utf8_decode($pdf->programa["objetivos_particulares"]), 0, "J");
if ($pdf->checkNewPage()) {
  $pdf->Ln(15);
}
$pdf->Ln(5);

$pdf->SetFillColor(166, 166, 166);
$pdf->SetFont("Nutmegb", "", 9);
$pdf->Cell(0, 5, utf8_decode("10. ESTRUCTURA DEL PLAN DE ESTUDIOS"), 1, 1, "C", true);
$pdf->SetFont("Nutmeg", "", 9);
$pdf->SetFillColor(192, 192, 192);

// Tabla de materias para curriculum flexible
if ($pdf->programa["ciclo_id"] == 4 || $pdf->programa["ciclo_id"] == 5) {

  $total_docente = 0;
  $total_independiente = 0;
  $total_creditos = 0;

  //Tabla para asignaturas en curriculum flexible
  foreach ($asignaturaGrados as $grado => $asignaturas) {

    $horas_docente = 0;
    $horas_independiente = 0;
    $creditos = 0;

    $pdf->SetFillColor(166, 166, 166);
    $pdf->SetFont("Nutmeg", "", 7);
    $pdf->Cell(176, 5, utf8_decode(mb_strtoupper($grado)), 1, 1, "C", true);
    if ($pdf->checkNewPage()) {
      $pdf->Ln(15);
    }
    $pdf->SetFillColor(191, 191, 191);
    $pdf->Cell(33, 10, utf8_decode("ÁREA"), 1, 0, "C", true);
    $y = $pdf->GetY();
    $x = $pdf->GetX();
    $pdf->MultiCell(36, 5, utf8_decode("ASIGNATURA O UNIDAD DE APRENDIZAJE"), 1, "C", true);
    $pdf->SetXY($x + 36, $y);
    $pdf->Cell(17, 10, utf8_decode("CLAVE"), 1, 0, "C", true);
    $pdf->Cell(17, 10, utf8_decode("SERIACIÓN"), 1, 0, "C", true);
    $y = $pdf->GetY();
    $x = $pdf->GetX();
    $pdf->MultiCell(15, 5, utf8_decode("HORAS DOCENTE"), 1, "C", true);
    $pdf->SetXY($x + 15, $y);
    $y = $pdf->GetY();
    $x = $pdf->GetX();
    $pdf->MultiCell(15, 5, utf8_decode("HORAS INDEP."), 1, "C", true);
    $pdf->SetXY($x + 15, $y);
    $pdf->Cell(15, 10, utf8_decode("CRÉDITOS"), 1, 0, "C", true);
    $pdf->Cell(28, 10, utf8_decode("INSTALACIONES"), 1, 0, "C", true);
    $pdf->Ln(10);

    // Fila de asignatura por asignatura
    foreach ($asignaturas as $asignatura => $detalle) {
      $area_txt = "";
      switch ($detalle["area"]) {
        case 1:
          $area_txt = "Formación General";
          break;
        case 2:
          $area_txt = "Formación Básica";
          break;
        case 3:
          $area_txt = "Formación Disciplinar";
          break;
        case 4:
          $area_txt = "Formación Electiva";
          break;
        case 5:
          $area_txt = 'Formación Técnica';
          break;
        case 6:
          $area_txt = 'Formación Especializante';
          break;
      }

      $nombreInfraestructura = utf8_decode(strtolower($detalle["infraestructura_nombre"]));
      $nombreInfraestructura = ucfirst($nombreInfraestructura);
      $dataAsignaturasGrado = array(
        [
          "area_asignatura" => utf8_decode($area_txt),
          "nombre_asignatura" => utf8_decode($detalle["nombre"]),
          "clave_asignatura" => utf8_decode($detalle["clave"]),
          "seriacion_asignatura" => utf8_decode($detalle["seriacion"]),
          "horas_docente_asignatura" => utf8_decode($detalle["horas_docente"]),
          "horas_independiente_asignatura" => utf8_decode($detalle["horas_independiente"]),
          "creditos_asignatura" => utf8_decode($detalle["creditos"]),
          "infraestructura_nombre_asignatura" => $nombreInfraestructura,
        ]
      );

      //set widht for each column (6 columns)
      $pdf->SetWidths(array(33, 36, 17, 17, 15, 15, 15, 28));

      //set line height
      $pdf->SetLineHeight(5);
      $pdf->SetColors([]);
      $pdf->SetFont("Nutmeg", "", 7);

      //Imprime la fila
      foreach ($dataAsignaturasGrado as $item) {
        // write data using Row() method containing array of values
        $pdf->Row(array(
          $item['area_asignatura'],
          $item['nombre_asignatura'],
          $item['clave_asignatura'],
          $item['seriacion_asignatura'],
          $item['horas_docente_asignatura'],
          $item['horas_independiente_asignatura'],
          $item['creditos_asignatura'],
          $item['infraestructura_nombre_asignatura']
        ));

        if ($pdf->checkNewPage()) {
          $pdf->Ln(15);
        }
      }

      //Suma de horas y creditos por grado
      $horas_docente = $horas_docente + $detalle["horas_docente"];
      $horas_independiente = $horas_independiente + $detalle["horas_independiente"];
      $creditos = $creditos + $detalle["creditos"];

      if ($grado != "Optativa") {
        $total_independiente = $total_independiente + $detalle["horas_independiente"];
        $total_docente = $total_docente + $detalle["horas_docente"];
        $total_creditos = $total_creditos + $detalle["creditos"];
      }
    }

    $pdf->SetFillColor(255, 255, 255);
    $pdf->Cell(103, 5, utf8_decode(""), 0, 0, "R", true);
    $pdf->SetFillColor(191, 191, 191);
    $pdf->SetFont("Nutmeg", "", 8);

    //Impresión de total de horas y creditos por grado
    $pdf->Cell(15, 5, utf8_decode($horas_docente), 1, 0, "C", true);
    $pdf->Cell(15, 5, utf8_decode($horas_independiente), 1, 0, "C", true);
    $pdf->Cell(15, 5, utf8_decode($creditos), 1, 1, "C", true);

    $pdf->Ln();
    $pdf->Ln();
  }

  if ($pdf->checkNewPage()) {
    $pdf->Ln(15);
  }
} else if ($pdf->programa["ciclo_id"] == 1 || $pdf->programa["ciclo_id"] == 2) {

  //Tabla para asignaturas en curriculum rígido
  $total_docente = 0;
  $total_independiente = 0;
  $total_creditos = 0;

  //Titulos de tabla por grado
  foreach ($asignaturaGrados as $grado => $asignaturas) {
    $horas_docente = 0;
    $horas_independiente = 0;
    $creditos = 0;

    // Impresión de grados excepto optativas
    if ($grado != "Optativa") {

      $pdf->SetFillColor(166, 166, 166);
      $pdf->SetFont("Nutmeg", "", 7);
      $pdf->Cell(176, 5, utf8_decode(mb_strtoupper($grado)), 1, 1, "C", true);
      if ($pdf->checkNewPage()) {
        $pdf->Ln(15);
      }
      $pdf->SetFillColor(191, 191, 191);
      $pdf->Cell(33, 10, utf8_decode("ÁREA"), 1, 0, "C", true);
      $y = $pdf->GetY();
      $x = $pdf->GetX();
      $pdf->MultiCell(36, 5, utf8_decode("ASIGNATURA O UNIDAD DE APRENDIZAJE"), 1, "C", true);
      $pdf->SetXY($x + 36, $y);
      $pdf->Cell(17, 10, utf8_decode("CLAVE"), 1, 0, "C", true);
      $pdf->Cell(17, 10, utf8_decode("SERIACIÓN"), 1, 0, "C", true);
      $y = $pdf->GetY();
      $x = $pdf->GetX();
      $pdf->MultiCell(15, 5, utf8_decode("HORAS DOCENTE"), 1, "C", true);
      $pdf->SetXY($x + 15, $y);
      $y = $pdf->GetY();
      $x = $pdf->GetX();
      $pdf->MultiCell(15, 5, utf8_decode("HORAS INDEP."), 1, "C", true);
      $pdf->SetXY($x + 15, $y);
      $pdf->Cell(15, 10, utf8_decode("CRÉDITOS"), 1, 0, "C", true);
      $pdf->Cell(28, 10, utf8_decode("INSTALACIONES"), 1, 0, "C", true);
      $pdf->Ln(10);

      //Filas de asignatura por asignatura
      foreach ($asignaturas as $asignatura => $detalle) {

        $area_txt = "";
        switch ($detalle["area"]) {
          case 1:
            $area_txt = "Formación General";
            break;
          case 2:
            $area_txt = "Formación Básica";
            break;
          case 3:
            $area_txt = "Formación Disciplinar";
            break;
          case 4:
            $area_txt = "Formación Electiva";
            break;
          case 5:
            $area_txt = 'Formación Técnica';
            break;
          case 6:
            $area_txt = 'Formación Especializante';
            break;
        }

        $nombreInfraestructura = utf8_decode(strtolower($detalle["infraestructura_nombre"]));
        $nombreInfraestructura = ucfirst($nombreInfraestructura);
        $dataAsignaturasGrado = array(
          [
            "area_asignatura" => utf8_decode($area_txt),
            "nombre_asignatura" => utf8_decode($detalle["nombre"]),
            "clave_asignatura" => utf8_decode($detalle["clave"]),
            "seriacion_asignatura" => utf8_decode($detalle["seriacion"]),
            "horas_docente_asignatura" => utf8_decode($detalle["horas_docente"]),
            "horas_independiente_asignatura" => utf8_decode($detalle["horas_independiente"]),
            "creditos_asignatura" => utf8_decode($detalle["creditos"]),
            "infraestructura_nombre_asignatura" => $nombreInfraestructura,
          ]
        );

        //set widht for each column (6 columns)
        $pdf->SetWidths(array(33, 36, 17, 17, 15, 15, 15, 28));

        //set line height
        $pdf->SetLineHeight(5);
        $pdf->SetColors([]);
        $pdf->SetFont("Nutmeg", "", 7);

        //Imprime las filas por grado
        foreach ($dataAsignaturasGrado as $item) {
          // write data using Row() method containing array of values
          $pdf->Row(array(
            $item['area_asignatura'],
            $item['nombre_asignatura'],
            $item['clave_asignatura'],
            $item['seriacion_asignatura'],
            $item['horas_docente_asignatura'],
            $item['horas_independiente_asignatura'],
            $item['creditos_asignatura'],
            $item['infraestructura_nombre_asignatura']
          ));

          if ($pdf->checkNewPage()) {
            $pdf->Ln(15);
          }
        }

        // Suma de horas y créditos por grado
        $total_docente += $detalle["horas_docente"];
        $horas_docente += $detalle["horas_docente"];
        $total_independiente += $detalle["horas_independiente"];
        $horas_independiente += $detalle["horas_independiente"];
        $total_creditos += $detalle["creditos"];
        $creditos += $detalle["creditos"];
      }

      $pdf->SetFillColor(255, 255, 255);
      $pdf->Cell(103, 5, utf8_decode(""), 0, 0, "R", true);
      $pdf->SetFillColor(191, 191, 191);
      $pdf->SetFont("Nutmeg", "", 8);

      //Imprime los totasl de horas y créditos por grado
      $pdf->Cell(15, 5, utf8_decode($horas_docente), 1, 0, "C", true);
      $pdf->Cell(15, 5, utf8_decode($horas_independiente), 1, 0, "C", true);
      $pdf->Cell(15, 5, utf8_decode($creditos), 1, 1, "C", true);

      $pdf->Ln();
      $pdf->Ln();
    } else if ($grado == "Optativa") {

      // Impresión de tabla para optativas
      $pdf->SetFillColor(166, 166, 166);
      $pdf->SetFont("Nutmeg", "", 7);
      $pdf->Cell(176, 5, utf8_decode(mb_strtoupper($grado)), 1, 1, "C", true);
      if ($pdf->checkNewPage()) {
        $pdf->Ln(15);
      }
      $pdf->SetFillColor(191, 191, 191);
      $pdf->Cell(33, 10, utf8_decode("ÁREA"), 1, 0, "C", true);
      $y = $pdf->GetY();
      $x = $pdf->GetX();
      $pdf->MultiCell(36, 5, utf8_decode("ASIGNATURA O UNIDAD DE APRENDIZAJE"), 1, "C", true);
      $pdf->SetXY($x + 36, $y);
      $pdf->Cell(17, 10, utf8_decode("CLAVE"), 1, 0, "C", true);
      $pdf->Cell(17, 10, utf8_decode("SERIACIÓN"), 1, 0, "C", true);
      $y = $pdf->GetY();
      $x = $pdf->GetX();
      $pdf->MultiCell(15, 5, utf8_decode("HORAS DOCENTE"), 1, "C", true);
      $pdf->SetXY($x + 15, $y);
      $y = $pdf->GetY();
      $x = $pdf->GetX();
      $pdf->MultiCell(15, 5, utf8_decode("HORAS INDEP."), 1, "C", true);
      $pdf->SetXY($x + 15, $y);
      $pdf->Cell(15, 10, utf8_decode("CRÉDITOS"), 1, 0, "C", true);
      $pdf->Cell(28, 10, utf8_decode("INSTALACIONES"), 1, 0, "C", true);
      $pdf->Ln(10);

      // Fila de asignatura optativa
      foreach ($asignaturas as $asignatura => $detalle) {

        $area_txt = "";
        switch ($detalle["area"]) {
          case 1:
            $area_txt = "Formación General";
            break;
          case 2:
            $area_txt = "Formación Básica";
            break;
          case 3:
            $area_txt = "Formación Disciplinar";
            break;
          case 4:
            $area_txt = "Formación Electiva";
            break;
          case 5:
            $area_txt = 'Formación Técnica';
            break;
          case 6:
            $area_txt = 'Formación Especializante';
            break;
        }

        $nombreInfraestructura = utf8_decode(strtolower($detalle["infraestructura_nombre"]));
        $nombreInfraestructura = ucfirst($nombreInfraestructura);
        $dataAsignaturasGrado = array(
          [
            "area_asignatura" => utf8_decode($area_txt),
            "nombre_asignatura" => utf8_decode($detalle["nombre"]),
            "clave_asignatura" => utf8_decode($detalle["clave"]),
            "seriacion_asignatura" => utf8_decode($detalle["seriacion"]),
            "horas_docente_asignatura" => utf8_decode($detalle["horas_docente"]),
            "horas_independiente_asignatura" => utf8_decode($detalle["horas_independiente"]),
            "creditos_asignatura" => utf8_decode($detalle["creditos"]),
            "infraestructura_nombre_asignatura" => $nombreInfraestructura,
          ]
        );

        //set widht for each column (6 columns)
        $pdf->SetWidths(array(33, 36, 17, 17, 15, 15, 15, 28));

        //set line height
        $pdf->SetLineHeight(5);
        $pdf->SetColors([]);
        $pdf->SetFont("Nutmeg", "", 7);

        // Impresión de fila de asignatura
        foreach ($dataAsignaturasGrado as $item) {
          // write data using Row() method containing array of values
          $pdf->Row(array(
            $item['area_asignatura'],
            $item['nombre_asignatura'],
            $item['clave_asignatura'],
            $item['seriacion_asignatura'],
            $item['horas_docente_asignatura'],
            $item['horas_independiente_asignatura'],
            $item['creditos_asignatura'],
            $item['infraestructura_nombre_asignatura']
          ));

          if ($pdf->checkNewPage()) {
            $pdf->Ln(15);
          }
        }
        $horas_docente += $detalle["horas_docente"];
        $horas_independiente += $detalle["horas_independiente"];
        $creditos += $detalle["creditos"];
      }

      $pdf->SetFillColor(255, 255, 255);
      $pdf->Cell(103, 5, utf8_decode(""), 0, 0, "R", true);
      $pdf->SetFillColor(191, 191, 191);
      $pdf->SetFont("Nutmeg", "", 8);

      $pdf->Cell(15, 5, utf8_decode($horas_docente), 1, 0, "C", true);
      $pdf->Cell(15, 5, utf8_decode($horas_independiente), 1, 0, "C", true);
      $pdf->Cell(15, 5, utf8_decode($creditos), 1, 1, "C", true);

      $pdf->Ln();
      $pdf->Ln();
    }
  }
}

//Sumatoria de total de horas y créditos de grados + horas y créditos mínimos de asigntaruas optativas
$total_docente += $pdf->programa["minimo_horas_optativas"];
$total_creditos += $pdf->programa["minimo_creditos_optativas"];
if ($pdf->checkNewPage()) {
  $pdf->Ln(15);
}

//Impresión de número mínimo de horas y créditos de asignaturas optativas
if ($pdf->programa["minimo_horas_optativas"]) {
  $dataTotal = array(
    [
      "name" => utf8_decode("NÚMERO MÍNIMO DE HORAS QUE SE DEBERÁN ACREDITAR EN LAS ASIGNATURAS DE FORMACIÓN ELECTIVA, BAJO LA CONDUCCIÓN DE UN DOCENTE"),
      "description" => (utf8_decode($pdf->programa["minimo_horas_optativas"] . " HORAS"))
    ],
    [
      "name" => utf8_decode("NÚMERO MÍNIMO DE CRÉDITOS QUE SE DEBERÁN ACREDITAR EN LAS ASIGNATURAS DE FORMACIÓN ELECTIVA"),
      "description" => (utf8_decode($pdf->programa["minimo_creditos_optativas"] . " CRÉDITOS"))
    ],
  );

  //set widht for each column (6 columns)
  $pdf->SetWidths(array(130, 44));

  //set line height
  $pdf->SetLineHeight(5);

  $pdf->SetColors([[191, 191, 191], []]);

  //Impresión de filas
  foreach ($dataTotal as $item) {
    // write data using Row() method containing array of values
    $pdf->Row(array(
      $item['name'],
      $item['description']
    ));
  }
}

$pdf->Ln();
$pdf->Ln();

if ($pdf->checkNewPage()) {
  $pdf->Ln(15);
}

// Impresión de total de horas y créditos de todas las asignaturas incluyendo optativas
$dataTotal = array(
  [
    "name" => utf8_decode("TOTAL DE HORAS DE TRABAJO BAJO LA CONDUCCIÓN DE UN DOCENTE DURANTE TODA LA CARRERA"),
    "description" => (utf8_decode($total_docente . " HORAS"))
  ],
  [
    "name" => utf8_decode("TOTAL DE HORAS DE TRABAJO DE MANERA INDEPENDIENTE DURANTE TODA LA CARRERA"),
    "description" => (utf8_decode($total_independiente . " HORAS"))
  ],
  [
    "name" => utf8_decode("TOTAL DE CRÉDITOS DE LA CARRERA"),
    "description" => (utf8_decode($total_creditos . " CRÉDITOS"))
  ],
);

//set widht for each column (6 columns)
$pdf->SetWidths(array(130, 44));

//set line height
$pdf->SetLineHeight(5);

$pdf->SetColors([[191, 191, 191], []]);

foreach ($dataTotal as $item) {
  // write data using Row() method containing array of values
  $pdf->Row(array(
    $item['name'],
    $item['description']
  ));
}
$pdf->Ln();
$pdf->Ln();

if ($pdf->checkNewPage()) {
  $pdf->Ln(15);
}
$pdf->Ln(5);

$pdf->SetTextColor(0, 0, 0);
$pdf->SetFillColor(166, 166, 166);
$pdf->SetFont("Nutmegb", "", 9);
$pdf->Cell(0, 5, utf8_decode("11. LÍNEAS DE GENERACIÓN Y/O APLICACIÓN DEL CONOCIMIENTO "), 1, 1, "C", true);
$pdf->SetFont("Nutmeg", "", 9);
$pdf->MultiCell(0, 5, utf8_decode($pdf->programa["lineas_generacion_aplicacion_conocimiento"]), 0, "J");
if ($pdf->checkNewPage()) {
  $pdf->Ln(15);
}
$pdf->Ln(15);

$pdf->SetFillColor(166, 166, 166);
$pdf->SetFont("Nutmegb", "", 9);
$pdf->Cell(0, 5, utf8_decode("12. ACTUALIZACIÓN DEL PLAN DE ESTUDIOS"), 1, 1, "C", true);
$pdf->SetFont("Nutmeg", "", 9);
$pdf->MultiCell(0, 5, utf8_decode($pdf->programa["actualizacion"]), 0, "J");
if ($pdf->checkNewPage()) {
  $pdf->Ln(15);
}
$pdf->Ln(15);

$pdf->SetFillColor(166, 166, 166);
$pdf->SetFont("Nutmegb", "", 9);
$pdf->Cell(0, 5, utf8_decode("13. PROYECTO DE SEGUIMIENTO DE EGRESADOS "), 1, 1, "C", true);
$pdf->SetFont("Nutmeg", "", 9);
$pdf->MultiCell(0, 5, utf8_decode($pdf->programa["seguimiento_egresados"]), 0, "J");
if ($pdf->checkNewPage()) {
  $pdf->Ln(15);
}
$pdf->Ln(15);

$pdf->SetFillColor(166, 166, 166);
$pdf->SetFont("Nutmegb", "", 9);
$pdf->MultiCell(0, 5, utf8_decode("14. VINCULACIÓN CON COLEGIOS DE PROFESIONISTAS, ACADEMIAS, ASOCIACIONES PROFESIONALES, ETC."), 1, "C", true);
$pdf->SetFont("Nutmeg", "", 9);
$pdf->MultiCell(0, 5, utf8_decode($pdf->programa["convenios_vinculacion"]), 0, "J");

$pdf->Ln(15);
if ($pdf->checkNewPage()) {
  $pdf->Ln(15);
}

$pdf->SetFont("Nutmeg", "", 9);
if ($pdf->programa["acuerdo_rvoe"]) {
  $pdf->Cell(0, 5, utf8_decode("FECHA DE AUTORIZACIÓN"), 0, 1, "C");
  $pdf->Cell(0, 5, mb_strtoupper(Solicitud::convertirFecha($pdf->programa["fecha_surte_efecto"])), 0, 0, "C");
  $pdf->Ln(25);
  $sizeFieldFirma = 65;
  $sizePage = $pdf->GetPageWidth();
  $x = ($sizePage / 2) - ($sizeFieldFirma / 2);
  $pdf->SetX($x);
  $pdf->MultiCell(65, 5, utf8_decode("ING. MARCO ARTURO CASTRO AGUILERA\nDIRECTOR GENERAL DE INCORPORACIÓN Y SERVICIOS ESCOLARES"), "T", "C", false);
} else {
  $pdf->Cell(0, 5, "BAJO PROTESTA DE DECIR VERDAD", 0, 0, "C");
  $pdf->Ln(5);
  $pdf->Cell(0, 5, utf8_decode(mb_strtoupper($pdf->nombreRepresentante)), 0, 0, "C");
}
$pdf->Ln(10);

$pdf->Output("I", "FDP02.pdf");
