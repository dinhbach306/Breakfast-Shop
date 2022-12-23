
package sample.foods;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import sample.dbutils.DBUtils;

/**
 *
 * @author MagnusJS
 */
public class FoodDAO {

    private static final String SEARCH = "SELECT id, name, description, price, cookingtime, status FROM tblFoods "
            + "WHERE name like ?";
    
    private static final String SEARCHV2 = "SELECT id, name, description, price, cookingtime, status, image FROM tblFoods "
            + "WHERE name like ?";
    
    private static final String DELETE = "UPDATE tblFoods SET status=? WHERE id=?";
    
    private static final String UPDATE = "UPDATE tblFoods SET name=?, description=?, price=?, cookingTime=?"
            + " WHERE id=?";
    
    private static final String GETALL = "SELECT id, name, description, price, cookingtime, status, image FROM tblFoods";
    
    private static final String SORTLOW = "SELECT price FROM tblFoods ORDER BY price DESC";
    
    private static final String SORTHIGHT = "SELECT price FROM tblFoods ORDER BY price";

    
    public List<FoodDTO> searchFood(String search) throws SQLException {
        Connection con = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        List<FoodDTO> listFood = new ArrayList<>();
        try {
            con = DBUtils.getConnection();
            if(con != null) {
                ptm = con.prepareStatement(SEARCHV2);
                ptm.setString(1, "%" + search + "%");
                rs = ptm.executeQuery();
                
                while(rs.next()) {
                    String id = rs.getString("id");
                    String name = rs.getString("name");
                    String description = rs.getString("description");
                    float price = rs.getFloat("price");
                    int cookingTime = rs.getInt("cookingTime");
                    boolean status = rs.getBoolean("status");
                    String imString = rs.getString("image");
                    listFood.add(new FoodDTO(id, name, description, price, cookingTime, status, imString));
                }
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if(rs != null) rs.close();
            if(ptm != null) ptm.close();
            if(con != null) con.close();
        }
        return listFood;
    }

    public List<FoodDTO> searchFoodV2(String search) throws SQLException {
        Connection con = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        List<FoodDTO> listFood = new ArrayList<>();
        try {
            con = DBUtils.getConnection();
            if(con != null) {
                ptm = con.prepareStatement(SEARCHV2);
                ptm.setString(1, "%" + search + "%");
                rs = ptm.executeQuery();
                
                while(rs.next()) {
                    String id = rs.getString("id");
                    String name = rs.getString("name");
                    String description = rs.getString("description");
                    float price = rs.getFloat("price");
                    int cookingTime = rs.getInt("cookingTime");
                    boolean status = rs.getBoolean("status");
                    String image = rs.getString("image");
                    listFood.add(new FoodDTO(id, name, description, price, cookingTime, status, image));
                }
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if(rs != null) rs.close();
            if(ptm != null) ptm.close();
            if(con != null) con.close();
        }
        return listFood;
    }
    
    public boolean delete(String id, boolean status) throws SQLException {
        boolean checkDelete = false;
        Connection con = null;
        PreparedStatement ptm = null;
        
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                ptm = con.prepareStatement(DELETE);
                ptm.setBoolean(1, status);
                ptm.setString(2, id);
                int check = ptm.executeUpdate();
                if (check > 0) {
                    checkDelete = true;
                }
            }
            
        } catch (Exception e) {
        } finally {
            if (ptm != null) ptm.close();
            if (con != null) con.close(); 
        }
        return checkDelete;
    }

    public boolean update(FoodDTO food) throws SQLException {
        boolean checkUpdate = false;
        Connection con = null;
        PreparedStatement ptm = null;
        
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                ptm = con.prepareStatement(UPDATE);
                ptm.setString(1, food.getName());
                ptm.setString(2, food.getDescription());
                ptm.setFloat(3, food.getPrice());
                ptm.setInt(4, food.getCookingTime());
                ptm.setString(5, food.getId());
                
                int check = ptm.executeUpdate();
                if (check > 0) {
                    checkUpdate = true;
                }
            }
            
        } catch (Exception e) {
        } finally {
            if (ptm != null) ptm.close();
            if (con != null) con.close(); 
        }
        return checkUpdate;
    }

    public List<FoodDTO> getAllProduct() throws SQLException {
        List<FoodDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if(conn != null) {
                ptm = conn.prepareStatement(GETALL);
                rs = ptm.executeQuery();
                while(rs.next()) {
                    list.add(new FoodDTO(
                            rs.getString(1), 
                            rs.getString(2), 
                            rs.getString(3),
                            rs.getFloat(4),
                            rs.getInt(5),
                            rs.getBoolean(6),
                            rs.getString(7)));
                }
            }
        } catch(Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) rs.close();
            if (ptm != null) ptm.close();
            if (conn != null) conn.close();
        }
        return list;
    }
    
    public List<FoodDTO> sortHigh() throws SQLException   {
        List<FoodDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if(conn != null) {
                ptm = conn.prepareStatement(SORTHIGHT);
                rs = ptm.executeQuery();
                while(rs.next()) {
                    list.add(new FoodDTO(
                            rs.getString(1), 
                            rs.getString(2), 
                            rs.getString(3),
                            rs.getFloat(4),
                            rs.getInt(5),
                            rs.getBoolean(6),
                            rs.getString(7)));
                }
            }
        } catch(Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) rs.close();
            if (ptm != null) ptm.close();
            if (conn != null) conn.close();
        }
        return list;
    }
    
    public List<FoodDTO> sortLow() throws SQLException   {
        List<FoodDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if(conn != null) {
                ptm = conn.prepareStatement(SORTLOW);
                rs = ptm.executeQuery();
                while(rs.next()) {
                    list.add(new FoodDTO(
                            rs.getString(1), 
                            rs.getString(2), 
                            rs.getString(3),
                            rs.getFloat(4),
                            rs.getInt(5),
                            rs.getBoolean(6),
                            rs.getString(7)));
                }
            }
        } catch(Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) rs.close();
            if (ptm != null) ptm.close();
            if (conn != null) conn.close();
        }
        return list;
    }
}
