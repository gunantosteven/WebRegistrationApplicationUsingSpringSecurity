-- phpMyAdmin SQL Dump
-- version 2.9.2
-- http://www.phpmyadmin.net
-- 
-- Host: localhost
-- Generation Time: Oct 10, 2014 at 10:46 AM
-- Server version: 5.0.27
-- PHP Version: 5.2.1
-- 
-- Database: `uwika`
-- 

-- --------------------------------------------------------

-- 
-- Table structure for table `dosen`
-- 

CREATE TABLE `dosen` (
  `nik` varchar(20) NOT NULL,
  `nama` varchar(255) default NULL,
  `alamat` varchar(255) default NULL,
  PRIMARY KEY  (`nik`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `dosen`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `kuliah`
-- 

CREATE TABLE `kuliah` (
  `id` int(11) NOT NULL,
  `namamatakuliah` varchar(20) NOT NULL,
  `nik` varchar(20) NOT NULL,
  `nim` varchar(20) NOT NULL,
  PRIMARY KEY  (`id`,`namamatakuliah`,`nik`,`nim`),
  KEY `FKBD39F6CE3AB507E1` (`nik`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `kuliah`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `mahasiswa`
-- 

CREATE TABLE `mahasiswa` (
  `noPendaftaran` varchar(20) NOT NULL,
  `jurusan` varchar(50) default NULL,
  `nama` varchar(255) default NULL,
  `jenisKelamin` varchar(20) default NULL,
  `tempatLahir` varchar(50) default NULL,
  `agama` varchar(20) default NULL,
  `alamat` varchar(255) default NULL,
  `noTelpon` varchar(30) default NULL,
  `email` varchar(30) default NULL,
  `tanggalLahir` date default NULL,
  `uuid` varchar(255) default NULL,
  `status` varchar(30) default NULL,
  PRIMARY KEY  (`noPendaftaran`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `mahasiswa`
-- 

INSERT INTO `mahasiswa` (`noPendaftaran`, `jurusan`, `nama`, `jenisKelamin`, `tempatLahir`, `agama`, `alamat`, `noTelpon`, `email`, `tanggalLahir`, `uuid`, `status`) VALUES 
('20141', 'informatika', 'Steven Gunanto', 'l', 'Surabaya', 'katolik', 'kalijudan', '083854968000', 'gunantosteven@gmail.com', '2014-10-19', NULL, 'SUDAH BAYAR'),
('20142', 'informatika', 'Steven Gunanto', 'l', 'Surabaya', 'kristen', 'kalijudan', '083854968000', 'gunantosteven@gmail.com', '2014-10-19', NULL, 'SUDAH BAYAR'),
('20143', 'informatika', 'Steven Gunanto', 'l', 'Surabaya', 'kristen', 'kalijudan', '083854968000', 'gunantosteven@gmail.com', '2014-10-19', '39535b6c-048d-4e06-ba7b-af53b9e55380', 'BELUM BAYAR');

-- --------------------------------------------------------

-- 
-- Table structure for table `rekening`
-- 

CREATE TABLE `rekening` (
  `noPendaftaran` varchar(20) NOT NULL,
  `noRekening` varchar(50) default NULL,
  `namaRekening` varchar(255) default NULL,
  `nominal` int(11) default NULL,
  PRIMARY KEY  (`noPendaftaran`),
  KEY `FKDD74C5016FA9493B` (`noPendaftaran`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `rekening`
-- 

INSERT INTO `rekening` (`noPendaftaran`, `noRekening`, `namaRekening`, `nominal`) VALUES 
('20143', 'asdf', 'asdf', 1);

-- --------------------------------------------------------

-- 
-- Table structure for table `user_roles`
-- 

CREATE TABLE `user_roles` (
  `user_role_id` int(11) NOT NULL auto_increment,
  `username` varchar(45) NOT NULL,
  `role` varchar(45) NOT NULL,
  PRIMARY KEY  (`user_role_id`),
  KEY `FK7342994986BB3AC1` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

-- 
-- Dumping data for table `user_roles`
-- 

INSERT INTO `user_roles` (`user_role_id`, `username`, `role`) VALUES 
(1, 'gunsoft', 'ROLE_ADMIN');

-- --------------------------------------------------------

-- 
-- Table structure for table `users`
-- 

CREATE TABLE `users` (
  `username` varchar(45) NOT NULL,
  `password` varchar(60) NOT NULL,
  `enabled` bit(1) NOT NULL,
  PRIMARY KEY  (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `users`
-- 

INSERT INTO `users` (`username`, `password`, `enabled`) VALUES 
('gunsoft', 'gunsoft', '');

-- 
-- Constraints for dumped tables
-- 

-- 
-- Constraints for table `kuliah`
-- 
ALTER TABLE `kuliah`
  ADD CONSTRAINT `FKBD39F6CE3AB507E1` FOREIGN KEY (`nik`) REFERENCES `dosen` (`nik`);

-- 
-- Constraints for table `rekening`
-- 
ALTER TABLE `rekening`
  ADD CONSTRAINT `FKDD74C5016FA9493B` FOREIGN KEY (`noPendaftaran`) REFERENCES `mahasiswa` (`noPendaftaran`);

-- 
-- Constraints for table `user_roles`
-- 
ALTER TABLE `user_roles`
  ADD CONSTRAINT `FK7342994986BB3AC1` FOREIGN KEY (`username`) REFERENCES `users` (`username`);
