package com.example.touristpackage.entity;

public class CustomPackage {
    private String country;
    private int flightPrice;
    private int dayPrice;

    public CustomPackage(String country, int flightPrice, int dayPrice) {
        this.country = country;
        this.flightPrice = flightPrice;
        this.dayPrice = dayPrice;
    }

    public String getCountry() {
        return country;
    }

    public int getFlightPrice() {
        return flightPrice;
    }

    public int getDayPrice() {
        return dayPrice;
    }

    public void setFlightPrice(int flightPrice) {
        this.flightPrice = flightPrice;
    }

    public void setDayPrice(int dayPrice) {
        this.dayPrice = dayPrice;
    }
}