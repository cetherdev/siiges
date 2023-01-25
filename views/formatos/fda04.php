<?php
  require( "pdf.php" );

  session_start( );

  if(!isset($_GET["id"]) && !$_GET["id"]){
    header("../home.php");
  }

  $pdf = new PDF();
  $pdf->getData($_GET["id"]);
  $pdf->getDataPlantel($pdf->plantel["id"]);

  $pdf->AliasNbPages( );
  $pdf->AddPage( "P", "Letter" );
  $pdf->SetFont( "Arial", "B", 10 );
  $pdf->SetMargins(20, 35 , 20);

// Nombre del formato
$pdf->SetFont( "Arial", "B", 11 );
$pdf->Ln( 25 );
$pdf->SetTextColor( 255, 255, 255 );
$pdf->SetFillColor( 0, 127, 204 );
$pdf->Cell( 140, 5, "", 0, 0, "L");
$pdf->Cell( 35, 6, "FDA04", 0, 0, "R", true);
$pdf->Ln( 5 );

$pdf->SetTextColor( 0, 127, 204 );
$pdf->Cell( 0, 5, utf8_decode("DESCRIPCION DE LAS INSTALACIONES"), 0, 1, "L");
$pdf->SetTextColor( 0, 0, 0 );
$pdf->Ln( 10 );

// Institucion
$pdf->SetFillColor(166, 166, 166);
$pdf->SetFont("Arial", "B", 9);
$pdf->Cell(175, 5, utf8_decode("1. DATOS DEL PLAN DE ESTUDIOS"), 1, 0, "C", true);
$pdf->SetFillColor( 255, 255, 255 );
$pdf->Ln(); 
$pdf->SetFillColor( 166, 166, 166 );
$pdf->SetFont( "Arial", "B", 9 );
$pdf->Cell( 70, 5, utf8_decode("NOMBRE DE LA INSTITUCIÓN "), 1, 0, "L", true );
$pdf->SetFillColor( 255, 255, 255 );
$pdf->SetFont( "Arial", "", 9 );
if($pdf->institucion["es_nombre_autorizado"]){
  $pdf->Cell( 105, 5, utf8_decode($pdf->nombreInstitucion), 1, 1, "L", true );
}else{
  $pdf->Cell( 105, 5, "", 1, 1, "L", true );
}
$pdf->SetFont( "Arial", "B", 9 );
$pdf->SetFillColor( 191, 191, 191 );
$pdf->Cell( 70, 5, utf8_decode("NIVEL Y NOMBRE DEL PLAN DE ESTUDIOS "), 1, 0, "L", true );
$pdf->SetFillColor( 255, 255, 255 );
$pdf->SetFont( "Arial", "", 9 );
$pdf->Cell( 105, 5, utf8_decode($pdf->nivel["descripcion"]." en ".$pdf->programa["nombre"]), 1, 1, "L", true );
$pdf->SetFont( "Arial", "B", 9 );
$pdf->SetFillColor( 191, 191, 191 );
$pdf->Cell( 70, 5, utf8_decode("MODALIDAD "), 1, 0, "L", true );
$pdf->SetFillColor( 255, 255, 255 );
$pdf->SetFont( "Arial", "", 9 );
$pdf->Cell( 105, 5, utf8_decode($pdf->modalidad["nombre"]), 1, 1, "L", true );
$pdf->SetFillColor( 191, 191, 191 );
$pdf->SetFont( "Arial", "B", 9 );
$pdf->Cell( 70, 5, utf8_decode("DURACIÓN DEL PROGRAMA "), 1, 0, "L", true );
$pdf->SetFillColor( 255, 255, 255 );
$pdf->SetFont( "Arial", "", 9 );
$pdf->Cell( 105, 5, utf8_decode($pdf->programa["duracion_periodos"]), 1, 1, "L", true );
$pdf->SetFillColor( 191, 191, 191 );
$pdf->SetFont( "Arial", "B", 9 );
$pdf->MultiCell( 70, 5, utf8_decode("NOMBRE COMPLETO DE LA PERSONA FÍSICA O JURIDICA"), 1, "L", true );
$pdf->SetFillColor( 255, 255, 255 );
$pdf->SetFont( "Arial", "", 9 );
$pdf->SetY(80);
$pdf->SetX(90);
$pdf->Cell( 105, 10, utf8_decode($pdf->nombreRepresentante), 1, 1, "L", true );
$pdf->Ln( 5 );

