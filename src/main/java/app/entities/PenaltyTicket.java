package app.entities;

import java.math.BigDecimal;
import java.math.BigInteger;

public class PenaltyTicket {

    private int id;
    private int ticket_id;
    private int user_id;
    private int admin_id;
    private int vehicle_id;
    ///JSON
    private String description;
    private BigDecimal cost;


    public PenaltyTicket(){}

    public PenaltyTicket(int id, int user_id, int ticket_id,int admin_id,int vehicle_id,String description,BigDecimal cost )
    {
        this.id = id;
        this.ticket_id = ticket_id;
        this.user_id = user_id;
        this.admin_id = admin_id;
        this.vehicle_id = vehicle_id;
        this.description = description;
        this.cost = cost;
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getTicket_id() {
        return ticket_id;
    }

    public void setTicket_id(int ticket_id) {
        this.ticket_id = ticket_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getAdmin_id() {
        return admin_id;
    }

    public void setAdmin_id(int admin_id) {
        this.admin_id = admin_id;
    }

    public int getVehicle_id() {
        return vehicle_id;
    }

    public void setVehicle_id(int vehicle_id) {
        this.vehicle_id = vehicle_id;
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
}
