<%-- 
    Document   : pesquisaChip
    Created on : 26/10/2017, 11:45:12
    Author     : Nery
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="css.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pesquisa Chip</title>
    </head>
    <body id="principal">
        <h1>Pesquisa de Chips</h1>
        <table id="customers">
            <tr>
                <th>Número</th>
                <th>Percurso</th>
                <th colspan=2>Ação</th>
            </tr>
            <c:forEach items="${chips}" var="chip">
                <tr>
                    <td><c:out value="${chip.numero}" /></td>
                    <td><c:out value="${chip.percurso_id}" /></td>
                        <td><a href="ManterChipController?acao=prepararEditar&numPeitoChip=<c:out value="${chip.numero}"/>">Editar</a></td>
                        <td><a href="ManterChipController?acao=prepararExcluir&numPeitoChip=<c:out value="${chip.numero}"/>">Excluir</a></td>
                </tr>
            </c:forEach>
        </table>
        <form action="ManterChipController?acao=prepararIncluir" method="post">
            <input id="botao" type="submit" name="btnIncluir" value="Incluir">
        </form>
        <button onclick="location.href = '/RunManager';" id="botao" >Voltar ao Menu</button>
    </body>
</html>

