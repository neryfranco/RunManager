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
import modelo.Atleta;

/**
 *
 * @author Nery
 */
public class AtletaDAO {
    
    public static List<Atleta> obterAtletas() throws ClassNotFoundException{
        Connection conexao = null;
        Statement comando = null;
        List<Atleta> atletas = new ArrayList<Atleta>();
        try{
            conexao = BD.getConexao();
            comando = conexao.createStatement();
            ResultSet rs = comando.executeQuery("select * from Atleta, Usuario where Atleta.Usuario_cpf = Usuario.cpf");
            while(rs.next()){
               Atleta atleta = new Atleta 
               (rs.getString("email"),
                rs.getString("senha"), 
                rs.getString("cpf"),
                rs.getString("nome"),
                rs.getString("dataNasc"),
                rs.getString("sexo"),
                rs.getString("tel_cel"),
                rs.getString("tel_res"),
                rs.getString("cep"),
                rs.getString("rua"),
                rs.getString("uf"),
                rs.getString("cidade"),
                rs.getString("apelido"));
                atletas.add(atleta);
            }
        } catch(SQLException e){
            e.printStackTrace();
        } finally{
            fecharConexao(conexao,comando);
        }
        return atletas;
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
