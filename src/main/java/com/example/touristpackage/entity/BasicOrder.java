package com.example.touristpackage.entity;

public class BasicOrder {
    private String username;
    private String packageId;
    private String name;
    private String email;
    private int adults;
    private String status;
    private int kids;
    private String arrivalDate;
    private String packageName;
    private double totalCost;
    private String paymentMethod;
    private String paymentReference;
    private String paymentDate;

    public BasicOrder(String username, String packageId, String name, String email, int adults, int kids,
                      String arrivalDate, String packageName, double totalCost,
                      String paymentMethod, String paymentReference, String paymentDate) {
        this.username = username;
        this.packageId = packageId;
        this.name = name;
        this.email = email;
        this.adults = adults;
        this.kids = kids;
        this.arrivalDate = arrivalDate;
        this.packageName = packageName;
        this.totalCost = totalCost;
        this.paymentMethod = paymentMethod;
        this.paymentReference = paymentReference;
        this.paymentDate = paymentDate;
    }
    public BasicOrder(String username, String packageId, String name, String email,
                      int adults, int kids, String arrivalDate, String packageName,
                      double totalCost, String paymentMethod, String paymentReference,
                      String paymentDate, String status) {
        this.username = username;
        this.packageId = packageId;
        this.name = name;
        this.email = email;
        this.adults = adults;
        this.kids = kids;
        this.arrivalDate = arrivalDate;
        this.packageName = packageName;
        this.totalCost = totalCost;
        this.paymentMethod = paymentMethod;
        this.paymentReference = paymentReference;
        this.paymentDate = paymentDate;
        this.status = status;
    }
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }


    // Getters
    public String getUsername() { return username; }
    public String getPackageId() { return packageId; }
    public String getName() { return name; }
    public String getEmail() { return email; }
    public int getAdults() { return adults; }
    public int getKids() { return kids; }
    public String getArrivalDate() { return arrivalDate; }
    public String getPackageName() { return packageName; }
    public double getTotalCost() { return totalCost; }
    public String getPaymentMethod() { return paymentMethod; }
    public String getPaymentReference() { return paymentReference; }
    public String getPaymentDate() { return paymentDate; }
}
