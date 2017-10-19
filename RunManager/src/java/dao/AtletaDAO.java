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
import modelo.Atleta;

/**
 *
 * @author Nery
 */
public class AtletaDAO {

    public static List<Atleta> obterAtletas() throws ClassNotFoundException {
        Connection conexao = null;
        Statement comando = null;
        List<Atleta> atletas = new ArrayList<Atleta>();
        try {
            conexao = BD.getConexao();
            comando = conexao.createStatement();
            ResultSet rs = comando.executeQuery("select * from Atleta, Usuario where Atleta.Usuario_cpf = Usuario.cpf");
            while (rs.next()) {
                Atleta atleta = new Atleta(rs.getString("email"),
                        rs.getString("senha"),
                        rs.getString("cpf"),
                        rs.getString("nome"),
                        rs.getString("dataNasc"),
                        rs.getString("sexo"),
                        rs.getString("tel_cel"),
                        rs.getString("tel_res"),
                        rs.getString("cep"),
                        rs.getString("rua"),
                        rs.getString("uf"),
                        rs.getString("cidade"),
                        rs.getString("apelido"));
                atletas.add(atleta);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            fecharConexao(conexao, comando);
        }
        return atletas;
    }

    public static void gravar(Atleta atleta) throws SQLException, ClassNotFoundException {
        Connection conexao = null;
        try {
            conexao = BD.getConexao();
            String sql = "insert into usuario (cpf, nome, dataNascimento, sexo, telCel, telRes, cep, rua, uf, cidade) "
                    + "values(?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement comando = conexao.prepareStatement(sql);
            comando.setString(1, atleta.getCpf());
            comando.setString(2, atleta.getNome());
            comando.setString(3, atleta.getDataNascimento());
            comando.setString(4, atleta.getSexo());
            comando.setString(5, atleta.getTelCel());
            comando.setString(6, atleta.getTelRes());
            comando.setString(7, atleta.getCep());
            comando.setString(8, atleta.getRua());
            comando.setString(9, atleta.getRua());
            comando.setString(10, atleta.getCidade());
            comando.execute(sql);
            
            sql = "insert into atleta (email, senha, pace, apelido) "
                    + "values(?,?,?,?)";
            comando = conexao.prepareStatement(sql);
            comando.setString(1, atleta.getEmail());
            comando.setString(2, atleta.getSenha());
            comando.setDouble(3, atleta.getPace());
            comando.setString(4, atleta.getApelido());
            comando.execute(sql);
            
            comando.close();
            conexao.close();
        }
        catch (SQLException e) {
        }

    }

    public static void alterar(Atleta atleta) throws SQLException, ClassNotFoundException {
        Connection conexao = null;
        try {
            conexao = BD.getConexao();
            String sql = "update curso set cpf = ?, nome = ?, dataNascimento = ?, sexo = ?, telCel = ?, telRes = ?, cep = ?, rua = ?, uf = ?, cidade = ?";
            PreparedStatement comando = conexao.prepareStatement(sql);
            comando.setString(1, atleta.getNome());
            comando.setString(2, atleta.getDataNascimento());
            comando.setString(3, atleta.getSexo());
            comando.setString(4, atleta.getTelCel());
            comando.setString(5, atleta.getTelRes());
            comando.setString(6, atleta.getCep());
            comando.setString(7, atleta.getRua());
            comando.setString(8, atleta.getRua());
            comando.setString(9, atleta.getCidade());
            comando.execute(sql);
            comando.close();
            conexao.close();
        }
        catch (SQLException e) {
        }
    }

    public static void excluir(Atleta atleta) throws SQLException, ClassNotFoundException {
        Connection conexao = null;
        Statement comando = null;
        String stringSQL;
        try {
            conexao = BD.getConexao();
            comando = conexao.createStatement();
            stringSQL = "delete from curso where email = " + atleta.getEmail();
            comando.execute(stringSQL);
        } catch (SQLException e) {
            throw e;

        } finally {
            fecharConexao(conexao, comando);
        }
    }

    public static Atleta obterAtleta(String email) throws ClassNotFoundException {
        Connection conexao = null;
        Statement comando = null;
        Atleta atleta = null;
        try {
            conexao = BD.getConexao();
            comando = conexao.createStatement();
            ResultSet rs = comando.executeQuery("select * from Atleta where email = " + email);
            rs.first();
            atleta = new Atleta(rs.getString("email"),
                    rs.getString("senha"),
                    rs.getString("cpf"),
                    rs.getString("nome"),
                    rs.getString("dataNasc"),
                    rs.getString("sexo"),
                    rs.getString("tel_cel"),
                    rs.getString("tel_res"),
                    rs.getString("cep"),
                    rs.getString("rua"),
                    rs.getString("uf"),
                    rs.getString("cidade"),
                    rs.getString("apelido"));
                    
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            fecharConexao(conexao, comando);
        }
       return atleta;  
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
