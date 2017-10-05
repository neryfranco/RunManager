/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.sql.Date;
import java.util.List;

/**
 *
 * @author Nery
 */
public class Corrida {
    
    private String nome;
    private List<Percurso> percursos;
    private String localLargada;
    private String horaLargada;
    private Date dataCorrida;
    private Date dataRetiradaKit;
    private String localRetiradaKit;
    private int duracaoLimite;
    private int numMaxParticipantes;

    public Corrida(String nome, List<Percurso> percursos, String localLargada, String horaLargada, Date dataCorrida, Date dataRetiradaKit, String localRetiradaKit, int duracaoLimite, int numMaxParticipantes) {
        this.nome = nome;
        this.percursos = percursos;
        this.localLargada = localLargada;
        this.horaLargada = horaLargada;
        this.dataCorrida = dataCorrida;
        this.dataRetiradaKit = dataRetiradaKit;
        this.localRetiradaKit = localRetiradaKit;
        this.duracaoLimite = duracaoLimite;
        this.numMaxParticipantes = numMaxParticipantes;
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

    public String getHoraLargada() {
        return horaLargada;
    }

    public void setHoraLargada(String horaLargada) {
        this.horaLargada = horaLargada;
    }

    public Date getDataCorrida() {
        return dataCorrida;
    }

    public void setDataCorrida(Date dataCorrida) {
        this.dataCorrida = dataCorrida;
    }

    public Date getDataRetiradaKit() {
        return dataRetiradaKit;
    }

    public void setDataRetiradaKit(Date dataRetiradaKit) {
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

    
}
