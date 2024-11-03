<%@page import="dao.*, model.*"%>
<%@ page import="java.util.*, java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Trang tìm kiếm mặt hàng</title>
</head>
<% 
    String username = (String) session.getAttribute("username");
    if(username == null){
        response.sendRedirect("index.jsp");
    }
%>
<body>
    <h2>Tìm kiếm mặt hàng</h2>
    <form method="get" action="GDTimKiemMatHang048.jsp">
        <label for="tenMatHang">Nhập tên mặt hàng:</label>
        <input type="text" name="tenMatHang" id="tenMatHang" required>
        <input type="submit" value="Tìm kiếm">
    </form>

    <%
        String tenMatHang = request.getParameter("tenMatHang");
        if(tenMatHang != null){
            TimKiem048DAO timKiem = new TimKiem048DAO();
            ArrayList<MatHang048> listMatHang = timKiem.getMatHangTheoTen(tenMatHang);
            if(listMatHang != null && listMatHang.size() > 0)
            {
    %>
                    <h3>Kết quả tìm kiếm:</h3>
                    <table border="1">
                        <tr>
                            <th>ID</th>
                            <th>Tên mặt hàng</th>
                            <th>Giá</th>
                            <th>Loại mặt hàng</th>
                        </tr>
    <%
                for (int i = 0; i < listMatHang.size(); i++)
                {
    %>
                        <tr>
                            <td><%= listMatHang.get(i).getId() %></td>
                            <td><%= listMatHang.get(i).getTenMH() %></td>
                            <td><%= String.format("%,.2f", listMatHang.get(i).getGiaBan()) %></td>
                            <td><%= listMatHang.get(i).getLoaiMH() %></td>
                            <!--<td><a href="GDChiTietMatHang048.jsp">Xem chi tiết</a></td>-->
                            <td>
                                <form method="post" action="GDChiTietMatHang048.jsp">
                                    <input type="submit" value="Xem chi tiết mặt hàng">
                                    <%
                                        session.setAttribute("matHang", listMatHang.get(i));
                                    %>
                                </form>
                            </td>
                        </tr>
    <%
                }
    %>
                    </table>
    <%
            } else {
    %>
                    <p>Không tìm thấy mặt hàng nào với tên "<%= tenMatHang %>"</p>
    <%
            }
        }
    %>
    <button onclick="history.back()">Quay Lại</button> <!-- Nút quay lại -->

</body>
</html>
