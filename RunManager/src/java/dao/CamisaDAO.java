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
import modelo.Camisa;

/**
 *
 * @author Nery
 */
public class CamisaDAO {
    
    public static List<Camisa> obterCamisas() throws ClassNotFoundException{
        Connection conexao = null;
        Statement comando = null;
        List<Camisa> camisas = new ArrayList<Camisa>();
        try{
            conexao = BD.getConexao();
            comando = conexao.createStatement();
            ResultSet rs = comando.executeQuery("select * from Camisa");
            while(rs.next()){
               Camisa camisa = new Camisa 
               (rs.getString("tamanho"),null);
                camisas.add(camisa);
            }
        } catch(SQLException e){
            e.printStackTrace();
        } finally{
            fecharConexao(conexao,comando);
        }
        return camisas;
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
