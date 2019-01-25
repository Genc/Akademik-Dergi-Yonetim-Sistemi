package authentication;

import dao.UserDAO;
import dao.UserDAOImp;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

// Only Author can register

@WebServlet("/signup")
public class Signup extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");
        req.setCharacterEncoding("UTF-8");
        String firstName = req.getParameter("textFirstName");
        String lastName = req.getParameter("textLastName");
        String username = req.getParameter("textUsername");
        String password = req.getParameter("textPassword");
        String gender = req.getParameter("gender");
        String location = req.getParameter("location");
        int userType = 1;


        UserDAO userDAO = new UserDAOImp();
        userDAO.addUser(firstName,lastName,username,password,gender,location,userType);

        RequestDispatcher requestDispatcher = req.getRequestDispatcher("login.jsp");
        requestDispatcher.forward(req,resp);

    }
}
