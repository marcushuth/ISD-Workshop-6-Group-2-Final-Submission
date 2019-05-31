package onlinemoviestore.model.dao;

import java.sql.Connection;

public abstract class DB {
    protected String URL = "jdbc:derby://localhost:1527/onlinemoviestore";
    protected String db = "onlinemoviestore";
    protected String dbuser = "adminstaff";
    protected String dbpass = "adminstaff123";
    protected String driver = "org.apache.derby.jdbc.ClientDriver";
    protected Connection con;

}