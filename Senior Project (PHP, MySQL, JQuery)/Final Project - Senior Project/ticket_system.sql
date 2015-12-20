-- phpMyAdmin SQL Dump
-- version 4.0.10.7
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 14, 2015 at 07:32 PM
-- Server version: 5.5.45-cll-lve
-- PHP Version: 5.4.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `ticket_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE IF NOT EXISTS `comment` (
  `rid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'reply ID',
  `uid` int(11) NOT NULL COMMENT 'user ID',
  `message` varchar(250) NOT NULL,
  `timestamp` datetime NOT NULL,
  `ticketid` int(11) NOT NULL,
  PRIMARY KEY (`rid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2743 ;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`rid`, `uid`, `message`, `timestamp`, `ticketid`) VALUES
(2742, 16, 'We will send a tech over to your room', '2015-12-12 13:42:30', 54409),
(2740, 42, 'Hi, is there anybody who could fix my computer today?', '2015-12-12 12:56:10', 54474),
(2710, 16, 'Sorry that your toner is low. I will have a new box sent over on Monday.', '2015-12-11 21:22:21', 54402);

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE IF NOT EXISTS `location` (
  `LocationID` int(11) NOT NULL,
  `LocationName` varchar(50) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`LocationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`LocationID`, `LocationName`) VALUES
(1, 'Forest Lake'),
(2, 'Mandalay'),
(3, 'Wantagh Elementary'),
(4, 'High School'),
(5, 'Middle School'),
(6, 'Administration');

-- --------------------------------------------------------

--
-- Table structure for table `problemcategory`
--

