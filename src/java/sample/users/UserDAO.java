
package sample.users;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import sample.dbutils.DBUtils;

/**
 *
 * @author MagnusJS
 */
public class UserDAO {
    
    private static final String LOGIN = "SELECT fullName, roleID FROM tblUsers WHERE userID = ? "
            + "AND password = ?";
    
    private static final String DUPLICATE = "SELECT userID FROM tblUsers WHERE userID = ?";
    
    private static final String INSERT = "INSERT INTO tblUsers(userID, fullName, roleID, password) VALUES (?, ?, ?, ?)";

    public UserDTO checkLogin(String userID, String password) throws SQLException {
        Connection con = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        UserDTO user = null;
        
        try {
            con = DBUtils.getConnection();
            
            if (con != null) {
                ptm = con.prepareStatement(LOGIN);
                ptm.setString(1, userID);
                ptm.setString(2, password);
                rs = ptm.executeQuery();
                
                if (rs.next()) {
                    String fullName = rs.getString("fullName");
                    String roleID = rs.getString("roleID");
                    user = new UserDTO(userID, fullName, roleID, "");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) rs.close();
            if (ptm != null) ptm.close();
            if (con != null) con.close();
        }
        return user;
    }

    public boolean checkDuplicate(String userID) throws SQLException {
        boolean check = false;
        Connection con = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                ptm = con.prepareStatement(DUPLICATE);
                ptm.setString(1, userID);
                rs = ptm.executeQuery();       
                if (rs.next()) {
                    check = true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if(rs!=null) rs.close();
            if(ptm!=null) ptm.close();
            if(con!=null) con.close();
        }
        return check;
    }

    public boolean insert(UserDTO user) throws SQLException {
        boolean checkInsert = false;
        Connection con = null;
        PreparedStatement ptm = null;
        
        try {
            con = DBUtils.getConnection();
            if (con!=null) {
                ptm = con.prepareStatement(INSERT);
                ptm.setString(1, user.getUserID());
                ptm.setString(2, user.getFullName());
                ptm.setString(3, "USER");
                ptm.setString(4, user.getPassword());
                checkInsert = ptm.executeUpdate()>0 ? true : false;
                
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if(ptm != null) ptm.close();
            if (con != null) con.close();
        }
        return checkInsert;
    }
    
}
