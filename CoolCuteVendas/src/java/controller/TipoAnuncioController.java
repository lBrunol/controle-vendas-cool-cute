/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import bean.TipoAnuncio;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.TipoAnuncioModel;

/**
 *
 * @author Casa
 */
public class TipoAnuncioController extends HttpServlet {

    
    private boolean retorno;
    
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String pagina = "/tipo-anuncio/criar/index.jsp";
        response.setContentType("text/html;charset=UTF-8");
        
        try {
            TipoAnuncio tia = new TipoAnuncio();
            
            tia.setDescricao(request.getParameter("txtDescricao"));
            tia.setPercentual(Float.parseFloat(request.getParameter("txtPercentual")));
            
            TipoAnuncioModel tiaModel = new TipoAnuncioModel();
            tiaModel.adiciona(tia);  
            
            retorno = true;            
            request.setAttribute("msg", "Cadastro realizado com sucesso");
            
        } catch (SQLException ex) {
            retorno = false;
            request.setAttribute("msg", "Erro ao cadastrar o registro. " + ex.getMessage());
        } finally {
            request.setAttribute("retorno", retorno);
            RequestDispatcher rd = request.getRequestDispatcher(pagina);
            rd.include(request, response);
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
        processRequest(request, response);
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
        processRequest(request, response);
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
