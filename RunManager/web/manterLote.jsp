<%-- 
    Document   : ManterLote
    Created on : 26/10/2017, 11:00:39
    Author     : Nery
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manter Lote</title>
    </head>
    <body>
        <h1>Manter Lote - ${operacao}</h1>

        <form action="ManterLoteController?acao=confirmar${operacao}" method="post" name="frmManterLote" onsubmit="return validarFormulario(this)">
            <table>
                <tr>
                    <td>ID: </td> 
                    <td><input type="text" name="txtId" value="${lote.id}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                </tr>
                <tr>
                    <td>Corrida: </td> 
                    <td>
                        <select name="optCorrida" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                        <option value="0" <c:if test="${lote.corrida.id == null}"> selected</c:if>> </option>  
                        <c:forEach items="${corridas}" var="corrida">
                            <option value="${corrida.nome}" <c:if test="${lote.corrida.id == corrida.id}"> selected</c:if>>${corrida.nome}</option>  
                        </c:forEach>
                        </select> 
                    </td>
                </tr>
                <tr>
                    <td>Preço: </td> 
                    <td><input type="text" name="txtPreco" value="${lote.preco}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                </tr>
                <tr>
                    <td>Data Limite (Validade): </td> 
                    <td><input type="text" name="txtDataLimite" value="${lote.dataLimite}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                </tr>
                
                
                <tr>
                    <td><input type="submit" name="btnConfirmar" value="Confirmar"></td>
                </tr>
            </table>
        </form>
    </body>
</html>