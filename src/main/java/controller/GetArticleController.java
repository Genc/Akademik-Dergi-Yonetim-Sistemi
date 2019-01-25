package controller;

import dao.ArticleDAO;
import dao.ArticleDAOImp;
import model.Article;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/getArticleController")
public class GetArticleController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int articleId = Integer.parseInt(req.getParameter("articleId"));

        ArticleDAO articleDAO = new ArticleDAOImp();

        Article article = articleDAO.getArticleById(articleId);

        HttpSession session = req.getSession();

        session.setAttribute("article",article);

        RequestDispatcher requestDispatcher = req.getRequestDispatcher("article.jsp");
        requestDispatcher.forward(req,resp);
    }
}
