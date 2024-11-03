/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.*;
import java.util.ArrayList;
import model.MatHang048;

/**
 *
 * @author ADMIN
 */
public class TimKiem048DAO extends DAO048{

    public TimKiem048DAO() {
        super();
    }
    
    public ArrayList<MatHang048> getMatHangTheoTen(String tenMatHang){
        ArrayList<MatHang048> kq = new ArrayList<>();
        String sql = "SELECT * FROM tblMatHang048 WHERE tenMH LIKE ?";
        try{
            PreparedStatement cs = con.prepareStatement(sql);
            cs.setString(1, "%" + tenMatHang + "%");
            ResultSet rs = cs.executeQuery();
            while(rs.next())
            {
                MatHang048 matHang = new MatHang048();
                matHang.setId(rs.getInt("id"));
                matHang.setLoaiMH(rs.getString("loaiMH"));
                matHang.setTenMH(rs.getString("tenMH"));
                matHang.setGiaBan(rs.getFloat("giaBan"));
                matHang.setChiTiet(rs.getString("chiTiet"));
                kq.add(matHang);
            }
        }
        catch(SQLException e){
            e.printStackTrace();
            kq = null;
        }
        return kq;
    }
}
