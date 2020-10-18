-- phpMyAdmin SQL Dump
-- version 4.9.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Oct 18, 2020 at 03:39 PM
-- Server version: 5.7.26
-- PHP Version: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `swimschool`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `surname` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `login_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `name`, `surname`, `email`, `login_id`) VALUES
(2, 'Nan', 'Guo', 'admin@aaa.com', 3);

-- --------------------------------------------------------

--
-- Table structure for table `class`
--

CREATE TABLE `class` (
  `class_id` int(10) UNSIGNED NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `daytime` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `time` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `trainer_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `max_number` int(10) NOT NULL,
  `cur_number` int(10) NOT NULL,
  `status` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `program_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `class`
--

INSERT INTO `class` (`class_id`, `start_date`, `end_date`, `daytime`, `time`, `trainer_name`, `max_number`, `cur_number`, `status`, `program_id`) VALUES
(1, '2020-10-05', '2020-12-07', 'Mon', 'Mon 10.00-11.00', 'Max Dow', 5, 1, 'not full', 1),
(2, '2020-10-06', '2020-12-08', 'Tue', 'Tue 13.00-14.00', 'Max Dow', 5, 1, 'not full', 1),
(3, '2020-10-08', '2020-12-10', 'Thu', 'Thu 10.00-11.00', 'Max Dow', 5, 1, 'not full', 1),
(4, '2020-10-05', '2020-12-07', 'Mon', 'Mon 13.00-14.00', 'Max Dow', 5, 2, 'not full', 2),
(5, '2020-10-07', '2020-12-09', 'Wed', 'Wed 10.00-11.00', 'Max Dow', 5, 0, 'not full', 2),
(6, '2020-10-08', '2020-12-10', 'Thu', 'Thu 13.00-14.00', 'Lily Coco', 5, 0, 'not full', 2),
(7, '2020-10-05', '2020-12-07', 'Mon', 'Mon 15.00-16.00', 'Lily Coco', 5, 0, 'not full', 3),
(8, '2020-10-07', '2020-12-09', 'Wed', 'Wed 15.00-16.00', 'Lily Coco', 5, 1, 'not full', 3),
(9, '2020-10-08', '2020-12-10', 'Thu', 'Thu 15.00-16.00', 'Lily Coco', 5, 0, 'not full', 3),
(10, '2020-10-06', '2020-12-08', 'Tue', 'Tue 17.00-18.00', 'Paul Mark', 5, 0, 'not full', 4),
(11, '2020-10-07', '2020-12-09', 'Wed', 'Wed 17.00-18.00', 'Paul Mark', 5, 0, 'not full', 4),
(12, '2020-10-09', '2020-12-11', 'Fri', 'Fri 15.00-16.00', 'Paul Mark', 5, 0, 'not full', 4),
(13, '2020-10-10', '2020-12-12', 'Sat', 'Sat 10.00-11.00', 'Paul Mark', 5, 0, 'not full', 5),
(14, '2020-10-09', '2020-12-11', 'Fri', 'Fri 17.00-18.00', 'Paul Mark', 5, 1, 'not full', 5);

-- --------------------------------------------------------

--
-- Table structure for table `enrolled`
--

CREATE TABLE `enrolled` (
  `enrolled_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `surname` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `gender` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `dob` date NOT NULL,
  `health` text COLLATE utf8_unicode_ci,
  `login_id` int(10) UNSIGNED NOT NULL,
  `class_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `enrolled`
--

INSERT INTO `enrolled` (`enrolled_id`, `name`, `surname`, `gender`, `address`, `email`, `phone`, `dob`, `health`, `login_id`, `class_id`) VALUES
(1, 'Norm', 'Snow', 'male', '74 abc street, Sunnybank, QLD 4109', 'norm888@norm.com', '22222222', '2014-01-04', 'eczema', 19, 10),
(2, 'Lily', 'Lee', 'Female', '78-78A Bay Street', 'nan@nan.com', '456616208', '2015-05-01', 'no', 21, 8),
(3, 'aaa', 'aaa', 'Female', '64 Jasper Street', 'guonan627@hotmail.com', '456616208', '2018-08-10', 'no', 22, 4),
(4, 'Marry', 'Lee', 'Female', 'Unit 120, 12-40 Foley Street', 'guonan627@hotmail.com', '456616208', '2017-10-02', '', 23, 4),
(5, 'baby', 'cute', 'Female', '75A-75B Marco Avenue', 'guonan627@hotmail.com', '74375467', '2019-11-05', 'allergy to water', 3, 3),
(6, 'baby', 'cute', 'Female', '75A-75B Marco Avenue', 'guonan627@hotmail.com', '74375467', '2019-11-05', 'allergy to water', 24, 1),
(7, 'ccc', 'ccc', 'Female', '73B Main Road', 'ccc@ccc.com', '536475577', '2014-10-15', 'no', 25, 2),
(8, 'ddd', 'ddd', 'Female', '74-74A Balmoral Street', 'ddd@ddd.com', '647549835', '2010-10-13', '', 26, 14);

-- --------------------------------------------------------

--
-- Table structure for table `logging`
--

CREATE TABLE `logging` (
  `loggingID` int(11) NOT NULL,
  `action` varchar(1024) NOT NULL,
  `time` varchar(256) NOT NULL,
  `ip` varchar(256) NOT NULL,
  `browser` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `logging`
--

INSERT INTO `logging` (`loggingID`, `action`, `time`, `ip`, `browser`) VALUES
(1, 'Fetched program ID: 1', '18/09/20 10:49:44pm', '::1', 'PostmanRuntime/7.26.3'),
(2, 'Fetched all programs', '18/09/20 10:55:44pm', '::1', 'PostmanRuntime/7.26.3'),
(3, 'Fetched all programs', '18/09/20 10:55:46pm', '::1', 'PostmanRuntime/7.26.3'),
(4, 'Fetched all programs', '01/10/20 08:29:38pm', '::1', 'Safari/537.36'),
(5, 'Fetched all programs', '01/10/20 08:30:40pm', '::1', 'Safari/537.36'),
(6, 'Fetched all programs', '01/10/20 09:01:35pm', '::1', 'Safari/537.36'),
(7, 'Fetched program ID: 1', '01/10/20 09:26:45pm', '::1', 'PostmanRuntime/7.26.3'),
(8, 'Fetched all programs', '01/10/20 11:10:40pm', '::1', 'Safari/537.36'),
(9, 'Fetched all programs', '05/10/20 10:02:34pm', '::1', 'PostmanRuntime/7.26.3'),
(10, 'Fetched all programs', '05/10/20 10:06:55pm', '::1', 'PostmanRuntime/7.26.3'),
(11, 'Fetched all programs', '05/10/20 10:07:58pm', '::1', 'PostmanRuntime/7.26.3'),
(12, 'Fetched all programs', '05/10/20 10:08:01pm', '::1', 'PostmanRuntime/7.26.3'),
(13, 'Fetched all programs', '05/10/20 10:17:26pm', '::1', 'Safari/537.36'),
(14, 'Fetched all programs', '05/10/20 10:18:56pm', '::1', 'PostmanRuntime/7.26.3'),
(15, 'Fetched all programs', '05/10/20 10:18:58pm', '::1', 'PostmanRuntime/7.26.3'),
(16, 'find classes by : \"Mon\"', '05/10/20 10:35:11pm', '::1', 'PostmanRuntime/7.26.3'),
(17, 'find classes by : \"Mon\"', '05/10/20 10:35:40pm', '::1', 'PostmanRuntime/7.26.3'),
(18, 'find classes by : \"Tue\"', '05/10/20 10:38:14pm', '::1', 'PostmanRuntime/7.26.3'),
(19, 'find classes by : \"Mon\"', '05/10/20 10:38:42pm', '::1', 'PostmanRuntime/7.26.3'),
(20, 'Fetched all programs', '05/10/20 10:46:42pm', '::1', 'Safari/537.36'),
(21, 'Fetched all programs', '05/10/20 10:49:33pm', '::1', 'Safari/537.36'),
(22, 'Fetched all programs', '05/10/20 10:55:36pm', '::1', 'Safari/537.36'),
(23, 'admin logged in', '05/10/20 10:56:02pm', '::1', 'Safari/537.36'),
(24, 'admin logged in', '05/10/20 10:59:25pm', '::1', 'Safari/537.36'),
(25, 'admin logged in', '05/10/20 10:59:48pm', '::1', 'Safari/537.36'),
(26, 'abc@abc.com signed up', '05/10/20 11:00:42pm', '::1', 'Safari/537.36'),
(27, 'abc@abc.com signed up', '05/10/20 11:04:07pm', '::1', 'Safari/537.36'),
(28, 'Fetched all programs', '05/10/20 11:06:32pm', '::1', 'Safari/537.36'),
(29, 'Fetched all programs', '05/10/20 11:09:17pm', '::1', 'Safari/537.36'),
(30, 'Fetched all programs', '05/10/20 11:09:29pm', '::1', 'Safari/537.36'),
(31, 'Fetched all programs', '05/10/20 11:09:37pm', '::1', 'Safari/537.36'),
(32, 'Fetched all programs', '05/10/20 11:09:51pm', '::1', 'Safari/537.36'),
(33, 'Fetched all programs', '06/10/20 08:35:53am', '::1', 'Safari/537.36'),
(34, 'admin logged in', '06/10/20 09:38:54am', '::1', 'Safari/537.36'),
(35, 'find classes by : \"Tue\"', '06/10/20 11:00:49am', '::1', 'PostmanRuntime/7.26.3'),
(36, 'find classes by : \"Tue\"', '06/10/20 11:00:51am', '::1', 'PostmanRuntime/7.26.3'),
(37, 'find classes by : \"Tue\"', '06/10/20 11:00:54am', '::1', 'PostmanRuntime/7.26.3'),
(38, 'find classes by : \"Tue\"', '06/10/20 11:00:56am', '::1', 'PostmanRuntime/7.26.3'),
(39, 'Fetched all programs', '06/10/20 11:12:46am', '::1', 'Safari/537.36'),
(40, 'Fetched all programs', '06/10/20 11:12:53am', '::1', 'Safari/537.36'),
(41, 'Fetched all programs', '06/10/20 11:13:33am', '::1', 'Safari/537.36'),
(42, 'Fetched all programs', '06/10/20 11:13:42am', '::1', 'Safari/537.36'),
(43, 'Fetched all programs', '06/10/20 11:13:44am', '::1', 'Safari/537.36'),
(44, 'Fetched all programs', '06/10/20 11:13:55am', '::1', 'Safari/537.36'),
(45, 'Fetched all programs', '06/10/20 11:14:00am', '::1', 'Safari/537.36'),
(46, 'Fetched all programs', '06/10/20 11:14:03am', '::1', 'Safari/537.36'),
(47, 'Fetched all programs', '06/10/20 11:14:08am', '::1', 'Safari/537.36'),
(48, 'Fetched all programs', '06/10/20 11:14:10am', '::1', 'Safari/537.36'),
(49, 'Fetched all programs', '06/10/20 11:14:13am', '::1', 'Safari/537.36'),
(50, 'find classes by : \"Tue\"', '06/10/20 11:17:44am', '::1', 'PostmanRuntime/7.26.3'),
(51, 'find classes by : \"Tue\"', '06/10/20 11:17:46am', '::1', 'PostmanRuntime/7.26.3'),
(52, 'find classes by : \"Tue\"', '06/10/20 01:04:09pm', '::1', 'PostmanRuntime/7.26.3'),
(53, 'find classes by : \"Tue\"', '06/10/20 01:04:11pm', '::1', 'PostmanRuntime/7.26.3'),
(54, 'find classes by : \"Tue\"', '06/10/20 01:04:13pm', '::1', 'PostmanRuntime/7.26.3'),
(55, 'find classes by : \"Tue\"', '06/10/20 01:04:15pm', '::1', 'PostmanRuntime/7.26.3'),
(56, 'Fetched all programs', '06/10/20 01:04:29pm', '::1', 'PostmanRuntime/7.26.3'),
(57, 'Fetched all programs', '06/10/20 01:08:35pm', '::1', 'PostmanRuntime/7.26.3'),
(58, 'Fetched all programs', '06/10/20 01:08:39pm', '::1', 'PostmanRuntime/7.26.3'),
(59, 'Fetched all programs', '06/10/20 01:08:43pm', '::1', 'PostmanRuntime/7.26.3'),
(60, 'Fetched all programs', '06/10/20 01:08:45pm', '::1', 'PostmanRuntime/7.26.3'),
(61, 'Fetched all programs', '06/10/20 01:08:47pm', '::1', 'PostmanRuntime/7.26.3'),
(62, 'Fetched all programs', '06/10/20 01:08:50pm', '::1', 'PostmanRuntime/7.26.3'),
(63, 'Fetched all programs', '06/10/20 01:22:14pm', '::1', 'PostmanRuntime/7.26.3'),
(64, 'Fetched all programs', '06/10/20 01:22:19pm', '::1', 'PostmanRuntime/7.26.3'),
(65, 'Fetched all programs', '06/10/20 01:22:51pm', '::1', 'PostmanRuntime/7.26.3'),
(66, 'Fetched all programs', '06/10/20 01:22:52pm', '::1', 'PostmanRuntime/7.26.3'),
(67, 'Fetched all programs', '06/10/20 01:22:53pm', '::1', 'PostmanRuntime/7.26.3'),
(68, 'Fetched all programs', '06/10/20 01:22:54pm', '::1', 'PostmanRuntime/7.26.3'),
(69, 'Fetched all programs', '06/10/20 01:22:55pm', '::1', 'PostmanRuntime/7.26.3'),
(70, 'Fetched all programs', '06/10/20 01:22:55pm', '::1', 'PostmanRuntime/7.26.3'),
(71, 'Fetched all programs', '06/10/20 01:26:47pm', '::1', 'PostmanRuntime/7.26.3'),
(72, 'Fetched all programs', '06/10/20 01:26:49pm', '::1', 'PostmanRuntime/7.26.3'),
(73, 'Fetched all programs', '06/10/20 01:44:04pm', '::1', 'Safari/537.36'),
(74, 'Fetched all programs', '06/10/20 01:50:12pm', '::1', 'PostmanRuntime/7.26.3'),
(75, 'Fetched all programs', '06/10/20 01:54:25pm', '::1', 'PostmanRuntime/7.26.3'),
(76, 'Fetched all programs', '06/10/20 01:54:27pm', '::1', 'PostmanRuntime/7.26.3'),
(77, 'Fetched all programs', '06/10/20 01:54:29pm', '::1', 'PostmanRuntime/7.26.3'),
(78, 'Fetched all programs', '06/10/20 01:57:33pm', '::1', 'PostmanRuntime/7.26.3'),
(79, 'Fetched all programs', '06/10/20 01:57:35pm', '::1', 'PostmanRuntime/7.26.3'),
(80, 'Fetched all programs', '06/10/20 02:02:39pm', '::1', 'Safari/537.36'),
(81, 'Fetched all programs', '06/10/20 02:02:42pm', '::1', 'Safari/537.36'),
(82, 'Fetched all programs', '06/10/20 02:04:20pm', '::1', 'PostmanRuntime/7.26.3'),
(83, 'Fetched all programs', '06/10/20 02:04:22pm', '::1', 'PostmanRuntime/7.26.3'),
(84, 'Fetched all programs', '06/10/20 02:04:35pm', '::1', 'Safari/537.36'),
(85, 'Fetched all programs', '06/10/20 02:04:37pm', '::1', 'Safari/537.36'),
(86, 'Fetched all programs', '06/10/20 02:04:40pm', '::1', 'Safari/537.36'),
(87, 'Fetched all programs', '06/10/20 02:04:47pm', '::1', 'Safari/537.36'),
(88, 'Fetched all programs', '06/10/20 02:05:37pm', '::1', 'Safari/537.36'),
(89, 'Fetched all programs', '06/10/20 02:05:39pm', '::1', 'Safari/537.36'),
(90, 'Fetched all programs', '06/10/20 02:05:41pm', '::1', 'Safari/537.36'),
(91, 'Fetched all programs', '06/10/20 02:05:43pm', '::1', 'Safari/537.36'),
(92, 'Fetched all programs', '06/10/20 02:07:27pm', '::1', 'PostmanRuntime/7.26.3'),
(93, 'Fetched all programs', '06/10/20 02:07:29pm', '::1', 'PostmanRuntime/7.26.3'),
(94, 'Fetched all programs', '06/10/20 02:07:31pm', '::1', 'PostmanRuntime/7.26.3'),
(95, 'Fetched program ID: 1', '06/10/20 02:07:53pm', '::1', 'PostmanRuntime/7.26.3'),
(96, 'Fetched all programs', '06/10/20 02:09:08pm', '::1', 'Safari/537.36'),
(97, 'Fetched all programs', '06/10/20 02:09:43pm', '::1', 'Safari/537.36'),
(98, 'Fetched all programs', '06/10/20 02:09:45pm', '::1', 'Safari/537.36'),
(99, 'Fetched all programs', '06/10/20 02:09:47pm', '::1', 'Safari/537.36'),
(100, 'Fetched all programs', '06/10/20 02:09:49pm', '::1', 'Safari/537.36'),
(101, 'Fetched all programs', '06/10/20 02:09:51pm', '::1', 'Safari/537.36'),
(102, 'Fetched program ID: 1', '06/10/20 02:18:00pm', '::1', 'PostmanRuntime/7.26.3'),
(103, 'Fetched all programs', '06/10/20 02:18:05pm', '::1', 'Safari/537.36'),
(104, 'Fetched all programs', '06/10/20 02:18:08pm', '::1', 'Safari/537.36'),
(105, 'Fetched all programs', '06/10/20 02:20:13pm', '::1', 'Safari/537.36'),
(106, 'Fetched all programs', '06/10/20 02:20:49pm', '::1', 'Safari/537.36'),
(107, 'Fetched all programs', '06/10/20 02:22:22pm', '::1', 'Safari/537.36'),
(108, 'Fetched all programs', '06/10/20 02:22:40pm', '::1', 'Safari/537.36'),
(109, 'Fetched all programs', '06/10/20 02:22:58pm', '::1', 'Safari/537.36'),
(110, 'Fetched all programs', '06/10/20 02:23:44pm', '::1', 'Safari/537.36'),
(111, 'Fetched all programs', '06/10/20 07:16:07pm', '::1', 'Safari/537.36'),
(112, 'Fetched all programs', '06/10/20 07:16:23pm', '::1', 'Safari/537.36'),
(113, 'Fetched all programs', '06/10/20 07:17:13pm', '::1', 'Safari/537.36'),
(114, 'Fetched all programs', '10/10/20 11:26:29pm', '::1', 'Safari/537.36'),
(115, 'admin logged in', '10/10/20 11:26:42pm', '::1', 'Safari/537.36'),
(116, 'admin logged in', '10/10/20 11:27:07pm', '::1', 'Safari/537.36'),
(117, 'Fetched all programs', '11/10/20 10:43:49pm', '::1', 'Safari/537.36'),
(118, 'admin logged in', '11/10/20 10:45:33pm', '::1', 'Safari/537.36'),
(119, 'norm888@norm.com signed up', '11/10/20 10:47:25pm', '::1', 'Safari/537.36'),
(120, 'admin logged in', '11/10/20 10:48:13pm', '::1', 'Safari/537.36'),
(121, 'find classes by : Tue', '11/10/20 10:49:02pm', '::1', 'Safari/537.36'),
(122, 'find classes by : Mon', '11/10/20 10:49:09pm', '::1', 'Safari/537.36'),
(123, 'find classes by : Thu', '11/10/20 10:49:13pm', '::1', 'Safari/537.36'),
(124, 'find classes by : Thu', '11/10/20 11:11:49pm', '::1', 'Safari/537.36'),
(125, 'find classes by : Thu', '11/10/20 11:11:52pm', '::1', 'Safari/537.36'),
(126, 'find classes by : Thu', '11/10/20 11:11:55pm', '::1', 'Safari/537.36'),
(127, 'find classes by : Mon', '11/10/20 11:11:58pm', '::1', 'Safari/537.36'),
(128, 'find classes by : Wed', '11/10/20 11:12:04pm', '::1', 'Safari/537.36'),
(129, 'find classes by : Sat', '11/10/20 11:12:11pm', '::1', 'Safari/537.36'),
(130, 'find classes by : Thu', '11/10/20 11:13:58pm', '::1', 'Safari/537.36'),
(131, 'Fetched all programs', '11/10/20 11:16:15pm', '::1', 'Safari/537.36'),
(132, 'Fetched all programs', '11/10/20 11:17:05pm', '::1', 'Safari/537.36'),
(133, 'Fetched all programs', '11/10/20 11:19:19pm', '::1', 'Safari/537.36'),
(134, 'Fetched all programs', '11/10/20 11:27:16pm', '::1', 'Safari/537.36'),
(135, 'Fetched all programs', '11/10/20 11:29:00pm', '::1', 'Safari/537.36'),
(136, 'Fetched all programs', '11/10/20 11:29:26pm', '::1', 'Safari/537.36'),
(137, 'Fetched all programs', '11/10/20 11:31:02pm', '::1', 'Safari/537.36'),
(138, 'Fetched all programs', '11/10/20 11:32:10pm', '::1', 'Safari/537.36'),
(139, 'Fetched all programs', '11/10/20 11:36:23pm', '::1', 'Safari/537.36'),
(140, 'Fetched all programs', '11/10/20 11:38:15pm', '::1', 'Safari/537.36'),
(141, 'Norm logged in', '11/10/20 11:41:13pm', '::1', 'Safari/537.36'),
(142, 'Fetched all programs', '11/10/20 11:49:20pm', '::1', 'Safari/537.36'),
(143, 'mnsxdg@abc.com signed up', '11/10/20 11:50:43pm', '::1', 'Safari/537.36'),
(144, 'Fetched all programs', '11/10/20 11:51:15pm', '::1', 'Safari/537.36'),
(145, 'Norm logged in', '11/10/20 11:51:30pm', '::1', 'Safari/537.36'),
(146, 'Fetched all programs', '11/10/20 11:57:35pm', '::1', 'Safari/537.36'),
(147, 'Fetched all programs', '12/10/20 12:16:14am', '::1', 'Safari/537.36'),
(148, 'Fetched program ID: 1', '12/10/20 12:30:55am', '::1', 'PostmanRuntime/7.26.3'),
(149, 'find classes by : Tue', '12/10/20 12:31:13am', '::1', 'PostmanRuntime/7.26.3'),
(150, 'find classes by : Tue', '12/10/20 12:36:31am', '::1', 'PostmanRuntime/7.26.3'),
(151, 'Fetched all programs', '12/10/20 01:54:35am', '::1', 'Safari/537.36'),
(152, 'Fetched all programs', '12/10/20 01:57:26am', '::1', 'Safari/537.36'),
(153, 'find classes by : Tue', '12/10/20 02:02:26am', '::1', 'Safari/537.36'),
(154, 'find classes by : Mon', '12/10/20 02:02:31am', '::1', 'Safari/537.36'),
(155, 'Fetched all programs', '12/10/20 02:05:16am', '::1', 'Safari/537.36'),
(156, 'find classes by : Mon', '12/10/20 02:05:26am', '::1', 'Safari/537.36'),
(157, 'Fetched all programs', '12/10/20 02:07:24am', '::1', 'Safari/537.36'),
(158, 'find classes by : Mon', '12/10/20 02:07:43am', '::1', 'Safari/537.36'),
(159, 'Fetched all programs', '12/10/20 02:11:48am', '::1', 'Safari/537.36'),
(160, 'Fetched all programs', '12/10/20 02:14:04am', '::1', 'Safari/537.36'),
(161, 'Fetched all programs', '12/10/20 02:15:12am', '::1', 'Safari/537.36'),
(162, 'Fetched all programs', '12/10/20 02:15:42am', '::1', 'Safari/537.36'),
(163, 'find classes by : Mon', '12/10/20 02:15:52am', '::1', 'Safari/537.36'),
(164, 'Fetched all programs', '12/10/20 09:20:55am', '::1', 'Safari/537.36'),
(165, 'Fetched all programs', '12/10/20 09:31:17am', '::1', 'Safari/537.36'),
(166, 'find classes by : Thu', '12/10/20 09:31:33am', '::1', 'Safari/537.36'),
(167, 'Fetched all programs', '12/10/20 01:44:06pm', '::1', 'Safari/537.36'),
(168, 'Fetched all programs', '12/10/20 01:44:18pm', '::1', 'Safari/537.36'),
(169, 'Fetched all programs', '12/10/20 01:44:58pm', '::1', 'Safari/537.36'),
(170, 'Fetched all programs', '12/10/20 01:46:05pm', '::1', 'Safari/537.36'),
(171, 'Fetched all programs', '12/10/20 01:47:55pm', '::1', 'Safari/537.36'),
(172, 'Fetched all programs', '12/10/20 01:47:58pm', '::1', 'Safari/537.36'),
(173, 'Fetched all programs', '12/10/20 01:48:47pm', '::1', 'Safari/537.36'),
(174, 'admin logged in', '12/10/20 01:49:19pm', '::1', 'Safari/537.36'),
(175, 'Fetched all programs', '12/10/20 01:51:23pm', '::1', 'Safari/537.36'),
(176, 'Fetched all programs', '12/10/20 01:54:09pm', '::1', 'Safari/537.36'),
(177, 'Fetched all programs', '12/10/20 02:02:40pm', '::1', 'Safari/537.36'),
(178, 'Fetched all programs', '12/10/20 02:03:56pm', '::1', 'Safari/537.36'),
(179, 'Fetched all programs', '12/10/20 02:03:58pm', '::1', 'Safari/537.36'),
(180, 'Fetched all programs', '12/10/20 02:04:59pm', '::1', 'Safari/537.36'),
(181, 'Fetched all programs', '12/10/20 02:05:47pm', '::1', 'Safari/537.36'),
(182, 'Norm logged in', '12/10/20 03:40:06pm', '::1', 'Safari/537.36'),
(183, 'Fetched all programs', '12/10/20 03:40:24pm', '::1', 'Safari/537.36'),
(184, 'Fetched all programs', '12/10/20 03:40:39pm', '::1', 'Safari/537.36'),
(185, 'Fetched all programs', '12/10/20 03:40:49pm', '::1', 'Safari/537.36'),
(186, 'Fetched all programs', '12/10/20 03:41:22pm', '::1', 'Safari/537.36'),
(187, 'Fetched all programs', '12/10/20 03:42:04pm', '::1', 'Safari/537.36'),
(188, 'Norm logged in', '12/10/20 03:42:26pm', '::1', 'Safari/537.36'),
(189, 'Fetched all programs', '12/10/20 03:42:39pm', '::1', 'Safari/537.36'),
(190, 'Fetched all programs', '12/10/20 03:42:58pm', '::1', 'Safari/537.36'),
(191, 'Fetched all programs', '12/10/20 03:44:25pm', '::1', 'Safari/537.36'),
(192, 'Fetched all programs', '12/10/20 07:12:06pm', '::1', 'Safari/537.36'),
(193, 'find classes by : Mon', '12/10/20 07:12:22pm', '::1', 'Safari/537.36'),
(194, 'Fetched all programs', '12/10/20 07:25:41pm', '::1', 'Safari/537.36'),
(195, 'Fetched all programs', '12/10/20 07:27:52pm', '::1', 'Safari/537.36'),
(196, 'find classes by : Mon', '12/10/20 07:28:00pm', '::1', 'Safari/537.36'),
(197, 'Fetched all programs', '12/10/20 07:32:13pm', '::1', 'Safari/537.36'),
(198, 'find classes by : Mon', '12/10/20 07:32:27pm', '::1', 'Safari/537.36'),
(199, 'find classes by : Mon', '12/10/20 07:32:31pm', '::1', 'Safari/537.36'),
(200, 'find classes by : Mon', '12/10/20 07:33:18pm', '::1', 'Safari/537.36'),
(201, 'Fetched all programs', '12/10/20 07:34:08pm', '::1', 'Safari/537.36'),
(202, 'Fetched all programs', '12/10/20 07:34:33pm', '::1', 'Safari/537.36'),
(203, 'Fetched all programs', '12/10/20 07:35:01pm', '::1', 'Safari/537.36'),
(204, 'find classes by : Mon', '12/10/20 07:35:10pm', '::1', 'Safari/537.36'),
(205, 'Fetched all programs', '12/10/20 07:40:39pm', '::1', 'Safari/537.36'),
(206, 'find classes by : Wed', '12/10/20 07:41:04pm', '::1', 'Safari/537.36'),
(207, 'find classes by : 4', '12/10/20 07:44:56pm', '::1', 'PostmanRuntime/7.26.3'),
(208, 'find classes by : 4', '12/10/20 07:45:47pm', '::1', 'PostmanRuntime/7.26.3'),
(209, 'find classes by : 2', '12/10/20 07:45:53pm', '::1', 'PostmanRuntime/7.26.3'),
(210, 'find classes by : 2', '12/10/20 07:46:12pm', '::1', 'PostmanRuntime/7.26.3'),
(211, 'find classes by : 3', '12/10/20 07:46:20pm', '::1', 'PostmanRuntime/7.26.3'),
(212, 'find classes by : 1', '12/10/20 07:46:26pm', '::1', 'PostmanRuntime/7.26.3'),
(213, 'find classes by : 1', '12/10/20 07:50:42pm', '::1', 'PostmanRuntime/7.26.3'),
(214, 'find classes by : 2', '12/10/20 07:50:51pm', '::1', 'PostmanRuntime/7.26.3'),
(215, 'find classes by : 3', '12/10/20 07:50:57pm', '::1', 'PostmanRuntime/7.26.3'),
(216, 'find classes by : 5', '12/10/20 07:51:02pm', '::1', 'PostmanRuntime/7.26.3'),
(217, 'find classes by : 4', '12/10/20 07:51:08pm', '::1', 'PostmanRuntime/7.26.3'),
(218, 'find classes by : 1', '12/10/20 07:51:13pm', '::1', 'PostmanRuntime/7.26.3'),
(219, 'find classes by : 2', '12/10/20 07:52:10pm', '::1', 'PostmanRuntime/7.26.3'),
(220, 'find classes by : 3', '12/10/20 07:52:16pm', '::1', 'PostmanRuntime/7.26.3'),
(221, 'find classes by : 3', '12/10/20 08:14:35pm', '::1', 'PostmanRuntime/7.26.3'),
(222, 'Fetched all programs', '12/10/20 10:46:08pm', '::1', 'Safari/537.36'),
(223, 'find classes by : Fri', '12/10/20 10:46:15pm', '::1', 'Safari/537.36'),
(224, 'find classes by : 1', '12/10/20 10:46:19pm', '::1', 'Safari/537.36'),
(225, 'find classes by : 2', '12/10/20 10:46:53pm', '::1', 'Safari/537.36'),
(226, 'Fetched all programs', '12/10/20 10:47:43pm', '::1', 'Safari/537.36'),
(227, 'Fetched all programs', '12/10/20 10:49:59pm', '::1', 'Safari/537.36'),
(228, 'Fetched all programs', '12/10/20 10:51:50pm', '::1', 'Safari/537.36'),
(229, 'admin logged in', '12/10/20 10:52:13pm', '::1', 'Safari/537.36'),
(230, 'Fetched all programs', '12/10/20 10:52:42pm', '::1', 'Safari/537.36'),
(231, 'Fetched all programs', '12/10/20 10:53:47pm', '::1', 'Safari/537.36'),
(232, 'Fetched all programs', '12/10/20 10:53:54pm', '::1', 'Safari/537.36'),
(233, 'Fetched all programs', '13/10/20 09:01:39am', '::1', 'Safari/537.36'),
(234, 'find classes by : Mon', '13/10/20 09:15:58am', '::1', 'Safari/537.36'),
(235, 'find classes by : 4', '13/10/20 09:16:01am', '::1', 'Safari/537.36'),
(236, 'Fetched all programs', '13/10/20 09:25:20am', '::1', 'Safari/537.36'),
(237, 'find classes by : 1', '13/10/20 09:25:38am', '::1', 'Safari/537.36'),
(238, 'find classes by : 2', '13/10/20 09:25:40am', '::1', 'Safari/537.36'),
(239, 'Fetched all programs', '13/10/20 09:27:13am', '::1', 'Safari/537.36'),
(240, 'find classes by : Mon', '13/10/20 09:27:21am', '::1', 'Safari/537.36'),
(241, 'find classes by : 7', '13/10/20 09:27:24am', '::1', 'Safari/537.36'),
(242, 'Fetched all programs', '13/10/20 10:04:10am', '::1', 'Safari/537.36'),
(243, 'Fetched all programs', '13/10/20 10:10:56am', '::1', 'Safari/537.36'),
(244, 'Fetched all programs', '13/10/20 10:11:22am', '::1', 'Safari/537.36'),
(245, 'admin logged in', '13/10/20 10:11:36am', '::1', 'Safari/537.36'),
(246, 'admin logged in', '13/10/20 10:29:41am', '::1', 'Safari/537.36'),
(247, 'Fetched all programs', '13/10/20 10:40:05am', '::1', 'Safari/537.36'),
(248, 'admin logged in', '13/10/20 10:40:37am', '::1', 'Safari/537.36'),
(249, 'admin logged in', '13/10/20 10:41:59am', '::1', 'Safari/537.36'),
(250, 'Fetched all programs', '13/10/20 10:42:26am', '::1', 'Safari/537.36'),
(251, 'Fetched all programs', '13/10/20 10:43:43am', '::1', 'Safari/537.36'),
(252, 'admin logged in', '13/10/20 10:43:57am', '::1', 'Safari/537.36'),
(253, 'Fetched all programs', '13/10/20 10:55:04am', '::1', 'Safari/537.36'),
(254, 'admin logged in', '13/10/20 10:55:31am', '::1', 'Safari/537.36'),
(255, 'admin logged in', '13/10/20 10:56:41am', '::1', 'Safari/537.36'),
(256, 'Fetched all programs', '13/10/20 10:56:52am', '::1', 'Safari/537.36'),
(257, 'admin logged in', '13/10/20 10:57:16am', '::1', 'Safari/537.36'),
(258, 'admin logged in', '13/10/20 10:58:58am', '::1', 'Safari/537.36'),
(259, 'admin logged in', '13/10/20 11:00:59am', '::1', 'Safari/537.36'),
(260, 'Fetched all programs', '13/10/20 11:02:11am', '::1', 'Safari/537.36'),
(261, 'Fetched all programs', '13/10/20 11:02:27am', '::1', 'Safari/537.36'),
(262, 'Norm logged in', '13/10/20 11:02:43am', '::1', 'Safari/537.36'),
(263, 'Fetched all programs', '13/10/20 11:04:00am', '::1', 'Safari/537.36'),
(264, 'Norm logged in', '13/10/20 11:04:36am', '::1', 'Safari/537.36'),
(265, 'Norm logged in', '13/10/20 11:07:31am', '::1', 'Safari/537.36'),
(266, 'Fetched all programs', '13/10/20 11:07:44am', '::1', 'Safari/537.36'),
(267, 'admin logged in', '13/10/20 11:07:56am', '::1', 'Safari/537.36'),
(268, 'Fetched all programs', '13/10/20 11:08:51am', '::1', 'Safari/537.36'),
(269, 'Fetched all programs', '13/10/20 11:08:58am', '::1', 'Safari/537.36'),
(270, 'admin logged in', '13/10/20 11:09:08am', '::1', 'Safari/537.36'),
(271, 'Fetched all programs', '13/10/20 11:10:17am', '::1', 'Safari/537.36'),
(272, 'Fetched all programs', '13/10/20 11:10:23am', '::1', 'Safari/537.36'),
(273, 'admin logged in', '13/10/20 11:10:37am', '::1', 'Safari/537.36'),
(274, 'admin logged in', '13/10/20 11:13:25am', '::1', 'Safari/537.36'),
(275, 'Fetched all programs', '13/10/20 11:13:40am', '::1', 'Safari/537.36'),
(276, 'admin logged in', '13/10/20 11:14:46am', '::1', 'Safari/537.36'),
(277, 'Fetched all programs', '13/10/20 11:17:44am', '::1', 'Safari/537.36'),
(278, 'admin logged in', '13/10/20 11:18:00am', '::1', 'Safari/537.36'),
(279, 'admin logged in', '13/10/20 11:20:42am', '::1', 'Safari/537.36'),
(280, 'admin logged in', '13/10/20 11:20:59am', '::1', 'Safari/537.36'),
(281, 'Fetched all programs', '13/10/20 11:21:55am', '::1', 'Safari/537.36'),
(282, 'Norm logged in', '13/10/20 11:22:14am', '::1', 'Safari/537.36'),
(283, 'Fetched all programs', '13/10/20 12:42:42pm', '::1', 'Safari/537.36'),
(284, 'Fetched all programs', '13/10/20 12:42:53pm', '::1', 'Chrome-Lighthouse'),
(285, 'Fetched all programs', '13/10/20 12:43:36pm', '::1', 'Safari/537.36'),
(286, 'admin logged in', '13/10/20 12:45:41pm', '::1', 'Safari/537.36'),
(287, 'Fetched all programs', '13/10/20 01:18:16pm', '::1', 'Safari/537.36'),
(288, 'find classes by : 1', '13/10/20 01:18:24pm', '::1', 'Safari/537.36'),
(289, 'find classes by : 1', '13/10/20 01:18:32pm', '::1', 'Safari/537.36'),
(290, 'find classes by : 1', '13/10/20 01:18:35pm', '::1', 'Safari/537.36'),
(291, 'find classes by : 1', '13/10/20 01:18:44pm', '::1', 'Safari/537.36'),
(292, 'find classes by : 1', '13/10/20 01:18:46pm', '::1', 'Safari/537.36'),
(293, 'find classes by : 1', '13/10/20 01:19:15pm', '::1', 'Safari/537.36'),
(294, 'find classes by : 1', '13/10/20 01:19:17pm', '::1', 'Safari/537.36'),
(295, 'find classes by : 1', '13/10/20 01:19:22pm', '::1', 'Safari/537.36'),
(296, 'find classes by : 1', '13/10/20 01:19:27pm', '::1', 'Safari/537.36'),
(297, 'find classes by : 1', '13/10/20 01:19:31pm', '::1', 'Safari/537.36'),
(298, 'find classes by : 1', '13/10/20 01:19:40pm', '::1', 'Safari/537.36'),
(299, 'find classes by : 1', '13/10/20 01:19:42pm', '::1', 'Safari/537.36'),
(300, 'find classes by : 1', '13/10/20 01:20:15pm', '::1', 'Safari/537.36'),
(301, 'find classes by : 1', '13/10/20 01:20:21pm', '::1', 'Safari/537.36'),
(302, 'find classes by : 1', '13/10/20 01:21:39pm', '::1', 'Safari/537.36'),
(303, 'find classes by : 1', '13/10/20 01:21:41pm', '::1', 'Safari/537.36'),
(304, 'find classes by : 1', '13/10/20 01:21:57pm', '::1', 'Safari/537.36'),
(305, 'find classes by : 1', '13/10/20 01:22:00pm', '::1', 'Safari/537.36'),
(306, 'find classes by : 1', '13/10/20 01:22:42pm', '::1', 'Safari/537.36'),
(307, 'find classes by : 1', '13/10/20 01:22:52pm', '::1', 'Safari/537.36'),
(308, 'find classes by : 1', '13/10/20 01:24:33pm', '::1', 'Safari/537.36'),
(309, 'find classes by : 1', '13/10/20 01:24:37pm', '::1', 'Safari/537.36'),
(310, 'find classes by : 1', '13/10/20 01:24:41pm', '::1', 'Safari/537.36'),
(311, 'find classes by : 1', '13/10/20 01:25:04pm', '::1', 'Safari/537.36'),
(312, 'find classes by : 1', '13/10/20 01:25:09pm', '::1', 'Safari/537.36'),
(313, 'find classes by : 1', '13/10/20 01:27:24pm', '::1', 'Safari/537.36'),
(314, 'find classes by : 1', '13/10/20 01:27:29pm', '::1', 'Safari/537.36'),
(315, 'find classes by : 1', '13/10/20 01:30:24pm', '::1', 'Safari/537.36'),
(316, 'find classes by : 1', '13/10/20 01:30:29pm', '::1', 'Safari/537.36'),
(317, 'find classes by : 1', '13/10/20 01:30:33pm', '::1', 'Safari/537.36'),
(318, 'find classes by : 1', '13/10/20 01:30:48pm', '::1', 'Safari/537.36'),
(319, 'find classes by : 1', '13/10/20 01:31:05pm', '::1', 'Safari/537.36'),
(320, 'find classes by : 1', '13/10/20 01:31:10pm', '::1', 'Safari/537.36'),
(321, 'find classes by : 1', '13/10/20 01:31:14pm', '::1', 'Safari/537.36'),
(322, 'find classes by : 1', '13/10/20 01:31:34pm', '::1', 'Safari/537.36'),
(323, 'Fetched all programs', '13/10/20 01:32:43pm', '::1', 'Safari/537.36'),
(324, 'find classes by : 1', '13/10/20 01:32:50pm', '::1', 'Safari/537.36'),
(325, 'Fetched all programs', '13/10/20 01:44:21pm', '::1', 'Safari/537.36'),
(326, 'find classes by : 1', '13/10/20 01:44:34pm', '::1', 'Safari/537.36'),
(327, 'find classes by : 1', '13/10/20 01:44:37pm', '::1', 'Safari/537.36'),
(328, 'find classes by : 1', '13/10/20 01:44:41pm', '::1', 'Safari/537.36'),
(329, 'find classes by : 1', '13/10/20 01:44:46pm', '::1', 'Safari/537.36'),
(330, 'find classes by : 1', '13/10/20 01:44:50pm', '::1', 'Safari/537.36'),
(331, 'find classes by : 1', '13/10/20 01:44:54pm', '::1', 'Safari/537.36'),
(332, 'find classes by : 1', '13/10/20 01:44:57pm', '::1', 'Safari/537.36'),
(333, 'find classes by : 1', '13/10/20 01:45:04pm', '::1', 'Safari/537.36'),
(334, 'find classes by : 1', '13/10/20 01:45:07pm', '::1', 'Safari/537.36'),
(335, 'Fetched all programs', '13/10/20 01:45:47pm', '::1', 'Safari/537.36'),
(336, 'find classes by : Mon', '13/10/20 01:45:59pm', '::1', 'Safari/537.36'),
(337, 'find classes by : Mon', '13/10/20 01:46:03pm', '::1', 'Safari/537.36'),
(338, 'find classes by : Mon', '13/10/20 01:46:12pm', '::1', 'Safari/537.36'),
(339, 'find classes by : Mon', '13/10/20 01:46:15pm', '::1', 'Safari/537.36'),
(340, 'find classes by : Mon', '13/10/20 01:46:22pm', '::1', 'Safari/537.36'),
(341, 'find classes by : 1', '13/10/20 01:47:31pm', '::1', 'Safari/537.36'),
(342, 'find classes by : 1', '13/10/20 01:47:39pm', '::1', 'Safari/537.36'),
(343, 'find classes by : 1', '13/10/20 01:47:45pm', '::1', 'Safari/537.36'),
(344, 'find classes by : 1', '13/10/20 01:47:48pm', '::1', 'Safari/537.36'),
(345, 'find classes by : 1', '13/10/20 01:47:53pm', '::1', 'Safari/537.36'),
(346, 'find classes by : 1', '13/10/20 01:47:56pm', '::1', 'Safari/537.36'),
(347, 'find classes by : 1', '13/10/20 01:48:00pm', '::1', 'Safari/537.36'),
(348, 'find classes by : 1', '13/10/20 01:48:03pm', '::1', 'Safari/537.36'),
(349, 'find classes by : 1', '13/10/20 01:48:05pm', '::1', 'Safari/537.36'),
(350, 'find classes by : 1', '13/10/20 01:48:07pm', '::1', 'Safari/537.36'),
(351, 'find classes by : 1', '13/10/20 01:49:19pm', '::1', 'Safari/537.36'),
(352, 'find classes by : 1', '13/10/20 01:49:23pm', '::1', 'Safari/537.36'),
(353, 'find classes by : 1', '13/10/20 01:49:27pm', '::1', 'Safari/537.36'),
(354, 'find classes by : 1', '13/10/20 01:49:29pm', '::1', 'Safari/537.36'),
(355, 'find classes by : 1', '13/10/20 01:49:31pm', '::1', 'Safari/537.36'),
(356, 'find classes by : 1', '13/10/20 01:49:33pm', '::1', 'Safari/537.36'),
(357, 'find classes by : 1', '13/10/20 01:49:35pm', '::1', 'Safari/537.36'),
(358, 'find classes by : 1', '13/10/20 01:49:40pm', '::1', 'Safari/537.36'),
(359, 'Fetched all programs', '13/10/20 02:07:07pm', '::1', 'Safari/537.36'),
(360, 'Fetched all programs', '13/10/20 02:17:31pm', '::1', 'Safari/537.36'),
(361, 'Fetched all programs', '13/10/20 02:27:28pm', '::1', 'Safari/537.36'),
(362, 'Fetched all programs', '13/10/20 02:30:31pm', '::1', 'Safari/537.36'),
(363, 'Fetched all programs', '13/10/20 02:30:37pm', '::1', 'Safari/537.36'),
(364, 'Fetched all programs', '13/10/20 02:31:16pm', '::1', 'Safari/537.36'),
(365, 'find classes by : 1', '13/10/20 02:31:23pm', '::1', 'Safari/537.36'),
(366, 'Fetched all programs', '17/10/20 10:06:57pm', '::1', 'Safari/537.36'),
(367, 'admin logged in', '17/10/20 10:07:08pm', '::1', 'Safari/537.36'),
(368, 'Norm logged in', '17/10/20 10:09:14pm', '::1', 'Safari/537.36'),
(369, 'find classes by : 2', '17/10/20 10:11:39pm', '::1', 'Safari/537.36'),
(370, 'find classes by : 5', '17/10/20 10:11:42pm', '::1', 'Safari/537.36'),
(371, 'Fetched all programs', '17/10/20 10:14:34pm', '::1', 'Safari/537.36'),
(372, 'Fetched all programs', '17/10/20 10:21:00pm', '::1', 'Safari/537.36'),
(373, 'Fetched all programs', '17/10/20 10:25:11pm', '::1', 'Safari/537.36'),
(374, 'Fetched all programs', '17/10/20 10:31:30pm', '::1', 'Safari/537.36'),
(375, 'Fetched all programs', '17/10/20 10:35:36pm', '::1', 'Safari/537.36'),
(376, 'nan@nan.com signed up', '17/10/20 10:36:16pm', '::1', 'Safari/537.36'),
(377, 'nan logged in', '17/10/20 10:37:48pm', '::1', 'Safari/537.36'),
(378, 'find classes by : 3', '17/10/20 10:38:28pm', '::1', 'Safari/537.36'),
(379, 'find classes by : 8', '17/10/20 10:39:27pm', '::1', 'Safari/537.36'),
(380, 'User ID: 21 enrolled class 8', '17/10/20 10:44:31pm', '::1', 'Safari/537.36'),
(381, 'Fetched all enrollments', '17/10/20 10:45:13pm', '::1', 'Safari/537.36'),
(382, 'Fetched all programs', '17/10/20 10:45:51pm', '::1', 'Safari/537.36'),
(383, 'Fetched all programs', '17/10/20 11:03:22pm', '::1', 'Safari/537.36'),
(384, 'find classes by : Mon', '17/10/20 11:03:35pm', '::1', 'Safari/537.36'),
(385, 'Fetched all programs', '17/10/20 11:10:37pm', '::1', 'Safari/537.36'),
(386, 'Norm logged in', '17/10/20 11:11:12pm', '::1', 'Safari/537.36'),
(387, 'Fetched all programs', '17/10/20 11:12:28pm', '::1', 'Safari/537.36'),
(388, 'Fetched all programs', '17/10/20 11:12:34pm', '::1', 'Safari/537.36'),
(389, 'find classes by : 4', '17/10/20 11:14:22pm', '::1', 'Safari/537.36'),
(390, 'Fetched all programs', '17/10/20 11:18:34pm', '::1', 'Safari/537.36'),
(391, 'Norm logged in', '17/10/20 11:18:59pm', '::1', 'Safari/537.36'),
(392, 'Fetched all enrollments', '17/10/20 11:19:04pm', '::1', 'Safari/537.36'),
(393, 'Fetched all programs', '17/10/20 11:23:05pm', '::1', 'Safari/537.36'),
(394, 'find classes by : Mon', '17/10/20 11:23:13pm', '::1', 'Safari/537.36'),
(395, 'find classes by : 1', '17/10/20 11:23:15pm', '::1', 'Safari/537.36'),
(396, 'Fetched all programs', '17/10/20 11:25:43pm', '::1', 'Safari/537.36'),
(397, 'find classes by : Tue', '17/10/20 11:27:47pm', '::1', 'Safari/537.36'),
(398, 'find classes by : 10', '17/10/20 11:27:51pm', '::1', 'Safari/537.36'),
(399, 'Fetched all programs', '17/10/20 11:35:00pm', '::1', 'Safari/537.36'),
(400, 'find classes by : 1', '18/10/20 02:09:29am', '::1', 'Safari/537.36'),
(401, 'Fetched all programs', '18/10/20 02:09:35am', '::1', 'Safari/537.36'),
(402, 'Fetched all enrollments', '18/10/20 02:09:59am', '::1', 'Safari/537.36'),
(403, 'Fetched all programs', '18/10/20 02:10:11am', '::1', 'Safari/537.36'),
(404, 'nan logged in', '18/10/20 02:10:50am', '::1', 'Safari/537.36'),
(405, 'Fetched all programs', '18/10/20 02:11:21am', '::1', 'Safari/537.36'),
(406, 'nan logged in', '18/10/20 02:11:42am', '::1', 'Safari/537.36'),
(407, 'Fetched all programs', '18/10/20 02:13:57am', '::1', 'Safari/537.36'),
(408, 'Fetched all programs', '18/10/20 02:23:55am', '::1', 'Safari/537.36'),
(409, 'aaa@aaa.com signed up', '18/10/20 02:25:11am', '::1', 'Safari/537.36'),
(410, 'aaa logged in', '18/10/20 02:25:30am', '::1', 'Safari/537.36'),
(411, 'find classes by : 2', '18/10/20 02:25:48am', '::1', 'Safari/537.36'),
(412, 'find classes by : 4', '18/10/20 02:25:55am', '::1', 'Safari/537.36'),
(413, 'User ID: 22 enrolled class 4', '18/10/20 02:30:06am', '::1', 'Safari/537.36'),
(414, 'Fetched all enrollments', '18/10/20 02:30:20am', '::1', 'Safari/537.36'),
(415, 'Fetched all enrollments', '18/10/20 02:31:37am', '::1', 'Safari/537.36'),
(416, 'Fetched all enrollments', '18/10/20 02:31:51am', '::1', 'Safari/537.36'),
(417, 'Fetched all enrollments', '18/10/20 02:32:47am', '::1', 'Safari/537.36'),
(418, 'Fetched all programs', '18/10/20 02:35:57am', '::1', 'Safari/537.36'),
(419, 'Fetched all programs', '18/10/20 02:39:44am', '::1', 'Safari/537.36'),
(420, 'Fetched all programs', '18/10/20 02:41:29am', '::1', 'Safari/537.36'),
(421, 'Fetched all programs', '18/10/20 02:43:49am', '::1', 'Safari/537.36'),
(422, 'Fetched all programs', '18/10/20 02:50:48am', '::1', 'Safari/537.36'),
(423, 'find classes by : 1', '18/10/20 02:51:02am', '::1', 'Safari/537.36'),
(424, 'find classes by : 2', '18/10/20 02:51:04am', '::1', 'Safari/537.36'),
(425, 'Fetched all programs', '18/10/20 02:58:02am', '::1', 'Safari/537.36'),
(426, 'Fetched all programs', '18/10/20 02:58:30am', '::1', 'Safari/537.36'),
(427, 'find classes by : Mon', '18/10/20 03:00:02am', '::1', 'Safari/537.36'),
(428, 'find classes by : 1', '18/10/20 03:00:06am', '::1', 'Safari/537.36'),
(429, 'Fetched all programs', '18/10/20 03:00:46am', '::1', 'Safari/537.36'),
(430, 'Fetched all programs', '18/10/20 03:01:39am', '::1', 'Safari/537.36'),
(431, 'Fetched all programs', '18/10/20 03:01:41am', '::1', 'Safari/537.36'),
(432, 'Fetched all programs', '18/10/20 03:02:07am', '::1', 'Safari/537.36'),
(433, 'Fetched all programs', '18/10/20 03:02:27am', '::1', 'Safari/537.36'),
(434, 'Fetched all programs', '18/10/20 03:02:56am', '::1', 'Safari/537.36'),
(435, 'Fetched all programs', '18/10/20 03:03:14am', '::1', 'Safari/537.36'),
(436, 'Fetched all programs', '18/10/20 03:04:32am', '::1', 'Safari/537.36'),
(437, 'Fetched all programs', '18/10/20 03:05:08am', '::1', 'Safari/537.36'),
(438, 'Fetched all programs', '18/10/20 03:06:14am', '::1', 'Safari/537.36'),
(439, 'Fetched all programs', '18/10/20 03:06:44am', '::1', 'Safari/537.36'),
(440, 'Fetched all programs', '18/10/20 03:07:27am', '::1', 'Safari/537.36'),
(441, 'Fetched all programs', '18/10/20 03:08:06am', '::1', 'Safari/537.36'),
(442, 'Fetched all programs', '18/10/20 03:37:06am', '::1', 'Safari/537.36'),
(443, 'Fetched all programs', '18/10/20 03:37:14am', '::1', 'Safari/537.36'),
(444, 'Fetched all programs', '18/10/20 03:37:30am', '::1', 'Safari/537.36'),
(445, 'admin logged in', '18/10/20 03:40:56am', '::1', 'Safari/537.36'),
(446, 'Fetched all programs', '18/10/20 03:42:58am', '::1', 'Safari/537.36'),
(447, 'Fetched all programs', '18/10/20 03:43:07am', '::1', 'Safari/537.36'),
(448, 'admin logged in', '18/10/20 03:43:30am', '::1', 'Safari/537.36'),
(449, 'Fetched all programs', '18/10/20 03:44:38am', '::1', 'Safari/537.36'),
(450, 'Fetched all programs', '18/10/20 03:44:48am', '::1', 'Safari/537.36'),
(451, 'Fetched all programs', '18/10/20 03:44:55am', '::1', 'Safari/537.36'),
(452, 'Fetched all programs', '18/10/20 03:45:01am', '::1', 'Safari/537.36'),
(453, 'Fetched all programs', '18/10/20 03:46:46am', '::1', 'Safari/537.36'),
(454, 'Fetched all programs', '18/10/20 04:09:55am', '::1', 'Safari/537.36'),
(455, 'Fetched all programs', '18/10/20 04:10:03am', '::1', 'Safari/537.36'),
(456, 'Fetched all programs', '18/10/20 04:10:42am', '::1', 'Safari/537.36'),
(457, 'Fetched all programs', '18/10/20 04:14:09am', '::1', 'Safari/537.36'),
(458, 'Fetched all programs', '18/10/20 04:14:18am', '::1', 'Safari/537.36'),
(459, 'nan logged in', '18/10/20 04:14:51am', '::1', 'Safari/537.36'),
(460, 'Fetched all enrollments', '18/10/20 04:14:55am', '::1', 'Safari/537.36'),
(461, 'Fetched all enrollments', '18/10/20 04:15:59am', '::1', 'Safari/537.36'),
(462, 'Fetched all programs', '18/10/20 04:16:46am', '::1', 'Safari/537.36'),
(463, 'find classes by : 1', '18/10/20 04:23:24am', '::1', 'Safari/537.36'),
(464, 'find classes by : 2', '18/10/20 04:23:45am', '::1', 'Safari/537.36'),
(465, 'Fetched all programs', '18/10/20 04:23:56am', '::1', 'Safari/537.36'),
(466, 'find classes by : 1', '18/10/20 04:24:09am', '::1', 'Safari/537.36'),
(467, 'find classes by : 2', '18/10/20 04:24:24am', '::1', 'Safari/537.36'),
(468, 'Fetched all programs', '18/10/20 04:29:14am', '::1', 'Safari/537.36'),
(469, 'Fetched all programs', '18/10/20 04:30:38am', '::1', 'Safari/537.36'),
(470, 'Fetched all programs', '18/10/20 04:30:48am', '::1', 'Safari/537.36'),
(471, 'Fetched all programs', '18/10/20 04:31:41am', '::1', 'Safari/537.36'),
(472, 'Fetched all programs', '18/10/20 04:32:18am', '::1', 'Safari/537.36'),
(473, 'Fetched all programs', '18/10/20 04:33:12am', '::1', 'Safari/537.36'),
(474, 'Fetched all programs', '18/10/20 04:33:26am', '::1', 'Safari/537.36'),
(475, 'Fetched all programs', '18/10/20 04:30:24pm', '::1', 'Safari/537.36'),
(476, 'Fetched all programs', '18/10/20 04:30:36pm', '::1', 'Safari/537.36'),
(477, 'asdf@asdf.com signed up', '18/10/20 04:32:05pm', '::1', 'Safari/537.36'),
(478, 'asdf logged in', '18/10/20 04:32:20pm', '::1', 'Safari/537.36'),
(479, 'Fetched all programs', '18/10/20 04:32:24pm', '::1', 'Safari/537.36'),
(480, 'find classes by : 1', '18/10/20 04:32:40pm', '::1', 'Safari/537.36'),
(481, 'find classes by : 2', '18/10/20 04:32:51pm', '::1', 'Safari/537.36'),
(482, 'find classes by : 4', '18/10/20 04:32:55pm', '::1', 'Safari/537.36'),
(483, 'User ID: 23 enrolled class 4', '18/10/20 04:35:23pm', '::1', 'Safari/537.36'),
(484, 'Fetched all enrollments', '18/10/20 04:35:40pm', '::1', 'Safari/537.36'),
(485, 'Fetched all enrollments', '18/10/20 04:35:49pm', '::1', 'Safari/537.36'),
(486, 'Fetched all enrollments', '18/10/20 04:36:07pm', '::1', 'Safari/537.36'),
(487, 'Fetched all enrollments', '18/10/20 04:36:16pm', '::1', 'Safari/537.36'),
(488, 'Fetched all programs', '18/10/20 04:36:22pm', '::1', 'Safari/537.36'),
(489, 'Norm logged in', '18/10/20 04:37:35pm', '::1', 'Safari/537.36'),
(490, 'Fetched all enrollments', '18/10/20 04:38:00pm', '::1', 'Safari/537.36'),
(491, 'find classes by : 2', '18/10/20 04:38:10pm', '::1', 'Safari/537.36'),
(492, 'find classes by : 5', '18/10/20 04:38:12pm', '::1', 'Safari/537.36'),
(493, 'asdf logged in', '18/10/20 04:49:12pm', '::1', 'Safari/537.36'),
(494, 'Fetched all enrollments', '18/10/20 04:49:23pm', '::1', 'Safari/537.36'),
(495, 'Fetched all enrollments', '18/10/20 04:50:00pm', '::1', 'Safari/537.36'),
(496, 'Fetched all programs', '18/10/20 04:51:04pm', '::1', 'Safari/537.36'),
(497, 'find classes by : Mon', '18/10/20 04:51:27pm', '::1', 'Safari/537.36'),
(498, 'find classes by : 1', '18/10/20 04:51:33pm', '::1', 'Safari/537.36'),
(499, 'find classes by : Mon', '18/10/20 04:53:06pm', '::1', 'Safari/537.36'),
(500, 'find classes by : 7', '18/10/20 04:53:10pm', '::1', 'Safari/537.36'),
(501, 'Fetched all enrollments', '18/10/20 05:03:35pm', '::1', 'Safari/537.36'),
(502, 'Fetched all programs', '18/10/20 05:26:07pm', '::1', 'Safari/537.36'),
(503, 'find classes by : 1', '18/10/20 05:26:21pm', '::1', 'Safari/537.36'),
(504, 'find classes by : 1', '18/10/20 05:26:23pm', '::1', 'Safari/537.36'),
(505, 'Fetched all programs', '18/10/20 05:26:54pm', '::1', 'Safari/537.36'),
(506, 'Fetched all programs', '18/10/20 05:27:08pm', '::1', 'Safari/537.36'),
(507, 'Fetched all programs', '18/10/20 05:27:15pm', '::1', 'Safari/537.36'),
(508, 'find classes by : Wed', '18/10/20 05:27:21pm', '::1', 'Safari/537.36'),
(509, 'find classes by : 5', '18/10/20 05:27:23pm', '::1', 'Safari/537.36'),
(510, 'find classes by : Sat', '18/10/20 05:27:33pm', '::1', 'Safari/537.36'),
(511, 'find classes by : 13', '18/10/20 05:27:35pm', '::1', 'Safari/537.36'),
(512, 'nan logged in', '18/10/20 05:28:38pm', '::1', 'Safari/537.36'),
(513, 'Fetched all enrollments', '18/10/20 05:28:42pm', '::1', 'Safari/537.36'),
(514, 'Fetched all programs', '18/10/20 05:28:47pm', '::1', 'Safari/537.36'),
(515, 'Fetched all programs', '18/10/20 05:33:13pm', '::1', 'Safari/537.36'),
(516, 'find classes by : Mon', '18/10/20 05:33:20pm', '::1', 'Safari/537.36'),
(517, 'Fetched all enrollments', '18/10/20 05:33:44pm', '::1', 'Safari/537.36'),
(518, 'Fetched all programs', '18/10/20 05:37:24pm', '::1', 'Safari/537.36'),
(519, 'Fetched all programs', '18/10/20 05:57:02pm', '::1', 'Safari/537.36'),
(520, 'find classes by : 1', '18/10/20 05:57:12pm', '::1', 'Safari/537.36'),
(521, 'Fetched all programs', '18/10/20 05:57:35pm', '::1', 'Safari/537.36'),
(522, 'Fetched all programs', '18/10/20 06:07:18pm', '::1', 'Safari/537.36'),
(523, 'Fetched all programs', '18/10/20 06:07:27pm', '::1', 'Safari/537.36'),
(524, 'Fetched all programs', '18/10/20 06:21:31pm', '::1', 'Safari/537.36'),
(525, 'Fetched all programs', '18/10/20 07:09:54pm', '::1', 'Safari/537.36'),
(526, 'nan logged in', '18/10/20 07:10:15pm', '::1', 'Safari/537.36'),
(527, 'Fetched all enrollments', '18/10/20 07:10:24pm', '::1', 'Safari/537.36'),
(528, 'Fetched all enrollments', '18/10/20 07:10:43pm', '::1', 'Safari/537.36'),
(529, 'Fetched all programs', '18/10/20 07:10:49pm', '::1', 'Safari/537.36'),
(530, 'Fetched all enrollments', '18/10/20 07:13:41pm', '::1', 'Safari/537.36'),
(531, 'Fetched all programs', '18/10/20 07:13:47pm', '::1', 'Safari/537.36'),
(532, 'Fetched all programs', '18/10/20 07:19:02pm', '::1', 'Safari/537.36'),
(533, 'Fetched all enrollments', '18/10/20 07:21:06pm', '::1', 'Safari/537.36'),
(534, 'Fetched all programs', '18/10/20 07:21:08pm', '::1', 'Safari/537.36'),
(535, 'Fetched all programs', '18/10/20 07:22:07pm', '::1', 'Safari/537.36'),
(536, 'Fetched all programs', '18/10/20 07:23:01pm', '::1', 'Safari/537.36'),
(537, 'Fetched all programs', '18/10/20 07:24:22pm', '::1', 'Safari/537.36'),
(538, 'Fetched all programs', '18/10/20 07:24:51pm', '::1', 'Safari/537.36'),
(539, 'Fetched all enrollments', '18/10/20 07:25:46pm', '::1', 'Safari/537.36'),
(540, 'Fetched all programs', '18/10/20 07:25:50pm', '::1', 'Safari/537.36'),
(541, 'Fetched all programs', '18/10/20 07:26:30pm', '::1', 'Safari/537.36'),
(542, 'Fetched all enrollments', '18/10/20 07:27:50pm', '::1', 'Safari/537.36'),
(543, 'Fetched all programs', '18/10/20 07:27:54pm', '::1', 'Safari/537.36'),
(544, 'Fetched all programs', '18/10/20 07:28:59pm', '::1', 'Safari/537.36'),
(545, 'Fetched all programs', '18/10/20 07:29:34pm', '::1', 'Safari/537.36'),
(546, 'Fetched all programs', '18/10/20 07:37:11pm', '::1', 'Safari/537.36'),
(547, 'Fetched all programs', '18/10/20 07:38:24pm', '::1', 'Safari/537.36'),
(548, 'Fetched all programs', '18/10/20 07:39:59pm', '::1', 'Safari/537.36'),
(549, 'Fetched all programs', '18/10/20 07:48:05pm', '::1', 'Safari/537.36'),
(550, 'Fetched all programs', '18/10/20 07:48:54pm', '::1', 'Safari/537.36'),
(551, 'Fetched all programs', '18/10/20 07:49:33pm', '::1', 'Safari/537.36'),
(552, 'Fetched all programs', '18/10/20 07:50:09pm', '::1', 'Safari/537.36'),
(553, 'Fetched all programs', '18/10/20 07:50:33pm', '::1', 'Safari/537.36'),
(554, 'Fetched all programs', '18/10/20 07:51:08pm', '::1', 'Safari/537.36'),
(555, 'Fetched all programs', '18/10/20 07:52:14pm', '::1', 'Safari/537.36'),
(556, 'Fetched all programs', '18/10/20 07:52:51pm', '::1', 'Safari/537.36'),
(557, 'Fetched all programs', '18/10/20 07:54:29pm', '::1', 'Safari/537.36'),
(558, 'Fetched all programs', '18/10/20 07:55:09pm', '::1', 'Safari/537.36'),
(559, 'Fetched all programs', '18/10/20 07:55:56pm', '::1', 'Safari/537.36'),
(560, 'Fetched all programs', '18/10/20 07:56:39pm', '::1', 'Safari/537.36'),
(561, 'Fetched all programs', '18/10/20 07:57:24pm', '::1', 'Safari/537.36'),
(562, 'Fetched all programs', '18/10/20 07:57:58pm', '::1', 'Safari/537.36'),
(563, 'Fetched all programs', '18/10/20 07:59:27pm', '::1', 'Safari/537.36'),
(564, 'Fetched all programs', '18/10/20 08:05:31pm', '::1', 'Safari/537.36'),
(565, 'find classes by : 1', '18/10/20 08:07:45pm', '::1', 'Safari/537.36'),
(566, 'find classes by : Mon', '18/10/20 08:07:54pm', '::1', 'Safari/537.36'),
(567, 'find classes by : 1', '18/10/20 08:09:04pm', '::1', 'Safari/537.36'),
(568, 'Norm logged in', '18/10/20 08:09:52pm', '::1', 'Safari/537.36'),
(569, 'Fetched all programs', '18/10/20 08:09:57pm', '::1', 'Safari/537.36'),
(570, 'Fetched all enrollments', '18/10/20 08:10:18pm', '::1', 'Safari/537.36'),
(571, 'asdf logged in', '18/10/20 08:10:46pm', '::1', 'Safari/537.36'),
(572, 'Fetched all enrollments', '18/10/20 08:10:51pm', '::1', 'Safari/537.36'),
(573, 'Fetched all programs', '18/10/20 08:11:19pm', '::1', 'Safari/537.36'),
(574, 'Fetched all programs', '18/10/20 09:27:43pm', '::1', 'Safari/537.36'),
(575, 'Fetched all programs', '18/10/20 09:27:54pm', '::1', 'Safari/537.36'),
(576, 'admin logged in', '18/10/20 09:28:05pm', '::1', 'Safari/537.36'),
(577, 'Fetched all programs', '18/10/20 10:03:28pm', '::1', 'Safari/537.36'),
(578, 'Fetched all programs', '18/10/20 10:03:32pm', '::1', 'Safari/537.36'),
(579, 'find classes by : 1', '18/10/20 10:03:37pm', '::1', 'Safari/537.36'),
(580, 'find classes by : 1', '18/10/20 10:03:41pm', '::1', 'Safari/537.36'),
(581, 'Norm logged in', '18/10/20 10:04:05pm', '::1', 'Safari/537.36'),
(582, 'Fetched all enrollments', '18/10/20 10:04:08pm', '::1', 'Safari/537.36'),
(583, 'Norm logged in', '18/10/20 10:06:09pm', '::1', 'Safari/537.36'),
(584, 'Fetched all enrollments', '18/10/20 10:06:16pm', '::1', 'Safari/537.36'),
(585, 'find classes by : 1', '18/10/20 10:06:35pm', '::1', 'Safari/537.36'),
(586, 'find classes by : 2', '18/10/20 10:06:39pm', '::1', 'Safari/537.36'),
(587, 'Fetched all programs', '18/10/20 10:07:36pm', '::1', 'Safari/537.36'),
(588, 'Fetched all programs', '18/10/20 10:22:33pm', '::1', 'Safari/537.36'),
(589, 'Fetched all enrollments', '18/10/20 10:22:36pm', '::1', 'Safari/537.36'),
(590, 'Fetched all programs', '18/10/20 10:23:30pm', '::1', 'Safari/537.36'),
(591, 'Fetched all programs', '18/10/20 10:24:11pm', '::1', 'Safari/537.36'),
(592, 'find classes by : 1', '18/10/20 10:24:16pm', '::1', 'Safari/537.36'),
(593, 'find classes by : 2', '18/10/20 10:24:22pm', '::1', 'Safari/537.36'),
(594, 'find classes by : 5', '18/10/20 10:24:29pm', '::1', 'Safari/537.36'),
(595, 'find classes by : 3', '18/10/20 10:24:49pm', '::1', 'Safari/537.36'),
(596, 'nan logged in', '18/10/20 10:29:07pm', '::1', 'Safari/537.36'),
(597, 'find classes by : Tue', '18/10/20 10:39:42pm', '::1', 'PostmanRuntime/7.26.5'),
(598, 'find classes by : 3', '18/10/20 10:41:03pm', '::1', 'PostmanRuntime/7.26.5'),
(599, 'find classes by : 3', '18/10/20 10:49:34pm', '::1', 'PostmanRuntime/7.26.5'),
(600, 'Fetched all enrollments', '18/10/20 10:50:37pm', '::1', 'PostmanRuntime/7.26.5'),
(601, 'find classes by : 8', '18/10/20 10:57:57pm', '::1', 'PostmanRuntime/7.26.5'),
(602, 'admin logged in', '18/10/20 11:01:16pm', '::1', 'Safari/537.36'),
(603, 'find classes by : 1', '18/10/20 11:01:29pm', '::1', 'Safari/537.36'),
(604, 'find classes by : 3', '18/10/20 11:01:33pm', '::1', 'Safari/537.36'),
(605, 'User ID: 3 enrolled class 3', '18/10/20 11:02:35pm', '::1', 'Safari/537.36'),
(606, 'Fetched all enrollments', '18/10/20 11:02:41pm', '::1', 'Safari/537.36'),
(607, 'bbb@bbb.com signed up', '18/10/20 11:19:24pm', '::1', 'Safari/537.36'),
(608, 'bbb logged in', '18/10/20 11:19:55pm', '::1', 'Safari/537.36'),
(609, 'find classes by : 1', '18/10/20 11:20:01pm', '::1', 'Safari/537.36'),
(610, 'User ID: 24 enrolled class 1', '18/10/20 11:20:07pm', '::1', 'Safari/537.36'),
(611, 'Fetched all enrollments', '18/10/20 11:20:14pm', '::1', 'Safari/537.36'),
(612, 'admin logged in', '18/10/20 11:34:58pm', '::1', 'Safari/537.36'),
(613, 'Fetched all enrollments', '18/10/20 11:35:04pm', '::1', 'Safari/537.36'),
(614, 'Fetched all programs', '18/10/20 11:55:22pm', '::1', 'Safari/537.36'),
(615, 'find classes by : Mon', '18/10/20 11:55:43pm', '::1', 'Safari/537.36'),
(616, 'admin logged in', '18/10/20 11:56:11pm', '::1', 'Safari/537.36'),
(617, 'Fetched all enrollments', '18/10/20 11:56:16pm', '::1', 'Safari/537.36'),
(618, 'nan logged in', '19/10/20 12:00:35am', '::1', 'Safari/537.36'),
(619, 'Fetched all programs', '19/10/20 12:01:54am', '::1', 'Safari/537.36'),
(620, 'Fetched all enrollments', '19/10/20 12:02:01am', '::1', 'Safari/537.36'),
(621, 'find classes by : 1', '19/10/20 12:02:13am', '::1', 'Safari/537.36'),
(622, 'find classes by : Tue', '19/10/20 12:02:17am', '::1', 'Safari/537.36'),
(623, 'Fetched all programs', '19/10/20 12:04:55am', '::1', 'Safari/537.36'),
(624, 'Fetched all programs', '19/10/20 12:34:10am', '::1', 'Safari/537.36'),
(625, 'Fetched all programs', '19/10/20 12:34:18am', '::1', 'Safari/537.36'),
(626, 'admin logged in', '19/10/20 12:34:43am', '::1', 'Safari/537.36'),
(627, 'Fetched all programs', '19/10/20 12:34:52am', '::1', 'Safari/537.36'),
(628, 'find classes by : Mon', '19/10/20 12:35:00am', '::1', 'Safari/537.36'),
(629, 'find classes by : 7', '19/10/20 12:35:03am', '::1', 'Safari/537.36'),
(630, 'Fetched all programs', '19/10/20 12:51:57am', '::1', 'Safari/537.36'),
(631, 'Fetched all programs', '19/10/20 12:52:30am', '::1', 'Safari/537.36'),
(632, 'Fetched all programs', '19/10/20 12:52:34am', '::1', 'Safari/537.36'),
(633, 'find classes by : 2', '19/10/20 12:52:54am', '::1', 'Safari/537.36'),
(634, 'find classes by : 5', '19/10/20 12:53:06am', '::1', 'Safari/537.36'),
(635, 'admin logged in', '19/10/20 12:53:38am', '::1', 'Safari/537.36'),
(636, 'ccc@ccc.com signed up', '19/10/20 01:11:09am', '::1', 'Safari/537.36'),
(637, 'ccc logged in', '19/10/20 01:11:24am', '::1', 'Safari/537.36'),
(638, 'Fetched all programs', '19/10/20 01:11:29am', '::1', 'Safari/537.36'),
(639, 'find classes by : 1', '19/10/20 01:11:59am', '::1', 'Safari/537.36'),
(640, 'find classes by : 2', '19/10/20 01:12:01am', '::1', 'Safari/537.36'),
(641, 'User ID: 25 enrolled class 2', '19/10/20 01:12:54am', '::1', 'Safari/537.36'),
(642, 'ccc logged in', '19/10/20 01:15:55am', '::1', 'Safari/537.36'),
(643, 'Fetched all enrollments', '19/10/20 01:22:31am', '::1', 'Safari/537.36'),
(644, 'Fetched all programs', '19/10/20 01:22:36am', '::1', 'Safari/537.36'),
(645, 'Fetched all enrollments', '19/10/20 01:23:18am', '::1', 'Safari/537.36'),
(646, 'ddd@ddd.com signed up', '19/10/20 01:26:14am', '::1', 'Safari/537.36'),
(647, 'ddd logged in', '19/10/20 01:26:27am', '::1', 'Safari/537.36'),
(648, 'Fetched all programs', '19/10/20 01:26:31am', '::1', 'Safari/537.36'),
(649, 'find classes by : 5', '19/10/20 01:26:49am', '::1', 'Safari/537.36'),
(650, 'find classes by : 14', '19/10/20 01:26:52am', '::1', 'Safari/537.36'),
(651, 'User ID: 26 enrolled class 14', '19/10/20 01:28:00am', '::1', 'Safari/537.36'),
(652, 'Fetched all enrollments', '19/10/20 01:28:06am', '::1', 'Safari/537.36');
INSERT INTO `logging` (`loggingID`, `action`, `time`, `ip`, `browser`) VALUES
(653, 'find classes by : 13', '19/10/20 01:28:16am', '::1', 'Safari/537.36'),
(654, 'Fetched all enrollments', '19/10/20 01:28:25am', '::1', 'Safari/537.36');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `login_id` int(10) UNSIGNED NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(50) NOT NULL DEFAULT 'Student'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`login_id`, `username`, `email`, `password`, `role`) VALUES
(3, 'admin', 'guonan627@hotmail.com', '$2y$10$sPhQY3Wrn3hCx/yqsisCQOLgAOZvAwb9IVcYP73BD4QCY/t656MEm', 'Admin'),
(19, 'Norm', 'norm888@norm.com', '$2y$10$A/rVz59AD7MY3nfBU7RDYejSOy3YwSTOwE3zMedL4jrQI8fJUorjS', 'Student'),
(21, 'nan', 'nan@nan.com', '$2y$10$0dQLU6ILR2PR1QeCoQVrv.8cd465Ij4FwDpCcXw6CfB0lt5xC7YiG', 'Student'),
(22, 'aaa', 'aaa@aaa.com', '$2y$10$59LCRW1tlvYvZlF7Ufj9muQQAJZc/txygXZM6oWYeKwVFY3npcdTm', 'Student'),
(23, 'asdf', 'asdf@asdf.com', '$2y$10$nNONICL5h9l0NfLQBXg8e.OWSXStsHKcOj9RONzyO24cbbXCUiMNu', 'Student'),
(24, 'bbb', 'bbb@bbb.com', '$2y$10$e4s0Y5Dvgi8w8tzR./TR9OLl6GEfbXpOYUo9VBJn58fOzcAHNkF7O', 'Student'),
(25, 'ccc', 'ccc@ccc.com', '$2y$10$t64x.QkWRavODD7hfkEBteYTkvYHGL13aBXHy5ef67MI8ekQ0n8QG', 'Student'),
(26, 'ddd', 'ddd@ddd.com', '$2y$10$HjDwF5Hx4YVsebA2xwJSvebszCHZzzBTPOLZhPcXHAWea0LAHJKSm', 'Student');

-- --------------------------------------------------------

--
-- Table structure for table `photo`
--

CREATE TABLE `photo` (
  `content_id` int(10) UNSIGNED NOT NULL,
  `class_id` int(10) UNSIGNED NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `content_link` varchar(255) NOT NULL,
  `time_added` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `photo`
--

INSERT INTO `photo` (`content_id`, `class_id`, `file_name`, `content_link`, `time_added`) VALUES
(3, 1, 'test1.docx', './view/uploads/class-1/test1.docx', '2020-8-27 23:55:28');

-- --------------------------------------------------------

--
-- Table structure for table `program`
--

CREATE TABLE `program` (
  `program_id` int(10) UNSIGNED NOT NULL,
  `program_name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `program_level` varchar(20) NOT NULL,
  `price` float NOT NULL,
  `prerequisites` text NOT NULL,
  `duration` varchar(50) NOT NULL,
  `pics` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `program`
