package sample.order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import sample.dbutils.DBUtils;
import sample.users.UserDTO;

/**
 *
 * @author MagnusJS
 */
public class OrderDAO {
    private static final String INSERTORDER = "INSERT INTO tblOrders(orderID, userID, date, total) VALUES (?, ?, ?, ?)";
    private static final String GETLASTORDER = "SELECT TOP 1 orderID FROM tblOrders ORDER BY orderID DESC";
    private static final String INSERTORDERDETAIL = "INSERT INTO tblOrderDetail(foodID, orderID, price, quantity) VALUES (?, ?, ?, ?)";
    private static final String UPDATEQUANTITY = "UPDATE tblFoods SET quantity = quantity - ? WHERE id = ?";
    
    public String GetLastOrder() {
        Connection con = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        String HD = "";
        try {
            con = DBUtils.getConnection();
            if (con != null) {
            ptm = con.prepareStatement(GETLASTORDER);
            rs = ptm.executeQuery();
                if(rs.next()) {
                    HD = rs.getString(1);
                }
                else {
                HD = "HD-0";
            }
        } 
    } catch (Exception e) {
            e.getMessage();
        }
        return HD;
    }
     
    public boolean InsertOrder(UserDTO user, float total, String orderId) {
        boolean checkInsert = false;
        Connection con = null;
        PreparedStatement ptm = null;
        
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDateTime now = LocalDateTime.now();
        String date = dtf.format(now);
        try {
            con = DBUtils.getConnection();
            if (con!=null) {
                ptm = con.prepareStatement(INSERTORDER);
                ptm.setString(1, orderId);
                ptm.setString(2,user.getUserID());
                ptm.setString(3, date);
                ptm.setFloat(4, total);
                checkInsert = ptm.executeUpdate()>0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try{
            if(ptm!=null) ptm.close();
            if(con!=null) con.close();
            } catch(SQLException e) {
                e.getMessage();
            }
        }
        return checkInsert;
    }
    
    public boolean InsertOrderDetail(String foodID, int quantity, String orderId, float price) {
        boolean checkInsert = false;
        Connection con = null;
        PreparedStatement ptm = null;
        try {
            con = DBUtils.getConnection();
            if (con!=null) {
                ptm = con.prepareStatement(INSERTORDERDETAIL);
                ptm.setString(1, foodID);
                ptm.setString(2,orderId);
                ptm.setFloat(3, (float) price);
                ptm.setInt(4, quantity);
                checkInsert = ptm.executeUpdate()>0? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try{
            if(ptm!=null) ptm.close();
            if(con!=null) con.close();
            } catch(SQLException e) {
                e.getMessage();
            }
        }
        return checkInsert;
    }
    
    public boolean updateQuantity(String foodID, int quantity) {
        boolean checkInsert = false;
        Connection con = null;
        PreparedStatement ptm = null;
        
        try {
            con = DBUtils.getConnection();
            if (con!=null) {
                ptm = con.prepareStatement(UPDATEQUANTITY);
                ptm.setInt(1, quantity);
                ptm.setString(2,foodID);;
                checkInsert = ptm.executeUpdate()>0? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try{
            if(ptm!=null) ptm.close();
            if(con!=null) con.close();
            } catch(SQLException e) {
                e.getMessage();
            }
        }
        return checkInsert;
    }
}
