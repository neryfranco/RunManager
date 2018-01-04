<%-- 
    Document   : index
    Created on : 10/10/2017, 09:13:13
    Author     : Nery
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css.css">
        <title>RunManager</title>
    </head>
    <body class="principal" background-image="img.jpg">
        <h2>Pesquisas: </h2>       
        
        <a href="PesquisaAdministradorController" class="link">Administrador</a>
        <a href="PesquisaOrganizadorController" class=" link">Organizador</a>
        <a href="PesquisaAtletaController"class="link">Atleta</a>
        <%-- <a href="PesquisaTapeteController">Tapete</a> --%>
        <a href="PesquisaCategoriaController" class="link">Categoria</a>
        <a href="PesquisaPercursoController" class="link">Percurso</a>
        <a href="PesquisaCorridaController" class="link">Corrida</a>
        <a href="PesquisaRankingController" class="link">Ranking</a>
        <%-- <a href="PesquisaChipController">Chip</a> --%>
        <a href="PesquisaLoteController" class="link">Lote</a>
        <a href="PesquisaInscricaoController" class="link">Inscrição</a>
        <a href="PesquisaPagamentoController" class="link">Pagamento</a>
    </body>
</html>