// Domicilio de la institucion
$pdf->SetFillColor( 166, 166, 166 );
$pdf->SetFont( "Arial", "B", 9 );
$pdf->Cell( 0, 5, utf8_decode("2. DOMICILIO DE LA INSTITUCIÓN"), 1, 1, "C", true );
$pdf->SetFillColor( 191, 191, 191 );
$pdf->Cell( 116, 5, utf8_decode("CALLE Y NÚMERO"), 1, 0, "C", true );
$pdf->Cell( 60, 5, utf8_decode("COLONIA"), 1, 1, "C", true );
$pdf->SetFillColor( 255, 255, 255 );
$pdf->SetFont( "Arial", "", 9 );
$pdf->Cell( 116, 5, utf8_decode($pdf->domicilioPlantel["calle"]." ".$pdf->domicilioPlantel["numero_exterior"]." ".$pdf->domicilioPlantel["numero_interior"]), 1, 0, "L", true );
$pdf->Cell( 60, 5, utf8_decode($pdf->domicilioPlantel["colonia"]), 1, 1, "L", true );
$pdf->SetFillColor( 191, 191, 191 );
$pdf->SetFont( "Arial", "B", 9 );
$pdf->Cell( 58, 5, utf8_decode("CÓDIGO POSTAL"), 1, 0, "C", true );
$pdf->Cell( 58, 5, utf8_decode("DELEGACIÓN O MUNICIPIO"), 1, 0, "C", true );
$pdf->Cell( 60, 5, utf8_decode("ENTIDAD FEDERATIVA"), 1, 1, "C", true );
$pdf->SetFillColor( 255, 255, 255 );
$pdf->SetFont( "Arial", "", 9 );
$pdf->Cell( 58, 5, utf8_decode($pdf->domicilioPlantel["codigo_postal"]), 1, 0, "L", true );
$pdf->Cell( 58, 5, utf8_decode($pdf->domicilioPlantel["municipio"]), 1, 0, "L", true );
$pdf->Cell( 60, 5, utf8_decode($pdf->domicilioPlantel["estado"]), 1, 1, "L", true );
$pdf->SetFillColor( 191, 191, 191 );

$headers = ["telefono"=>"NUMERO TELÉFONICO","redes_sociales"=>"REDES SOCIALES", "correo"=>"CORREO ELECTRÓNICO"];
$data = [
      [
          "correo"=>utf8_decode($pdf->plantel["email1"].", ".$pdf->plantel["email2"].", ".$pdf->plantel["email3"]),
          "telefono"=>utf8_decode($pdf->plantel["telefono1"].", ".$pdf->plantel["telefono2"].", ".$pdf->plantel["telefono3"]),
          "redes_sociales"=>$pdf->plantel["redes_sociales"]
      ]
];
$widths = ["correo"=>80,"telefono"=>38,"redes_sociales"=>58];
$length = ["correo"=>65,"telefono"=>25,"redes_sociales"=>55];
$pdf->Tabla($headers,$data,$widths,0,$length);
$pdf->Ln(5);

//Descripcion del plantel
$pdf->SetFillColor( 166, 166, 166 );
$pdf->SetFont( "Arial", "B", 9 );
$pdf->Cell( 0, 5, utf8_decode("3. DESCRIPCIÓN DEL PLANTEL"), 1, 1, "C", true );
$pdf->SetFillColor( 191, 191, 191 );
$pdf->SetFont( "Arial", "B", 9 );
$pdf->Cell( 60, 5, utf8_decode("CARACTERISTICAS DEL INMUEBLE"), 1, 0, "C", true );
$pdf->SetFillColor( 255, 255, 255 );
$pdf->SetFont( "Arial", "", 9 );
$pdf->Cell( 25, 5, utf8_decode($pdf->plantel["caracteristica_inmueble"]), 1, 0, "L", true );
$pdf->cell(2);

