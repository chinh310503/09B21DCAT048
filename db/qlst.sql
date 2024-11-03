-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 30, 2024 lúc 10:04 AM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `qlst`
--

DELIMITER $$
--
-- Thủ tục
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `hello` (IN `abc` INT)   BEGIN
    SELECT * FROM test WHERE test = abc;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbldonhangtructuyen048`
--

CREATE TABLE `tbldonhangtructuyen048` (
  `id` int(10) NOT NULL,
  `trangThaiDonHang` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ngayTao` date NOT NULL,
  `tblKhachHang048tblThanhVien048id` int(10) NOT NULL,
  `tblNhanVienGiaoHang048tblThanhVien048id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `tbldonhangtructuyen048`
--

INSERT INTO `tbldonhangtructuyen048` (`id`, `trangThaiDonHang`, `ngayTao`, `tblKhachHang048tblThanhVien048id`, `tblNhanVienGiaoHang048tblThanhVien048id`) VALUES
(1, 'Chưa duyệt', '2024-10-29', 2, NULL),
(2, 'Chưa duyệt', '2024-10-29', 2, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tblhoadonban048`
--

CREATE TABLE `tblhoadonban048` (
  `id` int(10) NOT NULL,
  `ngayTao` date NOT NULL,
  `tongTien` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tblhoadontructuyen048`
--

CREATE TABLE `tblhoadontructuyen048` (
  `tblHoaDonBan048id` int(10) NOT NULL,
  `tblDonHangTrucTuyen048id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tblmathang048`
--

CREATE TABLE `tblmathang048` (
  `id` int(10) NOT NULL,
  `tenMH` varchar(50) NOT NULL,
  `loaiMH` varchar(50) NOT NULL,
  `giaBan` float NOT NULL,
  `chiTiet` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `tblmathang048`
--

INSERT INTO `tblmathang048` (`id`, `tenMH`, `loaiMH`, `giaBan`, `chiTiet`) VALUES
(1, 'TV LCD', 'Tivi', 7000000, 'Tivi LCD là một trong những sản phẩm phổ biến tại các cửa hàng điện máy, nhờ vào thiết kế mỏng nhẹ, hiện đại và chất lượng hình ảnh sắc nét '),
(2, 'TV Samsung', 'Tivi', 10000000, 'TV Samsung là một trong những sản phẩm điện tử tiêu dùng hàng đầu, nổi bật với thiết kế hiện đại, chất lượng hình ảnh xuất sắc và tính năng thông minh');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tblmathangdattructuyen048`
--

CREATE TABLE `tblmathangdattructuyen048` (
  `id` int(10) NOT NULL,
  `soLuong` int(10) NOT NULL,
  `tblMatHang048id` int(10) NOT NULL,
  `tblDonHangTrucTuyen048id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `tblmathangdattructuyen048`
--

INSERT INTO `tblmathangdattructuyen048` (`id`, `soLuong`, `tblMatHang048id`, `tblDonHangTrucTuyen048id`) VALUES
(1, 2, 1, 1),
(2, 5, 1, 2),
(3, 3, 2, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tblnhanviengiaohang048`
--

CREATE TABLE `tblnhanviengiaohang048` (
  `tblThanhVien048id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `tblnhanviengiaohang048`
--

INSERT INTO `tblnhanviengiaohang048` (`tblThanhVien048id`) VALUES
(3),
(6);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tblthanhvien048`
--

CREATE TABLE `tblthanhvien048` (
  `id` int(10) NOT NULL,
  `taiKhoan` varchar(50) NOT NULL,
  `matKhau` varchar(50) NOT NULL,
  `ten` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `sdt` varchar(50) NOT NULL,
  `role` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `tblthanhvien048`
--

INSERT INTO `tblthanhvien048` (`id`, `taiKhoan`, `matKhau`, `ten`, `email`, `sdt`, `role`) VALUES
(1, 'admin', 'admin', 'Trần Văn Chính', 'chinh31503@gmail.com', '0838831503', 'manager'),
(2, 'user', '1', 'Chính', 'chinh31503@gmail.com', '0838831503', 'customer'),
(3, '', '', 'Lê Tuấn Anh', 'letuananh@gmail.com', '0123456789', 'shipper'),
(4, 'manager', '1', 'Phạm Hải Dương', 'duong@gmail.com', '0123456789', 'manager'),
(5, 'customer', '1', 'Phạm Hải Dương', 'duong@gmail.com', '0123456789', 'customer'),
(6, '', '', 'Phạm Hải Dương', 'duong@gmail.com', '0123456789', 'shipper');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `test`
--

CREATE TABLE `test` (
  `test` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `test`
--

INSERT INTO `test` (`test`) VALUES
(1),
(1);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `tbldonhangtructuyen048`
--
ALTER TABLE `tbldonhangtructuyen048`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `tblhoadonban048`
--
ALTER TABLE `tblhoadonban048`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `tblhoadontructuyen048`
--
ALTER TABLE `tblhoadontructuyen048`
  ADD PRIMARY KEY (`tblHoaDonBan048id`);

--
-- Chỉ mục cho bảng `tblmathang048`
--
ALTER TABLE `tblmathang048`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `tblmathangdattructuyen048`
--
ALTER TABLE `tblmathangdattructuyen048`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `tblthanhvien048`
--
ALTER TABLE `tblthanhvien048`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `tblhoadonban048`
--
ALTER TABLE `tblhoadonban048`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
