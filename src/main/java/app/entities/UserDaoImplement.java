package app.entities;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import app.entities.User;
import app.model.DatabaseConnection;

public class UserDaoImplement implements UserDao {
    static Connection con
            = DatabaseConnection.getConnection();
    @Override
    public int add(User user)
            throws SQLException
    {
        String query
                = "insert into users(name,lastName,patronymic,age,password,email) VALUES (?,?,?,?,?,?)";
        PreparedStatement ps
                = con.prepareStatement(query);
        ps.setString(1, user.getName());
        ps.setString(2, user.getLastName());
        ps.setString(3, user.getPatronymic());
        ps.setDate(4, user.getAge());
        ps.setString(5, user.getPasswordHash());
        ps.setString(6, user.getEmail());
        int n = ps.executeUpdate();
        return n;
    }

    @Override
    public void delete(int id)
            throws SQLException
    {
        String query
                = "delete from users where id =?";
        PreparedStatement ps
                = con.prepareStatement(query);
        ps.setInt(1, id);
        ps.executeUpdate();
    }

    @Override
    public User getUser(int id)
            throws SQLException
    {
        String query
                = "select * from users where id= ?";
        PreparedStatement ps
                = con.prepareStatement(query);

        ps.setInt(1, id);
        User emp = new User();
        ResultSet rs = ps.executeQuery();
        boolean check = false;

        while (rs.next()) {
            check = true;
            emp.setId(rs.getInt("id"));
            emp.setName(rs.getString("name"));
            emp.setLastName(rs.getString("lastName"));
            emp.setPatronymic(rs.getString("patronymic"));
            emp.setAge(rs.getDate("age"));
            emp.setEmail(rs.getString("email"));
            emp.setCurrentMoney(rs.getBigDecimal("currentMoney"));
            emp.setPassword(rs.getString("password"));
            emp.setAdmin(rs.getBoolean("admin"));
        }

        if (check == true) {
            return emp;
        }
        else
            return null;
    }

    @Override
    public User getAuth(User user)
            throws SQLException
    {
        String query
                = "select * from users where email like ? and password like ?";
        PreparedStatement ps
                = con.prepareStatement(query);

        ps.setString(1, user.getEmail());
        ps.setString(2, user.getPasswordHash());

        User emp = new User();
        ResultSet rs = ps.executeQuery();
        boolean check = false;
        int count = 0;

        while (rs.next()) {
            count++;
            check = true;
            emp.setId(rs.getInt("id"));
            emp.setName(rs.getString("name"));
            emp.setLastName(rs.getString("lastName"));
            emp.setPatronymic(rs.getString("patronymic"));
            emp.setAge(rs.getDate("age"));
            emp.setEmail(rs.getString("email"));
            emp.setCurrentMoney(rs.getBigDecimal("currentMoney"));
            emp.setPassword(rs.getString("password"));
            emp.setAdmin(rs.getBoolean("admin"));
        }

        if (check == true) {
            return emp;
        }
        else
            return null;
    }

    @Override
    public List<User> getUsers()
            throws SQLException
    {
        String query = "select * from users";
        PreparedStatement ps
                = con.prepareStatement(query);
        ResultSet rs = ps.executeQuery();
        List<User> ls = new ArrayList();

        while (rs.next()) {
            User emp = new User();
            emp.setId(rs.getInt("id"));
            emp.setName(rs.getString("name"));
            emp.setLastName(rs.getString("lastName"));
            emp.setPatronymic(rs.getString("patronymic"));
            emp.setAge(rs.getDate("age"));
            emp.setEmail(rs.getString("email"));
            emp.setCurrentMoney(rs.getBigDecimal("currentMoney"));
            emp.setPassword(rs.getString("password"));
            emp.setAdmin(rs.getBoolean("admin"));
            ls.add(emp);
        }
        return ls;
    }

    @Override
    public void update(User user)
            throws SQLException
    {
        String query
                = "update users set name=?, "
                + " lastName= ?, patronymic=?,age=?,currentMoney=?,password=?,email=? where id = ?";
        PreparedStatement ps
                = con.prepareStatement(query);
        ps.setString(1, user.getName());
        ps.setString(2, user.getLastName());
        ps.setString(3, user.getPatronymic());
        ps.setDate(4, user.getAge());
        ps.setBigDecimal(5, user.getCurrentMoney());
        ps.setString(6, user.getPasswordHash());
        ps.setString(7, user.getEmail());
        ps.setInt(8,user.getId());
        ps.executeUpdate();
    }


}
