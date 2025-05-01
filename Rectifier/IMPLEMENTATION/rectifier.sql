-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 20, 2023 at 05:11 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rectifier`
--

-- --------------------------------------------------------

--
-- Table structure for table `aboutofuser`
--

CREATE TABLE `aboutofuser` (
  `About` varchar(700) NOT NULL,
  `Gmail` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `aboutofuser`
--

INSERT INTO `aboutofuser` (`About`, `Gmail`) VALUES
('Next', 'mg2290352@gmail.com'),
('khuch bhelikhunga \r\n   jo man me ai bo karunga', 'ts2290352@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `sno` int(252) NOT NULL,
  `Comment` varchar(700) NOT NULL,
  `UName` varchar(50) NOT NULL,
  `Content` varchar(100) NOT NULL,
  `PPic` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`sno`, `Comment`, `UName`, `Content`, `PPic`) VALUES
(1, 'Hai', 'Parthib0019', 'a3104890259b4b89b8b0b5de1471c554.mp4', '96d7bb60cfe147a19a7e7a10e2753398.jpg'),
(2, 'ok', 'Parthib0019', 'a3104890259b4b89b8b0b5de1471c554.mp4', '96d7bb60cfe147a19a7e7a10e2753398.jpg'),
(3, 'next comment ver ---0003', 'Parthib0019', 'a3104890259b4b89b8b0b5de1471c554.mp4', '96d7bb60cfe147a19a7e7a10e2753398.jpg'),
(4, 'hello', 'Parthib0019', '98b74151c1d6410c940b2d603dbb1f2a.mp4', 'c1743f2039a54a6e99f3f35f83295d29.jpg'),
(5, 'good bye', 'Parthib0019', '98b74151c1d6410c940b2d603dbb1f2a.mp4', 'c1743f2039a54a6e99f3f35f83295d29.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `history`
--

CREATE TABLE `history` (
  `Sno` int(252) NOT NULL,
  `Title` varchar(250) NOT NULL,
  `Content` varchar(50) NOT NULL,
  `Profilepic` varchar(50) NOT NULL,
  `Gmail` varchar(50) NOT NULL,
  `CreatorsName` varchar(50) NOT NULL,
  `DateTime` datetime(6) DEFAULT current_timestamp(6),
  `Thumbnail` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `history`
--

INSERT INTO `history` (`Sno`, `Title`, `Content`, `Profilepic`, `Gmail`, `CreatorsName`, `DateTime`, `Thumbnail`) VALUES
(1, '#Test No ---0008 RECTIFIER.ORIZINE', 'a3104890259b4b89b8b0b5de1471c554.mp4', '96d7bb60cfe147a19a7e7a10e2753398.jpg', 'ts2290352@gmail.com', 'Parthib0019', NULL, 'fb309e3494404d67bb19a5358724dd72.png'),
(2, '#Test No ---0008 RECTIFIER.ORIZINE', 'a3104890259b4b89b8b0b5de1471c554.mp4', '96d7bb60cfe147a19a7e7a10e2753398.jpg', 'ts2290352@gmail.com', 'Parthib0019', NULL, 'fb309e3494404d67bb19a5358724dd72.png'),
(3, '#Test No ---0008 RECTIFIER.ORIZINE', 'a3104890259b4b89b8b0b5de1471c554.mp4', '96d7bb60cfe147a19a7e7a10e2753398.jpg', 'ts2290352@gmail.com', 'Parthib0019', NULL, 'fb309e3494404d67bb19a5358724dd72.png'),
(4, '#Test No ---0008 RECTIFIER.ORIZINE', 'a3104890259b4b89b8b0b5de1471c554.mp4', '96d7bb60cfe147a19a7e7a10e2753398.jpg', 'ts2290352@gmail.com', 'Parthib0019', '2023-05-14 18:14:41.000000', 'fb309e3494404d67bb19a5358724dd72.png'),
(5, '#Test No ---0008 RECTIFIER.ORIZINE', 'a3104890259b4b89b8b0b5de1471c554.mp4', '96d7bb60cfe147a19a7e7a10e2753398.jpg', 'ts2290352@gmail.com', 'Parthib0019', '2023-05-14 18:26:25.000000', 'fb309e3494404d67bb19a5358724dd72.png'),
(6, '#Test No ---0008 RECTIFIER.ORIZINE', 'a3104890259b4b89b8b0b5de1471c554.mp4', '96d7bb60cfe147a19a7e7a10e2753398.jpg', 'ts2290352@gmail.com', 'Parthib0019', '2023-05-14 18:27:00.000000', 'fb309e3494404d67bb19a5358724dd72.png'),
(7, '#Test No ---0008 RECTIFIER.ORIZINE', 'a3104890259b4b89b8b0b5de1471c554.mp4', '96d7bb60cfe147a19a7e7a10e2753398.jpg', 'ts2290352@gmail.com', 'Parthib0019', '2023-05-14 18:28:16.000000', 'fb309e3494404d67bb19a5358724dd72.png'),
(8, '#Test No ---0008 RECTIFIER.ORIZINE', 'a3104890259b4b89b8b0b5de1471c554.mp4', '96d7bb60cfe147a19a7e7a10e2753398.jpg', 'ts2290352@gmail.com', 'Parthib0019', '2023-05-14 18:28:48.000000', 'fb309e3494404d67bb19a5358724dd72.png'),
(9, 'Godrage washing machine', '5f3034b7320449cdb3806002ffa0c8bc.mp4', '96d7bb60cfe147a19a7e7a10e2753398.jpg', 'ts2290352@gmail.com', 'Parthib0019', '2023-05-17 16:40:14.000000', '3430330379ca4ea8b8c39a32faf6b8de.jpg'),
(10, 'Apple Iphone 11 review', '105d674e72164b60876e7a518e1cb3d5.mp4', '96d7bb60cfe147a19a7e7a10e2753398.jpg', 'ts2290352@gmail.com', 'Parthib0019', '2023-05-17 16:40:30.000000', '03503049fb434fcaa30c4998b9371710.jpg'),
(11, '#Test No ---0008 RECTIFIER.ORIZINE', 'a3104890259b4b89b8b0b5de1471c554.mp4', '96d7bb60cfe147a19a7e7a10e2753398.jpg', 'ts2290352@gmail.com', 'Parthib0019', '2023-05-17 16:40:34.000000', 'fb309e3494404d67bb19a5358724dd72.png'),
(12, 'Samesung washing machine g111', '8e9ba38e873e408a8c67fecf47e52b2d.mp4', '96d7bb60cfe147a19a7e7a10e2753398.jpg', 'ts2290352@gmail.com', 'Parthib0019', '2023-05-17 16:40:37.000000', '2498349657e4465a8c8d9cea1e57a363.jpg'),
(13, 'Apple Macbook M2 Pro/top model/bugget pc', 'be7f5ace8d4d40b1957f83ab5a4f0890.mp4', '96d7bb60cfe147a19a7e7a10e2753398.jpg', 'ts2290352@gmail.com', 'Parthib0019', '2023-05-17 16:40:53.000000', '58231d22ba344b1ca5d77dba8709ddd9.jpg'),
(14, 'Nerreka Cycle ', 'fedafefac4e0433fb7bf9a6b443edbc7.mp4', '96d7bb60cfe147a19a7e7a10e2753398.jpg', 'ts2290352@gmail.com', 'Parthib0019', '2023-05-17 16:40:56.000000', '5cf2a8b1803a4b35b97efe7e72ab2091.jpg'),
(15, 'Samsung GAlaxy s22 review', 'a7a8596ede484ec7bd80863dc983d74c.mp4', '96d7bb60cfe147a19a7e7a10e2753398.jpg', 'ts2290352@gmail.com', 'Parthib0019', '2023-05-17 16:40:59.000000', '0bb395febc2c4c04840305e958093389.png'),
(16, 'Apple I phone 14/smart phone', 'e8632f4585cb49d9adff206ce711ff20.mp4', '42362db5a7dc4732873cd7dd481c5aaf.jpg', 'mg2290352@gmail.com', 'Next', '2023-05-17 17:05:49.000000', 'f64cd9f2504f4ad4b0a4cd4c5c2e9bf2.jpg'),
(17, 'Samsung - W-89/WashingMachine', '21e6cc99c6df493d89bd6b9cb00e5570.mp4', '42362db5a7dc4732873cd7dd481c5aaf.jpg', 'mg2290352@gmail.com', 'Next', '2023-05-17 19:12:12.000000', 'a0c1f48843e641d3aaf532f017b1059f.jpg'),
(18, 'Samsung-galaxy45/Phone', '62e34157c5a746ecad0beb78dbf154a0.mp4', '42362db5a7dc4732873cd7dd481c5aaf.jpg', 'mg2290352@gmail.com', 'Next', '2023-05-17 19:12:28.000000', '0290d304d57640afa7825c8c717c5e92.jpg'),
(19, 'APPLE MACBOOK M1 AIR / COMPUTER', '0b14979523254fd4b841e434cb5204dd.mp4', '42362db5a7dc4732873cd7dd481c5aaf.jpg', 'ts2290352@gmail.com', 'Next', '2023-05-21 16:59:25.000000', '9792f47e53fd4a6b9931a2842775396f.jpg'),
(20, 'Samsung Galaxy s 22/ Unboxing/ Phone', '20a806e7603949ebb86cc8221d5c4942.mp4', '96d7bb60cfe147a19a7e7a10e2753398.jpg', 'ts2290352@gmail.com', 'Parthib0019', '2023-05-22 16:53:12.000000', 'fe5e20115846464c8375bce297dc348d.jpg'),
(21, 'Samsung Galaxy s 22/ Unboxing/ Phone', '20a806e7603949ebb86cc8221d5c4942.mp4', '96d7bb60cfe147a19a7e7a10e2753398.jpg', 'ts2290352@gmail.com', 'Parthib0019', '2023-05-22 16:53:57.000000', 'fe5e20115846464c8375bce297dc348d.jpg'),
(22, 'Samsung Galaxy s 22/ Unboxing/ Phone', '20a806e7603949ebb86cc8221d5c4942.mp4', '96d7bb60cfe147a19a7e7a10e2753398.jpg', 'ts2290352@gmail.com', 'Parthib0019', '2023-05-22 16:54:03.000000', 'fe5e20115846464c8375bce297dc348d.jpg'),
(23, 'Washing Machine Godrage', '80e6525665094280a23f718bbf79c4d1.mp4', '96d7bb60cfe147a19a7e7a10e2753398.jpg', 'ts2290352@gmail.com', 'Parthib0019', '2023-05-22 17:01:23.000000', '402da3f4db504cdcaf0ee2b914659c03.jpg'),
(24, 'WASHING MACHINE / UNBOXING', '72326bc607284a8e8f26ef7681d85631.mp4', '42362db5a7dc4732873cd7dd481c5aaf.jpg', 'ts2290352@gmail.com', 'Next', '2023-05-22 17:01:40.000000', 'a714384c32974c8a99b696e55c2c6252.jpg'),
(25, 'DELL SAMSUNG COMPUTER', '444fa763c5c74c4898254e2e501d206f.mp4', '96d7bb60cfe147a19a7e7a10e2753398.jpg', 'ts2290352@gmail.com', 'Parthib0019', '2023-05-22 17:22:09.000000', '9ac6404065284faf8b699de4bf803e80.jpg'),
(26, 'Samsung Washing Machine w-55', '98b74151c1d6410c940b2d603dbb1f2a.mp4', '96d7bb60cfe147a19a7e7a10e2753398.jpg', 'ts2290352@gmail.com', 'Parthib0019', '2023-05-22 17:48:27.000000', '41b868c2cdba4dffbe43565b43e69139.jpg'),
(27, 'Samsung Washing Machine w-55', '98b74151c1d6410c940b2d603dbb1f2a.mp4', '96d7bb60cfe147a19a7e7a10e2753398.jpg', 'ts2290352@gmail.com', 'Parthib0019', '2023-05-22 17:49:32.000000', '41b868c2cdba4dffbe43565b43e69139.jpg'),
(28, 'Samsung Washing Machine w-55', '98b74151c1d6410c940b2d603dbb1f2a.mp4', '96d7bb60cfe147a19a7e7a10e2753398.jpg', 'ts2290352@gmail.com', 'Parthib0019', '2023-05-22 17:52:08.000000', '41b868c2cdba4dffbe43565b43e69139.jpg'),
(29, 'Samsung Washing Machine w-55', '98b74151c1d6410c940b2d603dbb1f2a.mp4', '96d7bb60cfe147a19a7e7a10e2753398.jpg', 'ts2290352@gmail.com', 'Parthib0019', '2023-05-22 18:22:28.000000', '41b868c2cdba4dffbe43565b43e69139.jpg'),
(30, 'Samsung Washing Machine w-55', '98b74151c1d6410c940b2d603dbb1f2a.mp4', '96d7bb60cfe147a19a7e7a10e2753398.jpg', 'ts2290352@gmail.com', 'Parthib0019', '2023-05-22 18:22:32.000000', '41b868c2cdba4dffbe43565b43e69139.jpg'),
(31, 'Nireeka N-5 / Unboxing/ Cycle / Bycycle', '0f35a4f0c4ba42e899ea15a7380c9693.mp4', '96d7bb60cfe147a19a7e7a10e2753398.jpg', 'ts2290352@gmail.com', 'Parthib0019', '2023-05-25 19:51:58.000000', '206b54adacaa472da40dbfe9f3a8cc89.jpg'),
(32, 'Nireeka N-5 / Unboxing/ Cycle / Bycycle', '0f35a4f0c4ba42e899ea15a7380c9693.mp4', '96d7bb60cfe147a19a7e7a10e2753398.jpg', 'ts2290352@gmail.com', 'Parthib0019', '2023-05-25 19:54:34.000000', '206b54adacaa472da40dbfe9f3a8cc89.jpg'),
(33, 'APPLE MACBOOK M1 AIR / COMPUTER', '0b14979523254fd4b841e434cb5204dd.mp4', '42362db5a7dc4732873cd7dd481c5aaf.jpg', 'mg2290352@gmail.com', 'Next', '2023-05-25 20:35:31.000000', '9792f47e53fd4a6b9931a2842775396f.jpg'),
(34, 'APPLE MACBOOK M1 AIR / COMPUTER', '0b14979523254fd4b841e434cb5204dd.mp4', '42362db5a7dc4732873cd7dd481c5aaf.jpg', 'mg2290352@gmail.com', 'Next', '2023-05-25 20:35:34.000000', '9792f47e53fd4a6b9931a2842775396f.jpg'),
(35, 'DELL SAMSUNG COMPUTER', '444fa763c5c74c4898254e2e501d206f.mp4', '96d7bb60cfe147a19a7e7a10e2753398.jpg', 'mg2290352@gmail.com', 'Parthib0019', '2023-05-25 20:35:38.000000', '9ac6404065284faf8b699de4bf803e80.jpg'),
(36, 'DELL SAMSUNG COMPUTER', '444fa763c5c74c4898254e2e501d206f.mp4', '96d7bb60cfe147a19a7e7a10e2753398.jpg', 'mg2290352@gmail.com', 'Parthib0019', '2023-05-25 20:35:40.000000', '9ac6404065284faf8b699de4bf803e80.jpg'),
(37, 'Samsung Washing Machine w-55', '98b74151c1d6410c940b2d603dbb1f2a.mp4', '96d7bb60cfe147a19a7e7a10e2753398.jpg', 'mg2290352@gmail.com', 'Parthib0019', '2023-05-25 20:35:44.000000', '41b868c2cdba4dffbe43565b43e69139.jpg'),
(38, 'Samsung Washing Machine w-55', '98b74151c1d6410c940b2d603dbb1f2a.mp4', '96d7bb60cfe147a19a7e7a10e2753398.jpg', 'mg2290352@gmail.com', 'Parthib0019', '2023-05-25 20:35:46.000000', '41b868c2cdba4dffbe43565b43e69139.jpg'),
(39, 'APPLE MACBOOK M1 AIR / COMPUTER', '0b14979523254fd4b841e434cb5204dd.mp4', '42362db5a7dc4732873cd7dd481c5aaf.jpg', 'ts2290352@gmail.com', 'Next', '2023-05-26 17:59:13.000000', '9792f47e53fd4a6b9931a2842775396f.jpg'),
(40, 'APPLE MACBOOK M1 AIR / COMPUTER', '0b14979523254fd4b841e434cb5204dd.mp4', '42362db5a7dc4732873cd7dd481c5aaf.jpg', 'ts2290352@gmail.com', 'Next', '2023-05-26 17:59:17.000000', '9792f47e53fd4a6b9931a2842775396f.jpg'),
(41, 'DELL SAMSUNG COMPUTER', '444fa763c5c74c4898254e2e501d206f.mp4', '96d7bb60cfe147a19a7e7a10e2753398.jpg', 'ts2290352@gmail.com', 'Parthib0019', '2023-05-27 14:53:28.000000', '9ac6404065284faf8b699de4bf803e80.jpg'),
(42, 'DELL SAMSUNG COMPUTER', '444fa763c5c74c4898254e2e501d206f.mp4', '96d7bb60cfe147a19a7e7a10e2753398.jpg', 'ts2290352@gmail.com', 'Parthib0019', '2023-05-27 14:53:33.000000', '9ac6404065284faf8b699de4bf803e80.jpg'),
(43, 'Samsung Washing Machine w-55', '98b74151c1d6410c940b2d603dbb1f2a.mp4', '96d7bb60cfe147a19a7e7a10e2753398.jpg', 'ts2290352@gmail.com', 'Parthib0019', '2023-05-27 14:53:40.000000', '41b868c2cdba4dffbe43565b43e69139.jpg'),
(44, 'Samsung Washing Machine w-55', '98b74151c1d6410c940b2d603dbb1f2a.mp4', '96d7bb60cfe147a19a7e7a10e2753398.jpg', 'ts2290352@gmail.com', 'Parthib0019', '2023-05-27 14:53:42.000000', '41b868c2cdba4dffbe43565b43e69139.jpg'),
(45, 'Nireeka N-5 / Unboxing/ Cycle / Bycycle', '0f35a4f0c4ba42e899ea15a7380c9693.mp4', '96d7bb60cfe147a19a7e7a10e2753398.jpg', 'ts2290352@gmail.com', 'Parthib0019', '2023-05-30 16:38:20.000000', '206b54adacaa472da40dbfe9f3a8cc89.jpg'),
(46, 'Samsung Galaxy s 22/ Unboxing/ Phone', '20a806e7603949ebb86cc8221d5c4942.mp4', '96d7bb60cfe147a19a7e7a10e2753398.jpg', 'ts2290352@gmail.com', 'Parthib0019', '2023-05-31 16:20:08.000000', 'fe5e20115846464c8375bce297dc348d.jpg'),
(47, 'Samsung Galaxy s 22/ Unboxing/ Phone', '20a806e7603949ebb86cc8221d5c4942.mp4', '8150629333b44df7a2bc637931cb05d6.jpg', 'ts2290352@gmail.com', 'Parthib0019', '2023-06-02 20:12:18.000000', 'fe5e20115846464c8375bce297dc348d.jpg'),
(48, 'DELL SAMSUNG COMPUTER', '444fa763c5c74c4898254e2e501d206f.mp4', '8150629333b44df7a2bc637931cb05d6.jpg', 'ts2290352@gmail.com', 'Parthib0019', '2023-06-02 20:12:25.000000', '9ac6404065284faf8b699de4bf803e80.jpg'),
(49, 'Nireeka N-5 / Unboxing/ Cycle / Bycycle noooo', '0f35a4f0c4ba42e899ea15a7380c9693.mp4', 'fd40adbfcc444351b2c2539f7ae1000a.jpg', 'ts2290352@gmail.com', 'Parthib0019', '2023-06-06 20:02:00.000000', 'd29ddf6e85d84af4a76b44d7954db890.'),
(50, 'Nireeka N-5 / Unboxing/ Cycle / Bycycle noooo', '0f35a4f0c4ba42e899ea15a7380c9693.mp4', 'fd40adbfcc444351b2c2539f7ae1000a.jpg', 'ts2290352@gmail.com', 'Parthib0019', '2023-06-06 20:02:49.000000', 'd29ddf6e85d84af4a76b44d7954db890.'),
(51, 'Nireeka N-5 / Unboxing/ Cycle / Bycycle noooo', '0f35a4f0c4ba42e899ea15a7380c9693.mp4', 'fd40adbfcc444351b2c2539f7ae1000a.jpg', 'ts2290352@gmail.com', 'Parthib0019', '2023-06-06 20:11:29.000000', '8cb89376fc8b4819a70998a5df29604d.'),
(52, 'Nireeka N-5 / Unboxing/ Cycle / Bycycle noooo', '0f35a4f0c4ba42e899ea15a7380c9693.mp4', 'fd40adbfcc444351b2c2539f7ae1000a.jpg', 'ts2290352@gmail.com', 'Parthib0019', '2023-06-06 20:25:48.000000', '52010c2b98534b9f86e6063cbf9d43e9.jpg'),
(53, 'Nireeka N-5 / Unboxing/ Cycle / Bycycle noooo', '0f35a4f0c4ba42e899ea15a7380c9693.mp4', 'fd40adbfcc444351b2c2539f7ae1000a.jpg', 'ts2290352@gmail.com', 'Parthib0019', '2023-06-06 20:26:18.000000', '52010c2b98534b9f86e6063cbf9d43e9.jpg'),
(54, 'Nireeka N-5 / Unboxing/ Cycle / Bycycle noooo', '0f35a4f0c4ba42e899ea15a7380c9693.mp4', 'fd40adbfcc444351b2c2539f7ae1000a.jpg', 'ts2290352@gmail.com', 'Parthib0019', '2023-06-06 20:26:19.000000', '52010c2b98534b9f86e6063cbf9d43e9.jpg'),
(55, 'Nireeka N-5 / Unboxing/ Cycle / Bycycle noooo', '0f35a4f0c4ba42e899ea15a7380c9693.mp4', 'fd40adbfcc444351b2c2539f7ae1000a.jpg', 'ts2290352@gmail.com', 'Parthib0019', '2023-06-06 20:57:07.000000', 'c89a458ce56f40ffa2eb11619496d557.jpg'),
(142, 'APPLE MACBOOK M1 AIR / COMPUTER', '0b14979523254fd4b841e434cb5204dd.mp4', '42362db5a7dc4732873cd7dd481c5aaf.jpg', 'ts2290352@gmail.com', 'Next', '2023-06-18 12:59:20.000000', '9792f47e53fd4a6b9931a2842775396f.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `Sno` int(252) NOT NULL,
  `Gmail` varchar(50) NOT NULL,
  `Content` varchar(50) NOT NULL,
  `Thumbnail` varchar(50) NOT NULL,
  `Title` varchar(50) NOT NULL,
  `ProfilePic` varchar(50) NOT NULL,
  `CreatorsName` varchar(50) NOT NULL,
  `DateTime` datetime(6) DEFAULT current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`Sno`, `Gmail`, `Content`, `Thumbnail`, `Title`, `ProfilePic`, `CreatorsName`, `DateTime`) VALUES
(5, 'ts2290352@gmail.com', '0f35a4f0c4ba42e899ea15a7380c9693.mp4', '206b54adacaa472da40dbfe9f3a8cc89.jpg', 'Nireeka N-5 / Unboxing/ Cycle / Bycycle', '96d7bb60cfe147a19a7e7a10e2753398.jpg', 'Parthib0019', '2023-05-28 17:31:08.113066'),
(6, 'mg2290352@gmail.com', '0b14979523254fd4b841e434cb5204dd.mp4', '9792f47e53fd4a6b9931a2842775396f.jpg', 'APPLE MACBOOK M1 AIR / COMPUTER', '42362db5a7dc4732873cd7dd481c5aaf.jpg', 'Next', '2023-05-28 17:31:08.113066'),
(7, 'mg2290352@gmail.com', '444fa763c5c74c4898254e2e501d206f.mp4', '9ac6404065284faf8b699de4bf803e80.jpg', 'DELL SAMSUNG COMPUTER', '96d7bb60cfe147a19a7e7a10e2753398.jpg', 'Parthib0019', '2023-05-28 17:31:08.113066'),
(8, 'mg2290352@gmail.com', '98b74151c1d6410c940b2d603dbb1f2a.mp4', '41b868c2cdba4dffbe43565b43e69139.jpg', 'Samsung Washing Machine w-55', '96d7bb60cfe147a19a7e7a10e2753398.jpg', 'Parthib0019', '2023-05-28 17:31:08.113066'),
(9, 'ts2290352@gmail.com', '0b14979523254fd4b841e434cb5204dd.mp4', '9792f47e53fd4a6b9931a2842775396f.jpg', 'APPLE MACBOOK M1 AIR / COMPUTER', '42362db5a7dc4732873cd7dd481c5aaf.jpg', 'Next', '2023-05-28 17:31:08.113066'),
(10, 'ts2290352@gmail.com', '444fa763c5c74c4898254e2e501d206f.mp4', '9ac6404065284faf8b699de4bf803e80.jpg', 'DELL SAMSUNG COMPUTER', '96d7bb60cfe147a19a7e7a10e2753398.jpg', 'Parthib0019', '2023-05-28 17:31:08.113066'),
(11, 'ts2290352@gmail.com', '98b74151c1d6410c940b2d603dbb1f2a.mp4', '41b868c2cdba4dffbe43565b43e69139.jpg', 'Samsung Washing Machine w-55', '96d7bb60cfe147a19a7e7a10e2753398.jpg', 'Parthib0019', '2023-05-28 17:31:08.113066');

-- --------------------------------------------------------

--
-- Table structure for table `mainfeedback`
--

CREATE TABLE `mainfeedback` (
  `UGmail` varchar(50) NOT NULL,
  `Thumbnail` varchar(50) NOT NULL,
  `Trailer` varchar(50) NOT NULL,
  `Content` varchar(50) NOT NULL,
  `Title` varchar(50) NOT NULL,
  `pros` varchar(700) NOT NULL,
  `cons` varchar(700) NOT NULL,
  `Value` int(3) NOT NULL,
  `Catagory` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mainfeedback`
