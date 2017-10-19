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
import modelo.Organizador;


/**
 *
 * @author Nery
 */
public class OrganizadorDAO {
    
    public static List<Organizador> obterOrganizadores() throws ClassNotFoundException{
        Connection conexao = null;
        Statement comando = null;
        List<Organizador> organizadores = new ArrayList<Organizador>();
        try{
            conexao = BD.getConexao();
            comando = conexao.createStatement();
            ResultSet rs = comando.executeQuery("select * from Usuario where cpf = ");
            while(rs.next()){
                Organizador organizador = new Organizador 
               (rs.getString("email"),
                rs.getString("senha"), 
                rs.getString("Usuario_cpf"),
                rs.getString("nome"),
                rs.getString("dataNasc"),
                rs.getInt("sexo"),
                rs.getString("tel_cel"),
                rs.getString("tel_res"),
                rs.getString("cep"),
                rs.getString("rua"),
                rs.getString("uf"),
                rs.getString("cidade"));
                organizadores.add(organizador);
            }
        } catch(SQLException e){
            e.printStackTrace();
            System.out.println(e.getMessage());
        } finally{
            fecharConexao(conexao,comando);
        }
        return organizadores;
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
