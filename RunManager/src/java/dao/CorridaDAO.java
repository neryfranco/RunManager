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
            String sql = "insert into corrida (id, nome, percursos, localLargada, )"
                    + "(localChegada, horaLargada, dataCorrida, dataRetiradaKit, )"
                    + "(localRetiradaKit, duracaoLimite, numMaxParticipantes, )"
                    + "values(?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement comando = conexao.prepareStatement(sql);
            comando.setInt(1, corrida.getId());
            comando.setString(2, corrida.getNome());
            comando.setObject(3, corrida.getPercursos());
            comando.setString(4, corrida.getLocalLargada());
            comando.setString(5, corrida.getLocalChegada());
            comando.setString(6, corrida.getHoraLargada());
            comando.setString(7, corrida.getDataCorrida());
            comando.setString(8, corrida.getDataRetiradaKit());
            comando.setString(9, corrida.getLocalRetiradaKit());
            comando.setInt(10, corrida.getDuracaoLimite());
            comando.setInt(11, corrida.getNumMaxParticipantes());
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
