/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Atleta;

/**
 *
 * @author Nery
 */
public class ManterAtletaController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ClassNotFoundException {
        String acao = request.getParameter("acao");
        if (acao.equals("prepararIncluir")) {
            prepararIncluir(request, response);
        } else if (acao.equals("confirmarIncluir")) {
            confirmarIncluir(request, response);
        } else if (acao.equals("prepararExcluir")) {
            prepararExcluir(request, response);
        } else if (acao.equals("confirmarExcluir")) {
            confirmarExcluir(request, response);
        }
        else if (acao.equals("prepararEditar")){
            prepararEditar(request,response);
        }
        else if (acao.equals("confirmarEditar")){
            confirmarEditar(request, response);
        }
    }

    public void prepararIncluir(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ClassNotFoundException {
        request.setAttribute("operacao", "Incluir");        
        RequestDispatcher view
                = request.getRequestDispatcher("/manterAtleta.jsp");
        view.forward(request, response);
    }

    public void confirmarIncluir(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("txtEmail");
        String senha = request.getParameter("txtSenha");
        String apelido = request.getParameter("txtSenha");
        String cpf = request.getParameter("txtCpf");
        String nome = request.getParameter("txtNome");
        String dataNascimento = request.getParameter("txtDataNascimento");
        int sexo = Integer.parseInt(request.getParameter("txtSexo"));
        String telCel = request.getParameter("txtTelCel");
        String telRes = request.getParameter("txtTelRes");
        String cep = request.getParameter("txtCep");
        String rua = request.getParameter("txtRua");
        String uf = request.getParameter("txtUf");
        String cidade = request.getParameter("txtCidade");
        try {
            Atleta atleta = new Atleta(email, senha, cpf, nome, dataNascimento, sexo, telCel, telRes, cep, rua, uf, cidade, apelido);
            atleta.gravar();
            RequestDispatcher view = request.getRequestDispatcher("PesquisaAtletaController");
            view.forward(request, response);
        } catch (SQLException ex) {
        } catch (ClassNotFoundException ex) {
        }
    }

    public void prepararExcluir(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.setAttribute("operacao", "Excluir");
            request.setAttribute("atleta", Atleta.obterAtletas());
            String email = request.getParameter("txtEmail");
            request.setAttribute("txtEmail", email);
            RequestDispatcher view = request.getRequestDispatcher("manterAtleta.jsp");
            view.forward(request, response);
        } catch (ServletException ex) {

        } catch (IOException ex) {

        } catch (ClassNotFoundException ex) {

        }
    }

    public void confirmarExcluir(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { 
        try {
            String email = request.getParameter("txtEmail");

            Atleta atleta = new Atleta(email, null, null, null, null, 0, null, null, null, null, null, null, null);

            atleta.excluir();
            RequestDispatcher view = request.getRequestDispatcher("PesquisaPercursoController");
            view.forward(request, response);
        } catch (SQLException ex) {
        } catch (ClassNotFoundException ex) {
        }
    }
    
    public void prepararEditar(HttpServletRequest request, HttpServletResponse response){
        try {
            request.setAttribute("operacao", "Editar");
            request.setAttribute("atleta", Atleta.obterAtletas());
            String email = request.getParameter("txtEmail");
            request.setAttribute("txtEmail", email);
            RequestDispatcher view = request.getRequestDispatcher("manterAtleta.jsp");
            view.forward(request, response);
        } catch (ServletException ex) {

        } catch (IOException ex) {

        } catch (ClassNotFoundException ex) {

        }
        
    }
    
    public void confirmarEditar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        try {
            String email = request.getParameter("txtEmail");
            String senha = request.getParameter("txtSenha");
            String cpf = request.getParameter("txtCpf");
            String nome = request.getParameter("txtNome");
            String dataNascimento = request.getParameter("txtDataNascimento");
            int sexo = Integer.parseInt(request.getParameter("txtSexo"));
            String telCel = request.getParameter("txtTelCel");
            String telRes = request.getParameter("txtTelRes");
            String cep = request.getParameter("txtCep");
            String rua = request.getParameter("txtRua");
            String uf = request.getParameter("txtUf");
            String cidade = request.getParameter("txtCidade");
            String apelido = request.getParameter("txtApelido");


            Atleta atleta = new Atleta(email, senha, cpf, nome, dataNascimento, sexo, telCel, telRes, cep, rua, uf, cidade, apelido);
            atleta.setEmail(email);
            atleta.alterar();
            RequestDispatcher view = request.getRequestDispatcher("PesquisaPercursoController");
            view.forward(request, response);
        } catch (SQLException ex) {
        } catch (ClassNotFoundException ex) {
        }
    }
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ManterAtletaController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ManterAtletaController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
