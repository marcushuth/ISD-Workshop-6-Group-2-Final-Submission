package ISD.entity;

public class Movie {
    private Integer id;
    private String movieName;
    private double moviePrice;
    private int stoage;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getMovieName() {
        return movieName;
    }

    public void setMovieName(String movieName) {
        this.movieName = movieName;
    }

    public double getMoviePrice() {
        return moviePrice;
    }

    public void setMoviePrice(double moviePrice) {
        this.moviePrice = moviePrice;
    }

    public int getStoage() {
        return stoage;
    }

    public void setStoage(int stoage) {
        this.stoage = stoage;
    }
    
    
}
