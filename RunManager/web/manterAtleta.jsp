<%-- 
    Document   : manterAtleta
    Created on : 18/10/2017, 16:56:19
    Author     : vicdo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manter Atleta</title>
    </head>
    <body>
        <h1>Manter Atleta - ${operacao}</h1>

        <form action="ManterAtletaController?acao=confirmar${operacao}" method="post" name="frmManterAtleta" onsubmit="return validarFormulario(this)">
            <table>
                <tr>
                    <td>Email: </td> 
                    <td><input type="text" name="txtEmail" value="${atleta.email}" <c:if test="${operacao != 'Excluir'}"> readonly</c:if>></td>
                </tr>
                <tr>
                    <td>Senha: </td> 
                    <td><input type="text" name="txtSenha" value="${atleta.senha}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                </tr>
                <tr>
                    <td>Apelido: </td> 
                    <td><input type="text" name="txtApelido" value="${atleta.apelido}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                </tr>
                
                    <td><input type="submit" name="btnConfirmar" value="Confirmar"></td>
            </table>
        </form>
    </body>
</html>
