//Objeto para Solicitud
var Solicitud = {};

//2 decimales
Solicitud.dosNumerosDecimal = function (e) {
	e.value = parseFloat(e.value).toFixed(2);
};

//Obtener los municipios de Jalisco
Solicitud.getMunicipios = function () {
	Solicitud.municpioPromesa = $.ajax({
		type: 'POST',
		url: '../controllers/control-municipio.php',
		dataType: 'json',
		data: { webService: 'consultarMunicipios', url: '', id_estado: '14' },
		success: function (municipios) {
			var select = document.getElementById('municipio');
			var select2 = document.getElementById('municipio_representante');
			var municipiosOrdenados = [];
			for (var i = 0; i < municipios.data.length; i++) {
				municipiosOrdenados[i] = municipios.data[i].municipio;
			}
			municipiosOrdenados.sort();
			for (var j = 0; j < municipiosOrdenados.length; j++) {
				var option = document.createElement('option');
				var option2 = document.createElement('option');
				option.text = municipiosOrdenados[j];
				option.value = municipiosOrdenados[j];
				select.add(option);
				option2.text = municipiosOrdenados[j];
				option2.value = municipiosOrdenados[j];
				select2.add(option2);
			}
		},
		error: function (respuesta, errmsg, err) {
			console.log(respuesta.status + ': ' + respuesta.responseText);
		},
	});
};
//Obtener los niveles educativos
Solicitud.getNiveles = function () {
	Solicitud.nivelesPromesa = $.ajax({
		type: 'POST',
		url: '../controllers/control-nivel.php',
		dataType: 'json',
		data: { webService: 'consultarTodos', url: '' },
		success: function (respuesta) {
			var nivelesRector = $('#nivel_educativo_rector');
			var nivelesDirector = $('#nivel_educativo_director');
			var nivelPrograma = $('#nivel_id');
			var antecedente = $('#antecedente_academico');
			var docenteNivel = $('#nivelUltimoGradoDocente');
			var docenteNivel2 = $('#nivelPenultimoGradoDocente');
			var otros = $('#nivelOtrosProgramas');
			for (var i = 0; i < respuesta.data.length - 1; i++) {
				if (i > 0) {
					nivelesRector.append(
						'<option value ="' +
							respuesta.data[i].id +
							'">' +
							respuesta.data[i].descripcion +
							'</option>'
					);
					nivelesDirector.append(
						'<option value ="' +
							respuesta.data[i].id +
							'">' +
							respuesta.data[i].descripcion +
							'</option>'
					);
					nivelPrograma.append(
						'<option value ="' +
							respuesta.data[i].id +
							'">' +
							respuesta.data[i].descripcion +
							'</option>'
					);
					docenteNivel.append(
						'<option value ="' +
							respuesta.data[i].id +
							'">' +
							respuesta.data[i].descripcion +
							'</option>'
					);
					docenteNivel2.append(
						'<option value ="' +
							respuesta.data[i].id +
							'">' +
							respuesta.data[i].descripcion +
							'</option>'
					);
					otros.append(
						'<option value ="' +
							respuesta.data[i].id +
							'">' +
							respuesta.data[i].descripcion +
							'</option>'
					);
				}
				antecedente.append(
					'<option value ="' +
						respuesta.data[i].id +
						'">' +
						respuesta.data[i].descripcion +
						'</option>'
				);
			}
		},
		error: function (respuesta, errmsg, err) {
			console.log(respuesta);
		},
	});
};
//Obtener las modaliades de los programas
Solicitud.getModalidades = function () {
	Solicitud.modalidadesPromesa = $.ajax({
		type: 'POST',
		url: '../controllers/control-modalidad.php',
		dataType: 'json',
		data: { webService: 'consultarTodos', url: '' },
		success: function (respuesta) {
			var modalidadPrograma = $('#modalidad_id');
			var modalidadSolicitud = $('#modalidad_cargar');
			for (var i = 0; i < respuesta.data.length; i++) {
				modalidadPrograma.append(
					'<option value ="' +
						respuesta.data[i].id +
						'">' +
						respuesta.data[i].nombre +
						'</option>'
				);
				modalidadSolicitud.append(
					'<option value ="' +
						respuesta.data[i].id +
						'">' +
						respuesta.data[i].nombre +
						'</option>'
				);
			}
		},
		error: function (respuesta, errmsg, err) {
			console.log(respuesta);
		},
	});
};
//Obtener los turnos en los que se imparte un programa
Solicitud.getTurnos = function () {
	Solicitud.turnosPromesa = $.ajax({
		type: 'POST',
		url: '../controllers/control-turno.php',
		dataType: 'json',
		data: { webService: 'consultarTodos', url: '' },
		success: function (respuesta) {
			var turnoPrograma = $('#turno_programa');
			var otros = $('#turnoOtrosProgramas');
			for (var i = 0; i < respuesta.data.length; i++) {
				turnoPrograma.append(
					'<option value ="' +
						respuesta.data[i].id +
						'">' +
						respuesta.data[i].nombre +
						'</option>'
				);
				otros.append(
					'<option value ="' +
						respuesta.data[i].nombre +
						'">' +
						respuesta.data[i].nombre +
						'</option>'
				);
			}
			turnoPrograma.selectpicker('refresh');
			otros.selectpicker('refresh');
		},
		error: function (respuesta, errmsg, err) {
			console.log(respuesta);
		},
	});
};

//Obtener los turnos en los que se imparte un programa
Solicitud.getEvaluadores = function () {
	Solicitud.evaluadoresPromesa = $.ajax({
		type: 'POST',
		url: '../controllers/control-evaluador.php',
		dataType: 'json',
		data: { webService: 'consultarTodos', url: '' },
		success: function (respuesta) {
			var evaluadoresSelect = $('#lista_evaluadores');
			const evaluadoresData = respuesta.data.evaluadores;
			for (var i = 0; i < evaluadoresData.length; i++) {
				evaluadoresSelect.append(
					'<option value ="' +
						evaluadoresData[i].id +
						'">' +
						evaluadoresData[i].persona.nombre +
						' ' +
						evaluadoresData[i].persona.apellido_paterno +
						' ' +
						evaluadoresData[i].persona.apellido_materno +
						'</option>'
				);
			}
			evaluadoresSelect.selectpicker('refresh');
		},
		error: function (respuesta, errmsg, err) {
			console.log(respuesta);
		},
	});
};

//Obtener los tipos de instalaciones que se usarán
Solicitud.getInstalacion = function () {
	Solicitud.instalacionPrograma = $.ajax({
		type: 'POST',
		url: '../controllers/control-tipo-instalacion.php',
		dataType: 'json',
		data: { webService: 'consultarTodos', url: '' },
		success: function (respuesta) {
			var instalacion = $('#tipoInfraestructura');
			for (var i = 0; i < respuesta.data.length; i++) {
				instalacion.append(
					'<option value ="' +
						respuesta.data[i].id +
						'">' +
						respuesta.data[i].nombre +
						'</option>'
				);
			}
		},
		error: function (respuesta, errmsg, err) {
			console.log(respuesta);
		},
	});
};
//Obtener las coordenadas (Posible eliminación)
Solicitud.coordenadas = function () {
	var direccion =
		$('#calle').val() +
		' ' +
		$('#numero_exterior').val() +
		' ' +
		$('#colonia').val() +
		' ' +
		$('#codigo_postal').val();
	L.esri.Geocoding.geocode()
		.text(direccion)
		.run(function (err, results, response) {
			if (results.results[0].latlng) {
				var latitud = results.results[0].latlng.lat;
				var longitud = results.results[0].latlng.lng;
				$('#latitud').val(latitud);
				$('#longitud').val(longitud);
				$('#coordenadas').val(latitud + ',' + longitud);
			}
		});
};
//Función que obtiene todas las solicitudes del usuario
Solicitud.getSolicitudes = function () {
	Solicitud.tabla = $('#solicitudes').DataTable({
		bDeferRender: true,
		sPaginationType: 'full_numbers',
		order: [[2, 'asc']],
		ajax: {
			data: {
				webService: 'solicitudes',
				url: '',
				rol_id: $('#rol_id').val(),
				usuario_id: $('#usuario_id').val(),
			},
			url: '../controllers/control-solicitud-usuario.php',
			type: 'POST',
		},
		columns: [
			{ data: 'folio' },
			{ data: 'planestudios' },
			{ data: 'estatus' },
			{ data: 'plantel' },
			{ data: 'acciones' },
		],
		oLanguage: {
			sProcessing: 'Procesando...',
			sLengthMenu:
				'Mostrar <select>' +
				'<option value="5">5</option>' +
				'<option value="10">10</option>' +
				'<option value="20">20</option>' +
				'<option value="30">30</option>' +
				'<option value="40">40</option>' +
				'<option value="-1">All</option>' +
				'</select> registros',
			sZeroRecords: 'No se encontraron resultados',
			sEmptyTable: 'Ningún dato disponible en esta tabla',
			sInfo:
				'Mostrando del (_START_ al _END_) de un total de _TOTAL_ registros',
			sInfoEmpty: 'Mostrando del 0 al 0 de un total de 0 registros',
			sInfoFiltered: '(filtrado de un total de _MAX_ registros)',
			sInfoPostFix: '',
			sSearch: 'Filtrar:',
			sUrl: '',
			sInfoThousands: ',',
			sLoadingRecords: 'Por favor espere - cargando...',
			oPaginate: {
				sFirst: 'Primero',
				sLast: 'Último',
				sNext: 'Siguiente',
				sPrevious: 'Anterior',
			},
			oAria: {
				sSortAscending:
					': Activar para ordenar la columna de manera ascendente',
				sSortDescending:
					': Activar para ordenar la columna de manera descendente',
			},
		},
	});
};
//Obtener los datos de los representantes
Solicitud.getRepresentante = function (repre) {
	Solicitud.datosRepresentante = $.ajax({
		type: 'POST',
		url: '../controllers/control-usuario.php',
		dataType: 'json',
		data: { webService: 'datosRepresentante', url: '', opc: repre },
		success: function (respuesta) {
			var respuestas = respuesta.data;
			$('#id-representante').val(respuestas.id);
			$('#nombre').val(respuestas.nombre);
			$('#apellido_paterno').val(respuestas.apellido_paterno);
			$('#apellido_materno').val(respuestas.apellido_materno);
			$('#nacionalidad_representante').val(respuestas.nacionalidad);
			$('#domicilio-id-representante').val(respuestas.domicilio.id);
			$('#calle_representante').val(respuestas.domicilio.calle);
			$('#numero_exterior_representante').val(
				respuestas.domicilio.numero_exterior
			);
			$('#numero_interior_representante').val(
				respuestas.domicilio.numero_interior
			);
			$('#colonia_representante').val(respuestas.domicilio.colonia);
			$('#codigo_representante').val(respuestas.domicilio.codigo_postal);
			$(
				"#municipio_representante option[value='" +
					respuestas.domicilio.municipio +
					"']"
			).attr('selected', true);
			$('#correo_representante').val(respuestas.correo);
			$('#telefono_representante').val(respuestas.telefono);
			$('#celular_representante').val(respuestas.celular);
		},
		error: function (respuesta, errmsg, err) {
			console.log(respuesta);
		},
	});
};
//Obtener los tipos de solictudes que existen
Solicitud.getTipos = function () {
	Solicitud.tiposPromesa = $.ajax({
		type: 'POST',
		url: '../controllers/control-tipo-solicitud.php',
		dataType: 'json',
		data: { webService: 'consultarTodos', url: '' },
		success: function (respuesta) {
			var select = $('#tipo_solicitud');
			//Solicitudes permanentes
			$.each(respuesta.data, function (key, registro) {
				//Oculta las opciones de convocatoria 1 y 2
				/* if (registro.id == 3) {
          select.append('<option value=' + registro.id + '>' + registro.nombre + '</option>');
        } */
				select.append(
					'<option value=' + registro.id + '>' + registro.nombre + '</option>'
				);
			});
		},
		fail: function (jqXHR, textStatus, errorThrown) {
			if (jqXHR.status === 0) {
				alert('Not connect: Verify Network.');
			} else if (jqXHR.status == 404) {
				alert('Requested page not found [404]');
			} else if (jqXHR.status == 500) {
				alert('Internal Server Error [500].');
			} else if (textStatus === 'parsererror') {
				alert('Requested JSON parse failed.');
			} else if (textStatus === 'timeout') {
				alert('Time out error.');
			} else if (textStatus === 'abort') {
				alert('Ajax request aborted.');
			} else {
				alert('Uncaught Error: ' + jqXHR.responseText);
			}
		},
	});
};

