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
        <link rel="stylesheet" type="text/css" href="css.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pesquisa Administrador</title>
    </head>
    <body id="principal">
        <h1>Pesquisa de Administradores</h1>
        <table id="customers">
            <tr>
                <th>CPF</th>
                <th>Email</th>
                <th>Nome</th>
                <th colspan=2>Ação</th>
            </tr>
            <c:forEach items="${administradores}" var="administrador">
                <tr>
                    <td><c:out value="${administrador.cpf}" /></td>
                    <td><c:out value="${administrador.email}" /></td>
                    <td><c:out value="${administrador.nome}" /></td>
                        <td><a href="ManterAdministradorController?acao=prepararEditar&cpfAdministrador=<c:out value="${administrador.cpf}"/>">Editar</a></td>
                        <td><a href="ManterAdministradorController?acao=prepararExcluir&cpfAdministrador=<c:out value="${administrador.cpf}"/>">Excluir</a></td>
                </tr>
            </c:forEach>
        </table>
        <form action="ManterAdministradorController?acao=prepararIncluir" method="post">
            <input id="botao" type="submit" name="btnIncluir" value="Incluir">
        </form>
        <button onclick="location.href = '/RunManager';" id="botao" >Voltar ao Menu</button>
    </body>
</html>
