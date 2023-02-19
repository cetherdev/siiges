//Objeto
var EditarSolicitud = {};
//Si ha tenido observaciones, le permite terminar solicitud
var TerminarSolicitud = {};
// Var para almacenar datos de evaluacion
var Guia = {};

//Función para periodo final de modalConvocatoria
//Sólo los programas que ya están en observación pueden subir su información
TerminarSolicitud.getEstatusSolicitud = function () {
	TerminarSolicitud.promesaEstatusSolicitud = $.ajax({
		type: 'POST',
		url: '../controllers/control-solicitud-estatus.php',
		dataType: 'json',
		data: {
			webService: 'consultarEstatusSolicitud',
			url: '',
			solicitud_id: $('#id_solicitud').val(),
		},
		success: function (respuesta) {
			//Si el estatus de la solicitud está en observación entonces si puede entrar a editar su inforamción
			if (respuesta.data.length > 0) {
				for (let i = 0; i < respuesta.data.length; i++) {
					let estatus = respuesta.data[i].estatus_solicitud_id;
					//Si tiene observaciones, que permita guardarSolicitud y mostrar modal
					if (estatus === '200') {
						//$("#btnTerminar").attr("disabled",false)
						//$("#btnGuardar").attr("disabled",false)
					}
					if ($('#editar').val() == 0) {
						//$("#btnGuardar").attr("disabled",true);
						//$("#btnTerminar").attr("disabled",true);
					}
				}
			}
			// Si es el primer guardado de la solicitud, no tiene estatus y se muestra el mensaje de tiempo fuera de la solicitud
			else {
				if ($('#tipo').val() == 1) {
					//Modal para termino de convocatoria
					/* $("#modalConvocatoria").modal();
          $("#tamanoModalConvocatoria").attr("style", "margin-top:80px;");
          $("#mensajeConvocatoriaExpirada").addClass("alert alert-danger"); */
				}
			}
		},
		error: function (respuesta, errmsg, err) {
			console.log(respuesta);
		},
	});
};

