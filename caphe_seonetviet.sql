-- phpMyAdmin SQL Dump
-- version 4.6.6
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost
-- Thời gian đã tạo: Th3 20, 2020 lúc 04:09 AM
-- Phiên bản máy phục vụ: 5.5.31
-- Phiên bản PHP: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `today_ledat`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `zarest_categories`
--

CREATE TABLE `zarest_categories` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `created_at` varchar(200) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `zarest_categories`
--

INSERT INTO `zarest_categories` (`id`, `name`, `created_at`) VALUES
(29, 'Trà sữa', '2018-04-13 16:59:51'),
(28, 'Sinh Tố', '2018-04-13 16:59:44'),
(26, 'Cà Phê', '2018-04-13 16:59:28'),
(27, 'Nước Ngọt', '2018-04-13 16:59:38'),
(30, 'Điểm tâm sáng', '2018-04-13 18:33:46');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `zarest_categorie_expences`
--

CREATE TABLE `zarest_categorie_expences` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `created_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `zarest_categorie_expences`
--

INSERT INTO `zarest_categorie_expences` (`id`, `name`, `created_date`) VALUES
(4, 'Khách Hàng Vip', '2018-04-13 10:28:00'),
(5, 'Khách Hàng lui tới', '2018-04-13 10:28:27'),
(6, 'Khách Vãng lai', '2018-04-13 10:28:39');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `zarest_combo_items`
--

CREATE TABLE `zarest_combo_items` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `zarest_customers`
--

CREATE TABLE `zarest_customers` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `discount` varchar(5) DEFAULT NULL,
  `created_at` varchar(150) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `zarest_customers`
--

INSERT INTO `zarest_customers` (`id`, `name`, `phone`, `email`, `discount`, `created_at`) VALUES
(11, 'Nguyễn Tâm', '901551781', 'nguyentam@gmail.com', '5', '2018-04-13 17:27:03'),
(12, 'Phan Văn Tài', '901551781', 'phanvantai@gmail.com', '7', '2018-04-13 17:27:27'),
(13, 'Khách hàng mới mua lần đầu', '901551781', 'khachhangmoi@gmail.com', '0', '2018-04-13 18:28:59');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `zarest_expences`
--

CREATE TABLE `zarest_expences` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `reference` varchar(150) NOT NULL,
  `note` text,
  `amount` float NOT NULL,
  `attachment` varchar(200) DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `category_id` int(11) DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  `created_by` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `zarest_holds`
--

CREATE TABLE `zarest_holds` (
  `id` int(11) NOT NULL,
  `number` int(11) NOT NULL,
  `time` varchar(10) NOT NULL,
  `register_id` int(11) DEFAULT NULL,
  `table_id` int(11) DEFAULT NULL,
  `waiter_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `zarest_holds`
--

