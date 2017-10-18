<%-- 
    Document   : pesquisaTapete
    Created on : 16/10/2017, 17:26:10
    Author     : Nery
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pesquisa de Tapetes</title>
    </head>
    <body>
        <h1>Pesquisa de Tapetes</h1>
        <table border=1>
            <tr>
                <th>ID</th>
                <th>CEP</th>
                <th>Rua</th>
                <th>Cidade</th>
                <th>UF</th>
                <th>Referência</th>
                <th colspan=2>Ação</th>
            </tr>
            <c:forEach items="${tapetes}" var="tapete">
                <tr>
                    <td><c:out value="${tapete.id}" /></td>
                    <td><c:out value="${tapete.cep}" /></td>
                    <td><c:out value="${tapete.rua}" /></td>
                    <td><c:out value="${tapete.cidade}" /></td>
                    <td><c:out value="${tapete.uf}" /></td>
                    <td><c:out value="${tapete.referencia}" /></td>  
                    <td><a href="ManterTapeteController?acao=prepararEditar&codTapete=<c:out value="${tapete.id}"/>">Editar</a></td>
                    <td><a href="ManterTapeteController?acao=prepararExcluir&codTapete=<c:out value="${tapete.id}"/>">Excluir</a></td>
                </tr>
            </c:forEach>
        </table>
        <form action="ManterTapeteController?acao=prepararIncluir" method="post">
            <input type="submit" name="btnIncluir" value="Incluir">
        </form>
    </body>
</html>