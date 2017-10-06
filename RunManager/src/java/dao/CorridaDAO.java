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
import modelo.Corrida;

/**
 *
 * @author Nery
 */
public class CorridaDAO {
    
    public static List<Corrida> obterCorridas() throws ClassNotFoundException{
        Connection conexao = null;
        Statement comando = null;
        List<Corrida> corridas = new ArrayList<Corrida>();
        try{
            conexao = BD.getConexao();
            comando = conexao.createStatement();
            ResultSet rs = comando.executeQuery("select * from Corrida");
            while(rs.next()){
                Corrida corrida = new Corrida 
               (rs.getString("nome"),
                null,
                rs.getString("localLargada"), 
                rs.getString("horaLargada"),
                rs.getString("dataCorrida"),
                rs.getString("dataRetiradaKit"),
                rs.getString("localRetiradaKit"),
                rs.getInt("duracaoLim"),
                rs.getInt("numMaxInscritos"));
                
                ResultSet rs2 = comando.executeQuery("select * from Corrida, List_Percurso where Corrida.id = Percurso.id");
                while(rs2.next()){
                    corrida.addPercursoID(rs.getInt("Percurso_id"));
                }
                corridas.add(corrida);
            }
        } catch(SQLException e){
            e.printStackTrace();
        } finally{
            fecharConexao(conexao,comando);
        }
        return corridas;
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
