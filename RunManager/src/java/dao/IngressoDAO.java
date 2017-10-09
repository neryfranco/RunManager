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
import modelo.Ingresso;

/**
 *
 * @author Nery
 */
public class IngressoDAO {
    
    public static List<Ingresso> obterIngressos() throws ClassNotFoundException{
        Connection conexao = null;
        Statement comando = null;
        List<Ingresso> ingressos = new ArrayList<Ingresso>();
        try{
            conexao = BD.getConexao();
            comando = conexao.createStatement();
            ResultSet rs = comando.executeQuery("select * from Ingresso");
            while(rs.next()){
               Ingresso ingresso = new Ingresso (null, rs.getInt("num_inscricao"), null, null, null);
                ingresso.setAtleta_cpf(rs.getString("Atleta_Usuario_cpf"));
                ingresso.setKit_numPeito(rs.getInt("Kit_numPeito"));
                ingresso.setLote_id(rs.getInt("Lote_id"));
                ingressos.add(ingresso);
            }
        } catch(SQLException e){
            e.printStackTrace();
        } finally{
            fecharConexao(conexao,comando);
        }
        return ingressos;
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
