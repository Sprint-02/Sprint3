var alertas = [];

function obterdados(idAquario) {
    fetch(`/medidas/tempo-real/${idAquario}`)
        .then(resposta => {

            if (resposta.ok) {
                resposta.json().then(resposta => {

                    console.log(`Dados recebidos: ${JSON.stringify(resposta)}`);

                    alertar(resposta, idAquario);
                });
            } else {

                console.error('Nenhum dado encontrado ou erro na API');
            }
        })
        .catch(function (error) {
            console.error(`Erro na obtenção dos dados do aquario p/ gráfico: ${error.message}`);
        });

}

function alertar(resposta, idAquario) {
    var temp = resposta[0].temperatura;
    var umi = resposta[0].umidade;
    console.log(idAquario === resposta[0].fk_aquario)
    
    


    var limites = {
        muito_quente: 26,
        quente: 25,
        ideal: 20,
        frio: 18,
        muito_frio: 19
    };

    var limitesU = {
        muito_umido: 95,
        umido: 93,
        ideal: 90,
        seco: 83,
        muito_seco: 80
    };
    


    if(umi > limitesU.ideal || umi < limitesU.ideal){
        Swal.fire({
            icon: 'warning',
            title: 'UMIDADE FORA DOS PADRÕES IDEAIS',
            text: 'VÁ PARA A ESTUFA 1 ARRUMAR OS PADRÕES',
        });
    
    }else
if(temp > limites.ideal || temp < limites.ideal){
    Swal.fire({
        icon: 'warning',
        title: 'UMIDADE FORA DOS PADRÕES IDEAIS',
        text: 'VÁ PARA A ESTUFA 1 ARRUMAR OS PADRÕES',
    });

}  
}



function alertaro(resposta) {
    var temp = resposta[0].temperatura;
    var umi = resposta[0].umidade;

    var limites = {
        muito_quente: 26,
        quente: 25,
        ideal: 20,
        frio: 18,
        muito_frio: 19
    };

    var limitesU = {
        muito_umido: 95,
        umido: 93,
        ideal: 90,
        seco: 83,
        muito_seco: 80
    };
    


    if(umi > limitesU.ideal || umi < limitesU.ideal){
        Swal.fire({
            icon: 'warning',
            title: 'UMIDADE FORA DOS PADRÕES IDEAIS',
            text: 'VÁ PARA A ESTUFA 1 ARRUMAR OS PADRÕES',
        });
    
    }else
if(temp > limites.ideal || temp < limites.ideal){
    Swal.fire({
        icon: 'warning',
        title: 'UMIDADE FORA DOS PADRÕES IDEAIS',
        text: 'VÁ PARA A ESTUFA 1 ARRUMAR OS PADRÕES',
    });

}  




    var card;

    if (idAquario == 1) {
        temp_aquario_1.innerHTML = temp + "°C";
        card = card_1
    } else if (idAquario == 2) {
        temp_aquario_2.innerHTML = temp + "°C";
        card = card_2
    } else if (idAquario == 3) {
        temp_aquario_3.innerHTML = temp + "°C";
        card = card_3
    } else if (idAquario == 4) {
        temp_aquario_4.innerHTML = temp + "°C";
        card = card_4
    }

    if (idAquario == 1) {
        temp_aquario_1.innerHTML = umi + " de umidade";
        card = card_1
    } else if (idAquario == 2) {
        temp_aquario_2.innerHTML = umi + " de umidade";
        card = card_2
    } else if (idAquario == 3) {
        temp_aquario_3.innerHTML = umi + " de umidade";
        card = card_3
    } else if (idAquario == 4) {
        temp_aquario_4.innerHTML = umi + " de umidade";
        card = card_4
    }

    card.className = classe_temperatura;
    card.className = classe_umidade;
}

function exibirAlerta(temp,umi, idAquario, grauDeAviso, grauDeAvisoCor) {
    var indice = alertas.findIndex(item => item.idAquario == idAquario);

    if (indice >= 0) {
        alertas[indice] = { idAquario, temp, umi, grauDeAviso, grauDeAvisoCor }
    } else {
        alertas.push({ idAquario, temp,umi, grauDeAviso, grauDeAvisoCor });
    }

    exibirCards();
    
    
// Dentro da div com classe grauDeAvisoCor há um caractere "invisível", 
// que pode ser inserido clicando com o seu teclado em alt+255 ou pelo código adicionado acima.
}



function removerAlerta(idAquario) {
    alertas = alertas.filter(item => item.idAquario != idAquario);
    exibirCards();

}
 
function exibirCards() {
    alerta.innerHTML = '';

    for (var i = 0; i < alertas.length; i++) {
        var mensagem = alertas[i];
        alerta.innerHTML += transformarEmDiv(mensagem);
  
    }
}

 
function exibirCardsU() {
    alerta.innerHTML = '';

    for (var i = 0; i < alertas.length; i++) {
        var mensagem = alertas[i];
        alerta.innerHTML += transformarEmDivU(mensagem);
  
    }
}


// function transformarEmDiv({ idAquario, temp, umi, grauDeAviso, grauDeAvisoCor }) {
//    if(){ }

//   if(){  Swal.fire({
        // icon: 'warning',
        // title: 'UMIDADE FORA DOS PADRÕES IDEAIS',
        // text: 'VÁ PARA A ESTUFA 1 ARRUMAR OS PADRÕES',
    // });}
// }