//Función que redirigi a la vista de alta-solicitud y carga los campos requeridos para el tipo de solicitud
Solicitud.redirigir = function () {
	if ($('#tipo_solicitud').val() > 0) {
		if ($('#tipo_solicitud').val() == 1) {
			if ($('#modalidad_cargar').val() > 0) {
				$('#enlace-solicitud').attr(
					'href',
					'alta-solicitudes.php?tipo=' +
						$('#tipo_solicitud').val() +
						'&modalidad=' +
						$('#modalidad_cargar').val() +
						'&op=0&dt=0'
				);
				if ($('#planteles').val() > 0) {
					$('#enlace-solicitud').attr(
						'href',
						'alta-solicitudes.php?tipo=' +
							$('#tipo_solicitud').val() +
							'&modalidad=' +
							$('#modalidad_cargar').val() +
							'&op=1&dt=' +
							$('#planteles').val()
					);
				}
			} else {
				$('#enlace-solicitud').attr('href', '#');
				Solicitud.mostrarMensaje(
					'error',
					'Tipo de solicitud y la modalidad del programa de estudios'
				);
				$('#tipo_solicitud').focus();
			}
		}

		if ($('#tipo_solicitud').val() == 2) {
			if ($('#programas_ids').val() > 0) {
				var resultado = $(Solicitud.programasRegistrados).filter(function (
					i,
					n
				) {
					return n.id == $('#programas_ids').val();
				});
				resultado = resultado[0];
				$('#enlace-solicitud').attr(
					'href',
					'alta-solicitudes.php?tipo=' +
						$('#tipo_solicitud').val() +
						'&modalidad=' +
						resultado.modalidad_id +
						'&op=2&dt=' +
						resultado.id +
						'&odt=1'
				);
			} else {
				$('#enlace-solicitud').attr('href', '#');
				Solicitud.mostrarMensaje(
					'error',
					'Debe de seleccionar un programa de estudios'
				);
				$('#programas_ids').focus();
			}
		}

		if ($('#tipo_solicitud').val() == 3 || $('#tipo_solicitud').val() == 4) {
			if ($('#programas_ids').val() > 0) {
				var resultado = $(Solicitud.programasRegistrados).filter(function (
					i,
					n
				) {
					return n.id == $('#programas_ids').val();
				});
				resultado = resultado[0];
			} else {
				$('#enlace-solicitud').attr('href', '#');
				Solicitud.mostrarMensaje(
					'error',
					'Debe de seleccionar un programa de estudios'
				);
				$('#programas_ids').focus();
			}

			if ($('#planteles').val() > 0) {
				$('#enlace-solicitud').attr(
					'href',
					'alta-solicitudes.php?tipo=' +
						$('#tipo_solicitud').val() +
						'&modalidad=' +
						resultado.modalidad_id +
						'&op=2&dt=' +
						resultado.id +
						'&odt=1' +
						'&dp=' +
						$('#planteles').val()
				);
			} else {
				$('#enlace-solicitud').attr('href', '#');
				Solicitud.mostrarMensaje(
					'error',
					'Debe de seleccionar un plantel para poder realizar el tramite'
				);
				$('#planteles').focus();
			}
		}
	} else {
		$('#enlace-solicitud').attr('href', '#');
		Solicitud.mostrarMensaje(
			'error',
			'Tipo de solicitud y la modalidad del programa de estudios'
		);
		$('#tipo_solicitud').focus();
	}
};
//Muestra y solicita información requerida para iniciar una solicitud (selects en mis-solicitudes)
Solicitud.opciones = function () {
	if ($('#tipo_solicitud').val() == 1 || $('#tipo_solicitud').val() == 4) {
		//Muestra select de Planteles
		$('#div-progrmas').hide();
		$('#opcion-modalidad').hide();
		$('#div-programas').hide();
		//Agrega las opciones
		var planteles = Solicitud.plantelesRespuesta;
		var plantel = $('#planteles');
		if (planteles != undefined) {
			$('#planteles').empty();
			$('#plantelregistrado').show();
			$('#planteles').append("<option value=''>Seleccione una opción</option>");
			for (var i = 0; i < planteles.length; i++) {
				plantel.append(
					'<option value ="' +
						planteles[i].id +
						'">' +
						planteles[i].domicilio.calle +
						' ' +
						planteles[i].domicilio.numero_exterior +
						'</option>'
				);
			}
		}

		if ($('#tipo_solicitud').val() == 1) {
			$('#opcion-modalidad').show();
		}
	} else if ($('#tipo_solicitud').val() == 2) {
		document.getElementById('cargando').style.display = 'block';
		$('#opcion-modalidad').hide();
		$('#plantelregistrado').hide();
		//Cargar programas
		Solicitud.getProgramasBasicos();
		Solicitud.promesaProgramas.done(function () {
			var dor = (document.getElementById('cargando').style.display = 'none');
			var programas = Solicitud.programasRegistrados;
			var slcPlantel = $('#programas_ids');
			if (programas != undefined && programas.length > 0) {
				for (var i = 0; i < programas.length; i++) {
					slcPlantel.append(
						'<option value ="' +
							programas[i].id +
							'">' +
							'RVOE' +
							' ' +
							programas[i].acuerdo_rvoe +
							' ' +
							programas[i].nombre +
							' ubicado en: #' +
							programas[i].domicilio.numero_exterior +
							' ' +
							programas[i].domicilio.calle +
							'</option>'
					);
				}
				$('#div-programas').show();
			}
		});
	} else if ($('#tipo_solicitud').val() == 3) {
		document.getElementById('cargando').style.display = 'block';
		$('#opcion-modalidad').hide();

		//Cargar programas
		Solicitud.getProgramasBasicos();
		Solicitud.promesaProgramas.done(function () {
			var dor = (document.getElementById('cargando').style.display = 'none');
			var programas = Solicitud.programasRegistrados;
			var slcPlantel = $('#programas_ids');
			if (programas != undefined && programas.length > 0) {
				for (var i = 0; i < programas.length; i++) {
					slcPlantel.append(
						'<option value ="' +
							programas[i].id +
							'">' +
							'RVOE' +
							' ' +
							programas[i].acuerdo_rvoe +
							' ' +
							programas[i].nombre +
							' ubicado en: #' +
							programas[i].domicilio.numero_exterior +
							' ' +
							programas[i].domicilio.calle +
							'</option>'
					);
				}
				$('#div-programas').show();
			}
		});

		//Muestra select de Planteles
		$('#div-progrmas').hide();
		$('#opcion-modalidad').hide();
		$('#div-programas').hide();
		//Agrega las opciones
		var planteles = Solicitud.plantelesRespuesta;
		var plantel = $('#planteles');
		if (planteles != undefined) {
			$('#planteles').empty();
			$('#plantelregistrado').show();
			$('#planteles').append("<option value=''>Seleccione una opción</option>");
			for (var i = 0; i < planteles.length; i++) {
				plantel.append(
					'<option value ="' +
						planteles[i].id +
						'">' +
						planteles[i].domicilio.calle +
						' ' +
						planteles[i].domicilio.numero_exterior +
						'</option>'
				);
			}
		}
	}
};
//Oculta mensaje al dar click sobre el mismo
Solicitud.ocultarMensaje = function () {
	$('#mensaje')
		.removeClass('alert alert-danger')
		.removeClass('alert alert-success')
		.hide();
};
//Muestra el mensaje correspondiene
Solicitud.mostrarMensaje = function (tipo, texto) {
	var mensaje = $('#mensaje');
	if ('success' == tipo)
		mensaje
			.removeClass('alert alert-danger')
			.addClass('alert alert-success')
			.show();
	else if ('error' == tipo)
		mensaje
			.removeClass('alert alert-success')
			.addClass('alert alert-danger')
			.show();

	mensaje.html(texto);
};
//Obtener los planteles registrados por el representante legal
Solicitud.getPlantelesBasicos = function () {
	Solicitud.planteles = $.ajax({
		type: 'POST',
		url: '../controllers/control-plantel.php',
		dataType: 'json',
		data: {
			webService: 'informacionBasica',
			url: '',
			solicitud_id: $('#id_solicitud').val(),
		},
		success: function (respuesta) {
			console.log('infomracion basica');
			if (respuesta.data.institucion != undefined) {
				var institucion = respuesta.data.institucion;
				var ratificacion = respuesta.data.ratificacion;
				$('#id-institucion').val(institucion.id);
				$('#razon_social').val(institucion.razon_social);
				$('#historia').val(institucion.historia);
				$('#mision').val(institucion.mision);
				$('#vision').val(institucion.vision);
				$('#valores_institucionales').val(institucion.valores_institucionales);
				if (institucion.es_nombre_autorizado == 1) {
					$('#autorizado').val(institucion.nombre);
					$('#institucion-autorizada').show();
					$('#ratificacion-nombre').hide();
					$('#ratificacion').show();
					$('#nombre_solicitado').val(institucion.nombre);
					$('#nombre_autorizado').val(institucion.nombre);
					$('#es_nombre_autorizado').val(institucion.es_nombre_autorizado);
					$('#acuerdo').val(ratificacion.acuerdo);
					$('#autoridad').val(ratificacion.autoridad);
					$('#nombre_solicitado').attr('disabled', true);
					$('#nombre_autorizado').attr('disabled', true);
					$('#acuerdo').attr('disabled', true);
					$('#autoridad').attr('disabled', true);
					$('#id-ratificacion').val(ratificacion.id);
					$('#id-ratificacion').attr('name', 'RATIFICACION-id');
					$('#nombre_propuesto1').val(institucion.nombre);
				} else {
					$('#institucion-noautorizada').show();
					$('#institucion-autorizada').hide();
					$('#ratificacion-nombre').show();
					if (ratificacion != undefined) {
						$('#id-ratificacion').val(ratificacion.id);
						$('#id-ratificacion').attr('name', 'RATIFICACION-id');
						$('#nombre_propuesto1').val(ratificacion.nombre_propuesto1);
						$('#nombre_propuesto2').val(ratificacion.nombre_propuesto2);
						$('#nombre_propuesto3').val(ratificacion.nombre_propuesto3);
					}
				}
			}
			if (respuesta.data.planteles != undefined) {
				Solicitud.plantelesRespuesta = respuesta.data.planteles;
			}
		},
		error: function (respuesta, errmsg, err) {
			console.log(respuesta.status + ': ' + respuesta.responseText);
		},
	});
};
//Obtener la información del plantel por el id
Solicitud.getDatosPlantel = function (idplantel) {
	Solicitud.promesaPlantel = $.ajax({
		type: 'POST',
		url: '../controllers/control-plantel.php',
		dataType: 'json',
		data: { webService: 'plantelPorId', url: '', plantelId: idplantel },
		success: function (respuesta) {
			if (respuesta.data != '') {
				if (respuesta.data.plantel != undefined) {
					var object = respuesta.data.plantel;
					$('#plantel-id').val(object.id);
					$('#plantel-id').attr('name', 'PLANTEL-id');
					$('#coordenadas').val(
						object.domicilio.latitud + ',' + object.domicilio.longitud
					);
					for (var variable in object) {
						if (object.hasOwnProperty(variable)) {
							$('#' + variable).val(object[variable]);

							//Datos de ubicacion
							if (variable == 'domicilio') {
								var Objdomicilio = object[variable];
								$('#id_domiclio_plantel').val(Objdomicilio.id);
								$('#id_domiclio_plantel').attr('name', 'DOMICILIOPLANTEL-id');
								for (var campo in Objdomicilio) {
									if (Objdomicilio.hasOwnProperty(campo)) {
										$('#' + campo).val(Objdomicilio[campo]);
									}
								}
							}
							//Rector
							if (variable == 'rector') {
								var Objrector = object[variable];
								$('#id-rector').val(Objrector.id);
								$('#id-rector').attr('name', 'RECTOR-id');

								for (var campos in Objrector) {
									if (Objrector.hasOwnProperty(campos)) {
										$('#' + campos + '_rector').val(Objrector[campos]);
										//Formaciones
										if (campos == 'formaciones') {
											let formaciones = Objrector[campos];
											$('#inputsFormacionRector').empty();
											$('#formacion_rector tr:not(:first)').remove();
											for (var j = 0; j < formaciones.length; j++) {
												var b = document.createElement('INPUT');
												b.setAttribute('type', 'hidden');
												b.setAttribute(
													'id',
													'fromacionesRector' + nfilaFormacion
												);
												b.setAttribute('name', 'RECTOR-formaciones[]');
												b.setAttribute(
													'value',
													JSON.stringify({
														id: formaciones[j].id,
														nivel: formaciones[j].nivel,
														nombre: formaciones[j].nombre,
														descripcion: formaciones[j].descripcion,
														institucion: formaciones[j].institucion,
													})
												);
												__('inputsFormacionRector').appendChild(b);
												var filaFormacion =
													'<tr id="formacion' +
													nfilaFormacion +
													'"><td>' +
													formaciones[j].grado.descripcion +
													'</td><td>' +
													formaciones[j].nombre +
													'</td><td>' +
													formaciones[j].institucion +
													'</td><td>' +
													formaciones[j].descripcion +
													'</td><td><button type="button" name="removeFormacion" id="' +
													nfilaFormacion +
													'" class="btn btn-danger" onclick="eliminarFormacion(this)">Quitar</button></td></tr>';
												//Aumentar contador;
												nfilaFormacion++;
												$('#formacion_rector tr:last').after(filaFormacion);
											}
										}
									}
								}
							}

							//Director
							if (variable == 'director') {
								var Objdirector = object[variable];
								$('#id-director').val(Objdirector.id);
								$('#id-director').attr('name', 'DIRECTOR-id');

								for (var campos in Objdirector) {
									if (Objdirector.hasOwnProperty(campos)) {
										$('#' + campos + '_director').val(Objdirector[campos]);
										//Formaciones
										if (campos == 'formaciones') {
											var formaciones = Objdirector[campos];
											$('#inputsFormacionDirector').empty();
											$('#formacion_director tr:not(:first)').remove();
											for (var j = 0; j < formaciones.length; j++) {
												var b = document.createElement('INPUT');
												b.setAttribute('type', 'hidden');
												b.setAttribute(
													'id',
													'fromacionesDirector' + nfilaFormacion
												);
												b.setAttribute('name', 'DIRECTOR-formaciones[]');
												b.setAttribute(
													'value',
													JSON.stringify({
														id: formaciones[j].id,
														nivel: formaciones[j].nivel,
														nombre: formaciones[j].nombre,
														descripcion: formaciones[j].descripcion,
														institucion: formaciones[j].institucion,
													})
												);
												__('inputsFormacionDirector').appendChild(b);
												var filaFormacion =
													'<tr id="formacion' +
													nfilaFormacion +
													'"><td>' +
													formaciones[j].grado.descripcion +
													'</td><td>' +
													formaciones[j].nombre +
													'</td><td>' +
													formaciones[j].institucion +
													'</td><td>' +
													formaciones[j].descripcion +
													'</td><td><button type="button" name="removeFormacion" id="' +
													nfilaFormacion +
													'" class="btn btn-danger" onclick="eliminarFormacion(this)">Quitar</button></td></tr>';
												//Aumentar contador;
												nfilaFormacion++;
												$('#formacion_director tr:last').after(filaFormacion);
											}
										}
										//Experiencias
										if (campos == 'experiencias') {
											var experiencias = Objdirector[campos];
											$('#inputsExperienciaDirector').empty();
											$('#experiencia_director tr:not(:first)').remove();
											for (var k = 0; k < experiencias.length; k++) {
												var tipoExperiencia;
												var c = document.createElement('INPUT');
												c.setAttribute('type', 'hidden');
												c.setAttribute('id', 'experienciaDirector' + nfila);
												c.setAttribute('name', 'DIRECTOR-experiencias[]');
												c.setAttribute(
													'value',
													JSON.stringify({
														id: experiencias[k].id,
														nombre: experiencias[k].nombre,
														tipo: experiencias[k].tipo,
														funcion: experiencias[k].funcion,
														institucion: experiencias[k].institucion,
														periodo: experiencias[k].periodo,
													})
												);
												__('inputsExperienciaDirector').appendChild(c);
												if (experiencias[k].tipo == 1) {
													tipoExperiencia = 'Docente';
												} else if (experiencias[k].tipo == 2) {
													tipoExperiencia = 'Profesional';
												} else {
													tipoExperiencia = 'Directiva';
												}
												var filaExperiencia =
													'<tr id="experiencia' +
													nfila +
													'"><td>' +
													tipoExperiencia +
													'</td><td>' +
													experiencias[k].nombre +
													'</td><td>' +
													experiencias[k].funcion +
													'</td><td>' +
													experiencias[k].institucion +
													'</td><td>' +
													experiencias[k].periodo +
													'</td><td><button type="button" name="removeFormacion" id="' +
													nfila +
													'" class="btn btn-danger" onclick="eliminarExperiencia(this)">Quitar</button></td></tr>';
												nfila++;
												$('#experiencia_director tr:last').after(
													filaExperiencia
												);
											}
										}
										//PUBLICACIONES
										if (campos == 'publicaciones') {
											var publicaciones = Objdirector[campos];
											$('#inputsPublicacionesDirector').empty();
											$('#publicaciones_director tr:not(:first)').remove();
											for (var l = 0; l < publicaciones.length; l++) {
												if (publicaciones[l].otros == null) {
													publicaciones[l].otros = '';
												}
												var d = document.createElement('INPUT');
												d.setAttribute('type', 'hidden');
												d.setAttribute('id', 'publicacionesDirector' + nfila);
												d.setAttribute('name', 'DIRECTOR-publicaciones[]');
												d.setAttribute(
													'value',
													JSON.stringify({
														id: publicaciones[l].id,
														anio: publicaciones[l].anio,
														volumen: publicaciones[l].volumen,
														pais: publicaciones[l].pais,
														titulo: publicaciones[l].titulo,
														editorial: publicaciones[l].editorial,
														otros: publicaciones[l].otros,
													})
												);
												__('inputsPublicacionesDirector').appendChild(d);
												//Consttuir fila
												var filaPublicacion =
													'<tr id="publicacion' +
													nfila +
													'"><td>' +
													publicaciones[l].titulo +
													'</td><td>' +
													publicaciones[l].volumen +
													'</td><td>' +
													publicaciones[l].editorial +
													'</td><td>' +
													publicaciones[l].anio +
													'</td><td>' +
													publicaciones[l].pais +
													'</td><td>' +
													publicaciones[l].otros +
													'</td><td><button type="button" name="removePublicacion" id="' +
													nfila +
													'" class="btn btn-danger" onclick="eliminarPublicacion(this)">Quitar</button></td></tr>';
												nfila++;
												$('#publicaciones_director tr:last').after(
													filaPublicacion
												);
											}
										}
									}
								}
							}
							//Dictamenes
							/* if (object.dictamenes != undefined && $("#tipo").val() != 4) {
                $("#inputsDictamenes").empty();
                $("#dictamenes tr:not(:first)").remove();
                var dictamenes = object.dictamenes;
                for (var dic = 0; dic < dictamenes.length; dic++) {
                  var inputDictamen = document.createElement("INPUT");
                  inputDictamen.setAttribute("type", "hidden");
                  inputDictamen.setAttribute("id", "dictamen" + nfilaDictamen);
                  inputDictamen.setAttribute("name", "DICTAMEN-dictamenes[]");
                  inputDictamen.setAttribute(
                    "value",
                    JSON.stringify({
                      id: dictamenes[dic].id,
                      nombre: dictamenes[dic].nombre,
                      autoridad: dictamenes[dic].autoridad,
                      fecha_emision: dictamenes[dic].fecha_emision,
                    })
                  );
                  __("inputsDictamenes").appendChild(inputDictamen);
                  var filaDictamen =
                    '<tr id="dictamen' +
                    nfilaDictamen +
                    '"><td>' +
                    dictamenes[dic].nombre +
                    "</td><td>" +
                    dictamenes[dic].autoridad +
                    "</td><td>" +
                    dictamenes[dic].fecha_emision +
                    '</td><td><button type="button" name="removeDictamen" id="' +
                    nfilaDictamen +
                    '" class="btn btn-danger" onclick="eliminarDictamen(this)">Quitar</button></td></tr>';
                  nfilaDictamen++;
                  $("#dictamenes tr:last").after(filaDictamen);
                }
              } */
							//Edificios
							if (object.edificios != undefined) {
								var edificios = object.edificios;
								for (var edf = 0; edf < edificios.length; edf++) {
									$('#' + edificios[edf].nivel.nombre).attr(
										'checked',
										'checked'
									);
									//$("#"+edificios[edf].nivel.nombre).attr("name","EDIFICIO-"+edificios[edf].nivel.nombre+"-id:"+edificios[edf].nivel.id);
								}
							}
							//Seguridades
							if (object.seguridades != undefined) {
								var seguridades = object.seguridades;
								for (var seg = 0; seg < seguridades.length; seg++) {
									$('#' + seguridades[seg].tipo_seguridad.nombre).val(
										seguridades[seg].cantidad
									);
									//$("#"+seguridades[seg].tipo_seguridad.nombre).attr("name","SEGURIDAD-"+seguridades[seg].tipo_seguridad.nombre+"-id:"+seguridades[seg].id);
								}
							}
							//Higienes
							if (object.higienes != undefined) {
								var higienes = object.higienes;
								for (var hig = 0; hig < higienes.length; hig++) {
									$('#' + higienes[hig].tipo_higiene.nombre).val(
										higienes[hig].cantidad
									);
									//$("#"+higienes[hig].tipo_higiene.nombre).attr("name","HIGIENE-"+tipo_higiene.nombre+"-id:"+higienes[hig].id);
								}
							}
							//Instituciones de salud
							if (
								object.instituciones_salud != undefined &&
								$('#tipo').val() != 4
							) {
								$('#inputsSaludInstituciones').empty();
								$('#institucionesSalud tr:not(:first)').remove();
								var instSalud = object.instituciones_salud;
								for (var ind = 0; ind < instSalud.length; ind++) {
									var inputInsSalud = document.createElement('INPUT');
									inputInsSalud.setAttribute('type', 'hidden');
									inputInsSalud.setAttribute(
										'id',
										'institucionSalud' + nfilaPrograma
									);
									inputInsSalud.setAttribute(
										'name',
										'SALUD-nombresInstitucionSalud[]'
									);
									inputInsSalud.setAttribute(
										'value',
										JSON.stringify({
											id: instSalud[ind].id,
											nombre: instSalud[ind].nombre,
											tiempo: instSalud[ind].tiempo,
										})
									);
									__('inputsSaludInstituciones').appendChild(inputInsSalud);
									var filaInstSalud =
										'<tr id="institucionSalud' +
										nfilaPrograma +
										'"><td>' +
										instSalud[ind].nombre +
										'</td><td>' +
										instSalud[ind].tiempo +
										'</td><td><button type="button"  id="' +
										nfilaPrograma +
										'" class="btn btn-danger" onclick="eliminarInstitucionSalud(this)">Quitar</button></td></tr>';
									nfilaPrograma++;
									$('#institucionesSalud tr:last').after(filaInstSalud);
								}
							}
							//Infraestructura
							if (object.infraestructura != undefined) {
								$('#inputsInfraestructuras').empty();
								$('#infraestructuras tr:not(:first)').remove();
								var infComun = object.infraestructura;
								for (var indInf = 0; indInf < infComun.length; indInf++) {
									var inputInf = document.createElement('INPUT');
									inputInf.setAttribute('type', 'hidden');
									inputInf.setAttribute('id', 'infraestructura' + nfilaInf);
									inputInf.setAttribute(
										'name',
										'INFRAESTRUCTURA-infraestructuras[]'
									);
									inputInf.setAttribute(
										'value',
										JSON.stringify({
											id: infComun[indInf].id,
											tipo_instalacion_id: infComun[indInf].tipo_instalacion_id,
											nombre: infComun[indInf].nombre,
											ubicacion: infComun[indInf].ubicacion,
											capacidad: infComun[indInf].capacidad,
											metros: infComun[indInf].metros,
											recursos: infComun[indInf].recursos,
											asignaturas: 'USO COMÚN',
										})
									);
									__('inputsInfraestructuras').appendChild(inputInf);
									var filaInf =
										'<tr id="infraestructura' +
										nfilaInf +
										'"><td>' +
										infComun[indInf].instalacion.nombre +
										' ' +
										infComun[indInf].nombre +
										'</td><td>' +
										infComun[indInf].capacidad +
										'</td><td>' +
										infComun[indInf].metros +
										'</td><td>' +
										infComun[indInf].recursos +
										'</td><td>' +
										infComun[indInf].ubicacion +
										'</td><td>' +
										'USO COMÚN NO SE TRATA' +
										'</td><td><button type="button"  id="' +
										nfilaInf +
										'" class="btn btn-danger" onclick="eliminarInfraestructura(this)">Quitar</button></td></tr>';
									$('#infraestructuras tr:last').after(filaInf);
								}
							}
						}
					}
				}
			}
		},
		error: function (respuesta, errmsg, err) {
			console.log(respuesta.status + ': ' + respuesta.responseText);
		},
	});
};
//Obtener los programas del representante legal
Solicitud.getProgramasBasicos = function () {
	Solicitud.promesaProgramas = $.ajax({
		type: 'POST',
		url: '../controllers/control-programa.php',
		dataType: 'json',
		data: { webService: 'informacionBasica', url: '' },
		success: function (respuesta) {
			if (respuesta.data != '') {
				Solicitud.programasRegistrados = respuesta.data.programas;
			}
		},
		error: function (respuesta, errmsg, err) {
			console.log(respuesta.status + ': ' + respuesta.responseText);
		},
	});
};
//Obtener datos de una modificacion de Programa
Solicitud.modificacionPrograma = function () {
	Solicitud.promesaModificacionPrograma = $.ajax({
		type: 'POST',
		url: '../controllers/control-programa.php',
		dataType: 'json',
		data: {
			webService: 'modificacionPrograma',
			url: '',
			programaId: $('#datosNecesarios').val(),
			opcion: $('#masDatos').val(),
		},
		success: function (respuesta) {
			if (respuesta.data != '') {
				var programa = respuesta.data.programa;
				var asignaturas = respuesta.data.asignaturas;
				var representante = respuesta.data.representante;
				var institucion = respuesta.data.institucion;
				if (institucion != undefined && $('#auxTipo').val() == 1) {
					if (institucion.es_nombre_autorizado == 1) {
						$('#institucion-autorizada').show();
						$('#autorizado').val(institucion.nombre);
					} else {
						$('#nombre_propuesto1').val(
							respuesta.data.ratificacion.nombre_propuesto1
						);
						$('#nombre_propuesto2').val(
							respuesta.data.ratificacion.nombre_propuesto2
						);
						$('#nombre_propuesto3').val(
							respuesta.data.ratificacion.nombre_propuesto3
						);
					}
					$('#razon_social').val(institucion.razon_social);
					$('#historia').val(institucion.historia);
					$('#vision').val(institucion.vision);
					$('#mision').val(institucion.mision);
					$('#valores_institucionales').val(
						institucion.valores_institucionales
					);
				}

				if (representante != undefined) {
					var persona = representante.persona;
					var domicilioR = representante.domicilio;
					$('#nombre').val(persona.nombre);
					$('#apellido_paterno').val(persona.apellido_paterno);
					$('#apellido_materno').val(persona.apellido_materno);
					$('#nacionalidad_representante').val(persona.nacionalidad);
					$('#calle_representante').val(domicilioR.calle);
					$('#numero_exterior_representante').val(domicilioR.numero_exterior);
					$('#numero_interior_representante').val(domicilioR.numero_interior);
					$('#colonia_representante').val(domicilioR.colonia);
					$('#codigo_representante').val(domicilioR.codigo_postal);
					$(
						"#municipio_representante option[value='" +
							domicilioR.municipio +
							"']"
					).attr('selected', true);
					$('#correo_representante').val(persona.correo);
					$('#telefono_representante').val(persona.telefono);
					$('#celular_representante').val(persona.celular);
				}
				if (programa != undefined) {
					if ($('#informacionCargar').val() == 3) {
						$('#id_solicitud').val(programa.solicitud_id);
						$('#id_solicitud').attr('name', 'SOLICITUD-id');
						Solicitud.tipo_solicitud = programa.solicitud.tipo_solicitud_id;
					}
					if ($('#tipo').val() == 2) {
						if (programa.plantel != undefined) {
							var plantel = programa.plantel;
							Solicitud.plantelId = plantel.id;
							$('#plantel-id').val(plantel.id);
							$('#plantel-id').attr('name', 'PLANTEL-id');
							$('id-institucion').val(plantel.institucion_id);
							for (var campo in plantel) {
								if (plantel.hasOwnProperty(campo)) {
									$('#' + campo).val(plantel[campo]);
								}
							}
							//Domicilio
							if (plantel.domicilio != undefined) {
								var Objdomicilio = plantel.domicilio;
								$('#coordenadas').val(
									Objdomicilio.latitud + ',' + Objdomicilio.longitud
								);
								for (var camposD in Objdomicilio) {
									if (Objdomicilio.hasOwnProperty(camposD)) {
										$('#' + camposD).val(Objdomicilio[camposD]);
									}
								}
							}
							//Rector
							if (plantel.rector != undefined) {
								let rector = plantel.rector;
								$('#id-rector').val(rector.id);
								$('#id-rector').attr('name', 'RECTOR-id');
								$('#nombre_rector').val(rector.nombre);
								$('#apellido_paterno_rector').val(rector.apellido_paterno);
								$('#apellido_materno_rector').val(rector.apellido_materno);
								$('#nacionalidad_rector').val(rector.nacionalidad);
								$('#curp_rector').val(rector.curp);
								$('#sexo_rector').val(rector.sexo);
								//Formaciones de director
								if (rector.formaciones != undefined) {
									let formaciones = rector.formaciones;
									for (let j = 0; j < formaciones.length; j++) {
										let filaFormacion;
										if ($('#informacionCargar').val() != 4) {
											let b = document.createElement('INPUT');
											b.setAttribute('type', 'hidden');
											b.setAttribute(
												'id',
												'fromacionesRector' + nfilaFormacion
											);
											b.setAttribute('name', 'RECTOR-formaciones[]');
											b.setAttribute(
												'value',
												JSON.stringify({
													id: formaciones[j].id,
													nivel: formaciones[j].nivel,
													nombre: formaciones[j].nombre,
													descripcion: formaciones[j].descripcion,
													institucion: formaciones[j].institucion,
												})
											);
											__('inputsFormacionRector').appendChild(b);
											filaFormacion =
												'<tr id="formacion' +
												nfilaFormacion +
												'"><td>' +
												formaciones[j].grado.descripcion +
												'</td><td>' +
												formaciones[j].nombre +
												'</td><td>' +
												formaciones[j].institucion +
												'</td><td>' +
												formaciones[j].descripcion +
												'</td><td><button type="button" name="removeFormacion" id="' +
												nfilaFormacion +
												'" class="btn btn-danger" onclick="eliminarFormacion(this)">Quitar</button></td></tr>';
										} else {
											filaFormacion =
												'<tr id="formacion' +
												nfilaFormacion +
												'"><td>' +
												formaciones[j].grado.descripcion +
												'</td><td>' +
												formaciones[j].nombre +
												'</td><td>' +
												formaciones[j].institucion +
												'</td><td>' +
												formaciones[j].descripcion +
												'</td></tr>';
										}
										//Aumentar contador;
										nfilaFormacion++;
										$('#formacion_rector tr:last').after(filaFormacion);
									}
								}
							}
							//Director
							if (plantel.director != undefined) {
								let director = plantel.director;
								$('#id-director').val(director.id);
								$('#id-director').attr('name', 'DIRECTOR-id');
								$('#nombre_director').val(director.nombre);
								$('#apellido_paterno_director').val(director.apellido_paterno);
								$('#apellido_materno_director').val(director.apellido_materno);
								$('#nacionalidad_director').val(director.nacionalidad);
								$('#curp_director').val(director.curp);
								$('#sexo_director').val(director.sexo);
								//Formaciones de director
								if (director.formaciones != undefined) {
									let formaciones = director.formaciones;
									for (let j = 0; j < formaciones.length; j++) {
										if ($('#informacionCargar').val() != 4) {
											let b = document.createElement('INPUT');
											b.setAttribute('type', 'hidden');
											b.setAttribute(
												'id',
												'fromacionesDirector' + nfilaFormacion
											);
											b.setAttribute('name', 'DIRECTOR-formaciones[]');
											b.setAttribute(
												'value',
												JSON.stringify({
													id: formaciones[j].id,
													nivel: formaciones[j].nivel,
													nombre: formaciones[j].nombre,
													descripcion: formaciones[j].descripcion,
													institucion: formaciones[j].institucion,
												})
											);
											__('inputsFormacionDirector').appendChild(b);
											filaFormacion =
												'<tr id="formacion' +
												nfilaFormacion +
												'"><td>' +
												formaciones[j].grado.descripcion +
												'</td><td>' +
												formaciones[j].nombre +
												'</td><td>' +
												formaciones[j].institucion +
												'</td><td>' +
												formaciones[j].descripcion +
												'</td><td><button type="button" name="removeFormacion" id="' +
												nfilaFormacion +
												'" class="btn btn-danger" onclick="eliminarFormacion(this)">Quitar</button></td></tr>';
										} else {
											filaFormacion =
												'<tr id="formacion' +
												nfilaFormacion +
												'"><td>' +
												formaciones[j].grado.descripcion +
												'</td><td>' +
												formaciones[j].nombre +
												'</td><td>' +
												formaciones[j].institucion +
												'</td><td>' +
												formaciones[j].descripcion +
												'</td></tr>';
										}
										//Aumentar contador;
										nfilaFormacion++;
										$('#formacion_director tr:last').after(filaFormacion);
									}
								}
								//Experiencias director
								if (director.experiencias != undefined) {
									var experiencias = director.experiencias;
									for (var k = 0; k < experiencias.length; k++) {
										var filaExperiencia;
										var tipoExperiencia;
										if (experiencias[k].tipo == 1) {
											tipoExperiencia = 'Docente';
										} else if (experiencias[k].tipo == 2) {
											tipoExperiencia = 'Profesional';
										} else {
											tipoExperiencia = 'Directiva';
										}
										if ($('#informacionCargar').val() != 4) {
											var c = document.createElement('INPUT');
											c.setAttribute('type', 'hidden');
											c.setAttribute('id', 'experienciaDirector' + nfila);
											c.setAttribute('name', 'DIRECTOR-experiencias[]');
											c.setAttribute(
												'value',
												JSON.stringify({
													id: experiencias[k].id,
													nombre: experiencias[k].nombre,
													tipo: experiencias[k].tipo,
													funcion: experiencias[k].funcion,
													institucion: experiencias[k].institucion,
													periodo: experiencias[k].periodo,
												})
											);
											__('inputsExperienciaDirector').appendChild(c);
											filaExperiencia =
												'<tr id="experiencia' +
												nfila +
												'"><td>' +
												tipoExperiencia +
												'</td><td>' +
												experiencias[k].nombre +
												'</td><td>' +
												experiencias[k].funcion +
												'</td><td>' +
												experiencias[k].institucion +
												'</td><td>' +
												experiencias[k].periodo +
												'</td><td><button type="button" name="removeFormacion" id="' +
												nfila +
												'" class="btn btn-danger" onclick="eliminarExperiencia(this)">Quitar</button></td></tr>';
										} else {
											filaExperiencia =
												'<tr id="experiencia' +
												nfila +
												'"><td>' +
												tipoExperiencia +
												'</td><td>' +
												experiencias[k].nombre +
												'</td><td>' +
												experiencias[k].funcion +
												'</td><td>' +
												experiencias[k].institucion +
												'</td><td>' +
												experiencias[k].periodo +
												'</td></tr>';
										}
										nfila++;
										$('#experiencia_director tr:last').after(filaExperiencia);
									}
								}
								//Publicaciones director
								if (director.publicaciones != undefined) {
									var publicaciones = director.publicaciones;
									for (var l = 0; l < publicaciones.length; l++) {
										var filaPublicacion;
										if (publicaciones[l].otros == null) {
											publicaciones[l].otros = '';
										}
										if ($('#informacionCargar').val() != 4) {
											var d = document.createElement('INPUT');
											d.setAttribute('type', 'hidden');
											d.setAttribute('id', 'publicacionesDirector' + nfila);
											d.setAttribute('name', 'DIRECTOR-publicaciones[]');
											d.setAttribute(
												'value',
												JSON.stringify({
													id: publicaciones[l].id,
													anio: publicaciones[l].anio,
													volumen: publicaciones[l].volumen,
													pais: publicaciones[l].pais,
													titulo: publicaciones[l].titulo,
													editorial: publicaciones[l].editorial,
													otros: publicaciones[l].otros,
												})
											);
											__('inputsPublicacionesDirector').appendChild(d);
											filaPublicacion =
												'<tr id="publicacion' +
												nfila +
												'"><td>' +
												publicaciones[l].titulo +
												'</td><td>' +
												publicaciones[l].volumen +
												'</td><td>' +
												publicaciones[l].editorial +
												'</td><td>' +
												publicaciones[l].anio +
												'</td><td>' +
												publicaciones[l].pais +
												'</td><td>' +
												publicaciones[l].otros +
												'</td><td><button type="button" name="removePublicacion" id="' +
												nfila +
												'" class="btn btn-danger" onclick="eliminarPublicacion(this)">Quitar</button></td></tr>';
										} else {
											filaPublicacion =
												'<tr id="publicacion' +
												nfila +
												'"><td>' +
												publicaciones[l].titulo +
												'</td><td>' +
												publicaciones[l].volumen +
												'</td><td>' +
												publicaciones[l].editorial +
												'</td><td>' +
												publicaciones[l].anio +
												'</td><td>' +
												publicaciones[l].pais +
												'</td><td>' +
												publicaciones[l].otros +
												'</td></tr>';
										}
										//Consttuir fila
										nfila++;
										$('#publicaciones_director tr:last').after(filaPublicacion);
									}
								}
							}
						}
					}
					//Tipo se puede cambiar segun cuando se requiera
					/* if( programa.diligencias != undefined  || $("#informacionCargar").val() == 4 && programa.diligencias != undefined){
            var diligencias = programa.diligencias;
            console.log("cargar diligencias");
            for (var i = 0; i < diligencias.length; i++) {
                  var fila;
                  if($("#informacionCargar").val() != 4){
                    var inputDiligencia = document.createElement("INPUT");
                    inputDiligencia.setAttribute("type","hidden");
                    inputDiligencia.setAttribute("id",'personaDiligencia'+nfilaPersonal);
                    inputDiligencia.setAttribute("name","DILIGENCIAS-personasDiligencias[]");
                    inputDiligencia.setAttribute("value",JSON.stringify({"id":diligencias[i].id,"nombre":diligencias[i].nombre,
                                                            "apellido_paterno":diligencias[i].apellido_paterno,
                                                            "apellido_materno":diligencias[i].apellido_materno,
                                                            "titulo_cargo":diligencias[i].titulo_cargo,
                                                            "telefono":diligencias[i].telefono,
                                                            "celular":diligencias[i].celular,
                                                            "correo":diligencias[i].correo,
                                                            "horario": diligencias[i].rfc
                                                            }));
                      __('inputsSeguimiento').appendChild(inputDiligencia);
                      fila = '<tr id="personal' + nfilaPersonal + '"><td>' + diligencias[i].nombre + " "+ diligencias[i].apellido_paterno +" "+ diligencias[i].apellido_materno +'</td><td>' + diligencias[i].titulo_cargo +'</td><td>' + diligencias[i].telefono + '</td><td>'+diligencias[i].celular+'</td><td>'+diligencias[i].correo+'</td><td>'+diligencias[i].rfc+ '</td><td><button type="button"  id="' + nfilaPersonal + '" class="btn btn-danger" onclick="eliminarPersonal(this)">Quitar</button></td></tr>';
                  }else{
                     fila = '<tr id="personal' + nfilaPersonal + '"><td>' + diligencias[i].nombre + " "+ diligencias[i].apellido_paterno +" "+ diligencias[i].apellido_materno +'</td><td>' + diligencias[i].titulo_cargo +'</td><td>' + diligencias[i].telefono + '</td><td>'+diligencias[i].celular+'</td><td>'+diligencias[i].correo+'</td><td>'+diligencias[i].rfc+ '</td></tr>';
                  }

                  $('#encomiendas tr:last').after(fila);
                  nfilaPersonal++;

            }
          } */
					if (
						(asignaturas != undefined && $('#tipo').val() == 2) ||
						(asignaturas != undefined && $('#tipo').val() == 3) ||
						($('#informacionCargar').val() == 4 && asignaturas != undefined)
					) {
						for (var n = 0; n < asignaturas.length; n++) {
							var filaAsignatura;
							let area_txt = '';
							switch (asignaturas[n].area) {
								case '1':
									area_txt = 'Formación General';
									break;
								case '2':
									area_txt = 'Formación Básica';
									break;
								case '3':
									area_txt = 'Formación Disciplinar';
									break;
								case '4':
									area_txt = 'Formación Electiva';
									break;
								case '5':
									area_txt = 'Formación Técnica';
									break;
								case '6':
									area_txt = 'Formación Especializante';
									break;
								default:
									area_txt = 'N/A';
									break;
							}
							if (asignaturas[n].seriacion == null) {
								asignaturas[n].seriacion = '';
							}
							if (asignaturas[n].tipo == 1) {
								if ($('#informacionCargar').val() != 4) {
									var asig = document.createElement('INPUT');
									asig.setAttribute('type', 'hidden');
									asig.setAttribute('id', 'asignatura' + nfila);
									asig.setAttribute('name', 'ASIGNATURA-asignaturas[]');
									asig.setAttribute(
										'value',
										JSON.stringify({
											grado: asignaturas[n].grado,
											nombre: asignaturas[n].nombre,
											clave: asignaturas[n].clave,
											creditos: asignaturas[n].creditos,
											area: asignaturas[n].area,
											seriacion: asignaturas[n].seriacion,
											horas_docente: asignaturas[n].horas_docente,
											horas_independiente: asignaturas[n].horas_independiente,
											academia: asignaturas[n].academia,
											tipo: asignaturas[n].tipo,
										})
									);
									__('inputsAsignaturas').appendChild(asig);
									filaAsignatura =
										'<tr id="row' +
										nfila +
										'"><td>' +
										asignaturas[n].grado +
										'</td><td>' +
										asignaturas[n].nombre +
										'</td><td>' +
										asignaturas[n].clave +
										'</td><td>' +
										asignaturas[n].seriacion +
										'</td><td id="hrsdocente' +
										nfila +
										'">' +
										asignaturas[n].horas_docente +
										'</td><td id="hrsindependiente' +
										nfila +
										'">' +
										asignaturas[n].horas_independiente +
										'</td><td>' +
										asignaturas[n].creditos +
										'</td><td>' +
										area_txt +
										'</td><td><button type="button" clave="' +
										asignaturas[n].clave +
										'" name="remove" id="' +
										nfila +
										'" class="btn btn-danger" onclick="eliminarMateria(this)">Quitar</button></td></tr>';
									nfila++;
								} else {
									// filaAsignatura = '<tr id="row' + nfila + '"><td>' + asignaturas[n].grado + '</td><td>' + asignaturas[n].nombre + '</td><td>'+asignaturas[n].clave+'</td><td>'+asignaturas[n].seriacion+'</td><td id="hrsdocente'+nfila+'">'+asignaturas[n].horas_docente+'</td><td id="hrsindependiente'+nfila+'">'+asignaturas[n].horas_independiente+'</td><td>'+asignaturas[n].creditos+ '</td><td>'+area_txt+'</td></tr>';
									// nfila++;
								}

								$('#totalHorasDocentes').val(
									parseInt($('#totalHorasDocentes').val()) +
										parseInt(asignaturas[n].horas_docente)
								);
								$('#totalHorasIndependientes').val(
									parseInt($('#totalHorasIndependientes').val()) +
										parseInt(asignaturas[n].horas_independiente)
								);

								//Cargar en select
								$('#asignaturaDocente').attr('disabled', false);
								$('#asignaturaDocente')
									.append(
										'<option value="' +
											asignaturas[n].clave +
											'">' +
											asignaturas[n].clave +
											' - ' +
											asignaturas[n].nombre +
											'</option>'
									)
									.selectpicker('refresh');
								$('#seriacion').attr('disabled', false);
								$('#seriacion')
									.append(
										'<option value="' +
											asignaturas[n].clave +
											'">' +
											asignaturas[n].clave +
											'</option>'
									)
									.selectpicker('refresh');
								$('#asignaturaInfraestructura')
									.append(
										'<option value="' +
											asignaturas[n].clave +
											'">' +
											asignaturas[n].clave +
											' - ' +
											asignaturas[n].nombre +
											'</option>'
									)
									.selectpicker('refresh');
								$('#materias tr:last').after(filaAsignatura);
							} else {
								var filaOptativa;
								if ($('#informacionCargar').val() != 4) {
									var opta = document.createElement('INPUT');
									opta.setAttribute('type', 'hidden');
									opta.setAttribute('id', 'optativas' + nfila);
									opta.setAttribute('name', 'ASIGNATURA-asignaturas[]');
									opta.setAttribute(
										'value',
										JSON.stringify({
											grado: asignaturas[n].grado,
											nombre: asignaturas[n].nombre,
											clave: asignaturas[n].clave,
											creditos: asignaturas[n].creditos,
											area: asignaturas[n].area,
											seriacion: asignaturas[n].seriacion,
											horas_docente: asignaturas[n].horas_docente,
											horas_independiente: asignaturas[n].horas_independiente,
											academia: asignaturas[n].academia,
											tipo: asignaturas[n].tipo,
										})
									);
									__('inputsOptativas').appendChild(opta);
									filaOptativa =
										'<tr id="row' +
										nfila +
										'"><td>' +
										asignaturas[n].grado +
										'</td><td>' +
										asignaturas[n].nombre +
										'</td><td>' +
										asignaturas[n].clave +
										'</td><td>' +
										asignaturas[n].seriacion +
										'</td><td id="hrsdocente' +
										nfila +
										'">' +
										asignaturas[n].horas_docente +
										'</td><td id="hrsindependiente' +
										nfila +
										'">' +
										asignaturas[n].horas_independiente +
										'</td><td>' +
										asignaturas[n].creditos +
										'</td><td>' +
										area_txt +
										'</td><td><button type="button" clave="' +
										asignaturas[n].clave +
										'" name="remove" id="' +
										nfila +
										'" class="btn btn-danger" onclick="eliminarMateria(this)">Quitar</button></td></tr>';
								} else {
									// filaOptativa = '<tr id="row' + nfila + '"><td>' + asignaturas[n].grado + '</td><td>' + asignaturas[n].nombre + '</td><td>'+asignaturas[n].clave+'</td><td>'+asignaturas[n].seriacion+'</td><td id="hrsdocente'+nfila+'">'+asignaturas[n].horas_docente+'</td><td id="hrsindependiente'+nfila+'">'+asignaturas[n].horas_independiente+'</td><td>'+asignaturas[n].creditos+ '</td><td>'+area_txt+'</td></tr>';
								}
								nfila++;
								$('#totalHorasDocentesOptativa').val(
									parseInt($('#totalHorasDocentesOptativa').val()) +
										parseInt(asignaturas[n].horas_docente)
								);
								$('#totalHorasIndependientesOptativa').val(
									parseInt($('#totalHorasIndependientesOptativa').val()) +
										parseInt(asignaturas[n].horas_independiente)
								);
								$('#materiasOptativas tr:last').after(filaOptativa);

								//Cargar en select
								$('#asignaturaDocente').attr('disabled', false);
								$('#asignaturaDocente')
									.append(
										'<option value="' +
											asignaturas[n].clave +
											'">' +
											asignaturas[n].clave +
											' - ' +
											asignaturas[n].nombre +
											'</option>'
									)
									.selectpicker('refresh');

								$('#seriacionOptativa').attr('disabled', false);
								$('#seriacionOptativa')
									.append(
										'<option value="' +
											asignaturas[n].clave +
											'">' +
											asignaturas[n].clave +
											'</option>'
									)
									.selectpicker('refresh');

								$('#asignaturaInfraestructura').attr('disabled', false);
								$('#asignaturaInfraestructura')
									.append(
										'<option value="' +
											asignaturas[n].clave +
											'">' +
											asignaturas[n].clave +
											' - ' +
											asignaturas[n].nombre +
											'</option>'
									)
									.selectpicker('refresh');
							}
						}
						$('#minimo_horas').val(programa.minimo_horas_optativas);
						$('#minimo_creditos').val(programa.minimo_creditos_optativas);
						var docentes = respuesta.data.docentes;
						if (docentes != undefined) {
							for (
								var posicionD = 0;
								posicionD < docentes.length;
								posicionD++
							) {
								var formacionesD;
								var formacionestxt;
								for (const property in docentes[posicionD]) {
									docentes[posicionD][property] == null
										? (docentes[posicionD][property] = '')
										: docentes[posicionD][property];
								}
								if (docentes[posicionD].formaciones.length == 2) {
									formacionesD = [
										{
											nivel: docentes[posicionD].formaciones[0].nivel,
											nombre: docentes[posicionD].formaciones[0].nombre,
											descripcion:
												docentes[posicionD].formaciones[0].descripcion,
										},
										{
											nivel: docentes[posicionD].formaciones[1].nivel,
											nombre: docentes[posicionD].formaciones[1].nombre,
											descripcion:
												docentes[posicionD].formaciones[1].descripcion,
										},
									];
									formacionestxt =
										docentes[posicionD].formaciones[0].nombre +
										': ' +
										docentes[posicionD].formaciones[0].descripcion +
										'<br></br>' +
										docentes[posicionD].formaciones[1].nombre +
										': ' +
										docentes[posicionD].formaciones[0].descripcion;
								} else if (docentes[posicionD].formaciones.length == 1) {
									formacionesD = [
										{
											nivel: docentes[posicionD].formaciones[0].nivel,
											nombre: docentes[posicionD].formaciones[0].nombre,
											descripcion:
												docentes[posicionD].formaciones[0].descripcion,
										},
									];
									formacionestxt =
										docentes[posicionD].formaciones[0].nombre +
										': ' +
										docentes[posicionD].formaciones[0].descripcion;
								}
								if (docentes[posicionD].tipo_docente == 1) {
									docentes[posicionD].tipo_docente_txt = 'Asignatura';
								} else if (docentes[posicionD].tipo_docente == 2) {
									docentes[posicionD].tipo_docente_txt = 'Tiempo completo';
								}

								if (docentes[posicionD].tipo_contratacion == 1) {
									docentes[posicionD].tipo_contratacion_txt = 'Contrato';
								} else if (docentes[posicionD].tipo_contratacion == 1) {
									docentes[posicionD].tipo_contratacion_txt =
										'Tiempo indefinido';
								} else {
									docentes[posicionD].tipo_contratacion_txt = 'Otro';
								}
								if (docentes[posicionD].antiguedad == '') {
									docentes[posicionD].antiguedad = 'Ninguna';
								}
								if (docentes[posicionD].experiencias == '') {
									docentes[posicionD].experiencias = 'No se guardó dato';
								}
								var filaDocente;
								if ($('#informacionCargar').val() != 4) {
									var docenteInput = document.createElement('INPUT');
									docenteInput.setAttribute('type', 'hidden');
									docenteInput.setAttribute('id', 'docente' + nfila);
									docenteInput.setAttribute('name', 'DOCENTE-docentes[]');
									docenteInput.setAttribute(
										'value',
										JSON.stringify({
											nombre: docentes[posicionD].persona.nombre,
											apellido_paterno:
												docentes[posicionD].persona.apellido_paterno,
											apellido_materno:
												docentes[posicionD].persona.apellido_materno,
											tipo_docente: docentes[posicionD].tipo_docente,
											tipo_contratacion: docentes[posicionD].tipo_contratacion,
											antiguedad: docentes[posicionD].antiguedad,
											formaciones: formacionesD,
											experiencias: docentes[posicionD].experiencias,
											asignaturas: docentes[posicionD].asignaturas,
										})
									);
									if (__('inputsDocentes')) {
										__('inputsDocentes').appendChild(docenteInput);
									}
									filaDocente =
										'<tr id="docente' +
										nfila +
										'"><td class="small">' +
										docentes[posicionD].persona.nombre +
										' ' +
										docentes[posicionD].persona.apellido_paterno +
										' ' +
										docentes[posicionD].persona.apellido_materno +
										'</td><td class="small">' +
										docentes[posicionD].tipo_docente_txt +
										'</td><td class="small">' +
										formacionestxt +
										'</td><td class="small">' +
										docentes[posicionD].asignaturas +
										'</td><td class="small">' +
										docentes[posicionD].experiencias +
										'</td><td class="small">' +
										docentes[posicionD].tipo_contratacion_txt +
										' - ' +
										docentes[posicionD].antiguedad +
										'</td><td class="small"><button type="button" name="removePublicacion" id="' +
										nfila +
										'" class="btn btn-danger" onclick="eliminarDocente(this)">Quitar</button></td></tr>';
								} else {
									// filaDocente = '<tr id="docente' + nfila + '"><td class="small">' + docentes[posicionD].persona.nombre + " "+ docentes[posicionD].persona.apellido_paterno+ " " + docentes[posicionD].persona.apellido_materno + '</td><td class="small">'+ docentes[posicionD].tipo_docente  +'</td><td class="small">' +  formacionestxt +'</td><td class="small">'+docentes[posicionD].asignaturas+'</td><td class="small">'+"NO SE GUARDÓ DATO"+'</td><td class="small">'+docentes[posicionD].tipo_contratacion+" - "+docentes[posicionD].antiguedad +'</td></tr>';
								}
								nfila++;
								$('#docentes tr:last').after(filaDocente);
							}
						}
						var infAsignatura = respuesta.data.asignatura_infraestructura;
						if (infAsignatura != undefined) {
							for (var indasig = 0; indasig < infAsignatura.length; indasig++) {
								var filaInfAsig;
								if ($('#informacionCargar').val() != 4) {
									var inputInfAsig = document.createElement('INPUT');
									inputInfAsig.setAttribute('type', 'hidden');
									inputInfAsig.setAttribute('id', 'infraestructura' + nfilaInf);
									inputInfAsig.setAttribute(
										'name',
										'INFRAESTRUCTURA-infraestructuras[]'
									);
									inputInfAsig.setAttribute(
										'value',
										JSON.stringify({
											tipo_instalacion_id:
												infAsignatura[indasig].tipo_instalacion_id,
											nombre: infAsignatura[indasig].nombre,
											ubicacion: infAsignatura[indasig].ubicacion,
											capacidad: infAsignatura[indasig].capacidad,
											metros: infAsignatura[indasig].metros,
											recursos: infAsignatura[indasig].recursos,
											asignaturas: infAsignatura[indasig].asignaturas,
										})
									);
									//__('inputsInfraestructuras').appendChild(inputInfAsig);
									filaInfAsig =
										'<tr id="infraestructura' +
										nfilaInf +
										'"><td>' +
										infAsignatura[indasig].instalacion.nombre +
										' ' +
										infAsignatura[indasig].nombre +
										'</td><td>' +
										infAsignatura[indasig].capacidad +
										'</td><td>' +
										infAsignatura[indasig].metros +
										'</td><td>' +
										infAsignatura[indasig].recursos +
										'</td><td>' +
										infAsignatura[indasig].ubicacion +
										'</td><td>' +
										infAsignatura[indasig].asignaturas +
										'</td><td><button type="button"  id="' +
										nfilaInf +
										'" class="btn btn-danger" onclick="eliminarInfraestructura(this)">Quitar</button></td></tr>';
								} else {
									// filaInfAsig = '<tr id="infraestructura' + nfilaInf + '"><td>' +  infAsignatura[indasig].instalacion.nombre + " " + infAsignatura[indasig].nombre+ '</td><td>'+ infAsignatura[indasig].capacidad  +'</td><td>'+ infAsignatura[indasig].metros +'</td><td>'+ infAsignatura[indasig].recursos + '</td><td>'+ infAsignatura[indasig].ubicacion + '</td><td>'+ infAsignatura[indasig].asignaturas +'</td></tr>';
								}

								$('#infraestructuras tr:last').after(filaInfAsig);
							}
						}
						var infComun = respuesta.data.infraestructuraComun;
						console.log('ALTA de solicitud de refrendo');
						if (infComun != undefined) {
							for (var indInf = 0; indInf < infComun.length; indInf++) {
								var filaInf;
								if ($('#informacionCargar').val() != 4) {
									var inputInf = document.createElement('INPUT');
									inputInf.setAttribute('type', 'hidden');
									inputInf.setAttribute('id', 'infraestructura' + nfilaInf);
									inputInf.setAttribute(
										'name',
										'INFRAESTRUCTURA-infraestructuras[]'
									);
									inputInf.setAttribute(
										'value',
										JSON.stringify({
											tipo_instalacion_id: infComun[indInf].tipo_instalacion_id,
											nombre: infComun[indInf].nombre,
											ubicacion: infComun[indInf].ubicacion,
											capacidad: infComun[indInf].capacidad,
											metros: infComun[indInf].metros,
											recursos: infComun[indInf].recursos,
											asignaturas: 'USO COMÚN',
										})
									);
									//__('inputsInfraestructuras').appendChild(inputInf);
									filaInf =
										'<tr id="infraestructura' +
										nfilaInf +
										'"><td>' +
										infComun[indInf].instalacion.nombre +
										' ' +
										infComun[indInf].nombre +
										'</td><td>' +
										infComun[indInf].capacidad +
										'</td><td>' +
										infComun[indInf].metros +
										'</td><td>' +
										infComun[indInf].recursos +
										'</td><td>' +
										infComun[indInf].ubicacion +
										'</td><td>' +
										'USO COMÚN NO SE TRATA' +
										'</td><td><button type="button"  id="' +
										nfilaInf +
										'" class="btn btn-danger" onclick="eliminarInfraestructura(this)">Quitar</button></td></tr>';
								} else {
									// filaInf = '<tr id="infraestructura' + nfilaInf + '"><td>' +  infComun[indInf].instalacion.nombre + " " + infComun[indInf].nombre+ '</td><td>'+ infComun[indInf].capacidad  +'</td><td>'+ infComun[indInf].metros +'</td><td>'+ infComun[indInf].recursos + '</td><td>'+ infComun[indInf].ubicacion + '</td><td>'+ "USO COMÚN NO SE TRATA" +'</td></tr>';
								}
								$('#infraestructuras tr:last').after(filaInf);
							}
						}
					}
					//Propiedades de programa
					for (let variable in programa) {
						if (programa.hasOwnProperty(variable)) {
							if (variable == 'nombre') {
								$('#nombre_programa').val(programa[variable]);
							} else if (variable == 'tipo') {
								//No se carga la variable programa[tipo] en elemento ($("#tipo").val() de solicitud para evitar error
							} else if (
								$('#tipo').val() == 3 &&
								(variable == 'necesidad_profesional' ||
									variable == 'necesidad_institucional' ||
									variable == 'necesidad_social' ||
									variable == 'estudio_oferta_demanda' ||
									variable == 'fuentes_informacion' ||
									variable == 'recursos_operacion')
							) {
								//No se carga la información del programa anterior
							} else {
								$('#' + variable).val(programa[variable]);
							}
						}
						if (variable == 'nivel_id') {
							$('#' + variable).attr('disabled', 'true');
							let variableHidden = `<input type="hidden" 
                                            campo="Nivel del programa" 
                                            ubicacion="Programas de estudio - Datos generales" 
                                            id="nivel_id"
                                            name="PROGRAMA-nivel_id"
                                            value="${parseInt(
																							programa[variable]
																						)}"/>`;
							$('#' + variable)
								.parent()
								.append(variableHidden);
						}
					}
					if (programa.modalidad_id > 1 && programa.mixta != undefined) {
						var mixta = programa.mixta;
						for (var elemento in mixta) {
							if (mixta.hasOwnProperty(elemento)) {
								$('#' + elemento).val(mixta[elemento]);
							}
						}
						if (programa.mixta.tecnologias_informacion_comunicacion != '') {
							var tics = programa.mixta.tecnologias_informacion_comunicacion;
							var posicionIngreso = tics.indexOf('INGRESO:');
							var posicionEstructura = tics.indexOf('ESTRUCTURA:');
							var posicionContratos = tics.indexOf('CONTRATOS:');
							$('#ti_ingreso').val(tics.substring(8, posicionEstructura));
							$('#ti_estructura').val(
								tics.substring(posicionEstructura + 11, posicionContratos)
							);
							$('#ti_contratos').val(tics.substring(posicionContratos + 10));
						}
					}
					if (programa.turnos != undefined) {
						$('#turno_programa').selectpicker('val', programa.turnos);
						$('#turno_programa').selectpicker('refresh');
					}
					if (programa.coordinador != undefined) {
						var inputIdCoordinador = document.createElement('INPUT');
						inputIdCoordinador.setAttribute('type', 'hidden');
						inputIdCoordinador.setAttribute('name', 'COORDINADOR-id');
						inputIdCoordinador.setAttribute('value', programa.coordinador.id);
						__('datos-generales-programa').appendChild(inputIdCoordinador);
						$('#nombre_coordinador_programa').val(programa.coordinador.nombre);
						$('#apellido_paterno_coordinador_programa').val(
							programa.coordinador.apellido_paterno
						);
						$('#apellido_materno_coordinador_programa').val(
							programa.coordinador.apellido_materno
						);
						$('#perfil_coordinador_programa').val(
							programa.coordinador.titulo_cargo
						);
					}
					if (programa.perfil_ingreso_conocimientos != '') {
						$('#perfil_ingreso_conocimientos').val(
							programa.perfil_ingreso_conocimientos
						);
						$('#perfil_ingreso_habilidades').val(
							programa.perfil_ingreso_habilidades
						);
						$('#perfil_ingreso_actitudes').val(
							programa.perfil_ingreso_actitudes
						);
					}
					if (programa.perfil_egreso_conocimientos != '') {
						$('#perfil_egreso_conocimientos').val(
							programa.perfil_egreso_conocimientos
						);
						$('#perfil_egreso_habilidades').val(
							programa.perfil_egreso_habilidades
						);
						$('#perfil_egreso_actitudes').val(programa.perfil_egreso_actitudes);
					}
					if (programa.trayectoria != undefined) {
						var trayectoria = programa.trayectoria;
						for (var propiedad in trayectoria) {
							if (trayectoria.hasOwnProperty(propiedad)) {
								$('#' + propiedad).val(trayectoria[propiedad]);
							}
						}
					}
				}
			}
		},
		error: function (respuesta, errmsg, err) {
			console.log(respuesta.status + ': ' + respuesta.responseText);
		},
	});
};
//Validar que todos los campos esten llenos para terminar la solicitud
Solicitud.camposLlenos = function () {
	var mensaje = $('#mensaje');
	var resultado = '';
	$('.revision').each(function () {
		if ($(this).val() == '') {
			resultado = resultado + $(this).attr('campo') + '<br>';
		}
	});

	if ($('#turno_programa').val() == '') {
		resultado = resultado + 'Turno del programa' + '<br>';
	}

	if ($('#tipo').val() != 3) {
		if (
			$('#inputsLicencias > *').length == 0 &&
			$('#auxmodalidad').val() == 2
		) {
			resultado = resultado + 'Por lo menos introduzca una licencia' + '<br>';
		}
		if (
			$('#inputsRespaldos > *').length == 0 &&
			$('#auxmodalidad').val() == 2
		) {
			resultado = resultado + 'Por lo menos un sistema de respaldo' + '<br>';
		}
		if ($('#inputsEspejos > *').length == 0 && $('#auxmodalidad').val() == 2) {
			resultado =
				resultado + 'Por lo menos introzduca un sistema de espejo' + '<br>';
		}
	}

	if (resultado.length > 0) {
		$('#modalErrores').modal();
		var mensajes = $('#mensajesError');
		$('#tamanoModal').attr('style', 'margin-top:20px;');
		mensajes.addClass('alert alert-danger');
		mensajes.html(
			"<p class='text-left'><strong>Los siguientes campos deben de llenarse:</strong></p>" +
				"<p class='text-left'>" +
				resultado +
				'</p>'
		);
	} else {
		$('#modalConfirmacion').modal();
		/* if ($('#es_nombre_autorizado').val() == 1 || $('#tipo').val() >= 2) {
			$('#modalConfirmacion').modal();
		} else {
			$('#tamanoModal2021').attr('style', 'margin-top:80px;');
			$('#mensajeConvocatoria2021').addClass('alert alert-danger');
			$('#modalFueraDeConvocatoria').modal();
		} */
		$('#opcionSolicitud').val(1);
		$('#tamanoModales').attr('style', 'margin-top:20px;');
	}
};
//Terminar la solicitud
Solicitud.terminar = function () {
	let btnTerminar = document.getElementById('boton-terminar');
	btnTerminar.classList.remove('active');
	btnTerminar.classList.add('disabled');
	btnTerminar.setAttribute('disabled', '');
	$('#estatus_solicitud').val(2);
	$('#solicitudes').submit();
};
//Propiedad disabled true para la vista de ver-solicitudes
Solicitud.inputsDeshabilitados = function () {
	$('.deshabilitar').each(function () {
		$(this).attr('disabled', true);
	});
};
//Datos para el modal de borar solicitud
Solicitud.datosModal = function (registro) {
	$('#informacion-solicitud').html(
		registro.folio +
			' que pertenece al programa de estudios ' +
			registro.programa +
			'. Ubicado en el plantel, ' +
			registro.plantel
	);
	$('#eliminar').val(registro.id);
	$('#modalEliminar').modal('show');
};
//Borrar solicitud
Solicitud.borrarRegistro = function () {
	var id_eliminar = $('#eliminar').val();
	Solicitud.promesaEliminar = $.ajax({
		type: 'POST',
		url: '../controllers/control-solicitud.php',
		data: { webService: 'eliminar', url: '', id: id_eliminar },
		dataType: 'json',
		success: function (response) {
			var mensaje = $('#mensaje');
			mensaje.addClass('alert alert-success').show();
			mensaje.html('Registro borrado');
			Solicitud.tabla.ajax.reload();
		},
		error: function (response) {
			console.log('ERROR');
			console.log(response);
		},
	});
};
//Verificar la extension del archivo
Solicitud.verificarArchivo = function (file) {
	var fileName = file.files[0].name;
	var fileSize = file.files[0].size;

	if (fileSize > 2000000) {
		alert('El archivo no debe superar los "2MB"');
		file.value = '';
		file.files[0].name = '';
	} else {
		// recuperamos la extensión del archivo
		var ext = fileName.split('.').pop();

		switch (ext) {
			case 'jpg':
			case 'jpeg':
			case 'png':
			case 'pdf':
				break;
			default: // reset del valor
				alert('El archivo no tiene la extensión adecuada');
				file.value = '';
				file.files[0].name = '';
		}
	}
};

