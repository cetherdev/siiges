<?php
  require( "pdf.php" );

  session_start( );

  if(!isset($_GET["id"]) && !$_GET["id"]){
    header("../home.php");
  }

//print_r($_GET["id"]);
  $tituloTipoSolicitud = [
                        "SOLICITUD DE RECONOCIMIENTO DE VALIDEZ OFICIAL DE ESTUDIOS (RVOE)",
                        "SOLICITUD DE REFRENDO A PLANES Y PROGRAMAS DE ESTUDIO ",
                        "SOLICITUD DE CAMBIO DE DOMICILIO",
                        "SOLICITUD DE CAMBIO DE REPRESENTANTE LEGAL"
                      ];
  $pdf = new PDF( );
  $pdf->getData($_GET["id"]);
  $pdf->AliasNbPages( );

  $pdf->AddPage( "P", "Letter" );
  $pdf->SetFont( "Arial", "B", 10 );
  $pdf->SetMargins(20, 20 , 20);

// Nombre del formato
  $pdf->SetFont( "Arial", "B", 11 );
  $pdf->Ln( 25 );
  $pdf->SetTextColor( 255, 255, 255 );
  $pdf->SetFillColor( 0, 127, 204 );
  $pdf->Cell( 140, 5, "", 0, 0, "L");
  $pdf->Cell( 35, 6, "FDA02", 0, 0, "R", true);
  $pdf->Ln( 10 );

  $pdf->SetTextColor( 0, 127, 204 );
  $pdf->Cell( 0, 5, utf8_decode($tituloTipoSolicitud[$pdf->solicitud["tipo_solicitud_id"]-1]), 0, 1, "R");
  $pdf->SetTextColor( 0, 0, 0 );
  $pdf->Ln( 10 );
  // Fecha
  $pdf->SetFont( "Arial", "", 10 );
  $fecha =  $pdf->fecha;
  $pdf->Cell( 0, 5, utf8_decode("$fecha"), 0, 1, "R");
  $pdf->Ln( 10 );

  // Tablas
  $pdf->SetFont( "Arial", "B", 9 );
  $pdf->SetFillColor( 166, 166, 166 );
  $pdf->Cell( 70, 5, utf8_decode("NOMBRE DE LA INSTITUCIÓN"), 1, 0, "L", true );
  $pdf->SetFillColor( 255, 255, 255 );
  $pdf->SetFont( "Arial", "", 9 );

  $pdf->Cell( 105, 5, utf8_decode($pdf->institucion["nombre"]), 1, 1, "L", true );

  $pdf->SetFillColor( 166, 166, 166 );
  $pdf->SetFont( "Arial", "B", 9 );
  $pdf->Cell( 70, 5, "NIVEL Y NOMBRE DEL PLAN DE ESTUDIOS", 1, 0, "L", true );
  $pdf->SetFillColor( 255, 255, 255 );
  $pdf->SetFont( "Arial", "", 9 );
  $pdf->Cell( 105, 5, utf8_decode($pdf->nivel["descripcion"]." en ".$pdf->programa["nombre"]), 1, 1, "L", true );

  $pdf->SetFillColor( 166, 166, 166 );
  $pdf->SetFont( "Arial", "B", 9 );
  $pdf->Cell( 70, 5, utf8_decode("DURACIÓN DEL PROGRAMA"), 1, 0, "L", true );
  $pdf->SetFillColor( 255, 255, 255 );
  $pdf->SetFont( "Arial", "", 9 );
  $pdf->Cell( 105, 5, utf8_decode($pdf->programa["duracion"]), 1, 1, "L", true );

  $pdf->SetFillColor( 166, 166, 166 );
  $pdf->SetFont( "Arial", "B", 9 );
  $pdf->MultiCell( 70, 5  , utf8_decode("NOMBRE COMPLETO DE LA RAZÓN SOCIAL"), 1, "L", true );
  $pdf->SetFillColor( 255, 255, 255 );
  $pdf->SetFont( "Arial", "", 9 );
  $pdf->SetY(90);
  $pdf->SetX(90);
  $pdf->Cell( 105, 10, utf8_decode($pdf->razonSocial), 1, 1, "L", true );

  $pdf->Ln(10 );

  $pdf->SetFillColor( 166, 166, 166 );
  $pdf->SetFont( "Arial", "B", 9 );
  $pdf->Cell( 40, 5, utf8_decode("NIVEL DE ESTUDIOS"), 1, 1, "C", true );
  $pdf->SetFillColor( 255, 255, 255 );
  $pdf->SetFont( "Arial", "", 9 );
  $pdf->Cell( 40, 5, utf8_decode($pdf->nivel["descripcion"]), 1, 0, "L", true );

  $pdf->SetY(110);
  $pdf->SetX(65);
  $pdf->SetFillColor( 166, 166, 166 );
  $pdf->SetFont( "Arial", "B", 9 );
  $pdf->Cell( 40, 5, utf8_decode("TURNOS"), 1, 1, "C", true );
  $pdf->SetFillColor( 255, 255, 255 );
  $pdf->SetFont( "Arial", "", 9 );
  $y = 115;
  foreach ($pdf->turnoArray as $turno) {
    $pdf->SetY($y);
    $pdf->SetX(65);
    $pdf->Cell( 40, 5, utf8_decode($turno), 1, 1, "L", true );
    $y += 5;
  }

  $pdf->SetY(110);
  $pdf->SetX(110);
  $pdf->SetFillColor( 166, 166, 166 );
  $pdf->SetFont( "Arial", "B", 9 );
  $pdf->Cell( 40, 5, utf8_decode("MODALIDAD"), 1, 1, "C", true );
  $pdf->SetFillColor( 255, 255, 255 );
  $pdf->SetFont( "Arial", "", 9 );
  $pdf->SetY(115);
  $pdf->SetX(110);
  $pdf->Cell( 40, 5, utf8_decode($pdf->modalidad["nombre"]), 1, 1, "L", true );

  $pdf->SetY(110);
  $pdf->SetX(155);
  $pdf->SetFillColor( 166, 166, 166 );
  $pdf->SetFont( "Arial", "B", 9 );
  $pdf->Cell( 40, 5, utf8_decode("CICLO"), 1, 1, "C", true );
  $pdf->SetFillColor( 255, 255, 255 );
  $pdf->SetFont( "Arial", "", 9 );
  $pdf->SetY(115);
  $pdf->SetX(155);
  $pdf->Cell( 40, 5, utf8_decode($pdf->ciclo["nombre"]), 1, 1, "L", true );

  $pdf->Ln(10 );
  // Domicilio de la instituciones
  $pdf->SetFillColor( 166, 166, 166 );
  $pdf->SetFont( "Arial", "B", 9 );
  $pdf->Cell( 0, 5, utf8_decode("DOMICILIO DE LA INSTITUCIÓN"), 1, 1, "C", true );

  $pdf->SetFillColor( 191, 191, 191 );
  $pdf->Cell( 116, 5, utf8_decode("CALLE Y NÚMERO"), 1, 0, "L", true );
  $pdf->Cell( 60, 5, utf8_decode("COLONIA"), 1, 1, "L", true );

  $pdf->SetFillColor( 255, 255, 255 );
  $pdf->SetFont( "Arial", "", 9 );
  $pdf->Cell( 116, 5, utf8_decode($pdf->domicilioPlantel["calle"]." ".$pdf->domicilioPlantel["numero_exterior"]." ".$pdf->domicilioPlantel["numero_interior"]), 1, 0, "L", true );
  $pdf->Cell( 60, 5, utf8_decode($pdf->domicilioPlantel["colonia"]), 1, 1, "L", true );

  $pdf->SetFillColor( 191, 191, 191 );
  $pdf->SetFont( "Arial", "B", 9 );
  $pdf->Cell( 58, 5, utf8_decode("CÓDIGO POSTAL"), 1, 0, "L", true );
  $pdf->Cell( 58, 5, utf8_decode("DELEGACIÓN O MUNICIPIO"), 1, 0, "L", true );
  $pdf->Cell( 60, 5, utf8_decode("ENTIDAD FEDERATIVA"), 1, 1, "L", true );

  $pdf->SetFillColor( 255, 255, 255 );
  $pdf->SetFont( "Arial", "", 9 );
  $pdf->Cell( 58, 5, utf8_decode($pdf->domicilioPlantel["codigo_postal"]), 1, 0, "L", true );
  $pdf->Cell( 58, 5, utf8_decode($pdf->domicilioPlantel["municipio"]), 1, 0, "L", true );
  $pdf->Cell( 60, 5, utf8_decode($pdf->domicilioPlantel["estado"]), 1, 1, "L", true );

  $pdf->SetFillColor( 191, 191, 191 );
  //print_r($pdf->plantel);
  //echo "<br>";
  //print_r($pdf->plantel["redes_sociales"]);
  $headers = ["correo"=>"CORREO ELECTRÓNICO","telefono"=>"TELÉFONO","redes_sociales"=>"REDES SOCIALES"];
  $data = [
        [
            "correo"=>utf8_decode($pdf->plantel["email1"].", ".$pdf->plantel["email2"].", ".$pdf->plantel["email3"]),
            "telefono"=>utf8_decode($pdf->plantel["telefono1"].", ".$pdf->plantel["telefono2"].", ".$pdf->plantel["telefono3"]),
            "redes_sociales"=>$pdf->plantel["redes_sociales"]
        ]
  ];
  $widths = ["correo"=>58,"telefono"=>58,"redes_sociales"=>60];
  $length = ["correo"=>30,"telefono"=>30,"redes_sociales"=>35];

  $pdf->Tabla($headers,$data,$widths,0,$length);


  $pdf->Ln(5);
  // Solicitante
  $pdf->SetFillColor( 166, 166, 166 );
  $pdf->SetFont( "Arial", "B", 9 );
  $pdf->Cell( 0, 5, utf8_decode("DATOS DEL SOLICITANTE (PERSONA FÍSICA O REPRESENTANTE LEGAL DE LA PERSONA JURÍDICA)"), 1, 1, "C", true );
  $pdf->SetFillColor( 191, 191, 191 );
  $pdf->Cell( 40, 5, utf8_decode("NOMBRE (S)"), 1, 0, "L", true );
  $pdf->SetFillColor( 255, 255, 255 );
  $pdf->SetFont( "Arial", "", 9 );
  $pdf->Cell( 136, 5, utf8_decode($pdf->usuarioR["persona"]["nombre"]), 1, 1, "L", true );
  $pdf->SetFont( "Arial", "B", 9 );
  $pdf->SetFillColor( 191, 191, 191 );
  $pdf->Cell( 40, 5, utf8_decode("APELLIDO PATERNO"), 1, 0, "L", true );
  $pdf->SetFillColor( 255, 255, 255 );
  $pdf->SetFont( "Arial", "", 9 );
  $pdf->Cell( 136, 5, utf8_decode($pdf->usuarioR["persona"]["apellido_paterno"]), 1, 1, "L", true );
  $pdf->SetFont( "Arial", "B", 9 );
  $pdf->SetFillColor( 191, 191, 191 );
  $pdf->Cell( 40, 5, utf8_decode("APELLIDO MATERNO"), 1, 0, "L", true );
  $pdf->SetFillColor( 255, 255, 255 );
  $pdf->SetFont( "Arial", "", 9 );
  $pdf->Cell( 136, 5, utf8_decode($pdf->usuarioR["persona"]["apellido_materno"]), 1, 1, "L", true );
  $pdf->SetFont( "Arial", "B", 9 );
  $pdf->SetFillColor( 191, 191, 191 );
  $pdf->Cell( 40, 5, utf8_decode("NACIONALIDAD "), 1, 0, "L", true );
  $pdf->SetFillColor( 255, 255, 255 );
  $pdf->SetFont( "Arial", "", 9 );
  $pdf->Cell( 136, 5, utf8_decode($pdf->usuarioR["persona"]["nacionalidad"]), 1, 1, "L", true );

  // Domicilio SOLICITANTE
  $pdf->SetFont( "Arial", "B", 9 );
  $pdf->SetFillColor( 191, 191, 191 );
  $pdf->Cell( 116, 5, utf8_decode("CALLE Y NÚMERO"), 1, 0, "L", true );
  $pdf->Cell( 60, 5, utf8_decode("COLONIA"), 1, 1, "L", true );

  $pdf->SetFillColor( 255, 255, 255 );
  $pdf->SetFont( "Arial", "", 9 );
  $pdf->Cell( 116, 5, utf8_decode($pdf->domicilioRepresentante["calle"]." ".$pdf->domicilioRepresentante["numero_exterior"]." ".$pdf->domicilioRepresentante["numero_interior"]), 1, 0, "L", true );
  $pdf->Cell( 60, 5, utf8_decode($pdf->domicilioRepresentante["colonia"]), 1, 1, "L", true );

  $pdf->SetFillColor( 191, 191, 191 );
  $pdf->SetFont( "Arial", "B", 9 );
  $pdf->Cell( 58, 5, utf8_decode("CÓDIGO POSTAL"), 1, 0, "L", true );
  $pdf->Cell( 58, 5, utf8_decode("DELEGACIÓN O MUNICIPIO"), 1, 0, "L", true );
  $pdf->Cell( 60, 5, utf8_decode("ENTIDAD FEDERATIVA"), 1, 1, "L", true );

  $pdf->SetFillColor( 255, 255, 255 );
  $pdf->SetFont( "Arial", "", 9 );
  $pdf->Cell( 58, 5, utf8_decode($pdf->domicilioRepresentante["codigo_postal"]), 1, 0, "L", true );
  $pdf->Cell( 58, 5, utf8_decode($pdf->domicilioRepresentante["municipio"]), 1, 0, "L", true );
  $pdf->Cell( 60, 5, utf8_decode($pdf->domicilioRepresentante["estado"]), 1, 1, "L", true );

  $pdf->SetFont( "Arial", "B", 9 );
  $pdf->SetFillColor( 191, 191, 191 );
  $pdf->Cell( 116, 5, utf8_decode("TELÉFONO"), 1, 0, "L", true );
  $pdf->Cell( 60, 5, utf8_decode("CORREO ELECTRÓNICO"), 1, 1, "L", true );

  $pdf->SetFillColor( 255, 255, 255 );
  $pdf->SetFont( "Arial", "", 9 );
  $pdf->Cell( 116, 5, utf8_decode($pdf->usuarioR["persona"]["telefono"]), 1, 0, "L", true );
  $pdf->Cell( 60, 5, utf8_decode($pdf->usuarioR["persona"]["correo"]), 1, 1, "L", true );

  //diligencias
  $pdf->AliasNbPages( );
  $pdf->AddPage( "P", "Letter" );
  // Nombre del formato
  $pdf->SetFont( "Arial", "B", 11 );
  $pdf->Ln( 10 );
  $pdf->SetTextColor( 255, 255, 255 );
  $pdf->SetFillColor( 0, 127, 204 );
  $pdf->Cell( 140, 5, "", 0, 0, "L");
  $pdf->Cell( 35, 6, "FDA02", 0, 0, "R", true);
  $pdf->Ln( 20 );

  $pdf->SetTextColor( 0, 0, 0 );
  $pdf->SetFillColor( 166, 166, 166 );
  $pdf->SetFont( "Arial", "B", 9 );
  $pdf->MultiCell( 0, 5, utf8_decode("PERSONAL DESIGNADO PARA REALIZAR LAS DILIGENCIAS PARA EL DESARROLLO Y SEGUIMIENTO DE LA SOLICITUD DE RVOE"), 1, "C", true );
  foreach ($pdf->nombresDiligencias as $key => $diligencia) {
    $pdf->SetFillColor( 191, 191, 191 );
    $pdf->SetFont( "Arial", "B", 9 );
    $pdf->Cell( 60, 5, utf8_decode("NOMBRE"), 1, 0, "L", true );
    $pdf->SetFillColor( 255, 255, 255 );
    $pdf->SetFont( "Arial", "", 9 );
    $pdf->Cell( 116, 5, utf8_decode($diligencia["nombre"]), 1, 1, "L", true );
    $pdf->SetFont( "Arial", "B", 9 );
    $pdf->SetFillColor( 191, 191, 191 );
    $pdf->SetFont( "Arial", "B", 9 );
    $pdf->Cell( 60, 5, utf8_decode("CARGO"), 1, 0, "L", true );
    $pdf->SetFillColor( 255, 255, 255 );
    $pdf->SetFont( "Arial", "", 9 );
    $pdf->Cell( 116, 5, utf8_decode($diligencia["cargo"]), 1, 1, "L", true );
    $pdf->SetFont( "Arial", "B", 9 );
    $pdf->SetFillColor( 191, 191, 191 );
    $pdf->Cell( 60, 5, utf8_decode("TELÉFONO DIRECTO Y CELULAR"), 1, 0, "L", true );
    $pdf->SetFillColor( 255, 255, 255 );
    $pdf->SetFont( "Arial", "", 9 );
    $pdf->Cell( 116, 5, utf8_decode($diligencia["telefono"]." y ".$diligencia["celular"]), 1, 1, "L", true );
    $pdf->SetFillColor( 191, 191, 191 );
    $pdf->SetFont( "Arial", "B", 9 );
    $pdf->Cell( 60, 5, utf8_decode("CORREO ELECTRÓNICO"), 1, 0, "L", true );
    $pdf->SetFillColor( 255, 255, 255 );
    $pdf->SetFont( "Arial", "", 9 );
    $pdf->Cell( 116, 5, utf8_decode($diligencia["correo"]), 1, 1, "L", true );
    $pdf->SetFillColor( 191, 191, 191 );
    $pdf->SetFont( "Arial", "B", 9 );
    $pdf->Cell( 60, 5, utf8_decode("HORARIO DE TRABAJO"), 1, 0, "L", true );
    $pdf->SetFillColor( 255, 255, 255 );
    $pdf->SetFont( "Arial", "", 9 );
    $pdf->Cell( 116, 5, utf8_decode($diligencia["horario"]), 1, 1, "L", true );
    if(sizeof($pdf->nombresDiligencias) > $key+1){
      $pdf->SetFillColor( 166, 166, 166 );
      $pdf->Cell( 0, 5, "", 1, 1, "C", true );
    }
  }
  $pdf->SetTextColor( 127, 127,127 );
  $pdf->SetFont( "Arial", "", 8 );
  $pdf->MultiCell( 0, 5, utf8_decode("NOTA: EL PERSONAL DESIGNADO DEBERÁ CONTAR CON CARTA PODER CERTIFICADA POR NOTARIO, LA CUAL DEBERÁ PRESENTAR PARA CUALQUIER DILIGENCIA A REALZAR. "), 0, "L");
