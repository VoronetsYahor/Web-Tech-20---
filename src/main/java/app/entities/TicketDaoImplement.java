package app.entities;

import app.model.DatabaseConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TicketDaoImplement implements TicketDao{
    static Connection con = DatabaseConnection.getConnection();

    @Override
    public int add(Ticket ticket) throws SQLException {
        String query
                = "insert into tickets(user_id,vehicle_id,cost,description,dateFrom,dateTo,status) VALUES (?,?,?,?,?,?,?)";
        PreparedStatement ps
                = con.prepareStatement(query);
        ps.setInt(1, ticket.getUser_id());
        ps.setInt(2, ticket.getVehicle_id());
        ps.setBigDecimal(3, ticket.getCost());
        ps.setString(4, ticket.getDescription());
        ps.setTimestamp(5, ticket.getDateFrom());
        ps.setTimestamp(6, ticket.getDateTo());
        ps.setShort(7, ticket.getStatus());

        int n = ps.executeUpdate();
        return n;
    }

    @Override
    public void delete(int id) throws SQLException {
        String query
                = "delete from tickets where id =?";
        PreparedStatement ps
                = con.prepareStatement(query);
        ps.setInt(1, id);
        ps.executeUpdate();
    }

    @Override
    public Ticket getTicket(int id) throws SQLException {
        String query
                = "select * from tickets where id= ?";
        PreparedStatement ps
                = con.prepareStatement(query);

        ps.setInt(1, id);
        Ticket emp = new Ticket();
        ResultSet rs = ps.executeQuery();
        boolean check = false;

        while (rs.next()) {
            check = true;
            emp.setId(rs.getInt("id"));
            emp.setUser_id(rs.getInt("user_id"));
            emp.setVehicle_id((rs.getInt("vehicle_id")));
            emp.setManager_id(rs.getInt("manager_id"));
            emp.setCost(rs.getBigDecimal("cost"));
            emp.setDescription(rs.getString("description"));
            emp.setDateFrom(rs.getTimestamp("dateFrom"));
            emp.setDateTo(rs.getTimestamp("dateTo"));
            emp.setStatus(rs.getShort("status"));

        }

        if (check == true) {
            return emp;
        }
        else
            return null;
    }

    @Override
    public List<Ticket> getTickets() throws SQLException {
        String query
                = "select * from tickets";
        PreparedStatement ps
                = con.prepareStatement(query);
        ResultSet rs = ps.executeQuery();
        boolean check = false;
        int count = 0;
        List<Ticket> list = new ArrayList();

        while (rs.next()) {
            Ticket emp = new Ticket();
            count++;
            check = true;
            emp.setId(rs.getInt("id"));
            emp.setUser_id(rs.getInt("user_id"));
            emp.setVehicle_id((rs.getInt("vehicle_id")));
            emp.setManager_id(rs.getInt("manager_id"));
            emp.setCost(rs.getBigDecimal("cost"));
            emp.setDescription(rs.getString("description"));
            emp.setDateFrom(rs.getTimestamp("dateFrom"));
            emp.setDateTo(rs.getTimestamp("dateTo"));
            emp.setStatus(rs.getShort("status"));
            list.add(emp);
        }
        if (check == true) {
            return list;
        }
        else
            return null;
    }

    @Override
    public void update(Ticket ticket) throws SQLException {
        String query
                = "update tickets set userid = ?, "
                + " vehicle_id = ?, manager_id = ?, cost = ?, description = ?, dateFrom = ?, dateTo = ?, status = ? where id = ?";
        PreparedStatement ps
                = con.prepareStatement(query);
        ps.setInt(1, ticket.getUser_id());
        ps.setInt(2, ticket.getVehicle_id());
        ps.setInt(3, ticket.getManager_id());
        ps.setBigDecimal(4,ticket.getCost());
        ps.setString(5, ticket.getDescription());
        ps.setTimestamp(6, ticket.getDateFrom());
        ps.setTimestamp(7, ticket.getDateTo());
        ps.setShort(8, ticket.getStatus());
        ps.executeUpdate();
    }
}