-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th4 15, 2023 lúc 11:11 AM
-- Phiên bản máy phục vụ: 10.4.27-MariaDB
-- Phiên bản PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `mvogms_db`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart_list`
--

CREATE TABLE `cart_list` (
  `id` int(30) NOT NULL,
  `client_id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `quantity` float NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `cart_list`
--

INSERT INTO `cart_list` (`id`, `client_id`, `product_id`, `quantity`) VALUES
(34, 5, 60, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category_list`
--

CREATE TABLE `category_list` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `category_list`
--

INSERT INTO `category_list` (`id`, `name`, `description`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(13, 'Rau', 'Các loại rau củ quả', 1, 0, '2023-03-22 23:18:35', NULL),
(14, 'Đồ uống', 'Đồ uống có ga, nước trái cây,...', 1, 0, '2023-03-22 23:19:07', NULL),
(15, 'Thịt', 'Các loại thịt động vật', 1, 0, '2023-03-22 23:19:29', NULL),
(16, 'Nước hoa', 'Nước hoa', 1, 0, '2023-03-22 23:41:58', '2023-03-22 23:59:34'),
(17, 'Mỹ phẩm', 'Mỹ phẩm', 1, 0, '2023-03-22 23:42:13', '2023-03-23 00:00:28'),
(30, 'haha 3', 'hahaha', 1, 0, '2023-04-07 20:56:19', '2023-04-08 14:54:01');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `client_list`
--

CREATE TABLE `client_list` (
  `id` int(30) NOT NULL,
  `code` varchar(100) NOT NULL,
  `firstname` text NOT NULL,
  `middlename` text DEFAULT NULL,
  `lastname` text NOT NULL,
  `gender` text NOT NULL,
  `contact` text NOT NULL,
  `address` text NOT NULL,
  `email` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `client_list`
--

INSERT INTO `client_list` (`id`, `code`, `firstname`, `middlename`, `lastname`, `gender`, `contact`, `address`, `email`, `password`, `avatar`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(5, '202304-00001', 'Thoa', 'thoa', 'Thoa', 'Male', '98765432', 'hn', 'thoanguyen@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', 'uploads/clients/5.png?v=1680681648', 1, 0, '2023-04-05 15:00:48', '2023-04-05 15:00:48'),
(6, '202304-00002', 'test', '', 'test', 'Male', '09876536745', 'hn', 'hoivu2k1@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 'uploads/clients/6.png?v=1680792774', 1, 0, '2023-04-06 21:52:53', '2023-04-06 21:52:54');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_items`
--

CREATE TABLE `order_items` (
  `order_id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `quantity` double NOT NULL DEFAULT 0,
  `price` double NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `order_items`
--

INSERT INTO `order_items` (`order_id`, `product_id`, `quantity`, `price`, `date_created`) VALUES
(15, 40, 1, 280000, '2023-04-06 21:53:15'),
(16, 56, 1, 205000000, '2023-04-07 21:07:57'),
(15, 40, 1, 280000, '2023-04-06 21:53:15'),
(16, 56, 1, 205000000, '2023-04-07 21:07:57');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_list`
--

CREATE TABLE `order_list` (
  `id` int(30) NOT NULL,
  `code` varchar(100) NOT NULL,
  `client_id` int(30) NOT NULL,
  `vendor_id` int(30) NOT NULL,
  `total_amount` double NOT NULL DEFAULT 0,
  `delivery_address` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `order_list`
--

INSERT INTO `order_list` (`id`, `code`, `client_id`, `vendor_id`, `total_amount`, `delivery_address`, `status`, `date_created`, `date_updated`) VALUES
(15, '202304-00001', 6, 6, 280000, 'hn', 0, '2023-04-06 21:53:15', '2023-04-06 21:53:15'),
(16, '202304-00002', 5, 12, 625000000, 'hn', 2, '2023-04-07 21:07:57', '2023-04-08 14:33:36');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_list`
--

CREATE TABLE `product_list` (
  `id` int(30) NOT NULL,
  `vendor_id` int(30) DEFAULT NULL,
  `category_id` int(30) DEFAULT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `price` double NOT NULL DEFAULT 0,
  `image_path` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `product_list`
--

INSERT INTO `product_list` (`id`, `vendor_id`, `category_id`, `name`, `description`, `price`, `image_path`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(24, NULL, 15, 'Cánh gà', '&lt;p&gt;&lt;a href=&quot;https://www.bachhoaxanh.com/thit-ga-canh-ga&quot; style=&quot;margin: 0px; padding: 0px; color: rgb(40, 138, 214); font-family: Helvetica, Arial, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);&quot;&gt;C&aacute;nh g&agrave;&lt;/a&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;&amp;nbsp;nhập khẩu tươi ngon, thịt chắc, nhiều dinh dưỡng thường d&ugrave;ng để chi&ecirc;n với nước mắm hoặc hấp h&agrave;nh.&amp;nbsp;&lt;/span&gt;&lt;a href=&quot;https://www.bachhoaxanh.com/thit-ga/canh-ga-nhap-khau-dong-lanh-tui-500g-3-5-canh&quot; style=&quot;margin: 0px; padding: 0px; color: rgb(40, 138, 214); font-family: Helvetica, Arial, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);&quot;&gt;C&aacute;nh g&agrave; nhập khẩu đ&ocirc;ng lạnh&lt;/a&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;&amp;nbsp;với phương ph&aacute;p cấp đ&ocirc;ng hiện đại, gi&uacute;p lưu giữ hương vị tự nhi&ecirc;n, mang đến những m&oacute;n ăn ngon cho gia đ&igrave;nh&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 35000, 'uploads/products/24.png?v=1679502243', 0, 0, '2023-03-22 23:24:03', '2023-04-09 15:18:06'),
(25, NULL, 15, 'Đùi gà', '&lt;p&gt;&lt;a href=&quot;https://www.bachhoaxanh.com/thit-ga-cp&quot; style=&quot;margin: 0px; padding: 0px; color: rgb(40, 138, 214); font-family: Helvetica, Arial, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);&quot;&gt;Đ&ugrave;i g&agrave; g&oacute;c tư&amp;nbsp;CP&lt;/a&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;&amp;nbsp;đạt c&aacute;c ti&ecirc;u chuẩn về an to&agrave;n thực phẩm, đảm bảo về chất lượng, độ tươi v&agrave; ngon, xuất xứ r&otilde; r&agrave;ng.&amp;nbsp;&lt;/span&gt;&lt;a href=&quot;https://www.bachhoaxanh.com/thit-ga/dui-ga-goc-tu-vi-500g&quot; style=&quot;margin: 0px; padding: 0px; color: rgb(40, 138, 214); font-family: Helvetica, Arial, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);&quot;&gt;Đ&ugrave;i g&agrave;&lt;/a&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;&amp;nbsp;l&agrave; một một nguy&ecirc;n liệu th&iacute;ch hợp để nấu m&oacute;n g&agrave; r&aacute;n, cơm đ&ugrave;i&amp;nbsp;&lt;/span&gt;&lt;a href=&quot;https://www.bachhoaxanh.com/thit-ga&quot; style=&quot;margin: 0px; padding: 0px; color: rgb(40, 138, 214); font-family: Helvetica, Arial, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);&quot;&gt;g&agrave;&lt;/a&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;&amp;nbsp;quay ti&ecirc;u hay g&agrave; chi&ecirc;n nước mắm,...&amp;nbsp;C&oacute; thể d&ugrave;ng điện thoại qu&eacute;t code QR tr&ecirc;n sản phẩm để kiểm tra nguồn g&oacute;c.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 60000, 'uploads/products/25.png?v=1679502301', 1, 1, '2023-03-22 23:25:01', '2023-03-23 21:51:06'),
(26, NULL, 15, 'Lườn gà phi lê', '&lt;p&gt;G&agrave;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;&nbsp;nhập khẩu từ Mỹ được đ&oacute;ng g&oacute;i v&agrave; bảo quản theo những ti&ecirc;u chuẩn nghi&ecirc;m ngặt về vệ sinh v&agrave; an to&agrave;n thực phẩm, đảm bảo về chất lượng.&nbsp;&lt;/span&gt;&lt;a href=&quot;https://www.bachhoaxanh.com/thit-ga/dui-toi-ga-nhap-khau-dong-lanh-tui-500g-2-4-cai&quot; style=&quot;margin: 0px; padding: 0px; color: rgb(40, 138, 214); font-family: Helvetica, Arial, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);&quot;&gt;Đ&ugrave;i tỏi g&agrave; nhập khẩu&lt;/a&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;&nbsp;đ&ocirc;ng lạnh với phương ph&aacute;p cấp đ&ocirc;ng hiện đại, gi&uacute;p lưu giữ hương vị tự nhi&ecirc;n, mang đến những m&oacute;n ăn ngon cho gia đ&igrave;nh.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 47000, 'uploads/products/26.png?v=1679582889', 1, 1, '2023-03-22 23:25:58', '2023-03-23 21:48:22'),
(27, NULL, 15, 'Lòng mề gà', '&lt;p&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;Mề&amp;nbsp;&lt;/span&gt;&lt;a href=&quot;https://www.bachhoaxanh.com/thit-ga-cp&quot; style=&quot;margin: 0px; padding: 0px; color: rgb(40, 138, 214); font-family: Helvetica, Arial, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);&quot;&gt;g&agrave; CP&lt;/a&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;&amp;nbsp;đạt c&aacute;c ti&ecirc;u chuẩn về an to&agrave;n thực phẩm, đảm bảo về chất lượng, độ tươi v&agrave; ngon, xuất xứ r&otilde; r&agrave;ng...&amp;nbsp;&lt;/span&gt;&lt;a href=&quot;https://www.bachhoaxanh.com/thit-ga/me-ga-tuoi-khay-500g&quot; style=&quot;margin: 0px; padding: 0px; color: rgb(40, 138, 214); font-family: Helvetica, Arial, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);&quot;&gt;Mể g&agrave;&lt;/a&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;&amp;nbsp;th&iacute;ch hợp để nấu m&oacute;n mề g&agrave; sốt gừng, mể g&agrave; sốt lạc, mề&amp;nbsp;&lt;/span&gt;&lt;a href=&quot;https://www.bachhoaxanh.com/thit-ga&quot; style=&quot;margin: 0px; padding: 0px; color: rgb(40, 138, 214); font-family: Helvetica, Arial, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);&quot;&gt;g&agrave;&lt;/a&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;&amp;nbsp;trộn chua cay, mề g&agrave; x&agrave;o,....&amp;nbsp;C&oacute; thể d&ugrave;ng điện thoại qu&eacute;t code QR tr&ecirc;n sản phẩm để kiểm tra nguồn g&oacute;c.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 22000, 'uploads/products/27.png?v=1679502444', 1, 0, '2023-03-22 23:27:24', '2023-03-23 21:25:00'),
(28, NULL, 15, 'Gà nguyên con', '&lt;a href=&quot;https://www.bachhoaxanh.com/thit-ga/ga-ta-nguyen-con-cp-11kg-15kg-con&quot; style=&quot;margin: 0px; padding: 0px; color: rgb(40, 138, 214); font-family: Helvetica, Arial, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);&quot;&gt;G&agrave; ta nguy&ecirc;n con&lt;/a&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;&nbsp;c&oacute; thịt dai ngon, mềm thơm chất lượng.&nbsp;&lt;/span&gt;&lt;a href=&quot;https://www.bachhoaxanh.com/thit-ga&quot; style=&quot;margin: 0px; padding: 0px; color: rgb(40, 138, 214); font-family: Helvetica, Arial, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);&quot;&gt;Thịt g&agrave;&lt;/a&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;&nbsp;c&oacute; thể chế biến th&agrave;nh nhiều m&oacute;n ăn ngon, hấp dẫn cho gia đ&igrave;nh v&agrave; bạn b&egrave; thưởng thức. G&agrave; ta được đảm bảo nguồn gốc xuất xứ r&otilde; r&agrave;ng.&lt;/span&gt;', 110000, 'uploads/products/28.png?v=1679582720', 1, 1, '2023-03-22 23:28:30', '2023-03-23 21:45:49'),
(29, NULL, 15, 'Sườn bò Úc', '&lt;p&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;Sườn b&ograve; c&oacute; vị ngon tương tự phần m&ocirc;ng b&ograve; v&agrave; thường được cắt th&agrave;nh l&aacute;t d&agrave;y như b&iacute;t-tết để nướng.&amp;nbsp;Đ&ugrave;i b&ograve; nhập khẩu đ&ocirc;ng lạnh được cấp đ&ocirc;ng từ&amp;nbsp;&lt;/span&gt;&lt;a href=&quot;https://www.bachhoaxanh.com/thit-bo&quot; style=&quot;margin: 0px; padding: 0px; color: rgb(40, 138, 214); font-family: Helvetica, Arial, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);&quot;&gt;thịt b&ograve;&lt;/a&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;&amp;nbsp;tươi ngon l&agrave; sản phẩm c&oacute; xuất xứ r&otilde; r&agrave;ng n&ecirc;n&amp;nbsp;đảm bảo an to&agrave;n thực phẩm v&agrave; gi&agrave;u chất dinh dưỡng&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 145000, 'uploads/products/29.png?v=1679502612', 1, 0, '2023-03-22 23:30:12', '2023-03-23 21:28:09'),
(30, NULL, 15, 'Thăn bò úc', '&lt;p&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;C&oacute; vị ngon tương tự phần m&ocirc;ng b&ograve; v&agrave; thường được cắt th&agrave;nh l&aacute;t d&agrave;y như b&iacute;t-tết để nướng.&amp;nbsp;Đ&ugrave;i b&ograve; nhập khẩu đ&ocirc;ng lạnh được cấp đ&ocirc;ng từ&amp;nbsp;&lt;/span&gt;&lt;a href=&quot;https://www.bachhoaxanh.com/thit-bo&quot; style=&quot;margin: 0px; padding: 0px; color: rgb(40, 138, 214); font-family: Helvetica, Arial, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);&quot;&gt;thịt b&ograve;&lt;/a&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;&amp;nbsp;tươi ngon l&agrave; sản phẩm c&oacute; xuất xứ r&otilde; r&agrave;ng n&ecirc;n&amp;nbsp;đảm bảo an to&agrave;n thực phẩm v&agrave; gi&agrave;u chất dinh dưỡng&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 350000, 'uploads/products/30.png?v=1679502655', 1, 0, '2023-03-22 23:30:55', '2023-03-23 21:28:23'),
(31, NULL, 15, 'Nạc thăn bò xay', '&lt;p&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;Thịt b&ograve; c&oacute; vị ngon tương tự phần m&ocirc;ng b&ograve; v&agrave; thường được cắt th&agrave;nh l&aacute;t d&agrave;y như b&iacute;t-tết để nướng.&amp;nbsp;Đ&ugrave;i b&ograve; nhập khẩu đ&ocirc;ng lạnh được cấp đ&ocirc;ng từ&amp;nbsp;&lt;/span&gt;&lt;a href=&quot;https://www.bachhoaxanh.com/thit-bo&quot; style=&quot;margin: 0px; padding: 0px; color: rgb(40, 138, 214); font-family: Helvetica, Arial, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);&quot;&gt;thịt b&ograve;&lt;/a&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;&amp;nbsp;tươi ngon l&agrave; sản phẩm c&oacute; xuất xứ r&otilde; r&agrave;ng n&ecirc;n&amp;nbsp;đảm bảo an to&agrave;n thực phẩm v&agrave; gi&agrave;u chất dinh dưỡng&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 230000, 'uploads/products/31.png?v=1679502724', 1, 0, '2023-03-22 23:32:04', '2023-03-23 21:27:47'),
(32, NULL, 14, 'Coca 390ml', '&lt;p&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;Từ thương hiệu nước giải kh&aacute;t h&agrave;ng đầu thế giới, nước ngọt Coca Cola chai 390ml xua tan nhanh mọi cảm gi&aacute;c mệt mỏi, căng thẳng, đặc biệt th&iacute;ch hợp sử dụng với c&aacute;c hoạt động ngo&agrave;i trời. B&ecirc;n cạnh đ&oacute; thiết kế dạng chai nhỏ gọn, tiện lợi dễ d&agrave;ng bảo quản khi kh&ocirc;ng sử dụng hết&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 7500, 'uploads/products/32.png?v=1679502860', 0, 0, '2023-03-22 23:34:20', '2023-04-12 13:34:47'),
(33, NULL, 14, 'Coca 1,5l', '&lt;p&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;Từ thương hiệu nước giải kh&aacute;t h&agrave;ng đầu thế giới, nước ngọt Coca Cola chai 1,5l xua tan nhanh mọi cảm gi&aacute;c mệt mỏi, căng thẳng, đặc biệt th&iacute;ch hợp sử dụng với c&aacute;c hoạt động ngo&agrave;i trời. B&ecirc;n cạnh đ&oacute; thiết kế dạng chai nhỏ gọn, tiện lợi dễ d&agrave;ng bảo quản khi kh&ocirc;ng sử dụng hết&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 20000, 'uploads/products/33.png?v=1679502927', 0, 0, '2023-03-22 23:35:27', '2023-04-12 12:40:34'),
(34, NULL, 13, 'Cải chip', '&lt;p&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;Cải th&igrave;a baby l&agrave; giống&amp;nbsp;&lt;/span&gt;&lt;a href=&quot;https://www.bachhoaxanh.com/rau-sach&quot; style=&quot;margin: 0px; padding: 0px; color: rgb(40, 138, 214); font-family: Helvetica, Arial, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);&quot;&gt;rau&lt;/a&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;&amp;nbsp;được nu&ocirc;i trồng v&agrave; đ&oacute;ng g&oacute;i theo những ti&ecirc;u chuẩn nghi&ecirc;m ngặt, bảo đảm c&aacute;c ti&ecirc;u chuẩn xanh - sạch, chất lượng v&agrave; an to&agrave;n với người d&ugrave;ng.&amp;nbsp;&lt;/span&gt;&lt;a href=&quot;https://www.bachhoaxanh.com/rau-sach/cai-thia-baby-goi-300g&quot; style=&quot;margin: 0px; padding: 0px; color: rgb(40, 138, 214); font-family: Helvetica, Arial, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);&quot;&gt;Cải th&igrave;a&lt;/a&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;&amp;nbsp;nhỏ gi&ograve;n ngọt, chứa nhiều chất xơ n&ecirc;n thường được d&ugrave;ng để luộc hoặc x&agrave;o để giữ được độ tươi ngon nhất cho rau.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 15000, 'uploads/products/34.png?v=1679502998', 0, 0, '2023-03-22 23:36:38', '2023-04-09 15:17:41'),
(35, NULL, 13, 'Cải bẹ 500g', '&lt;div class=&quot;short-description&quot; style=&quot;margin: 0px; padding: 5px; font-size: 14px; line-height: 25px; color: rgb(51, 51, 51); font-family: Helvetica, Arial, sans-serif;&quot;&gt;Cải bẹ xanh được nu&ocirc;i trồng v&agrave; đ&oacute;ng g&oacute;i theo những ti&ecirc;u chuẩn nghi&ecirc;m ngặt, bảo đảm c&aacute;c ti&ecirc;u chuẩn xanh - sach, chất lượng v&agrave; an to&agrave;n với người d&ugrave;ng. Với bẹ l&aacute; to, vị hơi đắng nhẹ, m&aacute;t v&agrave; thơm n&ecirc;n thường được d&ugrave;ng để nấu canh hoặc rau cuốn ăn k&egrave;m với b&aacute;nh x&egrave;o, gỏi cuốn.&lt;/div&gt;&lt;div class=&quot;short-description&quot; style=&quot;margin: 0px; padding: 5px; font-size: 14px; line-height: 25px; color: rgb(51, 51, 51); font-family: Helvetica, Arial, sans-serif;&quot;&gt;Cũng như nhiều loại&amp;nbsp;&lt;a href=&quot;https://www.bachhoaxanh.com/rau-sach&quot; target=&quot;_blank&quot; style=&quot;color: rgb(40, 138, 214); background-color: rgb(255, 255, 255); margin: 0px; padding: 0px;&quot;&gt;rau&lt;/a&gt;&amp;nbsp;kh&aacute;c, cải bẹ xanh chứa h&agrave;m lượng calories rất thấp nhưng lại c&oacute; nhiều chất dinh dưỡng cần thiết cho cơ thể như&amp;nbsp;&lt;strong style=&quot;font-weight: bold; margin: 0px; padding: 0px;&quot;&gt;Vitamin A, B, C, K, Axit nicotic, Abumin, Catoten&hellip;&lt;/strong&gt;&lt;br&gt;&lt;/div&gt;&lt;div class=&quot;short-description&quot; style=&quot;margin: 0px; padding: 5px; font-size: 14px; line-height: 25px; color: rgb(51, 51, 51); font-family: Helvetica, Arial, sans-serif;&quot;&gt;&lt;br&gt;&lt;/div&gt;', 30000, 'uploads/products/35.png?v=1679503061', 0, 0, '2023-03-22 23:37:41', '2023-04-08 15:13:15'),
(36, NULL, 13, 'Cải thảo', '&lt;p&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;Bắp cải thảo l&agrave;&amp;nbsp;&lt;/span&gt;&lt;a href=&quot;https://www.bachhoaxanh.com/rau-sach&quot; style=&quot;margin: 0px; padding: 0px; color: rgb(40, 138, 214); font-family: Helvetica, Arial, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);&quot;&gt;loại rau&lt;/a&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;&amp;nbsp;c&oacute; bẹ l&aacute; to, gi&ograve;n, ngọt thường được d&ugrave;ng để nấu canh, x&agrave;o chung với rau củ hoặc để muối kim chi.&amp;nbsp;&lt;/span&gt;&lt;a href=&quot;https://www.bachhoaxanh.com/rau-sach/bap-cai-thao-tui-500gr&quot; style=&quot;margin: 0px; padding: 0px; color: rgb(40, 138, 214); font-family: Helvetica, Arial, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);&quot;&gt;Bắp cải thảo&lt;/a&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;&amp;nbsp;của B&aacute;ch h&oacute;a Xanh được trồng tại L&acirc;m Đồng v&agrave; đ&oacute;ng g&oacute;i theo những ti&ecirc;u chuẩn nghi&ecirc;m ngặt, bảo đảm c&aacute;c ti&ecirc;u chuẩn xanh - sạch, chất lượng v&agrave; an to&agrave;n với người d&ugrave;ng.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 35000, 'uploads/products/36.png?v=1679503105', 0, 0, '2023-03-22 23:38:25', '2023-04-09 15:17:48'),
(37, 6, 17, 'Sữa rửa mặt tạo bọt Senka Perfect Whip 120g', '&lt;p&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: Roboto, Arial, sans-serif; font-size: 18px; font-weight: bold;&quot;&gt;C&ocirc;ng dụng của sữa rửa mặt tạo bọt Senka Perfect Whip 120g&lt;/span&gt;&lt;br&gt;&lt;/p&gt;&lt;ul style=&quot;margin-right: 0px; margin-bottom: 8px; margin-left: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-variant-alternates: inherit; font-stretch: inherit; line-height: inherit; font-family: Roboto, Arial, sans-serif; font-optical-sizing: inherit; font-kerning: inherit; font-feature-settings: inherit; font-variation-settings: inherit; list-style: none; color: rgb(51, 51, 51);&quot;&gt;&lt;li style=&quot;margin: 5px 0px 0px 20px; padding: 0px; border: 0px; font: inherit; position: relative;&quot;&gt;&lt;a href=&quot;https://meta.vn/sua-rua-mat-c916&quot; target=&quot;_blank&quot; style=&quot;margin: 0px; padding: 0px; border: 0px; font: inherit; color: rgb(0, 113, 196); cursor: pointer; display: initial;&quot;&gt;Sữa rửa mặt&lt;/a&gt;&amp;nbsp;Senka l&agrave; thương hiệu đến từ Nhật Bản, sản xuất ở H&agrave;n Quốc đảm bảo chất lượng v&agrave; an to&agrave;n cho l&agrave;n da.&amp;nbsp;&lt;/li&gt;&lt;li style=&quot;margin: 5px 0px 0px 20px; padding: 0px; border: 0px; font: inherit; position: relative;&quot;&gt;&lt;a href=&quot;https://meta.vn/sua-rua-mat-tao-bot-senka-perfect-whip-120g-p68317&quot; target=&quot;_blank&quot; style=&quot;margin: 0px; padding: 0px; border: 0px; font: inherit; color: rgb(0, 113, 196); cursor: pointer; display: initial;&quot;&gt;Senka Perfect Whip&lt;/a&gt;&amp;nbsp;120g được chiết xuất tơ tằm với c&ocirc;ng thức cải tiến tạo bọt cực mịn gi&uacute;p rửa bề mặt da v&agrave; cả b&ecirc;n trong lỗ ch&acirc;n l&ocirc;ng sạch ho&agrave;n hảo, cho l&agrave;n da s&aacute;ng mịn m&agrave;ng hơn.&amp;nbsp;&lt;/li&gt;&lt;li style=&quot;margin: 5px 0px 0px 20px; padding: 0px; border: 0px; font: inherit; position: relative;&quot;&gt;Hơn nữa trong sữa rửa mặt Senka c&ograve;n chứa 2 loại Hyaluronic kết hợp kh&ocirc;ng chỉ gi&uacute;p kh&oacute;a lại độ ẩm tr&ecirc;n da m&agrave; c&ograve;n dễ d&agrave;ng thẩm thấu v&agrave;o da v&agrave; k&eacute;o d&agrave;i t&aacute;c dụng giữ ẩm.&lt;/li&gt;&lt;li style=&quot;margin: 5px 0px 0px 20px; padding: 0px; border: 0px; font: inherit; position: relative;&quot;&gt;Kh&ocirc;ng chỉ l&agrave;m sạch bụi bẩn m&agrave; sữa rửa mặt c&ograve;n gi&uacute;p l&agrave;m sạch b&atilde; nhờn s&acirc;u trong lỗ ch&acirc;n l&ocirc;ng, ngăn ngừa mụn hiệu quả.&lt;/li&gt;&lt;li style=&quot;margin: 5px 0px 0px 20px; padding: 0px; border: 0px; font: inherit; position: relative;&quot;&gt;Sữa rửa mặt tạo bọt Senka Perfect Whip thiết kế dạng tu&yacute;p với trọng lượng 120g cho thời gian sử dụng l&acirc;u d&agrave;i.&lt;/li&gt;&lt;li style=&quot;margin: 5px 0px 0px 20px; padding: 0px; border: 0px; font: inherit; position: relative;&quot;&gt;Sản phẩm th&iacute;ch hợp cho da dầu v&agrave; da hỗn hợp. D&ugrave;ng cho người từ 16 tuổi trở l&ecirc;n.&amp;nbsp;&lt;/li&gt;&lt;/ul&gt;', 345000, 'uploads/products/37.png?v=1679504684', 1, 0, '2023-03-22 23:44:45', '2023-03-23 00:04:44'),
(38, 6, 17, 'Sữa rửa mặt Simple', '&lt;div class=&quot;tt_box_detail width_common&quot; style=&quot;width: 894px; float: left; font-weight: 700; font-size: 18px; margin-bottom: 10px; color: rgb(51, 51, 51); font-family: Roboto, sans-serif;&quot;&gt;Th&agrave;nh phần sản phẩm&lt;/div&gt;&lt;div class=&quot;ct_box_detail width_common&quot; style=&quot;width: 894px; float: left; font-family: arial, helvetica, sans-serif; color: rgb(0, 0, 0); font-size: 13px;&quot;&gt;&lt;div class=&quot;width_common&quot; style=&quot;width: 894px; float: left;&quot;&gt;&lt;p style=&quot;margin-right: 0px; margin-bottom: 10px; margin-left: 0px;&quot;&gt;&lt;strong style=&quot;font-weight: bold;&quot;&gt;Th&agrave;nh phần ch&iacute;nh:&lt;/strong&gt;&lt;/p&gt;&lt;ul style=&quot;margin-bottom: 10px;&quot;&gt;&lt;li&gt;&lt;p style=&quot;margin-right: 0px; margin-bottom: 10px; margin-left: 0px;&quot;&gt;&lt;strong style=&quot;font-weight: bold;&quot;&gt;Nước tinh khiết lọc 3 lần:&amp;nbsp;&lt;/strong&gt;hỗ trợ l&agrave;m dịu l&agrave;n da nhạy cảm, k&iacute;ch ứng.&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p style=&quot;margin-right: 0px; margin-bottom: 10px; margin-left: 0px;&quot;&gt;&lt;strong style=&quot;font-weight: bold;&quot;&gt;Pro-Vitamin B5 (Panthenol):&lt;/strong&gt;&amp;nbsp;gi&uacute;p phục hồi da, đặc biệt c&aacute;c v&ugrave;ng da bị sần s&ugrave;i, kh&ocirc; r&aacute;p, gi&uacute;p da mềm v&agrave; mịn m&agrave;ng hơn, nu&ocirc;i dưỡng da từ s&acirc;u b&ecirc;n trong.&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p style=&quot;margin-right: 0px; margin-bottom: 10px; margin-left: 0px;&quot;&gt;&lt;strong style=&quot;font-weight: bold;&quot;&gt;Vitamin E:&amp;nbsp;&lt;/strong&gt;dưỡng ẩm v&agrave; chống oxy h&oacute;a.&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p style=&quot;margin-right: 0px; margin-bottom: 10px; margin-left: 0px;&quot;&gt;&lt;strong style=&quot;font-weight: bold;&quot;&gt;B&lt;/strong&gt;&lt;strong style=&quot;font-weight: bold;&quot;&gt;isalolol:&amp;nbsp;&lt;/strong&gt;chiết xuất từ hoa c&uacute;c Chamomile c&oacute; đặc t&iacute;nh kh&aacute;ng vi&ecirc;m, kh&aacute;ng khuẩn, ngăn ngừa k&iacute;ch ứng v&agrave; gi&uacute;p l&agrave;m dịu l&agrave;n da bị tổn thương, chống oxy h&oacute;a, dưỡng da mịn m&agrave;ng.&lt;/p&gt;&lt;/li&gt;&lt;/ul&gt;&lt;p style=&quot;margin-right: 0px; margin-bottom: 10px; margin-left: 0px;&quot;&gt;&lt;strong style=&quot;font-weight: bold;&quot;&gt;Th&agrave;nh phần chi tiết:&lt;/strong&gt;&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;margin-right: 0px; margin-bottom: 10px; margin-left: 0px;&quot;&gt;Aqua, Cocamidopropyl Betaine, Propylene Glycol, Hydroxypropyl Methylcellulose, Panthenol, Disodium EDTA, Hydroxypropyl Cyclodextrin, Iodopropynyl Butylcarbamate, Pantolactone, Phenoxyethanol, Sodium Benzoate, Sodium Chloride, Sodium Hydroxide, Tocopheryl Acetate.&lt;/p&gt;&lt;/div&gt;&lt;/div&gt;&lt;div&gt;&lt;span style=&quot;color: rgba(0, 0, 0, 0.8); font-family: &quot; helvetica=&quot;&quot; neue&quot;,=&quot;&quot; helvetica,=&quot;&quot; arial,=&quot;&quot; 文泉驛正黑,=&quot;&quot; &quot;wenquanyi=&quot;&quot; zen=&quot;&quot; hei&quot;,=&quot;&quot; &quot;hiragino=&quot;&quot; sans=&quot;&quot; gb&quot;,=&quot;&quot; &quot;儷黑=&quot;&quot; pro&quot;,=&quot;&quot; &quot;lihei=&quot;&quot; &quot;heiti=&quot;&quot; tc&quot;,=&quot;&quot; 微軟正黑體,=&quot;&quot; &quot;microsoft=&quot;&quot; jhenghei=&quot;&quot; ui&quot;,=&quot;&quot; jhenghei&quot;,=&quot;&quot; sans-serif;=&quot;&quot; font-size:=&quot;&quot; 14px;=&quot;&quot; white-space:=&quot;&quot; pre-wrap;&quot;=&quot;&quot;&gt;&lt;br&gt;&lt;/span&gt;&lt;/div&gt;', 230000, 'uploads/products/38.png?v=1679504545', 1, 0, '2023-03-22 23:46:22', '2023-03-23 00:02:25'),
(39, 6, 17, 'Son Bbia Last Velvet Lip Tint', '&lt;p style=&quot;border: 0px solid rgb(229, 231, 235); --tw-shadow:0 0 transparent; --tw-ring-inset:var(--tw-empty, ); --tw-ring-offset-width:0px; --tw-ring-offset-color:#fff; --tw-ring-color:rgba(59,130,246,0.5); --tw-ring-offset-shadow:0 0 transparent; --tw-ring-shadow:0 0 transparent; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; color: rgb(107, 114, 128); font-family: ui-sans-serif, system-ui, -apple-system, BlinkMacSystemFont, &amp;quot;Segoe UI&amp;quot;, Roboto, &amp;quot;Helvetica Neue&amp;quot;, Arial, &amp;quot;Noto Sans&amp;quot;, sans-serif, &amp;quot;Apple Color Emoji&amp;quot;, &amp;quot;Segoe UI Emoji&amp;quot;, &amp;quot;Segoe UI Symbol&amp;quot;, &amp;quot;Noto Color Emoji&amp;quot;; font-size: medium; white-space: pre-wrap;&quot;&gt;&lt;a href=&quot;https://beecost.vn/t1264.b2097-son-moi-bbia.html&quot; style=&quot;border: 0px solid rgb(229, 231, 235); --tw-shadow:0 0 transparent; --tw-ring-inset:var(--tw-empty, ); --tw-ring-offset-width:0px; --tw-ring-offset-color:#fff; --tw-ring-color:rgba(59,130,246,0.5); --tw-ring-offset-shadow:0 0 transparent; --tw-ring-shadow:0 0 transparent; color: inherit; text-decoration: inherit;&quot;&gt;Son Bbia&lt;/a&gt; Last Velvet Lip Tint l&agrave; bộ sưu tập mới toanh của &lt;a href=&quot;https://beecost.vn/b2097-bbia.html&quot; style=&quot;border: 0px solid rgb(229, 231, 235); --tw-shadow:0 0 transparent; --tw-ring-inset:var(--tw-empty, ); --tw-ring-offset-width:0px; --tw-ring-offset-color:#fff; --tw-ring-color:rgba(59,130,246,0.5); --tw-ring-offset-shadow:0 0 transparent; --tw-ring-shadow:0 0 transparent; color: inherit; text-decoration: inherit;&quot;&gt;Bbia&lt;/a&gt; tiếp nối th&agrave;nh c&ocirc;ng của những d&ograve;ng son trước, với thiết kế nhỏ gọn đơn giản, trẻ trung, tuy kh&ocirc;ng bắt mắt lắm nhưng b&ugrave; lại m&agrave;u son th&igrave; đẹp tuyệt vời miễn ch&ecirc; lu&ocirc;n nh&eacute; c&aacute;c n&agrave;ng.&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;color: rgb(107, 114, 128); font-family: ui-sans-serif, system-ui, -apple-system, BlinkMacSystemFont, &amp;quot;Segoe UI&amp;quot;, Roboto, &amp;quot;Helvetica Neue&amp;quot;, Arial, &amp;quot;Noto Sans&amp;quot;, sans-serif, &amp;quot;Apple Color Emoji&amp;quot;, &amp;quot;Segoe UI Emoji&amp;quot;, &amp;quot;Segoe UI Symbol&amp;quot;, &amp;quot;Noto Color Emoji&amp;quot;; font-size: medium; white-space: pre-wrap;&quot;&gt; \r\n&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;border: 0px solid rgb(229, 231, 235); --tw-shadow:0 0 transparent; --tw-ring-inset:var(--tw-empty, ); --tw-ring-offset-width:0px; --tw-ring-offset-color:#fff; --tw-ring-color:rgba(59,130,246,0.5); --tw-ring-offset-shadow:0 0 transparent; --tw-ring-shadow:0 0 transparent; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; color: rgb(107, 114, 128); font-family: ui-sans-serif, system-ui, -apple-system, BlinkMacSystemFont, &amp;quot;Segoe UI&amp;quot;, Roboto, &amp;quot;Helvetica Neue&amp;quot;, Arial, &amp;quot;Noto Sans&amp;quot;, sans-serif, &amp;quot;Apple Color Emoji&amp;quot;, &amp;quot;Segoe UI Emoji&amp;quot;, &amp;quot;Segoe UI Symbol&amp;quot;, &amp;quot;Noto Color Emoji&amp;quot;; font-size: medium; white-space: pre-wrap;&quot;&gt;Kết cấu của Bbia Last Velvet Lip Tint c&oacute; phần đặc hơn son tint v&agrave; lỏng hơn so với son kem một tẹo nhưng khi thoa l&ecirc;n m&ocirc;i th&igrave; c&aacute;c ph&acirc;n tử nhỏ li&ecirc;n kết chặt chẽ v&agrave; tiệp ngay v&agrave;o m&ocirc;i như son tint gi&uacute;p che đi những khuyết điểm của m&ocirc;i, cho bờ m&ocirc;i cảm gi&aacute;c tươi tắn khỏe mạnh.&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;color: rgb(107, 114, 128); font-family: ui-sans-serif, system-ui, -apple-system, BlinkMacSystemFont, &amp;quot;Segoe UI&amp;quot;, Roboto, &amp;quot;Helvetica Neue&amp;quot;, Arial, &amp;quot;Noto Sans&amp;quot;, sans-serif, &amp;quot;Apple Color Emoji&amp;quot;, &amp;quot;Segoe UI Emoji&amp;quot;, &amp;quot;Segoe UI Symbol&amp;quot;, &amp;quot;Noto Color Emoji&amp;quot;; font-size: medium; white-space: pre-wrap;&quot;&gt; \r\n&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;border: 0px solid rgb(229, 231, 235); --tw-shadow:0 0 transparent; --tw-ring-inset:var(--tw-empty, ); --tw-ring-offset-width:0px; --tw-ring-offset-color:#fff; --tw-ring-color:rgba(59,130,246,0.5); --tw-ring-offset-shadow:0 0 transparent; --tw-ring-shadow:0 0 transparent; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; color: rgb(107, 114, 128); font-family: ui-sans-serif, system-ui, -apple-system, BlinkMacSystemFont, &amp;quot;Segoe UI&amp;quot;, Roboto, &amp;quot;Helvetica Neue&amp;quot;, Arial, &amp;quot;Noto Sans&amp;quot;, sans-serif, &amp;quot;Apple Color Emoji&amp;quot;, &amp;quot;Segoe UI Emoji&amp;quot;, &amp;quot;Segoe UI Symbol&amp;quot;, &amp;quot;Noto Color Emoji&amp;quot;; font-size: medium; white-space: pre-wrap;&quot;&gt;Chất son mướt mịn, l&ecirc;n m&agrave;u cực k&igrave; chuẩn, chỉ cần một lần thoa l&agrave; l&ecirc;n m&agrave;u r&otilde; v&agrave; sống động, dễ d&agrave;ng d&agrave;n trải đều tr&ecirc;n bờ m&ocirc;i v&agrave; nhanh ch&oacute;ng kh&ocirc; đi tạo th&agrave;nh một lớp son l&igrave; si&ecirc;u mịn c&oacute; thể giữ m&agrave;u bền l&acirc;u suốt nhiều giờ liền, kh&ocirc;ng g&acirc;y cảm gi&aacute;c d&agrave;y hay b&oacute;ng m&ocirc;i như một số d&ograve;ng son kem kh&aacute;c.&lt;/p&gt;', 450000, 'uploads/products/39.png?v=1679504863', 1, 0, '2023-03-22 23:48:14', '2023-03-23 00:07:43'),
(40, 6, 17, 'Phấn Nền Mac Chính Hãng', '&lt;p&gt;&lt;span style=&quot;font-weight: bolder; color: rgb(0, 0, 0); font-family: Lato, sans-serif; font-size: medium;&quot;&gt;Phấn Mac&lt;/span&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: Lato, sans-serif; font-size: medium;&quot;&gt;&nbsp;l&agrave; d&ograve;ng sản phẩm nổi bật của thương hiệu c&ugrave;ng t&ecirc;n đến từ Mỹ, được rất nhiều kh&aacute;ch h&agrave;ng ưa chuộng với khả năng bắt s&aacute;ng tốt, tạo độ mịn cao, khả năng make up 2in1 vừa l&agrave;&nbsp;&lt;/span&gt;&lt;a title=&quot;phấn nền&quot; href=&quot;https://xachtaynhat.net/groups/trang-diem/phan/&quot; style=&quot;background-color: rgb(255, 255, 255); touch-action: manipulation; color: rgb(221, 51, 51); font-family: Lato, sans-serif; font-size: medium;&quot;&gt;phấn nền&lt;/a&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: Lato, sans-serif; font-size: medium;&quot;&gt;&nbsp;vừa l&agrave; phấn phủ, mang đến cho n&agrave;ng độ che phủ ho&agrave;n hảo kh&ocirc;ng t&igrave; viết nhưng kh&ocirc;ng l&agrave;m b&iacute; da. Ch&iacute;nh v&igrave; điều đ&oacute; m&agrave; M.A.C được nhiều chuy&ecirc;n gia trang điểm tr&ecirc;n thế giới tin d&ugrave;ng.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 280000, 'uploads/products/40.png?v=1679504782', 1, 0, '2023-03-22 23:49:56', '2023-03-23 00:06:22'),
(41, 6, 17, 'Gel Rửa Mặt La Roche-Posay Dành Cho Da Dầu, Nhạy Cảm 200ml', '&lt;p class=&quot;irIKAp&quot; style=&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 0px; color: rgba(0, 0, 0, 0.8); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, 文泉驛正黑, &quot;WenQuanYi Zen Hei&quot;, &quot;Hiragino Sans GB&quot;, &quot;儷黑 Pro&quot;, &quot;LiHei Pro&quot;, &quot;Heiti TC&quot;, 微軟正黑體, &quot;Microsoft JhengHei UI&quot;, &quot;Microsoft JhengHei&quot;, sans-serif; font-size: 14px; white-space: pre-wrap;&quot;&gt;L&agrave; kh&aacute;ch h&agrave;ng của L66 Studio, bạn sẽ được:&lt;/p&gt;&lt;p class=&quot;irIKAp&quot; style=&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 0px; color: rgba(0, 0, 0, 0.8); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, 文泉驛正黑, &quot;WenQuanYi Zen Hei&quot;, &quot;Hiragino Sans GB&quot;, &quot;儷黑 Pro&quot;, &quot;LiHei Pro&quot;, &quot;Heiti TC&quot;, 微軟正黑體, &quot;Microsoft JhengHei UI&quot;, &quot;Microsoft JhengHei&quot;, sans-serif; font-size: 14px; white-space: pre-wrap;&quot;&gt;\r\n&lt;/p&gt;&lt;p class=&quot;irIKAp&quot; style=&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 0px; color: rgba(0, 0, 0, 0.8); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, 文泉驛正黑, &quot;WenQuanYi Zen Hei&quot;, &quot;Hiragino Sans GB&quot;, &quot;儷黑 Pro&quot;, &quot;LiHei Pro&quot;, &quot;Heiti TC&quot;, 微軟正黑體, &quot;Microsoft JhengHei UI&quot;, &quot;Microsoft JhengHei&quot;, sans-serif; font-size: 14px; white-space: pre-wrap;&quot;&gt;👉 FREESHIP cho tất cả c&aacute;c đơn h&agrave;ng từ 150K&lt;/p&gt;&lt;p class=&quot;irIKAp&quot; style=&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 0px; color: rgba(0, 0, 0, 0.8); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, 文泉驛正黑, &quot;WenQuanYi Zen Hei&quot;, &quot;Hiragino Sans GB&quot;, &quot;儷黑 Pro&quot;, &quot;LiHei Pro&quot;, &quot;Heiti TC&quot;, 微軟正黑體, &quot;Microsoft JhengHei UI&quot;, &quot;Microsoft JhengHei&quot;, sans-serif; font-size: 14px; white-space: pre-wrap;&quot;&gt;\r\n&lt;/p&gt;&lt;p class=&quot;irIKAp&quot; style=&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 0px; color: rgba(0, 0, 0, 0.8); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, 文泉驛正黑, &quot;WenQuanYi Zen Hei&quot;, &quot;Hiragino Sans GB&quot;, &quot;儷黑 Pro&quot;, &quot;LiHei Pro&quot;, &quot;Heiti TC&quot;, 微軟正黑體, &quot;Microsoft JhengHei UI&quot;, &quot;Microsoft JhengHei&quot;, sans-serif; font-size: 14px; white-space: pre-wrap;&quot;&gt;👉 Cam kết chất lượng v&agrave; mẫu m&atilde; sản phẩm giống với h&igrave;nh ảnh.&lt;/p&gt;&lt;p class=&quot;irIKAp&quot; style=&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 0px; color: rgba(0, 0, 0, 0.8); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, 文泉驛正黑, &quot;WenQuanYi Zen Hei&quot;, &quot;Hiragino Sans GB&quot;, &quot;儷黑 Pro&quot;, &quot;LiHei Pro&quot;, &quot;Heiti TC&quot;, 微軟正黑體, &quot;Microsoft JhengHei UI&quot;, &quot;Microsoft JhengHei&quot;, sans-serif; font-size: 14px; white-space: pre-wrap;&quot;&gt;\r\n&lt;/p&gt;&lt;p class=&quot;irIKAp&quot; style=&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 0px; color: rgba(0, 0, 0, 0.8); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, 文泉驛正黑, &quot;WenQuanYi Zen Hei&quot;, &quot;Hiragino Sans GB&quot;, &quot;儷黑 Pro&quot;, &quot;LiHei Pro&quot;, &quot;Heiti TC&quot;, 微軟正黑體, &quot;Microsoft JhengHei UI&quot;, &quot;Microsoft JhengHei&quot;, sans-serif; font-size: 14px; white-space: pre-wrap;&quot;&gt;👉 Ho&agrave;n tiền nếu sản phẩm kh&ocirc;ng giống với m&ocirc; tả.&lt;/p&gt;&lt;p class=&quot;irIKAp&quot; style=&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 0px; color: rgba(0, 0, 0, 0.8); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, 文泉驛正黑, &quot;WenQuanYi Zen Hei&quot;, &quot;Hiragino Sans GB&quot;, &quot;儷黑 Pro&quot;, &quot;LiHei Pro&quot;, &quot;Heiti TC&quot;, 微軟正黑體, &quot;Microsoft JhengHei UI&quot;, &quot;Microsoft JhengHei&quot;, sans-serif; font-size: 14px; white-space: pre-wrap;&quot;&gt;\r\n&lt;/p&gt;&lt;p class=&quot;irIKAp&quot; style=&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 0px; color: rgba(0, 0, 0, 0.8); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, 文泉驛正黑, &quot;WenQuanYi Zen Hei&quot;, &quot;Hiragino Sans GB&quot;, &quot;儷黑 Pro&quot;, &quot;LiHei Pro&quot;, &quot;Heiti TC&quot;, 微軟正黑體, &quot;Microsoft JhengHei UI&quot;, &quot;Microsoft JhengHei&quot;, sans-serif; font-size: 14px; white-space: pre-wrap;&quot;&gt;👉 Cam kết được đổi trả h&agrave;ng trong v&ograve;ng 2 ng&agrave;y&lt;/p&gt;', 178000, 'uploads/products/41.png?v=1679504608', 1, 0, '2023-03-22 23:51:33', '2023-03-23 00:03:28'),
(42, NULL, 15, 'Thịt gà nguyên con', '&lt;p&gt;&lt;a href=&quot;https://www.bachhoaxanh.com/thit-ga/ga-ta-nguyen-con-cp-11kg-15kg-con&quot; style=&quot;color: rgb(40, 138, 214); background-color: rgb(255, 255, 255); margin: 0px; padding: 0px; font-family: Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;G&agrave; ta nguy&ecirc;n con&lt;/a&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;&nbsp;c&oacute; thịt dai ngon, mềm thơm chất lượng.&nbsp;&lt;/span&gt;&lt;a href=&quot;https://www.bachhoaxanh.com/thit-ga&quot; style=&quot;color: rgb(40, 138, 214); background-color: rgb(255, 255, 255); margin: 0px; padding: 0px; font-family: Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;Thịt g&agrave;&lt;/a&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;&nbsp;c&oacute; thể chế biến th&agrave;nh nhiều m&oacute;n ăn ngon, hấp dẫn cho gia đ&igrave;nh v&agrave; bạn b&egrave; thưởng thức. G&agrave; ta được đảm bảo nguồn gốc xuất xứ r&otilde; r&agrave;ng&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 110000, 'uploads/products/42.png?v=1679582801', 1, 0, '2023-03-23 21:46:11', '2023-03-23 21:46:41'),
(43, NULL, 15, 'Lườn gà phi lê', '&lt;p&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;Lườn g&agrave; c&oacute; thịt dai ngon, mềm thơm chất lượng.&amp;nbsp;&lt;/span&gt;&lt;a href=&quot;https://www.bachhoaxanh.com/thit-ga&quot; style=&quot;color: rgb(40, 138, 214); background-color: rgb(255, 255, 255); margin: 0px; padding: 0px; font-family: Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;Thịt g&agrave;&lt;/a&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;&amp;nbsp;c&oacute; thể chế biến th&agrave;nh nhiều m&oacute;n ăn ngon, hấp dẫn cho gia đ&igrave;nh v&agrave; bạn b&egrave; thưởng thức. G&agrave; ta được đảm bảo nguồn gốc xuất xứ r&otilde; r&agrave;ng&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 45000, 'uploads/products/43.png?v=1679582936', 1, 0, '2023-03-23 21:48:56', '2023-03-23 21:48:56'),
(44, NULL, 15, 'Đùi gà', '&lt;p&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;G&agrave; c&oacute; thịt dai ngon, mềm thơm chất lượng.&amp;nbsp;&lt;/span&gt;&lt;a href=&quot;https://www.bachhoaxanh.com/thit-ga&quot; style=&quot;color: rgb(40, 138, 214); background-color: rgb(255, 255, 255); margin: 0px; padding: 0px; font-family: Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;Thịt g&agrave;&lt;/a&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;&amp;nbsp;c&oacute; thể chế biến th&agrave;nh nhiều m&oacute;n ăn ngon, hấp dẫn cho gia đ&igrave;nh v&agrave; bạn b&egrave; thưởng thức. G&agrave; ta được đảm bảo nguồn gốc xuất xứ r&otilde; r&agrave;ng&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 35000, 'uploads/products/44.png?v=1679583096', 1, 0, '2023-03-23 21:51:36', '2023-03-23 21:51:36'),
(54, 13, 16, 'test01', '&lt;p&gt;test&lt;/p&gt;', 11, 'uploads/products/54.png?v=1680793954', 0, 0, '2023-04-06 22:12:34', '2023-04-07 19:36:44'),
(55, 12, 15, 'Gà ok hihi', '&lt;p&gt;ngon&nbsp;&lt;/p&gt;', 500000, 'uploads/products/55.png?v=1680874694', 1, 0, '2023-04-07 20:38:13', '2023-04-08 15:19:35'),
(56, 12, 16, 'Vũ ', '&lt;p&gt;ok&lt;/p&gt;', 205000000, 'uploads/products/56.png?v=1680875440', 0, 0, '2023-04-07 20:50:40', '2023-04-08 15:20:10'),
(59, 12, 17, 'Hoa', '&lt;p&gt;ok&lt;/p&gt;', 55, 'uploads/products/59.png?v=1680941772', 1, 0, '2023-04-08 15:16:01', '2023-04-08 15:16:12'),
(60, 12, 13, 'Hoa chuối ', '&lt;p&gt;ok&lt;/p&gt;', 10000000, 'uploads/products/60.png?v=1680942220', 0, 0, '2023-04-08 15:23:40', '2023-04-08 15:24:38'),
(61, NULL, 17, 'Sữa rửa mặt Simple 2', '&lt;p&gt;ok&lt;/p&gt;', 500000, 'uploads/products/61.png?v=1680949045', 0, 0, '2023-04-08 17:17:25', '2023-04-08 17:19:26');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `shop_type_list`
--

CREATE TABLE `shop_type_list` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `shop_type_list`
--

INSERT INTO `shop_type_list` (`id`, `name`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(2, 'Mỹ phẩm', 1, 0, '2022-02-09 08:49:46', '2023-03-23 11:00:21'),
(3, 'Trang sức', 1, 0, '2022-02-09 08:50:31', '2023-03-23 10:59:52'),
(4, 'Thực phẩm', 1, 0, '2022-02-09 08:50:36', '2023-03-23 10:53:58'),
(5, 'Others', 1, 1, '2022-02-09 08:50:41', '2022-02-09 08:50:45'),
(6, 'Đồ gia dụng', 1, 0, '2023-03-23 16:43:54', NULL),
(9, 'Đồ ăn vặt', 1, 0, '2023-04-09 15:17:25', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `system_info`
--

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', 'HỆ THỐNG QUẢN LÝ CÁC GIAN HÀNG TRỰC TUYẾN  '),
(6, 'short_name', 'MVOGMS - PHP'),
(11, 'logo', 'uploads/logo-1679584865.png'),
(13, 'user_avatar', 'uploads/user_avatar.jpg'),
(14, 'cover', 'uploads/cover-1679585902.png');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(50) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `username`, `password`, `avatar`, `last_login`, `type`, `date_added`, `date_updated`) VALUES
(1, 'Adminstrator', 'Admin', 'admin', '0192023a7bbd73250516f069df18b500', 'uploads/avatar-1.png?v=1644472635', NULL, 1, '2021-01-20 14:02:37', '2022-02-10 13:57:15'),
(11, 'Vu', 'Hoi', 'Rosalie', 'c70c78ad1d547b8ab235b52604cddd17', 'uploads/avatar-11.png?v=1678549087', NULL, 1, '2022-02-10 13:55:52', '2023-03-23 11:16:06');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `vendor_list`
--

CREATE TABLE `vendor_list` (
  `id` int(30) NOT NULL,
  `code` varchar(100) NOT NULL,
  `shop_type_id` int(30) NOT NULL,
  `shop_name` text NOT NULL,
  `shop_owner` text NOT NULL,
  `contact` text NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `vendor_list`
--

INSERT INTO `vendor_list` (`id`, `code`, `shop_type_id`, `shop_name`, `shop_owner`, `contact`, `username`, `password`, `avatar`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(6, '202303-00003', 3, 'Thu Hoài', 'Trương Thị Thu Hoài', '09876536745', 'ThuHoai', '25f9e794323b453885f5181f1b624d0b', 'uploads/vendors/6.png?v=1679503271', 1, 0, '2023-03-22 23:41:11', '2023-03-22 23:41:11'),
(12, '202304-00001', 4, 'TEST', 'test', '98765432', 'test', '827ccb0eea8a706c4c34a16891f84e7b', 'uploads/vendors/12.png?v=1680681870', 1, 0, '2023-04-05 15:04:30', '2023-04-05 15:04:30'),
(13, '202304-00002', 3, 'Shop Test Produc', 'test', '09876536745', 'testpro', '25f9e794323b453885f5181f1b624d0b', 'uploads/vendors/13.png?v=1680792982', 1, 0, '2023-04-06 21:56:22', '2023-04-06 21:56:22');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `cart_list`
--
ALTER TABLE `cart_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Chỉ mục cho bảng `category_list`
--
ALTER TABLE `category_list`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `client_list`
--
ALTER TABLE `client_list`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `order_items`
--
ALTER TABLE `order_items`
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Chỉ mục cho bảng `order_list`
--
ALTER TABLE `order_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `vendor_id` (`vendor_id`);

--
-- Chỉ mục cho bảng `product_list`
--
ALTER TABLE `product_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vendor_id` (`vendor_id`),
  ADD KEY `category_id` (`category_id`) USING BTREE;

--
-- Chỉ mục cho bảng `shop_type_list`
--
ALTER TABLE `shop_type_list`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `system_info`
--
ALTER TABLE `system_info`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `vendor_list`
--
ALTER TABLE `vendor_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shop_type_id` (`shop_type_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `cart_list`
--
ALTER TABLE `cart_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT cho bảng `category_list`
--
ALTER TABLE `category_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT cho bảng `client_list`
--
ALTER TABLE `client_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `order_list`
--
ALTER TABLE `order_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT cho bảng `product_list`
--
ALTER TABLE `product_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT cho bảng `shop_type_list`
--
ALTER TABLE `shop_type_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `vendor_list`
--
ALTER TABLE `vendor_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `cart_list`
--
ALTER TABLE `cart_list`
  ADD CONSTRAINT `cart_list_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client_list` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_list_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product_list` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order_list` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product_list` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `order_list`
--
ALTER TABLE `order_list`
  ADD CONSTRAINT `order_list_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client_list` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_list_ibfk_2` FOREIGN KEY (`vendor_id`) REFERENCES `vendor_list` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `product_list`
--
ALTER TABLE `product_list`
  ADD CONSTRAINT `product_list_ibfk_1` FOREIGN KEY (`vendor_id`) REFERENCES `vendor_list` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `product_list_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `category_list` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `vendor_list`
--
ALTER TABLE `vendor_list`
  ADD CONSTRAINT `vendor_list_ibfk_1` FOREIGN KEY (`shop_type_id`) REFERENCES `shop_type_list` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
