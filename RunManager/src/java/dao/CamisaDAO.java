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
import modelo.Camisa;

/**
 *
 * @author Nery
 */
public class CamisaDAO {

    public static List<Camisa> obterCamisas() throws ClassNotFoundException {
        Connection conexao = null;
        Statement comando = null;
        List<Camisa> camisas = new ArrayList<Camisa>();
        try {
            conexao = BD.getConexao();
            comando = conexao.createStatement();
            ResultSet rs = comando.executeQuery("select * from Camisa");
            while (rs.next()) {
                Camisa camisa = new Camisa(rs.getString("tamanho"), null);
                camisas.add(camisa);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            fecharConexao(conexao, comando);
        }
        return camisas;
    }

    public static void gravar(Camisa camisa) throws SQLException, ClassNotFoundException {
        Connection conexao = null;
        try {
            conexao = BD.getConexao();
            String sql = "insert into camisa (tamanho, kit)"
                    + "values(?,?)";
            PreparedStatement comando = conexao.prepareStatement(sql);
            comando.setString(1, camisa.getTamanho());
            comando.setObject(2, camisa.getKit());
            comando.execute(sql);
            comando.close();
            conexao.close();
        } catch (SQLException e) {
        }
    }

    public static void fecharConexao(Connection conexao, Statement comando) {
        try {
            if (comando != null) {
                comando.close();
            }
            if (conexao != null) {
                conexao.close();
            }
        } catch (SQLException e) {
        }
    }
}
