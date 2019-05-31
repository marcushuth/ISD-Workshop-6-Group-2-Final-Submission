package uts.isd.model.dao;

import java.sql.Connection;

/**
 * Super class of DAO classes that manager connection and operation with the database
 * @author trixi
 */
public abstract class DB {
    protected String URL = "jdbc:derby://localhost:1527/";
    protected String db = "onlinemoviestore";//name of the database
    protected String dbuser = "adminstaff";//db main user
    protected String dbpass = "adminstaff123"; //db main password
    protected String driver = "org.apache.derby.jdbc.ClientDriver"; //jdbc client driver - built in with NetBeans
    protected Connection conn; //connection null-instance to be initialized in sub-classes
}
