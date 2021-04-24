/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import dao.Account;
import dao.Customer;
import dao.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ACER
 */
@WebServlet(name = "login", urlPatterns = {"/login1"})
public class login extends HttpServlet {

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

        Cookie a[] = request.getCookies();
        if (a != null) {
            for (Cookie o : a) {
                if (o.getName().equals("userC")) {
                    request.setAttribute("usernameC", o.getValue());
                }
                if (o.getName().equals("passC")) {
                    request.setAttribute("passwordC", o.getValue());
                }
            }
        }
        request.getRequestDispatcher("Login.jsp").forward(request, response);
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

        String user = request.getParameter("username");
        String pass = request.getParameter("password");
        String remember = request.getParameter("remember");
        DAO d = new DAO();
        Account a = d.login(user, pass);
        Customer c=d.getCus(user);
        

        if (a != null) {
            HttpSession session = request.getSession();
            session.setAttribute("account1", a);
            session.setAttribute("idCus", c.getCid());
            session.setAttribute("nameCus", c.getFullName());
            session.setAttribute("addressCus", c.getAddress());
            session.setAttribute("phoneCus", c.getPhone());

            Cookie u = new Cookie("userC", user);
            Cookie p = new Cookie("passC", pass);
            u.setMaxAge(1000);
            if (remember != null) {
                p.setMaxAge(1000);
            } else {
                p.setMaxAge(0);
            }
            response.addCookie(u);
            response.addCookie(p);
            response.sendRedirect("home");

        } else {

            request.setAttribute("mess", "WRONG ACCOUNT OR PASSWORD ");
            request.setAttribute("border", "red");
            request.getRequestDispatcher("Login.jsp").forward(request, response);

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
