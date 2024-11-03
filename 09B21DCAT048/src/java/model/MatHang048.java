/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author ADMIN
 */
public class MatHang048 {
    private int id;
    private String tenMH;
    private String loaiMH;
    private float giaBan;
    private String chiTiet;
    
    public MatHang048() {
    }

    public MatHang048(int id, String tenMH, String loaiMH, float giaBan, String chiTiet) {
        this.id = id;
        this.tenMH = tenMH;
        this.loaiMH = loaiMH;
        this.giaBan = giaBan;
        this.chiTiet = chiTiet;
    }

    public int getId() {
        return id;
    }

    public String getTenMH() {
        return tenMH;
    }

    public String getLoaiMH() {
        return loaiMH;
    }

    public float getGiaBan() {
        return giaBan;
    }

    public String getChiTiet() {
        return chiTiet;
    }

    public void setChiTiet(String chiTiet) {
        this.chiTiet = chiTiet;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setTenMH(String tenMH) {
        this.tenMH = tenMH;
    }

    public void setLoaiMH(String loaiMH) {
        this.loaiMH = loaiMH;
    }

    public void setGiaBan(float giaBan) {
        this.giaBan = giaBan;
    }
    
}
