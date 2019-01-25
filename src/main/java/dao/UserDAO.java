package dao;

import model.User;

import java.util.List;

public interface UserDAO {

    public int[] getUserType(String username,String password);

    public User getUserById(int id);

    public List<User> getRefereeList();

    public void addUser(String firstName,String lastName,String username,String password,String gender,String location,int userType);

    public void updateUser(int userId,String firstName, String lastName,String username, String password, String gender, String location);

}
