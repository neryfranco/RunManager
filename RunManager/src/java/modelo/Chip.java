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
    private Atleta atleta;
    private int tempoCorrida;
    private Categoria categoria;
    
    private int percurso_id;
    private int kit_id;

    public Chip(int numero, Atleta atleta, int tempoCorrida, Categoria categoria) {
        this.numero = numero;
        this.atleta = atleta;
        this.tempoCorrida = tempoCorrida;
        this.categoria = categoria;
    }

    public int getNumero() {
        return numero;
    }

    public void setNumero(int numero) {
        this.numero = numero;
    }

    public Atleta getAtleta() {
        return atleta;
    }

    public void setAtleta(Atleta atleta) {
        this.atleta = atleta;
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
    
    
}
