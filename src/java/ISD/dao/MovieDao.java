package ISD.dao;

import ISD.util.DBUtil;
import ISD.entity.Movie;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class MovieDao {
   
    
    public List<Movie> selectAll(Integer id) throws SQLException{
        List<Object> preparms = new ArrayList();
        List<Movie> movies = new ArrayList<Movie>();
        String sql = "select * from moive where 1=1 ";
        if(id!=null){
            sql+=" and id=?";
            preparms.add(id);
        }
        ResultSet rs=DBUtil.runSelectSql(sql, preparms.toArray()); 
        while(rs.next()){  
                    Movie movie=new Movie();  
                    movie.setId(rs.getInt("ID"));
                    movie.setMovieName(rs.getString("movie_name"));
                    movie.setMoviePrice(rs.getDouble("movie_price"));
                    movie.setStoage(rs.getInt("movie_stoage"));
                    movies.add(movie);  
                }  
        return  movies;
     }
    
    public Movie selectById(int id) throws SQLException{
        return  selectAll(id).get(0);
     }
    
    public void updateMovieStoage(int id,int quantity) throws SQLException{
        List<Object> preparms = new ArrayList();
        String sql = "update moive set movie_stoage=? where id = ? ";
        preparms.add(quantity);
        preparms.add(id);
        DBUtil.runNoSelectSql(sql, preparms.toArray());
    }
}
