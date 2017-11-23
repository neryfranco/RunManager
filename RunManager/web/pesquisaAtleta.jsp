<%-- 
    Document   : pesquisaAtleta
    Created on : 17/10/2017, 08:56:17
    Author     : Nery
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pesquisa Atleta</title>
    </head>
    <body>
        <h1>Pesquisa de Atletas</h1>
        <table border=1>
            <tr>
                <th>Email</th>                
                <th>Nome</th>
                <th>Apelido</th>
                <th colspan=2>Ação</th>
            </tr>
            <c:forEach items="${atletas}" var="atleta">
                <tr>
                    <td><c:out value="${atleta.email}" /></td>
                    <td><c:out value="${atleta.nome}" /></td>
                    <td><c:out value="${atleta.apelido}" /></td>
                        <td><a href="ManterAtletaController?acao=prepararEditar&emailAtleta=<c:out value="${atleta.email}"/>">Editar</a></td>
                        <td><a href="ManterAtletaController?acao=prepararExcluir&emailAtleta=<c:out value="${atleta.email}"/>">Excluir</a></td>
                </tr>
            </c:forEach>
        </table>
        <form action="ManterAtletaController?acao=prepararIncluir" method="post">
            <input type="submit" name="btnIncluir" value="Incluir">
        </form>
    </body>
</html>
