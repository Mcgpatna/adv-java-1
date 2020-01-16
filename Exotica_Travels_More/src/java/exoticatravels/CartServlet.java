/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package exoticatravels;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author rmn
 */
@WebServlet(name = "CartServlet", urlPatterns = {"/CartServlet"})
public class CartServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession(false);
            String price = request.getParameter("price");
            System.out.println("Within CartServlrt: " + session);
            session.setAttribute("price", price);
            
            String dest = session.getAttribute("selDestination").toString();
            //System.out.println("//////////selDestination: " + dest);
            String hotel = session.getAttribute("selHotel").toString();
            //System.out.println("//////////selHotel: " + hotel);
            String airline = session.getAttribute("selAirline").toString();
            //System.out.println("//////////selAirline: " + airline);
            int days = Integer.parseInt(session.getAttribute("numDays").toString());
            //System.out.println("//////////numDays: " + days + " price: " + price);
            double packagePrice = Double.parseDouble(price);
            //System.out.println("//////////Package Price: " + packagePrice);
            String userid = session.getAttribute("User").toString();
            
            EntityManagerFactory emf = Persistence.createEntityManagerFactory("ExoticaTravelsPU");
            EntityManager em = emf.createEntityManager();
            EntityTransaction userTransaction = em.getTransaction();
            userTransaction.begin();
            
            Query query1 = em.createNativeQuery("SELECT * FROM APP.CART");
            List result = query1.getResultList(); //check
            int cartid = result.size();
            System.out.println("/////////////////////////// Cart ID: " + cartid);
            Query query2 = em.createNativeQuery("INSERT INTO Cart VALUES(" + (++cartid) + ",'" + userid + "','" + dest + "','" + hotel + "'," + days + ",'" + airline + "'," + packagePrice + ")");
            query2.executeUpdate();
            
            
            
            response.sendRedirect("CartConfirm.jsp");
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
