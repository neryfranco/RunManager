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
import modelo.Corrida;
import modelo.Percurso;

/**
 *
 * @author Nery
 */
public class CorridaDAO {

    public static List<Corrida> obterCorridas() throws ClassNotFoundException {
        Connection conexao = null;
        Statement comando = null;
        List<Corrida> corridas = new ArrayList<Corrida>();
        try {
            conexao = BD.getConexao();
            comando = conexao.createStatement();
            ResultSet rs = comando.executeQuery("select * from Corrida");
            while (rs.next()) {
                Corrida corrida = new Corrida(rs.getInt("id"),
                        rs.getString("nome"),
                        null,
                        rs.getString("localLargada"),
                        rs.getString("localChegada"),
                        rs.getString("horaLargada"),
                        rs.getString("dataCorrida"),
                        rs.getString("dataRetiradaKit"),
                        rs.getString("localRetiradaKit"),
                        rs.getInt("duracaoLim"),
                        rs.getInt("numMaxInscritos"));
                /*
                ResultSet rs2 = comando.executeQuery("select * from List_Percurso");
                while(rs2.next()){
                    if(rs.getInt("id") == rs2.getInt("Corrida_id"))
                        corrida.addPercursoID(rs.getInt("Percurso_id"));
                }
                 */
                corridas.add(corrida);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            fecharConexao(conexao, comando);
        }
        return corridas;
    }

    public static void gravar(Corrida corrida) throws SQLException, ClassNotFoundException {
        Connection conexao = null;
        try {
            conexao = BD.getConexao();
            String sql = "insert into corrida (id, nome, localLargada, "
                    + "localChegada, horaLargada, dataCorrida, dataRetiradaKit, "
                    + "localRetiradaKit, duracaoLim, numMaxInscritos) values("
                    + corrida.getId() + ", '"
                    + corrida.getNome() + "', '"
                    + corrida.getLocalLargada() + "', '"
                    + corrida.getLocalChegada() + "', '"
                    + corrida.getHoraLargada() + "', '"
                    + corrida.getDataCorrida() + "', '"
                    + corrida.getDataRetiradaKit() + "', '"
                    + corrida.getLocalRetiradaKit() + "', "
                    + corrida.getDuracaoLimite() + ", "
                    + corrida.getNumMaxParticipantes() + ") ";
            PreparedStatement comando = conexao.prepareStatement(sql);
            comando.execute(sql);
            comando.close();
            conexao.close();
        } catch (SQLException e) {
        }
    }
public static void alterar(Corrida corrida) throws SQLException, ClassNotFoundException {
        Connection conexao = null;
        try {
            conexao = BD.getConexao();
            String sql = "update curso set nome = ?, localLargada = ?, localChegada = ?, horaLargada = ?, dataCorrida = ?, dataRetiradaKit = ?, localRetiradaKit = ?, duracaoLimite = ?, nuumMaxParticipantes = ?";
            PreparedStatement comando = conexao.prepareStatement(sql);
            comando.setString(1, corrida.getNome());
            comando.setString(2, corrida.getLocalLargada());
            comando.setString(3, corrida.getLocalChegada());
            comando.setString(4, corrida.getHoraLargada());
            comando.setString(6, corrida.getDataCorrida());
            comando.setString(7, corrida.getLocalRetiradaKit());
            comando.setInt(8, corrida.getDuracaoLimite());
            comando.setInt(9, corrida.getNumMaxParticipantes());
            comando.execute(sql);
            comando.close();
            conexao.close();
        }
        catch (SQLException e) {
        }
    }

    public static void excluir(Corrida corrida) throws SQLException, ClassNotFoundException {
        Connection conexao = null;
        Statement comando = null;
        String stringSQL;
        try {
            conexao = BD.getConexao();
            comando = conexao.createStatement();
            stringSQL = "delete from Corrida where id = " + corrida.getId();
            comando.execute(stringSQL);
        } catch (SQLException e) {
            throw e;

        } finally {
            fecharConexao(conexao, comando);
        }
    }

    public static Corrida obterCorrida(int id) throws ClassNotFoundException {
        Connection conexao = null;
        Statement comando = null;
        Corrida corrida = null;
        try {
            conexao = BD.getConexao();
            comando = conexao.createStatement();
            ResultSet rs = comando.executeQuery("select * from Corrida where id = " + id);
            rs.first();
            corrida = new Corrida(rs.getInt("id"),
                    rs.getString("nome"), null,
                    rs.getString("localLargada"),
                    rs.getString("localChegada"),
                    rs.getString("horaLargada"),
                    rs.getString("dataCorrida"),
                    rs.getString("dataRetiradaKit"),
                    rs.getString("localRetiradaKit"),
                    rs.getInt("duracaoLim"),
                    rs.getInt("numMaxInscritos"));
                    
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            fecharConexao(conexao, comando);
        }
       return corrida;  
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
