package controller;

import dao.ArticleDAO;
import dao.ArticleDAOImp;
import dao.UserDAO;
import dao.UserDAOImp;
import model.Article;
import model.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/editProfileController")
public class EditProfileController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        resp.setContentType("text/html;charset=UTF-8");
        req.setCharacterEncoding("UTF-8");

        // User Information
        User user  = (User) req.getSession().getAttribute("userInformation");

        int userId = user.getId();
        String firstName = req.getParameter("textFirstName");
        String lastName = req.getParameter("textLastName");
        String username = req.getParameter("textUsername");
        String password = req.getParameter("textPassword");
        String gender = req.getParameter("gender");
        String location = req.getParameter("location");

        ArticleDAO articleDAO = new ArticleDAOImp();
        UserDAO userDAO = new UserDAOImp();

        userDAO.updateUser(userId,firstName,lastName,username,password,gender,location);

        user = new User(userId,firstName,lastName,username,gender,location);

        req.getSession().setAttribute("userInformation",user);

        String authorName = firstName + " " + lastName;

        List<Article> articles = articleDAO.getAllArticle(authorName);

        req.getSession().setAttribute("articles",articles);

        RequestDispatcher requestDispatcher = req.getRequestDispatcher("dashboard.jsp");
        requestDispatcher.forward(req,resp);
    }
}
