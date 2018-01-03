<%-- 
    Document   : login
    Created on : 03/01/2018, 14:49:06
    Author     : vicdo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <label for="email">Email:</label>
        <input type="email" placeholder="email@gmail.com" id="email" name="email" >
        <label for="senha">Senha:</label>
        <input type="password" required class="form-control" placeholder="******" id="senha" name="senha">

        <label><input type="radio" name="optUsuario" value="administrador">Administrador</label>


        <label><input type="radio" name="optUsuario" value="organizador" >Organizador</label>


        <label><input type="radio" name="optUsuario" checked="checked" value="atleta">Atleta</label>

    </body>
</html>
