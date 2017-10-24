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
    
    private String metodoPagamento; 
    private double valor;

    public Pagamento(String metodoPagamento, double valor) {
        this.metodoPagamento = metodoPagamento;
        this.valor = valor;
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

    
    public static List<Pagamento> obterPagamentos() throws ClassNotFoundException{
        return PagamentoDAO.obterPagamentos();
    }
}
