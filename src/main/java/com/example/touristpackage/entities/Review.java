package com.example.touristpackage.entity;

public class Review {
    private String username;
    private String date;
    private String reviewText;
    private int rating;

    public Review(String username, String date, String reviewText, int rating) {
        this.username = username;
        this.date = date;
        this.reviewText = reviewText;
        this.rating = rating;
    }

    public String getUsername() { return username; }
    public String getDate() { return date; }
    public String getReviewText() { return reviewText; }
    public int getRating() { return rating; }

    public String toDataString() {
        return username + "," + date + "," + reviewText.replace(",", " ") + "," + rating;
    }

    public Review(String username, String date, int rating, String reviewText) {
        this.username = username;
        this.date = date;
        this.rating = rating;
        this.reviewText = reviewText;
    }

}
