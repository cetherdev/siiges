var nfila = 1;
var nfilaPersonal = 1;
var nfilaFormacion = 1;
var nfilaDictamen = 1;
var nfilaPrograma = 1;
var nfilaInf = 1;
var nfilaLicencia = 1;
var nfilaRespaldo = 1;
var nfilaEspejo = 1;
var nfilaM = 1;
var nfilaMO = 1;
var nfilaEx = 1;
var nfilaPu = 1;
var nfilaDo = 1;
function __(id){
  return document.getElementById(id);
}
function confirmarContrasena(){
  var x = __('contrasena');
  var y = __('verificar_contrasena');
  var txt = __('insturcciones_contrasena2');
  var inputTerminar = __('submit');
  txt.style.fontSize="14px";
  txt.style.fontWeight= "bold";
  if(x.value !== "" && y.value !== ""){
    if(x.value != y.value){
      y.style.backgroundColor = "#FFAEAE";
      x.style.backgroundColor = "#FFAEAE";
      x.focus();
      y.value="";
      txt.style.color = "#FFAEAE";
      txt.innerHTML= 'Las contraseñas no coninciden';
      inputTerminar.disabled = true;
    }else{
      y.style.backgroundColor = "#89C6A4";
     x.style.backgroundColor = "#89C6A4";
     txt.style.color = "#89C6A4";
     txt.innerHTML= 'Contraseñas correctas';
     inputTerminar.disabled = false;
    }
  }
}
function validarContrasena() {
  var x = __('contrasena');
  var txt = __('insturcciones_contrasena');
  var y = __('verificar_contrasena');
  var expreg= /(?=\w*\d)(?=\w*[A-Z])(?=\w*[a-z])\S{5,20}/;
  txt.style.fontSize="14px";
  txt.style.fontWeight= "bold";
  if(expreg.test(x.value)){
    x.style.backgroundColor = "#89C6A4";
    txt.innerHTML= 'Contraseña segura';
    txt.style.color = "#89C6A4";
  }else {
    x.style.backgroundColor = "#FFAEAE";
    txt.style.color = "#FFAEAE";
    txt.innerHTML= 'No cumple los criterios';
    //y.value="";
    inputTerminar.disabled = true;
  }
}

function agregarMateria(){
    var grado = __('gradoAsignatura').value;
    var nombre = __('nombreAsignatura').value;
    var clave = __('clave').value;
    var seriacion = $('#seriacion').val();
    seriacion = seriacion.join(', ');
    var docente = __('docente').value;
    var independiente = __('independiente').value;
    var credito = __('credito').value;
    var area = __('area').value;
    //var academia = __('academiaAsiganatura').value;
    var total = __('totalHorasDocentes');
    var total2 = __('totalHorasIndependientes');
    var mensaje = $('#mensajesAsignaturas');

    if(grado.length==0||nombre.length==0||clave.length==0||credito.length==0||area.length==0){
      mensaje.addClass("alert alert-danger").show();
      mensaje.html('Llene todos los campos obligatorios *');
    }else{
      mensaje.removeClass("alert alert-danger").hide();

      total.value = parseInt(total.value) + parseInt(docente);
      total2.value = parseInt(total2.value) + parseInt(independiente);

     //Constuir fila
      var fila = '<tr id="row' + nfilaM + '"><td>' + grado + '</td><td>' + nombre + '</td><td>'+clave+'</td><td>'+seriacion+'</td><td id="hrsdocente'+nfilaM+'">'+docente+'</td><td id="hrsindependiente'+nfilaM+'">'+independiente+'</td><td>'+credito+ '</td><td>'+area+'</td><td><button type="button" clave="'+clave+'" name="remove" id="' + nfilaM + '" class="btn btn-danger" onclick="eliminarMateria(this)">Quitar</button></td></tr>';

      //Almacenar valores en inputs
        var a = document.createElement("INPUT");
        a.setAttribute("type","hidden");
        a.setAttribute("id",'asignatura'+nfilaM);
        a.setAttribute("name","ASIGNATURA-asignaturas[]");
        a.setAttribute("value",JSON.stringify({"id":null,"grado":grado,"nombre":nombre,"clave":clave,"creditos":credito,"area":area,"seriacion":seriacion,"horas_docente":docente,"horas_independiente":independiente,"tipo":"1"}));
        __('inputsAsignaturas').appendChild(a);

      //Aumentar contador;
      nfilaM++;

      //Cargar en select
      $('#asignaturaDocente').attr("disabled",false);
      $('#asignaturaDocente').append('<option value="'+clave+'">'+clave+ " - " +nombre+'</option>').selectpicker('refresh');

      $('#seriacion').attr("disabled",false);
      $("#seriacion").append('<option value="'+clave+'">'+clave+'</option>').selectpicker('refresh');

    //  $("#asignaturaInfraestructura").attr("disabled",false);
      $("#asignaturaInfraestructura").append('<option value="'+clave+'">'+clave+ " - " +nombre+'</option>').selectpicker('refresh');


      $('#materias tr:last').after(fila);
      var filas = $('#materias tr').length;
      //Limpiar entradas
      __('gradoAsignatura').value="";__('nombreAsignatura').value="";__('clave').value="";$('#seriacion').val("").selectpicker("refresh");
      __('docente').value=0;__('independiente').value=0;__('credito').value="";__('area').value="";__('academiaAsiganatura').value="";
      console.log(inputsAsignaturas);
  }

}
function eliminarMateria(btn){
  var id = btn.id;
  var optValue = $('#'+id+'').attr("clave");
  var horasdocente = parseInt(__("hrsdocente"+id).innerHTML);
  var horasindependiente = parseInt(__("hrsindependiente"+id).innerHTML);
  var total = __('totalHorasDocentes');
  var total2 = __('totalHorasIndependientes');
  total.value = parseInt(total.value) - horasdocente;
  total2.value = parseInt(total2.value) - horasindependiente;
  var input = 'asignatura'+id;


 $("#seriacion").find('[value="'+optValue+'"]').remove();
 $("#asignaturaDocente").find('[value="'+optValue+'"]').remove();
 $("#asignaturaInfraestructura").find('[value="'+optValue+'"]').remove();

  if(__('seriacion').length == 0){
     __("seriacion").disabled = true;
  }
 if(__('asignaturaDocente').length == 0){
    __("asignaturaDocente").disabled=true;
  }
  $("#seriacion").selectpicker('refresh');
  $("#asignaturaDocente").selectpicker('refresh');
  $("#asignaturaInfraestructura").selectpicker('refresh');
  $('#row'+id+'').remove();
  __('inputsAsignaturas').removeChild(__(input));
  console.log(inputsAsignaturas);
}

