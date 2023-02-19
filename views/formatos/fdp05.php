<?php
  require( "pdf.php" );
  require_once "../../models/modelo-solicitud.php";


  session_start( );

  if(!isset($_GET["id"]) && !$_GET["id"]){
    header("../home.php");
  }

  class FDP05 extends PDF{

    public function nuevaPagina(){
      $this->AliasNbPages( );
      $this->AddPage( "P", "Letter" );
    }

    public function getNombreFormato(){
      // Nombre del formato
        $this->SetFont( "Nutmegb", "", 11 );
        $this->Ln( 10);
        $this->SetTextColor( 255, 255, 255 );
        $this->SetFillColor( 0, 127, 204 );
        $this->Cell( 140, 5, "", 0, 0, "L");
        $this->Cell( 35, 6, "FDP05", 0, 0, "R", true);
        $this->Ln( 10 );
        $this->SetTextColor( 0, 0, 0 );
    }
  }

  $pdf = new FDP05();
  $pdf->getTrayectoria($_GET["id"]);

  $pdf->nuevaPagina();

  $pdf->SetFont( "Nutmegb", "", 11 );
  $pdf->SetMargins(20, 35 , 20);
  $pdf->SetAutoPageBreak(true, 30);

  // Nombre del formato
  $pdf->Ln( 15 );
  $pdf->getNombreFormato();

  $pdf->SetTextColor( 0, 127, 204 );
  $pdf->Cell( 0, 5, utf8_decode("TRAYECTORIA EDUCATIVA Y TUTORÍA DE LOS ESTUDIANTES"), 0, 1, "L");
  $pdf->SetTextColor( 0, 0, 0 );
  $pdf->Ln( 10 );

  $pdf->SetFillColor( 166, 166, 166 );
  $pdf->SetFont( "Nutmegb", "", 9 );
  $pdf->Cell( 0, 5, utf8_decode("1. PROGRAMA DE SEGUIMIENTO DE LA TRAYECTORIA ACADÉMICA DE LOS ESTUDIANTES"), 1, 1, "C", true );
  $pdf->Ln(5);
  $pdf->SetFont( "Nutmeg", "", 9 );
  $pdf->MultiCell( 0, 5, utf8_decode($pdf->trayectoria["programa_seguimiento"]), 0, "J");
  if($pdf->checkNewPage()){
  }
  $pdf->Ln( 5 );

  $pdf->SetFillColor( 166, 166, 166 );
  $pdf->SetFont( "Nutmegb", "", 10 );
  $pdf->Cell( 0, 5, utf8_decode("2. FUNCIÓN TUTORIAL"), 1, 1, "C", true );
  $pdf->SetFont("Nutmeg", "", 9 );
  $pdf->MultiCell( 0, 5, utf8_decode($pdf->trayectoria["funcion_tutorial"]), 0, "J");
  if($pdf->checkNewPage()){
    $pdf->Ln(15);
  }
  $pdf->Ln( 5 );

  $pdf->SetFillColor( 166, 166, 166 );
  $pdf->SetFont( "Nutmegb", "", 9 );
  $pdf->Cell( 0, 5, utf8_decode("3. TIPO DE TUTORIA"), 1, 1, "C", true );
  $pdf->SetFont( "Nutmeg", "", 9 );
  $pdf->MultiCell( 0, 5, utf8_decode($pdf->trayectoria["tipo_tutoria"]), 0, "J");
  if($pdf->checkNewPage()){
    $pdf->Ln(15);
  }
  $pdf->Ln( 5 );

  $pdf->SetFillColor( 166, 166, 166 );
  $pdf->SetFont( "Nutmegb", "", 9 );
  $pdf->Cell( 0, 5, utf8_decode("4. TASA DE EGRESOS"), 1, 1, "C", true );
  $pdf->SetFont( "Nutmeg", "", 9 );
  $pdf->MultiCell( 0, 5, utf8_decode($pdf->trayectoria["tasa_egreso"]), 0, "J");
  if($pdf->checkNewPage()){
    $pdf->Ln(15);
  }
   
  $pdf->Ln( 20 );
  $pdf->SetFont( "Nutmeg", "", 11 );
  $pdf->Cell( 0, 5, "BAJO PROTESTA DE DECIR VERDAD", 0, 0, "C");
  $pdf->Ln( 5);
  $pdf->SetFont( "Nutmegb", "", 11 );

  $pdf->Cell( 0, 5, utf8_decode(mb_strtoupper($pdf->nombreRepresentante)), 0, 0, "C");

  $pdf->Output( "I", "FDP05.pdf" );
