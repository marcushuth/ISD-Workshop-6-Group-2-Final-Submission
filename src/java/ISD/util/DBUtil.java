package ISD.util;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Initiate connection with the jdbc derby database and initialize the super class conn field
 * 
 * @author George
 */
public class DBUtil{
    public static Connection conn;
  

    public static Connection getConnection(){
        if(conn==null){
             try {
                Class.forName("org.apache.derby.jdbc.ClientDriver");
                conn = DriverManager.getConnection("jdbc:derby://localhost:1527/ISO", "root", "root");
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(DBUtil.class.getName()).log(Level.SEVERE, null, ex);
            } catch (SQLException ex) {
                Logger.getLogger(DBUtil.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return conn;
    }
    
    public void closeConnection() throws SQLException {
        if(conn!=null){
            this.conn.close();
        }
    }
    
    public static ResultSet runSelectSql(String sql,Object[]preparms) throws SQLException{
        PreparedStatement pst=null; 
        pst=getConnection().prepareStatement(sql);
        for(int i=0;i<preparms.length;i++){
            pst.setObject(i+1, preparms[i]);
        }
        ResultSet rs=pst.executeQuery(); 
        return  rs;
     }
    
    
     public static void runNoSelectSql(String sql,Object[]prepares) throws SQLException{
        PreparedStatement pst=getConnection().prepareStatement(sql);
        for(int i=0;i<prepares.length;i++){
            pst.setObject(i+1, prepares[i]);
        }
        pst.executeUpdate();
        
    }
}
