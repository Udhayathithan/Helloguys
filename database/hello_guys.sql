-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 17, 2023 at 02:00 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hello_guys`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `id` varchar(10) NOT NULL,
  `Name` varchar(20) NOT NULL,
  `Phone` varchar(20) NOT NULL,
  `Description` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`id`, `Name`, `Phone`, `Description`) VALUES
('aathi1.jpg', 'Aathi', '6382757523', 'EEE'),
('image3.jpg', 'Mano', '2134567890', 'Photo Shop'),
('image1.jpg', 'Python', '3124567890', 'Code'),
('c.jpg', 'Vijay', '4123567890', 'code'),
('image4.jpg', 'Robotic', '5123467890', 'Bot'),
('image5.jpg', 'weber', '8123456790', 'web'),
('image2.jpg', 'Udhaya', 'udhayathithans@gmail', 'Spider'),
('spid.png', 'VIjayvij', '9840061866', 'chess player');

-- --------------------------------------------------------

--
-- Table structure for table `content`
--

CREATE TABLE `content` (
  `userid` varchar(150) NOT NULL,
  `sender` varchar(150) NOT NULL,
  `receiver` varchar(150) NOT NULL,
  `message` varchar(150) NOT NULL,
  `datetime` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `content`
--

INSERT INTO `content` (`userid`, `sender`, `receiver`, `message`, `datetime`) VALUES
('1', 'Aathi', 'Mano', 'hi,hello', '2023-03-13 13:16:33.000000'),
('2', 'Mano', 'Aathi', 'Hello', '2023-03-13 13:16:33.000000'),
('3', 'Aathi', 'Mano', 'How Are You?', '2023-03-13 13:20:02.000000'),
('5', 'Aathi', 'Mano', 'What are You doing?', '2023-03-13 13:20:02.000000'),
('6', 'Mano', 'Aathi', 'noting.\r\nTomorrow came college?', '2023-03-13 13:23:00.000000'),
('7', 'Aathi', 'Mano', 'yes ofcourse i will come.', '2023-03-13 13:23:00.000000'),
('8', 'Mano', 'Aathi', 'tomorrow come with my notes', '2023-03-13 13:23:00.000000'),
('9', 'Aathi', 'Mano', 'ok dude.', '2023-03-13 13:23:00.000000'),
('10', 'Mano', 'Aathi', 'ok bye.', '2023-03-13 13:23:00.000000'),
('11', 'Aathi', 'Python', 'hi, Python', '2023-03-13 13:53:49.000000'),
('12', 'Python', 'Aathi', 'hi, Aathi', '2023-03-13 13:55:34.000000'),
('13', 'Aathi', 'Python', 'send some info about python', '2023-03-13 13:55:34.000000'),
('14', 'Python', 'Aathi', 'ok aathi. i will send', '2023-03-13 13:55:34.000000'),
('15', 'Aathi', 'Python', 'ok Python.Thanks', '2023-03-13 13:55:34.000000'),
('', 'Aathi', 'C++', 'hello, one two three', '2023-03-16 13:00:55.000000'),
('16', 'Aathi', 'Robotic', 'welcome bot', '2023-03-16 13:18:11.000000'),
('1', 'Aathi', 'C++', 'welcome, to world', '2023-03-16 13:24:00.000000'),
('17', 'Aathi', 'web developer', 'web boting', '2023-03-16 13:31:23.000000'),
('', 'Aathi', 'Mano', 'simpley waste', '2023-03-16 13:45:24.000000'),
('', 'Aathi', 'weber', 'dont skip this', '2023-03-17 11:49:40.000000'),
('', 'Aathi', 'Udhaya', 'hi udhaya. how r u. what r doing. \r\nwhat can i help you.\r\njoker1\r\njoker2\r\nbye', '2023-03-17 11:52:31.000000'),
('', 'Aathi', 'Vijay', 'hi vijay how are you.', '2023-03-17 12:02:51.000000'),
('1', 'Aathi', 'Vijay', 'hi vijay wassup', '2023-03-17 12:12:31.682629'),
('1', 'Aathi', 'Vijay', 'dei', '2023-03-17 12:18:43.730430'),
('1', 'Aathi', 'weber', 'get to codes', '2023-03-17 12:19:08.955230'),
('1', 'Aathi', 'Udhaya', 'Python Aathi hi, Aathi 2023-03-13 19:25:34.000000 13 Aathi Python send some info about python 2023-03-13 19:25:34.000000 14 Python Aathi ok aathi. i w', '2023-03-17 12:24:43.459598'),
('1', 'Aathi', 'Robotic', 'bot account', '2023-03-17 12:29:45.701454'),
('1', 'Aathi', 'Vijay', 'dei vijay', '2023-03-17 12:33:38.819267'),
('1', 'Aathi', 'Robotic', 'robotics', '2023-03-17 12:40:03.720435'),
('1', 'Aathi', 'Vijay', 'hello guys', '2023-03-17 12:42:28.793093'),
('1', 'Aathi', 'Python', 'hellllo', '2023-03-17 12:44:05.909532'),
('1', 'VIjayvij', 'Aathi', 'hi ', '2023-03-17 12:47:28.040065'),
('1', 'Aathi', 'VIjayvij', 'hi vijay', '2023-03-17 12:48:30.260275');

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `userid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `message`
--

INSERT INTO `message` (`userid`) VALUES
(0),
(0);

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `datetime` timestamp(6) NOT NULL DEFAULT current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`datetime`) VALUES
('0000-00-00 00:00:00.000000');

-- --------------------------------------------------------

--
-- Table structure for table `userinfo`
--

CREATE TABLE `userinfo` (
  `id` varchar(5) NOT NULL,
  `profile` varchar(15) NOT NULL,
  `name` varchar(20) NOT NULL,
  `phnumber` varchar(20) NOT NULL,
  `description` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `userinfo`
--

INSERT INTO `userinfo` (`id`, `profile`, `name`, `phnumber`, `description`) VALUES
('2', '', 'aathieditz', '987', 'sdf'),
('3', 'image2.jpg', 'sambar', '9878680', 'gjhygh'),
('3', 'image1.jpg', 'sambar', '9878680', 'hiu'),
('1', 'image1.jpg', 'fds', '1234', 'eee'),
('1', 'image1.jpg', 'mano', '12345', 'sss'),
('1', 'pattern.png', 'sss', 'ddd', 'ccc');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
