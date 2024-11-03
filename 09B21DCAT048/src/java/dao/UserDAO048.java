package dao;

import java.sql.*;

public class UserDAO048 extends DAO048{

    // Kiểm tra thông tin tài khoản và mật khẩu
    public String validateUser(String username, String password) throws ClassNotFoundException {
        String sql = "SELECT role FROM tblThanhVien048 WHERE taiKhoan = ? AND matKhau = ?";
        try (PreparedStatement statement = con.prepareStatement(sql)) {
            statement.setString(1, username);
            statement.setString(2, password);
            
            ResultSet rs = statement.executeQuery();

            if(rs.next()){
                return rs.getString("role");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null; // Trả về false nếu không tìm thấy
    }
    //lấy tên khách hàng
    public String getFullName(String username, String password) throws ClassNotFoundException {
        String sql = "SELECT ten FROM tblThanhVien048 WHERE taiKhoan = ? AND matKhau = ?";
        try (PreparedStatement statement = con.prepareStatement(sql)) {
            statement.setString(1, username);
            statement.setString(2, password);
            
            ResultSet rs = statement.executeQuery();

            if(rs.next()){
                return rs.getString("ten");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null; // Trả về false nếu không tìm thấy
    }
}
