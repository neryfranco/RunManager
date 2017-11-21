/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import dao.CamisaDAO;
import java.util.List;

/**
 *
 * @author Nery
 */
public class Camisa {
    
    private int id;
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

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
    
    public static List<Camisa> obterCamisas() throws ClassNotFoundException{
        return CamisaDAO.obterCamisas();
    }
    
    public static Camisa obterCamisa(int id) throws ClassNotFoundException{
        return CamisaDAO.obterCamisa(id);
    }
}
