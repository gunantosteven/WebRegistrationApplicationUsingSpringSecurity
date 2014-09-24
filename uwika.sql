-- phpMyAdmin SQL Dump
-- version 2.9.2
-- http://www.phpmyadmin.net
-- 
-- Host: localhost
-- Generation Time: Sep 24, 2014 at 02:37 PM
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

INSERT INTO `dosen` (`nik`, `nama`, `alamat`) VALUES 
('1', '1', ' a 1');

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
  KEY `FKBD39F6CE3AB507E1` (`nik`),
  KEY `FKBD39F6CEF172AEC` (`nim`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `kuliah`
-- 

INSERT INTO `kuliah` (`id`, `namamatakuliah`, `nik`, `nim`) VALUES 
(1, 'Mandarin', '1', '20141'),
(2, 'Mandarin', '1', '20142');

-- --------------------------------------------------------

-- 
-- Table structure for table `mahasiswa`
-- 

CREATE TABLE `mahasiswa` (
  `noPendaftaran` varchar(20) NOT NULL,
  `jurusan` varchar(50) default NULL,
  `nama` varchar(255) default NULL,
  `jenisKelamin` varchar(20) default NULL,
  `agama` varchar(20) default NULL,
  `alamat` varchar(255) default NULL,
  `noTelpon` varchar(30) default NULL,
  `email` varchar(30) default NULL,
  `tanggalLahir` date default NULL,
  `tempatLahir` varchar(50) default NULL,
  PRIMARY KEY  (`noPendaftaran`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `mahasiswa`
-- 

INSERT INTO `mahasiswa` (`noPendaftaran`, `jurusan`, `nama`, `jenisKelamin`, `agama`, `alamat`, `noTelpon`, `email`, `tanggalLahir`, `tempatLahir`) VALUES 
('20141', 'informatika', 'Steven Gunanto', 'l', 'kristen', 'kalijudan', '083854968000', 'stevengunanto@yahoo.com', '1994-10-19', 'Surabaya'),
('20142', 'akuntasi', 'Siska', 'p', 'kristen', 'kalijudan', 's', 'stevengunanto@yahoo.com', '2016-12-22', 'Surabaya');

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

-- 
-- Dumping data for table `user_roles`
-- 

INSERT INTO `user_roles` (`user_role_id`, `username`, `role`) VALUES 
(1, 'steven', 'ROLE_ADMIN'),
(2, 'user', 'ROLE_USER');

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
('steven', 'steven', ''),
('user', 'user', '');

-- 
-- Constraints for dumped tables
-- 

-- 
-- Constraints for table `kuliah`
-- 
ALTER TABLE `kuliah`
  ADD CONSTRAINT `FKBD39F6CE3AB507E1` FOREIGN KEY (`nik`) REFERENCES `dosen` (`nik`),
  ADD CONSTRAINT `FKBD39F6CEF172AEC` FOREIGN KEY (`nim`) REFERENCES `mahasiswa` (`noPendaftaran`);

-- 
-- Constraints for table `user_roles`
-- 
ALTER TABLE `user_roles`
  ADD CONSTRAINT `FK7342994986BB3AC1` FOREIGN KEY (`username`) REFERENCES `users` (`username`);
