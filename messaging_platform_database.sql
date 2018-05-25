-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 14, 2018 at 11:18 AM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `messaging_platform`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `CategoryID` int(11) NOT NULL,
  `CategoryName` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `group_message_notification`
--

CREATE TABLE `group_message_notification` (
  `UserID` int(11) NOT NULL,
  `MsgBankID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `message_bank`
--

CREATE TABLE `message_bank` (
  `MsgBankID` int(11) NOT NULL,
  `Message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `ImageURL` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VideoURL` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Stage` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `message_category`
--

CREATE TABLE `message_category` (
  `CategoryID` int(11) NOT NULL,
  `MsgBankID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `private_message`
--

CREATE TABLE `private_message` (
  `PrivateMsgID` int(11) NOT NULL,
  `UserId` int(11) NOT NULL,
  `MessageDate` datetime NOT NULL,
  `MessageType` enum('SendToAdmin','RespondFromAdmin') COLLATE utf8mb4_unicode_ci NOT NULL,
  `Message` longtext COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `private_message_notification`
--

CREATE TABLE `private_message_notification` (
  `UserID` int(11) NOT NULL,
  `PrivateMsgID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `UserID` int(11) NOT NULL,
  `Username` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Password` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `UserType` enum('admin','participant') COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_category`
--

CREATE TABLE `user_category` (
  `UserID` int(11) NOT NULL,
  `CategoryID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_info`
--

CREATE TABLE `user_info` (
  `PID` int(11) NOT NULL,
  `Name` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Age` int(3) NOT NULL,
  `Gender` enum('Male','Female','Other') COLLATE utf8mb4_unicode_ci NOT NULL,
  `ContactNo` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Address` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `UserID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`CategoryID`);

--
-- Indexes for table `group_message_notification`
--
ALTER TABLE `group_message_notification`
  ADD KEY `UserID` (`UserID`),
  ADD KEY `PrivateMsgID` (`MsgBankID`);

--
-- Indexes for table `message_bank`
--
ALTER TABLE `message_bank`
  ADD PRIMARY KEY (`MsgBankID`);

--
-- Indexes for table `message_category`
--
ALTER TABLE `message_category`
  ADD KEY `MsgBankID` (`MsgBankID`),
  ADD KEY `CategoryID` (`CategoryID`);

--
-- Indexes for table `private_message`
--
ALTER TABLE `private_message`
  ADD PRIMARY KEY (`PrivateMsgID`),
  ADD KEY `UserId` (`UserId`);

--
-- Indexes for table `private_message_notification`
--
ALTER TABLE `private_message_notification`
  ADD KEY `UserID` (`UserID`),
  ADD KEY `PrivateMsgID` (`PrivateMsgID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`UserID`),
  ADD UNIQUE KEY `Username` (`Username`);

--
-- Indexes for table `user_category`
--
ALTER TABLE `user_category`
  ADD KEY `UserID` (`UserID`),
  ADD KEY `CategoryID` (`CategoryID`);

--
-- Indexes for table `user_info`
--
ALTER TABLE `user_info`
  ADD PRIMARY KEY (`PID`),
  ADD UNIQUE KEY `UserID` (`UserID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `CategoryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `message_bank`
--
ALTER TABLE `message_bank`
  MODIFY `MsgBankID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `private_message`
--
ALTER TABLE `private_message`
  MODIFY `PrivateMsgID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `user_info`
--
ALTER TABLE `user_info`
  MODIFY `PID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `group_message_notification`
--
ALTER TABLE `group_message_notification`
  ADD CONSTRAINT `group_message_notification_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `group_message_notification_ibfk_2` FOREIGN KEY (`MsgBankID`) REFERENCES `message_bank` (`MsgBankID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `message_category`
--
ALTER TABLE `message_category`
  ADD CONSTRAINT `message_category_ibfk_1` FOREIGN KEY (`MsgBankID`) REFERENCES `message_bank` (`MsgBankID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `message_category_ibfk_2` FOREIGN KEY (`CategoryID`) REFERENCES `category` (`CategoryID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `private_message`
--
ALTER TABLE `private_message`
  ADD CONSTRAINT `private_message_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `user` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `private_message_notification`
--
ALTER TABLE `private_message_notification`
  ADD CONSTRAINT `private_message_notification_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `private_message_notification_ibfk_2` FOREIGN KEY (`PrivateMsgID`) REFERENCES `private_message` (`PrivateMsgID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_category`
--
ALTER TABLE `user_category`
  ADD CONSTRAINT `user_category_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_category_ibfk_2` FOREIGN KEY (`CategoryID`) REFERENCES `category` (`CategoryID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_info`
--
ALTER TABLE `user_info`
  ADD CONSTRAINT `user_info_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`) ON DELETE NO ACTION ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
