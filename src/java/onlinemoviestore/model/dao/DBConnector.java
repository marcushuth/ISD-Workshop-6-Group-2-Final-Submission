package onlinemoviestore.model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;


public class DBConnector extends DB{

    public DBConnector() throws ClassNotFoundException, SQLException {
        Class.forName(driver);
        con = DriverManager.getConnection(URL, dbuser, dbpass);
    }

    public Connection openConnection(){
        return this.con;
    }
    
    public void closeConnection() throws SQLException {
        this.con.close();
    }

    PreparedStatement prepareStatement(String sql) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    
}