function agregarOptativa(){
    var grado = __('gradoOptativa').value;
    var nombre = __('nombreOptativa').value;
    var clave = __('claveOptativa').value;
    var seriacion = $('#seriacionOptativa').val();
    seriacion = seriacion.join(', ');
    var docente = __('docenteOptativa').value;
    var independiente = __('independienteOptativa').value;
    var credito = __('creditoOptativa').value;
    var area = __('areaOptativa').value;
    //var academia = __('academiaOptativa').value;
    var total = __('totalHorasDocentesOptativa');
    var total2 = __('totalHorasIndependientesOptativa');
    var mensaje = $('#mensajesOptativas');

    if(grado.length==0||nombre.length==0||clave.length==0||credito.length==0||area.length==0){
      mensaje.addClass("alert alert-danger").show();
      mensaje.html('Llene todos los campos obligatorios *');
    }else{
      mensaje.removeClass("alert alert-danger").hide();
      total.value = parseInt(total.value) + parseInt(docente);
      total2.value = parseInt(total2.value) + parseInt(independiente);
     //Constuir fila
      var fila = '<tr id="optativa' + nfilaMO + '"><td>' + grado + '</td><td>' + nombre + '</td><td>'+clave+'</td><td>'+seriacion+'</td><td id="hrsdocenteOptativa'+nfilaMO+'">'+docente+'</td><td id="hrsindependienteOptativa'+nfilaMO+'">'+independiente+'</td><td>'+credito+ '</td><td>'+area+'</td><td><button type="button" clave="'+clave+'" name="remove" id="' + nfilaMO + '" class="btn btn-danger" onclick="eliminarOptativa(this)">Quitar</button></td></tr>';

      //Almacenar valores en inputs
        var a = document.createElement("INPUT");
        a.setAttribute("type","hidden");
        a.setAttribute("id",'optativas'+nfilaMO);
        a.setAttribute("name","ASIGNATURA-asignaturas[]");
        a.setAttribute("value",JSON.stringify({"id":null,"grado":grado,"nombre":nombre,"clave":clave,"creditos":credito,"area":area,"seriacion":seriacion,"horas_docente":docente,"horas_independiente":independiente,"tipo":"2"}));
        __('inputsOptativas').appendChild(a);


      //Aumentar contador;
      nfilaMO++;


      $('#materiasOptativas tr:last').after(fila);
      var filas = $('#materiasOptativas tr').length;

      //Cargar en select
      $('#asignaturaDocente').attr("disabled",false);
      $('#asignaturaDocente').append('<option value="'+clave+'">'+clave+ " - " +nombre+'</option>').selectpicker('refresh');

      $('#seriacionOptativa').attr("disabled",false);
      $("#seriacionOptativa").append('<option value="'+clave+'">'+clave+'</option>').selectpicker('refresh');

      $("#asignaturaInfraestructura").attr("disabled",false);
      $("#asignaturaInfraestructura").append('<option value="'+clave+'">'+clave+ " - " +nombre+'</option>').selectpicker('refresh');
      //Limpiar entradas
      __('nombreOptativa').value="";__('claveOptativa').value="";$('#seriacionOptativa').val("").selectpicker("refresh");__('docenteOptativa').value=0;
      __('independienteOptativa').value=0;__('creditoOptativa').value="";__('areaOptativa').value="";
      console.log(__('inputsOptativas'));
    }
}
function eliminarOptativa(btn){
  var id = btn.id;
  var horasdocente = parseInt(__("hrsdocenteOptativa"+id).innerHTML);
  var horasindependiente = parseInt(__("hrsindependienteOptativa"+id).innerHTML);
  var total = __('totalHorasDocentesOptativa');
  var total2 = __('totalHorasIndependientesOptativa');
  total.value = parseInt(total.value) - horasdocente;
  total2.value = parseInt(total2.value) - horasindependiente;
  var input = 'optativas'+id;
  var optValue = $('#'+id+'').attr("clave");


   $("#seriacionOptativa").find('[value="'+optValue+'"]').remove();
   $("#asignaturaDocente").find('[value="'+optValue+'"]').remove();
   $("#asignaturaInfraestructura").find('[value="'+optValue+'"]').remove();

    if(__('seriacionOptativa').length == 0){
       __("seriacionOptativa").disabled = true;
    }
   if(__('asignaturaDocente').length == 0){
      __("asignaturaDocente").disabled=true;
    }
    $("#seriacionOptativa").selectpicker('refresh');
    $("#asignaturaDocente").selectpicker('refresh');
    $("#asignaturaInfraestructura").selectpicker('refresh');

    __('inputsOptativas').removeChild(__(input));
    $('#optativa'+id+'').remove();
    console.log(__('inputsOptativas'));
}

