package controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

@WebServlet("/downloadServlet")
public class DownloadServletController extends HttpServlet {
    public static int BUFFER_SIZE = 1024*100;
    public static final String UPLOAD_DIR = "uploadFolder";
    public static String fileName = null;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    fileName = req.getParameter("fileName");

    String applicationPath = getServletContext().getRealPath("");
    String downloadPath = applicationPath + File.separator + UPLOAD_DIR;
    String filePath = downloadPath + File.separator + fileName;

        File file = new File(filePath);
        OutputStream outputStream = null;
        FileInputStream inputStream = null;

        if(file.exists()){
            String mimeType = "application/octet-stream";
            resp.setContentType(mimeType);

            String headerKey = "Content-Disposition";
            String headerValue = String.format("attachment; filename=\"%s\"",file.getName());
            resp.setHeader(headerKey,headerValue);

            try{
                outputStream = resp.getOutputStream();
                inputStream = new FileInputStream(file);
                byte [] buffer = new byte[BUFFER_SIZE];
                int bytesRead = -1;

                while((bytesRead = inputStream.read(buffer)) != -1){
                    outputStream.write(buffer,0,bytesRead);
                }
            }
            catch (Exception e){
                System.out.println("Error");
            }
            finally {
                if(inputStream != null){
                    inputStream.close();
                }
            }

            outputStream.flush();
            if(outputStream != null){
                outputStream.close();
            }

        }
        else {
            resp.setContentType("text/html");

            resp.getWriter().println("<h3> " + fileName + " dosyası bulunamadı... </h3>");

        }


    }
}
