package model;

public class Article {

    private int id;
    private int articleStatus;
    private String title;
    private String subject;
    private String keywords;
    private String languange;
    private String copyright;
    private String filePath;
    private String journalName;
    private String authorName;
    private String editorName;
    private String refereeName;
    private String rejectText;

    public Article(int id, int articleStatus, String title, String subject, String keywords, String languange, String copyright, String filePath, String journalName, String authorName, String editorName, String refereeName, String rejectText) {
        this.id = id;
        this.articleStatus = articleStatus;
        this.title = title;
        this.subject = subject;
        this.keywords = keywords;
        this.languange = languange;
        this.copyright = copyright;
        this.filePath = filePath;
        this.journalName = journalName;
        this.authorName = authorName;
        this.editorName = editorName;
        this.refereeName = refereeName;
        this.rejectText = rejectText;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getArticleStatus() {
        return articleStatus;
    }

    public void setArticleStatus(int articleStatus) {
        this.articleStatus = articleStatus;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getKeywords() {
        return keywords;
    }

    public void setKeywords(String keywords) {
        this.keywords = keywords;
    }

    public String getLanguange() {
        return languange;
    }

    public void setLanguange(String languange) {
        this.languange = languange;
    }

    public String getCopyright() {
        return copyright;
    }

    public void setCopyright(String copyright) {
        this.copyright = copyright;
    }

    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }

    public String getJournalName() {
        return journalName;
    }

    public void setJournalName(String journalName) {
        this.journalName = journalName;
    }

    public String getAuthorName() {
        return authorName;
    }

    public void setAuthorName(String authorName) {
        this.authorName = authorName;
    }

    public String getEditorName() {
        return editorName;
    }

    public void setEditorName(String editorName) {
        this.editorName = editorName;
    }

    public String getRefereeName() {
        return refereeName;
    }

    public void setRefereeName(String refereeName) {
        this.refereeName = refereeName;
    }

    public String getRejectText() {
        return rejectText;
    }

    public void setRejectText(String rejectText) {
        this.rejectText = rejectText;
    }
}