function agregarPersonal(){
    var nombre = __('nombrep').value;
    var apellidop = __('apellidop').value;
    var apellidom = __('apellidom').value;
    var cargo = __('cargo').value;
    var tel = __('tel').value;
    var cel = __('cel').value;
    var correo = __('email').value;
    var horario = __('horario').value;
    var mensaje = $("#mensajesSeguimiento");
    if(nombre.length==0||apellidop.length==0||cel.length==0||tel.length==0||correo.length==0||horario.length==0){
      mensaje.addClass("alert alert-danger").show();
      mensaje.html('Llene todos los campos obligatorios *');
    }else{
      mensaje.removeClass("alert alert-danger").hide();
        //Almacenar valores en inputs
        var a = document.createElement("INPUT");
        a.setAttribute("type","hidden");
        a.setAttribute("id",'personaDiligencia'+nfilaPersonal);
        a.setAttribute("name","DILIGENCIAS-personasDiligencias[]");
        a.setAttribute("value",JSON.stringify({"id":null,"nombre":nombre,
                                              "apellido_paterno":apellidop,
                                              "apellido_materno":apellidom,
                                              "titulo_cargo":cargo,
                                              "telefono":tel,
                                              "celular":cel,
                                              "correo":correo,
                                              "horario": horario
                                              }));
        __('inputsSeguimiento').appendChild(a);
        //Constuir fila
         var fila = '<tr id="personal' + nfilaPersonal + '"><td>' + nombre + " "+ apellidop+" "+ apellidom +'</td><td>' + cargo +'</td><td>' + tel + '</td><td>'+cel+'</td><td>'+correo+'</td><td>'+horario+ '</td><td><button type="button"  id="' + nfilaPersonal + '" class="btn btn-danger" onclick="eliminarPersonal(this)">Quitar</button></td></tr>';
         //Aumentar contador;
         nfilaPersonal++;
         $('#encomiendas tr:last').after(fila);
         var filas = $('#encomiendas tr').length;
         //Limpiar entradas
         __('nombrep').value="";__('apellidop').value="";__('apellidom').value="";__('tel').value="";__('cel').value="";__('horario').value="";__('email').value="";__('cargo').value="";
         console.log(__('inputsSeguimiento'));
    }
}
function eliminarPersonal(fila){
  var id = fila.id;
  var input = 'personaDiligencia'+id;
  $('#personal'+id+'').remove();
  __('inputsSeguimiento').removeChild(__(input));
   console.log(__('inputsSeguimiento'));
}

function agregarFormacionRector() {
  var nivel = __('nivel_educativo_rector').value;
  var carrera = __('estudios_rector').value;
  var institucion = __('institucion_estudios_rector').value;
  var documento = __('documento_acredita_rector').value;
  var mensaje = $("#mensajesFromacionRector");

  if(nivel.length==0||carrera.length==0||institucion.length==0||documento.length==0){
    mensaje.addClass("alert alert-danger").show();
    mensaje.html('Llene todos los campos obligatorios *');
  }else{
     mensaje.removeClass("alert alert-danger").hide();
     //Almacenar valores en inputs
      var a = document.createElement("INPUT");
      a.setAttribute("type","hidden");
      a.setAttribute("id",'fromacionesRector'+nfilaFormacion);
      a.setAttribute("name","RECTOR-formaciones[]");
      a.setAttribute("value",JSON.stringify({ "id":null, "nivel":nivel,"nombre":carrera,"descripcion":documento,"institucion":institucion }));
      __('inputsFormacionRector').appendChild(a);
      var niveltxt = $('#nivel_educativo_rector option:selected').text();
      //Constuir fila
      var fila = '<tr id="formacion' + nfilaFormacion + '"><td>' + niveltxt + '</td><td>' + carrera + '</td><td>'+ institucion +'</td><td>'+ documento +'</td><td><button type="button" name="removeFormacion" id="' + nfilaFormacion + '" class="btn btn-danger" onclick="eliminarFormacionRector(this)">Quitar</button></td></tr>';
      //Aumentar contador;
      nfilaFormacion++;
      $('#formacion_rector tr:last').after(fila);
      //Limpiar entradas
      __('nivel_educativo_rector').value="";__('estudios_rector').value="";
      __('institucion_estudios_rector').value="";__('documento_acredita_rector').value="";
      console.log(__('inputsFormacionRector'));
  }
}

function agregarFormacionDirector() {
  var nivel = __('nivel_educativo_director').value;
  var carrera = __('estudios_director').value;
  var institucion = __('institucion_estudios_director').value;
  var documento = __('documento_acredita_director').value;
  var mensaje = $("#mensajesFromacionDirector");

  if(nivel.length==0||carrera.length==0||institucion.length==0||documento.length==0){
    mensaje.addClass("alert alert-danger").show();
    mensaje.html('Llene todos los campos obligatorios *');
  }else{
     mensaje.removeClass("alert alert-danger").hide();
     //Almacenar valores en inputs
      var a = document.createElement("INPUT");
      a.setAttribute("type","hidden");
      a.setAttribute("id",'fromacionesDirector'+nfilaFormacion);
      a.setAttribute("name","DIRECTOR-formaciones[]");
      a.setAttribute("value",JSON.stringify({ "id":null, "nivel":nivel,"nombre":carrera,"descripcion":documento,"institucion":institucion }));
      __('inputsFormacionDirector').appendChild(a);
      var niveltxt = $('#nivel_educativo_director option:selected').text();
      //Constuir fila
      var fila = '<tr id="formacion' + nfilaFormacion + '"><td>' + niveltxt + '</td><td>' + carrera + '</td><td>'+ institucion +'</td><td>'+ documento +'</td><td><button type="button" name="removeFormacion" id="' + nfilaFormacion + '" class="btn btn-danger" onclick="eliminarFormacionDirector(this)">Quitar</button></td></tr>';
      //Aumentar contador;
      nfilaFormacion++;
      $('#formacion_director tr:last').after(fila);
      //Limpiar entradas
      __('nivel_educativo_director').value="";__('estudios_director').value="";
      __('institucion_estudios_director').value="";__('documento_acredita_director').value="";
      console.log(__('inputsFormacionDirector'));
  }
}

function eliminarFormacionRector(fila) {
  var id = fila.id;
  var input = 'fromacionesRector'+id;
    $('#formacion'+id+'').remove();
  __('inputsFormacionRector').removeChild(__(input));
  console.log(__('inputsFormacionRector'));
}

function eliminarFormacionDirector(fila) {
  var id = fila.id;
  var input = 'fromacionesDirector'+id;
    $('#formacion'+id+'').remove();
  __('inputsFormacionDirector').removeChild(__(input));
  console.log(__('inputsFormacionDirector'));
}

