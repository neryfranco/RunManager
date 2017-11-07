/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import static dao.AtletaDAO.fecharConexao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import modelo.Atleta;
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
                rs.getString("idadeIni"),
                rs.getString("idadeFim"),
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

    public static void gravar(Categoria categoria) throws SQLException, ClassNotFoundException {
        Connection conexao = null;
        try {
            conexao = BD.getConexao();
            String sql = "insert into categoria (id, sexo, idadeIni, idadeFim, descricao) "
                    + "values(?,?,?,?,?)";
            PreparedStatement comando = conexao.prepareStatement(sql);
            comando.setInt(1, categoria.getId());
            comando.setString(2, categoria.getSexo());
            comando.setString(3, categoria.getIdadeIni());
            comando.setString(4, categoria.getIdadeFim());
            comando.setString(5, categoria.getDescricao());
            comando.execute(sql);
            comando.close();
            conexao.close();
        } catch (SQLException e) {
        }
    }
    public static void excluir(Categoria categoria) throws SQLException, ClassNotFoundException {
        Connection conexao = null;
        Statement comando = null;
        String stringSQL;
        try {
            conexao = BD.getConexao();
            comando = conexao.createStatement();
            stringSQL = "delete from curso where email = " + categoria.getId();
            comando.execute(stringSQL);
        } catch (SQLException e) {
            throw e;

        } finally {
            fecharConexao(conexao, comando);
        }
    }

    public static Categoria obterCategoria(int id) throws ClassNotFoundException {
        Connection conexao = null;
        Statement comando = null;
        Categoria categoria = null;
        try {
            conexao = BD.getConexao();
            comando = conexao.createStatement();
            ResultSet rs = comando.executeQuery("select * from Categoria where id = " + id);
            rs.first();
            categoria = new Categoria(rs.getInt("id"),
                    rs.getString("sexo"),
                    rs.getString("idadeIni"),
                    rs.getString("idadeFim"),
                    rs.getString("descricao"));
                 
                    
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            fecharConexao(conexao, comando);
        }
       return categoria;  
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
