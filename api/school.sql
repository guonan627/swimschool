-- phpMyAdmin SQL Dump
-- version 4.9.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Aug 28, 2020 at 01:11 PM
-- Server version: 5.7.26
-- PHP Version: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `school`
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

INSERT INTO `class` (`class_id`, `start_date`, `end_date`, `time`, `trainer_name`, `max_number`, `cur_number`, `status`, `program_id`) VALUES
(1, NULL, NULL, 'Mon 10.00-11.00', 'Max Dow', 5, 0, 'not full', 1),
(2, NULL, NULL, 'Tue 13.00-14.00', 'Max Dow', 5, 0, 'not full', 1),
(3, NULL, NULL, 'Thu 10.00-11.00', 'Max Dow', 5, 0, 'not full', 1),
(4, NULL, NULL, 'Mon 13.00-14.00', 'Max Dow', 5, 0, 'not full', 2),
(5, NULL, NULL, 'Wed 10.00-11.00', 'Max Dow', 5, 0, 'not full', 2),
(6, NULL, NULL, 'Thu 13.00-14.00', 'Lily Coco', 5, 0, 'not full', 2),
(7, NULL, NULL, 'Mon 15.00-16.00', 'Lily Coco', 5, 0, 'not full', 3),
(8, NULL, NULL, 'Wed 15.00-16.00', 'Lily Coco', 5, 0, 'not full', 3),
(9, NULL, NULL, 'Thu 15.00-16.00', 'Lily Coco', 5, 0, 'not full', 3),
(10, NULL, NULL, 'Tue 17.00-18.00', 'Paul Mark', 5, 0, 'not full', 4),
(11, NULL, NULL, 'Wed 17.00-18.00', 'Paul Mark', 5, 0, 'not full', 4),
(12, NULL, NULL, 'Fri 15.00-16.00', 'Paul Mark', 5, 0, 'not full', 4),
(13, NULL, NULL, 'Sat 10.00-11.00', 'Paul Mark', 5, 0, 'not full', 5),
(14, NULL, NULL, 'Fri 17.00-18.00', 'Paul Mark', 5, 0, 'not full', 5);

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
  `health` text COLLATE utf8_unicode_ci NOT NULL,
  `login_id` int(10) UNSIGNED NOT NULL,
  `class_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `login_id` int(10) UNSIGNED NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`login_id`, `username`, `password`, `role`) VALUES
(3, 'admin', '$2y$10$sPhQY3Wrn3hCx/yqsisCQOLgAOZvAwb9IVcYP73BD4QCY/t656MEm', 'Admin');

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
  `duration` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `program`
--

INSERT INTO `program` (`program_id`, `program_name`, `description`, `program_level`, `price`, `prerequisites`, `duration`) VALUES
(1, 'Parent and Baby (6 months to 3 years)', 'Built for swimmers 6 months to 36 months old to be accompanied with a parent or guardian in the water. This course focus on safety in and around the water by teaching children proper entry/exit techniques, floating, and kicking skills, while introducing parents to safety considerations and rescue concepts. ', 'level 1', 1500, 'none', '16 times'),
(2, 'Leap Frog (2 years to 4 years)', 'Swimmers learn to be confident and comfortable in the water and are able to ensure their own safety.', 'level 2', 3000, 'Child must be work without parent/guardian and be comfortable with flotation aids (i.e. Life Jackets).', '16 times'),
(3, 'Safe Swimming (4 years to 10 years)', 'Students will learn water breathing techniques, free movement in water and how to recognize and aid otter swimmers in need.', 'level 3', 2000, 'none', '16 times'),
(4, 'Swim Perfect(6 years to 17 years)', 'Students will develop proper water breathing techniques, learn four strokes and swim turns.', 'level 4', 2300, 'Completed Safe Swimming', '16 times'),
(5, 'Pre-Team (8 years to 17 years)', 'Through swim drills and consistent exercise, students will increase their swimming efficiency to a competitive level.', 'level 5', 2300, 'Able to swim a minimum of 20yrds - Freestyle, Backstroke, and Breaststroke.\r\n\r\nAble to swim 10yrds of Butterfly.\r\n\r\nAble to confidently preform flip turns and open turns.', '16 times');

-- --------------------------------------------------------

--
-- Table structure for table `unenrolled`
--

CREATE TABLE `unenrolled` (
  `unenrolled_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `surname` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `login_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
-- Indexes for table `unenrolled`
--
ALTER TABLE `unenrolled`
  ADD PRIMARY KEY (`unenrolled_id`),
  ADD KEY `login_id` (`login_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `class`
--
ALTER TABLE `class`
  MODIFY `class_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `enrolled`
--
ALTER TABLE `enrolled`
  MODIFY `enrolled_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `login_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `photo`
--
ALTER TABLE `photo`
  MODIFY `content_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `program`
--
ALTER TABLE `program`
  MODIFY `program_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `unenrolled`
--
ALTER TABLE `unenrolled`
  MODIFY `unenrolled_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`login_id`) REFERENCES `login` (`login_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `enrolled`
--
ALTER TABLE `enrolled`
  ADD CONSTRAINT `enrolled_ibfk_1` FOREIGN KEY (`login_id`) REFERENCES `login` (`login_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `enrolled_ibfk_2` FOREIGN KEY (`class_id`) REFERENCES `class` (`class_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `unenrolled`
--
ALTER TABLE `unenrolled`
  ADD CONSTRAINT `unenrolled_ibfk_1` FOREIGN KEY (`login_id`) REFERENCES `login` (`login_id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