function agregarExperiencia() {
  var tipo = __('tipo_experiencia_director').value;
  var nombre = __('nombre_experiencia_director').value;
  var funcion = __('funcion_experiencia_director').value;
  var institucion = __('institucion_experiencia_director').value;
  var inicio = __('fecha_inicio_experiencia_director').value;
  var fin = __('fecha_fin_experiencia_director').value;
  var mensaje = $("#mensajesExperienciaDirector");
  if(tipo.length==0||nombre.length==0||funcion.length==0||institucion.length==0||inicio.length==0||fin.length==0){
    mensaje.addClass("alert alert-danger").show();
    mensaje.html('Llene todos los campos obligatorios *');
  }else{
    mensaje.removeClass("alert alert-danger").hide();
    //Almacenar valores en inputs
    var a = document.createElement("INPUT");
    a.setAttribute("type","hidden");
    a.setAttribute("id",'experienciaDirector'+nfilaEx);
    a.setAttribute("name","DIRECTOR-experiencias[]");
    a.setAttribute("value",JSON.stringify({"id":null,"nombre":nombre,"tipo":tipo,"funcion":funcion,"institucion":institucion,"periodo":inicio+","+fin }));
    __('inputsExperienciaDirector').appendChild(a);
    var niveltxt = $('#tipo_experiencia_director option:selected').text();
    //Consttuir fila
    var fila = '<tr id="experiencia' + nfilaEx + '"><td>' + niveltxt + '</td><td>' + nombre + '</td><td>'+ funcion +'</td><td>'+institucion+'</td><td>'+ inicio+ " - " + fin +'</td><td><button type="button" name="removeFormacion" id="' + nfilaEx + '" class="btn btn-danger" onclick="eliminarExperiencia(this)">Quitar</button></td></tr>';
    nfilaEx++;
    $('#experiencia_director tr:last').after(fila);
    __('tipo_experiencia_director').value="";
    __('nombre_experiencia_director').value="";
    __('funcion_experiencia_director').value="";
    __('institucion_experiencia_director').value="";
    __('fecha_inicio_experiencia_director').value="";
    __('fecha_fin_experiencia_director').value="";
    console.log(__('inputsExperienciaDirector'));
  }
}
function eliminarExperiencia(fila){
  var id = fila.id;
  var input = 'experienciaDirector'+id;
  $('#experiencia'+id+'').remove();
  __('inputsExperienciaDirector').removeChild(__(input));
  console.log(__('inputsExperienciaDirector'));
}

function agregarPublicacion(){
  var titulo = __('titulo_publicacion').value;
  var volumen = __('volumen_publicacion').value;
  var editorial = __('editorial_publicacion').value;
  var anio = __('ano_publicacion').value;
  var otro = __('otro_publicacion').value;
  var pais = __('pais_publicacion').value;
  var mensaje = $('#mensajesPublicacionesDirector');
  if(titulo.length==0||volumen.length==0||editorial.length==0||anio.length==0||pais.length==0){
    mensaje.addClass("alert alert-danger").show();
    mensaje.html('Llene todos los campos obligatorios *');
  }else{
    mensaje.removeClass("alert alert-danger").hide();
    //Almacenar valores en inputs
    var a = document.createElement("INPUT");
    a.setAttribute("type","hidden");
    a.setAttribute("id",'publicacionesDirector'+nfila);
    a.setAttribute("name","DIRECTOR-publicaciones[]");
    a.setAttribute("value",JSON.stringify({"id":null, "anio":anio,"volumen":volumen,"pais":pais,"titulo":titulo,"editorial":editorial,"otros":otro }));
    __('inputsPublicacionesDirector').appendChild(a);
    //Consttuir fila
    var fila = '<tr id="publicacion' + nfilaPu + '"><td>' + titulo + '</td><td>' + volumen + '</td><td>'+ editorial +'</td><td>'+anio+'</td><td>'+ pais+'</td><td>'+otro+'</td><td><button type="button" name="removePublicacion" id="' + nfilaPu + '" class="btn btn-danger" onclick="eliminarPublicacion(this)">Quitar</button></td></tr>';
    nfilaPu++;
    $('#publicaciones_director tr:last').after(fila);
    __('titulo_publicacion').value="";
    __('volumen_publicacion').value="";
    __('editorial_publicacion').value="";
    __('ano_publicacion').value="";
    __('otro_publicacion').value="";
    __('pais_publicacion').value="";
    console.log(__('inputsPublicacionesDirector'));
  }
}
function eliminarPublicacion(fila) {
  var id = fila.id;
  var input= 'publicacionesDirector'+id;
  __('inputsPublicacionesDirector').removeChild(__(input));
  $('#publicacion'+id+'').remove();
  console.log(__('inputsPublicacionesDirector'));
}

function agregarDocente() {
  //Sugerir quitar experiencias de arreglo y meter como un campo de texto
  var tipo = __('tipoDocente').value;
  var nombre = __('nombreDocente').value;
  var paterno = __('apellidoPaternoDocente').value;
  var materno = __('apellidoMaternoDocente').value;
  var nivelUltimo = __('nivelUltimoGradoDocente').value;
  var nombreUltimo = __('nombreUltimoGradoDocente').value;
  var docUltimo = __('documentacionUltimoGradoDocente').value;
  var nivelPenultimo = __('nivelPenultimoGradoDocente').value;
  var nombrePenultimo = __('nombrePenultimoGradoDocente').value;
  var docPenultimo = __('documentacionPenultimoGradoDocente').value;
  var asignaturas = $('#asignaturaDocente').val();
  var experiencia = __('experienciaDocente').value;
  var tipoContratacion = __('tipoContratacionDocente').value;
  var antiguedad = __('antiguedadDocente').value;
  var respuesta;

  var select = __('tipoContratacionDocente');
  var contratacion  = select.options[select.selectedIndex].innerText;

  var mensaje = $("#mesajesDocentes");

  if( tipo.length==0 ||nombre.length == 0 || paterno.length == 0 || nivelUltimo.length == 0 || nombreUltimo.length == 0 ||docUltimo.length == 0 || asignaturas.length == 0 || tipoContratacion.length == 0 ){
      mensaje.addClass("alert alert-danger").show();
      mensaje.html('Llene todos los campos obligatorios *');
  }else{
     mensaje.removeClass("alert alert-danger").hide();
     //Almacenar valores en inputs
     var formaciones;
     if(nivelPenultimo.length>0){
       formaciones = [{"nivel":nivelUltimo,"nombre":nombreUltimo,"descripcion":docUltimo},{"nivel":nivelPenultimo,"nombre":nombrePenultimo,"descripcion":docPenultimo}];
     }else{
       formaciones = [{"nivel":nivelUltimo,"nombre":nombreUltimo,"descripcion":docUltimo}];
     }
     var a = document.createElement("INPUT");
     a.setAttribute("type","hidden");
     a.setAttribute("id",'inputDocente'+nfilaDo);
     a.setAttribute("name","DOCENTE-docentes[]");
     a.setAttribute("value",JSON.stringify({"id":null,
                                           "nombre":nombre,
                                           "apellido_paterno":paterno,
                                           "apellido_materno":materno,
                                           "tipo_docente":tipo,
                                           "tipo_contratacion":tipoContratacion,
                                           "antiguedad": antiguedad,
                                           "formaciones": formaciones,
                                           "experiencias":experiencia,
                                           "asignaturas":asignaturas
                                           }));
     __('inputsDocentes').appendChild(a);
     if( tipo == 1 ){
         tipo = "Asignatura";
     }else if(tipo == 2){
       tipo = "Tiempo completo";
     }
     if( antiguedad == "" ){
       antiguedad = "Ninguna";
     }
    var fila = '<tr id="docente' + nfilaDo + '"><td class="small">' + nombre + " "+ paterno+ " " + materno + '</td><td class="small">'+ tipo  +'</td><td class="small">'+  nombreUltimo + ": "+ docUltimo+ "<br></br>" +nombrePenultimo+": "+ docPenultimo+'</td><td class="small">'+asignaturas+'</td><td class="small">'+experiencia+'</td><td class="small">'+contratacion+" - "+antiguedad+'</td><td class="small"><button type="button" name="removePublicacion" id="' + nfilaDo + '" class="btn btn-danger" onclick="eliminarDocente(this)">Quitar</button></td></tr>';
    nfilaDo++;
    $('#docentes tr:last').after(fila);
    __('tipoDocente').value="";
    __('nombreDocente').value="";
    __('apellidoPaternoDocente').value="";
    __('apellidoMaternoDocente').value="";
    __('nivelUltimoGradoDocente').value="";
    __('nombreUltimoGradoDocente').value="";
    __('documentacionUltimoGradoDocente').value="";
    __('nivelPenultimoGradoDocente').value="";
    __('nombrePenultimoGradoDocente').value="";
    __('documentacionPenultimoGradoDocente').value="";
    $('#asignaturaDocente').val("").selectpicker("refresh");
    __('experienciaDocente').value="";
    __('tipoContratacionDocente').value="";
    __('antiguedadDocente').value="";
    console.log(__('inputsDocentes'));
  }


}
function eliminarDocente(fila) {
  var id = fila.id;
  var input = 'inputDocente'+id;

  __('inputsDocentes').removeChild(__(input));
  $('#docente'+id+'').remove();

}