--

INSERT INTO `mainfeedback` (`UGmail`, `Thumbnail`, `Trailer`, `Content`, `Title`, `pros`, `cons`, `Value`, `Catagory`) VALUES
('mg2290352@gmail.com', '9792f47e53fd4a6b9931a2842775396f.jpg', 'b00154a4e85f4b3fb27423bd569af346.mp4', '0b14979523254fd4b841e434cb5204dd.mp4', 'APPLE MACBOOK M1 AIR / COMPUTER', '1. DISJFOSIJF OASJ OISJ IOSJ F\r\n2. SFSDJIDSJF IJPFJSDPOJFOS\r\n3. SFJ IOSDJ FISJFPASJPIOSDJ\r\n4. SD SDFJISDF ISDJFISJFIPAJ', '1. D SDFKSFKSOKOSKP OSKPKFSK[O[\r\n2. JSIAJF JPAOJPOSJSDJOPSDJOJS\r\n3. JJAIPJDIOPSJ ISJF PISJPIAJPJA\r\n4. JOISJF OSJ POSJ FSJFOSIJFSJOIJ', 99, 'APPLE/MACBOOK/COMPUTER/M1 AIR'),
('ts2290352@gmail.com', '317b19f45b544c0bbe0cd09c8dbc8900.jpg', '7725f2db22c54f84b951550869434c26.mp4', '0f35a4f0c4ba42e899ea15a7380c9693.mp4', 'Nireeka N-5 / Unboxing/ Cycle / Bycycle noooo', '1. ifjioajf ijfiodsj ijifjdsifjsaij isdjf i \r\n2. jifosdj isjfisjf ijsiof isjfiajojopjoidsjij \r\n3. jfd jisj pijisjdifj is sapj sj j isd\r\n4. kspo ksopk a ok fs s foskfokdok', '1. fkosdfosdkfskfop kskf sk p[sk p kf okds\r\n2. kfosdkfo kspok skp[ka[k oskfo ksokfks[\r\n3. dsiofjsdijisdjajoipjsdoifjsiodfjoisj sji jsidj fs\r\n4. kopskdofk sok fsop kkokkp oskp[ fsoakf sok', 0, ' Nireeka/Cycle/Bycycle/Unboxing                   '),
('ts2290352@gmail.com', 'fe5e20115846464c8375bce297dc348d.jpg', 'a08a2b3490c3458bb9517f7a8a990f89.mp4', '20a806e7603949ebb86cc8221d5c4942.mp4', 'Samsung Galaxy s 22/ Unboxing/ Phone', '1. sdfsfasfasfsdfsda\r\n2. dfsdfsdfasfsddsf\r\n3. dsfdsfsfdsfsadfsd\r\n4. dsfsdfsfsdfsdf', '1. sdfsdsdfsafsafs\r\n2. dsfdsfsdfdsfsdfsfs\r\n3. sdfafsfsaadssfs\r\n4. dsdsfsdf sdf sdf s fa', 399, 'Samsung/Galaxy/S22/'),
('ts2290352@gmail.com', '9ac6404065284faf8b699de4bf803e80.jpg', '141975e87eb243b68270dbed46e71eaa.mp4', '444fa763c5c74c4898254e2e501d206f.mp4', 'DELL SAMSUNG COMPUTER', '1. DFJDOFJSOIFJOISJFS\r\n2. DSFJDSOJOSIDJFOISDJFIOJDF\r\n3. DFKSDOPKFOPSKFOPSKFOSKD\r\n4. DSIFJDSIFJSIJFIOSDJFIOSDJFIOJ\r\n', '1. JSDIFSDIFJSIOJFOISJF\r\n2.J IOJFOIDJOIJDSIJDJF\r\n3.JIOFJIOJFIODSJFIOSJFIOSJF\r\n4. IJSDOISJOISJOIJFSIJSIJ', 599, 'DELL/COMPUTER/SAMSUNG'),
('mg2290352@gmail.com', '167396929b7e44c089dc3da41154cf3e.jpg', '4de5c86008594e61b84bd909c13111a7.mp4', '5e7849e2ec4d447599144b98897835eb.mp4', 'HERO H-55 / BYCYCLE / CYCLE', '1. jfidsjfidjfiosjfaojojs\r\n2. dfgkofdkgpdok opdfk g\r\n3. fkgopdfkgdkspok odkgokdop\r\n4. f pdfpdopdfkpofdkopfdk ', '1. ijisdjfsdijfsijfsdijfosjosidj jij\r\n2. kofkg okgofdkopk sdk do ofk\r\n3. kf okdo fksdk [osk [ak  ks\r\n4. difodj iodjfoij pdisjpo aj ojoj\r\n', 299, 'HERO/BYCYCLE/CYCLE/ H-55'),
('mg2290352@gmail.com', 'a714384c32974c8a99b696e55c2c6252.jpg', '01594791ef314d54913edd885cde6920.mp4', '72326bc607284a8e8f26ef7681d85631.mp4', 'WASHING MACHINE / UNBOXING', '1. fksdfj sodfs osdkfoskofak[k spokfpo\r\n2. kdsopfksdopk psk f[pk \r\n3. ifkjdisof sdfjiosjfois jofi\r\n4. sfj soijfosdfoskfopsdk\r\n', '1. skdsofksdok osdkfsk[ks[kf[spk[apk\r\n2. sifjsiodf ofosdkfokfo\r\n3. sfkpofkspkfp[skfp sk\r\n4. sfdfpokopfkpokfposkfpsok', 399, 'WASHING MACHINE/MACHINE/UNBOXING'),
('ts2290352@gmail.com', '402da3f4db504cdcaf0ee2b914659c03.jpg', 'fe8e6f4f61e64d3986a9d38b7e10dfeb.mp4', '80e6525665094280a23f718bbf79c4d1.mp4', 'Washing Machine Godrage', '1.jifdjoisjoisdjfoijdaij\r\n2.djfdsjfidosjfiodjfiosdjf\r\n3. kdokdokdsopkfpdsofkp\r\n4.ijdfosdijfodijfodsjfo\r\n', '1. jdsifjijfs[jfosijosijiosjif\r\n2. jdosijosidjiosjiojs\r\n3.io ijdosijfoisdjfoidsjf\r\n4. dsfdkfopkfpsodkfpodsk', 199, 'WashingMachine/Washing/Godrage'),
('ts2290352@gmail.com', '41b868c2cdba4dffbe43565b43e69139.jpg', 'd80bc619ba534c059e692844bde11f3d.mp4', '98b74151c1d6410c940b2d603dbb1f2a.mp4', 'Samsung Washing Machine w-55', '1. ijfijfiodsjoijsd[ijs[ioj\r\n2. sfjdjfisdjfsiojfi\r\n3. isjfoijfoijfoij\r\n4. jfoisjfoij sdifjsojfosjfoj\r\n', '1. jsijiosdjfioajfiosjfoisjfoisjfoi\r\n2. difdisjsj[fosdjfoisdjf\r\n3. sdfsopkfopskfpsokf\r\n4. fpodkfopdfkposkfposdkf', 499, 'Samsung/Washing/WashingMachine'),
('mg2290352@gmail.com', 'e0c41a776bc64c8cb1c08b8f2b73e29e.jpg', 'd0fa84ed97c74d229ac31fba0543ac99.mp4', '9db8e14a270a44e8bfc830b9ed893a6d.mp4', 'AUSUS ROG PHONE 5 ', '1. ijfiopdsjf sjfoisjf psaj fsaj fsj fsafj \r\n2. sidjfo sijosj sjsj fsoipj psojfosj ois\r\n3. ajf ijf pjfpajfjsjfsij sjfisjj soj os\r\n4. fs okosdkfk dskpskpk poskd ', '1. sj isjpfi siosjiosjj isjsjosjo jsoi\r\n2. fjso jsdoj oisjfsjpiosjpoj soj\r\n3. sjfi isjpajpj ojfosjoi jj\r\n4. sk opskoak[ kpkps[k skopk', 399, 'AUSUS/ROG/ PHONE5/PHONE'),
('ts2290352@gmail.com', '8b9e9e88a7e845d6ac5d680b9d8cd8ff.jpg', '71ce67a600a94840a25f59eaf0919ca6.mp4', 'd0199b48dad54477ae8df1c7d306126c.mp4', 'Apple IPhone 14/ Phone / Apple /', '1. udhfdfdjdisfjdsjfisd\n2. dfkdskdsofkodspkfosdkf\n3. sfjidjfidsjfidosjfidsjfidsjf\n4. fjdiojfdijfdijfdifjsjfidjf\n', '1. sfjdijfdijfdijfdijfodsijfosdij\r\n2. sfjdjfidojodisjf\r\n3. fijfoidjfoidsjfsijfosj\r\n4.djijdsijfidosjfosijosid', 199, 'Apple/Phone/IPhone/Iphone14');

