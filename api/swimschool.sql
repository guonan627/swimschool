-- phpMyAdmin SQL Dump
-- version 4.9.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Nov 27, 2020 at 10:57 AM
-- Server version: 5.7.26
-- PHP Version: 7.3.9

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
  `status` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `program_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `class`
--

INSERT INTO `class` (`class_id`, `start_date`, `end_date`, `daytime`, `time`, `trainer_name`, `max_number`, `cur_number`, `status`, `program_id`) VALUES
(1, '2020-10-05', '2020-12-07', 'Mon', 'Mon 10.00-11.00', 'Max Dow', 5, 1, 'not full', 1),
(2, '2020-10-06', '2020-12-08', 'Tue', 'Tue 13.00-14.00', 'Max Dow', 5, 1, 'not full', 1),
(3, '2020-10-08', '2020-12-10', 'Thu', 'Thu 10.00-11.00', 'Max Dow', 5, 1, 'not full', 1),
(4, '2020-10-05', '2020-12-07', 'Mon', 'Mon 13.00-14.00', 'Max Dow', 5, 5, 'not full', 2),
(5, '2020-10-07', '2020-12-09', 'Wed', 'Wed 10.00-11.00', 'Max Dow', 5, 0, 'not full', 2),
(6, '2020-10-08', '2020-12-10', 'Thu', 'Thu 13.00-14.00', 'Lily Coco', 5, 0, 'not full', 2),
(7, '2020-10-05', '2020-12-07', 'Mon', 'Mon 15.00-16.00', 'Lily Coco', 5, 0, 'not full', 3),
(8, '2020-10-07', '2020-12-09', 'Wed', 'Wed 15.00-16.00', 'Lily Coco', 5, 1, 'not full', 3),
(9, '2020-10-08', '2020-12-10', 'Thu', 'Thu 15.00-16.00', 'Lily Coco', 5, 0, 'not full', 3),
(10, '2020-10-06', '2020-12-08', 'Tue', 'Tue 17.00-18.00', 'Paul Mark', 5, 0, 'not full', 4),
(11, '2020-10-07', '2020-12-09', 'Wed', 'Wed 17.00-18.00', 'Paul Mark', 5, 0, 'not full', 4),
(12, '2020-10-09', '2020-12-11', 'Fri', 'Fri 15.00-16.00', 'Paul Mark', 5, 0, 'not full', 4),
(13, '2020-10-10', '2020-12-12', 'Sat', 'Sat 10.00-11.00', 'Paul Mark', 5, 0, 'not full', 5),
(14, '2020-10-09', '2020-12-11', 'Fri', 'Fri 17.00-18.00', 'Paul Mark', 5, 1, 'not full', 5),
(15, '2020-10-25', '2020-12-25', 'Mon', 'Mon 10.00-11.00', 'AAA', 5, 3, NULL, 3);

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
(10, 'ddd', 'ddd', 'Male', '23-23A Thalaba Road', 'ddd@ddd.com', '45456457', '2020-10-20', '', 26, 14),
(11, 'abc', 'abc', 'male', 'abcefghijk', 'abc@abc.com', '1234567', '2018-02-01', 'no', 28, 4);

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
(26, 'ddd', 'ddd@ddd.com', '$2y$10$HjDwF5Hx4YVsebA2xwJSvebszCHZzzBTPOLZhPcXHAWea0LAHJKSm', 'Student'),
(27, 'test', 'test@test.com', '$2y$10$ARZ5T06rZTQiFHrGktdnhOtBF5w83HRz30VoZqmJAqc77V8VnE4Ry', 'Student'),
(28, 'abc', 'abc@abc.com', '$2y$10$OVDf2LmTTcqvL64jwA5nCu3P9BS87ZKfMWTt0lu5Ykcx6rvfrvNpy', 'Student');

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
(5, 'Pre-Team (8 years to 17 years)', 'Through swim drills and consistent exercise, students will increase their swimming efficiency to a competitive level.', 'level 5', 2200, 'Able to swim a minimum of 20yrds - Freestyle, Backstroke, and Breaststroke. Able to swim 10yrds of Butterfly. Able to confidently preform flip turns and open turns.', '16 times', 'images/P5.jpg'),
(10, 'asdf', 'asdf', 'level 1', 1400, 'asdf', '12345', '12345');

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
  MODIFY `class_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `enrolled`
--
ALTER TABLE `enrolled`
  MODIFY `enrolled_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `logging`
--
ALTER TABLE `logging`
  MODIFY `loggingID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1437;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `login_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `photo`
--
ALTER TABLE `photo`
  MODIFY `content_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `program`
--
ALTER TABLE `program`
  MODIFY `program_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

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
