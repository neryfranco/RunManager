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

    public int getCorrida_id() {
        return corrida_id;
    }

    public void setCorrida_id(int corrida_id) {
        this.corrida_id = corrida_id;
    }

    public int getCategoria_id() {
        return categoria_id;
    }

    public void setCategoria_id(int categoria_id) {
        this.categoria_id = categoria_id;
    }
    
    
}
