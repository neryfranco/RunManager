<%-- 
    Document   : pesquisaCorrida
    Created on : 16/10/2017, 17:45:17
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
        <title>Pesquisa de Corridas</title>
    </head>
    <body>
        <h1>Pesquisa de Corridas</h1>
        <table id="customers">
            <tr>
                <th>Nome</th>
                <th>Local Largada</th>
                <th>Hora Largada</th>
                <th>Data da Corrida</th>
                <th colspan=2>Ação</th>
            </tr>
            <c:forEach items="${corridas}" var="corrida">
                <tr>
                    <td><c:out value="${corrida.nome}" /></td>
                    <td><c:out value="${corrida.localLargada}" /></td>
                    <td><c:out value="${corrida.horaLargada}" /></td>
                    <td><c:out value="${corrida.dataCorrida}" /></td>  
                    <td><a href="ManterCorridaController?acao=prepararEditar&codCorrida=<c:out value="${corrida.id}"/>">Editar</a></td>
                    <td><a href="ManterCorridaController?acao=prepararExcluir&codCorrida=<c:out value="${corrida.id}"/>">Excluir</a></td>
                </tr>
            </c:forEach>
        </table>
        <form action="ManterCorridaController?acao=prepararIncluir" method="post">
            <input id="botao" type="submit" name="btnIncluir" value="Incluir">
        </form>
    </body>
</html>
