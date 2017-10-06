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
import modelo.Chip;

/**
 *
 * @author Nery
 */
public class ChipDAO {
    
    public static List<Chip> obterChips() throws ClassNotFoundException{
        Connection conexao = null;
        Statement comando = null;
        List<Chip> chips = new ArrayList<Chip>();
        try{
            conexao = BD.getConexao();
            comando = conexao.createStatement();
            ResultSet rs = comando.executeQuery("select * from Chip");
            while(rs.next()){
                Chip chip = new Chip 
               (rs.getInt("numero"),
                rs.getInt("tempoCorrida"),
                null);
                
                chip.setKit_id(rs.getInt("Kit_numPeito"));
                chip.setPercurso_id(rs.getInt("Percurso_id"));
                chips.add(chip);
            }
        } catch(SQLException e){
            e.printStackTrace();
        } finally{
            fecharConexao(conexao,comando);
        }
        return chips;
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
