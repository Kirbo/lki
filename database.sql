-- phpMyAdmin SQL Dump
-- version 4.2.10.1deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 10, 2015 at 02:01 PM
-- Server version: 10.0.22-MariaDB-0+deb8u1
-- PHP Version: 5.6.14-0+deb8u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `lki`
--
CREATE DATABASE IF NOT EXISTS `lki` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `lki`;

-- --------------------------------------------------------

--
-- Stand-in structure for view `difference`
--
DROP VIEW IF EXISTS `difference`;
CREATE TABLE IF NOT EXISTS `difference` (
`sum` time
);
-- --------------------------------------------------------

--
-- Table structure for table `working_hours`
--

DROP TABLE IF EXISTS `working_hours`;
CREATE TABLE IF NOT EXISTS `working_hours` (
`id` int(11) NOT NULL,
  `start` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `stop` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `difference` time NOT NULL DEFAULT '00:00:00',
  `flexitime` int(1) NOT NULL DEFAULT '0',
  `billable` int(1) NOT NULL DEFAULT '0',
  `billed` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=271 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure for view `difference`
--
DROP TABLE IF EXISTS `difference`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `difference` AS select sec_to_time(sum(time_to_sec(`working_hours`.`difference`))) AS `sum` from `working_hours` where ((`working_hours`.`billable` = 0) and (cast(`working_hours`.`stop` as date) < cast(now() as date)));

--
-- Indexes for dumped tables
--

--
-- Indexes for table `working_hours`
--
ALTER TABLE `working_hours`
 ADD PRIMARY KEY (`id`), ADD KEY `start` (`start`), ADD KEY `difference` (`difference`), ADD KEY `flexitime` (`flexitime`), ADD KEY `billable` (`billable`), ADD KEY `billed` (`billed`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `working_hours`
--
ALTER TABLE `working_hours`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=271;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
