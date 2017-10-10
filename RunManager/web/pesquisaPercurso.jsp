<%-- 
    Document   : pesquisaPercurso
    Created on : 10/10/2017, 08:50:18
    Author     : Nery
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pesquisa de Percursos</title>
    </head>
    <body>
        <h1>Pesquisa de Percursos</h1>
        <table border=1>
            <tr>
                <th>ID</th>
                <th>Categoria</th>
                <th>Itinerario</th>
                <th colspan=2>Ação</th>
            </tr>
            <c:forEach items="${percursos}" var="percurso">
                <tr>
                    <td><c:out value="${percurso.id}" /></td>
                    <td><c:out value="${percurso.categoria_id}" /></td>
                    <td><c:out value="${percurso.itinerario}" /></td>
                        <td><a href="ManterPercursoController?acao=prepararEditar&codPercurso=<c:out value="${percurso.id}"/>">Editar</a></td>
                        <td><a href="ManterPercursoController?acao=prepararExcluir&codPercurso=<c:out value="${percurso.id}"/>">Excluir</a></td>
                </tr>
            </c:forEach>
        </table>
        <form action="ManterPercursoController?acao=prepararIncluir" method="post">
            <input type="submit" name="btnIncluir" value="Incluir">
        </form>
    </body>
</html>
