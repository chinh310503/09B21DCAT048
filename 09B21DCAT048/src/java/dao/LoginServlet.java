package dao;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDAO048 userDAO;

    @Override
    public void init() {
        userDAO = new UserDAO048(); // Khởi tạo UserDAO048
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try {
            String role = userDAO.validateUser(username, password);
            if (role != null) {
                // Đăng nhập thành công
                HttpSession session = request.getSession();
                session.setAttribute("username", username);
                session.setAttribute("fullname",userDAO.getFullName(username, password) );
                session.setAttribute("role", role);
                response.sendRedirect("GDChinh048.jsp");
            } else {
                // Đăng nhập thất bại
                request.setAttribute("message", "tài khoản hoặc mật khẩu không chính xác");
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }
            
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
