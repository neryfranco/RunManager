<%-- 
    Document   : manterAtleta
    Created on : 18/10/2017, 16:56:19
    Author     : vicdo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="css.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manter Atleta</title>
    </head>
    <body id="principal">
        <h1>Manter Atleta - ${operacao}</h1>

        <form action="ManterAtletaController?acao=confirmar${operacao}" method="post" name="frmManterAtleta">
            <table>
                <tr>
                    <td>Cpf: </td> 
                    <td><input type="text" name="txtCpf" value="${atleta.cpf}" <c:if test="${operacao != 'Incluir'}"> readonly</c:if>></td>

                    </tr>
                    <tr>
                        <td>Email: </td> 
                        <td><input id="caixatexto" type="text" name="txtEmail" value="${atleta.email}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                    </tr>
                    <tr>
                        <td>Senha: </td> 
                        <td><input id="caixatexto" type="text" name="txtSenha" value="${atleta.senha}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                    </tr>
                    <tr>
                        <td>Apelido: </td> 
                        <td><input id="caixatexto" type="text" name="txtApelido" value="${atleta.apelido}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
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
                        <td><input type="radio" name="txtSexo" value="1" 
                            <c:if test="${atleta.sexo == '1'}"> checked</c:if>
                            <c:if test="${operacao == 'Excluir'}"> disabled </c:if>> Masculino </td>
                        <td><input type="radio" name="txtSexo" value="2" 
                            <c:if test="${atleta.sexo == '2'}"> checked</c:if>
                            <c:if test="${operacao == 'Excluir'}"> disabled </c:if>> Feminino </td>
                    </tr>
                    <tr>
                        <td>Telefone Celular: </td> 
                        <td><input id="caixatexto" type="text" name="txtTelCel" value="${organizador.apelido}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
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
