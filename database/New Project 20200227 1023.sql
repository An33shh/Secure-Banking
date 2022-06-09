-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.5.60


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema image_authentication
--

CREATE DATABASE IF NOT EXISTS image_authentication;
USE image_authentication;

--
-- Definition of table `encrypt`
--

DROP TABLE IF EXISTS `encrypt`;
CREATE TABLE `encrypt` (
  `sno` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `file_id` varchar(45) NOT NULL,
  `secrete_key` varchar(45) NOT NULL,
  `content` longblob NOT NULL,
  `serch_key1` varchar(45) NOT NULL,
  `subject` varchar(45) NOT NULL,
  `sts` varchar(45) NOT NULL,
  PRIMARY KEY (`sno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `encrypt`
--

/*!40000 ALTER TABLE `encrypt` DISABLE KEYS */;
/*!40000 ALTER TABLE `encrypt` ENABLE KEYS */;


--
-- Definition of table `file_upload`
--

DROP TABLE IF EXISTS `file_upload`;
CREATE TABLE `file_upload` (
  `sno` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fid` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `file_con` longblob NOT NULL,
  `sub` varchar(45) NOT NULL,
  `add` varchar(45) NOT NULL,
  `blood` varchar(45) NOT NULL,
  `sex` varchar(45) NOT NULL,
  `vehicle` varchar(45) NOT NULL,
  `mob` varchar(45) NOT NULL,
  PRIMARY KEY (`sno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `file_upload`
--

/*!40000 ALTER TABLE `file_upload` DISABLE KEYS */;
/*!40000 ALTER TABLE `file_upload` ENABLE KEYS */;


--
-- Definition of table `ownregister`
--

DROP TABLE IF EXISTS `ownregister`;
CREATE TABLE `ownregister` (
  `sno` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `pass_word` varchar(45) NOT NULL,
  `con_pass` varchar(45) NOT NULL,
  `date` varchar(50) NOT NULL,
  `mobile_no` varchar(45) NOT NULL,
  `city` varchar(45) NOT NULL,
  `address` varchar(45) NOT NULL,
  `sts` varchar(45) NOT NULL,
  PRIMARY KEY (`sno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ownregister`
--

/*!40000 ALTER TABLE `ownregister` DISABLE KEYS */;
/*!40000 ALTER TABLE `ownregister` ENABLE KEYS */;


--
-- Definition of table `search`
--

DROP TABLE IF EXISTS `search`;
CREATE TABLE `search` (
  `sno` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `fid_1` varchar(45) NOT NULL,
  `keyword_ser` varchar(45) NOT NULL,
  `ownername` varchar(45) NOT NULL,
  `sts` varchar(45) NOT NULL,
  `search_key` varchar(45) NOT NULL,
  `fid_2` varchar(45) NOT NULL,
  `search_1` varchar(45) NOT NULL,
  `subject` varchar(45) NOT NULL,
  `secret` varchar(45) NOT NULL,
  `mail` varchar(45) NOT NULL,
  PRIMARY KEY (`sno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `search`
--

/*!40000 ALTER TABLE `search` DISABLE KEYS */;
/*!40000 ALTER TABLE `search` ENABLE KEYS */;


--
-- Definition of table `secrete`
--

DROP TABLE IF EXISTS `secrete`;
CREATE TABLE `secrete` (
  `sno` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `file_id` varchar(45) NOT NULL,
  `search` varchar(45) NOT NULL,
  `secrete` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `sts` varchar(45) NOT NULL,
  PRIMARY KEY (`sno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `secrete`
--

/*!40000 ALTER TABLE `secrete` DISABLE KEYS */;
/*!40000 ALTER TABLE `secrete` ENABLE KEYS */;


--
-- Definition of table `secrete_file`
--

DROP TABLE IF EXISTS `secrete_file`;
CREATE TABLE `secrete_file` (
  `sno` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `file_id` varchar(45) NOT NULL,
  `filename` varchar(45) NOT NULL,
  `encrypt` longblob NOT NULL,
  `secrete` varchar(45) NOT NULL,
  PRIMARY KEY (`sno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `secrete_file`
--

/*!40000 ALTER TABLE `secrete_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `secrete_file` ENABLE KEYS */;


--
-- Definition of table `upload`
--

DROP TABLE IF EXISTS `upload`;
CREATE TABLE `upload` (
  `sno` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_no` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `file` longblob NOT NULL,
  `subject` varchar(45) NOT NULL,
  `address` varchar(45) NOT NULL,
  `blood` varchar(45) NOT NULL,
  `sex` varchar(45) NOT NULL,
  `vehicle` varchar(45) NOT NULL,
  `mobile` varchar(45) NOT NULL,
  `sts` varchar(45) NOT NULL,
  PRIMARY KEY (`sno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `upload`
--

/*!40000 ALTER TABLE `upload` DISABLE KEYS */;
/*!40000 ALTER TABLE `upload` ENABLE KEYS */;


--
-- Definition of table `userregister`
--

DROP TABLE IF EXISTS `userregister`;
CREATE TABLE `userregister` (
  `sno` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `pass_word` varchar(45) NOT NULL,
  `con_pass` varchar(45) NOT NULL,
  `date` varchar(45) NOT NULL,
  `mobile_no` varchar(45) NOT NULL,
  `city` varchar(45) NOT NULL,
  `address` varchar(45) NOT NULL,
  `sts` varchar(45) NOT NULL,
  PRIMARY KEY (`sno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userregister`
--

/*!40000 ALTER TABLE `userregister` DISABLE KEYS */;
/*!40000 ALTER TABLE `userregister` ENABLE KEYS */;


--
-- Definition of table `viw_upload`
--

DROP TABLE IF EXISTS `viw_upload`;
CREATE TABLE `viw_upload` (
  `sno` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_name` varchar(45) NOT NULL,
  `id_d` varchar(45) NOT NULL,
  `email_id` varchar(45) NOT NULL,
  `BANKING SECTOR_name` varchar(45) NOT NULL,
  `add_ress` varchar(45) NOT NULL,
  `vehicle` varchar(45) NOT NULL,
  `key_1` varchar(45) NOT NULL,
  PRIMARY KEY (`sno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `viw_upload`
--

/*!40000 ALTER TABLE `viw_upload` DISABLE KEYS */;
/*!40000 ALTER TABLE `viw_upload` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
