<?php
  require( "pdf.php" );

  session_start( );

  if(!isset($_GET["id"]) && !$_GET["id"]){
    header("../home.php");
  }

  class FDA06 extends PDF{

    public function nuevaPagina(){
      $this->AliasNbPages( );
      $this->AddPage( "P", "Letter" );
    }

    public function getNombreFormato(){
      // Nombre del formato
        $this->SetFont( "Arial", "B", 11 );
        $this->Ln( 10);
        $this->SetTextColor( 255, 255, 255 );
        $this->SetFillColor( 0, 127, 204 );
        $this->Cell( 140, 5, "", 0, 0, "L");
        $this->Cell( 35, 6, "FDA06", 0, 0, "R", true);
        $this->Ln( 10 );
        $this->SetTextColor( 0, 0, 0 );
    }
  }

  $pdf = new FDA06();
  $pdf->getData($_GET["id"]);
  $pdf->getDataPlantel($pdf->plantel["id"]);

  $pdf->nuevaPagina();

  $pdf->SetFont( "Arial", "B", 10 );
  $pdf->SetMargins(20, 20 , 20);

  // Nombre del formato
  $pdf->Ln( 15 );
  $pdf->getNombreFormato();

  $pdf->SetTextColor( 0, 127, 204 );
  $pdf->Cell( 0, 5, utf8_decode("OBLIGACIONES ADQUIRIDAS AL OBTENER UN RVOE"), 0, 1, "L");
  $pdf->SetTextColor( 0, 0, 0 );
  $pdf->Ln( 5 );
 
  if("Masculino" == $pdf->usuarioR["persona"]["sexo"]){
    $prefijo = "El";
  }else{
    $prefijo = "La";
  }
  $folio = $pdf->solicitud["folio"];
  $programa = $pdf->nivel["descripcion"]."en ".$pdf->programa["nombre"];
  $modalidad = $pdf->modalidad["nombre"];
  $periodo = $pdf->ciclo["nombre"];

  $pdf->SetFont( "Arial", "", 9 );
  $pdf->MultiCell( 0, 5,
        utf8_decode("$prefijo C. $pdf->nombreRepresentante de $pdf->nombreInstitucion declara, bajo protesta de decir verdad, que los datos proporcionados en la Solicitud $folio cuenta con un inmueble con las condiciones de seguridad, higiénicas necesarias para impartir el plan de estudios para el programa $programa , modalidad $modalidad en periodos $periodo, asimismo ACEPTA cumplir y se compromete con las siguientes obligaciones derivadas del otorgamiento del Reconocimiento de Validez Oficial de Estudios.")
        , 0, "J");
  $pdf->Ln( 5 );

  $pdf->MultiCell( 0, 5,
        utf8_decode("1.- Cumplir con lo dispuesto en la Constitución Política de los Estados Unidos Mexicanos en el artículo 3°, la Ley General de Educación, en la Ley de Educación del Estado de Jalisco, y demás disposiciones legales y administrativas que le sean aplicables.")
        , 0, "J");
  $pdf->Ln( 5 );

  $pdf->MultiCell( 0, 5,
        utf8_decode("2.- Mencionar, en toda su documentación y publicidad que expida, la fecha y número del acuerdo por el cual se otorgó el Reconocimiento de Validez Oficial de Estudios (RVOE), así como la autoridad que lo expidió y el periodo establecido.")
        , 0, "J");
  $pdf->Ln( 5 );

  $pdf->MultiCell( 0, 5,
        utf8_decode("3.- Respetar los lineamientos descritos en el Acuerdo del Reconocimiento de Validez Oficial (RVOE), que establecen  los lineamientos legales  para la comercialización de los servicios educativos que prestan los particulares.")
        , 0, "J");
  $pdf->Ln( 5 );

  $pdf->MultiCell( 0, 5,
        utf8_decode("4.- Ceñirse a los planes y programas autorizados por la autoridad educativa y a los tiempos aprobados para su aplicación.")
        , 0, "J");
  $pdf->Ln( 5 );

  $pdf->MultiCell( 0, 5,
        utf8_decode("5.- Los planes y programas de estudio validados por la Autoridad Educativa, una vez que son aprobados no podrán modificarse hasta su vencimiento, de lo contrario no tendrá validez para cualquier trámite ante cualquier autoridad competente.
        .")
        , 0, "J");
  $pdf->Ln( 5 );

  $pdf->MultiCell( 0, 5,
        utf8_decode("6.- La Institución se compromete a mantener actualizados los planes y programas de estudio de acuerdo a los avances de la materia y someterlos a refrendo al término del periodo establecido por la Autoridad Educativa.")
        , 0, "J");
  $pdf->Ln( 5 );

  $pdf->MultiCell( 0, 5,
        utf8_decode("7.- Reportar a la Autoridad Educativa, cualquier daño o modificación que sufra el inmueble en su estructura, con posterioridad a la fecha de presentación de la solicitud de autorización del Reconocimiento de Validez Oficial de Estudios, proporcionando, en su caso, los datos de la nueva constancia en la que se acredite que las reparaciones o modificaciones cumplen con las normas de construcción y seguridad.")
        , 0, "J");
  $pdf->Ln( 5 );

  $pdf->MultiCell( 0, 5,
        utf8_decode("8.- Facilitar y colaborar en las actividades de evaluación, inspección y vigilancia que las autoridades competentes realicen u ordenen, como lo establece la Ley General de Educación en su artículo 149 fracción V.")
        , 0, "J");
  $pdf->Ln( 5 );

  $pdf->MultiCell( 0, 5,
        utf8_decode("9.- Conservar de manera física en el domicilio en el que se autorizó el RVOE, todos los documentos administrativos y de control escolar que se generen,  de conformidad a la Ley General de Educación en su artículo 151.")
        , 0, "J");
  $pdf->Ln( 5 );

  $pdf->MultiCell( 0, 5,
        utf8_decode("10.- Mantener vigente la posesión legal del inmueble, el Dictamen de seguridad estructural, Licencia de uso de suelo, Dictamen de protección civil y Licencia municipal.")
        , 0, "J");
  $pdf->Ln( 5 );

  $pdf->nuevaPagina();
  $pdf->Ln( 15 );

  $pdf->MultiCell( 0, 5,
        utf8_decode("11.- Constituir el Comité de Seguridad Escolar, de conformidad con los lineamientos establecidos en el Diario Oficial de la Federación del 4 de septiembre de 1986.")
        , 0, "J");
  $pdf->Ln( 5 );

  $pdf->MultiCell( 0, 5,
        utf8_decode("12.- La Secretaría de Innovación, Ciencia y Técnologia (SICyT) verificará las instalaciones para que cumplan con la normatividad vigente, higiene seguridad y pedagogía.")
        , 0, "J");
  $pdf->Ln( 5 );

  $pdf->MultiCell( 0, 5,
        utf8_decode("13.- Cumplir con el perfil de personal docente, tanto de nuevo ingreso como los propuestos a una asignatura diferente. Cualquier modificación deberá presentarse a la Autoridad Educativa para su autorización.")
        , 0, "J");
  $pdf->Ln( 5 );

  $pdf->MultiCell( 0, 5,
        utf8_decode("14.- Contar con el acervo bibliográfico y los recursos didácticos requeridos para el desarrollo del plan de estudios y sus respectivos programas.")
        , 0, "J");
  $pdf->Ln( 5 );

  $pdf->MultiCell( 0, 5,
        utf8_decode("15.- Proporcionar un mínimo de becas del 5% del total de población estudiantil, establecidas en la Ley y los lineamientos en la materia. Generar documentación que lo acredite y tenerla en físico dado a que la SICyT puede solicitarla en alguna visita de vigilancia.")
        , 0, "J");
  $pdf->Ln( 5 );

  $pdf->MultiCell( 0, 5,
        utf8_decode("16.- Pagar anualmente la matrícula de alumnos por cada RVOE otorgado y alumno activo en cada ejercicio escolar, acatando los requisitos y tiempos establecidos en la convocatoria correspondiente..")
        , 0, "J");
  $pdf->Ln( 5 );

  $pdf->MultiCell( 0, 5,
        utf8_decode("17.- Dar el seguimiento académico y reportar a la Dirección de Servicios Escolares los avances académicos de los alumnos a partir de su inscripción, acreditación, regularización, reinscripción, certificación y titulación.")
        , 0, "J");
  $pdf->Ln( 5 );

  $pdf->MultiCell( 0, 5,
        utf8_decode("18.- Una vez recibido el Acuerdo de Incorporación, el particular deberá realizar los registros ante las autoridades correspondientes, los trámites para la asignación de la clave de centro de trabajo ante la Secretaría de Educación Jalisco, su registro ante la Dirección de Profesiones del Estado de Jalisco y la Dirección General de Profesiones de la Secretaría de Educación Pública y aquellos que correspondan.")
        , 0, "J");
  $pdf->Ln( 5 );

  $pdf->MultiCell( 0, 5,
        utf8_decode("19.- Es obligación de la Institución Educativa, que la documentación que presenta sea auténtica.")
        , 0, "J");
  $pdf->Ln( 5 );

  $pdf->MultiCell( 0, 5,
        utf8_decode("20.- Emitir sus propios reglamentos internos, solicitar la autorización a la Secretaría de Innovación Ciencia y Tecnología; una vez autorizados, los dará a conocer antes del trámite de inscripción o reinscripción. Deberá conservar evidencia a fin de que la Autoridad Educativa verifique el cumplimiento de esta obligación..")
        , 0, "J");
  $pdf->Ln( 5 );

  $pdf->SetFont( "Arial", "", 11 );
  $pdf->Ln( 20 );
  $pdf->Cell( 0, 5, "BAJO PROTESTA DE DECIR VERDAD", 0, 0, "C");
  $pdf->Ln( 5 );
  $pdf->SetFont( "Arial", "B", 11 );
  $pdf->Cell( 0, 5, utf8_decode(mb_strtoupper($pdf->nombreRepresentante)), 0, 0, "C");
  $pdf->Ln( 10 );

  $domicilio1 = $pdf->domicilioPlantel["calle"]." "
  .$pdf->domicilioPlantel["numero_exterior"]." "
  .$pdf->domicilioPlantel["numero_interior"].", "
  .$pdf->domicilioPlantel["colonia"]." "
  .$pdf->domicilioPlantel["codigo_postal"];
  $domicilio2 = $pdf->domicilioPlantel["municipio"]." "
  .$pdf->domicilioPlantel["estado"].", México";

  $pdf->SetFont( "Arial", "", 11 );
  $pdf->Cell( 0, 5, utf8_decode($pdf->nombreInstitucion), 0, 1, "C");
  $pdf->Cell( 0, 5, utf8_decode($domicilio1), 0, 1, "C");
  $pdf->Cell( 0, 5, utf8_decode($domicilio2), 0, 1, "C");
  $pdf->Cell( 0, 5, utf8_decode("Acuerdo No. ".$pdf->programa["acuerdo_rvoe"]), 0, 1, "C");

  $pdf->Output( "I", "FDA06.pdf" );
