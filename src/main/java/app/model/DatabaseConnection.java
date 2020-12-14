package app.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
private static Connection con = null;

static
{
     String url = "jdbc:mysql://127.0.0.1:3306/carrent?useUnicode=true&serverTimezone=UTC";
     String user = "root";
     String password = "root";
    try
    {
        String driverName = "com.mysql.jdbc.Driver";
        Class.forName(driverName);
        con = DriverManager.getConnection(url, user, password);
    }
    catch (ClassNotFoundException | SQLException e)
    {
        e.printStackTrace();
    }
}
public static Connection getConnection()
{
    return con;
}
}
