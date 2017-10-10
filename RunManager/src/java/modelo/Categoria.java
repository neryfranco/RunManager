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
public class Categoria {
    
    private int id;
    private String sexo;
    private int idadeIni;
    private int idadeFim;
    private String descricao;

    public Categoria(int id, String sexo, int idadeIni, int idadeFim, String descricao) {
        this.id = id;
        this.sexo = sexo;
        this.idadeIni = idadeIni;
        this.idadeFim = idadeFim;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getSexo() {
        return sexo;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    public int getIdadeIni() {
        return idadeIni;
    }

    public void setIdadeIni(int idadeIni) {
        this.idadeIni = idadeIni;
    }

    public int getIdadeFim() {
        return idadeFim;
    }

    public void setIdadeFim(int idadeFim) {
        this.idadeFim = idadeFim;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }
}
