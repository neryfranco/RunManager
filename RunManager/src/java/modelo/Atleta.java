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
    
       
    
}