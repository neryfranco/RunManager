<%-- 
    Document   : manterInscricao
    Created on : 27/12/2017, 12:29:56
    Author     : Nery
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="css.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manter Inscricao</title>
    </head>
    <body id="principal">
        <h1>Manter Inscrição - ${operacao}</h1>

        <form action="ManterCorridaController?acao=confirmar${operacao}" method="post" name="frmManterCorrida">
            <table>
                <h3>Corrida:</h3>
                <tr>
                    <td>ID: </td> 
                    <td><input id="caixatexto" type="text" name="txtID" value="${corrida.id}" readonly ></td>
                    
                    <td>Local Largada: </td> 
                    <td><input id="caixatexto" type="text" name="txtLocalLargada" value="${corrida.localLargada}"  readonly></td>
                </tr>
                <tr>
                    <td>Nome: </td> 
                    <td><input id="caixatexto" type="text" name="txtNome" value="${corrida.nome}"  readonly ></td>
                    
                    <td>Local Chegada:  </td> 
                    <td><input id="caixatexto" type="text" name="txtLocalChegada" value="${corrida.localChegada}"  readonly></td>
                </tr>
                <tr>
                    <td>Horário Largada:  </td> 
                    <td><input id="caixatexto" type="text" name="txtHorarioLargada" value="${corrida.horaLargada}"  readonly></td>
                    
                    <td>Data Corrida:  </td> 
                    <td><input id="caixatexto" type="text" name="txtDataCorrida" value="${corrida.dataCorrida}"  readonly></td>
                </tr>
                <tr>
                    <td>Data Retirada Kit:   </td> 
                    <td><input id="caixatexto" type="text" name="txtDataRetiradaKit" value="${corrida.dataRetiradaKit}"  readonly></td>
                    
                    <td>Local Retirada Kit:  </td> 
                    <td><input id="caixatexto" type="text" name="txtLocalRetiradaKit" value="${corrida.localRetiradaKit}"  readonly></td>
                </tr>
                <tr>
                    <td>Duração Limite (min):  </td> 
                    <td><input type="text" id="caixatexto" name="txtDuracaoLimite" value="${corrida.duracaoLimite}"  readonly></td>
                    
                    <td>Número Máximo Participantes:  </td> 
                    <td><input type="text" id="caixatexto" name="txtNumMaxParticipantes" value="${corrida.numMaxParticipantes}"  readonly></td>
                </tr>
                <tr>
                    <td>Percurso: </td> 
                    <td>
                        <input type="text" id="caixatexto" name="txtNumMaxParticipantes" value="${corrida.percurso.id} - ${corrida.percurso.itinerario}"  readonly></td>
                    </td>
                </tr>
            </table>
            <table>
                <h3>Lote:</h3>
                <tr>
                    <td>Ingresso: </td> 
                    <td>
                        <form>
                            <select id="caixatexto" name="optLote">
                                <c:forEach items="${lotes}" var="lote">
                                    <option value="${lote.id}" <c:if test="${lote.corrida.id == corrida.id}"> selected </c:if> > R$ ${lote.preco}</option>  
                                </c:forEach>
                            </select>
                        </form>
                    </td>
                </tr>
            </table>
            <table>
                <h3>Kit:</h3>
                <tr>
                    <td>Tamanho da Camisa: </td> 
                    <td>
                        <form>
                            <select id="caixatexto" name="optPercursos">
                                <option value="P"> P </option>
                                <option value="M"> M </option>
                                <option value="G"> G </option>
                            </select>
                        </form>
                    </td>
                </tr>
            </table>
            <table>
                <h3>Pagamento:</h3>
                <tr>
                    <td>Metodo de Pagamento: </td> 
                    <td>
                        <select id="caixatexto" name="optMetodo" <c:if test="${operacao == 'Excluir'}"> disabled </c:if>>
                            <option value="c">Cartão de Crédito</option> 
                            <option value="b">Boleto Bancário</option> 
                        </select>
                    </td>
                </tr>
            </table>
            <input id="botao" type="button" value="Voltar" onClick="history.go(-1)">
        </form>
    </body>
</html>
