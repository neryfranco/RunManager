<%-- 
    Document   : manterOrganizador
    Created on : 26/10/2017, 09:58:47
    Author     : Nery
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
                    <td>Email: </td> 
                    <td><input type="text" name="txtEmail" value="${organizador.email}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                </tr>
                <tr>
                    <td>Senha: </td> 
                    <td><input type="text" name="txtSenha" value="${organizador.senha}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                </tr>               
                 <tr>
                    <td>Cpf: </td> 
                    <td><input type="text" name="txtCpf" value="${organizador.apelido}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                </tr>
                <tr>
                    <td>Nome: </td> 
                    <td><input type="text" name="txtNome" value="${organizador.apelido}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                </tr>
                <tr>
                    <td>Data Nascimento: </td> 
                    <td><input type="text" name="txtDataNascimento" value="${organizador.apelido}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                </tr>
                <tr>
                    <td>Sexo: </td> 
                    <td><input type="text" name="txtSexo" value="${organizador.apelido}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                </tr>
                <tr>
                    <td>Telefone Celular: </td> 
                    <td><input type="text" name="txtTelCel" value="${organizador.apelido}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                </tr>
                <tr>
                    <td>Telefone Residencial: </td> 
                    <td><input type="text" name="txtTelRes" value="${organizador.apelido}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                </tr>
                <tr>
                    <td>Cep: </td> 
                    <td><input type="text" name="txtCep" value="${organizador.apelido}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                </tr>
                <tr>
                    <td>Rua: </td> 
                    <td><input type="text" name="txtRua" value="${organizador.apelido}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                </tr>
                <tr>
                    <td>UF: </td> 
                    <td><input type="text" name="txtUf" value="${organizador.apelido}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                </tr>
                <tr>
                    <td>Cidade: </td> 
                    <td><input type="text" name="txtCidade" value="${organizador.apelido}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                </tr>
                
                    <td><input type="submit" name="btnConfirmar" value="Confirmar"></td>
            </table>
        </form>
    </body>
</html>
