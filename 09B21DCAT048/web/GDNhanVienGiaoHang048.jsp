<%@page import="model.*, dao.*"%>
<%@ page import="java.util.*, java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Quản lý Nhân viên Giao hàng</title>
    <link rel="stylesheet" type="text/css" href="styles.css"> <!-- Thêm link đến file CSS nếu cần -->
    <style>
        .button-container {
            display: flex; /* Đặt các nút nằm ngang */
            margin-top: 20px; /* Thêm khoảng cách trên */
            margin-bottom: 20px;
        }
         .button-container input[type="submit"] {
            margin-right: 350px; 
        }
    </style>
</head>

<% 
    // Kiểm tra xem người dùng đã đăng nhập hay chưa
    String username = (String) session.getAttribute("username");
    if (username == null) {
        response.sendRedirect("index.jsp");
    }

    DuyetDon048DAO duyetDon = new DuyetDon048DAO();
    int id = Integer.parseInt(request.getParameter("donHangId"));   
    ArrayList<DonHangTrucTuyen048> listDonHang = (ArrayList<DonHangTrucTuyen048>) session.getAttribute("listDonHang");
    DonHangTrucTuyen048 donHangTrucTuyen = listDonHang.get(id);
    ArrayList<NhanVienGiaoHang048> listNhanVienGiaoHang = duyetDon.getNhanVienGiaoHang();
%>

<body>

    <h2>Danh sách nhân viên giao hàng</h2>
    <!-- Form bao gồm tất cả các phần tử cần gửi -->
    <form action="GDNhanVienGiaoHang048.jsp" method="post"> 
        <%
            if (listNhanVienGiaoHang != null && listNhanVienGiaoHang.size() > 0) {
        %>
        <div>
            <table border="1">
            <tr>
                <th>Chọn</th>
                <th>ID nhân viên giao hàng</th>
                <th>Tên</th>
                <th>Sdt</th>
                <th>Email</th>
            </tr>
        <%
                for (int i = 0; i < listNhanVienGiaoHang.size(); i++) {
        %>
                    <tr>
                        <td>
                            <input type="radio" name="nhanVienId" value="<%= i %>" required>
                            <input type="hidden" name="donHangId" value="<%= id %>">
                        </td>
                        <td><%= listNhanVienGiaoHang.get(i).getId()%></td>
                        <td><%= listNhanVienGiaoHang.get(i).getTen() %></td>
                        <td><%= listNhanVienGiaoHang.get(i).getSdt()%></td>
                        <td><%= listNhanVienGiaoHang.get(i).getEmail()%></td>
                    </tr>
        <%
                }
            } 
            else {
        %>
                <tr>
                    <td colspan="5">Không có nhân viên giao hàng nào.</td>
                </tr>
        <%
            }
        %>
            </table>
        </div>
        
        <div class="button-container">
            <input type="submit" value="Duyệt đơn">
        </div>
    </form>
    
    <button type="button" name="back" onclick="history.back()">Quay lại</button>
    
<%
    // Xử lý khi nút Submit được nhấn
    if ("POST".equalsIgnoreCase(request.getMethod()) && request.getParameter("nhanVienId") != null) {
        NhanVienGiaoHang048 nhanVienGiaoHang = listNhanVienGiaoHang.get(Integer.parseInt(request.getParameter("nhanVienId")));
        boolean status = duyetDon.updateDonHang(donHangTrucTuyen, nhanVienGiaoHang);
        if(status)
        {
            session.setAttribute("donHang", donHangTrucTuyen);
            response.sendRedirect("GDHoaDon048.jsp");
        }   
    }
%>
</body>
</html>
