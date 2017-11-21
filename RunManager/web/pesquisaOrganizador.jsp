<%-- 
    Document   : pesquisaOrganizador
    Created on : 16/10/2017, 22:28:21
    Author     : Victor Domingos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="css.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pesquisa Organizador</title>
    </head>
    <body>
        <h1>Pesquisa de Organizadores</h1>
        <table id="customers">
            <tr>
                <th>Nome</th>
                <th>Email</th>
                <th>Telefone</th>
                <th colspan=2>Ação</th>
            </tr>
            <c:forEach items="${organizadores}" var="organizador">
                <tr>
                    <td><c:out value="${organizador.nome}" /></td>
                    <td><c:out value="${organizador.email}" /></td>
                    <td><c:out value="${organizador.telCel}" /></td>
                        <td><a href="ManterOrganizadorController?acao=prepararEditar&emailOrganizador=<c:out value="${organizador.email}"/>">Editar</a></td>
                        <td><a href="ManterOrganizadorController?acao=prepararExcluir&emailOrganizador=<c:out value="${organaziador.email}"/>">Excluir</a></td>
                </tr>
            </c:forEach>
        </table>
        <form action="ManterOrganizadorController?acao=prepararIncluir" method="post">
            <input id="botao" type="submit" name="btnIncluir" value="Incluir">
        </form>
    </body>
</html>
