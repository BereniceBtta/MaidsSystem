function cancelar(){
    /*cancelar limpia*/ 
    var vacio=" ";
document.getElementById("num").value=vacio;
document.getElementById("nomb").value=vacio;
document.getElementById("m").checked=false;
document.getElementById("h").checked=false;
document.getElementById("carreras").value=0;
document.getElementById("result").innerHTML=vacio;
document.getElementById("result2").innerHTML=vacio;
}

function correcto(){
    /*aceptar valida si es correcto */
    var contenido=[];
    var num1=document.getElementById("num").value;
    contenido.push(num1);
    var nom1=document.getElementById("nomb").value;
    contenido.push(nom1);
    if(m.checked == true){
        var mujer=document.getElementById("m").checked=true;
        contenido.push(mujer+" M");
    } else{
        var hombre= document.getElementById("h").checked=true;
        contenido.push(hombre+" H");
    }
    var carrera=document.getElementById("carreras");
    // Obtener el texto que muestra la opción seleccionada
    var valorSeleccionado = carrera.options[carrera.selectedIndex].text;
    contenido.push(valorSeleccionado);
    var correo=document.getElementById("correo").value;
    contenido.push(correo);
    
    console.log(contenido);
    }

    function comprobar(){
        //comprueba el numero de control
       var estado = true;
        var length = document.getElementById("num");
    
       if (length.value.length == 9){
        document.getElementById("num").setCustomValidity('');
        document.getElementById("num").style.background='#FFFFFF'; 
       } else{
        estado = false;
        length.setCustomValidity('inserte al menos un número');
        document.getElementById("num").style.background='#FFDDDD';
       }
       //comprueba el nombre
       var filtrar=/^[A-Za-z\_\-\.\s\xF1\xD1]+$/;
        if (filtrar.test(document.getElementById("nomb").value)){
            document.getElementById("nomb").setCustomValidity('');
            document.getElementById("nomb").style.background='#FFFFFF';
            }else{
           document.getElementById("nomb").setCustomValidity('solo se aceptan letras');
           document.getElementById("nomb").style.background='#FFDDDD';
           estado = false;
            }
            //comprueba que este selecionada por lo menos 1
            var h = document.getElementById('h');
            var m = document.getElementById('m');
    if ( (h.checked == false ) && (m.checked == false ) )
        {
        document.getElementById("result").innerHTML = " seleccione algún sexo";
        estado = false;
        
        }else{
            document.getElementById("result").innerHTML = "";
        }
       //comprueba la lista de elementos
        var op = document.getElementById("carreras");
    if(op.value == "0"){
      document.getElementById("result2").innerHTML = "por favor seleccione una carrera";
      estado = false;
    }
    else{
        document.getElementById("result2").innerHTML = "";
    }
    //comprueba el correo electrónico
    var filtrar2=/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,4})+$/;
    if (filtrar2.test(document.getElementById("correo").value)){
        document.getElementById("correo").setCustomValidity('');
        document.getElementById("correo").style.background='#FFFFFF';
        }
    else{
       document.getElementById("correo").setCustomValidity('escribe un correo correcto');
       document.getElementById("correo").style.background='#FFDDDD';
       estado = false;
        }
    if(estado){
        correcto();
   }
    
    }