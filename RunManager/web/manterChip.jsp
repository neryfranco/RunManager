<%-- 
    Document   : manterChip
    Created on : 26/10/2017, 11:54:32
    Author     : Nery
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manter Chip</title>
    </head>
    <body>
        <h1>Manter Chip - ${operacao}</h1>

        <form action="ManterChipController?acao=confirmar${operacao}" method="post" name="frmManterChip">
            <table>
                <tr>
                    <td>Número de Peito: </td> 
                    <td><input type="text" name="txtEmail" value="${chip.numPeito}" <c:if test="${operacao != 'Incluir'}"> readonly</c:if>></td>
                </tr>
                <tr>
                        <td>Percurso: </td> 
                        <td>
                            <select name="optPercurso" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                            <option value="0" <c:if test="${chip.percurso.id == null}"> selected</c:if>> </option>  
                            <c:forEach items="${percursos}" var="percurso">
                                <option value="${percurso.id}" <c:if test="${chip.percurso.id == percurso.id}"> selected</c:if>>${percurso.id}</option>
                            </c:forEach>
                        </select> 
                    </td>
                </tr>
                <tr>
                    <td>Itinerário:</td> 
                    <td><textarea type="text" rows="5" name="txtItinerario" value="${percurso.itinerario}" readonly ></textarea></td>
                </tr>

                <tr>
                    <td><input type="submit" name="btnConfirmar" value="Confirmar"></td>
                </tr>
            </table>
        </form>
    </body>
</html>