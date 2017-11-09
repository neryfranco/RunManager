<%-- 
    Document   : PesquisaPagamento
    Created on : 09/11/2017, 10:11:07
    Author     : Nery
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pesquisa de Pagamentos</title>
    </head>
    <body>
        <h1>Pesquisa de Pagamentos</h1>
        <table border=1>
            <tr>
                <th>ID</th>
                <th>Sexo</th>
                <th colspan=2>Faixa Etária</th>
                <th colspan=2>Ação</th>
            </tr>
            <c:forEach items="${pagamentos}" var="pagamento">
                <tr>
                    <td><c:out value="${pagamento.id}" /></td>
                    <td><c:out value="${pagamento.metodoPagamento}" /></td>
                    <td><c:out value="${pagamento.valor}" /></td>
                    <td><c:out value="${pagamento.ingresso_id}" /></td>  
                    <td><a href="ManterPagamentoController?acao=prepararEditar&codPagamento=<c:out value="${pagamento.id}"/>">Editar</a></td>
                    <td><a href="ManterPagamentoController?acao=prepararExcluir&codPagamento=<c:out value="${pagamento.id}"/>">Excluir</a></td>
                </tr>
            </c:forEach>
        </table>
        <form action="ManterPagamentoController?acao=prepararIncluir" method="post">
            <input type="submit" name="btnIncluir" value="Incluir">
        </form>
    </body>
</html>

