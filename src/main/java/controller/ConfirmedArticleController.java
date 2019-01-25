package controller;

import dao.ArticleDAO;
import dao.ArticleDAOImp;
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

@WebServlet("/successfulConfirmedArticle")
public class ConfirmedArticleController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        Article article = (Article) req.getSession().getAttribute("article");
        int articleId = article.getId();
        int articleStatus = 3;

        ArticleDAO articleDAO = new ArticleDAOImp();
        articleDAO.successfulConfirmedForReferee(articleId,articleStatus);

        // User Information get session
        User user = (User) req.getSession().getAttribute("userInformation");

        // Referee Article List
        String refereeFirstName = user.getFirstName();
        String refereeLastName = user.getLastName();
        String refereeName = refereeFirstName + " "+ refereeLastName;

        List<Article> refereeArticles = articleDAO.getArticleForReferee(refereeName);

        req.getSession().setAttribute("refereeArticles",refereeArticles);

        RequestDispatcher requestDispatcher = req.getRequestDispatcher("dashboard.jsp");
        requestDispatcher.forward(req,resp);


    }
}
