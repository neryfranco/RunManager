<%-- 
    Document   : manterKit
    Created on : 26/10/2017, 11:08:33
    Author     : Nery
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manter Kit</title>
    </head>
    <body>
        <h1>Manter Kit - ${operacao}</h1>

        <form action="ManterKitController?acao=confirmar${operacao}" method="post" name="frmManterKit" onsubmit="return validarFormulario(this)">
            <table>
                <tr>
                    <td>Número de Peito: </td> 
                    <td><input type="text" name="txtEmail" value="${kit.numPeito}" <c:if test="${operacao != 'Incluir'}"> readonly</c:if>></td>
                </tr>
                <tr>
                    <td>Chip: </td> 
                    <td>
                        <select name="optChip" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                        <option value="0" <c:if test="${kit.chip.numero == null}"> selected</c:if>> </option>  
                        <c:forEach items="${chips}" var="chip">
                            <option value="${chip.numero}" <c:if test="${kit.chip.numero == chip.numero}"> selected</c:if>>${chip.numero}</option>  
                        </c:forEach>
                        </select> 
                    </td>
                </tr>
                <tr>
                    <td>Camisa: </td> 
                    <td>
                        <select name="optCamisa" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                        <option value="0" <c:if test="${kit.camisa.tamanho == null}"> selected</c:if>> </option>  
                        <c:forEach items="${camisas}" var="camisa">
                            <option value="${camisa.tamanho}" <c:if test="${kit.camisa.tamanho == camisa.tamanho}"> selected</c:if>>${camisa.tamanho}</option>  
                        </c:forEach>
                        </select> 
                    </td>
                </tr>        
                
                <tr>
                    <td><input type="submit" name="btnConfirmar" value="Confirmar"></td>
                </tr>
            </table>
        </form>
    </body>
</html>