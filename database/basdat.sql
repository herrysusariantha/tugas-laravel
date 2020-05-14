-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 14, 2020 at 02:20 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `basdat`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `DataBarang` ()  NO SQL
BEGIN
	SELECT detail_penjualan.penjualan_id ,kode, nama, keterangan, stock, harga FROM barang
    INNER JOIN detail_penjualan ON barang.id=detail_penjualan.barang_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `DataPenjualan` (IN `detail` VARCHAR(255))  NO SQL
BEGIN 
	SELECT barang.kode, barang.nama, penjualan.tanggal, barang.harga, jumlah, subtotal FROM detail_penjualan
    INNER JOIN barang ON barang.id=detail_penjualan.barang.id
    INNER JOIN penjualan ON penjualan.id=detail_penjualan.penjualan_id
    WHERE id=detail; 
END$$

--
-- Functions
--
CREATE DEFINER=`root`@`localhost` FUNCTION `hitungStokBarang` (`barang` VARCHAR(30)) RETURNS INT(11) NO SQL
BEGIN
          DECLARE jumlah_masuk INT;
          SELECT COUNT(*) INTO jumlah_masuk FROM barang
          WHERE id=barang;
          RETURN jumlah_masuk;
      END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id` int(10) UNSIGNED NOT NULL,
  `kode` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keterangan` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `stock` int(11) NOT NULL,
  `harga` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id`, `kode`, `nama`, `keterangan`, `stock`, `harga`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '0001', 'CPU Intel', 'Intel Core i12', 20, 20000000, '2019-06-08 22:53:28', '2020-05-02 02:49:46', NULL),
(2, '0002', 'VGA Nvidia', 'Nvidia RTX 2019ti', 19, 21000000, '2019-06-08 22:55:36', '2020-05-02 02:56:52', NULL),
(3, '0003', 'Lampu Reting', 'keadaan bagus', 14, 5000, '2019-06-10 21:07:56', '2019-06-12 06:01:59', '2019-06-12 06:01:59'),
(4, '0004', 'RAM Gskill', 'size 32Gb Kit', 13, 4500000, '2019-06-12 05:49:32', '2020-05-02 02:56:52', NULL),
(5, '0003', 'Power Supply Power Color 800 watt', 'power suplay dengan max 800 watt', -70, 800000, '2020-05-02 03:14:36', '2020-05-02 04:19:35', NULL),
(6, '0005', '1 Set PC Build Up Asus', 'CPU : intel celeron\r\nRAM : 4GB\r\nStorage : SSD 256GB, HDD 1TB\r\nGraphic Card : Nvidia GT 200 1GB\r\nMonitor : Asus 22 Inch', 20, 12000000, '2020-05-02 03:44:11', '2020-05-02 03:44:11', NULL),
(7, '0006', 'Monitor', 'LG 24 inch', 29, 2000000, '2020-05-02 03:51:03', '2020-05-02 03:51:03', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `detail_pembelian_tables`
--

CREATE TABLE `detail_pembelian_tables` (
  `id` int(10) UNSIGNED NOT NULL,
  `detailpem_id` int(10) UNSIGNED NOT NULL,
  `barang_id` int(10) UNSIGNED NOT NULL,
  `jumlah` int(11) NOT NULL,
  `subtotal` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `detail_penjualan`
--

CREATE TABLE `detail_penjualan` (
  `id` int(10) UNSIGNED NOT NULL,
  `penjualan_id` int(10) UNSIGNED NOT NULL,
  `barang_id` int(10) UNSIGNED NOT NULL,
  `jumlah` int(11) NOT NULL,
  `subtotal` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `detail_penjualan`
--

INSERT INTO `detail_penjualan` (`id`, `penjualan_id`, `barang_id`, `jumlah`, `subtotal`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, 2, 100000, '2019-06-08 22:56:21', '2019-06-08 22:56:21', NULL),
(2, 1, 2, 2, 50000, '2019-06-08 22:56:21', '2019-06-08 22:56:21', NULL),
(3, 2, 3, 1, 5000, '2019-06-10 21:08:58', '2019-06-10 21:08:58', NULL),
(4, 2, 2, 2, 50000, '2019-06-10 21:08:58', '2019-06-10 21:08:58', NULL),
(5, 3, 4, 2, 9000000, '2020-05-02 02:56:52', '2020-05-02 02:56:52', NULL),
(6, 3, 2, 2, 42000000, '2020-05-02 02:56:52', '2020-05-02 02:56:52', NULL),
(7, 4, 5, 90, 72000000, '2020-05-02 04:19:35', '2020-05-02 04:19:35', NULL);

--
-- Triggers `detail_penjualan`
--
DELIMITER $$
CREATE TRIGGER `update_stok_after` AFTER UPDATE ON `detail_penjualan` FOR EACH ROW UPDATE barang set barang.stock = barang.stock - new.jumlah WHERE barang.id = old.id
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_stok_before` BEFORE UPDATE ON `detail_penjualan` FOR EACH ROW UPDATE barang SET barang.stock = barang.stock + old.jumlah WHERE barang.id = new.id
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2018_05_11_022029_create_barangs_table', 1),
(4, '2018_05_15_204806_create_pelanggans_table', 1),
(5, '2018_05_15_205603_create_pegawais_table', 1),
(6, '2018_05_16_034803_create_penjualans_table', 1),
(7, '2018_05_22_211430_create_create_detail_penjualan_tabels_table', 1),
(8, '2018_05_30_024348_add_soft_delete_users', 1),
(9, '2018_05_30_034227_add_user_level', 1),
(10, '2019_06_09_000741_create_pembelians_table', 1),
(11, '2019_06_09_001030_create_detail_pembelian_tables_table', 1),
(12, '2019_06_09_001112_create_pemasoks_table', 1),
(13, '2019_06_09_001209_create_returs_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pegawai`
--

CREATE TABLE `pegawai` (
  `id` int(10) UNSIGNED NOT NULL,
  `nik` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tempat_lahir` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `alamat` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telp` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foto` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pegawai`
--

INSERT INTO `pegawai` (`id`, `nik`, `nama`, `tempat_lahir`, `tanggal_lahir`, `alamat`, `email`, `telp`, `foto`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '121223243434', 'ferdo kaban', 'denpasar', '1998-02-04', 'jln.gatot subroto', 'ferdo123@gmail.com', '08786000202', '1560063293.jpg', '2019-06-08 22:54:53', '2019-06-08 22:54:53', NULL),
(2, '121223243434', 'wira', 'Gianyar', '1999-06-02', 'jln.kerasinan', 'wirakeren@gmail.com', '081805987654', '1560349389.jpg', '2019-06-12 06:23:09', '2019-06-12 06:23:09', NULL),
(3, '34345454654', 'aris', 'denpasar', '2019-06-04', 'fghgffgfhgfd', 'aris@gmail.com', '081805987654', '1560349566.jpg', '2019-06-12 06:26:06', '2019-06-12 06:26:06', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `telp` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`id`, `nama`, `alamat`, `telp`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Joni', 'jln.merpati', '081807267252', '2019-06-08 22:53:50', '2020-05-02 02:48:45', NULL),
(2, 'edo', 'jln.balukraya', '08786000202', '2019-06-10 21:08:24', '2019-06-10 21:08:24', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pemasok`
--

CREATE TABLE `pemasok` (
  `id` int(10) UNSIGNED NOT NULL,
  `kode_pemasok` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_pemasok` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `telp` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pembelian`
--

CREATE TABLE `pembelian` (
  `id` int(10) UNSIGNED NOT NULL,
  `pemasok_id` int(10) UNSIGNED NOT NULL,
  `tanggal_pembelian` date NOT NULL,
  `total` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `penjualan`
--

CREATE TABLE `penjualan` (
  `id` int(10) UNSIGNED NOT NULL,
  `tanggal` date NOT NULL,
  `pelanggan_id` int(10) UNSIGNED NOT NULL,
  `pegawai_id` int(10) UNSIGNED NOT NULL,
  `total` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `penjualan`
--

INSERT INTO `penjualan` (`id`, `tanggal`, `pelanggan_id`, `pegawai_id`, `total`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '2019-06-04', 1, 1, 150000, '2019-06-08 22:56:21', '2019-06-08 22:56:21', NULL),
(2, '2019-05-09', 2, 1, 55000, '2019-06-10 21:08:58', '2019-06-10 21:08:58', NULL),
(3, '2020-05-02', 2, 2, 51000000, '2020-05-02 02:56:52', '2020-05-02 02:56:52', NULL),
(4, '2020-05-02', 2, 1, 72000000, '2020-05-02 04:19:35', '2020-05-02 04:19:35', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `retur`
--

CREATE TABLE `retur` (
  `id` int(10) UNSIGNED NOT NULL,
  `barang_id` int(10) UNSIGNED NOT NULL,
  `pemasok_id` int(10) UNSIGNED NOT NULL,
  `tanggal_pembelian` date NOT NULL,
  `total` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `level` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`, `deleted_at`, `level`) VALUES
(1, 'edo kampret', 'edokaban1@gmail.com', '$2y$10$FWWg7UuaZ5RK9LYEU3d6g.Y/x8l9EiRHQNcIWkF69Ckn7NvELbxnK', 'PtRqiwDLJ4rmHFUWKfjB9p7PvWKBcsJ9W3FYlYXTlWC5SjwICVoz58iiIqEO', '2019-06-08 18:02:05', '2019-06-08 18:02:38', '2019-06-08 18:02:38', 0),
(2, 'Ferdo Liana Kaban', 'ferdokaban123@gmail.com', '$2y$10$FShZuFqvwsAs37esp96LDeOkSuZJXqJrbDsdfCWALF3Rf408BuKfe', 'lBMrYnKEqxdy8vJ9yLZO6fli1FtDxPy859NrcD4xctL1Vc2zy1ok9DkImY1e', '2019-06-08 18:02:31', '2019-06-08 18:02:31', NULL, 1),
(3, 'Edo Kaban', 'edokaban123@gmail.com', '$2y$10$AMEvxPFCORmGJ9LdVR3bDuzDCKSnBO35in/5eMbUiRyUA25.0ircu', NULL, '2019-06-08 18:02:56', '2019-06-08 18:04:07', '2019-06-08 18:04:07', 2),
(4, 'ferdo', 'ferdorayderz123@gmail.com', '$2y$10$mVsIzl2213Ca/5PosYlQGOEU45Uok9xEaCnuPMdFgxpdvraFPm5w2', 'pc8BTGw4VPIa640iNRiq9gujNR2cXEn4LB8ELYgODPpeBaS93SvL9cmXR0BK', '2019-06-11 20:31:43', '2019-06-11 20:31:43', NULL, 0),
(5, 'admin kecil', 'adminkecil@local.com', '$2y$10$1g8XvXtwXaAjamzttvfBxOtN8v6m8QXhHFmA4EPi4iYtrHlfNNFCS', 'dtbQG6HHYw9xoLIM9cbi10ZHQ3njNCbaPv9onph6kxhsCgCBMzvMtdAicFeJ', '2020-05-02 02:46:59', '2020-05-02 02:46:59', NULL, 0),
(6, 'admin', 'admin@local.com', '$2y$10$LOzzDQbLDexk6N4cjpCYIeR7.iWef3XOHeBwLXnv60sK3sYraC3nK', 'gezs8jWJrcAiGaUFDo6vnXrNitk4FslVzyfLGgqp4S6XLYytRU6RRq6XeIu4', '2020-05-02 02:47:45', '2020-05-02 02:47:45', NULL, 1),
(7, 'admin', 'admin@local.id', '$2y$10$Yv5HBiIiL32nNM9qpacw2uIzhhtOhSgQTekriru8XwECA7gVAC..i', NULL, '2020-05-14 03:24:08', '2020-05-14 03:24:08', NULL, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `detail_pembelian_tables`
--
ALTER TABLE `detail_pembelian_tables`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `detailpem_id_2` (`detailpem_id`),
  ADD KEY `detailpem_id` (`detailpem_id`),
  ADD KEY `barang_id` (`barang_id`);

--
-- Indexes for table `detail_penjualan`
--
ALTER TABLE `detail_penjualan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `detail_penjualan_penjualan_id_foreign` (`penjualan_id`),
  ADD KEY `detail_penjualan_barang_id_foreign` (`barang_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pemasok`
--
ALTER TABLE `pemasok`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pemasok_id` (`pemasok_id`);

--
-- Indexes for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `penjualan_pelanggan_id_foreign` (`pelanggan_id`),
  ADD KEY `penjualan_pegawai_id_foreign` (`pegawai_id`);

--
-- Indexes for table `retur`
--
ALTER TABLE `retur`
  ADD PRIMARY KEY (`id`),
  ADD KEY `barang_id` (`barang_id`),
  ADD KEY `pemasok_id` (`pemasok_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barang`
--
ALTER TABLE `barang`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `detail_pembelian_tables`
--
ALTER TABLE `detail_pembelian_tables`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `detail_penjualan`
--
ALTER TABLE `detail_penjualan`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `pegawai`
--
ALTER TABLE `pegawai`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pemasok`
--
ALTER TABLE `pemasok`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pembelian`
--
ALTER TABLE `pembelian`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `penjualan`
--
ALTER TABLE `penjualan`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `retur`
--
ALTER TABLE `retur`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detail_pembelian_tables`
--
ALTER TABLE `detail_pembelian_tables`
  ADD CONSTRAINT `detail_pembelian_tables_ibfk_1` FOREIGN KEY (`barang_id`) REFERENCES `barang` (`id`),
  ADD CONSTRAINT `detail_pembelian_tables_ibfk_2` FOREIGN KEY (`id`) REFERENCES `pembelian` (`id`);

--
-- Constraints for table `detail_penjualan`
--
ALTER TABLE `detail_penjualan`
  ADD CONSTRAINT `detail_penjualan_barang_id_foreign` FOREIGN KEY (`barang_id`) REFERENCES `barang` (`id`),
  ADD CONSTRAINT `detail_penjualan_penjualan_id_foreign` FOREIGN KEY (`penjualan_id`) REFERENCES `penjualan` (`id`);

--
-- Constraints for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD CONSTRAINT `pembelian_ibfk_1` FOREIGN KEY (`pemasok_id`) REFERENCES `pemasok` (`id`);

--
-- Constraints for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD CONSTRAINT `penjualan_pegawai_id_foreign` FOREIGN KEY (`pegawai_id`) REFERENCES `pegawai` (`id`),
  ADD CONSTRAINT `penjualan_pelanggan_id_foreign` FOREIGN KEY (`pelanggan_id`) REFERENCES `pelanggan` (`id`);

--
-- Constraints for table `retur`
--
ALTER TABLE `retur`
  ADD CONSTRAINT `retur_ibfk_1` FOREIGN KEY (`barang_id`) REFERENCES `barang` (`id`),
  ADD CONSTRAINT `retur_ibfk_2` FOREIGN KEY (`pemasok_id`) REFERENCES `pemasok` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
