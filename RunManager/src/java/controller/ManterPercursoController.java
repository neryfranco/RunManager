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
import modelo.Categoria;
import modelo.Percurso;

/**
 *
 * @author Nery
 */
public class ManterPercursoController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException, ClassNotFoundException {
        String acao = request.getParameter("acao");
        if (acao.equals("prepararIncluir")) {
            prepararIncluir(request, response);
        } else if (acao.equals("confirmarIncluir")) {
            confirmarIncluir(request, response);
        } else if (acao.equals("prepararExcluir")) {
            prepararExcluir(request, response);
        } else if (acao.equals("confirmarExcluir")) {
            confirmarExcluir(request, response);
        } else if (acao.equals("prepararEditar")) {
            prepararEditar(request, response);
        } else if (acao.equals("confirmarEditar")) {
            confirmarEditar(request, response);
        }
    }

    public void prepararIncluir(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            request.setAttribute("operacao", "Incluir");
            request.setAttribute("categorias", Categoria.obterCategorias());
            RequestDispatcher view
                    = request.getRequestDispatcher("/manterPercurso.jsp");
            view.forward(request, response);
        } catch (ClassNotFoundException ex) {
        }
    }

    private void confirmarIncluir(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException, ClassNotFoundException {
        int id = Integer.parseInt(request.getParameter("txtID"));
        int distancia = Integer.parseInt(request.getParameter("txtDistancia"));
        int categoria_id = Integer.parseInt(request.getParameter("optCategoria"));
        String itinerario = request.getParameter("txtItinerario");
        try {
            Categoria categoria = null;
            if (categoria_id != 0) {
                categoria = Categoria.obterCategoria(categoria_id);
            }
            Percurso percurso = new Percurso(id, categoria, itinerario, distancia);
            percurso.gravar();
            RequestDispatcher view = request.getRequestDispatcher("PesquisaPercursoController");
            view.forward(request, response);
        } catch (SQLException ex) {
        } catch (ClassNotFoundException ex) {
        }
    }

    private void prepararExcluir(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException, ClassNotFoundException {
        try {
            request.setAttribute("operacao", "Excluir");
            request.setAttribute("categorias", Categoria.obterCategorias());
            int idPercurso = Integer.parseInt(request.getParameter("codPercurso"));
            Percurso percurso = Percurso.obterPercurso(idPercurso);
            request.setAttribute("percurso", percurso);
            RequestDispatcher view = request.getRequestDispatcher("/manterPercurso.jsp");
            view.forward(request, response);
        } catch (ServletException e) {
        }

    }

    private void confirmarExcluir(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("txtID"));
            int distancia = Integer.parseInt(request.getParameter("txtDistancia"));
            int categoria_id = Integer.parseInt(request.getParameter("optCategoria"));
            String itinerario = request.getParameter("txtItinerario");

            Categoria categoria = null;
            if (categoria_id != 0) {
                categoria = Categoria.obterCategoria(categoria_id);
            }
            Percurso percurso = new Percurso(id, categoria, itinerario, distancia);
            percurso.excluir();
            RequestDispatcher view = request.getRequestDispatcher("PesquisaPercursoController");
            view.forward(request, response);
        } catch (SQLException ex) {
        } catch (ClassNotFoundException ex) {
        }
    }

    private void prepararEditar(HttpServletRequest request, HttpServletResponse response) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    private void confirmarEditar(HttpServletRequest request, HttpServletResponse response) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
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
        } catch (SQLException ex) {
            Logger.getLogger(ManterPercursoController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ManterPercursoController.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (SQLException ex) {
            Logger.getLogger(ManterPercursoController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ManterPercursoController.class.getName()).log(Level.SEVERE, null, ex);
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
