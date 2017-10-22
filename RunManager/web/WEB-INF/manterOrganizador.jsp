<%-- 
    Document   : manterOrganizador
    Created on : 19/10/2017, 08:15:30
    Author     : vicdo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manter Organizador</title>
    </head>
    <body>
        <h1>Manter Organizador - ${operacao}</h1>

        <form action="ManterOrganizadorController?acao=confirmar${operacao}" method="post" name="frmManterOrganizador" onsubmit="return validarFormulario(this)">
            <table>
                <tr>
                    <td>Nome: </td> 
                    <td><input type="text" name="txtNome" value="${organizador.nome}" <c:if test="${operacao != 'Excluir'}"> readonly</c:if>></td>
                </tr>
                <tr>
                    <td>Email: </td> 
                    <td><input type="text" name="txtEmail" value="${organizador.email}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                </tr>
                <tr>
                    <td>Telefone:  </td> 
                    <td><input type="text" name="txtTelefone" value="${organizador.telefone}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                </tr>

                <td><input type="submit" name="btnConfirmar" value="Confirmar"></td>
            </table>
        </form>
    </body>
</html>
