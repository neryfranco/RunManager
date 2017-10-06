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
import modelo.Ranking;

/**
 *
 * @author Nery
 */
public class RankingDAO {
    
    public static List<Ranking> obterRankings() throws ClassNotFoundException{
        Connection conexao = null;
        Statement comando = null;
        List<Ranking> rankings = new ArrayList<Ranking>();
        try{
            conexao = BD.getConexao();
            comando = conexao.createStatement();
            ResultSet rs = comando.executeQuery("select * from Ranking");
            while(rs.next()){
                Ranking ranking = new Ranking (null,null);
                
                ranking.setCorrida_id(rs.getInt("Corrida_id"));
                ranking.setCategoria_id(rs.getInt("Categoria_id"));
                rankings.add(ranking);
            }
        } catch(SQLException e){
            e.printStackTrace();
        } finally{
            fecharConexao(conexao,comando);
        }
        return rankings;
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
