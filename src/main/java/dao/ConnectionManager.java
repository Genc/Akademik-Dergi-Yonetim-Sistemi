package dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionManager {

    public static Connection getDatabase(){
        try{

            String url = "jdbc:mysql://localhost:3306/akademikdergi?useUnicode=true&useLegacyDatetimeCode=false&serverTimezone=Turkey";
            String username = "root";
            String password = "sifre";

            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(url,username,password);
            return connection;

        }
        catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }
}
