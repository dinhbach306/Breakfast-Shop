/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sample.foods.Cart;
import sample.foods.FoodDTO;
import sample.order.OrderDAO;
import sample.users.UserDTO;

/**
 *
 * @author MagnusJS
 */
@WebServlet(name = "CheckoutController", urlPatterns = {"/CheckoutController"})
public class CheckoutController extends HttpServlet {

    private static final String ERROR = "checkout.jsp";
    private static final String SUCCESS = "thankyou.html";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            HttpSession session = request.getSession();
            OrderDAO dao = new OrderDAO();
            String lastOrderId = dao.GetLastOrder();

            String tmp[] = lastOrderId.split("-");
            String text = tmp[0];
            String lastNumber = tmp[1];
            int newNumber = Integer.parseInt(lastNumber) + 1;

            String orderId = text + "-" + newNumber;
            UserDTO user = (UserDTO) session.getAttribute("LOGIN_USER");
            Cart cart = (Cart) session.getAttribute("CART");

            float total = 0;

            for (FoodDTO o : cart.getCart().values()) {
                total += o.getPrice() * o.getQuantity();
            }

            dao.InsertOrder(user, total, orderId);
            
            cart.getCart().values()
                    .stream()
                    .map((o) -> {
                        dao.InsertOrderDetail(o.getId(), o.getQuantity(), orderId, (float)(o.getPrice() * o.getQuantity()));
                        return o;
            }).forEachOrdered((o) -> {
                dao.updateQuantity(o.getId(), o.getQuantity());
            });
            
            session.setAttribute("CART", new Cart());
            url = SUCCESS;
        } catch (Exception e) {
            log("Error at CheckOutController: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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
