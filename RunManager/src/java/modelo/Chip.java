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
public class Chip {
    
    private int numero;
    private int tempoCorrida;
    private Categoria categoria;
    
    private int percurso_id;
    private int kit_id;

    public Chip(int numero, int tempoCorrida, Categoria categoria) {
        this.numero = numero;
        this.tempoCorrida = tempoCorrida;
        this.categoria = categoria;
    }

    public int getNumero() {
        return numero;
    }

    public void setNumero(int numero) {
        this.numero = numero;
    }


    public int getTempoCorrida() {
        return tempoCorrida;
    }

    public void setTempoCorrida(int tempoCorrida) {
        this.tempoCorrida = tempoCorrida;
    }

    public Categoria getCategoria() {
        return categoria;
    }

    public void setCategoria(Categoria categoria) {
        this.categoria = categoria;
    }

    public int getPercurso_id() {
        return percurso_id;
    }

    public void setPercurso_id(int percurso_id) {
        this.percurso_id = percurso_id;
    }

    public int getKit_id() {
        return kit_id;
    }

    public void setKit_id(int kit_id) {
        this.kit_id = kit_id;
    }
    
    
}
