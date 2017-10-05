/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.util.List;

/**
 *
 * @author Nery
 */
public class Lote {
    private List<Ingresso> ingressos;
    private int quantidade;
    private double preco;
    private Corrida corrida;
    
    private int corrida_id;

    public Lote(List<Ingresso> ingressos, int quantidade, double preco, Corrida corrida) {
        this.ingressos = ingressos;
        this.quantidade = quantidade;
        this.preco = preco;
        this.corrida = corrida;
    }

    public List<Ingresso> getIngressos() {
        return ingressos;
    }

    public void setIngressos(List<Ingresso> ingressos) {
        this.ingressos = ingressos;
    }

    public int getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(int quantidade) {
        this.quantidade = quantidade;
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
    
    
}
