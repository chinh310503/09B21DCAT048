<%@  page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang Đăng Nhập</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* Căn giữa bằng Flexbox */
        body, html {
            height: 100%;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: #f8f9fa;
        }

        .login-form {
            width: 100%;
            max-width: 400px;
            padding: 20px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body>

<div class="login-form text-center">
    <h2 class="mb-4">Đăng nhập</h2>
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
    <!-- Form đăng nhập -->
    <form action="login" method="post">
        <div class="form-group">
            <label for="username">Tên đăng nhập:</label>
            <input type="text" class="form-control" id="username" name="username" placeholder="Nhập tên đăng nhập" required>
        </div>
        <div class="form-group">
            <label for="password">Mật khẩu:</label>
            <input type="password" class="form-control" id="password" name="password" placeholder="Nhập mật khẩu" required>
        </div>
        <div class="form-group mt-4">
            <button type="submit" class="btn btn-secondary btn-block">Đăng nhập</button>
        </div>
    </form>
</div>

</body>
</html>