// Seguridad
$ejeX = $pdf->GetX();
$ejeY = $pdf->GetY();
$pdf->SetY($ejeY);
$pdf->SetX($ejeX);
$pdf->SetFillColor( 191, 191, 191 );
$pdf->SetFont( "Arial", "B", 9 );
$pdf->Cell( 89, 5, utf8_decode("SISTEMA DE SEGURIDAD"), 1, 1, "C", true );
$pdf->SetFillColor( 255, 255, 255 );
$pdf->SetFont( "Arial", "B", 9 );
$pdf->SetY($ejeY += 5);
$pdf->SetX($ejeX);
$pdf->Cell( 68, 5, utf8_decode("DESCRIPCIÓN"), 1, 0, "L", true );
$pdf->Cell( 21, 5, utf8_decode("CANTIDAD"), 1, 1, "L", true );
$pdf->SetFont( "Arial", "", 9 );
$ejeY += 5;
foreach ($pdf->seguridadSistemas as $seguridad) {
  $pdf->SetY($ejeY);
  $pdf->SetX($ejeX);
  $pdf->Cell( 68, 5, utf8_decode($seguridad["sistema"]), 1, 0, "L", true );
  $pdf->Cell( 21, 5, utf8_decode($seguridad["cantidad"]), 1, 1, "L", true );
  $ejeY +=5;
}
$pdf->Ln(5);

$pdf->SetFillColor( 191, 191, 191 );
  $pdf->SetFont( "Arial", "B", 9 );
  $pdf->Cell( 85, 5, utf8_decode("EDIFICIOS Y/O NIVELES"), 1, 1, "C", true );
  $pdf->SetFillColor( 255, 255, 255 );
  $pdf->SetFont( "Arial", "", 9 );
  foreach ($pdf->edificioNiveles as $nivel) {
    $pdf->Cell( 85, 5, utf8_decode($nivel["nivel"]), 1, 1, "L", true );
  }
  $pdf->Ln(5);
  
// Higienes
$pdf->SetFillColor( 166, 166, 166 );
$pdf->SetTextColor( 0, 0, 0 );
$pdf->SetFont( "Arial", "B", 9 );
$pdf->Cell( 0, 5, utf8_decode("4.  HIGIENE DEL PLANTEL"), 1, 1, "C", true );
$pdf->SetFillColor( 191, 191, 191 );
$pdf->SetFont( "Arial", "B", 9 );
$pdf->Cell( 102, 5, utf8_decode("CONCEPTO"), 1, 0, "C", true );
$pdf->Cell( 74, 5, utf8_decode("DESCRIPCION"), 1, 1, "C", true );
$pdf->SetFont( "Arial", "", 9 );
$pdf->SetFillColor( 255, 255, 255 );

foreach ($pdf->higienes as $higiene) {
  $pdf->Cell( 102, 5, utf8_decode($higiene["higiene"]), 1, 0, "L", true );
  $pdf->Cell( 74, 5, utf8_decode($higiene["cantidad"]), 1, 1, "L", true );
}

$pdf->Ln( 40 );

// Infraestructura
$pdf->SetFillColor( 166, 166, 166 );
$pdf->SetTextColor( 0, 0, 0 );
$pdf->SetFont( "Arial", "B", 9 );
$pdf->Cell( 0, 5, utf8_decode("5. INFRAESTRUCTURA PARA EL PROGRAMA"), 1, 1, "L", true );
$pdf->SetFillColor( 191, 191, 191);
$pdf->Cell( 0, 5, utf8_decode("ESPACIOS Y EQUIPAMIENTO"), 1, 1, "C", true );

$headersI = ["asignaturas"=>"ASIGNATURAS QUE ATIENDE","instalacion"=>"INSTALACIONES",
            "capacidad"=>"CAPACIDAD PROMEDIO (No. ALUMNOS)","metros"=>"METROS",
              "recursos"=>"RECURSOS MATERIALES","ubicacion"=>"UBICACIÓN"];
