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
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;
import modelo.Percurso;

/**
 *
 * @author Nery
 */
public class PercursoDAO {

    public static List<Percurso> obterPercursos() throws ClassNotFoundException {
        Connection conexao = null;
        Statement comando = null;
        List<Percurso> percursos = new ArrayList<Percurso>();
        try {
            conexao = BD.getConexao();
            comando = conexao.createStatement();
            ResultSet rs = comando.executeQuery("select * from Percurso");
            while (rs.next()) {
                Percurso percurso = new Percurso(rs.getInt("id"),
                        null,
                        rs.getString("itinerario"),
                        rs.getInt("distancia"),
                        null);

                percurso.setCategoria_id(rs.getInt("Categoria_id"));
                percursos.add(percurso);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            fecharConexao(conexao, comando);
        }
        return percursos;
    }

    public static Percurso obterPercurso(int id) throws ClassNotFoundException, SQLException {
        Connection conexao = null;
        Statement comando = null;
        Percurso percurso = null;
        try {
            conexao = BD.getConexao();
            comando = conexao.createStatement();
            ResultSet rs = comando.executeQuery("select * from Percurso where id = " + id);
            rs.first();
            percurso = new Percurso(rs.getInt("id"),
                    null,
                    rs.getString("itinerario"),
                    rs.getInt("distancia"),
                    null);

            percurso.setCategoria_id(rs.getInt("Categoria_id"));
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            fecharConexao(conexao, comando);
        }
        return percurso;
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

    public static void gravar(Percurso percurso) throws SQLException, ClassNotFoundException {
        Connection conexao = null;
        try {
            conexao = BD.getConexao();
          /*String sql = "insert into percurso (id, itinerario, distancia, Categoria_id) values (?, ?, ?, ?)";
            PreparedStatement comando = conexao.prepareStatement(sql);
            
            comando.setInt(1,percurso.getId());
            comando.setString(2,percurso.getItinerario());
            comando.setInt(3,percurso.getDistancia());
            if(percurso.getCategoria() == null)
                comando.setNull(4, Types.NULL);
            else
                comando.setInt(4, percurso.getCategoria().getId()); */

            String sql = "insert into percurso (id, itinerario, distancia, Categoria_id) values ("
                    + percurso.getId()
                    + ", '" + percurso.getItinerario()
                    + "', " + percurso.getDistancia()
                    + ", ";
            if (percurso.getCategoria() == null) {
                sql = sql + Types.NULL;
            } else {
                sql = sql + percurso.getCategoria().getId();
            }
            sql = sql + ")";
            PreparedStatement comando = conexao.prepareStatement(sql);
            comando.execute(sql);
            comando.close();
            conexao.close();
        } catch (SQLException e) {
            throw e;
        }
    }

    public static void alterar(Percurso percurso) throws SQLException, ClassNotFoundException {
        Connection conexao = null;
        try {
            conexao = BD.getConexao();
            String sql = "update Percurso set itinerario = ?, distancia = ?, categoria_id = ? "
                    + "where id = ?";
            PreparedStatement comando = conexao.prepareStatement(sql);
            comando.setString(1, percurso.getItinerario());
            comando.setInt(2, percurso.getDistancia());
            if (percurso.getCategoria() == null) {
                comando.setNull(3, Types.NULL);
            } else {
                comando.setInt(3, percurso.getCategoria().getId());
            }
            comando.setInt(4, percurso.getId());
            comando.execute(sql);
            comando.close();
            conexao.close();
        } catch (SQLException e) {
            throw e;
        }
    }

    public static void excluir(Percurso percurso) throws SQLException, ClassNotFoundException {
        Connection conexao = null;
        Statement comando = null;
        try {
            conexao = BD.getConexao();
            String sql = "delete from percurso where id = " + percurso.getId();
            comando.execute(sql);
        } catch (SQLException e) {
            throw e;
        } finally {
            fecharConexao(conexao, comando);
        }

    }
}
