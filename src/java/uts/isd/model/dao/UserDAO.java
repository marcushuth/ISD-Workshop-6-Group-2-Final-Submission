/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.isd.model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.text.*;
import Model.User;

/**
 *
 * @author Patricia Ann Acosta
 */
public class UserDAO {

    private String jdbcURL;
    private String jdbcUsername;
    private String jdbcPassword;
    private Connection jdbcConnection;

    public UserDAO(String jdbcURL, String jdbcUsername, String jdbcPassword) {
        this.jdbcURL = "jdbc:derby://localhost:1527/onlinemoviestore"; //jdbcURL;
        this.jdbcUsername = "adminstaff";  //jdbcUsername;
        this.jdbcPassword = "adminstaff123"; //jdbcPassword;
        System.out.println("xx - " + this.jdbcURL);
    }

    protected void connect() throws SQLException {
        if (jdbcConnection == null || jdbcConnection.isClosed()) {
            try {
                Class.forName("org.apache.derby.jdbc.ClientDriver");
            } catch (ClassNotFoundException e) {
                throw new SQLException(e);
            }
            jdbcConnection = DriverManager.getConnection(
                    jdbcURL, jdbcUsername, jdbcPassword);
            jdbcConnection.setAutoCommit(true);
            System.out.println("dd - " + jdbcConnection);
        }
    }

    protected void disconnect() throws SQLException {
        if (jdbcConnection != null && !jdbcConnection.isClosed()) {
            jdbcConnection.close();
        }
    }

    public boolean insertUser(User user) throws SQLException {
        String sql = "INSERT INTO OMVUSER\n"
                + "(FULL_NAME, PHONE_NUMBER, USERNAME, PASSWORD, STATUS, ROLE)\n"
                + " VALUES(?, ?, ?, ?, ?, ?)";

        boolean rowInserted = false;
        connect();

        PreparedStatement statement = null;

        try {
            statement = jdbcConnection.prepareStatement(sql);
            System.out.println(sql);
            System.out.println(statement);
            statement.setString(2, user.getPhoneNumber());
            statement.setString(3, user.getUsername());
            statement.setString(4, user.getPassword());
            statement.setString(5, user.getStatus());
            statement.setString(6, user.getRole());
            statement.setString(1, user.getFullName());
            rowInserted = statement.executeUpdate() > 0;

            System.out.println(user.getFullName());
            System.out.println(user.getPhoneNumber());

        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            if (statement != null) {
                try {
                    statement.close();
                } catch (SQLException e) { /* ignored */

                }
            }
            disconnect();
        }
        return rowInserted;
    }

    public List<User> listAllUsers() throws SQLException {
        List<User> listUser = new ArrayList<>();

        String sql = "SELECT * FROM OMVUSER";
        System.out.println(sql);
        connect();
        Statement statement = null;
        ResultSet resultSet = null;
                
        try {
            statement = jdbcConnection.createStatement();
            System.out.println(statement);
            resultSet = statement.executeQuery(sql);
            //jdbcConnection.setAutoCommit(false);
            /*resultSet.next();
             System.out.println(resultSet.getString("FULL_NAME"));
             System.out.println(resultSet.getString("PHONE_NUMBER"));
             System.out.println(resultSet.getString("USERNAME"));
             System.out.println(resultSet.getString("PASSWORD"));
             System.out.println(resultSet.getString("STATUS"));
             System.out.println(resultSet.getString("ROLE"));*/

            while (resultSet.next()) {
                String FullName = resultSet.getString("FULL_NAME");
                String PhoneNumber = resultSet.getString("PHONE_NUMBER");
                String UserName = resultSet.getString("USERNAME");
                String Password = resultSet.getString("PASSWORD");
                String Status = resultSet.getString("STATUS");
                String Role = resultSet.getString("ROLE");

                User user = new User(FullName, PhoneNumber, UserName, Password, Status, Role);
                listUser.add(user);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            if (resultSet != null) {
                try {
                    resultSet.close();
                } catch (SQLException e) { /* ignored */
                }
            }
            if (statement != null) {
                try {
                    statement.close();
                } catch (SQLException e) { /* ignored */

                }
            }
           }
        disconnect();
        System.out.println(listUser);
        return listUser;
    }

    public boolean deleteUser(User user) throws SQLException {
        String sql = "DELETE FROM OMVUSER WHERE USERNAME = ?";

        boolean rowDeleted = false;
        connect();
        PreparedStatement statement = null;
        try {
            statement = jdbcConnection.prepareStatement(sql);
            statement.setString(1, user.getUsername());

            rowDeleted = statement.executeUpdate() > 0;
       } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            if (statement != null) {
                try {
                    statement.close();
                } catch (SQLException e) { /* ignored */

                }
            }
            disconnect();
        }
            
        return rowDeleted;
    }

