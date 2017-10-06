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
import modelo.Usuario;

/**
 *
 * @author Nery
 */
public class UsuarioDAO {
    
    public static List<Usuario> obterUsuarios() throws ClassNotFoundException{
        Connection conexao = null;
        Statement comando = null;
        List<Usuario> usuarios = new ArrayList<Usuario>();
        try{
            conexao = BD.getConexao();
            comando = conexao.createStatement();
            ResultSet rs = comando.executeQuery("select * from Usuario");
            while(rs.next()){
                Usuario usuario = new Usuario 
               (rs.getString("cpf"),
                rs.getString("nome"),
                rs.getString("dataNasc"),
                rs.getString("sexo"),
                rs.getString("tel_cel"),
                rs.getString("tel_res"),
                rs.getString("cep"),
                rs.getString("rua"),
                rs.getString("uf"),
                rs.getString("cidade"));
                usuarios.add(usuario);
            }
        } catch(SQLException e){
            e.printStackTrace();
        } finally{
            fecharConexao(conexao,comando);
        }
        return usuarios;
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
