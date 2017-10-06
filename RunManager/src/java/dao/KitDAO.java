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
import modelo.Kit;

/**
 *
 * @author Nery
 */
public class KitDAO {
    
    public static List<Kit> obterKits() throws ClassNotFoundException{
        Connection conexao = null;
        Statement comando = null;
        List<Kit> kits = new ArrayList<Kit>();
        try{
            conexao = BD.getConexao();
            comando = conexao.createStatement();
            ResultSet rs = comando.executeQuery("select * from Kit");
            while(rs.next()){
               Kit kit = new Kit (rs.getInt("numPeito"),null,null);
               kit.setCamisa_id(rs.getInt("Camisa_id"));
               kit.setChip_num(rs.getInt("Chip_numero"));
               kits.add(kit);
            }
        } catch(SQLException e){
            e.printStackTrace();
        } finally{
            fecharConexao(conexao,comando);
        }
        return kits;
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
