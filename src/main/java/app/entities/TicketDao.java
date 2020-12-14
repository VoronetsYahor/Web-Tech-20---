package app.entities;

import java.sql.SQLException;
import java.util.List;

public interface TicketDao {
    public int add(Ticket ticket)
            throws SQLException;
    public void delete(int id)
            throws SQLException;
    public Ticket getTicket(int id)
            throws SQLException;
    public List<Ticket> getTickets()
            throws SQLException;
    public void update(Ticket ticket)
            throws SQLException;
}
