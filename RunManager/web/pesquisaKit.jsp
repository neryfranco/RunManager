<%-- 
    Document   : pesquisaKit
    Created on : 24/10/2017, 10:13:23
    Author     : Nery
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pesquisa Kit</title>
    </head>
    <body>
        <h1>Pesquisa de Kits</h1>
        <table border=1>
            <tr>
                <th>Número de Peito</th>
                <th>Chip</th>
                <th colspan=2>Ação</th>
            </tr>
            <c:forEach items="${kits}" var="kit">
                <tr>
                    <td><c:out value="${kit.numPeito}" /></td>
                    <td><c:out value="${kit.chip_num}" /></td>
                        <td><a href="ManterAdministradorController?acao=prepararEditar&numPeitoKit=<c:out value="${kit.numPeito}"/>">Editar</a></td>
                        <td><a href="ManterAdministradorController?acao=prepararExcluir&numPeitoKit=<c:out value="${kit.numPeito}"/>">Excluir</a></td>
                </tr>
            </c:forEach>
        </table>
        <form action="ManterKitController?acao=prepararIncluir" method="post">
            <input type="submit" name="btnIncluir" value="Incluir">
        </form>
    </body>
</html>
