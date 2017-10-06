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
import modelo.Percurso;

/**
 *
 * @author Nery
 */
public class PercursoDAO {
    public static List<Percurso> obterPercursos() throws ClassNotFoundException{
        Connection conexao = null;
        Statement comando = null;
        List<Percurso> percursos = new ArrayList<Percurso>();
        try{
            conexao = BD.getConexao();
            comando = conexao.createStatement();
            ResultSet rs = comando.executeQuery("select * from Percurso");
            while(rs.next()){
                Percurso percurso = new Percurso 
                (null,
                rs.getString("itinerario"),
                rs.getInt("distancia"),
                null);
                
                percurso.setCategoria_id(rs.getInt("Categoria_id"));
                ResultSet rs2 = comando.executeQuery("select * from Percurso, List_Tapetes where Percurso.id = Tapete.id");
                while(rs2.next()){
                    percurso.addTapeteID(rs.getInt("Tapete_id"));
                }
                percursos.add(percurso);
            }
        } catch(SQLException e){
            e.printStackTrace();
        } finally{
            fecharConexao(conexao,comando);
        }
        return percursos;
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
