/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import modelo.Categoria;

/**
 *
 * @author Nery
 */
public class CategoriaDAO {
    
    public static List<Categoria> obterCategorias() throws ClassNotFoundException{
        Connection conexao = null;
        Statement comando = null;
        List<Categoria> categorias = new ArrayList<Categoria>();
        try{
            conexao = BD.getConexao();
            comando = conexao.createStatement();
            ResultSet rs = comando.executeQuery("select * from Categoria");
            while(rs.next()){
               Categoria categoria = new Categoria 
               (rs.getInt("id"),
                rs.getString("sexo"), 
                rs.getInt("idadeIni"),
                rs.getInt("idadeFim"),
                rs.getString("descricao"));
                categorias.add(categoria);
            }
        } catch(SQLException e){
            e.printStackTrace();
        } finally{
            fecharConexao(conexao,comando);
        }
        return categorias;
    }
    
    public static void fecharConexao(Connection conexao ,Statement comando){
        try{
            if (comando != null)
                comando.close();
            if (conexao != null)
                conexao.close();
        }
        catch (SQLException e){}
    }
}
