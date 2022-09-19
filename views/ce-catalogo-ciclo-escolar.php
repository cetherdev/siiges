<?php
	// Válida los permisos del usuario de la sesión
	require_once "../utilities/utileria-general.php";
	Utileria::validarSesion( basename( __FILE__ ) );

	//====================================================================================================

	require_once "../models/modelo-programa.php";
	require_once "../models/modelo-ciclo-escolar.php";

	$programa = new Programa( );
	$programa->setAttributes( array( "id"=>$_GET["programa_id"] ) );
	$resultadoPrograma = $programa->consultarId( );

	if( $_GET["proceso"]=="alta" )
	{
		$titulo = "Alta de Ciclo Escolar";
	}

	if( $_GET["proceso"]=="consulta" )
	{
		$titulo = "Consulta de Ciclo Escolar";

		$cicloEscolar = new CicloEscolar( );
		$cicloEscolar->setAttributes( array( "id"=>$_GET["ciclo_id"] ) );
		$resultadoCicloEscolar = $cicloEscolar->consultarId( );
	}

	if( $_GET["proceso"]=="edicion" )
	{
		$titulo = "Edici&oacute;n de Ciclo Escolar";

		$cicloEscolar = new CicloEscolar( );
		$cicloEscolar->setAttributes( array( "id"=>$_GET["ciclo_id"] ) );
		$resultadoCicloEscolar = $cicloEscolar->consultarId( );
	}
?>


<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>SIIGES</title>
	<!-- CSS GOB.MX -->
	<link href="../favicon.ico" rel="shortcut icon">
	<link href="https://framework-gb.cdn.gob.mx/assets/styles/main.css" rel="stylesheet">
	<!-- CSS DATATABLE -->
	<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">
	<!-- CSS LIVESELECT -->
	<link rel="stylesheet" type="text/css" href="../css/bootstrap-select.min.css">
	<!-- CSS CALENDAR -->
	<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<!-- CSS PROPIO -->
	<link rel="stylesheet" type="text/css" href="../css/estilos.css">
</head>

