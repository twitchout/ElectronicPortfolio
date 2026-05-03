-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 28, 2026 at 08:12 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `movie_library`
--

-- --------------------------------------------------------

--
-- Table structure for table `directors`
--

CREATE TABLE `directors` (
  `directorID` int(11) NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `country` varchar(50) NOT NULL,
  `birthYear` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `directors`
--

INSERT INTO `directors` (`directorID`, `firstName`, `lastName`, `country`, `birthYear`) VALUES
(1, 'Christopher', 'Nolan', 'UK', 1970),
(2, 'Greta', 'Gerwig', 'USA', 1983),
(3, 'Quentin', 'Tarantino', 'USA', 1963),
(4, 'Martin', 'Scorsese', 'USA', 1942),
(5, 'Denis', 'Villeneuve', 'Canada', 1967),
(6, 'Sofia', 'Coppola', 'USA', 1971),
(7, 'Steven', 'Spielberg', 'USA', 1946),
(8, 'Tristan', 'Lake', 'United States', 2006);

-- --------------------------------------------------------

--
-- Table structure for table `movies`
--

CREATE TABLE `movies` (
  `movieID` int(11) NOT NULL,
  `directorID` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `genre` varchar(50) NOT NULL,
  `releaseYear` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `movies`
--

INSERT INTO `movies` (`movieID`, `directorID`, `title`, `genre`, `releaseYear`) VALUES
(1, 1, 'Inception', 'Sci-Fi', 2010),
(2, 2, 'Barbie', 'Comedy', 2023),
(3, 3, 'Pulp Fiction', 'Crime', 1994),
(4, 4, 'Goodfellas', 'Crime', 1990),
(5, 5, 'Dune', 'Sci-Fi', 2021),
(6, 6, 'Lost in Translation', 'Drama', 2003),
(7, 7, 'Jurassic Park', 'Adventure', 1993);

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `reviewID` int(11) NOT NULL,
  `movieID` int(11) NOT NULL,
  `reviewerName` varchar(100) NOT NULL,
  `rating` decimal(2,1) NOT NULL,
  `commentText` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`reviewID`, `movieID`, `reviewerName`, `rating`, `commentText`) VALUES
(1, 1, 'Alex Smith', 9.5, 'Mind-bending and visually stunning.'),
(2, 2, 'Jamie Lee', 8.7, 'Funny, colorful, and surprisingly thoughtful.'),
(3, 3, 'Taylor Green', 9.8, 'Sharp writing and iconic performances.'),
(4, 4, 'Morgan White', 9.2, 'A classic crime film with amazing pacing.'),
(5, 5, 'Chris Black', 8.9, 'Epic scale and excellent atmosphere.'),
(6, 6, 'Jordan Hall', 8.4, 'Beautifully shot and emotionally subtle.'),
(7, 7, 'Casey Young', 9.0, 'Still one of the most entertaining blockbusters ever.');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `directors`
--
ALTER TABLE `directors`
  ADD PRIMARY KEY (`directorID`);

--
-- Indexes for table `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`movieID`),
  ADD KEY `directorID` (`directorID`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`reviewID`),
  ADD KEY `movieID` (`movieID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `directors`
--
ALTER TABLE `directors`
  MODIFY `directorID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `movies`
--
ALTER TABLE `movies`
  MODIFY `movieID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `reviewID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `movies`
--
ALTER TABLE `movies`
  ADD CONSTRAINT `movies_ibfk_1` FOREIGN KEY (`directorID`) REFERENCES `directors` (`directorID`);

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`movieID`) REFERENCES `movies` (`movieID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
