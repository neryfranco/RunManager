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
        <link rel="stylesheet" type="text/css" href="css.css">
        <title>Manter Administrador</title>
    </head>
    <body id="principal">
        <h1>Manter Administrador - ${operacao}</h1>

        <form action="ManterAdministradorController?acao=confirmar${operacao}" method="post" name="frmManterAdministrador" onsubmit="return validarFormulario(this)">
            <table>
                <tr>
                    <td>Email: </td> 
                    <td><input id="caixatexto" type="text" name="txtEmail" value="${administrador.email}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                </tr>
                <tr>
                    <td>Senha: </td> 
                    <td><input id="caixatexto" type="text" name="txtSenha" value="${administrador.senha}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                </tr>
                <tr>
                    <td>Nome: </td> 
                    <td><input id="caixatexto" type="text" name="txtNome" value="${organizador.apelido}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                </tr>
                <tr>
                    <td>Data Nascimento: </td> 
                    <td><input id="caixatexto" type="text" name="txtDataNascimento" value="${organizador.apelido}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                </tr>
                <tr>
                    <td>Sexo: </td> 
                    <td><input type="text" name="txtSexo" value="${organizador.apelido}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                </tr>
                <tr>
                    <td>Telefone Celular: </td> 
                    <td><input  id="caixatexto" type="text" name="txtTelCel" value="${organizador.apelido}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                </tr>
                <tr>
                    <td>Telefone Residencial: </td> 
                    <td><input id="caixatexto" type="text" name="txtTelRes" value="${organizador.apelido}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                </tr>
                <tr>
                    <td>Cep: </td> 
                    <td><input id="caixatexto" type="text" name="txtCep" value="${organizador.apelido}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                </tr>
                <tr>
                    <td>Rua: </td> 
                    <td><input id="caixatexto" type="text" name="txtRua" value="${organizador.apelido}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                </tr>
                <tr>
                    <td>UF: </td> 
                    <td><input id="caixatexto" type="text" name="txtUf" value="${organizador.apelido}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                </tr>
                <tr>
                    <td>Cidade: </td> 
                    <td><input id="caixatexto" type="text" name="txtCidade" value="${organizador.apelido}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                </tr>
            </table>
            <input id="botao" type="submit" name="btnConfirmar" value="Confirmar">    
        </form>
    </body>    
</html>
