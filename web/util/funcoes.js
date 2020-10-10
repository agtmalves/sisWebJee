/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function mascaraCampo(item, formato) {
    var campo = item.value.length;
    var resultado = formato.substring(0, 1);
    var texto = formato.substring(campo);
    if (texto.substring(0, 1) != resultado) {
        item.value += texto.substring(0, 1);
    }
}

function somenteNumero(e) {
    navegador = /msie/i.test(navigator.userAgent);
    if (navegador) {
        var caractere = event.keyCode;
    } else {
        var caractere = e.which;
    }
    if (caractere > 47 && caractere < 58) {
        return true;
    } else if (caractere != 8) {
            return false;
        } else {
            return true;
        }   
}