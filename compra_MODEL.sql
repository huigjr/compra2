-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Gegenereerd op: 11 apr 2018 om 15:36
-- Serverversie: 10.1.26-MariaDB
-- PHP-versie: 7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "system";
SET CHARACTER SET utf8mb4;


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `compra`
--
CREATE DATABASE IF NOT EXISTS `compra`;
USE `compra`;

ALTER DATABASE `compra` CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `pages`
--

CREATE TABLE IF NOT EXISTS `pages` (
  `pageid` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(64) DEFAULT NULL,
  `url` varchar(64) DEFAULT NULL,
  `content` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`pageid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci AUTO_INCREMENT=1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `clients`
--

CREATE TABLE IF NOT EXISTS `clients` (
  `clientid` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `email` varchar(64) DEFAULT NULL,
  `password` varchar(64) DEFAULT NULL,
  `firstname` varchar(64) DEFAULT NULL,
  `lastname` varchar(64) DEFAULT NULL,
  `organisation` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`clientid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci AUTO_INCREMENT=1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `tlds`
--

CREATE TABLE IF NOT EXISTS `tlds` (
  `tldid` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tld` varchar(16) DEFAULT NULL,
  `supplier` varchar(16) DEFAULT NULL,
  `months` tinyint(3) UNSIGNED DEFAULT 12,
  `price` decimal(6,2) DEFAULT NULL,
  `invoiceline` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`tldid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci AUTO_INCREMENT=1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `services`
--

CREATE TABLE IF NOT EXISTS `services` (
  `serviceid` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `servicename` varchar(16) DEFAULT NULL,
  `renewable` tinyint(1) DEFAULT NULL,
  `months` tinyint(3) UNSIGNED DEFAULT NULL,
  `price` decimal(6,2) DEFAULT NULL,
  `invoiceline` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`serviceid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci AUTO_INCREMENT=1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `domains`
--

CREATE TABLE IF NOT EXISTS `domains` (
  `domainid` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `userid` smallint(5) UNSIGNED NOT NULL,
  `domainname` varchar(32) DEFAULT NULL,
  `supplier` varchar(16) DEFAULT NULL,
  `renew` tinyint(1) DEFAULT NULL,
  `startdate` date,
  `enddate` date,
  `renewdate` date,
  PRIMARY KEY (`domainid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci AUTO_INCREMENT=1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `products`
--

CREATE TABLE IF NOT EXISTS `products` (
  `productid` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `userid` smallint(5) UNSIGNED NOT NULL,
  `type` tinyint(3) UNSIGNED DEFAULT NULL,
  `typeid` smallint(5) UNSIGNED NOT NULL,
  `invoiceline` varchar(64) DEFAULT NULL,
  `startdate` date DEFAULT NULL,
  `enddate` date DEFAULT NULL,
  `renew` tinyint(1) UNSIGNED DEFAULT 0,
  `price` decimal(6,2) DEFAULT NULL,
  `status` tinyint(3) UNSIGNED DEFAULT 0,
  PRIMARY KEY (`productid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci AUTO_INCREMENT=1;

-- --------------------------------------------------------


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
