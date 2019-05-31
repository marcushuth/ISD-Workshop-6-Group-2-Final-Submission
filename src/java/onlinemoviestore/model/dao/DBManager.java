package onlinemoviestore.model.dao;

import onlinemoviestore.model.User;
import java.sql.*;
import java.sql.PreparedStatement;

public class DBManager {

    private Statement st;
    
    
    public DBManager(Connection con) throws SQLException {
        st = con.createStatement();
    }

    public void addUser(User user) throws SQLException, ClassNotFoundException {
        String sql = "INSERT INTO OMVUSER" + "(FULL_NAME,PHONE_NUMBER,USERNAME,PASSWORD)" + "VALUES (?,?,?,?)";

        DBConnector con =  new DBConnector();
               con.openConnection();
        
        PreparedStatement statement = null;
        
            statement = con.prepareStatement(sql);

            statement.setString(1, user.getName());
            statement.setString(2, user.getPhone());
            statement.setString(3, user.getEmail());
            statement.setString(4, user.getPassword());

            statement.executeUpdate(sql);
      
        
            //if (statement != null) {
              //  statement.close();
            //}

            if (con != null) {
                con.closeConnection();
            }
    }
}