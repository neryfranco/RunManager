/*
 * To change this license header, choose License HeadeselectAt in Project Properties.
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
            ResultSet selectAt = comando.executeQuery("select * from Atleta");
            while(selectAt.next()){
                ResultSet selectUs = comando.executeQuery("select * from Usuario where cpf = " + selectAt.getString("Usuario_cpf"));
                Atleta atleta = new Atleta 
               (selectAt.getString("email"),
                selectAt.getString("senha"), 
                selectUs.getString("cpf"),
                selectUs.getString("nome"),
                selectUs.getString("dataNasc"),
                selectUs.getInt("sexo"),
                selectUs.getString("tel_cel"),
                selectUs.getString("tel_res"),
                selectUs.getString("cep"),
                selectUs.getString("rua"),
                selectUs.getString("uf"),
                selectUs.getString("cidade"),
                selectAt.getString("apelido"));
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
