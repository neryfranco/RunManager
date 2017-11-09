/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import dao.PagamentoDAO;
import java.util.List;

/**
 *
 * @author Nery
 */
public class Pagamento {
    
    private int id;
    private String metodoPagamento; 
    private double valor;
    private Ingresso ingresso;
    
    private int ingresso_id;

    public Pagamento(int id, String metodoPagamento, double valor, Ingresso ingresso) {
        this.id = id;
        this.metodoPagamento = metodoPagamento;
        this.valor = valor;
        this.ingresso = ingresso;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
    public String getMetodoPagamento() {
        return metodoPagamento;
    }

    public void setMetodoPagamento(String metodoPagamento) {
        this.metodoPagamento = metodoPagamento;
    }

    public double getValor() {
        return valor;
    }

    public void setValor(double valor) {
        this.valor = valor;
    }

    public Ingresso getIngresso() {
        return ingresso;
    }

    public void setIngresso(Ingresso ingresso) {
        this.ingresso = ingresso;
    }

    public int getIngresso_id() {
        return ingresso_id;
    }

    public void setIngresso_id(int ingresso_id) {
        this.ingresso_id = ingresso_id;
    }
    
    public static List<Pagamento> obterPagamentos() throws ClassNotFoundException{
        return PagamentoDAO.obterPagamentos();
    }
}
