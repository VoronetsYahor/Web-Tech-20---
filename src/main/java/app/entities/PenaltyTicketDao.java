package app.entities;

import java.sql.SQLException;
import java.util.List;

public interface PenaltyTicketDao {
    public int add(PenaltyTicket penaltyTicket)
            throws SQLException;
    public void delete(int id)
            throws SQLException;
    public PenaltyTicket getPenaltyTicket(int id)
            throws SQLException;
    public List<PenaltyTicket> getPenaltyTickets()
            throws SQLException;
    public void update(PenaltyTicket penaltyTicket)
            throws SQLException;

}