function setTextDuracionPeriodos(e) {
	const selectElement = e.target;
	const value = selectElement.value;

	let txt_duracion_periodos = '';
	switch (value) {
		case '1':
		case '4':
			txt_duracion_periodos = 'Periodos semestrales';
			break;
		case '2':
		case '5':
			txt_duracion_periodos = 'Periodos cuatrimestrales';
			break;
		case '3':
			txt_duracion_periodos = 'Periodos anuales';
			break;
		default:
			txt_duracion_periodos = 'Periodos';
			break;
	}
	$('#txt_duracion_periodos').text(txt_duracion_periodos);
}

//Iniciliza las funciones necesarias
$(document).ready(function ($) {
	//Mis Solicitudes
	if ($('#opcionesCargar').val() == 1) {
		//Campo para mostrar los mensajes
		$('#mensaje').on('click', Solicitud.ocultarMensaje);
		//Funciones necesarias
		Solicitud.getSolicitudes();
		Solicitud.getTipos();
		Solicitud.getModalidades();

		//Promesas que se deben de cumplir
		$.when(
			Solicitud.tabla,
			Solicitud.TiposPromesa,
			Solicitud.modalidadesPromesa
		)
			//Si todas las promesas se realizaron
			.then(function () {
				//Se detiene el gif de cargando
				console.log('Las promesas de mis solicitudes :');
			})

			.done(function () {
				console.log('  Fueron exitosas');
				//Si la información de los planteles registrados se carga con exíto se quita el gif "cargando".
				Solicitud.getPlantelesBasicos();
				Solicitud.planteles.done(function () {
					console.log('Planteles cargados');
					var gif = (document.getElementById('cargando').style.display =
						'none');
				});
			})
			//Si por lo menos una promesa falla
			.fail(function () {
				console.log('  Algo falló');
			});
	} else {
		Solicitud.getMunicipios();
		Solicitud.getNiveles();
		Solicitud.getModalidades();
		Solicitud.getTurnos();
		Solicitud.getInstalacion();
		Solicitud.getRepresentante(); //Revisar estos
		Solicitud.getPlantelesBasicos(); //revisar estos
		Solicitud.getEvaluadores();
		$.when(
			Solicitud.evaluadoresPromesa,
			Solicitud.municipiosPromesa,
			Solicitud.nivelesPromesa,
			Solicitud.modalidadesPromesa,
			Solicitud.turnosPromesa,
			Solicitud.instalacionPrograma,
			Solicitud.planteles,
			Solicitud.datosRepresentante
		)
			.then(function () {
				console.log(' Promesas completadas para alta solicitud');
			})
			.done(function () {
				const periodos_select = document.getElementById('ciclo_id');
				periodos_select.addEventListener('change', setTextDuracionPeriodos);

				//Elementos con fechas
				if ($('#fecha_evaluacion').length) {
					$('#fecha_evaluacion').datepicker({
						firstDay: 1,
						monthNames: [
							'Enero',
							'Febrero',
							'Marzo',
							'Abril',
							'Mayo',
							'Junio',
							'Julio',
							'Agosto',
							'Septiembre',
							'Octubre',
							'Noviembre',
							'Diciembre',
						],
						dayNamesMin: ['Do', 'Lu', 'Ma', 'Mi', 'Ju', 'Vi', 'Sá'],
						dateFormat: 'yy-mm-dd',
					});
				}

				document.getElementById('cargando').style.display = 'none';
				//Seleccionar input de modalidad tomando el get
				if ($('#tipo').val() == 1) {
					$('#modalidad_id').val($('#auxmodalidad').val());
					$('#modalidad_id').attr('disabled', true);
				}
				console.log('Todo listo para cargar la informacion necesaria');
				//Carga la informacion del plantel seleccionado previamente en mis solicitudes
				if (
					$('#informacionCargar').val() == 1 &&
					$('#datosNecesarios').val() > 0
				) {
					document.getElementById('cargando').style.display = 'block';
					Solicitud.getDatosPlantel($('#datosNecesarios').val());
					Solicitud.promesaPlantel.done(function () {
						console.log('datos del plantel se cargaron');
						document.getElementById('cargando').style.display = 'none';
						$('#modalInicial').modal();
						$('#tamanoModales').attr('style', 'margin-top:80px;');
					});
				}
				//Carga la informacion del programa seleccionado previamente en mis solicitudes
				if ($('#tipo').val() == 2 || $('#tipo').val() == 3) {
					//infomacion cargar de tipo 3 no trae el valor 2, trae el valor 1, corregir
					if (
						($('#informacionCargar').val() == 2 &&
							$('#datosNecesarios').val() > 0) ||
						($('#informacionCargar').val() == 3 &&
							$('#datosNecesarios').val() > 0) ||
						($('#informacionCargar').val() == 4 &&
							$('#datosNecesarios').val() > 0)
					) {
						document.getElementById('cargando').style.display = 'block';
						Solicitud.modificacionPrograma();
						Solicitud.promesaModificacionPrograma.done(function () {
							console.log('datos del programa se cargaron');
							if ($('#datosPlantel').val() > 0) {
								Solicitud.plantelId = $('#datosPlantel').val();
								Solicitud.tipo = 3;
							}
							if (Solicitud.tipo == 3) {
								Solicitud.getDatosPlantel(Solicitud.plantelId);
								Solicitud.promesaPlantel.done(function () {
									console.log('datos del plantel se cargaron');
								});
							}
							/* if( $("#informacionCargar").val() == 2){
                $("#tipo").val("2");
              }else{
                $("#tipo").val(Solicitud.tipo_solicitud );
              } */
							if ($('#informacionCargar').val() == 4) {
								Solicitud.inputsDeshabilitados();
							}
							document.getElementById('cargando').style.display = 'none';
							$('#modalInicial').modal();
							$('#tamanoModales').attr('style', 'margin-top:80px;');
						});
					}
				}
			})
			.fail(function () {
				console.log('Pero algo fallo');
			});
	}
});
