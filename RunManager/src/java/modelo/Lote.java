/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import dao.LoteDAO;
import java.util.List;

/**
 *
 * @author Nery
 */
public class Lote {
    private int id;
    private double preco;
    private Corrida corrida;
    private String dataLimite;
    private List<Ingresso> ingressos;
    
    private int corrida_id;

    public Lote(int id, double preco, Corrida corrida, String dataLimite) {
        this.id = id;
        this.preco = preco;
        this.corrida = corrida;
        this.dataLimite = dataLimite;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public double getPreco() {
        return preco;
    }

    public void setPreco(double preco) {
        this.preco = preco;
    }

    public Corrida getCorrida() {
        return corrida;
    }

    public void setCorrida(Corrida corrida) {
        this.corrida = corrida;
    }

    public String getDataLimite() {
        return dataLimite;
    }

    public void setDataLimite(String dataLimite) {
        this.dataLimite = dataLimite;
    }

    public int getCorrida_id() {
        return corrida_id;
    }

    public void setCorrida_id(int corrida_id) {
        this.corrida_id = corrida_id;
    }

    public List<Ingresso> getIngressos() {
        return ingressos;
    }

    public void setIngressos(List<Ingresso> ingressos) {
        this.ingressos = ingressos;
    }
    
    public void addIngresso(Ingresso ingresso){
        this.ingressos.add(ingresso);
    }
    
    public static List<Lote> obterLotes() throws ClassNotFoundException{
        return LoteDAO.obterLotes();
    }
}
    