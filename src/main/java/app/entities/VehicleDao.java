package app.entities;

import java.sql.SQLException;
import java.util.List;

public interface VehicleDao {
    public int add(Vehicle vehicle)
            throws SQLException;
    public void delete(int id)
            throws SQLException;
    public Vehicle getVehicle(int id)
            throws SQLException;
    public List<Vehicle> getVehicles()
            throws SQLException;
    public void update(Vehicle ticket)
            throws SQLException;
}
