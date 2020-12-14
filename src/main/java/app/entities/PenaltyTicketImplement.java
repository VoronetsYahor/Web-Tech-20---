package app.entities;

import app.model.DatabaseConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PenaltyTicketImplement implements PenaltyTicketDao{
    static Connection con = DatabaseConnection.getConnection();

    @Override
    public int add(PenaltyTicket penaltyTicket) throws SQLException {
        String query
                = "insert into penalty_ticket(ticket_id,user_id,admin_id,vehicle_id,description,cost) VALUES (?,?,?,?,?,?)";
        PreparedStatement ps
                = con.prepareStatement(query);
        ps.setInt(1, penaltyTicket.getTicket_id());
        ps.setInt(2, penaltyTicket.getUser_id());
        ps.setInt(3, penaltyTicket.getAdmin_id());
        ps.setInt(4, penaltyTicket.getVehicle_id());
        ps.setString(5, penaltyTicket.getDescription());
        ps.setBigDecimal(6, penaltyTicket.getCost());
        int n = ps.executeUpdate();
        return n;
    }

    @Override
    public void delete(int id) throws SQLException {
        String query
                = "delete from penalty_ticket where id =?";
        PreparedStatement ps
                = con.prepareStatement(query);
        ps.setInt(1, id);
        ps.executeUpdate();
    }

    @Override
    public PenaltyTicket getPenaltyTicket(int id) throws SQLException {
        String query
                = "select * from penalty_ticket where id= ?";
        PreparedStatement ps
                = con.prepareStatement(query);

        ps.setInt(1, id);
        PenaltyTicket emp = new PenaltyTicket();
        ResultSet rs = ps.executeQuery();
        boolean check = false;

        while (rs.next()) {
            check = true;
            emp.setId(rs.getInt("id"));
            emp.setTicket_id((rs.getInt("ticket_id")));
            emp.setUser_id(rs.getInt("user_id"));
            emp.setAdmin_id(rs.getInt("admin_id"));
            emp.setVehicle_id(rs.getInt("vehicle_id"));
            emp.setDescription(rs.getString("description"));
            emp.setCost(rs.getBigDecimal("cost"));
        }

        if (check == true) {
            return emp;
        }
        else
            return null;
    }

    @Override
    public List<PenaltyTicket> getPenaltyTickets() throws SQLException {
        String query
                = "select * from penalty_ticket";
        PreparedStatement ps
                = con.prepareStatement(query);
        ResultSet rs = ps.executeQuery();
        boolean check = false;
        int count = 0;
        List<PenaltyTicket> list = new ArrayList();

        while (rs.next()) {
            PenaltyTicket emp = new PenaltyTicket();

            count++;
            check = true;
            emp.setId(rs.getInt("id"));
            emp.setTicket_id((rs.getInt("ticket_id")));
            emp.setUser_id(rs.getInt("user_id"));
            emp.setAdmin_id(rs.getInt("admin_id"));
            emp.setVehicle_id(rs.getInt("vehicle_id"));
            emp.setDescription(rs.getString("description"));
            emp.setCost(rs.getBigDecimal("cost"));
            list.add(emp);
        }

        if (check == true) {
            return list;
        }
        else
            return null;
    }

    @Override
    public void update(PenaltyTicket penaltyTicket) throws SQLException {
        String query
                = "update penalty_ticket set ticket_id = ?, "
                + " user_id = ?, admin_id = ?, vehicle_id = ?, description = ? where id = ?";
        PreparedStatement ps
                = con.prepareStatement(query);
        ps.setInt(1, penaltyTicket.getTicket_id());
        ps.setInt(2, penaltyTicket.getUser_id());
        ps.setInt(3, penaltyTicket.getAdmin_id());
        ps.setInt(4, penaltyTicket.getVehicle_id());
        ps.setString(5, penaltyTicket.getDescription());
        ps.setInt(6, penaltyTicket.getId());

        ps.executeUpdate();
    }
}
