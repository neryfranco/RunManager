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
public class Kit {
    
    private int numPeito;
    private Chip chip;
    private Camisa camisa;
    
    private int chip_num;
    private int camisa_id;

    public Kit(int numPeito, Chip chip, Camisa camisa) {
        this.numPeito = numPeito;
        this.chip = chip;
        this.camisa = camisa;
    }

    public int getNumPeito() {
        return numPeito;
    }

    public void setNumPeito(int numPeito) {
        this.numPeito = numPeito;
    }

    public Chip getChip() {
        return chip;
    }

    public void setChip(Chip chip) {
        this.chip = chip;
    }

    public Camisa getCamisa() {
        return camisa;
    }

    public void setCamisa(Camisa camisa) {
        this.camisa = camisa;
    }
    
    
}
