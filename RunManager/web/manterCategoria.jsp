<%-- 
    Document   : mantercategoria
    Created on : 18/10/2017, 17:55:44
    Author     : vicdo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manter Categoria</title>
    </head>
    <body>
        <h1>Manter Categoria - ${operacao}</h1>

        <form action="ManterCategoriaController?acao=confirmar${operacao}" method="post" name="frmManterCategoria">
            <table>
                <tr>
                    <td>ID: </td> 
                    <td><input type="text" name="txtID" value="${categoria.id}" readonly></td>
                </tr>
                <tr>
                    <td>Sexo: </td> 
                    <td><input type="radio" name="txtSexo" value="1" <c:if test="${operacao == 'Excluir'}"> disabled</c:if>> Masculino </td>
                    <td><input type="radio" name="txtSexo" value="2" <c:if test="${operacao == 'Excluir'}"> disabled</c:if>> Feminino </td>
                </tr>
                <tr>
                    <td>Idade Inicial: </td> 
                    <td><input type="text" name="txtIdadeInicial" value="${categoria.idadeInicial}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                </tr>
                <tr>
                    <td>Idade Final:  </td> 
                    <td><input type="text" name="txtIdadeFinal" value="${categoria.idadeFinal}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                </tr>
                <tr>
                    <td>Descrição:  </td> 
                    <td><input type="text" name="txtDescricao" value="${categoria.descricao}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                </tr>
                <td><input type="submit" name="btnConfirmar" value="Confirmar"></td>
            </table>
        </form>
    </body>
</html>
