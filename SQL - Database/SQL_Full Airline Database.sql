-- phpMyAdmin SQL Dump
-- version 3.4.11.1deb2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 28, 2015 at 06:02 AM
-- Server version: 5.5.31
-- PHP Version: 5.4.4-14+deb7u5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `airline`
--

-- --------------------------------------------------------

--
-- Table structure for table `ActualFlight`
--

CREATE TABLE IF NOT EXISTS `ActualFlight` (
  `FlightNumber` int(11) NOT NULL DEFAULT '0',
  `FlightDate` date NOT NULL DEFAULT '0000-00-00',
  `ActArrivalTime` time DEFAULT NULL,
  `ActDepTime` time DEFAULT NULL,
  `ActFlightDur` int(11) DEFAULT NULL,
  `AriFlightDate` date DEFAULT NULL,
  `DepFlightDate` date DEFAULT NULL,
  `AirplaneID` varchar(10) NOT NULL,
  `PilotFAAID1` varchar(8) DEFAULT NULL,
  `PilotFAAID2` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`FlightNumber`,`FlightDate`),
  KEY `PilotFAAID1` (`PilotFAAID1`),
  KEY `PilotFAAID2` (`PilotFAAID2`),
  KEY `AirplaneID` (`AirplaneID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ActualFlight`
--

INSERT INTO `ActualFlight` (`FlightNumber`, `FlightDate`, `ActArrivalTime`, `ActDepTime`, `ActFlightDur`, `AriFlightDate`, `DepFlightDate`, `AirplaneID`, `PilotFAAID1`, `PilotFAAID2`) VALUES
(1, '2015-04-16', '09:00:00', '08:00:00', 1, '2015-04-16', '2015-04-16', 'Notfun', '16247404', '88018669'),
(1, '2015-04-17', NULL, NULL, NULL, NULL, NULL, 'Notfun', NULL, NULL),
(2, '2015-04-16', '13:00:00', '12:00:00', 1, '2015-04-16', '2015-04-16', 'Notfun', '21898032', '93969652'),
(2, '2015-04-17', NULL, NULL, NULL, NULL, NULL, 'Notfun', NULL, NULL),
(3, '2015-04-16', '16:00:00', '15:00:00', 1, '2015-04-16', '2015-04-16', 'Notfun', '67687980', '21898032'),
(3, '2015-04-17', NULL, NULL, NULL, NULL, NULL, 'Notfun', NULL, NULL),
(4, '2015-04-16', '20:00:00', '19:00:00', 1, '2015-04-16', '2015-04-16', 'Notfun', '81705732', '16247404'),
(4, '2015-04-17', NULL, NULL, NULL, NULL, NULL, 'Notfun', NULL, NULL),
(5, '2015-04-16', '09:30:00', '08:30:00', 1, '2015-04-16', '2015-04-16', 'Nearly', '13086596', '67687980'),
(5, '2015-04-17', NULL, NULL, NULL, NULL, NULL, 'Nearly', NULL, NULL),
(6, '2015-04-16', '13:30:00', '12:30:00', 1, '2015-04-16', '2015-04-16', 'N00dle', '16247404', '81705732'),
(6, '2015-04-17', NULL, NULL, NULL, NULL, NULL, 'N00dle', NULL, NULL),
(7, '2015-04-16', '09:30:00', '08:30:00', 1, '2015-04-16', '2015-04-16', 'Nearly', '21898032', '16247404'),
(7, '2015-04-17', NULL, NULL, NULL, NULL, NULL, 'Nearly', NULL, NULL),
(8, '2015-04-16', '13:30:00', '12:30:00', 1, '2015-04-16', '2015-04-16', 'N00dle', '63367845', '21898032'),
(8, '2015-04-17', NULL, NULL, NULL, NULL, NULL, 'N00dle', NULL, NULL),
(9, '2015-04-16', '16:30:00', '15:30:00', 1, '2015-04-16', '2015-04-16', 'Nearly', '88018669', '67687980'),
(9, '2015-04-17', NULL, NULL, NULL, NULL, NULL, 'Nearly', NULL, NULL),
(10, '2015-04-16', '16:30:00', '15:30:00', 1, '2015-04-16', '2015-04-16', 'N00dle', '93855282', '81705732'),
(10, '2015-04-17', NULL, NULL, NULL, NULL, NULL, 'N00dle', NULL, NULL),
(11, '2015-04-16', '20:30:00', '19:30:00', 1, '2015-04-16', '2015-04-16', 'Nearly', '63367845', '13086596'),
(11, '2015-04-17', NULL, NULL, NULL, NULL, NULL, 'Nearly', NULL, NULL),
(12, '2015-04-16', '20:30:00', '19:30:00', 1, '2015-04-16', '2015-04-16', 'N00dle', '67687980', '16247404'),
(12, '2015-04-17', NULL, NULL, NULL, NULL, NULL, 'N00dle', NULL, NULL),
(13, '2015-04-16', '08:45:00', '07:45:00', 1, '2015-04-16', '2015-04-16', 'N0tgrt', '81705732', '21898032'),
(13, '2015-04-17', NULL, NULL, NULL, NULL, NULL, 'N0tgrt', NULL, NULL),
(14, '2015-04-16', '13:00:00', '12:00:00', 1, '2015-04-16', '2015-04-16', 'N0tbad', '90181863', '63367845'),
(14, '2015-04-17', NULL, NULL, NULL, NULL, NULL, 'N0tbad', NULL, NULL),
(15, '2015-04-16', '08:45:00', '07:45:00', 1, '2015-04-16', '2015-04-16', 'Ntg00d', '81705732', '88018669'),
(15, '2015-04-17', NULL, NULL, NULL, NULL, NULL, 'Ntg00d', NULL, NULL),
(16, '2015-04-16', '16:00:00', '15:00:00', 1, '2015-04-16', '2015-04-16', 'N0000', '93969652', '93855282'),
(16, '2015-04-17', NULL, NULL, NULL, NULL, NULL, 'N0000', NULL, NULL),
(17, '2015-04-16', '10:30:00', '09:30:00', 1, '2015-04-16', '2015-04-16', 'N0tgrt', '90181863', '63367845'),
(17, '2015-04-17', NULL, NULL, NULL, NULL, NULL, 'N0tgrt', NULL, NULL),
(18, '2015-04-16', '18:30:00', '17:30:00', 1, '2015-04-16', '2015-04-16', 'N0tbad', '63367845', '67687980'),
(18, '2015-04-17', NULL, NULL, NULL, NULL, NULL, 'N0tbad', NULL, NULL),
(19, '2015-04-16', '18:30:00', '17:30:00', 1, '2015-04-16', '2015-04-16', 'Ntg00d', '93855282', '81705732'),
(19, '2015-04-17', NULL, NULL, NULL, NULL, NULL, 'Ntg00d', NULL, NULL),
(20, '2015-04-16', '19:30:00', '18:30:00', 1, '2015-04-16', '2015-04-16', 'N0000', '13086596', '90181863'),
(20, '2015-04-17', NULL, NULL, NULL, NULL, NULL, 'N0000', NULL, NULL),
(21, '2015-04-16', '19:30:00', '18:30:00', 1, '2015-04-16', '2015-04-16', 'N0000', '13086596', '90181863'),
(22, '2015-04-16', '19:30:00', '18:30:00', 1, '2015-04-16', '2015-04-16', 'N0000', '13086596', '90181863');

-- --------------------------------------------------------

--
-- Table structure for table `Address`
--

CREATE TABLE IF NOT EXISTS `Address` (
  `AddressID` int(11) NOT NULL,
  `AddressLine1` varchar(50) NOT NULL,
  `AddressLine2` varchar(50) DEFAULT NULL,
  `City` varchar(30) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Region` varchar(2) DEFAULT NULL,
  `AddressState` char(2) NOT NULL,
  `Zip` int(11) NOT NULL,
  PRIMARY KEY (`AddressID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Address`
--

INSERT INTO `Address` (`AddressID`, `AddressLine1`, `AddressLine2`, `City`, `Email`, `Region`, `AddressState`, `Zip`) VALUES
(1, '5240 Ac, St.', '', 'Oklahoma City', 'vel.convallis@nibhsitamet.net', '', 'OK', 38888),
(2, 'Ap #356-8971 Vulputate, Road', '', 'Little Rock', 'Vestibulum.ante.ipsum@vestibulumnequesed.net', '', 'AR', 72905),
(3, 'P.O. Box 712, 7743 Luctus, Rd.', '', 'Evansville', 'sem.consequat@orciluctuset.com', '', 'IN', 79645),
(4, '4490 Vivamus Ave', '', 'Shreveport', 'nulla.Integer@posuerecubiliaCurae.co.uk', '', 'LA', 79020),
(5, 'P.O. Box 568, 3452 Amet, Rd.', '', 'Essex', 'dapibus@auctorvitae.co.uk', '', 'VT', 40571),
(6, 'Ap #566-7954 Magna. Road', '', 'Houston', 'dolor.Fusce.feugiat@orciadipiscing.co.uk', '', 'TX', 85333),
(7, '8097 Nisi Avenue', '', 'Evansville', 'sollicitudin.orci.sem@ornareelitelit.com', '', 'IN', 65321),
(8, 'P.O. Box 565, 4007 Risus. Av.', '', 'Colchester', 'urna@nasceturridiculusmus.edu', '', 'VT', 61275),
(9, 'P.O. Box 201, 3944 Enim. Av.', '', 'Tulsa', 'Cras.sed.leo@blandit.com', '', 'OK', 36841),
(10, 'P.O. Box 657, 4596 Eros Rd.', '', 'North Las Vegas', 'amet.diam.eu@facilisisSuspendissecommodo.edu', '', 'NV', 98410),
(11, 'Ap #966-8839 Sodales St.', '', 'Augusta', 'vitae.erat.vel@nisl.org', '', 'GA', 80935),
(12, 'P.O. Box 185, 2268 Litora Rd.', '', 'Erie', 'erat@necorci.edu', '', 'PA', 56445),
(13, '122-1915 Integer Street', '', 'Carson City', 'pellentesque.massa@Nullatinciduntneque.co.uk', '', 'NV', 68655),
(14, 'P.O. Box 204, 8400 Facilisi. Av.', '', 'Fairbanks', 'velit@Fuscedolorquam.co.uk', '', 'AK', 99834),
(15, '618-6436 Nunc Avenue', '', 'Louisville', 'quam.Pellentesque@ametloremsemper.ca', '', 'KY', 21147),
(16, '9830 In Road', '', 'Fresno', 'risus.quis.diam@anteNuncmauris.edu', '', 'CA', 94566),
(17, '683-278 Ultricies St.', '', 'Burlington', 'ipsum@adipiscingelitAliquam.co.uk', '', 'VT', 14680),
(18, 'Ap #513-2235 Risus St.', '', 'Indianapolis', 'massa.Quisque@maurisMorbinon.co.uk', '', 'IN', 11277),
(19, '748 Sem. Road', '', 'West Jordan', 'varius@sedliberoProin.co.uk', '', 'UT', 46575),
(20, '884-7556 Ridiculus Rd.', '', 'Wilmington', 'arcu.et@acfeugiatnon.ca', '', 'DE', 31974),
(21, '168-7639 Ligula. Av.', '', 'Cincinnati', 'nec.imperdiet@SednequeSed.com', '', 'OH', 34614),
(22, 'P.O. Box 626, 3823 Mauris Street', '', 'Overland Park', 'eget.ipsum@orciUt.org', '', 'KS', 58287),
(23, '205-4958 Augue, Avenue', '', 'Fort Collins', 'quam.Curabitur@laciniaat.net', '', 'CO', 51253),
(24, '9827 Pharetra, St.', '', 'Springdale', 'cam@Integersemelit.net', '', 'AR', 71096),
(25, 'P.O. Box 354, 9898 Est. Rd.', '', 'Annapolis', 'Fusce@Nuncmauris.org', '', 'MD', 50514),
(26, 'Ap #125-1989 Mollis Avenue', '', 'Allentown', 'lorem.tristique@atrisus.net', '', 'PA', 98802),
(27, '283-3685 Libero. Avenue', '', 'Fort Wayne', 'ligula.Aliquam.erat@egestasurna.ca', '', 'IN', 31580),
(28, '925-9382 Magna. St.', '', 'Independence', 'et@odio.co.uk', '', 'MO', 22421),
(29, 'Ap #854-8545 Nullam St.', '', 'Hartford', 'ligula@nullaInteger.net', '', 'CT', 72650),
(30, '424-1045 Et Rd.', '', 'Covington', 'facilisis@vellectuscam.com', '', 'KY', 76096),
(32, '123 Main St.', '', 'Bellmore', 'abc@123.com', '', 'NY', 11710);

-- --------------------------------------------------------

--
-- Table structure for table `Airplane`
--

CREATE TABLE IF NOT EXISTS `Airplane` (
  `AirplaneID` varchar(10) NOT NULL,
  `AirplaneTypeID` varchar(10) NOT NULL,
  PRIMARY KEY (`AirplaneID`),
  KEY `AirplaneTypeID` (`AirplaneTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Airplane`
--

INSERT INTO `Airplane` (`AirplaneID`, `AirplaneTypeID`) VALUES
('N0000', '757-300'),
('N00dle', 'CRJ100'),
('Nearly', 'CRJ100'),
('N0tbad', 'CRJ700'),
('N0tgrt', 'CRJ700'),
('Ntg00d', 'CRJ700'),
('Notfun', 'ERJ145');

-- --------------------------------------------------------

--
-- Table structure for table `AirplaneType`
--

CREATE TABLE IF NOT EXISTS `AirplaneType` (
  `AirplaneTypeID` varchar(10) NOT NULL,
  `NumOfEconomy` int(11) NOT NULL,
  `NumOfFirst` int(11) NOT NULL,
  `NumOfPremium` int(11) NOT NULL,
  `NumOfSeats` int(11) NOT NULL,
  PRIMARY KEY (`AirplaneTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `AirplaneType`
--

INSERT INTO `AirplaneType` (`AirplaneTypeID`, `NumOfEconomy`, `NumOfFirst`, `NumOfPremium`, `NumOfSeats`) VALUES
('757-300', 177, 24, 23, 224),
('CRJ100', 50, 0, 0, 50),
('CRJ700', 48, 9, 8, 65),
('ERJ145', 50, 0, 0, 50);

-- --------------------------------------------------------

--
-- Table structure for table `Airport`
--

CREATE TABLE IF NOT EXISTS `Airport` (
  `AirportCode` varchar(4) NOT NULL,
  `AirportName` varchar(50) DEFAULT NULL,
  `Lattitude` varchar(10) NOT NULL,
  `Longitude` varchar(10) NOT NULL,
  PRIMARY KEY (`AirportCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Airport`
--

INSERT INTO `Airport` (`AirportCode`, `AirportName`, `Lattitude`, `Longitude`) VALUES
('KALB', 'Albany International Airport', '42.7492N', '73.8019W'),
('KDCA', 'Regan National Airport', '38.8522N', '77.0378W'),
('KISP', 'MacArthur Airport', '40.7953N', '73.1003W'),
('KPHL', 'Philadelphia International Airport', '39.8719N', '75.2411W');

-- --------------------------------------------------------

--
-- Table structure for table `Flight`
--

CREATE TABLE IF NOT EXISTS `Flight` (
  `FlightNumber` int(11) NOT NULL,
  `ArrivalAirport` varchar(4) DEFAULT NULL,
  `DeptAirport` varchar(4) DEFAULT NULL,
  `SchArrivalTime` time DEFAULT NULL,
  `SchDepTime` time DEFAULT NULL,
  `EconomyPrice` decimal(10,2) NOT NULL,
  `PremiumPricing` decimal(10,2) NOT NULL,
  `FirstPricing` decimal(10,2) NOT NULL,
  `AirplaneID` varchar(10) NOT NULL,
  PRIMARY KEY (`FlightNumber`),
  KEY `DeptAirport` (`DeptAirport`),
  KEY `ArrivalAirport` (`ArrivalAirport`),
  KEY `AirplaneID` (`AirplaneID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Flight`
--

INSERT INTO `Flight` (`FlightNumber`, `ArrivalAirport`, `DeptAirport`, `SchArrivalTime`, `SchDepTime`, `EconomyPrice`, `PremiumPricing`, `FirstPricing`, `AirplaneID`) VALUES
(1, 'KPHL', 'KISP', '09:00:00', '08:00:00', 250.00, 300.00, 500.00, 'Notfun'),
(2, 'KISP', 'KPHL', '13:00:00', '12:00:00', 200.00, 250.00, 400.00, 'Notfun'),
(3, 'KPHL', 'KISP', '16:00:00', '15:00:00', 250.00, 300.00, 450.00, 'Notfun'),
(4, 'KISP', 'KPHL', '20:00:00', '19:00:00', 250.00, 300.00, 500.00, 'Notfun'),
(5, 'KALB', 'KISP', '09:30:00', '08:30:00', 250.00, 300.00, 450.00, 'Nearly'),
(6, 'KISP', 'KALB', '13:30:00', '12:30:00', 200.00, 250.00, 400.00, 'N00dle'),
(7, 'KISP', 'KALB', '09:30:00', '08:30:00', 250.00, 300.00, 450.00, 'Nearly'),
(8, 'KALB', 'KISP', '13:30:00', '12:30:00', 99.00, 150.00, 199.00, 'N00dle'),
(9, 'KALB', 'KISP', '16:30:00', '15:30:00', 250.00, 280.00, 450.00, 'Nearly'),
(10, 'KISP', 'KALB', '16:30:00', '15:30:00', 249.00, 299.00, 740.00, 'N00dle'),
(11, 'KALB', 'KISP', '20:30:00', '19:30:00', 250.00, 300.00, 450.00, 'Nearly'),
(12, 'KISP', 'KALB', '20:30:00', '19:30:00', 250.00, 300.00, 500.00, 'N00dle'),
(13, 'KISP', 'KDCA', '08:45:00', '07:45:00', 249.00, 299.00, 750.00, 'N0tgrt'),
(14, 'KDCA', 'KISP', '13:00:00', '12:00:00', 99.00, 150.00, 199.00, 'N0tbad'),
(15, 'KDCA', 'KISP', '08:45:00', '07:45:00', 249.00, 299.00, 740.00, 'Ntg00d'),
(16, 'KISP', 'KDCA', '16:00:00', '15:00:00', 249.00, 299.00, 740.00, 'N0000'),
(17, 'KISP', 'KDCA', '10:30:00', '09:30:00', 249.00, 320.00, 740.00, 'N0tgrt'),
(18, 'KDCA', 'KISP', '18:30:00', '17:30:00', 249.00, 299.00, 740.00, 'N0tbad'),
(19, 'KISP', 'KDCA', '18:30:00', '17:30:00', 249.00, 320.00, 740.00, 'Ntg00d'),
(20, 'KDCA', 'KISP', '19:30:00', '18:30:00', 249.00, 299.00, 700.00, 'N0000'),
(21, 'KDCA', 'KISP', '19:30:00', '18:30:00', 0.00, 0.00, 0.00, 'N0000'),
(22, 'KDCA', 'KISP', '19:30:00', '18:30:00', 249.00, 299.00, 700.00, 'N0000');

-- --------------------------------------------------------

--
-- Table structure for table `Passenger`
--

CREATE TABLE IF NOT EXISTS `Passenger` (
  `PassengerFFN` int(11) NOT NULL,
  `AddressID` int(11) NOT NULL,
  `PassengerName` varchar(50) NOT NULL,
  `PassengerPhone` varchar(15) NOT NULL,
  PRIMARY KEY (`PassengerFFN`),
  KEY `AddressID` (`AddressID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Passenger`
--

INSERT INTO `Passenger` (`PassengerFFN`, `AddressID`, `PassengerName`, `PassengerPhone`) VALUES
(12476, 10, 'Macy Burt', '(558) 322-7938'),
(15738, 7, 'Mallory Q. Osborne', '(416) 923-3709'),
(17178, 4, 'Kirk Summers', '(783) 580-1638'),
(17930, 19, 'David C. Roman', '(190) 241-4443'),
(18976, 32, 'Bobby Jones', '(917) 613-3956'),
(26949, 14, 'Cairo A. Anderson', '(232) 922-6650'),
(26959, 20, 'Orli L. Norton', '(175) 813-3656'),
(31318, 3, 'Colton I. Dodson', '(910) 126-8687'),
(43117, 12, 'Rhoda Allen', '(928) 591-5850'),
(44593, 17, 'Veda P. Moreno', '(304) 121-3671'),
(46737, 5, 'Zenaida W. Levy', '(955) 860-7214'),
(50270, 9, 'Merritt Sellers', '(759) 556-8816'),
(53414, 1, 'Xenos T. Hardy', '(778) 377-9095'),
(54240, 6, 'Colleen Fleming', '(209) 293-3925'),
(74012, 2, 'Kylan Pittman', '(149) 749-4917'),
(74052, 16, 'Lillian D. Hawkins', '(613) 102-8924'),
(75988, 11, 'Chester Cook', '(703) 297-5320'),
(90218, 8, 'Serena Russo', '(516) 471-3907'),
(92876, 13, 'Riley W. Mann', '(641) 296-9940'),
(93152, 15, 'Idola Whitley', '(122) 926-1896'),
(96687, 18, 'Brenden L. Hardy', '(416) 573-3284');

-- --------------------------------------------------------

--
-- Table structure for table `Pilot`
--

CREATE TABLE IF NOT EXISTS `Pilot` (
  `PilotFAAID` varchar(8) NOT NULL,
  `MedicalClass` varchar(1) NOT NULL,
  `MedicalDate` date NOT NULL,
  `MedicalExpDate` date NOT NULL,
  `NeedsVacation` char(1) NOT NULL,
  `PilotFirstName` varchar(50) NOT NULL,
  `PilotLastName` varchar(50) NOT NULL,
  `PilotMiddleName` varchar(50) DEFAULT NULL,
  `TotalFlyHours` int(11) NOT NULL,
  `AddressID` int(11) NOT NULL,
  PRIMARY KEY (`PilotFAAID`),
  KEY `AddressID` (`AddressID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Pilot`
--

INSERT INTO `Pilot` (`PilotFAAID`, `MedicalClass`, `MedicalDate`, `MedicalExpDate`, `NeedsVacation`, `PilotFirstName`, `PilotLastName`, `PilotMiddleName`, `TotalFlyHours`, `AddressID`) VALUES
('13086596', 'C', '2014-11-08', '2015-01-18', '2', 'Arsenio', 'Stephens', 'Kyle', 1, 24),
('16247404', 'U', '2015-05-20', '2014-06-02', '2', 'Dennis', 'Livingston', 'Ivory', 148, 28),
('21898032', 'G', '2014-12-23', '2014-10-24', '1', 'Price', 'Waller', 'Hermione', 94, 27),
('63367845', 'G', '2014-08-24', '2016-03-24', '2', 'Emma', 'Zamora', 'Holly', 35, 22),
('67687980', 'U', '2014-12-23', '2014-04-30', '1', 'Charde', 'Woods', 'Fritz', 191, 29),
('81705732', 'E', '2014-05-20', '2014-07-13', '2', 'Kennan', 'Barron', 'Damian', 589, 30),
('88018669', 'U', '2015-08-28', '2014-05-04', '2', 'Arthur', 'Garcia', 'Erasmus', 904, 25),
('90181863', 'N', '2014-10-01', '2015-01-09', '1', 'Dylan', 'White', 'Erasmus', 2, 21),
('93855282', 'F', '2014-05-05', '2016-03-05', '2', 'Mohammad', 'Gonzales', 'Jerry', 117, 23),
('93969652', 'J', '2014-10-15', '2015-01-15', '1', 'Jane', 'Bright', 'Lillith', 766, 26);

-- --------------------------------------------------------

--
-- Table structure for table `PilotRate`
--

CREATE TABLE IF NOT EXISTS `PilotRate` (
  `PilotFAAID` varchar(8) NOT NULL,
  `AirplaneTypeID` varchar(10) NOT NULL,
  `CertExpDate` date DEFAULT NULL,
  `CertLevel` char(1) NOT NULL,
  `CertType` char(1) NOT NULL,
  `Ratings` varchar(4) NOT NULL DEFAULT '',
  `RecordType` int(11) DEFAULT NULL,
  PRIMARY KEY (`PilotFAAID`,`Ratings`),
  KEY `AirplaneTypeID` (`AirplaneTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `PilotRate`
--

INSERT INTO `PilotRate` (`PilotFAAID`, `AirplaneTypeID`, `CertExpDate`, `CertLevel`, `CertType`, `Ratings`, `RecordType`) VALUES
('13086596', 'CRJ100', '2015-03-11', 'Q', 'V', 'QRF1', 0),
('16247404', 'CRJ100', '2014-10-09', 'E', 'H', 'RHO7', 0),
('16247404', '757-300', '2014-05-03', 'A', 'X', 'WMW6', 0),
('21898032', 'CRJ100', '2015-04-21', 'M', 'J', 'AJG6', 0),
('21898032', '757-300', '2014-11-04', 'M', 'T', 'AXD3', 0),
('63367845', 'CRJ100', '2015-04-12', 'E', 'A', 'RAU7', 0),
('63367845', 'CRJ700', '2014-08-15', 'F', 'B', 'YFX7', 0),
('67687980', '757-300', '2015-03-12', 'V', 'I', 'TMP1', 0),
('67687980', 'CRJ700', '2015-07-12', 'Z', 'O', 'XCV4', 0),
('81705732', '757-300', '2014-09-03', 'F', 'R', 'APH0', 0),
('81705732', 'CRJ700', '2014-07-15', 'J', 'P', 'YBA9', 0),
('81705732', 'ERJ145', '2015-12-31', 'A', 'N', 'ZLG6', 0),
('88018669', 'CRJ100', '2014-10-13', 'J', 'Q', 'AUN6', 0),
('90181863', 'CRJ700', '2016-01-02', 'S', 'R', 'QCQ5', 0),
('93855282', 'CRJ100', '2016-03-02', 'W', 'U', 'CAD3', 0),
('93969652', 'ERJ145', '2016-03-06', 'U', 'P', 'VTC3', 0);

-- --------------------------------------------------------

--
-- Table structure for table `TicketRes`
--

CREATE TABLE IF NOT EXISTS `TicketRes` (
  `TicketNumberID` int(11) NOT NULL,
  `AirplaneID` varchar(10) NOT NULL,
  `PassengerFFN` int(11) NOT NULL,
  `FlightNumber` int(11) NOT NULL,
  `FlightDate` date NOT NULL,
  `TypeOfSeat` varchar(10) NOT NULL,
  PRIMARY KEY (`TicketNumberID`),
  KEY `FlightNumber` (`FlightNumber`,`FlightDate`),
  KEY `PassengerFFN` (`PassengerFFN`),
  KEY `AirplaneID` (`AirplaneID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `TicketRes`
--

INSERT INTO `TicketRes` (`TicketNumberID`, `AirplaneID`, `PassengerFFN`, `FlightNumber`, `FlightDate`, `TypeOfSeat`) VALUES
(50415, 'N00dle', 90218, 8, '2015-04-16', 'First'),
(50459, 'N00dle', 90218, 8, '2015-04-16', 'First'),
(50770, 'N00dle', 90218, 8, '2015-04-16', 'First'),
(51717, 'N00dle', 90218, 8, '2015-04-16', 'First'),
(52224, 'N00dle', 90218, 8, '2015-04-16', 'First'),
(52635, 'N00dle', 90218, 8, '2015-04-16', 'First'),
(53212, 'N00dle', 90218, 8, '2015-04-16', 'First'),
(54404, 'N00dle', 90218, 8, '2015-04-16', 'First'),
(54717, 'N00dle', 90218, 8, '2015-04-16', 'First'),
(10674995, 'Notfun', 74012, 2, '2015-04-16', 'Premium'),
(12926239, 'Notfun', 17178, 4, '2015-04-16', 'Economy'),
(52468376, 'Nearly', 46737, 5, '2015-04-16', 'Premium'),
(66178362, 'Notfun', 31318, 3, '2015-04-16', 'First'),
(70263533, 'N00dle', 54240, 6, '2015-04-16', 'First'),
(81150909, 'Nearly', 15738, 7, '2015-04-16', 'First'),
(81296878, 'N00dle', 90218, 8, '2015-04-16', 'First'),
(86448535, 'Notfun', 53414, 1, '2015-04-16', 'Economy');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ActualFlight`
--
ALTER TABLE `ActualFlight`
  ADD CONSTRAINT `ActualFlight_ibfk_1` FOREIGN KEY (`FlightNumber`) REFERENCES `Flight` (`FlightNumber`),
  ADD CONSTRAINT `ActualFlight_ibfk_2` FOREIGN KEY (`PilotFAAID1`) REFERENCES `Pilot` (`PilotFAAID`),
  ADD CONSTRAINT `ActualFlight_ibfk_3` FOREIGN KEY (`PilotFAAID2`) REFERENCES `Pilot` (`PilotFAAID`),
  ADD CONSTRAINT `ActualFlight_ibfk_4` FOREIGN KEY (`AirplaneID`) REFERENCES `Airplane` (`AirplaneID`);

--
-- Constraints for table `Airplane`
--
ALTER TABLE `Airplane`
  ADD CONSTRAINT `Airplane_ibfk_1` FOREIGN KEY (`AirplaneTypeID`) REFERENCES `AirplaneType` (`AirplaneTypeID`);

--
-- Constraints for table `Flight`
--
ALTER TABLE `Flight`
  ADD CONSTRAINT `Flight_ibfk_1` FOREIGN KEY (`DeptAirport`) REFERENCES `Airport` (`AirportCode`),
  ADD CONSTRAINT `Flight_ibfk_2` FOREIGN KEY (`ArrivalAirport`) REFERENCES `Airport` (`AirportCode`),
  ADD CONSTRAINT `Flight_ibfk_3` FOREIGN KEY (`AirplaneID`) REFERENCES `Airplane` (`AirplaneID`);

--
-- Constraints for table `Passenger`
--
ALTER TABLE `Passenger`
  ADD CONSTRAINT `Passenger_ibfk_1` FOREIGN KEY (`AddressID`) REFERENCES `Address` (`AddressID`);

--
-- Constraints for table `Pilot`
--
ALTER TABLE `Pilot`
  ADD CONSTRAINT `Pilot_ibfk_1` FOREIGN KEY (`AddressID`) REFERENCES `Address` (`AddressID`);

--
-- Constraints for table `PilotRate`
--
ALTER TABLE `PilotRate`
  ADD CONSTRAINT `PilotRate_ibfk_1` FOREIGN KEY (`AirplaneTypeID`) REFERENCES `AirplaneType` (`AirplaneTypeID`),
  ADD CONSTRAINT `PilotRate_ibfk_2` FOREIGN KEY (`PilotFAAID`) REFERENCES `Pilot` (`PilotFAAID`);

--
-- Constraints for table `TicketRes`
--
ALTER TABLE `TicketRes`
  ADD CONSTRAINT `TicketRes_ibfk_1` FOREIGN KEY (`FlightNumber`, `FlightDate`) REFERENCES `ActualFlight` (`FlightNumber`, `FlightDate`),
  ADD CONSTRAINT `TicketRes_ibfk_2` FOREIGN KEY (`PassengerFFN`) REFERENCES `Passenger` (`PassengerFFN`),
  ADD CONSTRAINT `TicketRes_ibfk_3` FOREIGN KEY (`AirplaneID`) REFERENCES `Airplane` (`AirplaneID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
