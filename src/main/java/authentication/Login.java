package authentication;

import dao.ArticleDAO;
import dao.ArticleDAOImp;
import dao.UserDAO;
import dao.UserDAOImp;
import model.Article;
import model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/login")
public class Login extends HttpServlet {

    // User not logged

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if(!resp.isCommitted()){
            req.getRequestDispatcher("login.jsp").forward(req,resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");
        PrintWriter printWriter = resp.getWriter();

        HttpSession session ;
        String username = req.getParameter("textUsername");
        String password = req.getParameter("textPassword");

        // Validation

        UserDAO userDAO = new UserDAOImp();
        int userType[] = userDAO.getUserType(username,password);

        // User information
        int userId = userType[1];
        User user = userDAO.getUserById(userId);

        // Article List for Author

        String authorFirstName = user.getFirstName();
        String authorLastName = user.getLastName();
        String authorName = authorFirstName+ " " + authorLastName;

        ArticleDAO articleDAO = new ArticleDAOImp();
        List<Article> articles = new ArrayList<Article>();

        // Article List for Editor

        if(userType[0] == 1){
            articles = articleDAO.getAllArticle(authorName);
        }
        else if(userType[0] == 2){
            articles = articleDAO.getAllArticleForEditor();
        }


        // RefereeList
        List<User> refereeList = userDAO.getRefereeList();


        // Referee Article List
        String refereeFirstName = user.getFirstName();
        String refereeLastName = user.getLastName();
        String refereeName = refereeFirstName + " "+ refereeLastName;

        List<Article> refereeArticles = articleDAO.getArticleForReferee(refereeName);

        // Forward
        switch (userType[0]){
            case -1:
                printWriter.println("Veritabanı bağlantı hatası !");
                req.getRequestDispatcher("login.jsp").include(req,resp);
                break;
            case 0 :
                printWriter.println("Kullanıcı adı ya da şifre hatalı !");
                req.setAttribute("error","Kullanıcı adınız ya da şifreniz hatalı !");
                req.getRequestDispatcher("login.jsp").forward(req,resp);
                break;
            case 1 :
                session = req.getSession();
                session.setAttribute("userId",userType[1]);
                session.setAttribute("userType","Author");
                session.setAttribute("username",username);
                session.setAttribute("articles",articles);
                session.setAttribute("userInformation",user);
                req.getRequestDispatcher("dashboard.jsp").forward(req,resp);
                break;
            case 2:
                session = req.getSession();
                session.setAttribute("userId",userType[1]);
                session.setAttribute("userType","Editor");
                session.setAttribute("username",username);
                session.setAttribute("articles",articles);
                session.setAttribute("userInformation",user);
                session.setAttribute("refereeList",refereeList);
                req.getRequestDispatcher("dashboard.jsp").forward(req,resp);
                break;
            case 3:
                session = req.getSession();
                session.setAttribute("userId",userType[1]);
                session.setAttribute("userType","Referee");
                session.setAttribute("username",username);
                session.setAttribute("articles",articles);
                session.setAttribute("refereeArticles",refereeArticles);
                session.setAttribute("userInformation",user);
                req.getRequestDispatcher("dashboard.jsp").forward(req,resp);
                break;
            default:
                // redirect to login page
                req.getRequestDispatcher("login.jsp").forward(req,resp);
        }

    }
}