    public boolean updateUser(User user) throws SQLException {
        String sql = "UPDATE OMVUSER SET FULL_NAME = ?, PHONE_NUMBER = ?, PASSWORD = ?, STATUS = ?, ROLE = ?";
        sql += " WHERE USERNAME = ?";
        
        boolean rowUpdated = false;
        connect();
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            statement = jdbcConnection.prepareStatement(sql);
            statement.setString(1, user.getFullName());
            statement.setString(2, user.getPhoneNumber());
            statement.setString(3, user.getPassword());
            statement.setString(4, user.getStatus());
            statement.setString(5, user.getRole());
            statement.setString(6, user.getUsername());

            rowUpdated = statement.executeUpdate() > 0;
        
            } catch (SQLException ex) {
                  ex.printStackTrace();
                  } finally {
                      if (resultSet != null) {
                          try {
                              resultSet.close();
                          } catch (SQLException e) { /* ignored */
                            }
                       }
                       if (statement != null) {
                           try {
                               statement.close();
                           } catch (SQLException e) { /* ignored */
                             }
                       }
                    }
        
        disconnect();
        return rowUpdated;
    }

    public  User getUser(String Uname) throws SQLException {
        User euser;
        euser = new User();
        String sql = "SELECT * FROM OMVUSER WHERE USERNAME = ?";

        connect();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        
        try {
            statement = jdbcConnection.prepareStatement(sql);
            statement.setString(1, Uname);
            System.out.println(sql);
            
            resultSet = statement.executeQuery();

            if (resultSet.next()) {
//                String FullName = resultSet.getString("FULL_NAME");
//                String PhoneNumber = resultSet.getString("PHONE_NUMBER");
//                String UserName = resultSet.getString("USERNAME");
//                String Password = resultSet.getString("PASSWORD");
//                String Status = resultSet.getString("STATUS");
//                String Role = resultSet.getString("ROLE");
                euser.setFullName(resultSet.getString("FULL_NAME"));
                euser.setPhoneNumber(resultSet.getString("PHONE_NUMBER"));
                euser.setUsername(resultSet.getString("USERNAME"));
                euser.setPassword(resultSet.getString("PASSWORD"));
                euser.setStatus(resultSet.getString("STATUS"));
                euser.setRole(resultSet.getString("ROLE"));

                //euser = new User(FullName, PhoneNumber, UserName, Password, Status, Role);
                }
              } catch (SQLException ex) {
                  ex.printStackTrace();
                  } finally {
                      if (resultSet != null) {
                          try {
                              resultSet.close();
                          } catch (SQLException e) { /* ignored */
                            }
                       }
                       if (statement != null) {
                           try {
                               statement.close();
                           } catch (SQLException e) { /* ignored */
                             }
                       }
                    }
        disconnect();
        System.out.println(euser);
        
        return euser;
    }
    /*    
     public User login(User bean) {
	
     //preparing some objects for connection 
     Statement statement = null;    
	
     String username = bean.getUsername();    
     String password = bean.getPassword();   
	    
     String searchQuery =
     "SELECT * FROM OMVUSER WHERE USERNAME='"
     + username
     + "' AND PASSWORD='"
     + password
     + "'";
	    
     // "System.out.println" prints in the console; Normally used to trace the process
     System.out.println("Your user name is " + username);          
     System.out.println("Your password is " + password);
     System.out.println("Query: "+searchQuery);
      
     System.out.println(searchQuery); 
     connect();
         
     statement = jdbcConnection.createStatement();
     System.out.println(statement); 
     //ResultSet resultSet = statement.executeQuery(searchQuery);
     //boolean more = resultSet.next();
     //jdbcConnection.setAutoCommit(false);
	    
     try 
     {
     //connect to DB 
     //currentCon = ConnectionManager.getConnection();
     //stmt=currentCon.createStatement();
     //rs = stmt.executeQuery(searchQuery);	        
     //boolean more = rs.next();
     statement = jdbcConnection.createStatement();
     System.out.println(statement); 
     ResultSet resultSet = statement.executeQuery(searchQuery);
     boolean more = resultSet.next();
     jdbcConnection.setAutoCommit(false);
	       
     // if user does not exist set the isValid variable to false
     if (!more) 
     {
     System.out.println("Sorry, you are not a registered user! Please sign up first");
     bean.setValid(false);
     } 
	        
     //if user exists set the isValid variable to true
     else if (more) 
     {
     String FullName = resultSet.getString("FULLNAME");
	     	
     System.out.println("Welcome " + FullName);
     bean.setFullName(FullName);
     bean.setValid(true);
     }
     } 

     catch (Exception ex) 
     {
     System.out.println("Log In failed: An Exception has occurred! " + ex);
     } 

     statement.close();
     disconnect();
     //some exception handling
     /*finally 
     {
     if (resultSet != null)	{
     try {
     resultSet.close();
     } catch (Exception e) {}
     resultSet = null;
     }
	
     if (stmt != null) {
     try {
     stmt.close();
     } catch (Exception e) {}
     stmt = null;
     }
	
     if (currentCon != null) {
     try {
     currentCon.close();
     } catch (Exception e) {
     }

     currentCon = null;
     }
     }

     return bean; 
	
     }	*/
}
