var database = require("../database/config");

function buscarUltimasMedidas(idUsuario) {
    
    console.log("USUARIO::::0", idUsuario)

    instrucaoSql = `select count(*) as descricao, 
    day(momento) as momento from aviso where fk_usuario = ${idUsuario}
     group by day(momento) LIMIT 7; `;
    
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

// dht11_temperatura as temperatura, 
//         dht11_umidade as umidade,  
//                         momento,
//                         FORMAT(momento, 'HH:mm:ss') as momento_grafico
//                     from medida

function buscarMedidasEmTempoReal(idUsuario) {

    console.log("USUARIO::::0", idUsuario)

    instrucaoSql = `select count(*) as descricao, 
    second(momento) from aviso where fk_usuario = ${idUsuario}
     group by second(momento) LIMIT 7; `;
    
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);

}


module.exports = {
    buscarUltimasMedidas,
    buscarMedidasEmTempoReal
}
