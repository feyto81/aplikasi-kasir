-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Waktu pembuatan: 14 Bulan Mei 2020 pada 17.53
-- Versi server: 5.7.24
-- Versi PHP: 7.2.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kasir`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `gender` enum('L','P') NOT NULL,
  `phone` varchar(15) NOT NULL,
  `address` text NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `customer`
--

INSERT INTO `customer` (`customer_id`, `name`, `gender`, `phone`, `address`, `created`, `updated`) VALUES
(2, 'Feyto', 'L', '9923230', 'djsds\r\n', '2020-05-09 15:07:47', '2020-05-12 13:53:17'),
(3, 'Yollanda', 'P', '034384384', 'jdsd', '2020-05-09 15:11:45', '2020-05-09 08:12:58');

-- --------------------------------------------------------

--
-- Struktur dari tabel `p_category`
--

CREATE TABLE `p_category` (
  `category_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `p_category`
--

INSERT INTO `p_category` (`category_id`, `name`, `created`, `updated`) VALUES
(2, 'Buku', '2020-05-09 20:09:16', NULL),
(3, 'Kaos', '2020-05-09 20:18:34', NULL),
(5, 'Elektronik', '2020-05-09 20:23:45', NULL),
(6, 'Kaoss', '2020-05-09 20:24:18', '2020-05-12 13:54:06');

-- --------------------------------------------------------

--
-- Struktur dari tabel `p_item`
--

