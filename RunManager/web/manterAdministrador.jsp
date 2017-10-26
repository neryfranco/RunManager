<%-- 
    Document   : manterAdministrador
    Created on : 26/10/2017, 10:03:07
    Author     : Nery
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manter Administrador</title>
    </head>
    <body>
        <h1>Manter Administrador - ${operacao}</h1>

        <form action="ManterAdministradorController?acao=confirmar${operacao}" method="post" name="frmManterAdministrador" onsubmit="return validarFormulario(this)">
            <table>
                <tr>
                    <td>Email: </td> 
                    <td><input type="text" name="txtEmail" value="${administrador.email}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                </tr>
                <tr>
                    <td>Senha: </td> 
                    <td><input type="text" name="txtSenha" value="${administrador.senha}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                </tr>
                <tr>
                    <td>Apelido: </td> 
                    <td><input type="text" name="txtApelido" value="${administrador.apelido}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                </tr>
                
                    <td><input type="submit" name="btnConfirmar" value="Confirmar"></td>
            </table>
        </form>
    </body>
</html>
