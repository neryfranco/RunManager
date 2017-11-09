<%-- 
    Document   : manterCorrida
    Created on : 18/10/2017, 16:31:28
    Author     : vicdo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manter Corrida</title>
    </head>
    <body>
        <h1>Manter Corrida - ${operacao}</h1>

        <form action="ManterCorridaController?acao=confirmar${operacao}" method="post" name="frmManterCorrida">
            <table>
                <tr>
                    <td>ID: </td> 
                    <td><input type="text" name="txtID" value="${corrida.id}" readonly></td>
                </tr>
                <tr>
                    <td>Nome: </td> 
                    <td><input type="text" name="txtNome" value="${corrida.nome}" <c:if test="${operacao == 'Excluir'}"> readonly </c:if>></td>
                </tr>
                <tr>
                    <td>Local Largada: </td> 
                    <td><input type="text" name="txtLocalLargada" value="${corrida.localLargada}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                </tr>
                <tr>
                    <td>Local Chegada:  </td> 
                    <td><input type="text" name="txtLocalChegada" value="${corrida.localChegada}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                </tr>
                <tr>
                    <td>Horário Largada:  </td> 
                    <td><input type="text" name="txtHorarioLargada" value="${corrida.horaLargada}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                </tr>
                <tr>
                    <td>Data Corrida:  </td> 
                    <td><input type="text" name="txtDataCorrida" value="${corrida.dataCorrida}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                </tr>
                <tr>
                    <td>Data Retirada Kit:   </td> 
                    <td><input type="text" name="txtDataRetiradaKit" value="${corrida.dataRetiradaKit}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                </tr>
                <tr>
                    <td>Local Retirada Kit:  </td> 
                    <td><input type="text" name="txtLocalRetiradaKit" value="${corrida.localRetiradaKit}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                </tr>
                <tr>
                    <td>Duração Limite:  </td> 
                    <td><input type="text" name="txtDuracaoLimite" value="${corrida.duracaoLimite}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                </tr>
                <tr>
                    <td>Número Máximo Participantes:  </td> 
                    <td><input type="text" name="txtNumMaxParticipantes" value="${corrida.numMaxParticipantes}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                </tr>
                    <td><input type="submit" name="btnConfirmar" value="Confirmar"></td>
            </table>
        </form>
    </body>
</html>
