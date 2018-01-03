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
        <title>RunManager</title>
    </head>
    <body>
        <h2>Pesquisas: </h2>
        <a href="PesquisaAdministradorController">Administrador</a>
        <a href="PesquisaOrganizadorController">Organizador</a>
        <a href="PesquisaAtletaController">Atleta</a>
        <%-- <a href="PesquisaTapeteController">Tapete</a> --%>
        <a href="PesquisaCategoriaController">Categoria</a>
        <a href="PesquisaPercursoController">Percurso</a>
        <a href="PesquisaCorridaController">Corrida</a>
        <a href="PesquisaRankingController">Ranking</a>
        <%-- <a href="PesquisaChipController">Chip</a> --%>
        <a href="PesquisaLoteController">Lote</a>
        <a href="PesquisaInscricaoController">Inscrição</a>
        <a href="PesquisaPagamentoController">Pagamento</a>
        <div>
            <form action="LoginController?acao=logar" method="post" name="frmManterAtleta">
            <label for="email">Email:</label>
            <input type="email" placeholder="email@gmail.com" id="email" name="email" >
            <label for="senha">Senha:</label>
            <input type="password" required class="form-control" placeholder="******" id="senha" name="senha">
            <label><input type="radio" name="optUsuario" value="administrador">Administrador</label>
            <label><input type="radio" name="optUsuario" value="organizador" >Organizador</label>
            <label><input type="radio" name="optUsuario" checked="checked" value="atleta">Atleta</label>
            <button type="submit">Entrar</button>
            </form>
        </div>
    </body>
</html>
