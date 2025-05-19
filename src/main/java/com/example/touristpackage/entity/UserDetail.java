package com.example.touristpackage.entity;

public class UserDetail {
    private String username;
    private String fullname;
    private String contact;
    private String email;
    private String nic;

    public UserDetail(String username, String fullname, String contact, String email, String nic) {
        this.username = username;
        this.fullname = fullname;
        this.contact = contact;
        this.email = email;
        this.nic = nic;
    }

    public String getUsername() { return username; }
    public String getFullname() { return fullname; }
    public String getContact() { return contact; }
    public String getEmail() { return email; }
    public String getNic() { return nic; }

    public void setFullname(String fullname) { this.fullname = fullname; }
    public void setContact(String contact) { this.contact = contact; }
    public void setEmail(String email) { this.email = email; }
    public void setNic(String nic) { this.nic = nic; }
}
