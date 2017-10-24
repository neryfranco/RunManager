<%-- 
    Document   : pesquisaAdminisrador
    Created on : 24/10/2017, 09:17:41
    Author     : Nery
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pesquisa Administrador</title>
    </head>
    <body>
        <h1>Pesquisa de Administradores</h1>
        <table border=1>
            <tr>
                <th>Nome</th>
                <th>Email</th>
                <th>CPF</th>
                <th colspan=2>Ação</th>
            </tr>
            <c:forEach items="${administradores}" var="administrador">
                <tr>
                    <td><c:out value="${administrador.nome}" /></td>
                    <td><c:out value="${administrador.email}" /></td>
                    <td><c:out value="${administrador.cpf}" /></td>
                        <td><a href="ManterAdministradorController?acao=prepararEditar&emailAdministrador=<c:out value="${administrador.email}"/>">Editar</a></td>
                        <td><a href="ManterAdministradorController?acao=prepararExcluir&emailAdministrador=<c:out value="${administrador.email}"/>">Excluir</a></td>
                </tr>
            </c:forEach>
        </table>
        <form action="ManterAdministradorController?acao=prepararIncluir" method="post">
            <input type="submit" name="btnIncluir" value="Incluir">
        </form>
    </body>
</html>
