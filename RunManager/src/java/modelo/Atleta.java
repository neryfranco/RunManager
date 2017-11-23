/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import dao.AtletaDAO;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author Nery
 */
public class Atleta extends Usuario{
    
    private String email;
    private String senha;
    private double pace;
    private String apelido;

    public Atleta(String email, 
                  String senha, 
                  String cpf, 
                  String nome, 
                  String dataNascimento, 
                  String sexo, 
                  String telCel, 
                  String telRes, 
                  String cep, 
                  String rua, 
                  String uf, 
                  String cidade, 
                  String apelido) {
        super(cpf, nome, dataNascimento, sexo, telCel, telRes, cep, rua, uf, cidade);
        this.email = email;
        this.senha = senha;
        this.apelido = apelido;
    }

    public Atleta(String email, 
                  String senha, 
                  String cpf,
                  String apelido) {
        super(cpf, null, null, null, null, null, null, null, null, null);
        this.email = email;
        this.senha = senha;
        this.apelido = apelido;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public double getPace() {
        return pace;
    }

    public void setPace(double pace) {
        this.pace = pace;
    }

    public String getApelido() {
        return apelido;
    }

    public void setApelido(String apelido) {
        this.apelido = apelido;
    }
    
    
    public static List<Atleta> obterAtletas() throws ClassNotFoundException{
        return AtletaDAO.obterAtletas();
    }
    
    public void gravar() throws SQLException,ClassNotFoundException{
        AtletaDAO.gravar(this);
    }
    
    public void alterar() throws SQLException,ClassNotFoundException{
        AtletaDAO.alterar(this);
    }
    
    public void excluir() throws SQLException,ClassNotFoundException{
        AtletaDAO.excluir(this);
    }
    
    public static Atleta obterAtleta(String email) throws SQLException,ClassNotFoundException{
       return AtletaDAO.obterAtleta(email);
    }
       
    
}
