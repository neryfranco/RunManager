/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

/**
 *
 * @author Nery
 */
public class Ranking {
    
    private Corrida corrida;
    private Categoria categoria;
    
    private int corrida_id;
    private int categoria_id;

    public Ranking(Corrida corrida, Categoria categoria) {
        this.corrida = corrida;
        this.categoria = categoria;
    }

    public Corrida getCorrida() {
        return corrida;
    }

    public void setCorrida(Corrida corrida) {
        this.corrida = corrida;
    }

    public Categoria getCategoria() {
        return categoria;
    }

    public void setCategoria(Categoria categoria) {
        this.categoria = categoria;
    }
    
    
}
