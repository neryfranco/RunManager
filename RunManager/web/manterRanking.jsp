<%-- 
    Document   : manterRanking
    Created on : 26/10/2017, 10:04:14
    Author     : Nery
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manter Ranking</title>
    </head>
    <body>
        <h1>Manter Ranking - ${operacao}</h1>

        <form action="ManterRankingController?acao=confirmar${operacao}" method="post" name="frmManterRanking" >
            <table>
                <tr>
                    <td>ID: </td> 
                    <td><input type = "text" name = "txtEmail" value = "${ranking.id}" <c:if test = "${operacao != 'Incluir'}"> readonly</c:if>> </td>
                </tr>
                <tr>
                    <td>Corrida: </td> 
                    <td>
                        <select name="optCorrida" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                        <option value="0" <c:if test="${ranking.corrida.id == null}"> selected</c:if>> </option>  
                        <c:forEach items="${corridas}" var="corrida">
                            <option value="${corrida.nome}" <c:if test="${ranking.corrida.id == corrida.id}"> selected</c:if>>${corrida.nome}</option>  
                        </c:forEach>
                        </select> 
                    </td>
                </tr>
                <tr>
                    <td>Categoria: </td> 
                    <td>
                        <select name="optCategoria" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                        <option value="0" <c:if test="${ranking.categoria.id == null}"> selected</c:if>> </option>  
                        <c:forEach items="${categorias}" var="categoria">
                            <option value="${categoria.descricao}" <c:if test="${ranking.categoria.id == categoria.id}"> selected</c:if>>${categoria.descricao}</option>  
                        </c:forEach>
                        </select> 
                    </td>
                </tr>
                
                <tr>
                    <td><input type="submit" name="btnConfirmar" value="Confirmar"></td>
                </tr>
            </table>
        </form>
    </body>
</html>