function agregarDictamen() {
  var nombre = __('nombreDictamen').value;
  var autoridad = __('emisorDictamen').value;
  var fecha = __('fechaDictamen').value;
  var mensaje = $('#mensajesDictamenes');
  if(nombre.length==0||autoridad.length==0||fecha.length==0){
    mensaje.addClass("alert alert-danger").show();
    mensaje.html('Llene todos los campos obligatorios *');
  }else{
     mensaje.removeClass("alert alert-danger").hide();
     //Almacenar valores en inputs
     var a = document.createElement("INPUT");
     a.setAttribute("type","hidden");
     a.setAttribute("id",'dictamen'+nfilaDictamen);
     a.setAttribute("name","DICTAMEN-dictamenes[]");
     a.setAttribute("value",JSON.stringify({"id":null,"nombre":nombre,"autoridad":autoridad,"fecha_emision":fecha}));
     __('inputsDictamenes').appendChild(a);
     var fila = '<tr id="dictamen' + nfilaDictamen + '"><td class="small">' + nombre + '</td><td class="small">'+ autoridad  +'</td><td class="small">'+ fecha +'</td><td class="small"><button type="button" name="removeDictamen" id="' + nfilaDictamen + '" class="btn btn-danger" onclick="eliminarDictamen(this)">Quitar</button></td></tr>';
     nfilaDictamen++;
     $('#dictamenes tr:last').after(fila);
     __('nombreDictamen').value="";
     __('emisorDictamen').value="";
     __('fechaDictamen').value="";
     console.log(__('inputsDictamenes'));
  }
}
function eliminarDictamen(btn){
  let id = btn.id;
  let fila = $('#dictamen'+id);
  let input = $('#inputDictamen'+id);
  fila.remove();
  let json = JSON.parse(input.val());
  input.attr("value",JSON.stringify({"id":json.id, "borrar": 1 }));
}

function agregarOtrosProgramas() {
  var nivel = __('nivelOtrosProgramas').value;
  var nombre = __('nombreOtrosProgramas').value;
  var acuerdo = __('acuerdoOtrosProgramas').value;
  var alumnos = __('alumnoOtrosProgramas').value;
  var turno = $('#turnoOtrosProgramas').val();
  var mensaje = $('#mensajesOtrosProgramas');
  if(nivel.length==0||nombre.length==0||acuerdo.length==0||alumnos.length==0||turno.length==0){
    mensaje.addClass("alert alert-danger").show();
    mensaje.html('Llene todos los campos obligatorios *');
  }else{
    mensaje.removeClass("alert alert-danger").hide();
    //Almacenar valores en inputs
    var a = document.createElement("INPUT");
    a.setAttribute("type","hidden");
    a.setAttribute("id",'otroPrograma'+nfilaPrograma);
    a.setAttribute("name","PROGRAMA-otrosRVOE[]");
    a.setAttribute("value",JSON.stringify({"nivel":nivel,"nombre":nombre,"acuerdo":acuerdo,"numero_alumnos":alumnos,"turno":turno}));
    __('inputsOtrosProgramas').appendChild(a);
    __('totalAlumnosOtrosProgramas').value = parseInt(__('totalAlumnosOtrosProgramas').value) + parseInt(alumnos);
    var niveltxt = $('#nivelOtrosProgramas option:selected').text();
    var turnotxt = $('#turnoOtrosProgramas option:selected').text();
    var fila = '<tr id="otroPrograma' + nfilaPrograma + '"><td>' + niveltxt + '</td><td>'+ nombre  +'</td><td>'+ acuerdo +'</td><td id="numeroAlumnos'+nfilaPrograma+'">'+ alumnos + '</td><td>'+ turno +'</td><td><button type="button"  id="' + nfilaPrograma + '" class="btn btn-danger" onclick="eliminarOtrosProgramas(this)">Quitar</button></td></tr>';
    nfilaPrograma++;
    $('#otrosProgramas tr:last').after(fila);
    __('nivelOtrosProgramas').value = "";
    __('nombreOtrosProgramas').value = "";
    __('acuerdoOtrosProgramas').value = "";
    __('alumnoOtrosProgramas').value = "";
    $('#turnoOtrosProgramas').val("").selectpicker("refresh");
    console.log(__('inputsOtrosProgramas'));
  }


}
function eliminarOtrosProgramas(fila) {
    var id = fila.id;
    var input = 'otroPrograma'+id;
    __('totalAlumnosOtrosProgramas').value = parseInt(__('totalAlumnosOtrosProgramas').value) - parseInt(__("numeroAlumnos"+id).innerHTML);
    __('inputsOtrosProgramas').removeChild(__(input));
    $('#otroPrograma'+id).remove();
    console.log(__('inputsOtrosProgramas'));
}

