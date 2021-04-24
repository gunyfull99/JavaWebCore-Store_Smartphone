/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import dao.Customer;
import dao.DAO;
import dao.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ACER
 */
@WebServlet(name = "checkOut", urlPatterns = {"/checkOut"})
public class checkOut extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        DAO d = new DAO();
        long millis = System.currentTimeMillis();
        java.sql.Date date = new java.sql.Date(millis);

        HttpSession session = request.getSession();
        if(session.getAttribute("idCus")==(null)){
            request.getRequestDispatcher("login1").forward(request, response);
        }else{
            
        
        int cid = (int) session.getAttribute("idCus");
        Customer c = d.selectCustomer(cid);
        double total = Double.parseDouble(request.getParameter("total1"));

        int n = d.insertBill(date, total, c.getFullName(), c.getAddress(), c.getPhone(), 0, c.getCid());
        if (n != 0) {
            int bid = d.getBid();
            int e = 0;
            List<Product> list = (List<Product>) session.getAttribute("listCart");
            for (Product o : list) {
                e = d.insertBillDetails(bid,o.getId(), o.getQuantity(), o.getPrice(),o.getName());

            }

            session.removeAttribute("listCart");
            RequestDispatcher dispth
                    = request.getRequestDispatcher("home");
            dispth.forward(request, response);
        }
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
