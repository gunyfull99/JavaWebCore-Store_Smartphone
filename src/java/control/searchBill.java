/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import dao.Bill;
import dao.DAO;
import dao.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ACER
 */
@WebServlet(name = "searchBill1", urlPatterns = {"/searchBill1"})
public class searchBill extends HttpServlet {

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
        int txtSearch = Integer.parseInt(request.getParameter("searchBill"));
        DAO d = new DAO();
        List<Bill> list = new ArrayList<>();
        if (txtSearch == 4) {
            list = d.getBills();
        } else {
            list = d.searchBill(txtSearch);
        }
        PrintWriter out = response.getWriter();
        out.println("       <div id=\"table\"  class=\"col-sm-9\">\n"
                + "                        <table id=\"table\"  style=\"border-color:yellow\" class=\"table table-bordered \">\n"
                + "                            <thead>\n"
                + "\n"
                + "                                <tr>\n"
                + "                                    <th scope=\"col\">Bill ID</th>\n"
                + "                                    <th scope=\"col\">Customer Name</th>\n"
                + "                                    <th scope=\"col\">Date</th>\n"
                + "                                    <th scope=\"col\">Total</th>\n"
                + "                                    <th scope=\"col\">Status</th>\n"
                + "                                    <th scope=\"col\">View</th>\n"
                + "                                </tr>");
        for (Bill o : list) {
            out.println("           <tr>\n"
                    + "                                    <td>" + o.getBid() + "</td>\n"
                    + "                                    <td>" + o.getRecName() + "</td>\n"
                    + "                                    <td>" + o.getDateCreate() + "</td>\n"
                    + "                                    <td>" + o.getTotal() + "</td>\n"
                    + "                                    \n");
            if (o.getStatus() == 0) {
                out.println("  <td style=\"color:green;font-weight: bold\">Wait</td>");
            }
            if (o.getStatus() == 1) {
                out.println("    <td style=\"color:red;font-weight: bold\">Done</td>");
            }
            if (o.getStatus() == 2) {
                out.println(" <td style=\"color:blue;font-weight: bold\">Process</td>");
            }
            out.println(
                    "                                    <td><a href=\"billDetail?bid=" + o.getBid() + "\" >Detail</a></td>\n"
                    + "                                </tr>");

        }
        out.println("         </thead>\n"
                + "                        <tbody>\n"
                + "                        </tbody>\n"
                + "                    </table>\n"
                + "                </div>");

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