<body>
	<!-- HEADER Y MENÚ -->
	<?php require_once "menu.php"; ?>

	<!-- CUERPO DE PANTALLA -->
	<div class="container">
		<section class="main row margin-section-formularios">

			<!-- BARRA DE INFORMACION -->
			<div class="row" style="padding-left: 15px; padding-right: 15px;">
				<div class="col-sm-12 col-md-12 col-lg-12">
					<!-- BARRA DE USUARIO -->
					<ol class="breadcrumb pull-right">
						<li><i class="icon icon-user"></i></li>
						<li><?php echo $_SESSION["nombre_rol"]; ?></li>
						<li class="active"><?php echo $_SESSION["nombre"]." ".$_SESSION["apellido_paterno"]." ".$_SESSION["apellido_materno"]; ?></li>
					</ol>
					<!-- BARRA DE NAVEGACION -->
					<ol class="breadcrumb pull-left">
						<li><i class="icon icon-home"></i></li>
						<li><a href="ce-programas.php">Programas de Estudios</a></li>
						<li><a href="ce-ciclos-escolares.php?programa_id=<?php echo $_GET["programa_id"]; ?>">Ciclos Escolares</a></li>
						<li class="active"><?php echo $titulo; ?></li>
					</ol>
				</div>
			</div>

			<!-- CUERPO PRINCIPAL -->
			<form name="form1" method="post" action="../controllers/control-ciclo-escolar.php">
			<div class="col-sm-12 col-md-12 col-lg-12">
				<!-- TÍTULO -->
				<h2 id="txtNombre"><?php echo $titulo; ?></h2>
				<hr class="red">
				<div class="row">
          <div class="col-sm-12">
						<legend><?php echo $resultadoPrograma["data"]["nombre"]; ?></legend>
					</div>
				</div>
				<!-- CONTENIDO -->
				<div class="row">
          <div class="col-sm-4">
            <div class="form-group">
							<label class="control-label" for="id">Id</label>
							<input type="text" id="id" name="id" value="<?php echo (isset($resultadoCicloEscolar)) ? $resultadoCicloEscolar["data"]["id"] : ""; ?>" maxlength="11" class="form-control" readonly />
						</div>
          </div>
					<div class="col-sm-4">
            <div class="form-group">
							<label class="control-label" for="programa_id">Programa Id</label>
							<input type="text" id="programa_id" name="programa_id" value="<?php echo $_GET["programa_id"]; ?>" maxlength="11" class="form-control" required readonly />
						</div>
          </div>
        </div>
				<div class="row">
          <div class="col-sm-4">
            <div class="form-group">
							<?php if(Rol::ROL_REVALIDACION_EQUIVALENCIA == $_SESSION["rol_id"] ){ ?>
							<label class="control-label" for="nombre">Equivalencias</label>
							<select id="nombre" name="nombre" value="<?php echo (isset($resultadoCicloEscolar)) ? $resultadoCicloEscolar["data"]["nombre"] : ""; ?>" maxlength="255" class="form-control" required >
								<option value=""> </option>
								<option value="EQUIV" <?php if (isset($resultadoCicloEscolar)) { if( $resultadoCicloEscolar["data"]["nombre"]=="EQUIV" ) { echo "selected"; }} ?>>EQUIV</option>
							</select>
						<?php } else { ?>
							<label class="control-label" for="nombre">Nombre de Ciclo Escolar</label>
							<select id="nombre" name="nombre" value="<?php echo (isset($resultadoCicloEscolar)) ? $resultadoCicloEscolar["data"]["nombre"] : ""; ?>" maxlength="255" class="form-control" required >
								<option value=""> </option>
								<option value="2015A" <?php if (isset($resultadoCicloEscolar)) { if( $resultadoCicloEscolar["data"]["nombre"]=="2015A" ) { echo "selected"; }} ?>>2015A</option>
								<option value="2015B" <?php if (isset($resultadoCicloEscolar)) { if( $resultadoCicloEscolar["data"]["nombre"]=="2015B" ) { echo "selected"; }} ?>>2015B</option>
								<option value="2015C" <?php if (isset($resultadoCicloEscolar)) { if( $resultadoCicloEscolar["data"]["nombre"]=="2015C" ) { echo "selected"; }} ?>>2015C</option>
								<option value="2016A" <?php if (isset($resultadoCicloEscolar)) { if( $resultadoCicloEscolar["data"]["nombre"]=="2016A" ) { echo "selected"; }} ?>>2016A</option>
								<option value="2016B" <?php if (isset($resultadoCicloEscolar)) { if( $resultadoCicloEscolar["data"]["nombre"]=="2016B" ) { echo "selected"; }} ?>>2016B</option>
								<option value="2016C" <?php if (isset($resultadoCicloEscolar)) { if( $resultadoCicloEscolar["data"]["nombre"]=="2016C" ) { echo "selected"; }} ?>>2016C</option>
								<option value="2017A" <?php if (isset($resultadoCicloEscolar)) { if( $resultadoCicloEscolar["data"]["nombre"]=="2017A" ) { echo "selected"; }} ?>>2017A</option>
								<option value="2017B" <?php if (isset($resultadoCicloEscolar)) { if( $resultadoCicloEscolar["data"]["nombre"]=="2017B" ) { echo "selected"; }} ?>>2017B</option>
								<option value="2017C" <?php if (isset($resultadoCicloEscolar)) { if( $resultadoCicloEscolar["data"]["nombre"]=="2017C" ) { echo "selected"; }} ?>>2017C</option>
								<option value="2018A" <?php if (isset($resultadoCicloEscolar)) { if( $resultadoCicloEscolar["data"]["nombre"]=="2018A" ) { echo "selected"; }} ?>>2018A</option>
								<option value="2018B" <?php if (isset($resultadoCicloEscolar)) { if( $resultadoCicloEscolar["data"]["nombre"]=="2018B" ) { echo "selected"; }} ?>>2018B</option>
								<option value="2018C" <?php if (isset($resultadoCicloEscolar)) { if( $resultadoCicloEscolar["data"]["nombre"]=="2018C" ) { echo "selected"; }} ?>>2018C</option>
								<option value="2019A" <?php if (isset($resultadoCicloEscolar)) { if( $resultadoCicloEscolar["data"]["nombre"]=="2019A" ) { echo "selected"; }} ?>>2019A</option>
								<option value="2019B" <?php if (isset($resultadoCicloEscolar)) { if( $resultadoCicloEscolar["data"]["nombre"]=="2019B" ) { echo "selected"; }} ?>>2019B</option>
								<option value="2019C" <?php if (isset($resultadoCicloEscolar)) { if( $resultadoCicloEscolar["data"]["nombre"]=="2019C" ) { echo "selected"; }} ?>>2019C</option>
								<option value="2020A" <?php if (isset($resultadoCicloEscolar)) { if( $resultadoCicloEscolar["data"]["nombre"]=="2020A" ) { echo "selected"; }} ?>>2020A</option>
								<option value="2020B" <?php if (isset($resultadoCicloEscolar)) { if( $resultadoCicloEscolar["data"]["nombre"]=="2020B" ) { echo "selected"; }} ?>>2020B</option>
								<option value="2020C" <?php if (isset($resultadoCicloEscolar)) { if( $resultadoCicloEscolar["data"]["nombre"]=="2020C" ) { echo "selected"; }} ?>>2020C</option>
								<option value="2021A" <?php if (isset($resultadoCicloEscolar)) { if( $resultadoCicloEscolar["data"]["nombre"]=="2021A" ) { echo "selected"; }} ?>>2021A</option>
								<option value="2021B" <?php if (isset($resultadoCicloEscolar)) { if( $resultadoCicloEscolar["data"]["nombre"]=="2021B" ) { echo "selected"; }} ?>>2021B</option>
								<option value="2021C" <?php if (isset($resultadoCicloEscolar)) { if( $resultadoCicloEscolar["data"]["nombre"]=="2021C" ) { echo "selected"; }} ?>>2021C</option>
								<option value="2022A" <?php if (isset($resultadoCicloEscolar)) { if( $resultadoCicloEscolar["data"]["nombre"]=="2022A" ) { echo "selected"; }} ?>>2022A</option>
								<option value="2022B" <?php if (isset($resultadoCicloEscolar)) { if( $resultadoCicloEscolar["data"]["nombre"]=="2022B" ) { echo "selected"; }} ?>>2022B</option>
								<option value="2022C" <?php if (isset($resultadoCicloEscolar)) { if( $resultadoCicloEscolar["data"]["nombre"]=="2022C" ) { echo "selected"; }} ?>>2022C</option>
							</select>
							<?php } ?>
						</div>
          </div>
					<div class="col-sm-8">
					  <div class="form-group">
							<label class="control-label" for="descripcion">Descripci&oacute;n</label>
							<input type="text" id="descripcion" name="descripcion" value="<?php echo (isset($resultadoCicloEscolar)) ? $resultadoCicloEscolar["data"]["descripcion"] : ""; ?>" maxlength="255" class="form-control" />
						</div>
          </div>
        </div>
				<?php
					if( $_GET["proceso"]!="consulta" )
					{
				?>
				<div class="row">
          <div class="col-sm-12">
            <div class="form-group">
							<input type="submit" id="submit" name="submit" value="Enviar" class="btn btn-primary" />
							<input type="hidden"  name="webService" value="guardar" />
							<input type="hidden"  name="url" value="../views/ce-ciclos-escolares.php?programa_id=<?php echo $_GET["programa_id"]; ?>&codigo=200" />
						</div>
          </div>
        </div>
				<?php
					}
				?>
			</div>
			</form>

		</section>
	</div>

<!-- JS GOB.MX -->
<script src="https://framework-gb.cdn.gob.mx/gobmx.js"></script>
<!-- JS JQUERY -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- JS DATATABLE -->
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
<!-- JS LIVESELECT -->
<script src="../js/bootstrap-select.min.js"></script>
<!-- JS CALENDAR -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	$(document).ready(function(){
		$("#fecha_nacimiento").datepicker({
			firstDay: 1,
			monthNames: ['Enero','Febrero','Marzo','Abril','Mayo','Junio','Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre'],
			dayNamesMin: ['Do','Lu','Ma','Mi','Ju','Vi','Sá'],
			dateFormat: 'yy-mm-dd'
		});
	});
</script>
</body>
</html>