CREATE TABLE `p_item` (
  `item_id` int(11) NOT NULL,
  `barcode` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `price` int(18) DEFAULT NULL,
  `stock` int(10) NOT NULL DEFAULT '0',
  `image` varchar(100) DEFAULT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `p_item`
--

INSERT INTO `p_item` (`item_id`, `barcode`, `name`, `category_id`, `unit_id`, `price`, `stock`, `image`, `created`, `updated`) VALUES
(2, 'A001', 'Pulpern', 2, 3, 2000, 0, 'item-200509-9a76f8a2bb.png', '2020-05-09 23:49:17', '2020-05-09 19:50:17'),
(7, 'A003', 'vivo', 5, 2, 20000, 24, NULL, '2020-05-10 01:49:48', NULL),
(8, 'A004', 'sas', 2, 2, 20000, 18, 'item-200509-b97ba6a3b6.jpg', '2020-05-10 01:58:38', '2020-05-10 11:12:03'),
(9, 'A005', 'Laptop', 5, 2, 2000000, 20, 'item-200510-b2bf5185d3.jpg', '2020-05-10 19:10:40', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `p_unit`
--

CREATE TABLE `p_unit` (
  `unit_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `p_unit`
--

INSERT INTO `p_unit` (`unit_id`, `name`, `created`, `updated`) VALUES
(2, 'Kilogram', '2020-05-09 20:09:16', '2020-05-09 13:57:15'),
(3, 'Buah', '2020-05-09 20:18:34', '2020-05-09 13:57:23');

-- --------------------------------------------------------

--
-- Struktur dari tabel `supplier`
--

CREATE TABLE `supplier` (
  `supplier_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `description` text,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `supplier`
--

INSERT INTO `supplier` (`supplier_id`, `name`, `phone`, `address`, `description`, `created`, `updated`) VALUES
(1, 'Toko A', '088288740010', 'Jepara', 'Toko Beras', '2020-05-09 13:03:32', NULL),
(3, 'Toko B', '0837646343', 'Jepara', 'sdsd', '2020-05-09 13:26:09', '2020-05-12 13:53:09'),
(4, 'Toko D', '08384384', 'dsd', 'dsd', '2020-05-12 20:53:55', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_cart`
--

CREATE TABLE `t_cart` (
  `cart_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `price` int(20) NOT NULL,
  `qty` int(10) NOT NULL,
  `discount_item` int(11) DEFAULT '0',
  `total` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_sale`
--

CREATE TABLE `t_sale` (
  `sale_id` int(11) NOT NULL,
  `invoice` varchar(50) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `total_price` int(11) NOT NULL,
  `discount` int(11) NOT NULL,
  `final_price` int(11) NOT NULL,
  `cash` int(11) NOT NULL,
  `remaining` int(11) NOT NULL,
  `note` text NOT NULL,
  `date` date NOT NULL,
  `user_id` int(11) NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `t_sale`
--

INSERT INTO `t_sale` (`sale_id`, `invoice`, `customer_id`, `total_price`, `discount`, `final_price`, `cash`, `remaining`, `note`, `date`, `user_id`, `created`) VALUES
(9, 'INV2005120001', NULL, 20000, 90, 19910, 29900, 9990, 'Lunas', '2020-05-12', 1, '2020-05-12 16:08:03'),
(10, 'INV2005120001', NULL, 20000, 999, 19001, 200, -18801, 'ds', '2020-05-12', 1, '2020-05-12 16:08:49'),
(11, 'INV2005120001', NULL, 20000, 0, 20000, 9000, -11000, '', '2020-05-12', 1, '2020-05-12 17:06:25'),
(12, 'INV2005120001', NULL, 20000, 0, 20000, 900, -19100, 'ds', '2020-05-12', 1, '2020-05-12 17:08:06'),
(13, 'INV2005120001', NULL, 40000, 0, 40000, 90000, 50000, '', '2020-05-12', 1, '2020-05-12 17:10:48'),
(14, 'INV2005120001', NULL, 20000, 200, 19800, 20000, 200, 'dsd', '2020-05-12', 1, '2020-05-12 20:02:03'),
(15, 'INV2005120001', NULL, 20000, 200, 19800, 20000, 200, 'dsd', '2020-05-12', 1, '2020-05-12 20:02:07'),
(16, 'INV2005120001', NULL, 20000, 200, 19800, 20000, 200, 'dsd', '2020-05-12', 1, '2020-05-12 20:02:11'),
(17, 'INV2005120001', NULL, 20000, 0, 20000, 90000, 70000, 'e', '2020-05-12', 1, '2020-05-12 20:03:46'),
(18, 'INV2005120001', NULL, 40000, 0, 40000, 9000, -31000, '', '2020-05-12', 1, '2020-05-12 20:04:19'),
(19, 'INV2005140001', NULL, 20000, 900, 19100, 29999, 10899, 'lunas', '2020-05-14', 1, '2020-05-14 21:20:34');

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_sale_detail`
--

CREATE TABLE `t_sale_detail` (
  `detail_id` int(11) NOT NULL,
  `sale_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `discount_item` int(11) NOT NULL,
  `total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `t_sale_detail`
--

INSERT INTO `t_sale_detail` (`detail_id`, `sale_id`, `item_id`, `price`, `qty`, `discount_item`, `total`) VALUES
(5, 9, 7, 20000, 1, 0, 20000),
(6, 10, 7, 20000, 1, 0, 20000),
(7, 11, 7, 20000, 1, 0, 20000),
(8, 12, 7, 20000, 1, 0, 20000),
(9, 13, 7, 20000, 1, 0, 20000),
(10, 13, 8, 20000, 1, 0, 20000),
(11, 14, 7, 20000, 1, 0, 20000),
(12, 17, 7, 20000, 1, 0, 20000),
(13, 18, 7, 20000, 1, 0, 20000),
(14, 18, 8, 20000, 1, 0, 20000),
(15, 19, 7, 20000, 1, 0, 20000);

--
-- Trigger `t_sale_detail`
--
DELIMITER $$
CREATE TRIGGER `stock_min` AFTER INSERT ON `t_sale_detail` FOR EACH ROW BEGIN
	UPDATE p_item SET stock = stock - NEW.qty
    WHERE item_id = NEW.item_id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_stock`
--

CREATE TABLE `t_stock` (
  `stock_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `type` enum('in','out') NOT NULL,
  `detail` varchar(200) NOT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `qty` int(12) NOT NULL,
  `date` date NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `t_stock`
--

INSERT INTO `t_stock` (`stock_id`, `item_id`, `type`, `detail`, `supplier_id`, `qty`, `date`, `created`, `user_id`) VALUES
(1, 7, 'in', 'Kulakan', 1, 3, '2020-05-10', '2020-05-11 00:19:40', 1),
(2, 8, 'in', 'Kulakan', 3, 20, '2020-05-11', '2020-05-11 14:15:04', 1),
(3, 7, 'in', 'Kulakan', 1, 30, '2020-05-11', '2020-05-12 02:33:03', 1),
(4, 9, 'in', 'Kulakan', 4, 20, '2020-05-12', '2020-05-12 20:57:04', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `username` varchar(40) NOT NULL,
  `password` varchar(40) NOT NULL,
  `name` varchar(200) NOT NULL,
  `address` varchar(90) DEFAULT NULL,
  `level` int(1) NOT NULL COMMENT '1:admin,2:kasir'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`user_id`, `username`, `password`, `name`, `address`, `level`) VALUES
(1, 'admin', 'd033e22ae348aeb5660fc2140aec35850c4da997', 'Feyto Frizky Dewangga', 'Jepara', 1),
(2, 'kasir', '8691e4fc53b99da544ce86e22acba62d13352eff', 'Akbar', 'Jepara', 2),
(3, 'Yollanda2', '5315ce56af8822c9759eefcc2145bf265f1df0df', 'Admin', 'Bumiharjos', 1);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indeks untuk tabel `p_category`
--
ALTER TABLE `p_category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indeks untuk tabel `p_item`
--
ALTER TABLE `p_item`
  ADD PRIMARY KEY (`item_id`),
  ADD UNIQUE KEY `barcode` (`barcode`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `unit_id` (`unit_id`);

--
-- Indeks untuk tabel `p_unit`
--
ALTER TABLE `p_unit`
  ADD PRIMARY KEY (`unit_id`);

--
-- Indeks untuk tabel `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`supplier_id`);

--
-- Indeks untuk tabel `t_cart`
--
ALTER TABLE `t_cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `t_sale`
--
ALTER TABLE `t_sale`
  ADD PRIMARY KEY (`sale_id`);

--
-- Indeks untuk tabel `t_sale_detail`
--
ALTER TABLE `t_sale_detail`
  ADD PRIMARY KEY (`detail_id`),
  ADD KEY `item_id` (`item_id`);

--
-- Indeks untuk tabel `t_stock`
--
ALTER TABLE `t_stock`
  ADD PRIMARY KEY (`stock_id`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `supplier_id` (`supplier_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `p_category`
--
ALTER TABLE `p_category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `p_item`
--
ALTER TABLE `p_item`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `p_unit`
--
ALTER TABLE `p_unit`
  MODIFY `unit_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `supplier`
--
ALTER TABLE `supplier`
  MODIFY `supplier_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `t_sale`
--
ALTER TABLE `t_sale`
  MODIFY `sale_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT untuk tabel `t_sale_detail`
--
ALTER TABLE `t_sale_detail`
  MODIFY `detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `t_stock`
--
ALTER TABLE `t_stock`
  MODIFY `stock_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `p_item`
--
ALTER TABLE `p_item`
  ADD CONSTRAINT `p_item_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `p_category` (`category_id`),
  ADD CONSTRAINT `p_item_ibfk_2` FOREIGN KEY (`unit_id`) REFERENCES `p_unit` (`unit_id`);

--
-- Ketidakleluasaan untuk tabel `t_cart`
--
ALTER TABLE `t_cart`
  ADD CONSTRAINT `t_cart_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `p_item` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `t_cart_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `t_sale_detail`
--
ALTER TABLE `t_sale_detail`
  ADD CONSTRAINT `t_sale_detail_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `p_item` (`item_id`);

--
-- Ketidakleluasaan untuk tabel `t_stock`
--
ALTER TABLE `t_stock`
  ADD CONSTRAINT `t_stock_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `p_item` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `t_stock_ibfk_2` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`supplier_id`),
  ADD CONSTRAINT `t_stock_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
