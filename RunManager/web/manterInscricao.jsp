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
        <title>Manter Corrida</title>
    </head>
    <body id="principal">
        <h1>Manter Corrida - ${operacao}</h1>

        <form action="ManterCorridaController?acao=confirmar${operacao}" method="post" name="frmManterCorrida">
            <table>
                <tr>
                    <td>ID: </td> 
                    <td><input id="caixatexto" type="text" name="txtID" value="${corrida.id}" readonly ></td>
                </tr>
                <tr>
                    <td>Nome: </td> 
                    <td><input id="caixatexto" type="text" name="txtNome" value="${corrida.nome}" <c:if test="${operacao == 'Informacoes'}"> readonly </c:if>></td>
                    </tr>
                    <tr>
                        <td>Local Largada: </td> 
                        <td><input id="caixatexto" type="text" name="txtLocalLargada" value="${corrida.localLargada}" <c:if test="${operacao == 'Informacoes'}"> readonly</c:if>></td>
                    </tr>
                    <tr>
                        <td>Local Chegada:  </td> 
                        <td><input id="caixatexto" type="text" name="txtLocalChegada" value="${corrida.localChegada}" <c:if test="${operacao == 'Informacoes'}"> readonly</c:if>></td>
                    </tr>
                    <tr>
                        <td>Horário Largada:  </td> 
                        <td><input id="caixatexto" type="text" name="txtHorarioLargada" value="${corrida.horaLargada}" <c:if test="${operacao == 'Informacoes'}"> readonly</c:if>></td>
                    </tr>
                    <tr>
                        <td>Data Corrida:  </td> 
                        <td><input id="caixatexto" type="text" name="txtDataCorrida" value="${corrida.dataCorrida}" <c:if test="${operacao == 'Informacoes'}"> readonly</c:if>></td>
                    </tr>
                    <tr>
                        <td>Data Retirada Kit:   </td> 
                        <td><input id="caixatexto" type="text" name="txtDataRetiradaKit" value="${corrida.dataRetiradaKit}" <c:if test="${operacao == 'Informacoes'}"> readonly</c:if>></td>
                    </tr>
                    <tr>
                        <td>Local Retirada Kit:  </td> 
                        <td><input id="caixatexto" type="text" name="txtLocalRetiradaKit" value="${corrida.localRetiradaKit}" <c:if test="${operacao == 'Informacoes'}"> readonly</c:if>></td>
                    </tr>
                    <tr>
                        <td>Duração Limite (min):  </td> 
                        <td><input type="text" id="caixatexto" name="txtDuracaoLimite" value="${corrida.duracaoLimite}" <c:if test="${operacao == 'Informacoes'}"> readonly</c:if>></td>
                    </tr>
                    <tr>
                        <td>Número Máximo Participantes:  </td> 
                        <td><input type="text" id="caixatexto" name="txtNumMaxParticipantes" value="${corrida.numMaxParticipantes}" <c:if test="${operacao == 'Informacoes'}"> readonly</c:if>></td>
                    </tr>
                <tr>
                    <td>Percurso: </td> 
                    <td>
                        <form>
                            <select id="caixatexto" name="optPercursos" <c:if test="${operacao == 'Informacoes'}"> disabled</c:if> >
                                <c:forEach items="${percursos}" var="percurso">
                                    <option value="${percurso.id}" <c:if test="${percurso.categoria_id == categoria.id}"> selected</c:if>> ${percurso.id} - ${percurso.itinerario} - ${percurso.categoria.descricao}</option>  
                                </c:forEach>
                            </select>
                        </form>
                    </td>
                </tr>
            </table>
            <input id="botao" type="submit" name="btnConfirmar" value="Confirmar">    
        </form>
    </body>
</html>