function agregarInstitucionSalud(){
  var nombre = __('nombreSalud').value;
  var tiempo = __('tiempoSalud').value;
  var mensaje = $('#mensajesSaludInstituciones');
  if(nombre.length==0||tiempo.length==0){
    mensaje.addClass("alert alert-danger").show();
    mensaje.html('Llene todos los campos obligatorios *');
  }else{
    mensaje.removeClass("alert alert-danger").hide();
    //Convertir tiempo de minutos a horas
    let hour = Math.floor(tiempo / 60);
    hour = (hour < 10)? '0' + hour : hour;
    let minute = Math.floor(tiempo % 60);
    minute = (minute < 10)? '0' + minute : minute;
    tiempo = `${hour}:${minute}:00`;
    //Almacenar valores en inputs
    var a = document.createElement("INPUT");
    a.setAttribute("type","hidden");
    a.setAttribute("id",'inputInstitucionSalud'+nfilaPrograma);
    a.setAttribute("name",'SALUD-nombresInstitucionSalud[]');
    a.setAttribute("value",JSON.stringify({"id":null,"nombre":nombre, "tiempo":tiempo}));
    __('inputsSaludInstituciones').appendChild(a);
    var fila = '<tr id="institucionSalud' + nfilaPrograma + '"><td>' + nombre + '</td><td>'+ tiempo  +'</td><td><button type="button"  id="' + nfilaPrograma + '" class="btn btn-danger" onclick="eliminarInstitucionSalud(this)">Quitar</button></td></tr>';
    nfilaPrograma++;
    $('#institucionesSalud tr:last').after(fila);
    __('nombreSalud').value = "";
    __('tiempoSalud').value ="";
    console.log(__('inputsSaludInstituciones'));
  }
}
function eliminarInstitucionSalud(btn){
  let id = btn.id;
  let fila = $('#institucionSalud'+id);
  let input = $('#inputInstitucionSalud'+id);
  fila.remove();
  let json = JSON.parse(input.val());
  input.attr("value",JSON.stringify({"id":json.id, "borrar": 1 }));
}

function agregarInfraestructura() {
  var tipo = __('tipoInfraestructura').value;
  var nombre = __('nombreInfraestructura').value;
  var capacidad = __('capacidadInfraestructura').value;
  var metros = __('metrosInfraestructura').value;
  var ubicacion = __('ubicacionInfraestructura').value;
  var recursos = __('recursosInfraestructura').value;
  var asignatura = $('#asignaturaInfraestructura').val();
  var mensaje = $('#mensajesInfraestructuras');

  if(tipo.length==0||capacidad.length==0||metros.lenght==0||asignatura.length==0||recursos.length==0){
    mensaje.addClass("alert alert-danger").show();
    mensaje.html('Llene todos los campos obligatorios *');
  }else{
    mensaje.removeClass("alert alert-danger").hide();
    var niveltxt = $('#tipoInfraestructura option:selected').text();
    var fila = '<tr id="infraestructura' + nfilaInf + '"><td>' +  niveltxt + " " + nombre+ '</td><td>'+ capacidad  +'</td><td>'+ metros +'</td><td>'+ recursos + '</td><td>'+ ubicacion + '</td><td>'+ asignatura +'</td><td><button type="button"  id="' + nfilaInf + '" class="btn btn-danger" onclick="eliminarInfraestructura(this)">Quitar</button></td></tr>';


    if(nombre.length==0){
      nombre = "";
    }
    //Almacenar valores en inputs
    var a = document.createElement("INPUT");
    a.setAttribute("type","hidden");
    a.setAttribute("id",'inputInfraestructura'+nfilaInf);
    a.setAttribute("name","INFRAESTRUCTURA-infraestructuras[]");
    a.setAttribute("value",JSON.stringify({"id":null,
                                          "tipo_instalacion_id":tipo,
                                          "nombre":nombre,
                                          "ubicacion":ubicacion,
                                          "capacidad":capacidad,
                                          "metros":metros,
                                          "recursos":recursos,
                                          "asignaturas":asignatura
                                          }));
    __('inputsInfraestructuras').appendChild(a);

    $('#infraestructuras tr:last').after(fila);
        nfilaInf++;
    __('tipoInfraestructura').value="";
    __('nombreInfraestructura').value="";
    __('capacidadInfraestructura').value="";
    __('metrosInfraestructura').value="";
    __('recursosInfraestructura').value="";
    __('ubicacionInfraestructura').value="";
    $('#asignaturaInfraestructura').val("").selectpicker("refresh");
    console.log(__('inputsInfraestructuras'));

  }


}
function eliminarInfraestructura(fila) {
  var id = fila.id;
  var input = 'infraestructura'+id;
  __('inputsInfraestructuras').removeChild(__(input));
  $('#infraestructura'+id).remove();
  console.log(__('inputsInfraestructuras'));
}

