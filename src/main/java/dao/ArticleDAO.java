package dao;

import model.Article;

import java.util.List;

public interface ArticleDAO {

    public void addArticle(int articleStatus, String title, String subject, String keywords, String languange, String copyright, String filePath, String journalName, String authorName, String editorName);

    public void assignmentReferee(int id,int articleStatus,String refereeName);

    public void rejectionToArticle(int id,int articleStatus,String rejectText);

    public void successfulConfirmedForReferee(int id,int articleStatus);

    public List<Article> getAllArticleForEditor();

    public List<Article> getAllArticle(String authorName);

    public List<Article> getArticleForReferee(String refereeName);

    public Article getArticleById(int id);

}
