package com.example.touristpackage.entity;

public class BasicPackage {
    private String id;
    private String name;
    private String destination;
    private int days;
    private double price;
    private String description;

    public BasicPackage(String id, String name, String destination, int days, double price, String description) {
        this.id = id;
        this.name = name;
        this.destination = destination;
        this.days = days;
        this.price = price;
        this.description = description;
    }

    // Getters
    public String getId() { return id; }
    public String getName() { return name; }
    public String getDestination() { return destination; }
    public int getDays() { return days; }
    public double getPrice() { return price; }
    public String getDescription() { return description; }

    // Setters (optional)
    public void setId(String id) { this.id = id; }
    public void setName(String name) { this.name = name; }
    public void setDestination(String destination) { this.destination = destination; }
    public void setDays(int days) { this.days = days; }
    public void setPrice(double price) { this.price = price; }
    public void setDescription(String description) { this.description = description; }
}
