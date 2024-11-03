<%@ page import="model.MatHang048" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Chi tiết mặt hàng</title>
</head>
<body>
    <h2>Chi tiết mặt hàng</h2>
    
    <%
        // Lấy đối tượng MatHang048 từ session
        MatHang048 matHang = (MatHang048) session.getAttribute("matHang");
        
        if (matHang == null) {
            // Nếu không tìm thấy mặt hàng trong session, chuyển hướng về trang tìm kiếm
            response.sendRedirect("GDTimKiemMatHang048.jsp");
        } else {
            // Hiển thị thông tin chi tiết của mặt hàng
    %>
            <table border="1">
    <tr>
        <th>ID</th>
        <th>Tên mặt hàng</th>
        <th>Giá bán</th>
        <th>Loại mặt hàng</th>
        <th>Chi tiết mặt hàng</th>
    </tr>
    <tr>
        <td><%= matHang.getId() %></td>
        <td><%= matHang.getTenMH() %></td>
        <td><%= String.format("%,.2f", matHang.getGiaBan()) %> VNĐ</td>
        <td><%= matHang.getLoaiMH() %></td>
        <td><%= matHang.getChiTiet() %></td>
    </tr>
</table>
    <%
        }
    %>
    
    <button onclick="history.back()">Quay Lại</button> <!-- Nút quay lại -->

</body>
</html>
