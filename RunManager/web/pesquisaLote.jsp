<%-- 
    Document   : pesquisaLote
    Created on : 24/10/2017, 09:48:22
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
        <title>Pesquisa Lote</title>
    </head>
    <body>
        <h1>Pesquisa de Lotes</h1>
        <table id="customers">
            <tr>
                <th>ID</th>
                <th>Corrida</th>
                <th>Preço</th>
                <th colspan=3>Ação</th>
            </tr>
            <c:forEach items="${lotes}" var="lote">
                <tr>
                    <td><c:out value="${lote.id}" /></td>
                    <td><c:out value="${lote.corrida_id}" /></td>
                    <td><c:out value="${lote.preco}" /></td>
                        <td><a href="PesquisaIngressoController?acao=prepararExcluir&idLote=<c:out value="${lote.id}"/>">Ingressos</a></td>
                        <td><a href="ManterLoteController?acao=prepararEditar&idLote=<c:out value="${lote.id}"/>">Editar</a></td>
                        <td><a href="ManterLoteController?acao=prepararExcluir&idLote=<c:out value="${lote.id}"/>">Excluir</a></td>
                </tr>
            </c:forEach>
        </table>
        <form action="ManterLoteController?acao=prepararIncluir" method="post">
            <input id="botao" type="submit" name="btnIncluir" value="Incluir">
        </form>
    </body>
</html>
