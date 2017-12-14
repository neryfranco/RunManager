<%-- 
    Document   : pesquisaCategoria
    Created on : 16/10/2017, 18:28:23
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
        <title>Pesquisa de Categorias</title>
    </head>
    <body id="principal">
        <h1>Pesquisa de Categorias</h1>
        <table id="customers">
            <tr>
                <th>ID</th>
                <th>Sexo</th>
                <th colspan=2>Faixa Etária</th>
                <th colspan=2>Ação</th>
            </tr>
            <c:forEach items="${categorias}" var="categoria">
                <tr>
                    <td><c:out value="${categoria.id}" /></td>
                    <td><c:out value="${categoria.sexo}" /></td>
                    <td><c:out value="${categoria.idadeIni}" /></td>
                    <td><c:out value="${categoria.idadeFim}" /></td>  
                    <td><a href="ManterCategoriaController?acao=prepararEditar&codCategoria=<c:out value="${categoria.id}"/>">Editar</a></td>
                    <td><a href="ManterCategoriaController?acao=prepararExcluir&codCategoria=<c:out value="${categoria.id}"/>">Excluir</a></td>
                </tr>
            </c:forEach>
        </table>
        <form action="ManterCategoriaController?acao=prepararIncluir" method="post">
            <input id="botao" type="submit" name="btnIncluir" value="Incluir">
        </form>
    </body>
</html>
