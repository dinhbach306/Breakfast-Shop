package sample.dbutils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

/**
 *
 * @author MagnusJS
 */
public class DBUtils {
    public static Connection getConnection() throws SQLException, ClassNotFoundException, NamingException {
        Connection con = null;
        Context context = new InitialContext();
        Context end = (Context) context.lookup("java:comp/env");
        DataSource ds = (DataSource) end.lookup("DBCon");
        con = ds.getConnection();
        return con;
    }
    
    public static Connection getConnectionV1() throws SQLException, ClassNotFoundException {
        Connection con = null;
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        String url = "jdbc:sqlserver://localhost:1433;databaseName=FoodManagement;";
        con = DriverManager.getConnection(url, "sa", "12345");
        return con;
    }
}
