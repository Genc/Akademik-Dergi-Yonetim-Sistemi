package dao;

import model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class UserDAOImp implements UserDAO {

    private static final String ADD_USER = "insert into user(firstName,lastName,username,password,gender,location,userType) values (?,?,?,?,?,?,?)";
    private static final String UPDATE_USER = "update user set firstName=?, lastName=?, username=?, password=?, gender=?, location=?  where userId=?";
    private static final String GET_USER = "select * from user where userId=?";
    private static final String USER_TYPE = "select * from user where userName=? and password=?";
    private static final String GET_ALL_REFEREE ="select * from user where userType=3";

    Connection connection;

    public UserDAOImp(){
        connection = ConnectionManager.getDatabase();
    }

    @Override
    public int[] getUserType(String username, String password) {
        int result[] = {-1, 0};

        if(connection == null){
            return result;
        }

        try{
            PreparedStatement preparedStatement = connection.prepareStatement(USER_TYPE);
            preparedStatement.setString(1,username);
            preparedStatement.setString(2,password);

            ResultSet resultSet = preparedStatement.executeQuery();

            if(resultSet.next()){
                result[0] = resultSet.getInt("userType");
                result[1] = resultSet.getInt("userId");
            }
            else {
                result[0] = 0;
            }

        }catch (Exception e){
            e.printStackTrace();
        }


        return result;
    }

    @Override
    public User getUserById(int id) {
        try{
            PreparedStatement preparedStatement = connection.prepareStatement(GET_USER);
            preparedStatement.setInt(1,id);

            ResultSet resultSet = preparedStatement.executeQuery();

            while(resultSet.next()){
                id = resultSet.getInt(1);
                String firstname = resultSet.getString(2);
                String lastname = resultSet.getString(3);
                String username = resultSet.getString(4);
                String gender = resultSet.getString(6);
                String location = resultSet.getString(7);
                User user = new User(id,firstname,lastname,username,gender,location);
                return user;
            }

        }
        catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<User> getRefereeList() {

        List<User> refereeList = new ArrayList<User>();

        try {

            PreparedStatement preparedStatement = connection.prepareStatement(GET_ALL_REFEREE);
            ResultSet resultSet = preparedStatement.executeQuery();

            while(resultSet.next()){
                int id = resultSet.getInt(1);
                String firstname = resultSet.getString(2);
                String lastname = resultSet.getString(3);
                String username = resultSet.getString(4);
                User user = new User(id,firstname,lastname,username);
                refereeList.add(user);
            }

        }
        catch (Exception e){
            e.printStackTrace();
        }
        return refereeList;
    }

    @Override
    public void addUser(String firstName, String lastName, String username, String password, String gender, String location,int userType) {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(ADD_USER);
            preparedStatement.setString(1,firstName);
            preparedStatement.setString(2,lastName);
            preparedStatement.setString(3,username);
            preparedStatement.setString(4,password);
            preparedStatement.setString(5,gender);
            preparedStatement.setString(6,location);
            preparedStatement.setInt(7,userType);
            preparedStatement.executeUpdate();
        }
        catch (Exception e){
            e.printStackTrace();
        }
    }

    @Override
    public void updateUser(int userId,String firstName, String lastName, String username, String password, String gender, String location) {

        try{
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_USER);
            preparedStatement.setString(1,firstName);
            preparedStatement.setString(2,lastName);
            preparedStatement.setString(3,username);
            preparedStatement.setString(4,password);
            preparedStatement.setString(5,gender);
            preparedStatement.setString(6,location);
            preparedStatement.setInt(7,userId);
            preparedStatement.executeUpdate();
        }
        catch (Exception e){
            e.printStackTrace();
        }
    }
}
