<%@page import="dao.*, model.*"%>
<%@ page import="java.util.*, java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Danh sách Đơn hàng Chưa xuất</title>
</head>
<% 
    // Kiểm tra xem người dùng đã đăng nhập hay chưa
    String username = (String) session.getAttribute("username");
    if (username == null) {
        response.sendRedirect("index.jsp");
    }

    DuyetDon048DAO duyetDon = new DuyetDon048DAO();
    ArrayList<DonHangTrucTuyen048> listDonHang = duyetDon.getDonChuaDuyet();
    session.setAttribute("listDonHang", listDonHang);
%>
<body>
        <h2>Danh sách Đơn hàng Chưa xuất</h2>
        <%
            if (listDonHang != null && listDonHang.size() > 0) {
        %>
        <table border="1">
        <tr>
            <th>ID Đơn hàng</th>
            <th>Trạng thái</th>
        </tr>
        <%
                for (int i = 0; i < listDonHang.size(); i++) {
        %>
                    <tr>
                        <td>
                                <form method="post" action="GDNhanVienGiaoHang048.jsp">
                                    <input type="submit" value="<%= listDonHang.get(i).getId() %>">
                                    <input type="hidden" name="donHangId" value="<%= i %>">
                                </form>
                            </td>
                        <td><%= listDonHang.get(i).getTrangThaiDonHang()%></td>
                    </tr>
        <%
                }
            } else {
        %>
                <tr>
                    <td colspan="5">Không còn đơn hàng chưa được xuất kho.</td>
                </tr>
        <%
            }
        %>
    </table>
    <button onclick="history.back()">Quay Lại</button> <!-- Nút quay lại -->
</body>
</html>
