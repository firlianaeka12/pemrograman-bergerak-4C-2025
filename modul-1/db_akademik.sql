/*
SQLyog Community v13.3.0 (64 bit)
MySQL - 10.4.32-MariaDB : Database - akademik
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`akademik` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `akademik`;

/*Table structure for table `dosen` */

DROP TABLE IF EXISTS `dosen`;

CREATE TABLE `dosen` (
  `NID` int(11) NOT NULL,
  `Nama` varchar(100) DEFAULT NULL,
  `Jurusan` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`NID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `dosen` */

insert  into `dosen`(`NID`,`Nama`,`Jurusan`) values 
(201,'Dr. Sinta','Teknologi Informasi'),
(202,'Dr. Reta','teknik Informatika'),
(203,'Dr. Neta','Teknik Mesin'),
(204,'Dr. Dodi','Teknik Industri'),
(205,'Dr. Eka','Teknik Elektro'),
(206,'Dr. Fani','Teknik Industri'),
(207,'Dr. Gani','Teknik Informatika'),
(208,'Dr. Hani','Teknologi Informasi'),
(209,'Dr. Ika','Teknik Sipil'),
(210,'Dr. Joni','Sistem Informasi');

/*Table structure for table `jadwal_kuliah` */

DROP TABLE IF EXISTS `jadwal_kuliah`;

CREATE TABLE `jadwal_kuliah` (
  `Id_Jadwal` int(11) NOT NULL AUTO_INCREMENT,
  `Id_MK` varchar(10) DEFAULT NULL,
  `NID` int(11) DEFAULT NULL,
  `Hari` varchar(20) DEFAULT NULL,
  `Jam_mulai` time DEFAULT NULL,
  `Jam_selesai` time DEFAULT NULL,
  PRIMARY KEY (`Id_Jadwal`),
  KEY `Id_MK` (`Id_MK`),
  KEY `NID` (`NID`),
  CONSTRAINT `jadwal_kuliah_ibfk_1` FOREIGN KEY (`Id_MK`) REFERENCES `matakuliah` (`Id_MK`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `jadwal_kuliah_ibfk_2` FOREIGN KEY (`NID`) REFERENCES `dosen` (`NID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `jadwal_kuliah` */

insert  into `jadwal_kuliah`(`Id_Jadwal`,`Id_MK`,`NID`,`Hari`,`Jam_mulai`,`Jam_selesai`) values 
(1,'MK101',201,'Senin','07:00:00','09:00:00'),
(2,'MK102',202,'Selasa','13:00:00','15:00:00'),
(3,'MK103',203,'Rabu','10:00:00','12:00:00'),
(4,'MK104',204,'Kamis','08:00:00','10:00:00'),
(5,'MK105',205,'Jumat','15:00:00','17:00:00'),
(6,'MK106',206,'Selasa','07:00:00','09:00:00'),
(7,'MK107',207,'Rabu','13:00:00','15:00:00'),
(8,'MK108',208,'Senin','10:00:00','12:00:00'),
(9,'MK109',209,'Kamis','14:00:00','16:00:00'),
(10,'MK110',210,'Jumat','08:00:00','10:00:00');

/*Table structure for table `karturencanastudi` */

DROP TABLE IF EXISTS `karturencanastudi`;

CREATE TABLE `karturencanastudi` (
  `Id_KRS` int(11) NOT NULL AUTO_INCREMENT,
  `NIM` int(11) DEFAULT NULL,
  `Id_MK` varchar(10) DEFAULT NULL,
  `Semester` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id_KRS`),
  KEY `NIM` (`NIM`),
  KEY `Id_MK` (`Id_MK`),
  CONSTRAINT `karturencanastudi_ibfk_1` FOREIGN KEY (`NIM`) REFERENCES `mahasiswa` (`NIM`),
  CONSTRAINT `karturencanastudi_ibfk_2` FOREIGN KEY (`Id_MK`) REFERENCES `matakuliah` (`Id_MK`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `karturencanastudi` */

insert  into `karturencanastudi`(`Id_KRS`,`NIM`,`Id_MK`,`Semester`) values 
(1,101,'MK101',3),
(2,102,'MK102',5),
(3,103,'MK103',3),
(4,104,'MK104',7),
(5,105,'MK105',1);

/*Table structure for table `krs` */

DROP TABLE IF EXISTS `krs`;

CREATE TABLE `krs` (
  `Id_KRS` int(11) NOT NULL AUTO_INCREMENT,
  `NIM` int(11) DEFAULT NULL,
  `Id_MK` varchar(10) DEFAULT NULL,
  `Semester` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id_KRS`),
  KEY `NIM` (`NIM`),
  KEY `Id_MK` (`Id_MK`),
  CONSTRAINT `krs_ibfk_1` FOREIGN KEY (`NIM`) REFERENCES `mahasiswa` (`NIM`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `krs_ibfk_2` FOREIGN KEY (`Id_MK`) REFERENCES `matakuliah` (`Id_MK`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `krs` */

/*Table structure for table `mahasiswa` */

DROP TABLE IF EXISTS `mahasiswa`;

CREATE TABLE `mahasiswa` (
  `NIM` int(11) NOT NULL,
  `Nama` varchar(100) DEFAULT NULL,
  `Jurusan` varchar(50) DEFAULT NULL,
  `Semester` int(11) DEFAULT NULL,
  PRIMARY KEY (`NIM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `mahasiswa` */

insert  into `mahasiswa`(`NIM`,`Nama`,`Jurusan`,`Semester`) values 
(101,'Siska','Teknologi Informasi',5),
(102,'Rea','Teknik Informatika',7),
(103,'Nando','Teknik Mesin',1),
(104,'Darma','Teknik Industri',5),
(105,'Ela','Teknik Elektro',1),
(106,'Fara','Teknik Industri',3),
(107,'Ghina','Teknik Informatika',3),
(108,'Haris','Teknologi Informasi',7),
(109,'Intan','Teknik Sipil',5),
(110,'Joko','Sistem Informasi',1);

/*Table structure for table `matakuliah` */

DROP TABLE IF EXISTS `matakuliah`;

CREATE TABLE `matakuliah` (
  `Id_MK` varchar(10) NOT NULL,
  `Nama_Matakuliah` varchar(100) DEFAULT NULL,
  `SKS` int(11) DEFAULT NULL,
  `NID` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id_MK`),
  KEY `NID` (`NID`),
  CONSTRAINT `matakuliah_ibfk_1` FOREIGN KEY (`NID`) REFERENCES `dosen` (`NID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `matakuliah` */

insert  into `matakuliah`(`Id_MK`,`Nama_Matakuliah`,`SKS`,`NID`) values 
('MK101','Algoritma dan Pemrograman',3,201),
('MK102','Basis Data',3,202),
('MK103','Jaringan Komputer',3,203),
('MK104','Sistem Operasi',3,201),
('MK105','Pemrograman Web',3,202),
('MK106','Kalkulus',3,205),
('MK107','Fisika Dasar',3,203),
('MK108','Kimia Dasar',3,207),
('MK109','Statistika',3,206),
('MK110','Desain Arsitektur',3,209);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
