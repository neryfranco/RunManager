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
        <link rel="stylesheet" type="text/css" href="css.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pesquisa Atleta</title>
    </head>
    <body id="principal">
        <h1>Pesquisa de Atletas</h1>
        <table id="customers">
            <tr>
                <th>CPF</th>                
                <th>Email</th>
                <th>Nome</th>
                <th colspan=2>Ação</th>
            </tr>
            <c:forEach items="${atletas}" var="atleta">
                <tr>
                    <td><c:out value="${atleta.cpf}" /></td>
                    <td><c:out value="${atleta.email}" /></td>
                    <td><c:out value="${atleta.nome}" /></td>
                        <td><a href="ManterAtletaController?acao=prepararEditar&cpfAtleta=<c:out value="${atleta.cpf}"/>">Editar</a></td>
                        <td><a href="ManterAtletaController?acao=prepararExcluir&cpfAtleta=<c:out value="${atleta.cpf}"/>">Excluir</a></td>
                </tr>
            </c:forEach>
        </table>
        <form action="ManterAtletaController?acao=prepararIncluir" method="post">
            <input id="botao" type="submit" name="btnIncluir" value="Incluir">
        </form>
        <button onclick="location.href = '/RunManager';" id="botao" >Voltar ao Menu</button>
    </body>
</html>
