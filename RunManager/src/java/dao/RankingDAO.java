/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
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
                Ranking ranking = new Ranking (rs.getInt("id"),null,null);                
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
    
//    public static void gravar(Ranking ranking) throws SQLException, ClassNotFoundException {
//        Connection conexao = null;
//        try {
//            conexao = BD.getConexao();
//            String sql = "insert into ranking (corrida, categoria, corridaId, categoriaId) "
//                    + "values(?,?,?,?)";
//            PreparedStatement comando = conexao.prepareStatement(sql);
//            comando.setString(1, ranking.getCorrida());
//            comando.setString(2, ranking.getNome());
//            comando.setString(3, ranking.getDataNascimento());
//            comando.setString(4, ranking.getSexo());
//            comando.setString(5, ranking.getTelCel());
//            comando.setString(6, ranking.getTelRes());
//            comando.setString(7, ranking.getCep());
//            comando.setString(8, ranking.getRua());
//            comando.setString(9, ranking.getRua());
//            comando.setString(10, ranking.getCidade());
//            comando.execute(sql);
//            comando.close();
//            conexao.close();
//        } catch (SQLException e) {
//        }
//    }
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
