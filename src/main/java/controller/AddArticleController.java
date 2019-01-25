package controller;

import dao.ArticleDAO;
import dao.ArticleDAOImp;
import model.Article;
import model.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.List;

@WebServlet("/addArticleController")
@MultipartConfig
public class AddArticleController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");

        // User Information
        User user  = (User) req.getSession().getAttribute("userInformation");

        // File Path
        String folderName = "uploadFolder";
        String uploadPath = req.getServletContext().getRealPath("") + folderName ;

        File dir = new File(uploadPath);

        if(!dir.exists()){
            dir.mkdirs();
        }

        // File Uploading
        Part filePart = req.getPart("file");

        String fileName = filePart.getSubmittedFileName();
        String path = folderName + File.separator + fileName;

        InputStream fileContent = filePart.getInputStream();
        Files.copy(fileContent,Paths.get(uploadPath + File.separator + fileName), StandardCopyOption.REPLACE_EXISTING);

        int articleStatus = 1;
        String editorName = "Faruk";
        String title = req.getParameter("textTitle");
        String subject = req.getParameter("textSubject");
        String keywords = req.getParameter("textKeywords");
        String languange = req.getParameter("textLanguange");
        String copyright = req.getParameter("textCopyright");
        String journalName = req.getParameter("textJournalName");
        String authorName = user.getFirstName() + " " + user.getLastName();

        ArticleDAO articleDAO = new ArticleDAOImp();
        articleDAO.addArticle(articleStatus,title,subject,keywords,languange,copyright,fileName,journalName,authorName,editorName);

        List<Article> articles = articleDAO.getAllArticle(authorName);

        req.getSession().setAttribute("articles",articles);

        RequestDispatcher requestDispatcher = req.getRequestDispatcher("dashboard.jsp");
        requestDispatcher.forward(req,resp);


    }
}
