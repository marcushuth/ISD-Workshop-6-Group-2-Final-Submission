/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Catalogue.model;

/**
 *
 * @author New
 */
public class Movie {
    
    int id; 
    String title;
    double price;
    int amount;
    String genre; 
    
    public Movie(int id, String title, double price, int amount, String genre) {
        this.id = id;
        this.title = title;
        this.price = price; 
        this.amount = amount;
        this.genre = genre; 
    }
    
    public int getID() {return id;}
    public String getTitle() {return title;}
    public double getPrice() {return price;}
    public int getAmount() {return amount;}
    public String getGenre() {return genre;}
}

