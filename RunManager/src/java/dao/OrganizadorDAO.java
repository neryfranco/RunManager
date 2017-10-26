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
import modelo.Organizador;
import modelo.Usuario;

/**
 *
 * @author Nery
 */
public class OrganizadorDAO {

    public static List<Organizador> obterOrganizadores() throws ClassNotFoundException {
        Connection conexao = null;
        Statement comando = null;
        List<Organizador> organizadores = new ArrayList<Organizador>();
        try {
            conexao = BD.getConexao();
            comando = conexao.createStatement();
            ResultSet rs = comando.executeQuery("select * from Organizador");
            while (rs.next()) {
                Organizador organizador = new Organizador(rs.getString("email"),
                        rs.getString("senha"),
                        rs.getString("cpf"),
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
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        } finally{
            fecharConexao(conexao,comando);
        }
        return organizadores;
    }

    public static void gravar(Organizador organizador) throws SQLException, ClassNotFoundException {
        Connection conexao = null;
        try {
            conexao = BD.getConexao();
            String sql = "insert into organizador (cpf, nome, dataNascimento, sexo, telCel, telRes, cep, rua, uf, cidade) "
                    + "values(?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement comando = conexao.prepareStatement(sql);
            comando.setString(1, organizador.getCpf());
            comando.setString(2, organizador.getNome());
            comando.setString(3, organizador.getDataNascimento());
            comando.setInt(4, organizador.getSexo());
            comando.setString(5, organizador.getTelCel());
            comando.setString(6, organizador.getTelRes());
            comando.setString(7, organizador.getCep());
            comando.setString(8, organizador.getRua());
            comando.setString(9, organizador.getRua());
            comando.setString(10, organizador.getCidade());
            comando.execute(sql);

            sql = "insert into organizador (email, senha, pace, apelido) "
                    + "values(?,?,?,?)";
            comando = conexao.prepareStatement(sql);
            comando.setString(1, organizador.getEmail());
            comando.setString(2, organizador.getSenha());
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
