<%@page import="model.*, dao.*"%>
<%@ page import="java.util.*, java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    
<% 
    // Kiểm tra xem người dùng đã đăng nhập hay chưa
    String username = (String) session.getAttribute("username");
    if (username == null) {
        response.sendRedirect("index.jsp");
    }
    DonHangTrucTuyen048 donHang = (DonHangTrucTuyen048) session.getAttribute("donHang");
    DuyetDon048DAO duyetDon = new DuyetDon048DAO();
    duyetDon.luuHoaDon(donHang);
    HoaDonTrucTuyen048 hoaDonTrucTuyen = duyetDon.getHoaDon(donHang);
%> 
    <body>
        <h2>Thông Tin Đơn Hàng</h2>
        <table>
            <tr>
                <th>Mã Hóa Đơn</th>
                <td><%= hoaDonTrucTuyen.getId() %></td>
            </tr>
            <tr>
                <th>Ngày Tạo Hóa Đơn</th>
                <td><%= hoaDonTrucTuyen.getNgayTao() %></td>
            </tr>
            <tr>
                <th>Mã Đơn Hàng</th>
                <td><%= hoaDonTrucTuyen.getDonHang().getId() %></td>
            </tr>
            <tr>
                <th>Tên Khách Hàng</th>
                <td><%= hoaDonTrucTuyen.getDonHang().getKhachHang().getTen() %></td>
            </tr>
            <tr>
                <th>Nhân Viên Giao Hàng</th>
                <td><%= hoaDonTrucTuyen.getDonHang().getNhanVienGiaoHang().getTen() %></td>
            </tr>
            <tr>
                <th>Mặt Hàng</th>
                <td>
                    <ul>
                        <%
                            List<MatHangDatTrucTuyen048> danhSachMatHang = hoaDonTrucTuyen.getDonHang().getMatHang(); // Giả sử có phương thức để lấy danh sách mặt hàng
                            for (MatHangDatTrucTuyen048 matHang : danhSachMatHang) {
                        %>
                            <li><%= matHang.getMatHang().getTenMH() %> - Số lượng: <%= matHang.getSoLuong() %> - Giá: <%= String.format("%,.2f", matHang.getMatHang().getGiaBan()) %></li>
                        <%
                            }
                        %>
                    </ul>
                </td>
            </tr>
            <tr>
                <th>Tổng Tiền</th>
                <td><%= String.format("%,.2f", hoaDonTrucTuyen.getTongTien()) %></td>
            </tr>
        </table>

        <div>
            <button onclick="window.print()">In Đơn Hàng</button> <!-- Nút in -->
            <button onclick="history.back()">Quay Lại</button> <!-- Nút quay lại -->
        </div>
    </body>
</html>