//Obtener una solicitud en especifico
EditarSolicitud.getSolicitud = function () {
	EditarSolicitud.promesaDatosSolicitud = $.ajax({
		type: 'POST',
		url: '../controllers/control-solicitud-usuario.php',
		dataType: 'json',
		data: {
			webService: 'datosSolicitud',
			url: '',
			solicitud_id: $('#id_solicitud').val(),
		},
		success: function (respuesta) {
			if (respuesta.status == '202') {
				//location.href = respuesta.data;
			}
			if (respuesta.data != '') {
				const convocatoria = Number(respuesta.data.solicitud.convocatoria);

				//No se pide pago después de la convocatoria 2019
				if (convocatoria > 2019) {
					const comprobante_pago = document.getElementById('comprobante_pago');
					const contenedor_pago = document.getElementById('contendorPago');
					comprobante_pago.remove();
					contenedor_pago.remove();
				}

				if (convocatoria >= 2021) {
					console.log('Convocatoria actual');
					console.log('Requisito evaluación curricular');
				}

				//Si es convocatoria 2021, se pide como requisito la evaluacion curricular, de lo contrario, se eliminan los campos
				const tipo_solicitud = Number(
					respuesta.data.solicitud.tipo_solicitud_id
				);

				if (convocatoria <= 2020 || convocatoria == '' || tipo_solicitud == 3) {
					const tabEvaluacion = document.getElementById('tab-evaluacion');
					const tab05 = document.getElementById('tab-05');
					tabEvaluacion.remove();
					tab05.remove();
					console.log('Migracion');
				}

				if (respuesta.data.documentos != undefined) {
					var documentos = respuesta.data.documentos;
					if ($('#editar').val() == 0) {
						$('#btnGuardar').attr('disabled', true);
						$('#btnTerminar').attr('disabled', true);
					}
					if (documentos.firma_representante != undefined) {
						$('#firma-id').val(documentos.firma_representante);
						$('#contenedorFirma').attr('style', 'display: block');
						$('#enlace-firma').attr(
							'href',
							documentos.firma_representante.archivo
						);
					}
					if (documentos.logotipo != undefined) {
						$('#logotipo-id').val(documentos.logotipo.id);
						$('#contendorLogotipo').attr('style', 'display: block');
						$('#enlace-logotipo').attr('href', documentos.logotipo.archivo);
					}
					if (documentos.estudio_pertinencia != undefined) {
						$('#pertinencia-id').val(documentos.estudio_pertinencia.id);
						$('#contendorPertinencia').attr('style', 'display: block');
						$('#enlace-pertinencia').attr(
							'href',
							documentos.estudio_pertinencia.archivo
						);
					}
					if (documentos.formato_pedagogico_01 != undefined) {
						$('#fdp_01-id').val(documentos.formato_pedagogico_01.id);
						$('#contendorFDP01').attr('style', 'display: block');
						$('#enlace-fdp_01').attr(
							'href',
							documentos.formato_pedagogico_01.archivo
						);
					}
          if (documentos.formato_herramientas_05 != undefined) {
						$('#fda_05-id').val(documentos.formato_herramientas_05.id);
						$('#contendorFDA05').attr('style', 'display: block');
						$('#enlace-fda_05').attr(
							'href',
							documentos.formato_herramientas_05.archivo
						);
					}
					if (documentos.dictamen_impi != undefined) {
						$('#impi-id').val(documentos.dictamen_impi.id);
						$('#contendorimpi').attr('style', 'display: block');
						$('#enlace-impi').attr('href', documentos.dictamen_impi.archivo);
					}
					if (documentos.oferta_demanda != undefined) {
						$('#demanda-id').val(documentos.oferta_demanda.id);
						$('#contendorOfertaDemanda').attr('style', 'display: block');
						$('#enlace-ofertaDemanda').attr(
							'href',
							documentos.oferta_demanda.archivo
						);
					}

					if (documentos.convenios != undefined) {
						$('#convenios-id').val(documentos.convenios.id);
						$('#contendorConvenios').attr('style', 'display: block');
						$('#enlace-convenios').attr('href', documentos.convenios.archivo);
					}

					if (documentos.mapa_curricular != undefined) {
						$('#curricular-id').val(documentos.mapa_curricular.id);
						$('#contendorMapaCurricular').attr('style', 'display: block');
						$('#enlace-mapaCurricular').attr(
							'href',
							documentos.mapa_curricular.archivo
						);
					}
					if (documentos.asignaturas != undefined) {
						$('#asignaturas-id').val(documentos.asignaturas.id);
						$('#contendorAsignaturas').attr('style', 'display: block');
						$('#enlace-asignaturas').attr(
							'href',
							documentos.asignaturas.archivo
						);
					}

					if (documentos.reglas_academias != undefined) {
						$('#academias-id').val(documentos.reglas_academias.id);
						$('#contendorReglasAcademia').attr('style', 'display: block');
						$('#enlace-reglasAcademia').attr(
							'href',
							documentos.reglas_academias.archivo
						);
					}

					if (documentos.propuesta_hemerobibliografica != undefined) {
						$('#propuesta_hemerobibliografica-id').val(
							documentos.propuesta_hemerobibliografica.id
						);
						$('#contendorPropuestaHemerobibliografica').attr(
							'style',
							'display: block'
						);
						$('#enlace-propuesta_hemerobibliografica').attr(
							'href',
							documentos.propuesta_hemerobibliografica.archivo
						);
					}

					if (documentos.informe_resultados != undefined) {
						$('#informe-id').val(documentos.informe_resultados.id);
						$('#contendorInformeResultados').attr('style', 'display: block');
						$('#enlace-informeResultados').attr(
							'href',
							documentos.informe_resultados.archivo
						);
					}
					if (documentos.instrumentos_trayectoria != undefined) {
						$('#instrumentos-id').val(documentos.instrumentos_trayectoria.id);
						$('#contendorInstrumentos').attr('style', 'display: block');
						$('#enlace-instrumentos').attr(
							'href',
							documentos.instrumentos_trayectoria.archivo
						);
					}
					if (documentos.trayectoria_educativa != undefined) {
						$('#trayectoria-id').val(documentos.trayectoria_educativa.id);
						$('#contendorTrayectoria').attr('style', 'display: block');
						$('#enlace-trayectoria').attr(
							'href',
							documentos.trayectoria_educativa.archivo
						);
					}
					if (documentos.biografia != undefined) {
						$('#biografia-id').val(documentos.biografia.id);
						$('#contenedorBiografia').attr('style', 'display: block');
						$('#enlace-biografia').attr('href', documentos.biografia.archivo);
					}
					if (documentos.bibliografia != undefined) {
						$('#bibliografia-id').val(documentos.bibliografia.id);
						$('#contenedorBibliografia').attr('style', 'display: block');
						$('#enlace-bibliografia').attr(
							'href',
							documentos.bibliografia.archivo
						);
					}
					if (documentos.identificacion_representante != undefined) {
						$('#identificacion-id').val(
							documentos.identificacion_representante.id
						);
						$('#contendorIdentificacionRepresentante').attr(
							'style',
							'display: block'
						);
						$('#enlace-identificacionRepresentante').attr(
							'href',
							documentos.identificacion_representante.archivo
						);
					}
					if (documentos.pago != undefined) {
						$('#pago-id').val(documentos.pago.id);
						$('#contendorPago').attr('style', 'display: block');
						$('#enlace-pago').attr('href', documentos.pago.archivo);
					}
					if (documentos.inmueble != undefined) {
						$('#inmueble-id').val(documentos.inmueble.id);
						$('#contendorInmueble').attr('style', 'display: block');
						$('#enlace-inmueble').attr('href', documentos.inmueble.archivo);
					}
					if (documentos.fotografias != undefined) {
						$('#fotografia-id').val(documentos.fotografias.id);
						$('#contendorFotografias').attr('style', 'display: block');
						$('#enlace-fotografias').attr(
							'href',
							documentos.fotografias.archivo
						);
					}
					if (documentos.plano != undefined) {
						$('#plano-id').val(documentos.plano.id);
						$('#contendorplanos').attr('style', 'display: block');
						$('#enlace-planos').attr('href', documentos.plano.archivo);
					}
					if (documentos.dictamenes != undefined) {
						$('#dictamenes-id').val(documentos.dictamenes.id);
						$('#contendordictamenes').attr('style', 'display: block');
						$('#enlace-dictamenes').attr('href', documentos.dictamenes.archivo);
					}
					if (documentos.infejal != undefined) {
						$('#infejal-id').val(documentos.infejal.id);
						$('#contendorinfejal').attr('style', 'display: block');
						$('#enlace-infejal').attr('href', documentos.infejal.archivo);
					}
					if (documentos.licencia_municipal != undefined) {
						$('#municipal-id').val(documentos.licencia_municipal.id);
						$('#contendormunicipal').attr('style', 'display: block');
						$('#enlace-municipal').attr(
							'href',
							documentos.licencia_municipal.archivo
						);
					}
					if (documentos.secretaria_salud != undefined) {
						$('#salud-id').val(documentos.secretaria_salud.id);
						$('#contendorsalud').attr('style', 'display: block');
						$('#enlace-salud').attr(
							'href',
							documentos.secretaria_salud.archivo
						);
					}
					if (documentos.comprobante_telefono != undefined) {
						$('#telefonos-id').val(documentos.comprobante_telefono.id);
						$('#contendortelefono').attr('style', 'display: block');
						$('#enlace-telefono').attr(
							'href',
							documentos.comprobante_telefono.archivo
						);
					}
					if (documentos.propuesta_horario != undefined) {
						$('#horarios-id').val(documentos.propuesta_horario.id);
						$('#contendorhorarios').attr('style', 'display: block');
						$('#enlace-horarios').attr(
							'href',
							documentos.propuesta_horario.archivo
						);
					}
					if (documentos.acuerdo_anterior != undefined) {
						$('#acuerdoAnterior-id').val(documentos.acuerdo_anterior.id);
						$('#contendoracuerdo').attr('style', 'display: block');
						$('#enlace-acuerdo').attr(
							'href',
							documentos.acuerdo_anterior.archivo
						);
					}
					if (documentos.propuesta_calendario != undefined) {
						$('#calendario-id').val(documentos.propuesta_calendario.id);
						$('#contendorcalendario').attr('style', 'display: block');
						$('#enlace-calendario').attr(
							'href',
							documentos.propuesta_calendario.archivo
						);
					}
					if (documentos.proyecto_vinculacion != undefined) {
						$('#vinculacion-id').val(documentos.proyecto_vinculacion.id);
						$('#contendorvinculacion').attr('style', 'display: block');
						$('#enlace-vinculacion').attr(
							'href',
							documentos.proyecto_vinculacion.archivo
						);
					}
					if (documentos.programa_superacion != undefined) {
						$('#superacion-id').val(documentos.programa_superacion.id);
						$('#contendorsuperacion').attr('style', 'display: block');
						$('#enlace-superacion').attr(
							'href',
							documentos.programa_superacion.archivo
						);
					}
					if (documentos.plan_mejora != undefined) {
						$('#mejora-id').val(documentos.plan_mejora.id);
						$('#contendormejora').attr('style', 'display: block');
						$('#enlace-mejora').attr('href', documentos.plan_mejora.archivo);
					}
					if (documentos.reglamento_institucional != undefined) {
						$('#reglamento-id').val(documentos.reglamento_institucional.id);
						$('#contendorreglamento').attr('style', 'display: block');
						$('#enlace-reglamento').attr(
							'href',
							documentos.reglamento_institucional.archivo
						);
					}
					if (documentos.dictamen_evaluacion != undefined) {
						$('#dictamen-id').val(documentos.dictamen_evaluacion.id);
						$('#contendordictamen').attr('style', 'display: block');
						$('#enlace-dictamen').attr(
							'href',
							documentos.dictamen_evaluacion.archivo
						);
					}
				}

				var programa = respuesta.data.programa;
				var plantel = respuesta.data.programa.plantel;
				let solicitud = respuesta.data.solicitud;
				var diligencias = respuesta.data.diligencias;

				//Cargar datos de solicitud
				if (solicitud != undefined) {
					$('#tipo-solicitud-txt').html(solicitud.tipo_solicitud.nombre);
					$('#convocatoria').val(solicitud.convocatoria);
				}

				//Cargar diligencias
				if (diligencias != undefined) {
					for (let i = 0; i < diligencias.length; i++) {
						let fila;
						for (const property in diligencias[i]) {
							diligencias[i][property] == null
								? (diligencias[i][property] = '')
								: diligencias[i][property];
						}
						if ($('#informacionCargar').val() != 4) {
							var inputDiligencia = document.createElement('INPUT');
							inputDiligencia.setAttribute('type', 'hidden');
							inputDiligencia.setAttribute(
								'id',
								'personaDiligencia' + diligencias[i].id
							);
							inputDiligencia.setAttribute(
								'name',
								'DILIGENCIAS-personasDiligencias[]'
							);
							inputDiligencia.setAttribute(
								'value',
								JSON.stringify({
									id: diligencias[i].id,
									nombre: diligencias[i].nombre,
									apellido_paterno: diligencias[i].apellido_paterno,
									apellido_materno: diligencias[i].apellido_materno,
									titulo_cargo: diligencias[i].titulo_cargo,
									telefono: diligencias[i].telefono,
									celular: diligencias[i].celular,
									correo: diligencias[i].correo,
									horario: diligencias[i].rfc,
								})
							);
							__('inputsSeguimiento').appendChild(inputDiligencia);
							fila =
								'<tr id="personal' +
								diligencias[i].id +
								'"><td>' +
								diligencias[i].nombre +
								' ' +
								diligencias[i].apellido_paterno +
								' ' +
								diligencias[i].apellido_materno +
								'</td><td>' +
								diligencias[i].titulo_cargo +
								'</td><td>' +
								diligencias[i].telefono +
								'</td><td>' +
								diligencias[i].celular +
								'</td><td>' +
								diligencias[i].correo +
								'</td><td>' +
								diligencias[i].rfc +
								'</td><td><button type="button"  id="personaDiligencia-' +
								diligencias[i].id +
								'_personal" class="btn btn-danger" onclick="EditarSolicitud.eliminarFilaTabla(this)">Quitar</button></td></tr>';
						} else {
							fila =
								'<tr id="personal' +
								diligencias[i].id +
								'"><td>' +
								diligencias[i].nombre +
								' ' +
								diligencias[i].apellido_paterno +
								' ' +
								diligencias[i].apellido_materno +
								'</td><td>' +
								diligencias[i].titulo_cargo +
								'</td><td>' +
								diligencias[i].telefono +
								'</td><td>' +
								diligencias[i].celular +
								'</td><td>' +
								diligencias[i].correo +
								'</td><td>' +
								diligencias[i].rfc +
								'</td></tr>';
						}
						$('#encomiendas tr:last').after(fila);
						nfilaPersonal = diligencias[i].id + 1;
					}
				}

				//Datos del rector
				if (respuesta.data.programa.plantel.rector != undefined) {
					var rector = respuesta.data.programa.plantel.rector;
					$('#id-rector').val(rector.id);
					$('#id-rector').attr('name', 'RECTOR-id');
					$('#nombre_rector').val(rector.nombre);
					$('#apellido_paterno_rector').val(rector.apellido_paterno);
					$('#apellido_materno_rector').val(rector.apellido_materno);
					$('#nacionalidad_rector').val(rector.nacionalidad);
					$('#curp_rector').val(rector.curp);
					$('#sexo_rector').val(rector.sexo);
					$('#correo_rector_institucional').val(rector.correo);
					$('#correo_rector_personal').val(rector.correo_secundario);
					$('#celular_rector').val(rector.celular);
					//Formaciones de rector
					if (rector.formaciones != undefined) {
						let formaciones = rector.formaciones;
						for (let j = 0; j < formaciones.length; j++) {
							let filaFormacion;
							if ($('#informacionCargar').val() != 4) {
								var b = document.createElement('INPUT');
								b.setAttribute('type', 'hidden');
								b.setAttribute('id', 'fromacionesRector' + formaciones[j].id);
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
									formaciones[j].id +
									'"><td>' +
									formaciones[j].grado.descripcion +
									'</td><td>' +
									formaciones[j].nombre +
									'</td><td>' +
									formaciones[j].institucion +
									'</td><td>' +
									formaciones[j].descripcion +
									'</td><td><button type="button" name="removeFormacion" id="fromacionesRector-' +
									formaciones[j].id +
									'_formacion" class="btn btn-danger" onclick="EditarSolicitud.eliminarFilaTabla(this)">Quitar</button></td></tr>';
							} else {
								filaFormacion =
									'<tr id="formacion' +
									formaciones[j].id +
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
							nfilaFormacion = formaciones[j].id + 1;
							$('#formacion_rector tr:last').after(filaFormacion);
						}
					}
				}

				//Datos del director
				if (respuesta.data.programa.plantel.director != undefined) {
					var director = respuesta.data.programa.plantel.director;
					$('#id-director').val(director.id);
					$('#id-director').attr('name', 'DIRECTOR-id');
					$('#nombre_director').val(director.nombre);
					$('#apellido_paterno_director').val(director.apellido_paterno);
					$('#apellido_materno_director').val(director.apellido_materno);
					$('#nacionalidad_director').val(director.nacionalidad);
					$('#curp_director').val(director.curp);
					$('#sexo_director').val(director.sexo);
					$('#correo_director_institucional').val(director.correo);
					$('#correo_director_personal').val(director.correo_secundario);
					$('#celular_director').val(director.celular);
					//Formaciones de director
					if (director.formaciones != undefined) {
						let formaciones = director.formaciones;
						for (let j = 0; j < formaciones.length; j++) {
							let filaFormacion;
							if ($('#informacionCargar').val() != 4) {
								let b = document.createElement('INPUT');
								b.setAttribute('type', 'hidden');
								b.setAttribute('id', 'fromacionesDirector' + formaciones[j].id);
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
									formaciones[j].id +
									'"><td>' +
									formaciones[j].grado.descripcion +
									'</td><td>' +
									formaciones[j].nombre +
									'</td><td>' +
									formaciones[j].institucion +
									'</td><td>' +
									formaciones[j].descripcion +
									'</td><td><button type="button" name="removeFormacion" id="fromacionesDirector-' +
									formaciones[j].id +
									'_formacion" class="btn btn-danger" onclick="EditarSolicitud.eliminarFilaTabla(this)">Quitar</button></td></tr>';
							} else {
								filaFormacion =
									'<tr id="formacion' +
									formaciones[j].id +
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
							nfilaFormacion = formaciones[j].id + 1;
							$('#formacion_director tr:last').after(filaFormacion);
						}
					}
					//Experiencias director
					if (director.experiencias != undefined) {
						let experiencias = director.experiencias;
						for (let k = 0; k < experiencias.length; k++) {
							let filaExperiencia;
							let tipoExperiencia;
							if (experiencias[k].tipo == 1) {
								tipoExperiencia = 'Docente';
							} else if (experiencias[k].tipo == 2) {
								tipoExperiencia = 'Profesional';
							} else {
								tipoExperiencia = 'Directiva';
							}
							if ($('#informacionCargar').val() != 4) {
								let c = document.createElement('INPUT');
								c.setAttribute('type', 'hidden');
								c.setAttribute(
									'id',
									'experienciaDirector' + experiencias[k].id
								);
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
									experiencias[k].id +
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
									'</td><td><button type="button" name="removeFormacion" id="experienciaDirector-' +
									experiencias[k].id +
									'_experiencia" class="btn btn-danger" onclick="EditarSolicitud.eliminarFilaTabla(this)">Quitar</button></td></tr>';
							} else {
								filaExperiencia =
									'<tr id="experiencia' +
									experiencias[k].id +
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
							$('#experiencia_director tr:last').after(filaExperiencia);
							nfilaEx = experiencias[k].id + 1;
						}
					}
					//Publicaciones director
					if (director.publicaciones != undefined) {
						let publicaciones = director.publicaciones;
						for (let l = 0; l < publicaciones.length; l++) {
							let filaPublicacion;
							for (const property in publicaciones[l]) {
								publicaciones[l][property] == null
									? (publicaciones[l][property] = '')
									: publicaciones[l][property];
							}
							if ($('#informacionCargar').val() != 4) {
								let d = document.createElement('INPUT');
								d.setAttribute('type', 'hidden');
								d.setAttribute(
									'id',
									'publicacionesDirector' + publicaciones[l].id
								);
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
									publicaciones[l].id +
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
									'</td><td><button type="button" name="removePublicacion" id="publicacionesDirector-' +
									publicaciones[l].id +
									'_publicacion" class="btn btn-danger" onclick="EditarSolicitud.eliminarFilaTabla(this)">Quitar</button></td></tr>';
							} else {
								filaPublicacion =
									'<tr id="publicacion' +
									publicaciones[l].id +
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
							$('#publicaciones_director tr:last').after(filaPublicacion);
							nfilaPu = publicaciones[l].id + 1;
						}
					}
				}

				//Datos del programa
				if (programa != undefined) {
					$('#id_solicitud').val(programa.solicitud_id);
					$('#id_solicitud').attr('name', 'SOLICITUD-id');
					//Propiedades de programa
					for (var variable in programa) {
						if (programa.hasOwnProperty(variable)) {
							if (variable == 'nombre') {
								$('#nombre_programa').val(programa[variable]);
							} else if (variable == 'tipo') {
								//No se carga la variable programa[tipo] en elemento ($("#tipo").val() de solicitud para evitar error
							} else {
								$('#' + variable).val(programa[variable]);
							}

							if (variable == 'ciclo_id') {
								let txt_duracion_periodos = '';
								switch (programa[variable]) {
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
						$('#trayectoria_id').val(trayectoria.id);
						for (var propiedad in trayectoria) {
							if (trayectoria.hasOwnProperty(propiedad)) {
								$('#' + propiedad).val(trayectoria[propiedad]);
							}
						}
					}
					var asignaturas = respuesta.data.asignaturas;
					if (asignaturas != undefined) {
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
							if (asignaturas[n].seriacion === null) {
								asignaturas[n].seriacion = '';
							}
							if (asignaturas[n].tipo == 1) {
								if ($('#informacionCargar').val() != 4) {
									var asig = document.createElement('INPUT');
									asig.setAttribute('type', 'hidden');
									asig.setAttribute('id', 'asignatura' + asignaturas[n].id);
									asig.setAttribute('name', 'ASIGNATURA-asignaturas[]');
									asig.setAttribute(
										'value',
										JSON.stringify({
											id: asignaturas[n].id,
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
											infraestructura_id: asignaturas[n].infraestructura_id,
										})
									);
									__('inputsAsignaturas').appendChild(asig);
									filaAsignatura =
										'<tr id="row' +
										asignaturas[n].id +
										'"><td>' +
										asignaturas[n].grado +
										'</td><td>' +
										asignaturas[n].nombre +
										'</td><td>' +
										asignaturas[n].clave +
										'</td><td>' +
										asignaturas[n].seriacion +
										'</td><td id="hrsdocente' +
										asignaturas[n].id +
										'">' +
										asignaturas[n].horas_docente +
										'</td><td id="hrsindependiente' +
										asignaturas[n].id +
										'">' +
										asignaturas[n].horas_independiente +
										'</td><td>' +
										asignaturas[n].creditos +
										'</td><td>' +
										area_txt +
										'</td><td><button type="button" clave="' +
										asignaturas[n].clave +
										'" name="remove" id="' +
										asignaturas[n].id +
										'" class="btn btn-danger" onclick="EditarSolicitud.eliminarMateria(this)">Quitar</button></td></tr>';
								} else {
									filaAsignatura =
										'<tr id="row' +
										asignaturas[n].id +
										'"><td>' +
										asignaturas[n].grado +
										'</td><td>' +
										asignaturas[n].nombre +
										'</td><td>' +
										asignaturas[n].clave +
										'</td><td>' +
										asignaturas[n].seriacion +
										'</td><td id="hrsdocente' +
										asignaturas[n].id +
										'">' +
										asignaturas[n].horas_docente +
										'</td><td id="hrsindependiente' +
										asignaturas[n].id +
										'">' +
										asignaturas[n].horas_independiente +
										'</td><td>' +
										asignaturas[n].creditos +
										'</td><td>' +
										area_txt +
										'</td></tr>';
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
								nfilaM = asignaturas[n].id + 1;
							} else {
								var filaOptativa;
								if ($('#informacionCargar').val() != 4) {
									var opta = document.createElement('INPUT');
									opta.setAttribute('type', 'hidden');
									opta.setAttribute('id', 'optativas' + asignaturas[n].id);
									opta.setAttribute('name', 'ASIGNATURA-asignaturas[]');
									opta.setAttribute(
										'value',
										JSON.stringify({
											id: asignaturas[n].id,
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
										'<tr id="optativa' +
										asignaturas[n].id +
										'"><td>' +
										asignaturas[n].grado +
										'</td><td>' +
										asignaturas[n].nombre +
										'</td><td>' +
										asignaturas[n].clave +
										'</td><td>' +
										asignaturas[n].seriacion +
										'</td><td id="hrsdocenteOptativa' +
										asignaturas[n].id +
										'">' +
										asignaturas[n].horas_docente +
										'</td><td id="hrsindependienteOptativa' +
										asignaturas[n].id +
										'">' +
										asignaturas[n].horas_independiente +
										'</td><td>' +
										asignaturas[n].creditos +
										'</td><td>' +
										area_txt +
										'</td><td><button type="button" clave="' +
										asignaturas[n].clave +
										'" name="remove" id="' +
										asignaturas[n].id +
										'" class="btn btn-danger" onclick="EditarSolicitud.eliminarOptativa(this)">Quitar</button></td></tr>';
								} else {
									filaOptativa =
										'<tr id="row' +
										asignaturas[n].id +
										'"><td>' +
										asignaturas[n].grado +
										'</td><td>' +
										asignaturas[n].nombre +
										'</td><td>' +
										asignaturas[n].clave +
										'</td><td>' +
										asignaturas[n].seriacion +
										'</td><td id="hrsdocente' +
										asignaturas[n].id +
										'">' +
										asignaturas[n].horas_docente +
										'</td><td id="hrsindependiente' +
										asignaturas[n].id +
										'">' +
										asignaturas[n].horas_independiente +
										'</td><td>' +
										asignaturas[n].creditos +
										'</td><td>' +
										area_txt +
										'</td></tr>';
								}

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
								nfilaMO = asignaturas[n].id + 1;
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
								for (const property in docentes[posicionD].persona) {
									docentes[posicionD].persona[property] == null
										? (docentes[posicionD].persona[property] = '')
										: docentes[posicionD].persona[property];
								}
								if (docentes[posicionD].formaciones.length == 2) {
									formacionesD = [
										{
											nivel:
												docentes[posicionD].formaciones[0].grado.descripcion,
											nombre: docentes[posicionD].formaciones[0].nombre,
											descripcion:
												docentes[posicionD].formaciones[0].descripcion,
										},
										{
											nivel:
												docentes[posicionD].formaciones[1].grado.descripcion,
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
											nivel:
												docentes[posicionD].formaciones[0].grado.descripcion,
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
									docentes[posicionD].tipo_docente = 'Asignatura';
								} else if (docentes[posicionD].tipo_docente == 2) {
									docentes[posicionD].tipo_docente = 'Tiempo completo';
								}

								if (docentes[posicionD].tipo_contratacion == 1) {
									docentes[posicionD].tipo_contratacion = 'Contrato';
								} else if (docentes[posicionD].tipo_contratacion == 2) {
									docentes[posicionD].tipo_contratacion = 'Tiempo indefinido';
								} else {
									docentes[posicionD].tipo_contratacion = 'Otro';
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
									docenteInput.setAttribute(
										'id',
										'inputDocente' + docentes[posicionD].id
									);
									docenteInput.setAttribute('name', 'DOCENTE-docentes[]');
									docenteInput.setAttribute(
										'value',
										JSON.stringify({
											id: docentes[posicionD].id,
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
										docentes[posicionD].id +
										'"><td class="small">' +
										docentes[posicionD].persona.nombre +
										' ' +
										docentes[posicionD].persona.apellido_paterno +
										' ' +
										docentes[posicionD].persona.apellido_materno +
										'</td><td class="small">' +
										docentes[posicionD].tipo_docente +
										'</td><td class="small">' +
										formacionestxt +
										'</td><td class="small">' +
										docentes[posicionD].asignaturas +
										'</td><td class="small">' +
										docentes[posicionD].experiencias +
										'</td><td class="small">' +
										docentes[posicionD].tipo_contratacion +
										' - ' +
										docentes[posicionD].antiguedad +
										'</td><td class="small"><button type="button" name="removePublicacion" id="inputDocente-' +
										docentes[posicionD].id +
										'_docente" class="btn btn-danger" onclick="EditarSolicitud.eliminarFilaTabla(this)">Quitar</button></td></tr>';
								} else {
									filaDocente =
										'<tr id="docente' +
										docentes[posicionD].id +
										'"><td class="small">' +
										docentes[posicionD].persona.nombre +
										' ' +
										docentes[posicionD].persona.apellido_paterno +
										' ' +
										docentes[posicionD].persona.apellido_materno +
										'</td><td class="small">' +
										docentes[posicionD].tipo_docente +
										'</td><td class="small">' +
										formacionestxt +
										'</td><td class="small">' +
										docentes[posicionD].asignaturas +
										'</td><td class="small">' +
										docentes[posicionD].experiencias +
										'</td><td class="small">' +
										docentes[posicionD].tipo_contratacion +
										' - ' +
										docentes[posicionD].antiguedad +
										'</td></tr>';
								}
								$('#docentes tr:last').after(filaDocente);
								nfilaDO = docentes[posicionD].id + 1;
							}
						}
						var infAsignatura = respuesta.data.asignatura_infraestructura;
						if (infAsignatura != undefined) {
							for (var indasig = 0; indasig < infAsignatura.length; indasig++) {
								if (infAsignatura[indasig].ubicacion == null) {
									infAsignatura[indasig].ubicacion = '';
								}
								var filaInfAsig;
								if ($('#informacionCargar').val() != 4) {
									var inputInfAsig = document.createElement('INPUT');
									inputInfAsig.setAttribute('type', 'hidden');
									inputInfAsig.setAttribute(
										'id',
										'inputInfraestructura' + infAsignatura[indasig].id
									);
									inputInfAsig.setAttribute(
										'name',
										'INFRAESTRUCTURA-infraestructuras[]'
									);
									inputInfAsig.setAttribute(
										'value',
										JSON.stringify({
											id: infAsignatura[indasig].id,
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
									__('inputsInfraestructuras').appendChild(inputInfAsig);
									filaInfAsig =
										'<tr id="infraestructura' +
										infAsignatura[indasig].id +
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
										'</td><td><button type="button"  id="inputInfraestructura-' +
										infAsignatura[indasig].id +
										'_infraestructura" class="btn btn-danger" onclick="EditarSolicitud.eliminarFilaTabla(this)">Quitar</button></td></tr>';
								} else {
									filaInfAsig =
										'<tr id="infraestructura' +
										infAsignatura[indasig].id +
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
										'</td></tr>';
								}

								$('#infraestructuras tr:last').after(filaInfAsig);
								nfilaInf = infAsignatura[indasig].id + 1;
							}
						}
					}
				} //Termina Programa

				//Datos del plantel
				if (plantel != undefined) {
					var objectPlantel = respuesta.data.programa.plantel;
					$('#plantel-id').val(objectPlantel.id);
					$('#plantel-id').attr('name', 'PLANTEL-id');
					$('#coordenadas').val(
						objectPlantel.domicilio.latitud +
							',' +
							objectPlantel.domicilio.longitud
					);
					//Propiedades del plantel
					for (var variablePlantel in objectPlantel) {
						if (objectPlantel.hasOwnProperty(variablePlantel)) {
							$('#' + variablePlantel).val(objectPlantel[variablePlantel]);
						}
					}
					//Direccion del plantel
					var Objdomicilio = objectPlantel.domicilio;
					$('#id_domiclio_plantel').val(Objdomicilio.id);
					$('#id_domiclio_plantel').attr('name', 'DOMICILIOPLANTEL-id');
					for (var campo in Objdomicilio) {
						if (Objdomicilio.hasOwnProperty(campo)) {
							$('#' + campo).val(Objdomicilio[campo]);
						}
					}

					//Dictamenes
					var dictamenes = respuesta.data.plantel.dictamenes;
					if (dictamenes != null) {
						$('#inputsDictamenes').empty();
						$('#dictamenes tr:not(:first)').remove();
						for (var dic = 0; dic < dictamenes.length; dic++) {
							var filaDictamen;
							if ($('#informacionCargar').val() != 4) {
								var inputDictamen = document.createElement('INPUT');
								inputDictamen.setAttribute('type', 'hidden');
								inputDictamen.setAttribute(
									'id',
									'inputDictamen' + dictamenes[dic].id
								);
								inputDictamen.setAttribute('name', 'DICTAMEN-dictamenes[]');
								inputDictamen.setAttribute(
									'value',
									JSON.stringify({
										id: dictamenes[dic].id,
										nombre: dictamenes[dic].nombre,
										autoridad: dictamenes[dic].autoridad,
										fecha_emision: dictamenes[dic].fecha_emision,
									})
								);
								if (__('inputsDictamenes')) {
									__('inputsDictamenes').appendChild(inputDictamen);
								}
								filaDictamen =
									'<tr id="dictamen' +
									dictamenes[dic].id +
									'"><td>' +
									dictamenes[dic].nombre +
									'</td><td>' +
									dictamenes[dic].autoridad +
									'</td><td>' +
									dictamenes[dic].fecha_emision +
									'</td><td><button type="button" name="removeDictamen" id="' +
									dictamenes[dic].id +
									'" class="btn btn-danger" onclick="eliminarDictamen(this)">Quitar</button></td></tr>';
							} else {
								filaDictamen =
									'<tr id="dictamen' +
									dictamenes[dic].id +
									'"><td>' +
									dictamenes[dic].nombre +
									'</td><td>' +
									dictamenes[dic].autoridad +
									'</td><td>' +
									dictamenes[dic].fecha_emision +
									'</td></tr>';
							}
							$('#dictamenes tr:last').after(filaDictamen);
						}
					}
					//Niveles con los que cuenta el plantel
					var edificios = respuesta.data.plantel.edificios;
					if (edificios != null) {
						for (var edf = 0; edf < edificios.length; edf++) {
							$('#' + edificios[edf].nivel.nombre).attr('checked', 'checked');
							//$("#"+edificios[edf].nivel.nombre).attr("name","EDIFICIO-"+edificios[edf].nivel.nombre+"-id:"+edificios[edf].nivel.id);
						}
					}

					//Seguridades
					var seguridades = respuesta.data.plantel.seguridades;
					if (seguridades != null) {
						for (var seg = 0; seg < seguridades.length; seg++) {
							$('#' + seguridades[seg].tipo_seguridad.nombre).val(
								seguridades[seg].cantidad
							);
							//$("#"+seguridades[seg].tipo_seguridad.nombre).attr("name","SEGURIDAD-"+seguridades[seg].tipo_seguridad.nombre+"-id:"+seguridades[seg].id);
						}
					}

					//Higienes del plantel
					var higienes = respuesta.data.plantel.higienes;
					if (higienes != null) {
						for (var hig = 0; hig < higienes.length; hig++) {
							$('#' + higienes[hig].tipo_higiene.nombre).val(
								higienes[hig].cantidad
							);
							//$("#"+higienes[hig].tipo_higiene.nombre).attr("name","HIGIENE-"+tipo_higiene.nombre+"-id:"+higienes[hig].id);
						}
					}

					//Infraestructura común
					var infComun = respuesta.data.plantel.infraestructura;
					if (infComun != undefined) {
						for (var indInf = 0; indInf < infComun.length; indInf++) {
							var filaInf;
							infComun[indInf].ubicacion =
								infComun[indInf].ubicacion == null
									? ''
									: infComun[indInf].ubicacion;
							if ($('#informacionCargar').val() != 4) {
								var inputInf = document.createElement('INPUT');
								inputInf.setAttribute('type', 'hidden');
								inputInf.setAttribute(
									'id',
									'inputInfraestructura' + infComun[indInf].id
								);
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
								filaInf =
									'<tr id="infraestructura' +
									infComun[indInf].id +
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
									'</td><td><button type="button"  id="inputInfraestructura-' +
									infComun[indInf].id +
									'_infraestructura" class="btn btn-danger" onclick="EditarSolicitud.eliminarFilaTabla(this)">Quitar</button></td></tr>';
							} else {
								filaInf =
									'<tr id="infraestructura' +
									infComun[indInf].id +
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
									'</td></tr>';
							}
							$('#infraestructuras tr:last').after(filaInf);
							nfilaInf = infComun[indInf].id + 1;
						}
					}

					//Instituciones de salud
					var instSalud = respuesta.data.plantel.instituciones_salud;
					if (instSalud != null) {
						for (var ind = 0; ind < instSalud.length; ind++) {
							var filaInstSalud;
							if ($('#informacionCargar').val() != 4) {
								var inputInsSalud = document.createElement('INPUT');
								inputInsSalud.setAttribute('type', 'hidden');
								inputInsSalud.setAttribute(
									'id',
									'inputInstitucionSalud' + instSalud[ind].id
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
								if (__('inputsSaludInstituciones')) {
									__('inputsSaludInstituciones').appendChild(inputInsSalud);
								}
								filaInstSalud =
									'<tr id="institucionSalud' +
									instSalud[ind].id +
									'"><td>' +
									instSalud[ind].nombre +
									'</td><td>' +
									instSalud[ind].tiempo +
									'</td><td><button type="button"  id="' +
									instSalud[ind].id +
									'" class="btn btn-danger" onclick="eliminarInstitucionSalud(this)">Quitar</button></td></tr>';
							} else {
								filaInstSalud =
									'<tr id="institucionSalud' +
									instSalud[ind].id +
									'"><td>' +
									instSalud[ind].nombre +
									'</td><td>' +
									instSalud[ind].tiempo +
									'</td></tr>';
							}
							$('#institucionesSalud tr:last').after(filaInstSalud);
						}
					}

					//Otros RVOES
					var otrosRVOES = respuesta.data.programa.otros_rvoes;
					if (otrosRVOES != null) {
						var rvoes = JSON.parse(otrosRVOES);
						for (var posiR = 0; posiR < rvoes.length; posiR++) {
							var filaOtro;
							var niveltxt = $('#nivelOtrosProgramas').val(rvoes[posiR].nivel);
							niveltxt = $('#nivelOtrosProgramas option:selected').html();
							var turnotxt = rvoes[posiR].turno;
							if (__('totalAlumnosOtrosProgramas')) {
								__('totalAlumnosOtrosProgramas').value =
									parseInt(__('totalAlumnosOtrosProgramas').value) +
									parseInt(rvoes[posiR].numero_alumnos);
							}
							if ($('#informacionCargar').val() != 4) {
								var inputOtro = document.createElement('INPUT');
								inputOtro.setAttribute('type', 'hidden');
								inputOtro.setAttribute('id', 'otroPrograma' + posiR);
								inputOtro.setAttribute('name', 'PROGRAMA-otrosRVOE[]');
								inputOtro.setAttribute(
									'value',
									JSON.stringify({
										nivel: rvoes[posiR].nivel,
										nombre: rvoes[posiR].nombre,
										acuerdo: rvoes[posiR].acuerdo,
										numero_alumnos: rvoes[posiR].numero_alumnos,
										turno: rvoes[posiR].turno,
									})
								);
								if (__('inputsOtrosProgramas')) {
									__('inputsOtrosProgramas').appendChild(inputOtro);
								}
								filaOtro =
									'<tr id="otroPrograma' +
									posiR +
									'"><td>' +
									niveltxt +
									'</td><td>' +
									rvoes[posiR].nombre +
									'</td><td>' +
									rvoes[posiR].acuerdo +
									'</td><td id="numeroAlumnos' +
									posiR +
									'">' +
									rvoes[posiR].numero_alumnos +
									'</td><td>' +
									turnotxt +
									'</td><td><button type="button"  id="' +
									posiR +
									'" class="btn btn-danger" onclick="eliminarOtrosProgramas(this)">Quitar</button></td></tr>';
								if (__('nivelOtrosProgramas')) {
									__('nivelOtrosProgramas').value = '';
								}
							} else {
								filaOtro =
									'<tr id="otroPrograma' +
									posiR +
									'"><td>' +
									niveltxt +
									'</td><td>' +
									rvoes[posiR].nombre +
									'</td><td>' +
									rvoes[posiR].acuerdo +
									'</td><td id="numeroAlumnos' +
									posiR +
									'">' +
									rvoes[posiR].numero_alumnos +
									'</td><td>' +
									turnotxt +
									'</td></tr>';
							}
							$('#otrosProgramas tr:last').after(filaOtro);
						}
					}
				} //Termina plantel

				// Datos de evaluación
				const evaluacion = respuesta.data.evaluacion;
				$('#programa_evaluacion').val(programa.nombre);
				if (evaluacion != '' && evaluacion != null) {
					$('#evaluacion_id').val(evaluacion.id);
					$('#programa_id_evaluacion').val(evaluacion.programa.id);
					$('#fecha_evaluacion').val(evaluacion.fecha);
					$('#cumplimiento_evaluacion').val(evaluacion.cumplimiento);
					$('#cumplimiento_evaluacion_input').val(evaluacion.cumplimiento);
					$('#numero_evaluacion').val(evaluacion.numero);
					$('#cumplimiento_id_evaluacion').val(evaluacion.tipo_cumplimiento.id);
					$('#tipo_cumplimiento_evaluacion').val(
						evaluacion.tipo_cumplimiento.nombre
					);
					$('#valoracion_evaluacion').val(evaluacion.valoracion);
					$('#lista_evaluadores').val(evaluacion.evaluador_id);
					$('#lista_evaluadores').selectpicker('refresh');
					$('#evaluador_id_evaluacion').val(evaluacion.evaluador_id);
				}
			}
		},
		error: function (respuesta, errmsg, err) {
			console.warn(respuesta.responseText);
			console.log(respuesta);
		},
	});
};

//Obtener cumplimientos para evaluacion
EditarSolicitud.getCumplimientos = function () {
	EditarSolicitud.promesaCumplimientos = $.ajax({
		type: 'POST',
		url: '../controllers/control-cumplimiento.php',
		dataType: 'json',
		data: { webService: 'consultarTodos', url: '' },
		success: function (respuesta) {
			//Cumplimientos
			Guia.cumplimientos = respuesta.data;
		},
		error: function (respuesta, errmsg, err) {
			console.log(respuesta);
		},
	});
};

//Calcula los resultados
EditarSolicitud.resultadoEvaluacion = function (respuesta) {
	const total = Number($('#numero_evaluacion').val());

	// Filtra el cumplimiento de acuerdo a la modalidad del programa
	var cumplimientosModalidad = Guia.cumplimientos.filter(
		(obj) => obj.modalidad_id == Number($('#modalidad_id').val())
	);

	for (var i = 0; i < cumplimientosModalidad.length; i++) {
		if (
			total >= cumplimientosModalidad[i].cumplimiento_minimo &&
			total <= cumplimientosModalidad[i].cumplimiento_maximo
		) {
			$('#cumplimiento_evaluacion').val(
				cumplimientosModalidad[i].porcentaje_cumplimiento
			);
			$('#cumplimiento_evaluacion_input').val(
				cumplimientosModalidad[i].porcentaje_cumplimiento
			);
			$('#cumplimiento_id_evaluacion').val(cumplimientosModalidad[i].id);
			$('#tipo_cumplimiento_evaluacion').val(cumplimientosModalidad[i].nombre);
		}
	}
};

//Eliminar las filas de las tablas
EditarSolicitud.eliminarFilaTabla = function (fila) {
	var indiceSeparacion = fila.id.indexOf('_');
	var id = fila.id.substring(fila.id.indexOf('-') + 1, indiceSeparacion);
	var filaTabla = fila.id.substr(indiceSeparacion + 1);
	var input = fila.id.substr(0, fila.id.indexOf('-'));
	$('#' + filaTabla + id).remove();
	var json = JSON.parse($('#' + input + id).val());
	$('#' + input + id).attr(
		'value',
		JSON.stringify({
			id: json.id,
			borrar: 1,
		})
	);
	console.log(
		$('#' + input + id).attr(
			'value',
			JSON.stringify({
				id: json.id,
				borrar: 1,
			})
		)
	);
};

//Eliminar materias
EditarSolicitud.eliminarMateria = function (fila) {
	var id = fila.id;
	var optValue = $('#' + id + '').attr('clave');
	var horasdocente = parseInt(__('hrsdocente' + id).innerHTML);
	var horasindependiente = parseInt(__('hrsindependiente' + id).innerHTML);
	var total = __('totalHorasDocentes');
	var total2 = __('totalHorasIndependientes');
	total.value = parseInt(total.value) - horasdocente;
	total2.value = parseInt(total2.value) - horasindependiente;
	var input = 'asignatura' + id;

	$('#seriacion')
		.find('[value="' + optValue + '"]')
		.remove();
	$('#asignaturaDocente')
		.find('[value="' + optValue + '"]')
		.remove();
	$('#asignaturaInfraestructura')
		.find('[value="' + optValue + '"]')
		.remove();

	if (__('seriacion').length == 0) {
		__('seriacion').disabled = true;
	}
	if (__('asignaturaDocente').length == 0) {
		__('asignaturaDocente').disabled = true;
	}
	$('#seriacion').selectpicker('refresh');
	$('#asignaturaDocente').selectpicker('refresh');
	$('#asignaturaInfraestructura').selectpicker('refresh');
	$('#row' + id + '').remove();
	var json = JSON.parse($('#' + input).val());
	$('#' + input).attr(
		'value',
		JSON.stringify({
			id: json.id,
			borrar: 1,
		})
	);
};

//Eliminar materias optativas
EditarSolicitud.eliminarOptativa = function (fila) {
	let id = fila.id;
	let optValue = $('#' + id + '').attr('clave');
	let hrsdocenteOptativa = parseInt(__('hrsdocenteOptativa' + id).innerHTML);
	let hrsindependienteOptativa = parseInt(
		__('hrsindependienteOptativa' + id).innerHTML
	);
	let total = __('totalHorasDocentesOptativa');
	let total2 = __('totalHorasIndependientesOptativa');
	total.value = parseInt(total.value) - hrsdocenteOptativa;
	total2.value = parseInt(total2.value) - hrsindependienteOptativa;
	let input = 'optativas' + id;

	$('#seriacionOptativa')
		.find('[value="' + optValue + '"]')
		.remove();
	$('#asignaturaDocente')
		.find('[value="' + optValue + '"]')
		.remove();
	$('#asignaturaInfraestructura')
		.find('[value="' + optValue + '"]')
		.remove();

	if (__('seriacionOptativa').length == 0) {
		__('seriacionOptativa').disabled = true;
	}
	if (__('asignaturaDocente').length == 0) {
		__('asignaturaDocente').disabled = true;
	}
	$('#seriacionOptativa').selectpicker('refresh');
	$('#asignaturaDocente').selectpicker('refresh');
	$('#asignaturaInfraestructura').selectpicker('refresh');
	$('#optativa' + id + '').remove();
	let json = JSON.parse($('#' + input).val());
	$('#' + input).attr(
		'value',
		JSON.stringify({
			id: json.id,
			borrar: 1,
		})
	);
};

//Función para visualizar los documentos cargados
EditarSolicitud.verImagen = function (enlace) {
	$('#modalArchivos').modal();
	$('#tamanoModalArchivo').attr('style', 'margin-top:20px;');
	$('#archivo-mostrar').attr('src', enlace);
};

//Iniciliza las funciones necesarias
$(document).ready(function ($) {
	setTimeout(() => {
		EditarSolicitud.getSolicitud();
		EditarSolicitud.getCumplimientos();

		document.getElementById('cargandoOtro').style.display = 'block';
		//EditarSolicitud.promesaDatosSolicitud.done();
		$.when(EditarSolicitud.promesaDatosSolicitud)
			.then(function () {
				TerminarSolicitud.getEstatusSolicitud();
			})
			.done(function () {
				var m = document.getElementById('municipio');
				var mun = m.options[m.selectedIndex].text;

				var r = document.getElementById('municipio_representante');
				var mun_r = r.options[r.selectedIndex].text;

				let nivelPrograma = $('#nivel_id').val();

				let modalidadPrograma = $('#modalidad_id').val();

				let turnoPrograma = $('#turno_programa').val();

				if (
					mun !== 'Seleccione municipio' &&
					mun_r !== 'Seleccione municipio' &&
					nivelPrograma > 0 &&
					modalidadPrograma > 0 &&
					turnoPrograma.length > 0
				) {
					(document.getElementById('cargandoOtro').style.display = 'none'),
						(document.getElementById('cargando').style.display = 'none');
				}
			})
			.fail(function () {
				console.log('Pero algo fallo');
			});
	}, 7000);
});
