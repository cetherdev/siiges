<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Cambiar/Actualizar datos</title>

	<!-- CSS GOB.MX -->
	<link href="../favicon.ico" rel="shortcut icon">
	<link href="https://framework-gb.cdn.gob.mx/assets/styles/main.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="../css/estilos.css">
</head>

<body class="">
	<!-- HEADER Y BARRA DE NAVEGACION -->
	<?php require_once "menu.php"; ?>

	<!-- CUERPO DEL FORMULARIO -->
	<div class="container">
		<section class="main row margin-section-formularios">
			<div class="col-sm-12 col-md-12 col-lg-9">
				<ol class="breadcrumb">
					<li><a href="#"><i class="icon icon-home"></i></a></li>
					<li><a href="#">SIIGES</a></li>
					<li class="active">Cambiar/Actualizar datos</li>
				</ol>

				<h2 class="">Cambiar/Actualizar datos</h2>
				<hr class="red">

				<!-- INICIA FORMULARIO -->
				<form role="form" class="form">
					<div class="form-group col-md-6">
						<label class="control-label" for="">Seleccione un tipo de cambio/actualización</label><br>
						<select class="form-control">
							<option>Cambio/Actualización del domicilio</option>
							<option>Cambio/Actualización del plan de estudios</option>
							<option>Cambio/Actualización del Representante legal</option>
							<option>...</option>
						</select>
					</div>

					<fieldset class="col-md-12">
						<legend>Llene los siguientes datos:</legend>
						<div class="form-group">
							<label class="control-label" for="">Oficio de entrega (FDA01)</label><br>
							<a href="formatos/fda-01.php" target="_blank">
								<button class="btn btn-default" type="button">
									<span class="glyphicon glyphicon-file"></span>
									Abrir y llenar formato
								</button>
							</a>
						</div>
						<div class="form-group">
							<label class="control-label" for="">Formato de solicitud (FDA02)</label><br>
							<a href="formatos/fda-02.php" target="_blank">
								<button class="btn btn-default" type="button">
									<span class="glyphicon glyphicon-file"></span>
									Abrir y llenar formato
								</button>
							</a>
						</div>
						<div class="form-group">
							<label class="control-label" for="">Identificación oficial con fotografía de la persona física, o acta constitutiva de la persona moral y poder de su Representante Legal</label>
							<input type="file" id="" name="" required>
						</div>
						<div class="form-group">
							<label class="control-label" for="">Formato solicitud para la autorización de nombre de la Institución (FDA03)</label><br>
							<a href="formatos/fda-03.php" target="_blank">
								<button class="btn btn-default" type="button">
									<span class="glyphicon glyphicon-file"></span>
									Abrir y llenar formato
								</button>
							</a>
						</div>
						<div class="form-group">
							<label class="control-label" for="">Comprobante de Pago</label>
							<input type="file" id="" name="" required>
						</div>
						<div class="form-group">
							<label class="control-label" for="">Documentos que acredite la posesión legal del inmueble</label>
							<input type="file" id="" name="" required>
						</div>
						<div class="form-group">
							<label class="control-label" for="">Formato de identificación del plantel (FDA04)</label><br>
							<a href="formatos/fda-04.php" target="_blank">
								<button class="btn btn-default" type="button">
									<span class="glyphicon glyphicon-file"></span>
									Abrir y llenar formato
								</button>
							</a>
						</div>
						<div class="form-group">
							<label class="control-label" for="">Formato plataforma educativa tecnologica (FDA05)</label><br>
							<a href="formatos/fda-05.php" target="_blank">
								<button class="btn btn-default" type="button">
									<span class="glyphicon glyphicon-file"></span>
									Abrir y llenar formato
								</button>
							</a>
						</div>
						<div class="form-group">
							<label class="control-label" for="">Fotografías del inmueble</label>
							<input type="file" id="" name="" required>
						</div>
						<div class="form-group">
							<label class="control-label" for="">Planos</label>
							<input type="file" id="" name="" required>
						</div>
						<div class="form-group">
							<label class="control-label" for="">Dictámenes</label>
							<input type="file" id="" name="" required>
						</div>
						<div class="form-group">
							<label class="control-label" for="">Constancia emitida por INFEJAL</label>
							<input type="file" id="" name="" required>
						</div>
						<div class="form-group">
							<label class="control-label" for="">Licencia Municipal</label>
							<input type="file" id="" name="" required>
						</div>
						<div class="form-group">
							<label class="control-label" for="">Aviso de Funcionamiento de la Secretaría de Salud</label>
							<input type="file" id="" name="" required>
						</div>
						<div class="form-group">
							<label class="control-label" for="">Comprobante de línea telefónica</label>
							<input type="file" id="" name="" required>
						</div>
						<div class="form-group">
							<label class="control-label" for="">Propuesta de Calendario</label>
							<input type="file" id="" name="" required>
						</div>
						<div class="form-group">
							<label class="control-label" for="">Propuesta de Horarios</label>
							<input type="file" id="" name="" required>
						</div>
						<div class="form-group">
							<label class="control-label" for="">Comprobante de Pago</label>
							<input type="file" id="" name="" required>
						</div>
						<div class="form-group">
							<label class="control-label" for="">Obligaciones adquiridas a través de la obtención del RVOE (FDA06)</label><br>
							<a href="formatos/fda-06.php" target="_blank">
								<button class="btn btn-default" type="button">
									<span class="glyphicon glyphicon-file"></span>
									Abrir y llenar formato
								</button>
							</a>
						</div>
						<div class="form-group">
							<label class="control-label" for="">Fundamentación (FDP01)</label><br>
							<a href="formatos/fdp-01.php" target="_blank">
								<button class="btn btn-default" type="button">
									<span class="glyphicon glyphicon-file"></span>
									Abrir y llenar formato
								</button>
							</a>
						</div>
						<div class="form-group">
							<label class="control-label" for="">Plan de estudios (FDP02)</label><br>
							<a href="formatos/fdp-02.php" target="_blank">
								<button class="btn btn-default" type="button">
									<span class="glyphicon glyphicon-file"></span>
									Abrir y llenar formato
								</button>
							</a>
						</div>
						<div class="form-group">
							<label class="control-label" for="">Programa de estudios (FDP03)</label><br>
							<a href="formatos/fdp-03.php" target="_blank">
								<button class="btn btn-default" type="button">
									<span class="glyphicon glyphicon-file"></span>
									Abrir y llenar formato
								</button>
							</a>
						</div>
						<div class="form-group">
							<label class="control-label" for="">Bibliografía (FDP04)</label><br>
							<a href="formatos/fdp-04.php" target="_blank">
								<button class="btn btn-default" type="button">
									<span class="glyphicon glyphicon-file"></span>
									Abrir y llenar formato
								</button>
							</a>
						</div>
						<div class="form-group">
							<label class="control-label" for="">Tutoría de los estudiantes y trayectoria educativa (FDP05)</label><br>
							<a href="formatos/fdp-05.php" target="_blank">
								<button class="btn btn-default" type="button">
									<span class="glyphicon glyphicon-file"></span>
									Abrir y llenar formato
								</button>
							</a>
						</div>
						<div class="form-group">
							<label class="control-label" for="">Proyecto de vinculación y movilidad académica</label>
							<input type="file" id="" name="" required>
						</div>
						<div class="form-group">
							<label class="control-label" for="">Docentes de asignatura (FDP06)</label><br>
							<a href="formatos/fdp-06.php" target="_blank">
								<button class="btn btn-default" type="button">
									<span class="glyphicon glyphicon-file"></span>
									Abrir y llenar formato
								</button>
							</a>
						</div>
						<div class="form-group">
							<label class="control-label" for="">Docentes de tiempo completo (FDP07)</label><br>
							<a href="formatos/fdp-07.php" target="_blank">
								<button class="btn btn-default" type="button">
									<span class="glyphicon glyphicon-file"></span>
									Abrir y llenar formato
								</button>
							</a>
						</div>
						<div class="form-group">
							<label class="control-label" for="">Programa de superación académica</label>
							<input type="file" id="" name="" required>
						</div>
						<div class="form-group">
							<label class="control-label" for="">Plan de mejora</label>
							<input type="file" id="" name="" required>
						</div>
						<div class="form-group">
							<label class="control-label" for="">Propuesta de director (FDP08)</label><br>
							<a href="formatos/fdp-08.php" target="_blank">
								<button class="btn btn-default" type="button">
									<span class="glyphicon glyphicon-file"></span>
									Abrir y llenar formato
								</button>
							</a>
						</div>
						<div class="form-group">
							<label class="control-label" for="">Reglamento Institucional</label>
							<input type="file" id="" name="" required>
						</div>
					</fieldset>

					<div class="form-group">
						<input type="submit" id="" data-toggle="modal" data-target="#modalConfirmarEnvio" name="" class="btn btn-primary pull-right" value="Enviar formulario" />
						<input type="submit" id="" name="" class="btn btn-default pull-right" value="Guardar formulario" style="margin-right: 10px;"/>
					</div>
				</form>
			</div>

			<!-- CARD USUARIO LATERAL -->
			<?php require_once "aside-usuario.php"; ?>

			<!-- MODAL CONFIRMAR ENVIO -->
			<div class="modal fade" id="modalConfirmarEnvio" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLongTitle">Enviar datos a SICyT</h5>
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body text-center">
							¿Está completamente seguro de haber llenado todos los campos y haber cargado todos los anexos requeriods?<br>
							<div class="small text-center">
								<br>Una vez enviado este formulario a la SICyT, no hay posibilidad de modificar su contenido para la revisión correspondiente. Por ello, verifique que todos los campos y anexos estén completos
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
							<button type="button" class="btn btn-primary">Si, estoy seguro. Enviar datos</button>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>


	<!-- JS GOB.MX -->
	<script src="https://framework-gb.cdn.gob.mx/gobmx.js"></script>
	<!-- JS JQUERY -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<!-- SECCION PARA SCRIPTS -->

</body>
</html>