function agregarLicencia() {
  var nombre = __('nombreLicencia').value;
  var contrato = __('contratoLicencia').value;
  var tipo = __('tipoLicencia').value;
  var termino = __('terminosLicencia').value;
  var enlace = __('enlaceLicencia').value;
  var usuarios = __('usuariosLicencia').value;
  var mensaje = $("#mensajesLicencias");

  if(nombre.length==0||contrato.length==0||termino.length==0){
    mensaje.addClass("alert alert-danger").show();
    mensaje.html('Llene todos los campos obligatorios *');
  }else{
    mensaje.removeClass("alert alert-danger").hide();
    var a = document.createElement("INPUT");
    a.setAttribute("type","hidden");
    a.setAttribute("id",'licencia'+nfilaLicencia);
    a.setAttribute("name","MIXTA-licencias[]");
    a.setAttribute("value",JSON.stringify({"id":null,
                                          'nombre':nombre,
                                          'contrato':contrato,
                                          'tipo':tipo,
                                          'terminos':termino,
                                          'usuarios':usuarios,
                                          'enlace':enlace
                                          }));
    __('inputsLicencias').appendChild(a);

    var fila = '<tr id="licencia' + nfilaLicencia + '"><td>' + nombre + '</td><td>' + contrato + '</td><td>'+ usuarios+ '</td><td>'+tipo +'</td><td>'+ termino + '</td><td>' + enlace +'</td><td><button type="button" name="removeLicencia" id="' + nfilaLicencia + '" class="btn btn-danger" onclick="eliminarLicencia(this)">Quitar</button></td></tr>';
    nfilaLicencia++;
    $('#licencias tr:last').after(fila);

    __('nombreLicencia').value="";
    __('contratoLicencia').value="";
    __('tipoLicencia').value="";
    __('terminosLicencia').value="";
    __('enlaceLicencia').value="";
    __('usuariosLicencia').value=0;
    console.log(__('inputsLicencias'));
  }
}

function eliminarLicencia(fila) {
    var id = fila.id;
    var input = 'licencia'+id;
    console.log(input);
    console.log(__('inputsLicencias'));
    __('inputsLicencias').removeChild(__(input));
    $('#licencia'+id+'').remove();
    console.log(__('inputsLicencias'));

    /* var id = fila.id;
    var input = 'otroPrograma'+id;
    __('totalAlumnosOtrosProgramas').value = parseInt(__('totalAlumnosOtrosProgramas').value) - parseInt(__("numeroAlumnos"+id).innerHTML);
    __('inputsOtrosProgramas').removeChild(__(input));
    $('#otroPrograma'+id).remove();
    console.log(__('inputsOtrosProgramas')); */
}

function agregarRespaldo(){
  var servicio = __('servicioRespaldo').value;
  var periodicidad = __('periodicidadRespaldo').value;
  var medios = __('mediosRespaldo').value;
  var proceso = __('procesoRespaldo').value;
  var mensaje = $("#mensajeRespaldos");
  if(servicio.length==0||periodicidad.length==0||medios.length==0||proceso.length==0){
    mensaje.addClass("alert alert-danger").show();
    mensaje.html('Llene todos los campos obligatorios *');
  }else{
    mensaje.removeClass("alert alert-danger").hide();
    var a = document.createElement("INPUT");
    a.setAttribute("type","hidden");
    a.setAttribute("id",'inputRespaldo'+nfilaRespaldo);
    a.setAttribute("name","RESPALDO-respaldos[]");
    a.setAttribute("value",JSON.stringify({"id":null,
                                          "proceso":proceso,
                                          "periodicidad":periodicidad,
                                          "medios_almacenamiento":medios,
                                          "descripcion":servicio
                                          }));
    __('inputsRespaldos').appendChild(a);
    var fila = '<tr id="respaldo' + nfilaRespaldo + '"><td>' + servicio + '</td><td>' + periodicidad + '</td><td>'+ medios+ '</td><td>'+proceso+'</td><td><button type="button" name="removeRespaldo" id="' + nfilaRespaldo + '" class="btn btn-danger" onclick="eliminarRespaldo(this)">Quitar</button></td></tr>';
    nfilaRespaldo++;
    $('#respaldos tr:last').after(fila);
    __('servicioRespaldo').value="";
    __('periodicidadRespaldo').value="";
    __('mediosRespaldo').value="";
    __('procesoRespaldo').value="";
    console.log(__('inputsRespaldos'));
  }
}
function eliminarRespaldo(fila) {
  var id = fila.id;
  var input = 'inputRespaldo'+id;
  __('inputsRespaldos').removeChild(__(input));
    $('#respaldo'+id+'').remove();
  console.log(__('inputsRespaldos'));
}

function agregarEspejo(){
  var proveedor = __('proveedorEspejo').value;
  var periodicidad = __('periodicidadEspejo').value;
  var ancho = __('anchoEspejo').value;
  var ubicacion = __('ubicacionEspejo').value;
  var url = __('urlEspejo').value;
  var mensaje = $("#mensajeEspejos");
  if(proveedor.length==0||periodicidad.length==0||ancho.length==0||ubicacion.length==0){
    mensaje.addClass("alert alert-danger").show();
    mensaje.html('Llene todos los campos obligatorios *');
  }else{
    mensaje.removeClass("alert alert-danger").hide();
    var a = document.createElement("INPUT");
    a.setAttribute("type","hidden");
    a.setAttribute("id",'inputEspejo'+nfilaEspejo);
    a.setAttribute("name","ESPEJO-espejos[]");
    a.setAttribute("value",JSON.stringify({"id":null,
                                          "proveedor":proveedor,
                                          "ubicacion":ubicacion,
                                          "ancho_banda":ancho,
                                          "url_espejo":url,
                                          "periodicidad":periodicidad
                                          }));
    __('inputsEspejos').appendChild(a);

    var fila = '<tr id="espejo' + nfilaEspejo + '"><td>' + proveedor + '</td><td>' + ancho + '</td><td>'+ ubicacion + '</td><td>'+ url + '</td><td>'+ periodicidad+'</td><td><button type="button" name="removeEspejo" id="' + nfilaEspejo + '" class="btn btn-danger" onclick="eliminarEspejo(this)">Quitar</button></td></tr>';
    nfilaEspejo++;
    $('#espejos tr:last').after(fila);
    __('proveedorEspejo').value="";
    __('periodicidadEspejo').value="";
    __('anchoEspejo').value="";
    __('ubicacionEspejo').value="";
    __('urlEspejo').value="";
    console.log(__('inputsEspejos'));
  }
}
function eliminarEspejo(fila) {
  var id = fila.id;
  var input = 'inputEspejo'+id;
  __('inputsEspejos').removeChild(__(input));
  $('#espejo'+id+'').remove();
  console.log(__('inputsEspejos'));
}

