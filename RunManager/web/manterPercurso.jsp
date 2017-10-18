<%-- 
    Document   : manterPercurso
    Created on : 17/10/2017, 09:29:21
    Author     : Nery
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manter Percurso</title>
    </head>
    <body>
        <h1>Manter Percurso - ${operacao}</h1>

        <form action="ManterPercursoController?acao=confirmar${operacao}" method="post" name="frmManterPercurso" onsubmit="return validarFormulario(this)">
            <table>
                <tr>
                    <td>Itinerário:</td> 
                    <td><textarea type="text" rows="5" name="txtItinerario" value="${percurso.itinerario}" <c:if test="${operacao != 'Excluir'}"> readonly</c:if>></textarea></td>
                </tr>
                <tr>
                    <td>Distância (km):</td> 
                    <td><input type="text" name="txtDistancia" value="${percurso.distancia}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                </tr>
                    <td>Categoria:</td> 
                    <td>
                        <select name="optCategoria" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                            <option value="0" <c:if test="${percurso.categoria.id == null}"> selected</c:if>> </option>  
                            <c:forEach items="${categorias}" var="categoria">
                                <option value="${categoria.descricao}" <c:if test="${percurso.categoria.id == categoria.id}"> selected</c:if>>${categoria.descricao}</option>  
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                    <td><input type="submit" name="btnConfirmar" value="Confirmar"></td>
                </tr>
            </table>
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
                if (form.txtCodPercurso.value == ""){
                    mensagem = mensagem + "Informe o Código do Percurso\n";
                }                             
                if (form.txtNomePercurso.value == ""){
                    mensagem = mensagem + "Informe o Nome do Percurso\n";
                }             
                if (form.txtTotalPeriodos.value == ""){
                    mensagem = mensagem + "Informe o Total de Períodos\n";
                }                  
                if (form.txtCargaHoraria.value == ""){
                    mensagem = mensagem + "Informe a Carga Horária\n";
                }                  
                if (!campoNumerico(form.txtCodPercurso.value)){
                    mensagem = mensagem + "Código do Percurso deve ser numérico\n";
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

