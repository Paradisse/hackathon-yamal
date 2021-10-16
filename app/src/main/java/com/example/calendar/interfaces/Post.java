package com.example.calendar.interfaces;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

public class Post {
    @SerializedName("id")
    @Expose
    private int id;

    @SerializedName("first_name")
    @Expose
    private String first_name;

    @SerializedName("second_name")
    @Expose
    private String second_name;

    @SerializedName("patronymics")
    @Expose
    private String patronymics;

    @SerializedName("email")
    @Expose
    private String email;

    public int getId(){
        return id;
    }

    public void setId(int id){
        this.id = id;
    }

    public String getFirstName(){
        return first_name;
    }

    public void setFirst_name(String first_name) {
        this.first_name = first_name;
    }

    public String getSecond_name() {
        return second_name;
    }

    public void setSecond_name(String second_name) {
        this.second_name = second_name;
    }

    public String getPatronymics() {
        return patronymics;
    }

    public void setPatronymics(String patronymics) {
        this.patronymics = patronymics;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}