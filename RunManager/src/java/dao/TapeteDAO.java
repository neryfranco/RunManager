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
import modelo.Tapete;

/**
 *
 * @author Nery
 */
public class TapeteDAO {
    
    public static List<Tapete> obterTapetes() throws ClassNotFoundException{
        Connection conexao = null;
        Statement comando = null;
        List<Tapete> tapetes = new ArrayList<Tapete>();
        try{
            conexao = BD.getConexao();
            comando = conexao.createStatement();
            ResultSet rs = comando.executeQuery("select * from Tapete");
            while(rs.next()){
                Tapete tapete = new Tapete 
               (rs.getInt("id"),
                rs.getString("cep"),
                rs.getString("rua"),
                rs.getString("cidade"),
                rs.getString("uf"),
                rs.getString("referencia"));
                            
                tapetes.add(tapete);
            }
        } catch(SQLException e){
            e.printStackTrace();
        } finally{
            fecharConexao(conexao,comando);
        }
        return tapetes;
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
