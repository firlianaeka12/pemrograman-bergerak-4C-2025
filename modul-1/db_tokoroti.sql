/*
SQLyog Community v13.3.0 (64 bit)
MySQL - 10.4.32-MariaDB : Database - tokoroti
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`tokoroti` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `tokoroti`;

/*Table structure for table `detail_penjualan` */

DROP TABLE IF EXISTS `detail_penjualan`;

CREATE TABLE `detail_penjualan` (
  `Id_Detail` int(11) NOT NULL AUTO_INCREMENT,
  `Id_Penjualan` int(11) DEFAULT NULL,
  `Id_Produk` int(11) DEFAULT NULL,
  `Jumlah` int(11) NOT NULL,
  `Subtotal` decimal(10,2) NOT NULL,
  PRIMARY KEY (`Id_Detail`),
  KEY `Id_Penjualan` (`Id_Penjualan`),
  KEY `Id_Produk` (`Id_Produk`),
  CONSTRAINT `detail_penjualan_ibfk_1` FOREIGN KEY (`Id_Penjualan`) REFERENCES `penjualan` (`Id_Penjualan`),
  CONSTRAINT `detail_penjualan_ibfk_2` FOREIGN KEY (`Id_Produk`) REFERENCES `produk` (`Id_Produk`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `detail_penjualan` */

insert  into `detail_penjualan`(`Id_Detail`,`Id_Penjualan`,`Id_Produk`,`Jumlah`,`Subtotal`) values 
(1,1,1,2,30000.00),
(2,1,3,1,25000.00),
(3,2,2,3,60000.00),
(4,2,5,1,30000.00);

/*Table structure for table `pegawai` */

DROP TABLE IF EXISTS `pegawai`;

CREATE TABLE `pegawai` (
  `Id_Pegawai` int(11) NOT NULL AUTO_INCREMENT,
  `Nama_Pegawai` varchar(100) NOT NULL,
  `Jabatan` varchar(50) DEFAULT NULL,
  `No_Telepon` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`Id_Pegawai`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `pegawai` */

insert  into `pegawai`(`Id_Pegawai`,`Nama_Pegawai`,`Jabatan`,`No_Telepon`) values 
(1,'Dian Permata','Kasir','08345678901'),
(2,'Agus Salim','Baker','08456789012');

/*Table structure for table `pelanggan` */

DROP TABLE IF EXISTS `pelanggan`;

CREATE TABLE `pelanggan` (
  `Id_Pelanggan` int(11) NOT NULL AUTO_INCREMENT,
  `Nama_Pelanggan` varchar(100) NOT NULL,
  `Alamat` text DEFAULT NULL,
  `No_Telepon` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`Id_Pelanggan`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `pelanggan` */

insert  into `pelanggan`(`Id_Pelanggan`,`Nama_Pelanggan`,`Alamat`,`No_Telepon`) values 
(1,'Budi Santoso','Jl. Merdeka No.1','08123456789'),
(2,'Siti Aminah','Jl. Sudirman No.2','08234567890');

/*Table structure for table `penjualan` */

DROP TABLE IF EXISTS `penjualan`;

CREATE TABLE `penjualan` (
  `Id_Penjualan` int(11) NOT NULL AUTO_INCREMENT,
  `Id_Pelanggan` int(11) DEFAULT NULL,
  `Id_Pegawai` int(11) DEFAULT NULL,
  `Tanggal` date NOT NULL,
  `Total_Harga` decimal(10,2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`Id_Penjualan`),
  KEY `Id_Pelanggan` (`Id_Pelanggan`),
  KEY `Id_Pegawai` (`Id_Pegawai`),
  CONSTRAINT `penjualan_ibfk_1` FOREIGN KEY (`Id_Pelanggan`) REFERENCES `pelanggan` (`Id_Pelanggan`),
  CONSTRAINT `penjualan_ibfk_2` FOREIGN KEY (`Id_Pegawai`) REFERENCES `pegawai` (`Id_Pegawai`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `penjualan` */

insert  into `penjualan`(`Id_Penjualan`,`Id_Pelanggan`,`Id_Pegawai`,`Tanggal`,`Total_Harga`) values 
(1,1,1,'2024-03-25',0.00),
(2,2,1,'2024-03-25',0.00);

/*Table structure for table `produk` */

DROP TABLE IF EXISTS `produk`;

CREATE TABLE `produk` (
  `Id_Produk` int(11) NOT NULL AUTO_INCREMENT,
  `Nama_Produk` varchar(100) NOT NULL,
  `Harga` decimal(10,2) NOT NULL,
  `Stok` int(11) NOT NULL,
  PRIMARY KEY (`Id_Produk`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `produk` */

insert  into `produk`(`Id_Produk`,`Nama_Produk`,`Harga`,`Stok`) values 
(1,'Roti Tawar',15000.00,50),
(2,'Roti Coklat',20000.00,30),
(3,'Roti Keju',25000.00,20),
(4,'Donat',10000.00,40),
(5,'Croissant',30000.00,25);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
