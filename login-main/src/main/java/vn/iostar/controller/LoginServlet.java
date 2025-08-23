package vn.iostar.controller;
import vn.iostar.dao.impl.UserDao;
import vn.iostar.model.UserModel;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private UserDao userDao = new UserDao();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        boolean loginSuccess = false;
        for (UserModel user : userDao.findAll()) {
            if (user.getUsername().equals(username) && user.getPassword().equals(password)) {
                loginSuccess = true;
                HttpSession session = request.getSession();
                session.setAttribute("currentUser", user);
                break;
            }
        }

        if (loginSuccess) {
            // Redirect tới welcome.jsp trong thư mục view
            response.sendRedirect("view/welcome.jsp");
        } else {
            // Forward lại login.jsp trong thư mục view với thông báo lỗi
            request.setAttribute("errorMessage", "Username or password incorrect!");
            request.getRequestDispatcher("/view/login.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Forward tới login.jsp trong thư mục view
        request.getRequestDispatcher("/view/login.jsp").forward(request, response);
    }
}