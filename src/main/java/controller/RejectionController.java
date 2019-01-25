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

@WebServlet("/rejectionController")
public class RejectionController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");

        Article article = (Article) req.getSession().getAttribute("article");
        int articleId = article.getId();

        String rejectText = req.getParameter("rejectText");
        ArticleDAO articleDAO = new ArticleDAOImp();
        int articleStatus ;

        if(article.getArticleStatus() == 1){
            articleStatus = 0;
            articleDAO.rejectionToArticle(articleId,articleStatus,rejectText);
        }
        else if(article.getArticleStatus() == 2){
            articleStatus = -1;
            articleDAO.rejectionToArticle(articleId,articleStatus,rejectText);
        }

        List<Article> articles = articleDAO.getAllArticleForEditor();
        req.getSession().setAttribute("articles",articles);

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