INSERT INTO `zarest_holds` (`id`, `number`, `time`, `register_id`, `table_id`, `waiter_id`, `customer_id`) VALUES
(268, 1, '17:30', 60, 54, 0, 0),
(271, 1, '17:31', 60, 44, 8, 13),
(272, 1, '17:31', 60, 45, 0, 0),
(273, 1, '17:31', 60, 46, 0, 0),
(274, 1, '17:32', 60, 47, 0, 0),
(276, 1, '17:34', 60, 0, 0, 0),
(277, 1, '17:52', 60, 57, 0, 0),
(278, 1, '17:52', 60, 48, 0, 0),
(279, 1, '17:52', 60, 49, 0, 0),
(280, 1, '17:52', 60, 50, 0, 0),
(281, 1, '17:52', 60, 51, 0, 0),
(282, 1, '17:52', 60, 52, 0, 0),
(283, 1, '17:52', 60, 53, 0, 0),
(284, 1, '17:52', 60, 55, 0, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `zarest_payements`
--

CREATE TABLE `zarest_payements` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `paid` float NOT NULL,
  `paidmethod` varchar(300) NOT NULL,
  `created_by` varchar(60) NOT NULL,
  `register_id` int(11) NOT NULL,
  `sale_id` int(11) NOT NULL,
  `waiter_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `zarest_posales`
--

CREATE TABLE `zarest_posales` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `price` float NOT NULL,
  `qt` int(6) NOT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `register_id` int(11) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `table_id` int(11) DEFAULT NULL,
  `options` text,
  `time` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `zarest_posales`
--

INSERT INTO `zarest_posales` (`id`, `product_id`, `name`, `price`, `qt`, `status`, `register_id`, `number`, `table_id`, `options`, `time`) VALUES
(1555, 158, 'Cà phê sữa', 20000, 1, 0, 60, 1, 45, NULL, '2018-04-13 18:39:19'),
(1556, 159, 'Nước Ngọt Sting dâu', 12000, 1, 0, 60, 1, 45, NULL, '2018-04-13 18:39:20'),
(1554, 157, 'Cà Phê đen đá', 15000, 1, 0, 60, 1, 45, ',', '2018-04-13 18:39:09'),
(1550, 164, 'Trà sữa KTV', 18000, 1, 0, 60, 1, 47, NULL, '2018-04-13 17:54:54'),
(1557, 157, 'Cà Phê đen đá', 15000, 1, 1, 60, 1, 46, NULL, '2018-04-13 18:40:48'),
(1558, 158, 'Cà phê sữa', 20000, 1, 1, 60, 1, 46, NULL, '2018-04-13 18:40:49'),
(1559, 160, 'Nước ngọt Cocacola', 14000, 1, 1, 60, 1, 46, NULL, '2018-04-13 18:40:50'),
(1560, 161, 'Sinh tố Bơ', 18000, 1, 1, 60, 1, 46, NULL, '2018-04-13 18:40:51');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `zarest_products`
--

CREATE TABLE `zarest_products` (
  `id` int(11) NOT NULL,
  `code` varchar(20) NOT NULL,
  `name` varchar(25) NOT NULL,
  `category` varchar(20) NOT NULL,
  `cost` float NOT NULL,
  `tax` varchar(11) DEFAULT NULL,
  `description` mediumtext,
  `price` float NOT NULL,
  `photo` varchar(200) NOT NULL,
  `photothumb` varchar(500) DEFAULT NULL,
  `color` varchar(10) NOT NULL,
  `created_at` varchar(30) DEFAULT NULL,
  `modified_at` varchar(30) DEFAULT NULL,
  `type` tinyint(4) DEFAULT NULL,
  `alertqt` int(10) DEFAULT NULL,
  `supplier` varchar(200) DEFAULT NULL,
  `unit` varchar(100) DEFAULT NULL,
  `taxmethod` tinyint(4) DEFAULT NULL,
  `h_stores` varchar(300) DEFAULT NULL,
  `options` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `zarest_products`
--

INSERT INTO `zarest_products` (`id`, `code`, `name`, `category`, `cost`, `tax`, `description`, `price`, `photo`, `photothumb`, `color`, `created_at`, `modified_at`, `type`, `alertqt`, `supplier`, `unit`, `taxmethod`, `h_stores`, `options`) VALUES
(157, 'KT001', 'Cà Phê đen đá', 'Cà Phê', 8000, '0', '', 15000, '6fe919907708c2bdb9ddebfe01d23678.jpg', '6fe919907708c2bdb9ddebfe01d23678_thumb.jpg', 'color02', '2018-04-13 17:10:55', '2018-04-13 17:10:55', 0, 10, 'Cà phê Trung Nguyên', '1', 0, NULL, ''),
(158, 'KT002', 'Cà phê sữa', 'Cà Phê', 8000, '0', '', 20000, '7e4bb2b6fdbac2c4ef2208782b26541c.jpg', '7e4bb2b6fdbac2c4ef2208782b26541c_thumb.jpg', 'color04', '2018-04-13 17:13:19', '2018-04-13 17:13:19', 0, 10, 'Cà phê Trung Nguyên', '1', 0, NULL, 'Cà phê đen đá,  sting, cocacola,sinh tố'),
(159, 'KT003', 'Nước Ngọt Sting dâu', 'Nước Ngọt', 6000, '0', '', 12000, '96291dd56488a517f7db6930027b055f.jpg', '96291dd56488a517f7db6930027b055f_thumb.jpg', 'color07', '2018-04-13 17:15:15', '2018-04-13 17:15:15', 0, 50, 'Cocacola', '1', 0, NULL, 'Sting dâu, cocacola'),
(160, 'KT004', 'Nước ngọt Cocacola', 'Nước Ngọt', 5000, '0', '', 14000, 'dce19d7c2a7b819507e6fabbaffe5550.png', 'dce19d7c2a7b819507e6fabbaffe5550_thumb.png', 'color07', '2018-04-13 17:17:07', '2018-04-13 17:17:06', 0, 50, 'Cocacola', '1', 0, NULL, ''),
(161, 'KT005', 'Sinh tố Bơ', 'Sinh Tố', 3000, '0', '', 18000, 'dac3ffbe4e17de05981060b0ce80b960.png', 'dac3ffbe4e17de05981060b0ce80b960_thumb.png', 'color03', '2018-04-13 17:18:50', '2018-04-13 17:18:50', 0, 10, 'Nhà vườn Hòa Thuận Daklak', '1', 0, NULL, ''),
(162, 'KT006', 'Sinh tố Dâu', 'Sinh Tố', 5000, '0', '', 22000, '6743db1c9bc5e4dafed1ad8e1197251d.jpg', '6743db1c9bc5e4dafed1ad8e1197251d_thumb.jpg', 'color07', '2018-04-13 17:20:20', '2018-04-13 17:20:20', 0, 20, 'Nhà vườn Hòa Thuận Daklak', '1', 0, NULL, ''),
(163, 'KT007', 'Trà sữa Trân Châu', 'Trà sữa', 9000, '0', '', 15000, 'bff08afd1709d5a963b9afa969493d45.jpg', 'bff08afd1709d5a963b9afa969493d45_thumb.jpg', 'color05', '2018-04-13 17:22:18', '2018-04-13 17:22:18', 0, 0, 'Nhà vườn Hòa Thuận Daklak', '1', 0, NULL, ''),
(164, 'KT008', 'Trà sữa KTV', 'Trà sữa', 6000, '0', '', 18000, '2a63815049f3f91112ba0d5f5203f415.jpg', '2a63815049f3f91112ba0d5f5203f415_thumb.jpg', 'color06', '2018-04-13 17:25:03', '2018-04-13 17:25:03', 0, 10, 'Nhà vườn Hòa Thuận Daklak', '1', 0, NULL, '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `zarest_purchases`
--

CREATE TABLE `zarest_purchases` (
  `id` int(11) NOT NULL,
  `ref` varchar(11) NOT NULL,
  `date` date NOT NULL,
  `total` float DEFAULT NULL,
  `attachement` varchar(200) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `status` tinyint(4) NOT NULL,
  `created_by` int(11) NOT NULL,
  `type` tinyint(4) NOT NULL,
  `store_id` int(11) DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `note` mediumtext,
  `modified_at` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `zarest_purchase_items`
--

CREATE TABLE `zarest_purchase_items` (
  `id` int(11) NOT NULL,
  `purchase_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qt` int(10) NOT NULL,
  `cost` float NOT NULL,
  `subtot` float NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `zarest_registers`
--

CREATE TABLE `zarest_registers` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint(4) NOT NULL,
  `user_id` int(11) NOT NULL,
  `cash_total` float DEFAULT NULL,
  `cash_sub` float DEFAULT NULL,
  `cc_total` float DEFAULT NULL,
  `cc_sub` float DEFAULT NULL,
  `cheque_total` float DEFAULT NULL,
  `cheque_sub` float DEFAULT NULL,
  `cash_inhand` float DEFAULT NULL,
  `note` text,
  `closed_at` varchar(150) DEFAULT NULL,
  `closed_by` int(11) DEFAULT NULL,
  `store_id` int(11) NOT NULL,
  `waiterscih` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `zarest_registers`
--

INSERT INTO `zarest_registers` (`id`, `date`, `status`, `user_id`, `cash_total`, `cash_sub`, `cc_total`, `cc_sub`, `cheque_total`, `cheque_sub`, `cash_inhand`, `note`, `closed_at`, `closed_by`, `store_id`, `waiterscih`) VALUES
(60, '2018-04-13 09:11:06', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 80, NULL, NULL, NULL, 1, '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `zarest_sales`
--

CREATE TABLE `zarest_sales` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `clientname` varchar(50) NOT NULL,
  `tax` varchar(5) DEFAULT NULL,
  `discount` varchar(10) DEFAULT NULL,
  `subtotal` varchar(15) NOT NULL,
  `total` float NOT NULL,
  `created_at` date NOT NULL,
  `modified_at` varchar(150) DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `created_by` varchar(50) NOT NULL,
  `totalitems` int(20) NOT NULL,
  `paid` varchar(15) DEFAULT NULL,
  `paidmethod` varchar(700) DEFAULT NULL,
  `taxamount` float DEFAULT NULL,
  `discountamount` float DEFAULT NULL,
  `register_id` int(11) DEFAULT NULL,
  `firstpayement` float DEFAULT NULL,
  `waiter_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `zarest_sales`
--

INSERT INTO `zarest_sales` (`id`, `client_id`, `clientname`, `tax`, `discount`, `subtotal`, `total`, `created_at`, `modified_at`, `status`, `created_by`, `totalitems`, `paid`, `paidmethod`, `taxamount`, `discountamount`, `register_id`, `firstpayement`, `waiter_id`) VALUES
(35, 0, 'Khách ngoài', '12%', '', '15000.0', 16800, '2018-04-13', NULL, 0, 'admin Trần Đạt', 1, '16800.0', '0', 1800, 0, 60, 16800, 0),
(36, 13, 'Khách hàng mới mua lần đầu', '0%', '0.0', '35000.0', 35000, '2018-04-13', NULL, 0, 'Đạt Trần', 2, '35000.0', '0', 0, 0, 60, 35000, 8);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `zarest_sale_items`
--

CREATE TABLE `zarest_sale_items` (
  `id` int(11) NOT NULL,
  `sale_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `price` float NOT NULL,
  `qt` int(6) NOT NULL,
  `subtotal` varchar(20) NOT NULL,
  `date` date DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `zarest_sale_items`
--

INSERT INTO `zarest_sale_items` (`id`, `sale_id`, `product_id`, `name`, `price`, `qt`, `subtotal`, `date`) VALUES
(1023, 35, 163, 'Trà sữa Trân Châu', 15000, 1, '15000', '2018-04-13'),
(1024, 36, 158, 'Cà phê sữa', 20000, 1, '20000', '2018-04-13'),
(1025, 36, 157, 'Cà Phê đen đá', 15000, 1, '15000', '2018-04-13');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `zarest_settings`
--

CREATE TABLE `zarest_settings` (
  `id` int(11) NOT NULL,
  `companyname` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `logo` varchar(200) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `currency` varchar(10) DEFAULT NULL,
  `keyboard` tinyint(1) NOT NULL,
  `receiptheader` text,
  `receiptfooter` text NOT NULL,
  `theme` varchar(20) NOT NULL,
  `discount` varchar(5) DEFAULT NULL,
  `tax` varchar(5) DEFAULT NULL,
  `timezone` varchar(400) DEFAULT NULL,
  `language` varchar(30) DEFAULT NULL,
  `stripe` tinyint(4) DEFAULT NULL,
  `stripe_secret_key` varchar(150) DEFAULT NULL,
  `stripe_publishable_key` varchar(150) DEFAULT NULL,
  `decimals` int(2) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `zarest_settings`
--

INSERT INTO `zarest_settings` (`id`, `companyname`, `logo`, `phone`, `currency`, `keyboard`, `receiptheader`, `receiptfooter`, `theme`, `discount`, `tax`, `timezone`, `language`, `stripe`, `stripe_secret_key`, `stripe_publishable_key`, `decimals`) VALUES
(1, 'POS', 'dfd5ab8669c9c5f92ced2962824e3da2.png', '0905674034', 'VND', 0, '', 'POS', 'Light', '', '0%', 'Asia/Bangkok', 'vietnam', 0, '', '', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `zarest_stocks`
--

CREATE TABLE `zarest_stocks` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `type` tinyint(4) DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `quantity` int(10) DEFAULT NULL,
  `price` float DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `zarest_stocks`
--

INSERT INTO `zarest_stocks` (`id`, `product_id`, `type`, `store_id`, `warehouse_id`, `quantity`, `price`) VALUES
(62, 157, NULL, 1, NULL, 14, 15000),
(63, 157, NULL, NULL, 3, 20, NULL),
(64, 158, NULL, 1, NULL, 14, 20000),
(65, 158, NULL, NULL, 3, 20, NULL),
(66, 159, NULL, 1, NULL, 80, 12000),
(67, 159, NULL, NULL, 3, 100, NULL),
(68, 160, NULL, 1, NULL, 100, 14000),
(69, 160, NULL, NULL, 3, 200, NULL),
(70, 161, NULL, 1, NULL, 20, 18000),
(71, 161, NULL, NULL, 3, 25, NULL),
(72, 162, NULL, 1, NULL, 22, 22000),
(73, 162, NULL, NULL, 3, 30, NULL),
(74, 163, NULL, 1, NULL, 9, 15000),
(75, 163, NULL, NULL, 3, 20, NULL),
(76, 164, NULL, 1, NULL, 15, 18000),
(77, 164, NULL, NULL, 3, 30, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `zarest_stores`
--

CREATE TABLE `zarest_stores` (
  `id` int(11) NOT NULL,
  `name` varchar(40) NOT NULL,
  `email` varchar(40) DEFAULT NULL,
  `phone` varchar(40) DEFAULT NULL,
  `adresse` varchar(400) DEFAULT NULL,
  `footer_text` varchar(400) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `country` varchar(20) DEFAULT NULL,
  `created_at` varchar(200) NOT NULL,
  `status` tinyint(4) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `zarest_stores`
--

INSERT INTO `zarest_stores` (`id`, `name`, `email`, `phone`, `adresse`, `footer_text`, `city`, `country`, `created_at`, `status`) VALUES
(1, 'CÀ PHÊ VIỆT', 'LEDAT@gmail.com', '0905674034', 'THỦ ĐỨC', 'Cà phê Việt - Hương vị Việt', 'HỒ CHÍ MINH', 'VIỆT NAM', '2016-05-10 12:44:33', 1),
(5, 'Trà sữa Thủ Đức', 'trasuathdu@gmail.com', '901551781', '209 Đặng văn bi - Trường Thọ - Quận Thủ Đức - TP.HCM', 'Trà sữa Thủ Đức', 'TP Hồ Chí Minh', '', '2018-04-13 18:32:11', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `zarest_suppliers`
--

CREATE TABLE `zarest_suppliers` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `note` mediumtext,
  `created_at` varchar(150) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `zarest_suppliers`
--

INSERT INTO `zarest_suppliers` (`id`, `name`, `phone`, `email`, `note`, `created_at`) VALUES
(4, 'Cà phê Trung Nguyên', '901551781', 'Quoctuan1588@gmail.com', '<p>Cung cấp cà phê nguyên chất</p>', '2018-04-13 17:01:11'),
(5, 'Cocacola', '901551781', 'Quoctuan1588@gmail.com', '<p>Cung cấp nước ngọt</p>', '2018-04-13 17:01:34'),
(6, 'Nhà vườn Hòa Thuận Daklak', '901551781', 'Quoctuan1588@gmail.com', '<p>Cung cấp trái cây sạch</p>', '2018-04-13 17:02:12');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `zarest_tables`
--

CREATE TABLE `zarest_tables` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `zone_id` int(11) NOT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `time` varchar(10) DEFAULT NULL,
  `store_id` int(11) NOT NULL,
  `checked` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `zarest_tables`
--

INSERT INTO `zarest_tables` (`id`, `name`, `zone_id`, `status`, `time`, `store_id`, `checked`) VALUES
(44, 'Bàn 1', 9, 1, '17:30', 1, NULL),
(45, 'Bàn 2', 9, 1, '17:31', 1, NULL),
(46, 'Bàn 3', 9, 1, '17:31', 1, NULL),
(47, 'Bàn 4', 9, 1, '17:31', 1, NULL),
(48, 'Bàn 5', 9, 1, '17:52', 1, NULL),
(49, 'Bàn 6', 9, 1, '17:52', 1, NULL),
(50, 'Bàn 7', 9, 1, '17:52', 1, NULL),
(51, 'Bàn 8', 9, 1, '17:52', 1, NULL),
(52, 'Bàn 9', 9, 1, '17:52', 1, NULL),
(53, 'Bàn 10', 9, 1, '17:52', 1, NULL),
(54, 'Bàn 11', 10, 1, '16:54', 1, '2018-04-13 16:58:43'),
(55, 'Bàn 12', 10, 1, '17:52', 1, NULL),
(56, 'Bàn 13', 10, NULL, NULL, 1, NULL),
(57, 'Bàn 14', 10, 1, '17:34', 1, NULL),
(58, 'Bàn 15', 10, NULL, NULL, 1, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `zarest_users`
--

CREATE TABLE `zarest_users` (
  `id` int(11) NOT NULL,
  `username` varchar(45) NOT NULL,
  `firstname` varchar(100) NOT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `hashed_password` varchar(128) NOT NULL,
  `email` varchar(60) DEFAULT NULL,
  `role` varchar(20) NOT NULL,
  `last_active` varchar(50) DEFAULT NULL,
  `avatar` varchar(200) DEFAULT NULL,
  `created_at` varchar(300) DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `zarest_users`
--

INSERT INTO `zarest_users` (`id`, `username`, `firstname`, `lastname`, `hashed_password`, `email`, `role`, `last_active`, `avatar`, `created_at`, `store_id`) VALUES
(1, 'admin', 'Đạt', 'Trần', '13dea70a7ceba19b9fbbfbbc7f1455edf002dc70903d4cd826b8e4cd348331d4d6cb46f1e0d38f567da3441f526aab50246c15526429c7d882f667b973881d7e', 'ledat@gmail.com', 'admin', '2018-04-13 18:00:06', '39cd9c5d41c757549570ea5615dd9bdf.png', '2018-04-13 17:42:03', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `zarest_variations`
--

CREATE TABLE `zarest_variations` (
  `id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `price` float DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `zarest_waiters`
--

CREATE TABLE `zarest_waiters` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `created_at` varchar(150) DEFAULT NULL,
  `store_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `zarest_waiters`
--

INSERT INTO `zarest_waiters` (`id`, `name`, `phone`, `email`, `created_at`, `store_id`) VALUES
(8, 'Trần Đạt', '901551781', 'Quoctuan1588@gmail.com', '2018-04-13 17:26:19', 1),
(9, 'Hoa Hương', '901551781', 'haohuong@gmail.com', '2018-04-13 17:26:35', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `zarest_warehouses`
--

CREATE TABLE `zarest_warehouses` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `adresse` varchar(400) DEFAULT NULL,
  `created_at` varchar(200) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `zarest_warehouses`
--

INSERT INTO `zarest_warehouses` (`id`, `name`, `phone`, `email`, `adresse`, `created_at`) VALUES
(3, 'Nhà Thuốc Nhân Tâm', '0905674034', 'Quoctuan1588@gmail.com', '209 Đặng văn bi - Trường Thọ - Quận Thủ Đức - TP.HCM', '2018-04-13 16:49:48');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `zarest_zones`
--

CREATE TABLE `zarest_zones` (
  `id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `zarest_zones`
--

INSERT INTO `zarest_zones` (`id`, `store_id`, `name`) VALUES
(9, 1, 'Sân vườn'),
(10, 1, 'Phòng lạnh');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `zarest_categories`
--
ALTER TABLE `zarest_categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `zarest_categorie_expences`
--
ALTER TABLE `zarest_categorie_expences`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `zarest_combo_items`
--
ALTER TABLE `zarest_combo_items`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `zarest_customers`
--
ALTER TABLE `zarest_customers`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `zarest_expences`
--
ALTER TABLE `zarest_expences`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `zarest_holds`
--
ALTER TABLE `zarest_holds`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `zarest_payements`
--
ALTER TABLE `zarest_payements`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `zarest_posales`
--
ALTER TABLE `zarest_posales`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `zarest_products`
--
ALTER TABLE `zarest_products`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `zarest_purchases`
--
ALTER TABLE `zarest_purchases`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `zarest_purchase_items`
--
ALTER TABLE `zarest_purchase_items`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `zarest_registers`
--
ALTER TABLE `zarest_registers`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `zarest_sales`
--
ALTER TABLE `zarest_sales`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `zarest_sale_items`
--
ALTER TABLE `zarest_sale_items`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `zarest_settings`
--
ALTER TABLE `zarest_settings`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `zarest_stocks`
--
ALTER TABLE `zarest_stocks`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `zarest_stores`
--
ALTER TABLE `zarest_stores`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `zarest_suppliers`
--
ALTER TABLE `zarest_suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `zarest_tables`
--
ALTER TABLE `zarest_tables`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `zarest_users`
--
ALTER TABLE `zarest_users`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `zarest_waiters`
--
ALTER TABLE `zarest_waiters`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `zarest_warehouses`
--
ALTER TABLE `zarest_warehouses`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `zarest_zones`
--
ALTER TABLE `zarest_zones`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `zarest_categories`
--
ALTER TABLE `zarest_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT cho bảng `zarest_categorie_expences`
--
ALTER TABLE `zarest_categorie_expences`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT cho bảng `zarest_combo_items`
--
ALTER TABLE `zarest_combo_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT cho bảng `zarest_customers`
--
ALTER TABLE `zarest_customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT cho bảng `zarest_expences`
--
ALTER TABLE `zarest_expences`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT cho bảng `zarest_holds`
--
ALTER TABLE `zarest_holds`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=286;
--
-- AUTO_INCREMENT cho bảng `zarest_payements`
--
ALTER TABLE `zarest_payements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
--
-- AUTO_INCREMENT cho bảng `zarest_posales`
--
ALTER TABLE `zarest_posales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1561;
--
-- AUTO_INCREMENT cho bảng `zarest_products`
--
ALTER TABLE `zarest_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=165;
--
-- AUTO_INCREMENT cho bảng `zarest_purchases`
--
ALTER TABLE `zarest_purchases`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT cho bảng `zarest_purchase_items`
--
ALTER TABLE `zarest_purchase_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT cho bảng `zarest_registers`
--
ALTER TABLE `zarest_registers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;
--
-- AUTO_INCREMENT cho bảng `zarest_sales`
--
ALTER TABLE `zarest_sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
--
-- AUTO_INCREMENT cho bảng `zarest_sale_items`
--
ALTER TABLE `zarest_sale_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1026;
--
-- AUTO_INCREMENT cho bảng `zarest_settings`
--
ALTER TABLE `zarest_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT cho bảng `zarest_stocks`
--
ALTER TABLE `zarest_stocks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;
--
-- AUTO_INCREMENT cho bảng `zarest_stores`
--
ALTER TABLE `zarest_stores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT cho bảng `zarest_suppliers`
--
ALTER TABLE `zarest_suppliers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT cho bảng `zarest_tables`
--
ALTER TABLE `zarest_tables`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;
--
-- AUTO_INCREMENT cho bảng `zarest_users`
--
ALTER TABLE `zarest_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT cho bảng `zarest_waiters`
--
ALTER TABLE `zarest_waiters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT cho bảng `zarest_warehouses`
--
ALTER TABLE `zarest_warehouses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT cho bảng `zarest_zones`
--
ALTER TABLE `zarest_zones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
