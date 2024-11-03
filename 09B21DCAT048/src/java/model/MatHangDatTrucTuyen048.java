/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author ADMIN
 */
public class MatHangDatTrucTuyen048 {
    private int id;
    private int soLuong;
    private MatHang048 matHang;

    public MatHangDatTrucTuyen048() {
    }

    public MatHangDatTrucTuyen048(int id, int soLuong, MatHang048 matHang) {
        this.id = id;
        this.soLuong = soLuong;
        this.matHang = matHang;
    }

    public int getId() {
        return id;
    }

    public int getSoLuong() {
        return soLuong;
    }

    public MatHang048 getMatHang() {
        return matHang;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setSoLuong(int soLuong) {
        this.soLuong = soLuong;
    }

    public void setMatHang(MatHang048 matHang) {
        this.matHang = matHang;
    }
    
}
