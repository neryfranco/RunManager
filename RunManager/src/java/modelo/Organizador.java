/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import dao.OrganizadorDAO;
import java.util.List;

/**
 *
 * @author Nery
 */
public class Organizador extends Usuario{
    
    private String email;
    private String senha;

    public Organizador(
            String email, 
            String senha, 
            String cpf, 
            String nome, 
            String dataNascimento, 
            int sexo, 
            String telCel, 
            String telRes, 
            String cep, 
            String rua, 
            String uf, 
            String cidade) {
        super(cpf, nome, dataNascimento, sexo, telCel, telRes, cep, rua, uf, cidade);
        this.email = email;
        this.senha = senha;
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
    
    public static List obterOrganizadores() throws ClassNotFoundException{
        return OrganizadorDAO.obterOrganizadores();
    }
    
}
