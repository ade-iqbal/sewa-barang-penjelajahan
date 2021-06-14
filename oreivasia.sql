-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 14, 2021 at 11:29 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `oreivasia`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `kode_barang` int(11) NOT NULL,
  `nama_barang` varchar(30) NOT NULL,
  `harga` int(7) NOT NULL,
  `stock` int(2) NOT NULL,
  `keterangan` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`kode_barang`, `nama_barang`, `harga`, `stock`, `keterangan`) VALUES
(26, 'Tenda Rei', 80000, 42, 'Isi 5'),
(27, 'Tenda Eiger', 90000, 43, 'Isi 5'),
(74, 'Tenda Rei', 120000, 31, 'Isi 10'),
(75, 'Nesting', 35000, 35, NULL),
(94, 'Matras', 20000, 20, 'Tenda isi 2'),
(95, 'Matras', 35000, 27, 'Tenda isi 5'),
(100, 'Handlamp', 5000, 32, 'Led');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `nik` varchar(19) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `no_hp` varchar(12) NOT NULL,
  `alamat` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`nik`, `nama`, `no_hp`, `alamat`) VALUES
('1231231231231231', 'Dodi Santoso', '123123123123', 'Taruko 3, Kalumbuk'),
('1231231242341231', 'Hafzhan Wisli', '081232132131', 'Simpang akhirat'),
('1232131231231231', 'Ridwan Hasibuan', '081128217732', 'Manggis Raya 7, Belimbing'),
('1942991721021921', 'Afdal Halim', '082131231231', 'Jln. kebun jeruk'),
('1942991721021922', 'Budi Purnama', '081128217732', 'Jalan Tunas Mangga, Mangga 8, Belimbing'),
('1942991721021923', 'Ade Iqbal', '081122109277', 'Jln. Manggis no. 3'),
('2131232131231231', 'Ikhlas Maulana', '081231231231', 'Jln. Apel no. 3'),
('2342342321212344', 'Surya Purnama', '083123123123', 'Jln. manggis no. 15');

-- --------------------------------------------------------

--
-- Table structure for table `detail_pinjam`
--

CREATE TABLE `detail_pinjam` (
  `id_pinjam` int(11) NOT NULL,
  `kode_barang` int(11) NOT NULL,
  `qty` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detail_pinjam`
--

INSERT INTO `detail_pinjam` (`id_pinjam`, `kode_barang`, `qty`) VALUES
(1, 26, 2),
(1, 27, 1),
(10, 75, 2),
(10, 94, 2),
(15, 94, 3),
(15, 100, 3),
(19, 94, 2),
(19, 100, 2);

-- --------------------------------------------------------

--
-- Table structure for table `kembali`
--

CREATE TABLE `kembali` (
  `id_pinjam` int(11) NOT NULL,
  `tanggal_kembali` date NOT NULL,
  `denda` int(7) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kembali`
--

INSERT INTO `kembali` (`id_pinjam`, `tanggal_kembali`, `denda`) VALUES
(1, '2021-06-13', 90000),
(10, '2021-06-11', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pinjam`
--

CREATE TABLE `pinjam` (
  `id_pinjam` int(11) NOT NULL,
  `nik` varchar(19) NOT NULL,
  `tanggal_pinjam` date NOT NULL,
  `durasi` int(2) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pinjam`
--

INSERT INTO `pinjam` (`id_pinjam`, `nik`, `tanggal_pinjam`, `durasi`, `status`) VALUES
(1, '1232131231231231', '2021-06-08', 3, 3),
(10, '1942991721021923', '2021-06-09', 3, 2),
(15, '1231231242341231', '2021-06-15', 3, 0),
(19, '1942991721021921', '2021-06-12', 3, 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`kode_barang`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`nik`);

--
-- Indexes for table `detail_pinjam`
--
ALTER TABLE `detail_pinjam`
  ADD PRIMARY KEY (`id_pinjam`,`kode_barang`) USING BTREE,
  ADD KEY `ibfk_barang_1` (`kode_barang`);

--
-- Indexes for table `kembali`
--
ALTER TABLE `kembali`
  ADD PRIMARY KEY (`id_pinjam`);

--
-- Indexes for table `pinjam`
--
ALTER TABLE `pinjam`
  ADD PRIMARY KEY (`id_pinjam`),
  ADD KEY `ibfk_customer_1` (`nik`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barang`
--
ALTER TABLE `barang`
  MODIFY `kode_barang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;

--
-- AUTO_INCREMENT for table `kembali`
--
ALTER TABLE `kembali`
  MODIFY `id_pinjam` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `pinjam`
--
ALTER TABLE `pinjam`
  MODIFY `id_pinjam` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detail_pinjam`
--
ALTER TABLE `detail_pinjam`
  ADD CONSTRAINT `ibfk_barang_1` FOREIGN KEY (`kode_barang`) REFERENCES `barang` (`kode_barang`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ibfk_pinjam_2` FOREIGN KEY (`id_pinjam`) REFERENCES `pinjam` (`id_pinjam`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `kembali`
--
ALTER TABLE `kembali`
  ADD CONSTRAINT `ibfk_pinjam_1` FOREIGN KEY (`id_pinjam`) REFERENCES `pinjam` (`id_pinjam`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pinjam`
--
ALTER TABLE `pinjam`
  ADD CONSTRAINT `ibfk_customer_1` FOREIGN KEY (`nik`) REFERENCES `customer` (`nik`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;