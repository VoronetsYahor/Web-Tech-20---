package app.entities;

import java.sql.SQLException;
import java.util.List;

public interface EmulateBankDao {
    public int add(EmulateBank bankAccount)
            throws SQLException;
    public void delete(int id)
            throws SQLException;
    public EmulateBank getBankAccount(int id)
            throws SQLException;
    public List<EmulateBank> getBankAccounts()
            throws SQLException;
    public void update(EmulateBank bankAccount)
            throws SQLException;

}