-- --------------------------------------------------------

--
-- Table structure for table `profilepic`
--

CREATE TABLE `profilepic` (
  `UGmail` varchar(50) NOT NULL,
  `PPic` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `profilepic`
--

INSERT INTO `profilepic` (`UGmail`, `PPic`) VALUES
('mg2290352@gmail.com', '42362db5a7dc4732873cd7dd481c5aaf.jpg'),
('ts2290352@gmail.com', 'c1743f2039a54a6e99f3f35f83295d29.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `userinfo`
--

CREATE TABLE `userinfo` (
  `UNAME` varchar(50) NOT NULL,
  `Gmail` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `userinfo`
--

INSERT INTO `userinfo` (`UNAME`, `Gmail`) VALUES
('Next', 'mg2290352@gmail.com'),
('Parthib0019', 'ts2290352@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aboutofuser`
--
ALTER TABLE `aboutofuser`
  ADD PRIMARY KEY (`Gmail`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`sno`);

--
-- Indexes for table `history`
--
ALTER TABLE `history`
  ADD PRIMARY KEY (`Sno`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`Sno`);

--
-- Indexes for table `mainfeedback`
--
ALTER TABLE `mainfeedback`
  ADD PRIMARY KEY (`Content`);

--
-- Indexes for table `profilepic`
--
ALTER TABLE `profilepic`
  ADD PRIMARY KEY (`UGmail`);

--
-- Indexes for table `userinfo`
--
ALTER TABLE `userinfo`
  ADD PRIMARY KEY (`Gmail`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `sno` int(252) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `history`
--
ALTER TABLE `history`
  MODIFY `Sno` int(252) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=143;

--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `Sno` int(252) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
