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
import modelo.Administrador;
import modelo.Organizador;

/**
 *
 * @author Nery
 */
public class AdministradorDAO {

    public static List<Administrador> obterAdministradores() throws ClassNotFoundException {
        Connection conexao = null;
        Statement comando = null;
        List<Administrador> administradores = new ArrayList<Administrador>();
        try {
            conexao = BD.getConexao();
            comando = conexao.createStatement();
            ResultSet rs = comando.executeQuery("select * from Administrador, Usuario where Administrador.Usuario_cpf = Usuario.cpf");
            while (rs.next()) {
                Administrador administrador = new Administrador(rs.getString("email"),
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
                administradores.add(administrador);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            fecharConexao(conexao, comando);
        }
        return administradores;
    }

    public static void gravar(Administrador administrador) throws SQLException, ClassNotFoundException {
        Connection conexao = null;
        try {
            conexao = BD.getConexao();
            String sql = "insert into administrador (cpf, nome, dataNascimento, sexo, telCel, telRes, cep, rua, uf, cidade) "
                    + "values(?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement comando = conexao.prepareStatement(sql);
            comando.setString(1, administrador.getCpf());
            comando.setString(2, administrador.getNome());
            comando.setString(3, administrador.getDataNascimento());
            comando.setInt(4, administrador.getSexo());
            comando.setString(5, administrador.getTelCel());
            comando.setString(6, administrador.getTelRes());
            comando.setString(7, administrador.getCep());
            comando.setString(8, administrador.getRua());
            comando.setString(9, administrador.getRua());
            comando.setString(10, administrador.getCidade());
            comando.execute(sql);

            sql = "insert into administrador (email, senha, pace, apelido) "
                    + "values(?,?,?,?)";
            comando = conexao.prepareStatement(sql);
            comando.setString(1, administrador.getEmail());
            comando.setString(2, administrador.getSenha());
            comando.execute(sql);

            comando.close();
            conexao.close();
        } catch (SQLException e) {
        }
    }
    
     public static void excluir(Administrador administrador) throws SQLException, ClassNotFoundException {
        Connection conexao = null;
        Statement comando = null;
        String stringSQL;
        try {
            conexao = BD.getConexao();
            comando = conexao.createStatement();
            stringSQL = "delete from curso where email = " + administrador.getEmail();
            comando.execute(stringSQL);
        } catch (SQLException e) {
            throw e;

        } finally {
            fecharConexao(conexao, comando);
        }
    }

    public static Administrador obterAdministrador(String email) throws ClassNotFoundException {
        Connection conexao = null;
        Statement comando = null;
        Administrador administrador = null;
        try {
            conexao = BD.getConexao();
            comando = conexao.createStatement();
            ResultSet rs = comando.executeQuery("select * from Administrador where email = " + email);
            rs.first();
            administrador = new Administrador(rs.getString("email"),
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
                    
                    
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            fecharConexao(conexao, comando);
        }
       return administrador;  
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
