package app.entities;

import app.model.DatabaseConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EmulateBankImplement implements EmulateBankDao {
    static Connection con = DatabaseConnection.getConnection();

    @Override
    public int add(EmulateBank bankAccount) throws SQLException {
        String query
                = "insert into emulatebank(userid,money) VALUES (?,?)";
        PreparedStatement ps
                = con.prepareStatement(query);
        ps.setInt(1, bankAccount.GetUserId());
        ps.setBigDecimal(2, bankAccount.GetMoney());
        int n = ps.executeUpdate();
        return n;
    }

    @Override
    public void delete(int id) throws SQLException {
        String query
                = "delete from emulatebank where id =?";
        PreparedStatement ps
                = con.prepareStatement(query);
        ps.setInt(1, id);
        ps.executeUpdate();
    }

    @Override
    public EmulateBank getBankAccount(int id) throws SQLException {
        String query
                = "select * from emulatebank where id= ?";
        PreparedStatement ps
                = con.prepareStatement(query);

        ps.setInt(1, id);
        EmulateBank emp = new EmulateBank();
        ResultSet rs = ps.executeQuery();
        boolean check = false;

        while (rs.next()) {
            check = true;
            emp.SetId(rs.getInt("id"));
            emp.SetUserId((rs.getInt("user_id")));
            emp.SetMoney(rs.getBigDecimal("money"));
        }

        if (check == true) {
            return emp;
        }
        else
            return null;
    }

    @Override
    public List<EmulateBank> getBankAccounts() throws SQLException {
        String query
                = "select * from emulatebank";
        PreparedStatement ps
                = con.prepareStatement(query);
        ResultSet rs = ps.executeQuery();
        boolean check = false;
        int count = 0;
        List<EmulateBank> list = new ArrayList();

        while (rs.next()) {
            EmulateBank emp = new EmulateBank();

            count++;
            check = true;
            emp.SetId(rs.getInt("id"));
            emp.SetUserId(rs.getInt("user_id"));
            emp.SetMoney(rs.getBigDecimal("money"));
            list.add(emp);
        }

        if (check == true) {
            return list;
        }
        else
            return null;
    }

    @Override
    public void update(EmulateBank bankAccount) throws SQLException {
        String query
                = "update emulatebank set user_id=?, "
                + " Money= ? where id = ?";
        PreparedStatement ps
                = con.prepareStatement(query);
        ps.setInt(1, bankAccount.GetUserId());
        ps.setBigDecimal(2, bankAccount.GetMoney());
        ps.setInt(3, bankAccount.GetId());

        ps.executeUpdate();
    }

}
