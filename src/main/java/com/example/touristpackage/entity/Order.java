package com.example.touristpackage.entity;

public class Order {
    private String username;
    private String title;
    private String name;
    private String email;
    private String contact;
    private String nationality;
    private int adults;
    private int kids;
    private String arrival;
    private int duration;
    private String country;
    private String message;
    private double totalCost;
    private String paymentMethod;
    private String paymentDate;
    private String paymentReference;
    private String status;

    public Order(String username, String title, String name, String email, String contact, String nationality,
                 int adults, int kids, String arrival, int duration, String country, String message,
                 double totalCost, String paymentMethod, String paymentDate, String paymentReference, String status) {
        this.username = username;
        this.title = title;
        this.name = name;
        this.email = email;
        this.contact = contact;
        this.nationality = nationality;
        this.adults = adults;
        this.kids = kids;
        this.arrival = arrival;
        this.duration = duration;
        this.country = country;
        this.message = message;
        this.totalCost = totalCost;
        this.paymentMethod = paymentMethod;
        this.paymentDate = paymentDate;
        this.paymentReference = paymentReference;
        this.status = status;
    }

    // Getters
    public String getUsername() { return username; }
    public String getTitle() { return title; }
    public String getName() { return name; }
    public String getEmail() { return email; }
    public String getContact() { return contact; }
    public String getNationality() { return nationality; }
    public int getAdults() { return adults; }
    public int getKids() { return kids; }
    public String getArrival() { return arrival; }
    public int getDuration() { return duration; }
    public String getCountry() { return country; }
    public String getMessage() { return message; }
    public double getTotalCost() { return totalCost; }
    public String getPaymentMethod() { return paymentMethod; }
    public String getPaymentDate() { return paymentDate; }
    public String getPaymentReference() { return paymentReference; }
    public String getStatus() { return status; }
    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public void setPaymentDate(String paymentDate) {
        this.paymentDate = paymentDate;
    }

    public void setPaymentReference(String paymentReference) {
        this.paymentReference = paymentReference;
    }

    public void setStatus(String status) {
        this.status = status;
    }


}
