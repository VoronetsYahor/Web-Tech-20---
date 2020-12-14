package app.entities;
import java.sql.SQLException;
import java.util.List;

import app.entities.UserDao;

public interface UserDao {
    public int add(User emp)
            throws SQLException;
    public void delete(int id)
            throws SQLException;
    public User getUser(int id)
            throws SQLException;
    public List<User> getUsers()
            throws SQLException;
    public void update(User emp)
            throws SQLException;
    public User getAuth(User emp)
            throws SQLException;
}