function limpiarInputs() {
    var mensaje = $('#mensaje');
    var resultado = "";
    $(".revision").each(function(){
      if($(this).val()==""){
        resultado =  resultado + $(this).attr("campo")  +"<br>";
      }
      });
    if($("#turno_programa").val() == ""){
      resultado =  resultado + "Turno del programa"+ "<br>";
    }
    //if($("#inputsLicencias > *").length == 0 && $("#auxmodalidad").val() == 2) {
        //resultado =  resultado + "Por lo menos introduzca una licencia"+ "<br>";
    //}
    // if($("#inputsRespaldos > *").length == 0 && $("#auxmodalidad").val() == 2) {
    //     resultado =  resultado + "Por lo menos un sistema de respaldo"+ "<br>";
    // }
    // if($("#inputsEspejos > *").length == 0 && $("#auxmodalidad").val() == 2) {
    //     resultado =  resultado + "Por lo menos introduca un sistema de espejo"+ "<br>";
    // }
    if(resultado.length > 0){
      $("#modalErrores").modal();
      $("#tamanoModal").attr("style","margin-top:20px;");
      var mensajes = $("#mensajesError");
      mensajes.addClass("alert alert-danger");
      mensajes.html("<p class='text-left'><strong>Los siguientes campos deben de llenarse:</strong></p>"+"<p class='text-left'>"+resultado+"</p>");
    }else{
      let btnGuardar = document.getElementById('btnGuardar');
      btnGuardar.classList.remove('active');
      btnGuardar.classList.add('disabled');
      btnGuardar.setAttribute("disabled", "");
      $("#estatus").val(1);
      $("#solicitudes").submit();

      console.log("Proceder con el guardado");
    }

}

//función para obtener id desde URL
function getParameterByName(name) {
    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
    results = regex.exec(location.search);
    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}

var Plantel = {};
Plantel.getInformacion = function(){
  var dt = getParameterByName('dt');
  var solicitud = getParameterByName('solicitud');
  //condición si está en view plantel o en solicitud
  if ($('#id').val()) {
    var id = $('#id').val();
    var url = "../controllers/control-plantel.php";
    var webSer = "consultarId";
  } else if (dt) {
    var url = "../controllers/control-solicitud-usuario.php";
    webSer = "datosSolicitud";
  };

  //Si input id existe, se carga información del mapa
  Plantel.promesaInformacion =   $.ajax({
    type: "POST",
    url: url,
    dataType : "json",
    data: (webSer == "datosSolicitud") ? {webService:webSer,url:"",solicitud_id:solicitud} : {webService:webSer,url:"",id:id},
    success:function(respuesta){
      if (respuesta.data.programa || respuesta.data.domicilio) {
        if (dt) {
          domicilio = respuesta.data.programa.plantel.domicilio;
        } else {
          domicilio = respuesta.data.domicilio.data[0];
        }
        if (domicilio.latitud === null || domicilio.longitud === null ) {
          z = 7,
          lt = 20.66434058010041,
          lg = -103.335607313818
        } else {
          z = 15,
          lt = parseFloat(domicilio.latitud),
          lg = parseFloat(domicilio.longitud)
        }

        //Se crea una nueva instancia del objeto mapa
        var map = new google.maps.Map(document.getElementById('map'),
          {
            zoom: z,
            center: {lat: lt, lng: lg}
          });

          //Creamos el marcador en el mapa con sus propiedades
          //para nuestro obetivo tenemos que poner el atributo draggable en true
          //position pondremos las mismas coordenas que obtuvimos en la geolocalización
          marker = new google.maps.Marker({
            map: map,
            draggable: true,
            position: new google.maps.LatLng(lt,lg)
          });

          //Al dar clic en el mapa se actualizan las coordenadas
          google.maps.event.addListener(map,'click',function(event){
            marker.setPosition(event.latLng),
            document.getElementById('coordenadas').value = event.latLng.lat() +","+ event.latLng.lng();
            document.getElementById('latitud').value = event.latLng.lat();
            document.getElementById('longitud').value = event.latLng.lng();

          });
      } else {
        z = 7;
        lt = 20.66434058010041;
        lg = -103.335607313818;
        //Se crea una nueva instancia del objeto mapa
        var map = new google.maps.Map(document.getElementById('map'),
          {
            zoom: z,
            center: {lat: lt, lng: lg}
          });

          //Creamos el marcador en el mapa con sus propiedades
          //para nuestro obetivo tenemos que poner el atributo draggable en true
          //position pondremos las mismas coordenas que obtuvimos en la geolocalización
          marker = new google.maps.Marker({
             map: map,
             draggable: true,
             position: new google.maps.LatLng(lt,lg)
           });

           //Al dar clic en el mapa se actualizan las coordenadas
           google.maps.event.addListener(map,'click',function(event){
             marker.setPosition(event.latLng),
             document.getElementById('coordenadas').value = event.latLng.lat() +","+ event.latLng.lng();
             document.getElementById('latitud').value = event.latLng.lat();
             document.getElementById('longitud').value = event.latLng.lng();

           });
         }
      },
      error: function(respuesta,errmsg,err){
        //console.log(respuesta);
        z = 7;
        lt = 20.66434058010041;
        lg = -103.335607313818;
        //Se crea una nueva instancia del objeto mapa
        var map = new google.maps.Map(document.getElementById('map'),
          {
            zoom: z,
            center: {lat: lt, lng: lg}
          });

          //Creamos el marcador en el mapa con sus propiedades
          //para nuestro obetivo tenemos que poner el atributo draggable en true
          //position pondremos las mismas coordenas que obtuvimos en la geolocalización
          marker = new google.maps.Marker({
             map: map,
             draggable: true,
             position: new google.maps.LatLng(lt,lg)
           });

           //Al dar clic en el mapa se actualizan las coordenadas
           google.maps.event.addListener(map,'click',function(event){
             marker.setPosition(event.latLng),
             document.getElementById('coordenadas').value = event.latLng.lat() +","+ event.latLng.lng();
             document.getElementById('latitud').value = event.latLng.lat();
             document.getElementById('longitud').value = event.latLng.lng();

           });
             //console.log(respuesta.status + ": " + respuesta.responseText);
        }
    });
};

$(document).ready(function ($) {
  Plantel.getInformacion();
  $.when(Plantel.promesaInformacion)
  .then(function(){
    console.log( ' Promesas completadas para alta solicitud' );
  })
  .done(function(){
    console.log('Todo listo para cargar la informacion necesaria');
    //document.getElementById("cargando").style.display = "none";
  })
  .fail(function(){
      console.log("Nuevo plantel");
    });
});
