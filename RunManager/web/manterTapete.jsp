<%-- 
    Document   : manterTapete
    Created on : 17/10/2017, 09:47:12
    Author     : Nery
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="css.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manter Tapete</title>
    </head>
    <body>
        <h1>Manter Tapete - ${operacao}</h1>

        <form action="ManterTapeteController?acao=confirmar${operacao}" method="post" name="frmManterTapete" onsubmit="return validarFormulario(this)">
            <table>
                <tr>
                    <td>ID: </td> 
                    <td><input type="text" name="txtID" value="${tapete.id}" <c:if test="${operacao != 'Incluir'}"> readonly</c:if>></td>
                </tr>
                <tr>
                    <td>CEP: </td> 
                    <td><input type="text" name="txtCEP" value="${tapete.cep}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                </tr>
                <tr>
                    <td>Rua: </td> 
                    <td><input type="text" name="txtRua" value="${tapete.rua}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                </tr>
                <tr>
                    <td>Cidade: </td> 
                    <td><input type="text" name="txtCidade" value="${tapete.cidade}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                </tr>
                <tr>
                    <td>UF: </td> 
                    <td><input type="text" name="txtUF" value="${tapete.uf}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                </tr>
                <tr>
                    <td>Refência: </td> 
                    <td><input type="text" name="txtReferencia" value="${tapete.referencia}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                </tr>                   
            </table>
            <input id="botao" type="submit" name="btnConfirmar" value="Confirmar">
        </form>
                
        <SCRIPT language="JavaScript">
            <!--
            
            function campoNumerico(valor)
            {
                var caracteresValidos = "0123456789";
                var ehNumero = true;
                var umCaracter;
                for (i = 0; i < valor.length && ehNumero == true; i++) 
                { 
                    umCaracter = valor.charAt(i); 
                    if (caracteresValidos.indexOf(umCaracter) == -1) 
                    {
                        ehNumero = false;
                    }
                }
                return ehNumero;
            }

            function validarFormulario(form) { 
                var mensagem;
                mensagem = "";
                if (form.txtCodTapete.value == ""){
                    mensagem = mensagem + "Informe o Código do Tapete\n";
                }                             
                if (form.txtNomeTapete.value == ""){
                    mensagem = mensagem + "Informe o Nome do Tapete\n";
                }             
                if (form.txtTotalPeriodos.value == ""){
                    mensagem = mensagem + "Informe o Total de Períodos\n";
                }                  
                if (form.txtCargaHoraria.value == ""){
                    mensagem = mensagem + "Informe a Carga Horária\n";
                }                  
                if (!campoNumerico(form.txtCodTapete.value)){
                    mensagem = mensagem + "Código do Tapete deve ser numérico\n";
                }                  
                if (!campoNumerico(form.txtTotalPeriodos.value)){
                    mensagem = mensagem + "Total de Períodos deve ser numérico\n";
                }                  
                if (!campoNumerico(form.txtCargaHoraria.value)){
                    mensagem = mensagem + "Carga Horária deve ser numérica\n";
                }                  
                if (mensagem == ""){
                    return true;
                }else{
                    alert(mensagem);
                    return false;
                }                
            } 
            //-->
        </SCRIPT>        
    </body>
</html>