--

INSERT INTO `program` (`program_id`, `program_name`, `description`, `program_level`, `price`, `prerequisites`, `duration`, `pics`) VALUES
(1, 'Parent and Baby (6 months to 3 years)', 'Built for swimmers 6 months to 36 months old to be accompanied with a parent or guardian in the water. This course focus on safety in and around the water by teaching children proper entry/exit techniques, floating, and kicking skills, while introducing parents to safety considerations and rescue concepts. ', 'level 1', 1500, 'none', '16 times', 'images/P1.jpg'),
(2, 'Leap Frog (2 years to 4 years)', 'Swimmers learn to be confident and comfortable in the water and are able to ensure their own safety.', 'level 2', 3000, 'Child must be work without parent/guardian and be comfortable with flotation aids (i.e. Life Jackets).', '16 times', 'images/P2.jpg'),
(3, 'Safe Swimming (4 years to 10 years)', 'Students will learn water breathing techniques, free movement in water and how to recognize and aid otter swimmers in need.', 'level 3', 2000, 'none', '16 times', 'images/P3.jpg'),
(4, 'Swim Perfect(6 years to 17 years)', 'Students will develop proper water breathing techniques, learn four strokes and swim turns.', 'level 4', 2300, 'Completed Safe Swimming', '16 times', 'images/P4.jpg'),
(5, 'Pre-Team (8 years to 17 years)', 'Through swim drills and consistent exercise, students will increase their swimming efficiency to a competitive level.', 'level 5', 2200, 'Able to swim a minimum of 20yrds - Freestyle, Backstroke, and Breaststroke. Able to swim 10yrds of Butterfly. Able to confidently preform flip turns and open turns.', '16 times', 'images/P5.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`),
  ADD KEY `loginID` (`login_id`) USING BTREE;

--
-- Indexes for table `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`class_id`),
  ADD KEY `program_id` (`program_id`) USING BTREE;

--
-- Indexes for table `enrolled`
--
ALTER TABLE `enrolled`
  ADD PRIMARY KEY (`enrolled_id`) USING BTREE,
  ADD KEY `login_id` (`login_id`),
  ADD KEY `current_class` (`class_id`);

--
-- Indexes for table `logging`
--
ALTER TABLE `logging`
  ADD PRIMARY KEY (`loggingID`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`login_id`) USING BTREE;

--
-- Indexes for table `photo`
--
ALTER TABLE `photo`
  ADD PRIMARY KEY (`content_id`),
  ADD KEY `class_id` (`class_id`);

--
-- Indexes for table `program`
--
ALTER TABLE `program`
  ADD PRIMARY KEY (`program_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `class`
--
ALTER TABLE `class`
  MODIFY `class_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `enrolled`
--
ALTER TABLE `enrolled`
  MODIFY `enrolled_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `logging`
--
ALTER TABLE `logging`
  MODIFY `loggingID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=655;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `login_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `photo`
--
ALTER TABLE `photo`
  MODIFY `content_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `program`
--
ALTER TABLE `program`
  MODIFY `program_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`login_id`) REFERENCES `login` (`login_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `class`
--
ALTER TABLE `class`
  ADD CONSTRAINT `program_id` FOREIGN KEY (`program_id`) REFERENCES `program` (`program_id`);

--
-- Constraints for table `enrolled`
--
ALTER TABLE `enrolled`
  ADD CONSTRAINT `enrolled_ibfk_1` FOREIGN KEY (`login_id`) REFERENCES `login` (`login_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `enrolled_ibfk_2` FOREIGN KEY (`class_id`) REFERENCES `class` (`class_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `photo`
--
ALTER TABLE `photo`
  ADD CONSTRAINT `class_id` FOREIGN KEY (`class_id`) REFERENCES `class` (`class_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
