package app.entities;

import app.model.DatabaseConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class VehicleDaoImplement implements VehicleDao{
    static Connection con = DatabaseConnection.getConnection();

    @Override
    public int add(Vehicle vehicle) throws SQLException {
        String query
                = "insert into vehicle(name,dayCost,description,class,imagePath) VALUES (?,?,?,?,?)";
        PreparedStatement ps
                = con.prepareStatement(query);
        ps.setString(1, vehicle.getName());
        ps.setBigDecimal(2, vehicle.getDayCost());
        ps.setString(3, vehicle.getDescription());
        ps.setShort(4, vehicle.getVehClass());
        ps.setString(5, vehicle.getImagePath());

        int n = ps.executeUpdate();
        return n;
    }

    @Override
    public void delete(int id) throws SQLException {
        String query
                = "delete from vehicle where id =?";
        PreparedStatement ps
                = con.prepareStatement(query);
        ps.setInt(1, id);
        ps.executeUpdate();
    }

    @Override
    public Vehicle getVehicle(int id) throws SQLException {
        String query
                = "select * from vehicle where id= ?";
        PreparedStatement ps
                = con.prepareStatement(query);

        ps.setInt(1, id);
        Vehicle emp = new Vehicle();
        ResultSet rs = ps.executeQuery();
        boolean check = false;

        while (rs.next()) {
            check = true;
            emp.setId(rs.getInt("id"));
            emp.setName(rs.getString("name"));
            emp.setDayCost((rs.getBigDecimal("dayCost")));
            emp.setDescription(rs.getString("description"));
            emp.setVehClass(rs.getShort("class"));
            emp.setImagePath(rs.getString("imagePath"));

        }

        if (check == true) {
            return emp;
        }
        else
            return null;
    }

    @Override
    public List<Vehicle> getVehicles() throws SQLException {
        String query
                = "select * from vehicle";
        PreparedStatement ps
                = con.prepareStatement(query);
        ResultSet rs = ps.executeQuery();
        boolean check = false;
        int count = 0;
        List<Vehicle> list = new ArrayList();

        while (rs.next()) {
            Vehicle emp = new Vehicle();
            count++;
            check = true;
            emp.setId(rs.getInt("id"));
            emp.setName(rs.getString("name"));
            emp.setDayCost((rs.getBigDecimal("dayCost")));
            emp.setDescription(rs.getString("description"));
            emp.setVehClass(rs.getShort("class"));
            emp.setImagePath(rs.getString("imagePath"));
            list.add(emp);
        }

        if (check == true) {
            return list;
        }
        else
            return null;
    }

    @Override
    public void update(Vehicle vehicle) throws SQLException {
        String query
                = "update vehicle set name = ?, "
                + " dayCost = ?, description = ?, class = ?, imagePath = ? where id = ?";
        PreparedStatement ps
                = con.prepareStatement(query);
        ps.setString(1, vehicle.getName());
        ps.setBigDecimal(2, vehicle.getDayCost());
        ps.setString(3, vehicle.getDescription());
        ps.setShort(4,vehicle.getVehClass());
        ps.setString(5, vehicle.getImagePath());
        ps.setInt(6, vehicle.getId());
        ps.executeUpdate();
    }
}
