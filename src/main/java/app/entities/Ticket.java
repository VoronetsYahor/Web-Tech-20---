package app.entities;

import java.math.BigDecimal;
import java.sql.Timestamp;
enum ticketStatus
{
    InProcess,
    WaitForEnding,
    Ended
}

public class Ticket {
    private int id;
    private int user_id;
    private int vehicle_id;
    private int manager_id;
    private BigDecimal cost;
    private String description;
    private java.sql.Timestamp dateFrom;
    private java.sql.Timestamp dateTo;
    private short status;
    public Ticket()
    {}
    public Ticket(int id, int user_id, int vehicle_id, int manager_id, BigDecimal cost, String description, Timestamp dateFrom, Timestamp dateTo, short status) {
        this.id = id;
        this.user_id = user_id;
        this.vehicle_id = vehicle_id;
        this.manager_id = manager_id;
        this.cost = cost;
        this.description = description;
        this.dateFrom = dateFrom;
        this.dateTo = dateTo;
        this.status = status;
    }

    public short getStatus() {
        return status;
    }

    public void setStatus(short status) {
        this.status = status;
    }

    public Timestamp getDateTo() {
        return dateTo;
    }

    public void setDateTo(Timestamp dateTo) {
        this.dateTo = dateTo;
    }

    public Timestamp getDateFrom() {
        return dateFrom;
    }

    public void setDateFrom(Timestamp dateFrom) {
        this.dateFrom = dateFrom;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public BigDecimal getCost() {
        return cost;
    }

    public void setCost(BigDecimal cost) {
        this.cost = cost;
    }

    public int getManager_id() {
        return manager_id;
    }

    public void setManager_id(int manager_id) {
        this.manager_id = manager_id;
    }

    public int getVehicle_id() {
        return vehicle_id;
    }

    public void setVehicle_id(int vehicle_id) {
        this.vehicle_id = vehicle_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
}
