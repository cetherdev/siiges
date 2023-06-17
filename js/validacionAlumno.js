var ValidacionAlumno = {};

ValidacionAlumno.normalize = function () {
  var from = "ÃÀÁÄÂÈÉËÊÌÍÏÎÒÓÖÔÙÚÜÛãàáäâèéëêìíïîòóöôùúüûÑñÇç",
    to = "AAAAAEEEEIIIIOOOOUUUUaaaaaeeeeiiiioooouuuunncc",
    mapping = {};

  for (var i = 0, j = from.length; i < j; i++)
    mapping[from.charAt(i)] = to.charAt(i);

  return function (str) {
    var ret = [];
    for (var i = 0, j = str.length; i < j; i++) {
      var c = str.charAt(i);
      if (mapping.hasOwnProperty(str.charAt(i))) ret.push(mapping[c]);
      else ret.push(c);
    }
    return ret.join('').toUpperCase();
  };
};

ValidacionAlumno.guardarCambios = async function (e) {
  if (e) {
    e.preventDefault();
  }

  var mensaje = $('#mensaje');
	var resultado = '';
	$('.revision').each(function () {
		if ($(this).val() == '') {
      if ($(this).attr('campo')) {
        resultado = resultado + $(this).attr('campo') + '<br>';
      }
		}
	});

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

/*     const formData = new FormData(document.getElementById('form1'));
    console.log(formData.get('url'));
    if (!formData.get('url')) {
      formData.append('url', `../views/ce-validacion.php?programa_id=${formData.get('programa_id')}&codigo=200`)
    }
    formData.append('webService', 'guardar')
    formData.append('estatus', '1')
    const ajaxPath = "../controllers/control-validacion.php";
  
    try {
      const response = await fetch(
        ajaxPath,
        {
          method: "post",
          body: formData,
          redirect: 'follow'
        });
      if (response.ok) {
        if (response.redirected) {
          window.location.href = response.url;
        }
        const data = await response.json();
      }
    } catch (err) {
      console.error(err instanceof SyntaxError);
      console.error(err.message);
      console.error(err.stack);
    } */
  }

}

ValidacionAlumno.habilitarCaptura = async function (e) {
  if (e) {
    e.preventDefault();
  }
  const formData = new FormData(document.getElementById('form1'));
  console.log(formData.get('url'));
  if (!formData.get('url')) {
    formData.append('url', `../views/ce-validacion.php?programa_id=${formData.get('programa_id')}&codigo=201`)
  }
  formData.append('webService', 'habilitarCaptura')
  formData.append('estatus', '0')
  const ajaxPath = "../controllers/control-validacion.php";

  try {
    const response = await fetch(
      ajaxPath,
      {
        method: "post",
        body: formData,
        redirect: 'follow'
      });
    if (response.ok) {
      if (response.redirected) {
        window.location.href = response.url;
      }
      const data = await response.json();
    }
  } catch (err) {
    console.error(err instanceof SyntaxError);
    console.error(err.message);
    console.error(err.stack);
  }
}


$gmx(document).ready(function () {

  $('[data-toggle="tooltip"]').tooltip();

  $("#fecha_expedicion").datepicker({
    firstDay: 1,
    monthNames: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
    dayNamesMin: ['Do', 'Lu', 'Ma', 'Mi', 'Ju', 'Vi', 'Sá'],
    dateFormat: 'yy-mm-dd'
  })
  $("#fecha_validacion").datepicker({
    firstDay: 1,
    monthNames: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
    dayNamesMin: ['Do', 'Lu', 'Ma', 'Mi', 'Ju', 'Vi', 'Sá'],
    dateFormat: 'yy-mm-dd'
  })
  $("#fecha_inicio_antecedente").datepicker({
    firstDay: 1,
    monthNames: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
    dayNamesMin: ['Do', 'Lu', 'Ma', 'Mi', 'Ju', 'Vi', 'Sá'],
    dateFormat: 'yy-mm-dd'
  })
  $("#fecha_fin_antecedente").datepicker({
    firstDay: 1,
    monthNames: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
    dayNamesMin: ['Do', 'Lu', 'Ma', 'Mi', 'Ju', 'Vi', 'Sá'],
    dateFormat: 'yy-mm-dd'
  })

  const images = [document.querySelector('#carta_validacion'), document.querySelector('#oficio_validacion'), document.querySelector('#cedula_profesional'), document.querySelector('#codigo_qr'), document.querySelector('#validacion_udg'), document.querySelector('#legalizacion')];
  if (images[0]) {
    images.forEach(image => {
      image.addEventListener('mousemove', function (e) {
        let width = image.offsetWidth;
        let height = image.offsetHeight;
        let mouseX = e.offsetX;
        let mouseY = e.offsetY;

        let bgPosX = (mouseX / width * 100);
        let bgPosY = (mouseY / height * 100);

        image.style.backgroundPosition = `${bgPosX}% ${bgPosY}%`;
      });

      image.addEventListener('mouseleave', function () {
        image.style.backgroundPosition = "center";
      });
    });
  }


  guardarCambiosButton = document.getElementById('guardarCambios')
  habilitarCapturaButton = document.getElementById('habilitarCaptura')

  guardarCambiosButton && guardarCambiosButton.addEventListener('click', ValidacionAlumno.guardarCambios)
  habilitarCapturaButton && habilitarCaptura.addEventListener('click', ValidacionAlumno.habilitarCaptura)


});
