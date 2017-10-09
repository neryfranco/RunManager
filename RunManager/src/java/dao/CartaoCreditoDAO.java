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
import modelo.CartaoCredito;

/**
 *
 * @author Nery
 */
public class CartaoCreditoDAO {
    
    public static List<CartaoCredito> obterCartaoCreditos() throws ClassNotFoundException{
        Connection conexao = null;
        Statement comando = null;
        List<CartaoCredito> cartoes = new ArrayList<CartaoCredito>();
        try{
            conexao = BD.getConexao();
            comando = conexao.createStatement();
            ResultSet rs = comando.executeQuery("select * from CartaoCredito");
            while(rs.next()){
               CartaoCredito cartao = new CartaoCredito 
               (rs.getString("numero"),
                rs.getString("bandeira"), 
                rs.getString("nomeTitular"),
                rs.getString("cpfTitular"),
                rs.getString("dataValidade"),
                rs.getString("codSeguranca"),
                rs.getInt("numParcelas"),
                rs.getDouble("valorParcelas"),
                null);
                cartao.setPagamento_id(rs.getInt("Pagamento_id"));
                cartoes.add(cartao);
            }
        } catch(SQLException e){
            e.printStackTrace();
        } finally{
            fecharConexao(conexao,comando);
        }
        return cartoes;
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
