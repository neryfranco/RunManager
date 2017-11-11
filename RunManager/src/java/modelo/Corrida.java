/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import dao.CorridaDAO;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author Nery
 */
public class Corrida {
    
    private int id;
    private String nome;
    private List<Percurso> percursos;
    private String localLargada;
    private String localChegada;
    private String horaLargada;
    private String dataCorrida;
    private String dataRetiradaKit;
    private String localRetiradaKit;
    private int duracaoLimite;
    private int numMaxParticipantes;
    
    private List<Integer> percursos_id;

    public Corrida(int id, String nome, List<Percurso> percursos, String localLargada, String localChegada, String horaLargada, String dataCorrida, String dataRetiradaKit, String localRetiradaKit, int duracaoLimite, int numMaxParticipantes) {
        this.id = id;
        this.nome = nome;
        this.percursos = percursos;
        this.localLargada = localLargada;
        this.localChegada = localChegada;
        this.horaLargada = horaLargada;
        this.dataCorrida = dataCorrida;
        this.dataRetiradaKit = dataRetiradaKit;
        this.localRetiradaKit = localRetiradaKit;
        this.duracaoLimite = duracaoLimite;
        this.numMaxParticipantes = numMaxParticipantes;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public List<Percurso> getPercursos() {
        return percursos;
    }

    public void setPercursos(List<Percurso> percursos) {
        this.percursos = percursos;
    }

    public String getLocalLargada() {
        return localLargada;
    }

    public void setLocalLargada(String localLargada) {
        this.localLargada = localLargada;
    }

    public String getLocalChegada() {
        return localChegada;
    }

    public void setLocalChegada(String localChegada) {
        this.localChegada = localChegada;
    }

    public String getHoraLargada() {
        return horaLargada;
    }

    public void setHoraLargada(String horaLargada) {
        this.horaLargada = horaLargada;
    }

    public String getDataCorrida() {
        return dataCorrida;
    }

    public void setDataCorrida(String dataCorrida) {
        this.dataCorrida = dataCorrida;
    }

    public String getDataRetiradaKit() {
        return dataRetiradaKit;
    }

    public void setDataRetiradaKit(String dataRetiradaKit) {
        this.dataRetiradaKit = dataRetiradaKit;
    }

    public String getLocalRetiradaKit() {
        return localRetiradaKit;
    }

    public void setLocalRetiradaKit(String localRetiradaKit) {
        this.localRetiradaKit = localRetiradaKit;
    }

    public int getDuracaoLimite() {
        return duracaoLimite;
    }

    public void setDuracaoLimite(int duracaoLimite) {
        this.duracaoLimite = duracaoLimite;
    }

    public int getNumMaxParticipantes() {
        return numMaxParticipantes;
    }

    public void setNumMaxParticipantes(int numMaxParticipantes) {
        this.numMaxParticipantes = numMaxParticipantes;
    }

    public List<Integer> getPercursos_id() {
        return percursos_id;
    }

    public void setPercursos_id(List<Integer> percursos_id) {
        this.percursos_id = percursos_id;
    }
    
    public void addPercursoID(int id){
        percursos_id.add(id);
    }
    
    public static List obterCorridas() throws ClassNotFoundException{
        return CorridaDAO.obterCorridas();
    }
    
    public static Corrida obterCorrida(int id) throws ClassNotFoundException, SQLException{
        return CorridaDAO.obterCorrida(id);
    }

    public void gravar() throws SQLException, ClassNotFoundException{
        CorridaDAO.gravar(this);
    }
    
    public void alterar() throws SQLException, ClassNotFoundException{
        CorridaDAO.alterar(this);
    }
    
    public void excluir() throws SQLException, ClassNotFoundException{
        CorridaDAO.excluir(this);
    }
}
