/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import static dao.DAO048.con;
import java.sql.*;
import java.util.ArrayList;
import javax.crypto.AEADBadTagException;
import model.DonHangTrucTuyen048;
import model.HoaDonTrucTuyen048;
import model.KhachHang048;
import model.MatHang048;
import model.MatHangDatTrucTuyen048;
import model.NhanVienGiaoHang048;

/**
 *
 * @author ADMIN
 */
public class DuyetDon048DAO extends DAO048{

    public DuyetDon048DAO() {
        super();
    }
    
    public ArrayList<NhanVienGiaoHang048> getNhanVienGiaoHang(){
        ArrayList<NhanVienGiaoHang048> kq = new ArrayList<>();
        String sql = "SELECT * FROM tblNhanVienGiaoHang048";
        try{
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next())
            {
                NhanVienGiaoHang048 nv = new NhanVienGiaoHang048();
                
                String sqltv = "SELECT * FROM tblThanhVien048 WHERE id = ?";
                PreparedStatement pstv = con.prepareStatement(sqltv);
                pstv.setInt(1, rs.getInt("tblThanhVien048id"));
                ResultSet rstv = pstv.executeQuery();
                if(rstv.next()){
                    nv.setTen(rstv.getString("ten"));
                    nv.setId(rstv.getInt("id"));
                    nv.setEmail(rstv.getString("email"));
                    nv.setSdt(rstv.getString("sdt"));
                    nv.setRole(rstv.getString("role"));
                }
                kq.add(nv);
            }
        }
        catch(SQLException e){
            e.printStackTrace();
            kq = null;
        }
        return kq;
    }
    
    public ArrayList<DonHangTrucTuyen048> getDonChuaDuyet(){
        ArrayList<DonHangTrucTuyen048> kq = new ArrayList<>();
        String sql = "SELECT * FROM tblDonHangTrucTuyen048 WHERE trangThaiDonHang = 'Chưa duyệt'";
//        đã duyệt, chưa xuất, đang vận chuyển, hoàn tất
        try{
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next())
            {
                DonHangTrucTuyen048 donHang = new DonHangTrucTuyen048();
                int id = rs.getInt("id");
                donHang.setId(id);
                donHang.setNgayTao(rs.getDate("ngayTao"));
                donHang.setTrangThaiDonHang(rs.getString("trangThaiDonHang"));
                int idkh = rs.getInt("tblKhachHang048tblThanhVien048id");
                int idnvgh = rs.getInt("tblNhanVienGiaoHang048tblThanhVien048id");
                
                // query khach hang
                KhachHang048 kh = new KhachHang048();
                String sql_kh = "SELECT * FROM tblThanhVien048 WHERE id = ?";
                PreparedStatement pskh = con.prepareStatement(sql_kh);
                pskh.setInt(1, idkh);
                ResultSet rskh = pskh.executeQuery();
                if (rskh.next()){
                    kh.setId(rskh.getInt("id"));
                    kh.setTaiKhoan(rskh.getString("taiKhoan"));
                    kh.setMatKhau(rskh.getString("matKhau"));
                    kh.setTen(rskh.getString("ten"));
                    kh.setEmail(rskh.getString("email"));
                    kh.setSdt(rskh.getString("sdt"));
                    kh.setRole(rskh.getString("role"));
                }
                
                NhanVienGiaoHang048 nvgh = new NhanVienGiaoHang048();
                
                // query list mathangtructuyen
                ArrayList<MatHangDatTrucTuyen048> lits_mhtt = new ArrayList<>();
                String sql_mhtt = "SELECT * FROM tblMatHangDatTrucTuyen048 WHERE tblDonHangTrucTuyen048id = ?";
                PreparedStatement psmhtt = con.prepareStatement(sql_mhtt);
                psmhtt.setInt(1, id);
                ResultSet rsmhtt = psmhtt.executeQuery();
                while(rsmhtt.next())
                {
                    MatHangDatTrucTuyen048 mathangtt = new MatHangDatTrucTuyen048();
                    int idmh = rsmhtt.getInt("tblMatHang048id");
                    mathangtt.setId(rsmhtt.getInt("id"));
                    mathangtt.setSoLuong(rsmhtt.getInt("soLuong"));
                    
                    // query mat hang
                    String sql_mh = "SELECT * FROM tblMatHang048 WHERE id = ?";
                    PreparedStatement psmh = con.prepareStatement(sql_mh);
                    psmh.setInt(1, idmh);
                    ResultSet rsmh = psmh.executeQuery();
                    MatHang048 mh = new MatHang048();

                    if (rsmh.next()) {
                        mh.setId(rsmh.getInt("id"));
                        mh.setLoaiMH(rsmh.getString("loaiMH"));
                        mh.setTenMH(rsmh.getString("tenMH"));
                        mh.setGiaBan(rsmh.getFloat("giaBan"));
                        mh.setChiTiet(rsmh.getString("chiTiet"));
                    }
                    
                    mathangtt.setMatHang(mh);
                    lits_mhtt.add(mathangtt);
                }
                donHang.setKhachHang(kh);
                donHang.setMatHang(lits_mhtt);
                donHang.setNhanVienGiaoHang(nvgh);
                
                kq.add(donHang);
            }
        }
        catch(SQLException e){
            e.printStackTrace();
        }
        
        return kq;
    }
    
    public void luuHoaDon(DonHangTrucTuyen048 donHang)
    {
        HoaDonTrucTuyen048 hoaDon = new HoaDonTrucTuyen048();
        hoaDon.setDonHang(donHang);
        
        try {
            String sql = "INSERT INTO tblHoaDonBan048 (ngayTao, tongTien) VALUES (?, ?)";
            PreparedStatement ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            Date ngayTao = new Date(System.currentTimeMillis());
            ps.setDate(1, ngayTao);
            
            float tongTien = 0;
            for (int i = 0; i < donHang.getMatHang().size(); i++){
                MatHangDatTrucTuyen048 mh = donHang.getMatHang().get(i);
                int sl = mh.getSoLuong();
                float gia = mh.getMatHang().getGiaBan();
                tongTien += gia * sl;
            }
            ps.setFloat(2, tongTien);
            int affectedRows  = ps.executeUpdate();
            if (affectedRows > 0) {
                ResultSet generatedKeys = ps.getGeneratedKeys();
                if (generatedKeys.next()) {
                    int idHoaDonBan = generatedKeys.getInt(1);
                    String sqlDh = "INSERT INTO tblHoaDonTrucTuyen048 (tblHoaDonBan048id, tblDonHangTrucTuyen048id) VALUES(?, ?)";
                    PreparedStatement psdh = con.prepareStatement(sqlDh);
                    psdh.setInt(1, idHoaDonBan);
                    psdh.setInt(2, donHang.getId());
                    psdh.executeUpdate();
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public HoaDonTrucTuyen048 getHoaDon(DonHangTrucTuyen048 donHang)
    {
        try{
            String sql = "SELECT * FROM tblHoaDonTrucTuyen048 WHERE tblDonHangTrucTuyen048id = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, donHang.getId()); 
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                int idHoaDonBan = rs.getInt("tblHoaDonBan048id");

                String sqlhdb = "SELECT * FROM tblHoaDonBan048 WHERE id = ?";
                PreparedStatement pshdb = con.prepareStatement(sqlhdb);
                pshdb.setInt(1, idHoaDonBan);
                ResultSet rshdb = pshdb.executeQuery();
                if(rshdb.next()){
                    HoaDonTrucTuyen048 hoaDonTrucTuyen = new HoaDonTrucTuyen048();
                    hoaDonTrucTuyen.setDonHang(donHang);
                    hoaDonTrucTuyen.setId(idHoaDonBan);
                    hoaDonTrucTuyen.setNgayTao(rshdb.getDate("ngayTao"));
                    hoaDonTrucTuyen.setTongTien(rshdb.getFloat("tongTien"));
                    System.out.println(hoaDonTrucTuyen.getTongTien());
                    return hoaDonTrucTuyen;
                }
            }
        }
        catch(SQLException e){
            e.printStackTrace();
        }
        return null;
    }
    
    public boolean updateDonHang(DonHangTrucTuyen048 donHangTrucTuyen, NhanVienGiaoHang048 nhanVienGiaoHang)
    {
        String trangThaiDonHang = "Đã duyệt";
        donHangTrucTuyen.setNhanVienGiaoHang(nhanVienGiaoHang);
        donHangTrucTuyen.setTrangThaiDonHang(trangThaiDonHang);
        // update tbldonhangtructuyen
        String sqlDonHang = "UPDATE tbldonhangtructuyen048 SET trangThaiDonHang = ?, tblNhanVienGiaoHang048tblThanhVien048id = ? WHERE id = ?";
        try {
            PreparedStatement psDonHang = con.prepareStatement(sqlDonHang);
            psDonHang.setString(1, trangThaiDonHang);
            psDonHang.setInt(2, nhanVienGiaoHang.getId());
            psDonHang.setInt(3, donHangTrucTuyen.getId()); 
            
            return psDonHang.executeUpdate() > 0; // Trả về true nếu cập nhật thành công
        } catch (SQLException e) {
            e.printStackTrace();
        } 
        return false;
    }
}
//CREATE TABLE tblHoaDonBan048 (
//    id INT(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
//    ngayTao DATE NOT NULL,
//    tongTien FLOAT NOT NULL
//);
