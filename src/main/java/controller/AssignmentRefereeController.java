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
import java.io.IOException;
import java.util.List;

@WebServlet("/assignmentReferee")
public class AssignmentRefereeController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        String refereeName = req.getParameter("selectReferee");
        Article article = (Article) req.getSession().getAttribute("article");
        int articleId = article.getId();
        int articleStatus = 2;

        ArticleDAO articleDAO = new ArticleDAOImp();
        articleDAO.assignmentReferee(articleId,articleStatus,refereeName);

        // Article List

        List<Article> articles = articleDAO.getAllArticleForEditor();
        req.getSession().setAttribute("articles",articles);

        RequestDispatcher requestDispatcher = req.getRequestDispatcher("dashboard.jsp");
        requestDispatcher.forward(req,resp);

    }
}
