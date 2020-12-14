package app.entities;

import java.math.BigDecimal;

public class Vehicle {

    private int id;
    private String name;
    private BigDecimal dayCost;
    private String description;
    private short vehclass;
    private String imagePath;

    public Vehicle()
    {

    }

    public Vehicle(int id, String name, BigDecimal dayCost, String description, short vehclass, String imagePath) {
        this.id = id;
        this.name = name;
        this.dayCost = dayCost;
        this.description = description;
        this.vehclass = vehclass;
        this.imagePath = imagePath;
    }

    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }

    public short getVehClass() {
        return vehclass;
    }

    public void setVehClass(short vehclass) {
        this.vehclass = vehclass;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public BigDecimal getDayCost() {
        return dayCost;
    }

    public void setDayCost(BigDecimal dayCost) {
        this.dayCost = dayCost;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
}
