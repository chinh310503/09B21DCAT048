<%-- 
    Document   : Home.jsp
    Created on : Oct 24, 2024, 5:07:52 PM
    Author     : ADMIN
--%>


<%@  page contentType="text/html; charset=UTF-8" language="java" %>
<%
    //HttpSession session = request.getSession();
    String username = (String) session.getAttribute("username");
    String fullname = (String) session.getAttribute("fullname");
    String role = (String) session.getAttribute("role");

%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang Chủ</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
</head>
</head>
<body>
    <h1 class="text-center">  Chào mừng, <%= fullname%>!</h1>
    <%-- Hiển thị thông báo từ Servlet --%>
            <% 
                String message = (String) request.getAttribute("message");
                if (message != null) { 
            %>
                <div class="alert alert-info text-center" role="alert">
                    <%= message %>
                </div>
            <% 
                } 
            %>
    <% if ("manager".equals(role)) { %>
    <div class="container mt-5">     
        <p class="text-center" >Chào mừng bạn đến với trang quản lý.</p>
        <div class="d-flex flex-column align-items-center my-4">
            <div class="d-grid gap-2">
                <a href="GDDuyetDon048.jsp" class="btn btn-secondary mx-2" style="width: 200px">Duyệt đơn và xuất kho</a>
            </div>
        </div>
    </div>    
    <% } else if ("customer".equals(role)) { %>
        <div class="container mt-5">     
        <p class="text-center" >Chào mừng bạn đến với trang khách hàng.</p>
        <div class="d-flex justify-content-center my-4">
            <div class="d-grid gap-2">
                <a href="GDTimKiemMatHang048.jsp" class="btn btn-secondary mx-2" style="width: 200px">Tìm kiếm mặt hàng</a>
            </div>
        </div>
    </div>
    <% } else { %>
        <h2>Thông tin không xác định</h2>
        <p>Bạn không có quyền truy cập vào trang này.</p>
    <% } %>
    <div class="d-flex justify-content-end" style="position: fixed; bottom: 200px; right: 500px;">
        <a href="index.jsp" class="btn btn-danger">Đăng xuất</a>
    </div>
</body>
</html>
