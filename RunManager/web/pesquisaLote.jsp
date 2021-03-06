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
    <body class="principal">
        <h1>Pesquisa de Lotes</h1>
        <table class="customers">
            <tr>
                <th>Corrida</th>
                <th>ID</th>
                <th>Preço</th>
                <th colspan=3>Ação</th>
            </tr>
            <c:forEach items="${lotes}" var="lote">
                <tr>
                    <c:forEach items="${corridas}" var="corrida">
                        <c:if test="${lote.corrida_id == corrida.id}"> <td> <c:out value="${corrida.nome}"/> </td> </c:if>
                    </c:forEach>
                    <td><c:out value="${lote.id}" /></td>
                    <td><c:out value="${lote.preco}" /></td>
                    <td><a href="ManterLoteController?acao=prepararEditar&idLote=<c:out value="${lote.id}"/>">Editar</a></td>
                    <td><a href="ManterLoteController?acao=prepararExcluir&idLote=<c:out value="${lote.id}"/>">Excluir</a></td>
                </tr>
            </c:forEach>
        </table>
        <form action="ManterLoteController?acao=prepararIncluir" method="post">
            <input class="botao" type="submit" name="btnIncluir" value="Incluir">
        </form>
        <button onclick="location.href = '/RunManager';" class="botao" >Voltar ao Menu</button>
    </body>
</html>
