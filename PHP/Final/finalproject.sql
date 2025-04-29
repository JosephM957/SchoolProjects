-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3308
-- Generation Time: Nov 22, 2024 at 07:14 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `finalproject`
--

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `Company_ID` int(4) NOT NULL,
  `YEAR_FOUNDED` year(4) NOT NULL,
  `Comp_Name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`Company_ID`, `YEAR_FOUNDED`, `Comp_Name`) VALUES
(1, '1977', 'Nickelodeon'),
(2, '1923', 'Disney'),
(3, '1998', 'The Pokemon Company');

-- --------------------------------------------------------

--
-- Table structure for table `genre`
--

CREATE TABLE `genre` (
  `GENRE_ID` int(1) NOT NULL,
  `GENRE_NAME` varchar(11) NOT NULL,
  `SUB_GENRE1` varchar(20) NOT NULL,
  `SUB_GENRE2` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `genre`
--

INSERT INTO `genre` (`GENRE_ID`, `GENRE_NAME`, `SUB_GENRE1`, `SUB_GENRE2`) VALUES
(1, 'Adventure', 'Heroic Fantasy', 'Sword and Sorcery'),
(2, 'Comedy', 'Musical-comedy', 'Slapstick-comedy'),
(3, 'Action', 'Superhero', 'Spy'),
(4, 'Sitcom', 'Animated Sitcom', 'Work Com'),
(5, 'Drama', 'Tenn Drama', 'Comedy Drama');

-- --------------------------------------------------------

--
-- Table structure for table `producer`
--

CREATE TABLE `producer` (
  `PRODUCER_ID` int(2) NOT NULL,
  `PRODUCCER_FNAME` varchar(15) NOT NULL,
  `PRODUCCER_LNAME` varchar(11) NOT NULL,
  `COMPANY_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `producer`
--

INSERT INTO `producer` (`PRODUCER_ID`, `PRODUCCER_FNAME`, `PRODUCCER_LNAME`, `COMPANY_ID`) VALUES
(1, 'Daron', 'Nefcy', 2),
(2, 'Thomas', 'Astruc', 2),
(3, 'Dan', 'Povenmire', 2),
(4, 'Bryan', 'Moore', 2),
(5, 'Gino', 'Guzzardo', 2),
(6, 'Rob', 'Lotterstein', 2),
(7, 'Pamella', 'Eells', 2),
(8, 'Alex', 'Hirsch', 2),
(9, 'Nicholas', 'Tucker', 3),
(10, 'Satoshi', 'Tajir', 3),
(11, 'Daiki', 'Tomiyasu', 3),
(15, 'Junichi', 'Masuda', 3),
(16, 'Dan', 'Cross', 1),
(17, ' Jeffrey	', 'Goldstein', 1),
(18, 'Adriana', 'Galindo', 1),
(19, 'Bruce', 'Berman', 1);

-- --------------------------------------------------------

--
-- Table structure for table `show`
--

