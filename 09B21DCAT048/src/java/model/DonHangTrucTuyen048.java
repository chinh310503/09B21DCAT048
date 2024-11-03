/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;
import java.util.ArrayList;
import java.util.Date;

/**
 *
 * @author ADMIN
 */
public class DonHangTrucTuyen048 {
    private int id;
    private Date ngayTao;
    private String trangThaiDonHang;
    private ArrayList<MatHangDatTrucTuyen048> matHang;
    private NhanVienGiaoHang048 nhanVienGiaoHang;
    private KhachHang048 khachHang;

    public DonHangTrucTuyen048() {
    }

    public DonHangTrucTuyen048(int id, Date ngayTao, String trangThaiDonHang, ArrayList<MatHangDatTrucTuyen048> matHang, NhanVienGiaoHang048 nhanVienGiaoHang, KhachHang048 khachHang) {
        this.id = id;
        this.ngayTao = ngayTao;
        this.trangThaiDonHang = trangThaiDonHang;
        this.matHang = matHang;
        this.nhanVienGiaoHang = nhanVienGiaoHang;
        this.khachHang = khachHang;
    }

    public int getId() {
        return id;
    }

    public Date getNgayTao() {
        return ngayTao;
    }

    public String getTrangThaiDonHang() {
        return trangThaiDonHang;
    }

    public ArrayList<MatHangDatTrucTuyen048> getMatHang() {
        return matHang;
    }

    public NhanVienGiaoHang048 getNhanVienGiaoHang() {
        return nhanVienGiaoHang;
    }

    public KhachHang048 getKhachHang() {
        return khachHang;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setNgayTao(Date ngayTao) {
        this.ngayTao = ngayTao;
    }

    public void setTrangThaiDonHang(String trangThaiDonHang) {
        this.trangThaiDonHang = trangThaiDonHang;
    }

    public void setMatHang(ArrayList<MatHangDatTrucTuyen048> matHang) {
        this.matHang = matHang;
    }

    public void setNhanVienGiaoHang(NhanVienGiaoHang048 nhanVienGiaoHang) {
        this.nhanVienGiaoHang = nhanVienGiaoHang;
    }

    public void setKhachHang(KhachHang048 khachHang) {
        this.khachHang = khachHang;
    }
    
}
