package bai2;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class login extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if ("thong".equals(username) && "123".equals(password)) {
            out.print("Chào mừng bạn, " + username);

            HttpSession session = request.getSession();
            session.setAttribute("name", username);
        } else {
            out.print("Tài khoản hoặc mật khẩu không chính xác");

            request.getRequestDispatcher("login.html").include(request, response);
        }
    }
}