CREATE TABLE IF NOT EXISTS `problemcategory` (
  `problem_id` int(11) NOT NULL,
  `category_name` varchar(75) NOT NULL,
  PRIMARY KEY (`problem_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `problemcategory`
--

INSERT INTO `problemcategory` (`problem_id`, `category_name`) VALUES
(1, 'Software'),
(2, 'Printer'),
(3, 'Hardware'),
(4, 'Mobile'),
(5, 'SmartBoard');

-- --------------------------------------------------------

--
-- Table structure for table `problemsubcategory`
--

CREATE TABLE IF NOT EXISTS `problemsubcategory` (
  `sub_id` int(11) NOT NULL,
  `problem_id` int(11) NOT NULL,
  `subcategory_name` varchar(75) NOT NULL,
  PRIMARY KEY (`sub_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `problemsubcategory`
--

INSERT INTO `problemsubcategory` (`sub_id`, `problem_id`, `subcategory_name`) VALUES
(1, 1, 'ms office not working'),
(2, 2, 'toner is low'),
(3, 2, 'no power'),
(4, 2, 'not printing'),
(5, 3, 'computer is slow'),
(6, 5, 'keeps restarting'),
(7, 1, 'internet is slow'),
(8, 1, 'google doesn''t look right'),
(9, 4, 'wifi keeps disconnecting'),
(10, 3, 'computer is frozen'),
(11, 5, 'blue screen'),
(12, 3, 'loud noise'),
(13, 1, 'virus'),
(14, 1, 'application won''t open'),
(15, 3, 'lost my files'),
(16, 3, 'spilled coffee on computer'),
(17, 5, 'won''t turn on'),
(18, 3, 'turning itself off'),
(19, 1, 'can''t download'),
(20, 1, 'website is blocked'),
(21, 1, 'there are pop ups'),
(22, 1, 'can''t access website'),
(23, 4, 'can''t open email attachments'),
(24, 1, 'missing DLL file'),
(25, 5, 'abnormal application behavior'),
(26, 3, 'can''t send fax'),
(27, 3, 'can''t make a copy'),
(28, 1, 'can''t exit program'),
(29, 1, 'can''t find word'),
(30, 1, 'can''t find excel'),
(31, 3, 'mouse doesn''t work'),
(32, 1, 'start button is gone'),
(33, 5, 'no sound on smartboard'),
(34, 5, 'no image on smartboard');

-- --------------------------------------------------------

--
-- Table structure for table `ticket`
--

CREATE TABLE IF NOT EXISTS `ticket` (
  `TicketID` int(11) NOT NULL AUTO_INCREMENT,
  `ProblemCategory` varchar(75) NOT NULL,
  `ProblemDescription` varchar(75) NOT NULL,
  `LocationID` int(11) NOT NULL,
  `Status` int(1) NOT NULL,
  `uid` int(11) NOT NULL,
  `TechID` int(11) DEFAULT NULL,
  `DateCreated` datetime NOT NULL,
  `DateClosed` datetime DEFAULT NULL,
  `LastUpdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `RoomNumber` int(11) NOT NULL,
  `priority` int(11) NOT NULL DEFAULT '3' COMMENT '1=high, 2=medium, 3=low',
  PRIMARY KEY (`TicketID`),
  KEY `LocationID` (`LocationID`),
  KEY `UserID` (`uid`),
  KEY `TechID` (`TechID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=54477 ;

--
-- Dumping data for table `ticket`
--

INSERT INTO `ticket` (`TicketID`, `ProblemCategory`, `ProblemDescription`, `LocationID`, `Status`, `uid`, `TechID`, `DateCreated`, `DateClosed`, `LastUpdate`, `RoomNumber`, `priority`) VALUES
(54368, 'Hardware - turning itself off', 'the computer keeps turning off', 4, 0, 6, 18, '2015-10-19 14:08:20', '2015-12-10 19:52:54', '0000-00-00 00:00:00', 155, 3),
(54369, 'SmartBoard - no sound on smartboard', 'Hi, I can''t hear anything when I play a movie', 4, 0, 6, 17, '2015-10-19 15:18:53', NULL, '0000-00-00 00:00:00', 423, 3),
(54370, 'SmartBoard - keeps restarting', 'Hi, my smartboard keeps restarting.', 4, 0, 18, 17, '2015-10-19 16:36:09', NULL, '0000-00-00 00:00:00', 210, 3),
(54371, 'Hardware - can''t send fax', 'Help, we are unable to send faxes in the office.', 2, 0, 7, 17, '2015-10-19 18:29:22', NULL, '0000-00-00 00:00:00', 122, 3),
(54372, 'Hardware - computer is slow', 'Hi, My computer is really slow, can you please help me.', 4, 0, 7, 17, '2015-10-19 18:31:29', NULL, '0000-00-00 00:00:00', 111, 3),
(54373, 'Software - missing DLL file', 'The screen says its missing DLL files, what does that mean?', 4, 0, 11, 17, '2015-10-19 18:33:17', '2015-12-10 19:55:44', '0000-00-00 00:00:00', 267, 3),
(54375, 'Software - google doesn''t look right', 'Google does not look right on my screen, its called something else.', 4, 0, 18, 17, '2015-10-19 18:39:35', NULL, '0000-00-00 00:00:00', 44, 3),
(54377, 'SmartBoard - no sound on smartboard', 'No sound on the smart board', 4, 0, 6, 17, '2015-10-19 21:02:13', NULL, '0000-00-00 00:00:00', 123, 3),
(54389, 'Printer - not printing', 'My printer is brand new and its not printing.', 4, 0, 19, 17, '2015-10-22 18:35:57', NULL, '0000-00-00 00:00:00', 140, 3),
(54390, 'Hardware - loud noise', 'Loud noises coming from the computer box.', 2, 0, 13, 17, '2015-10-22 19:47:49', NULL, '0000-00-00 00:00:00', 213, 3),
(54391, 'SmartBoard - blue screen', 'I can only see a blue screen', 1, 1, 19, 17, '2015-11-05 14:14:50', NULL, '0000-00-00 00:00:00', 223, 3),
(54396, 'Mobile - wifi keeps disconnecting', 'The wifi keeps dropping, can you please help me.', 4, 0, 21, 17, '2015-11-05 15:11:47', NULL, '0000-00-00 00:00:00', 232, 3),
(54397, 'smartboardproblem', 'smartboard does not power on.', 5, 0, 22, 17, '2015-11-05 18:35:31', NULL, '0000-00-00 00:00:00', 112, 3),
(54400, 'Software', 'hello', 3, 0, 17, 17, '2015-11-11 20:36:48', NULL, '0000-00-00 00:00:00', 432, 3),
(54401, 'Hardware - turning itself off', 'My computer keeps turning itself off', 3, 0, 19, 17, '2015-11-11 20:40:30', NULL, '0000-00-00 00:00:00', 432, 3),
(54402, 'Printer - toner is low', 'Hi, can you please deliver more toner.', 1, 1, 22, 17, '2015-11-13 13:11:08', NULL, '0000-00-00 00:00:00', 123, 3),
(54403, 'Hardware - lost my files', 'Help, I lost my files', 1, 1, 21, 17, '2015-11-13 13:12:12', NULL, '0000-00-00 00:00:00', 123, 3),
(54404, 'Software - can''t access website', 'Hi, I can''t access the website.', 1, 1, 19, 17, '2015-11-13 13:13:06', NULL, '0000-00-00 00:00:00', 22, 3),
(54405, 'Software - internet is slow', 'My internet is slow today.', 2, 0, 6, 17, '2015-11-13 13:15:13', NULL, '0000-00-00 00:00:00', 123, 3),
(54406, 'Software - website is blocked', 'says website is blocked. Wanted to show my students a new website.', 6, 0, 6, 17, '2015-11-17 21:28:53', NULL, '0000-00-00 00:00:00', 78, 3),
(54408, 'SmartBoard - keeps restarting', 'The smart board keeps restarting', 2, 0, 6, 17, '2015-11-17 21:45:07', NULL, '0000-00-00 00:00:00', 54, 3),
(54409, 'SmartBoard - won''t turn on', 'The smart board won''t turn on. Need it for my next class.', 2, 1, 13, 17, '2015-11-17 21:47:30', NULL, '0000-00-00 00:00:00', 213, 3),
(54410, 'Software - can''t find excel', 'There is a problem, I can''t find excel.', 2, 0, 6, 17, '2015-11-18 11:16:28', NULL, '0000-00-00 00:00:00', 99, 3),
(54411, 'Printer - No Power', 'help, my printer has no power. Cords are all plugged in.', 2, 0, 6, 17, '2015-11-18 21:23:10', '2015-11-29 20:31:08', '0000-00-00 00:00:00', 129, 3),
(54412, 'Software - ms office not working', 'Office is not loading, help!!!', 2, 0, 6, 17, '2015-11-21 17:13:41', NULL, '0000-00-00 00:00:00', 110, 3),
(54413, 'Software - can''t find word', 'Where is word on my computer, I don''t see it.', 2, 0, 17, 17, '2015-11-27 19:37:16', NULL, '0000-00-00 00:00:00', 32, 3),
(54414, 'Software - there are pop ups', 'There are pop ups on my screen telling me I need to make a $49.95 payment.', 3, 0, 19, 17, '2015-11-29 20:13:38', '2015-12-09 21:58:56', '0000-00-00 00:00:00', 42, 3),
(54415, 'Hardware - loud noise', 'My computer is making a strange loud noise.', 4, 0, 20, 17, '2015-12-02 22:43:37', '2015-12-03 18:50:18', '0000-00-00 00:00:00', 123, 3),
(54417, 'Mobile - wifi keeps disconnecting', 'I am unable to stay connected to the wifi', 4, 0, 21, 17, '2015-12-02 22:44:15', '2015-12-03 18:50:43', '0000-00-00 00:00:00', 4, 3),
(54419, 'Printer - toner is low', 'the printer in my room has very low on toner and I need to print a book.', 2, 0, 18, 17, '2015-12-03 18:32:14', '2015-12-03 18:40:22', '0000-00-00 00:00:00', 25, 3),
(54420, 'Hardware - computer is frozen', 'My computer is not working, can''t change the screen', 3, 0, 22, 17, '2015-12-03 18:32:29', '2015-12-03 18:43:22', '0000-00-00 00:00:00', 100, 3),
(54428, 'Software - start button is gone', 'I can''t find my bottom start button to get to all of my programs, please he', 2, 1, 18, 17, '2015-12-03 19:26:57', NULL, '0000-00-00 00:00:00', 31, 3),
(54429, 'Hardware - lost my files', 'I think my computer broke, I don''t see my files', 1, 0, 17, 17, '2015-12-03 19:27:09', '2015-12-12 13:23:47', '0000-00-00 00:00:00', 145, 3),
(54462, 'Software - can''t find excel', 'I don''t see excel on my screen.', 2, 0, 6, 17, '2015-12-09 20:08:58', '2015-12-10 19:58:58', '2015-12-10 01:08:58', 190, 3),
(54464, 'Software - google doesn''t look right', 'Please help, my computer does not look right.', 1, 0, 7, 17, '2015-12-09 20:18:17', '0000-00-00 00:00:00', '2015-12-10 01:18:17', 102, 3),
(54473, 'Software - application won''t open', 'Outlook wont open', 2, 0, 6, 7, '2015-12-11 08:34:42', '2015-12-11 21:17:46', '2015-12-11 13:34:42', 102, 3),
(54474, 'Software - virus', 'I think I have a virus on my machine', 4, 0, 42, 20, '2015-12-12 12:30:35', '2015-12-12 13:22:59', '2015-12-12 17:30:35', 123, 3),
(54475, 'Software - application won''t open', 'Unable to open application', 2, 1, 42, 39, '2015-12-12 13:25:15', NULL, '2015-12-12 18:25:15', 123, 3),
(54476, 'Printer - toner is low', 'Pinter is out of ink.', 1, 1, 16, 17, '2015-12-14 19:53:50', NULL, '2015-12-15 00:53:50', 112, 3);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `location_id` int(11) NOT NULL,
  `password` varchar(50) NOT NULL,
  `priority` int(11) NOT NULL,
  `position_id` int(11) NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=43 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`uid`, `email`, `firstname`, `lastname`, `location_id`, `password`, `priority`, `position_id`) VALUES
(17, 'cchiuchiolo1@gmail.com', 'tech1', 'tech1', 1, 'f894dcca6eae352314f2154d79bc1687', 0, 1),
(11, 'jkaplan@gmail.com', 'Jay', 'Kaplan', 4, '2ac9cb7dc02b3c0083eb70898e549b63', 1, 0),
(7, 'fenderbender94@gmail.com', 'Jonathan', 'Locovare', 2, '7815696ecbf1c96e6894b779456d330e', 1, 1),
(6, 'cchiuchiolo1@gmail.com', 'Chris', 'Chiuchiolo', 4, '2ac9cb7dc02b3c0083eb70898e549b63', 0, 0),
(13, 'rhenry@gmail.com', 'Rich', 'Henry', 3, '2ac9cb7dc02b3c0083eb70898e549b63', 1, 0),
(16, 'admin', 'admin', 'admin', 1, '21232f297a57a5a743894a0e4a801fc3', 1, 3),
(18, 'tech2@tech2.com', 'tech2', 'tech2', 2, '6fb9a48ef96dafc705cfcc04ac4eeffe', 0, 1),
(19, 'tech3@tech3.com', 'tech3', 'tech3', 3, 'd7c3a73cd94548ba36cfe0604d782a2f', 0, 1),
(20, 'tech4@tech4.com', 'tech4', 'tech4', 4, 'be931f90f29439ef5d3d496bf3a0c982', 0, 1),
(21, 'tech5@tech5.com', 'tech5', 'tech5', 5, '3ea3457f6b329fcb2ffb54c1ae0a10c6', 0, 1),
(22, 'tech6@tech6.com', 'tech6', 'tech6', 6, '1fff319c2db4483a4d75d62f90bf891f', 0, 1),
(42, 'brettfarve@greenbaypackers.com', 'Brett', 'Farve', 4, '202cb962ac59075b964b07152d234b70', 3, 0),
(31, 'jason@borne123.com', 'Jason', 'Borne', 5, '92290ccb8f7b2beb4c57ef1f7a3d5947', 2, 2),
(39, 'bootsoftravel.gmail.com', 'Tinker', 'Dagon', 6, 'e3f614850e99d517c0103ca72cd11cd7', 1, 1),
(40, 'markgreen@gmail.com', 'Mark', 'Green', 1, 'e99a18c428cb38d5f260853678922e03', 1, 0),
(41, 'jamesbrown@gmail.com', 'Jimmy', 'Brown', 1, 'e99a18c428cb38d5f260853678922e03', 1, 0);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
