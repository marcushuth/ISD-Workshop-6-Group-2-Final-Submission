/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.isd.model;
    import java.io.Serializable;
/**
 *
 * @author 99161820
 */
public class User implements Serializable{
    private String userID;
    private String action;
    private String date;
    private String time;
    
    
    public User() { }
    

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public void setAction(String action) {
        this.action = action;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getUserID() {
        return userID;
    }

    public String getAction() {
        return action;
    }

    public String getDate() {
        return date;
    }

    public String getTime() {
        return time;
    }

    public User(String userID, String action, String date, String time) {
        this.userID = userID;
        this.action = action;
        this.date = date;
        this.time = time;
    }}
    

    