$dataI = $pdf->tiposInstalacion;
//print_r($dataI);
$widthsI = ["asignaturas"=>35,"instalacion"=>28,"capacidad"=>28,"metros"=>15,"recursos"=>46,"ubicacion"=>24];
$lengthI = ["asignaturas"=>15,"instalacion"=>19,"capacidad"=>20,"metros"=>15,"recursos"=>39,"ubicacion"=>15];
// Headers
$ejeX = $pdf->GetX();
$ejeY = $pdf->GetY();
$pdf->MultiCell( 35, 6, utf8_decode($headersI["asignaturas"]), 1, "C", true );
$pdf->SetY($ejeY);
$pdf->SetX(55);
$pdf->Cell( 28, 12, utf8_decode($headersI["instalacion"]), 1, 1, "C", true );
$pdf->SetY($ejeY);
$pdf->SetX(83);
$pdf->MultiCell( 28, 4, utf8_decode($headersI["capacidad"]), 1, "C", true );
$pdf->SetY($ejeY);
$pdf->SetX(111);
$pdf->Cell( 15, 12, utf8_decode($headersI["metros"]), 1,1, "C", true );
$pdf->SetY($ejeY);
$pdf->SetX(126);
$pdf->MultiCell( 46, 12, utf8_decode($headersI["recursos"]), 1, "C", true );
$pdf->SetY($ejeY);
$pdf->SetX(172);
$pdf->Cell( 24, 12, utf8_decode($headersI["ubicacion"]), 1,1, "C", true );
$pdf->Tabla($headersI,$dataI,$widthsI,0,$lengthI,false);
$pdf->Ln( 15 );

  // Instituciones de salud aledañas
$pdf->SetFillColor( 166, 166, 166 );
$pdf->SetTextColor( 0, 0, 00 );
$pdf->SetFont( "Arial", "B", 9 );
$pdf->MultiCell( 0, 5, utf8_decode("6.  RELACIÓN DE INSTITUCIONES DE SALUD ALEDAÑAS, SERVICIOS DE AMBULANCIA U OTROS SERVICIOS DE EMERGENCIA A LOS CUALES RECURRIRÁ LA INSTITUCIÓN EN CASO DE ALGUNA CONTINGENCIA "), 1, "L", true );
$pdf->SetFillColor( 191, 191, 191);
$pdf->Cell( 88, 10, utf8_decode("NOMBRE DE LA INSTITUCIÓN"), 1, 0, "C", true );
$pdf->MultiCell( 88, 5, utf8_decode("TIEMPO APROXIMADO REQUERIDO PARA LLEGAR A LA ESCUELA (EN MINUTOS)"), 1, 1, "C", true );
$pdf->SetFont( "Arial", "", 9 );
  foreach ($pdf->salud as $salud) {
    $pdf->SetFillColor( 255, 255, 255);
    $pdf->Cell( 88, 5, utf8_decode($salud["nombre"]), 1, 0, "C", true );
    $pdf->Cell( 88, 5, utf8_decode($salud["tiempo"]), 1, 1, "C", true );

  }
  $pdf->Ln( 10 );
$pdf->SetFont( "Arial", "", 11 );
$pdf->Cell(0,5, utf8_decode("BAJO PROTESTA DE DECIR VERDAD"), 0, 1, "C");
$pdf->SetFont( "Arial", "B", 11 );
$pdf->Cell( 0, 5, utf8_decode(mb_strtoupper($pdf->nombreRepresentante)), 0, 1, "C");

  if($pdf->checkNewPage()){
    // Nombre del formato
      $pdf->SetFont( "Arial", "B", 11 );
      $pdf->Ln( 10);
      $pdf->SetTextColor( 255, 255, 255 );
      $pdf->SetFillColor( 0, 127, 204 );
      $pdf->Cell( 140, 5, "", 0, 0, "L");
      $pdf->Cell( 35, 6, "FDA04", 0, 0, "R", true);
      $pdf->Ln( 10 );
      $pdf->SetTextColor( 0, 0, 0 );
  }

  if($pdf->programa["modalidad_id"] > Modalidad::ESCOLARIZADA && $pdf->programa["modalidad_id"] < Modalidad::DUAL){
    $pdf->getDataMixta($pdf->programa["id"]);
    
    if($pdf->checkNewPage()){
      // Nombre del formato
        $pdf->SetFont( "Arial", "B", 11 );
        $pdf->Ln( 10);
        $pdf->SetTextColor( 255, 255, 255 );
        $pdf->SetFillColor( 0, 127, 204 );
        $pdf->Cell( 140, 5, "", 0, 0, "L");
        $pdf->Cell( 35, 6, "FDA04", 0, 0, "R", true);
        $pdf->Ln( 10 );
        $pdf->SetTextColor( 0, 0, 0 );

    }
  }

  $pdf->Output( "I", "FDA04.pdf" );
