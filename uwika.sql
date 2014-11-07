-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 07, 2014 at 11:53 
-- Server version: 5.5.36
-- PHP Version: 5.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `uwika`
--

-- --------------------------------------------------------

--
-- Table structure for table `dosen`
--

CREATE TABLE IF NOT EXISTS `dosen` (
  `nik` varchar(20) NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`nik`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dosen`
--

INSERT INTO `dosen` (`nik`, `nama`, `alamat`) VALUES
('1', 'andreas jp', 'siwalan kerto 5 no 35 ');

-- --------------------------------------------------------

--
-- Table structure for table `kuliah`
--

CREATE TABLE IF NOT EXISTS `kuliah` (
  `id` int(11) NOT NULL,
  `namamatakuliah` varchar(20) NOT NULL,
  `nik` varchar(20) NOT NULL,
  `nim` varchar(20) NOT NULL,
  PRIMARY KEY (`id`,`namamatakuliah`,`nik`,`nim`),
  KEY `FK_bpxkkcpkxko5ao8q1k2i5blyj` (`nik`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kuliah`
--

INSERT INTO `kuliah` (`id`, `namamatakuliah`, `nik`, `nim`) VALUES
(1, 'agama', '1', '20141');

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE IF NOT EXISTS `mahasiswa` (
  `noPendaftaran` varchar(20) NOT NULL,
  `jurusan` varchar(50) DEFAULT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `jenisKelamin` varchar(20) DEFAULT NULL,
  `tempatLahir` varchar(50) DEFAULT NULL,
  `agama` varchar(20) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `noTelpon` varchar(30) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `tanggalLahir` date DEFAULT NULL,
  `uuid` varchar(255) DEFAULT NULL,
  `status` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`noPendaftaran`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`noPendaftaran`, `jurusan`, `nama`, `jenisKelamin`, `tempatLahir`, `agama`, `alamat`, `noTelpon`, `email`, `tanggalLahir`, `uuid`, `status`) VALUES
('20141', 'informatika', 'Steven Gunanto', 'l', 'surabaya', 'kristen', 'kalijudan', '0838', 'gunantosteven@gmail.com', '2014-11-19', '291d38ce-c977-44ce-a48b-586932e113d6', 'BELUM BAYAR');

-- --------------------------------------------------------

--
-- Table structure for table `rekening`
--

CREATE TABLE IF NOT EXISTS `rekening` (
  `noPendaftaran` varchar(20) NOT NULL,
  `noRekening` varchar(50) DEFAULT NULL,
  `namaRekening` varchar(255) DEFAULT NULL,
  `nominal` int(11) DEFAULT NULL,
  PRIMARY KEY (`noPendaftaran`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `username` varchar(45) NOT NULL,
  `password` varchar(60) NOT NULL,
  `enabled` bit(1) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`username`, `password`, `enabled`) VALUES
('gunsoft', 'gunsoft', b'1');

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE IF NOT EXISTS `user_roles` (
  `user_role_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `role` varchar(45) NOT NULL,
  PRIMARY KEY (`user_role_id`),
  KEY `FK_9ry105icat2dux14oyixybw9l` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `user_roles`
--

INSERT INTO `user_roles` (`user_role_id`, `username`, `role`) VALUES
(1, 'gunsoft', 'ROLE_ADMIN');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `kuliah`
--
ALTER TABLE `kuliah`
  ADD CONSTRAINT `FK_bpxkkcpkxko5ao8q1k2i5blyj` FOREIGN KEY (`nik`) REFERENCES `dosen` (`nik`);

--
-- Constraints for table `rekening`
--
ALTER TABLE `rekening`
  ADD CONSTRAINT `FK_57e6gm7th4rlxv5iya8qh3kwh` FOREIGN KEY (`noPendaftaran`) REFERENCES `mahasiswa` (`noPendaftaran`);

--
-- Constraints for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `FK_9ry105icat2dux14oyixybw9l` FOREIGN KEY (`username`) REFERENCES `users` (`username`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