CREATE TABLE `show` (
  `Show_ID` int(2) NOT NULL,
  `NAME` varchar(60) NOT NULL,
  `EPISODES` int(4) NOT NULL,
  `SEASONS` int(1) NOT NULL,
  `START YEAR` int(4) NOT NULL,
  `END YEAR` int(4) DEFAULT NULL,
  `Company_ID` int(4) NOT NULL,
  `GENRE_ID` int(11) NOT NULL,
  `PRODUCER_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `show`
--

INSERT INTO `show` (`Show_ID`, `NAME`, `EPISODES`, `SEASONS`, `START YEAR`, `END YEAR`, `Company_ID`, `GENRE_ID`, `PRODUCER_ID`) VALUES
(1, 'Star vs the forces of evil', 77, 4, 2015, 2019, 2, 1, 1),
(2, 'Phineas and Ferb', 140, 5, 2007, 2015, 2, 2, 3),
(3, 'Miraculous: Tales of Ladybug & Cat Noir', 140, 5, 2015, NULL, 2, 1, 2),
(4, 'Milo Murphy\'s Law', 40, 2, 2016, 2019, 2, 1, 3),
(5, 'Hamster & Gretel', 36, 2, 2022, NULL, 2, 1, 3),
(6, 'Lab Rats', 98, 4, 2012, 2015, 2, 2, 4),
(7, 'Lab Rats: Elite Force', 16, 1, 2016, 2016, 2, 2, 4),
(8, 'Chibi Tiny Tales', 112, 5, 2020, NULL, 2, 2, 5),
(9, 'K.C. Undercover', 76, 3, 2015, 2018, 2, 3, 6),
(10, 'The villans of Valley View', 38, 2, 2022, NULL, 2, 3, 4),
(11, 'Jessie', 98, 4, 2011, 2015, 2, 4, 7),
(12, 'Gravity Falls', 41, 2, 2012, 2016, 2, 1, 8),
(13, 'Pokemon Master Journeys', 42, 1, 2021, 2022, 3, 3, 9),
(14, 'Pokémon Ultimate Journeys', 42, 1, 2022, 2023, 3, 3, 9),
(15, 'Pokemon Journeys', 48, 1, 2020, 2021, 3, 3, 9),
(16, 'Pokemon Horizons', 34, 1, 2024, NULL, 3, 3, 10),
(17, 'Pokemon To Be a Pokemon Master: Ultimate Journeys', 12, 1, 2023, 2023, 3, 3, 10),
(18, 'Sun and Moon Ultra Adventures', 48, 1, 2018, 2019, 3, 3, 11),
(19, 'Pokemon Sun and Moon', 43, 1, 2016, 2017, 3, 3, 11),
(20, 'Pokemon Sun and Moon Ultra Legends', 54, 1, 2019, 2020, 3, 3, 11),
(21, 'Pokemon XY', 49, 1, 2013, 2014, 3, 3, 15),
(22, 'Pokemon XY Kalos Quest', 45, 1, 2015, 2015, 3, 3, 15),
(23, 'Pokemon XYZ', 48, 1, 2016, 2017, 3, 3, 15),
(24, 'Pokemon Black and White', 48, 1, 2011, 2012, 3, 1, 10),
(25, 'Pokemon Black and White Rival Destinies', 49, 1, 2012, 2013, 3, 1, 10),
(26, 'Pokemon Black and White Adventures in Unova and beyond', 45, 1, 2013, 2013, 3, 1, 10),
(27, 'The Thundermans', 99, 4, 2013, 2018, 1, 3, 16),
(28, 'Henery Danger', 121, 5, 2014, 2020, 1, 3, 17),
(29, 'Every Witch Way', 85, 3, 2014, 2015, 1, 5, 18),
(30, 'Game Shakers', 61, 3, 2015, 2019, 1, 2, 19);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`Company_ID`);

--
-- Indexes for table `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`GENRE_ID`);

--
-- Indexes for table `producer`
--
ALTER TABLE `producer`
  ADD PRIMARY KEY (`PRODUCER_ID`),
  ADD KEY `COMPANY_ID` (`COMPANY_ID`);

--
-- Indexes for table `show`
--
ALTER TABLE `show`
  ADD PRIMARY KEY (`Show_ID`),
  ADD UNIQUE KEY `NAME` (`NAME`),
  ADD KEY `GENRE_ID` (`GENRE_ID`),
  ADD KEY `PRODUCER_ID` (`PRODUCER_ID`),
  ADD KEY `Company_ID` (`Company_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `Company_ID` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `genre`
--
ALTER TABLE `genre`
  MODIFY `GENRE_ID` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `producer`
--
ALTER TABLE `producer`
  MODIFY `PRODUCER_ID` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `show`
--
ALTER TABLE `show`
  MODIFY `Show_ID` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `producer`
--
ALTER TABLE `producer`
  ADD CONSTRAINT `producer_ibfk_1` FOREIGN KEY (`COMPANY_ID`) REFERENCES `company` (`Company_ID`);

--
-- Constraints for table `show`
--
ALTER TABLE `show`
  ADD CONSTRAINT `show_ibfk_1` FOREIGN KEY (`GENRE_ID`) REFERENCES `genre` (`GENRE_ID`),
  ADD CONSTRAINT `show_ibfk_2` FOREIGN KEY (`PRODUCER_ID`) REFERENCES `producer` (`PRODUCER_ID`),
  ADD CONSTRAINT `show_ibfk_3` FOREIGN KEY (`Company_ID`) REFERENCES `company` (`Company_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