$pdf->SetTextColor( 0, 0,0 );
$pdf->SetFont( "Arial", "B", 9 );

  if(!$pdf->institucion["es_nombre_autorizado"]){
    $pdf->Ln( 10 );
    $pdf->SetFillColor( 166, 166, 166 );
    $pdf->Cell( 0, 5, utf8_decode("NOMBRES PROPUESTOS PARA LA INSTITUCIÓN EDUCATIVA"), 1, 1, "C", true );
    $pdf->SetFillColor( 191, 191, 191 );
    $pdf->SetFont( "Arial", "B", 9 );
    $pdf->Cell( 60, 5, utf8_decode("1"), 1, 0, "L", true );
    $pdf->SetFillColor( 255, 255, 255 );
    $pdf->SetFont( "Arial", "", 9 );
    $pdf->Cell( 116, 5, utf8_decode($pdf->ratificacion["nombre_propuesto1"]), 1, 1, "L", true );
    $pdf->SetFillColor( 191, 191, 191 );
    $pdf->SetFont( "Arial", "B", 9 );
    $pdf->Cell( 60, 5, utf8_decode("2"), 1, 0, "L", true );
    $pdf->SetFillColor( 255, 255, 255 );
    $pdf->SetFont( "Arial", "", 9 );
    $pdf->Cell( 116, 5, utf8_decode($pdf->ratificacion["nombre_propuesto2"]), 1, 1, "L", true );
    $pdf->SetFillColor( 191, 191, 191 );
    $pdf->SetFont( "Arial", "B", 9 );
    $pdf->Cell( 60, 5, utf8_decode("3"), 1, 0, "L", true );
    $pdf->SetFillColor( 255, 255, 255 );
    $pdf->SetFont( "Arial", "", 9 );
    $pdf->Cell( 116, 5, utf8_decode($pdf->ratificacion["nombre_propuesto3"]), 1, 1, "L", true );
    $pdf->Ln( 10 );

  } else {
    $pdf->Ln( 10 );
    $pdf->SetFillColor( 166, 166, 166 );
    $pdf->SetFont( "Arial", "B", 9 );
    $pdf->Cell( 0, 5, utf8_decode("RATIFICACIÓN DE NOMBRE"), 1, 1, "C", true );
    $pdf->SetFillColor( 191, 191, 191 );
    $pdf->SetFont( "Arial", "B", 9 );
    $pdf->Cell( 60, 5, utf8_decode("NOMBRE SOLICITADO "), 1, 0, "L", true );
    $pdf->SetFillColor( 255, 255, 255 );
    $pdf->SetFont( "Arial", "", 9 );
    $pdf->Cell( 116, 5, utf8_decode($pdf->ratificacion["nombre_solicitado"]), 1, 1, "L", true );
    $pdf->SetFillColor( 191, 191, 191 );
    $pdf->SetFont( "Arial", "B", 9 );
    $pdf->Cell( 60, 5, utf8_decode("NOMBRE AUTORIZADO"), 1, 0, "L", true );
    $pdf->SetFillColor( 255, 255, 255 );
    $pdf->SetFont( "Arial", "", 9 );
    $pdf->Cell( 116, 5, utf8_decode($pdf->ratificacion["nombre_autorizado"]), 1, 1, "L", true );
    $pdf->SetFillColor( 191, 191, 191 );
    $pdf->SetFont( "Arial", "B", 9 );
    $pdf->Cell( 60, 5, utf8_decode("NIVEL Y NOMBRE DEL PROGRAMA"), 1, 0, "L", true );
    $pdf->SetFillColor( 255, 255, 255 );
    $pdf->SetFont( "Arial", "", 9 );
    $pdf->Cell( 116, 5, utf8_decode($pdf->nivel["descripcion"]." en ".$pdf->programa["nombre"]), 1, 1, "L", true );
    $pdf->SetFillColor( 191, 191, 191 );
    $pdf->SetFont( "Arial", "B", 9 );
    $pdf->Cell( 60, 5, utf8_decode("ACUERDO "), 1, 0, "L", true );
    $pdf->SetFillColor( 255, 255, 255 );
    $pdf->SetFont( "Arial", "", 9 );
    $pdf->Cell( 116, 5, utf8_decode($pdf->ratificacion["acuerdo"]), 1, 1, "L", true );
    $pdf->SetFillColor( 191, 191, 191 );
    $pdf->SetFont( "Arial", "B", 9 );
    $pdf->Cell( 60, 5, utf8_decode("INSTANCIA QUE AUTORIZA"), 1, 0, "L", true );
    $pdf->SetFillColor( 255, 255, 255 );
    $pdf->SetFont( "Arial", "", 9 );
    $pdf->Cell( 116, 5, utf8_decode($pdf->ratificacion["autoridad"]), 1, 1, "L", true );
  }
  $pdf->Ln( 30 );
  $pdf->SetFont( "Arial", "", 11 );
  $pdf->Cell(0,5, utf8_decode("BAJO PROTESTA DE DECIR VERDAD"), 0, 1, "C");
  $pdf->SetFont( "Arial", "B", 11 );
  $pdf->Cell( 0, 5, utf8_decode(mb_strtoupper($pdf->nombreRepresentante)), 0, 1, "C");



  $pdf->Output( "I", "FDA02.pdf" );
?>
