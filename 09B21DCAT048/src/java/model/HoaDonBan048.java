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
public class HoaDonBan048 {
    private int id;
    private Date ngayTao;
    private float tongTien;

    public HoaDonBan048() {
    }

    public HoaDonBan048(int id, Date ngayTao, float tongTien) {
        this.id = id;
        this.ngayTao = ngayTao;
        this.tongTien = tongTien;
    }

    public int getId() {
        return id;
    }

    public Date getNgayTao() {
        return ngayTao;
    }

    public float getTongTien() {
        return tongTien;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setNgayTao(Date ngayTao) {
        this.ngayTao = ngayTao;
    }

    public void setTongTien(float tongTien) {
        this.tongTien = tongTien;
    }
    
}
