/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;

/**
 *
 * @author ADMIN
 */
public class HoaDonTrucTuyen048 extends HoaDonBan048{
    private DonHangTrucTuyen048 donHang;

    public HoaDonTrucTuyen048() {
    }

    public HoaDonTrucTuyen048(int id, Date ngayTao, float tongTien) {
        super(id, ngayTao, tongTien);
    }

    public HoaDonTrucTuyen048(DonHangTrucTuyen048 donHang, int id, Date ngayTao, float tongTien) {
        super(id, ngayTao, tongTien);
        this.donHang = donHang;
    }

    public DonHangTrucTuyen048 getDonHang() {
        return donHang;
    }

    public void setDonHang(DonHangTrucTuyen048 donHang) {
        this.donHang = donHang;
    }
    
}
