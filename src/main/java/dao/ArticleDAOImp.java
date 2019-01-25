package dao;

import model.Article;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

@SuppressWarnings("Duplicates")
public class ArticleDAOImp implements ArticleDAO {

    private static final String ADD_ARTICLE ="insert into article(articleStatus,title,subject,keywords,languange,copyright,filePath,journalName,authorName,editorName) values (?,?,?,?,?,?,?,?,?,?)";
    private static final String ALL_ARTICLES = "select * from article where authorName=?";
    private static final String GET_ARTICLE = "select * from article where articleId=?";
    private static final String GET_ARTICLE_FOR_EDITOR = "select * from article";
    private static final String ASSIGNMENT_REFEREE = "update article set articleStatus=?, refereeName=? where articleId=?";
    private static final String GET_REFEREE_ARTICLES = "select * from article where refereeName=?";
    private static final String REJECT_TO_ARTICLE = "update article set articleStatus=?, rejectText=? where articleId=?";
    private static final String CONFIRMED_ARTICLE_REFEREE = "update article set articleStatus=? where articleId=?";


    Connection connection;

    public ArticleDAOImp(){
        connection = ConnectionManager.getDatabase();
    }

    @Override
    public void addArticle(int articleStatus, String title, String subject, String keywords, String languange, String copyright, String filePath, String journalName, String authorName,String editorName) {
        try{
            PreparedStatement preparedStatement = connection.prepareStatement(ADD_ARTICLE);
            preparedStatement.setInt(1,articleStatus);
            preparedStatement.setString(2,title);
            preparedStatement.setString(3,subject);
            preparedStatement.setString(4,keywords);
            preparedStatement.setString(5,languange);
            preparedStatement.setString(6,copyright);
            preparedStatement.setString(7,filePath);
            preparedStatement.setString(8,journalName);
            preparedStatement.setString(9,authorName);
            preparedStatement.setString(10,editorName);
            preparedStatement.executeUpdate();
        }
        catch (Exception e){
            e.printStackTrace();
        }
    }

    @Override
    public void assignmentReferee(int id, int articleStatus, String refereeName) {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(ASSIGNMENT_REFEREE);
            preparedStatement.setInt(1,articleStatus);
            preparedStatement.setString(2,refereeName);
            preparedStatement.setInt(3,id);
            preparedStatement.executeUpdate();
        }
        catch (Exception e){
            e.printStackTrace();
        }
    }

    @Override
    public void rejectionToArticle(int id, int articleStatus, String rejectText) {
        try{
            PreparedStatement preparedStatement = connection.prepareStatement(REJECT_TO_ARTICLE);
            preparedStatement.setInt(1,articleStatus);
            preparedStatement.setString(2,rejectText);
            preparedStatement.setInt(3,id);
            preparedStatement.executeUpdate();
        }
        catch (Exception e){
            e.printStackTrace();
        }
    }

    @Override
    public void successfulConfirmedForReferee(int id, int articleStatus) {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(CONFIRMED_ARTICLE_REFEREE);
            preparedStatement.setInt(1,articleStatus);
            preparedStatement.setInt(2,id);
            preparedStatement.executeUpdate();
        }
        catch (Exception e){
            e.printStackTrace();
        }
    }

    @Override
    public List<Article> getAllArticleForEditor() {
        List<Article> articles = new ArrayList<Article>();
        try{
            PreparedStatement preparedStatement = connection.prepareStatement(GET_ARTICLE_FOR_EDITOR);
            ResultSet resultSet = preparedStatement.executeQuery();
            while(resultSet.next()){

                int id = resultSet.getInt(1);
                int articleStatus = resultSet.getInt(2);
                String title = resultSet.getString(3);
                String subject = resultSet.getString(4);
                String keywords = resultSet.getString(5);
                String languange = resultSet.getString(6);
                String copyright = resultSet.getString(7);
                String filePath = resultSet.getString(8);
                String journalName = resultSet.getString(9);
                String authorName = resultSet.getString(10);
                String editorName = resultSet.getString(11);
                String refereeName = resultSet.getString(12);
                String rejectText = resultSet.getString(13);

                Article article = new Article(id,articleStatus,title,subject,keywords,languange,copyright,filePath,journalName,authorName,editorName,refereeName,rejectText);
                articles.add(article);
            }
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return articles;
    }

    @Override
    public List<Article> getAllArticle(String authorName) {
        List<Article> articles = new ArrayList<Article>();

        try{
            PreparedStatement preparedStatement = connection.prepareStatement(ALL_ARTICLES);
            preparedStatement.setString(1,authorName);
            ResultSet resultSet = preparedStatement.executeQuery();

            while(resultSet.next()){

                int id = resultSet.getInt(1);
                int articleStatus = resultSet.getInt(2);
                String title = resultSet.getString(3);
                String subject = resultSet.getString(4);
                String keywords = resultSet.getString(5);
                String languange = resultSet.getString(6);
                String copyright = resultSet.getString(7);
                String filePath = resultSet.getString(8);
                String journalName = resultSet.getString(9);
                authorName = resultSet.getString(10);
                String editorName = resultSet.getString(11);
                String refereeName = resultSet.getString(12);
                String rejectText = resultSet.getString(13);

                Article article = new Article(id,articleStatus,title,subject,keywords,languange,copyright,filePath,journalName,authorName,editorName,refereeName,rejectText);
                articles.add(article);
            }
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return articles;
    }

    @Override
    public List<Article> getArticleForReferee(String refereeName) {

        List<Article> refereeArticles = new ArrayList<Article>();

        try{
            PreparedStatement preparedStatement = connection.prepareStatement(GET_REFEREE_ARTICLES);
            preparedStatement.setString(1,refereeName);
            ResultSet resultSet = preparedStatement.executeQuery();

            while(resultSet.next()){
                int id = resultSet.getInt(1);
                int articleStatus = resultSet.getInt(2);
                String title = resultSet.getString(3);
                String subject = resultSet.getString(4);
                String keywords = resultSet.getString(5);
                String languange = resultSet.getString(6);
                String copyright = resultSet.getString(7);
                String filePath = resultSet.getString(8);
                String journalName = resultSet.getString(9);
                String authorName = resultSet.getString(10);
                String editorName = resultSet.getString(11);
                String rejectText = resultSet.getString(13);
                Article article = new Article(id,articleStatus,title,subject,keywords,languange,copyright,filePath,journalName,authorName,editorName,refereeName,rejectText);
                refereeArticles.add(article);
            }

        }
        catch (Exception e){
            e.printStackTrace();
        }


        return refereeArticles;
    }

    @Override
    public Article getArticleById(int id) {

        try{
            PreparedStatement preparedStatement = connection.prepareStatement(GET_ARTICLE);
            preparedStatement.setInt(1,id);
            ResultSet resultSet = preparedStatement.executeQuery();

            while(resultSet.next()){
                id = resultSet.getInt(1);
                int articleStatus = resultSet.getInt(2);
                String title = resultSet.getString(3);
                String subject = resultSet.getString(4);
                String keywords = resultSet.getString(5);
                String languange = resultSet.getString(6);
                String copyright = resultSet.getString(7);
                String filePath = resultSet.getString(8);
                String journalName = resultSet.getString(9);
                String authorName = resultSet.getString(10);
                String editorName = resultSet.getString(11);
                String refereeName = resultSet.getString(12);
                String rejectText = resultSet.getString(13);

                Article article = new Article(id,articleStatus,title,subject,keywords,languange,copyright,filePath,journalName,authorName,editorName,refereeName,rejectText);
                return article;
            }
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }

}
