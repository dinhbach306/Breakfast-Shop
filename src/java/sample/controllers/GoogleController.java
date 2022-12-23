package sample.controllers;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sample.accessSocial.GooglePojo;
import sample.accessSocial.GoogleUtils;
import sample.foods.FoodDAO;
import sample.foods.FoodDTO;
import sample.users.UserDTO;
/**
 *
 * @author MagnusJS
 */
@WebServlet(name = "GoogleController", urlPatterns = {"/GoogleController"})
public class GoogleController extends HttpServlet {
    
  private static final long serialVersionUID = 1L;
  public GoogleController() {
    super();
  }
  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    String code = request.getParameter("code");
    HttpSession session = request.getSession();
    if (code == null || code.isEmpty()) {
    RequestDispatcher dis = request.getRequestDispatcher("login.jsp");
    dis.forward(request, response);
    
} else {
    String accessToken = GoogleUtils.getToken(code);
    GooglePojo googlePojo = GoogleUtils.getUserInfo(accessToken);
    
    //Set data to shop page
    FoodDAO foodDao = new FoodDAO();
    List<FoodDTO> list;
        try {
                list = foodDao.getAllProduct();
                session.setAttribute("LIST", list);
        } catch (SQLException ex) {
            Logger.getLogger(GoogleController.class.getName()).log(Level.SEVERE, null, ex);
        }

    UserDTO loginUser = new UserDTO(googlePojo.getId(), googlePojo.getName(), "USER", "");
    session.setAttribute("LOGIN_USER", loginUser);
    RequestDispatcher dis = request.getRequestDispatcher("index.jsp");
    dis.forward(request, response);
    }
  }
  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    doGet(request, response);
  }
}
