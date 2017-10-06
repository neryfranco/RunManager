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
public class Camisa {
    
    private String tamanho;
    private Kit kit;

    public Camisa(String tamanho, Kit kit) {
        this.tamanho = tamanho;
        this.kit = kit;
    }

    public String getTamanho() {
        return tamanho;
    }

    public void setTamanho(String tamanho) {
        this.tamanho = tamanho;
    }

    public Kit getKit() {
        return kit;
    }

    public void setKit(Kit kit) {
        this.kit = kit;
    }
    
    
}
