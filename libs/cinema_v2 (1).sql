-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 27 Gru 2022, 15:17
-- Wersja serwera: 10.4.27-MariaDB
-- Wersja PHP: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `cinema`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `cinema_hall`
--

CREATE TABLE `cinema_hall` (
  `Hall_ID` int(11) NOT NULL,
  `Hall_type` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `cinema_hall`
--

INSERT INTO `cinema_hall` (`Hall_ID`, `Hall_type`) VALUES
(1, 'VIP'),
(2, 'NORMAL');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `movies`
--

CREATE TABLE `movies` (
  `movie_ID` int(11) NOT NULL,
  `title` text NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `movies`
--

INSERT INTO `movies` (`movie_ID`, `title`, `date`, `time`) VALUES
(1, 'AVATAR: Istota wody', '2023-01-26', '18:00:00'),
(2, 'LISTY DO M. 5', '2022-12-26', '15:00:00'),
(3, 'KOT w BUTACH. Ostatnie życzenie', '2022-12-27', '15:00:00');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `reservation`
--

CREATE TABLE `reservation` (
  `reservation_ID` int(11) NOT NULL,
  `Name` text NOT NULL,
  `Second_Name` text NOT NULL,
  `Tel` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `seats`
--

CREATE TABLE `seats` (
  `seat_nr` int(11) NOT NULL,
  `hall_Id` int(11) DEFAULT NULL,
  `movie_Id` int(11) DEFAULT NULL,
  `reserved` tinyint(1) DEFAULT NULL,
  `reservation_Id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `seats`
--

INSERT INTO `seats` (`seat_nr`, `hall_Id`, `movie_Id`, `reserved`, `reservation_Id`) VALUES
(1, 1, 1, 0, NULL),
(2, 1, 1, 0, NULL),
(3, 1, 1, 0, NULL),
(4, 1, 1, 0, NULL),
(5, 1, 1, 0, NULL),
(6, 1, 1, 0, NULL),
(7, 1, 1, 0, NULL),
(8, 1, 1, 0, NULL),
(9, 1, 1, 0, NULL),
(10, 1, 1, 0, NULL),
(11, 1, 1, 0, NULL),
(12, 1, 1, 0, NULL),
(13, 1, 1, 0, NULL),
(14, 1, 1, 0, NULL),
(15, 1, 1, 0, NULL),
(16, 1, 1, 0, NULL),
(17, 1, 1, 0, NULL),
(18, 1, 1, 0, NULL),
(19, 1, 1, 0, NULL),
(20, 1, 1, 0, NULL),
(21, 1, 1, 0, NULL),
(22, 1, 1, 0, NULL),
(23, 1, 1, 0, NULL),
(24, 1, 1, 0, NULL),
(25, 1, 1, 0, NULL),
(26, 1, 1, 0, NULL),
(27, 1, 1, 0, NULL),
(28, 1, 1, 0, NULL),
(29, 1, 1, 0, NULL),
(30, 1, 1, 0, NULL),
(31, 1, 1, 0, NULL),
(32, 1, 1, 0, NULL),
(33, 1, 1, 0, NULL),
(34, 1, 1, 0, NULL),
(35, 1, 1, 0, NULL),
(36, 1, 1, 0, NULL),
(37, 1, 1, 0, NULL),
(38, 1, 1, 0, NULL),
(39, 1, 1, 0, NULL),
(40, 1, 1, 0, NULL),
(41, 1, 1, 0, NULL),
(42, 1, 1, 0, NULL),
(43, 1, 1, 0, NULL),
(44, 1, 1, 0, NULL),
(45, 1, 1, 0, NULL),
(46, 1, 1, 0, NULL),
(47, 1, 1, 0, NULL),
(48, 1, 1, 0, NULL),
(1, 2, 1, 0, NULL),
(2, 2, 1, 0, NULL),
(3, 2, 1, 0, NULL),
(4, 2, 1, 0, NULL),
(5, 2, 1, 0, NULL),
(6, 2, 1, 0, NULL),
(7, 2, 1, 0, NULL),
(8, 2, 1, 0, NULL),
(9, 2, 1, 0, NULL),
(10, 2, 1, 0, NULL),
(11, 2, 1, 0, NULL),
(12, 2, 1, 0, NULL),
(13, 2, 1, 0, NULL),
(14, 2, 1, 0, NULL),
(15, 2, 1, 0, NULL),
(16, 2, 1, 0, NULL),
(17, 2, 1, 0, NULL),
(18, 2, 1, 0, NULL),
(19, 2, 1, 0, NULL),
(20, 2, 1, 0, NULL),
(21, 2, 1, 0, NULL),
(22, 2, 1, 0, NULL),
(23, 2, 1, 0, NULL),
(24, 2, 1, 0, NULL),
(25, 2, 1, 0, NULL),
(26, 2, 1, 0, NULL),
(27, 2, 1, 0, NULL),
(28, 2, 1, 0, NULL),
(29, 2, 1, 0, NULL),
(30, 2, 1, 0, NULL),
(31, 2, 1, 0, NULL),
(32, 2, 1, 0, NULL),
(33, 2, 1, 0, NULL),
(34, 2, 1, 0, NULL),
(35, 2, 1, 0, NULL),
(36, 2, 1, 0, NULL),
(37, 2, 1, 0, NULL),
(38, 2, 1, 0, NULL),
(39, 2, 1, 0, NULL),
(40, 2, 1, 0, NULL),
(41, 2, 1, 0, NULL),
(42, 2, 1, 0, NULL),
(43, 2, 1, 0, NULL),
(44, 2, 1, 0, NULL),
(45, 2, 1, 0, NULL),
(46, 2, 1, 0, NULL),
(47, 2, 1, 0, NULL),
(48, 2, 1, 0, NULL),
(1, 2, 2, 0, NULL),
(2, 2, 2, 0, NULL),
(3, 2, 2, 0, NULL),
(4, 2, 2, 0, NULL),
(5, 2, 2, 0, NULL),
(6, 2, 2, 0, NULL),
(7, 2, 2, 0, NULL),
(8, 2, 2, 0, NULL),
(9, 2, 2, 0, NULL),
(10, 2, 2, 0, NULL),
(11, 2, 2, 0, NULL),
(12, 2, 2, 0, NULL),
(13, 2, 2, 0, NULL),
(14, 2, 2, 0, NULL),
(15, 2, 2, 0, NULL),
(16, 2, 2, 0, NULL),
(17, 2, 2, 0, NULL),
(18, 2, 2, 0, NULL),
(19, 2, 2, 0, NULL),
(20, 2, 2, 0, NULL),
(21, 2, 2, 0, NULL),
(22, 2, 2, 0, NULL),
(23, 2, 2, 0, NULL),
(24, 2, 2, 0, NULL),
(25, 2, 2, 0, NULL),
(26, 2, 2, 0, NULL),
(27, 2, 2, 0, NULL),
(28, 2, 2, 0, NULL),
(29, 2, 2, 0, NULL),
(30, 2, 2, 0, NULL),
(31, 2, 2, 0, NULL),
(32, 2, 2, 0, NULL),
(33, 2, 2, 0, NULL),
(34, 2, 2, 0, NULL),
(35, 2, 2, 0, NULL),
(36, 2, 2, 0, NULL),
(37, 2, 2, 0, NULL),
(38, 2, 2, 0, NULL),
(39, 2, 2, 0, NULL),
(40, 2, 2, 0, NULL),
(41, 2, 2, 0, NULL),
(42, 2, 2, 0, NULL),
(43, 2, 2, 0, NULL),
(44, 2, 2, 0, NULL),
(45, 2, 2, 0, NULL),
(46, 2, 2, 0, NULL),
(47, 2, 2, 0, NULL),
(48, 2, 2, 0, NULL),
(1, 1, 2, 0, NULL),
(2, 1, 2, 0, NULL),
(3, 1, 2, 0, NULL),
(4, 1, 2, 0, NULL),
(5, 1, 2, 0, NULL),
(6, 1, 2, 0, NULL),
(7, 1, 2, 0, NULL),
(8, 1, 2, 0, NULL),
(9, 1, 2, 0, NULL),
(10, 1, 2, 0, NULL),
(11, 1, 2, 0, NULL),
(12, 1, 2, 0, NULL),
(13, 1, 2, 0, NULL),
(14, 1, 2, 0, NULL),
(15, 1, 2, 0, NULL),
(16, 1, 2, 0, NULL),
(17, 1, 2, 0, NULL),
(18, 1, 2, 0, NULL),
(19, 1, 2, 0, NULL),
(20, 1, 2, 0, NULL),
(21, 1, 2, 0, NULL),
(22, 1, 2, 0, NULL),
(23, 1, 2, 0, NULL),
(24, 1, 2, 0, NULL),
(25, 1, 2, 0, NULL),
(26, 1, 2, 0, NULL),
(27, 1, 2, 0, NULL),
(28, 1, 2, 0, NULL),
(29, 1, 2, 0, NULL),
(30, 1, 2, 0, NULL),
(31, 1, 2, 0, NULL),
(32, 1, 2, 0, NULL),
(33, 1, 2, 0, NULL),
(34, 1, 2, 0, NULL),
(35, 1, 2, 0, NULL),
(36, 1, 2, 0, NULL),
(37, 1, 2, 0, NULL),
(38, 1, 2, 0, NULL),
(39, 1, 2, 0, NULL),
(40, 1, 2, 0, NULL),
(41, 1, 2, 0, NULL),
(42, 1, 2, 0, NULL),
(43, 1, 2, 0, NULL),
(44, 1, 2, 0, NULL),
(45, 1, 2, 0, NULL),
(46, 1, 2, 0, NULL),
(47, 1, 2, 0, NULL),
(48, 1, 2, 0, NULL),
(1, 1, 3, 0, NULL),
(2, 1, 3, 0, NULL),
(3, 1, 3, 0, NULL),
(4, 1, 3, 0, NULL),
(5, 1, 3, 0, NULL),
(6, 1, 3, 0, NULL),
(7, 1, 3, 0, NULL),
(8, 1, 3, 0, NULL),
(9, 1, 3, 0, NULL),
(10, 1, 3, 0, NULL),
(11, 1, 3, 0, NULL),
(12, 1, 3, 0, NULL),
(13, 1, 3, 0, NULL),
(14, 1, 3, 0, NULL),
(15, 1, 3, 0, NULL),
(16, 1, 3, 0, NULL),
(17, 1, 3, 0, NULL),
(18, 1, 3, 0, NULL),
(19, 1, 3, 0, NULL),
(20, 1, 3, 0, NULL),
(21, 1, 3, 0, NULL),
(22, 1, 3, 0, NULL),
(23, 1, 3, 0, NULL),
(24, 1, 3, 0, NULL),
(25, 1, 3, 0, NULL),
(26, 1, 3, 0, NULL),
(27, 1, 3, 0, NULL),
(28, 1, 3, 0, NULL),
(29, 1, 3, 0, NULL),
(30, 1, 3, 0, NULL),
(31, 1, 3, 0, NULL),
(32, 1, 3, 0, NULL),
(33, 1, 3, 0, NULL),
(34, 1, 3, 0, NULL),
(35, 1, 3, 0, NULL),
(36, 1, 3, 0, NULL),
(37, 1, 3, 0, NULL),
(38, 1, 3, 0, NULL),
(39, 1, 3, 0, NULL),
(40, 1, 3, 0, NULL),
(41, 1, 3, 0, NULL),
(42, 1, 3, 0, NULL),
(43, 1, 3, 0, NULL),
(44, 1, 3, 0, NULL),
(45, 1, 3, 0, NULL),
(46, 1, 3, 0, NULL),
(47, 1, 3, 0, NULL),
(48, 1, 3, 0, NULL),
(1, 2, 3, 0, NULL),
(2, 2, 3, 0, NULL),
(3, 2, 3, 0, NULL),
(4, 2, 3, 0, NULL),
(5, 2, 3, 0, NULL),
(6, 2, 3, 0, NULL),
(7, 2, 3, 0, NULL),
(8, 2, 3, 0, NULL),
(9, 2, 3, 0, NULL),
(10, 2, 3, 0, NULL),
(11, 2, 3, 0, NULL),
(12, 2, 3, 0, NULL),
(13, 2, 3, 0, NULL),
(14, 2, 3, 0, NULL),
(15, 2, 3, 0, NULL),
(16, 2, 3, 0, NULL),
(17, 2, 3, 0, NULL),
(18, 2, 3, 0, NULL),
(19, 2, 3, 0, NULL),
(20, 2, 3, 0, NULL),
(21, 2, 3, 0, NULL),
(22, 2, 3, 0, NULL),
(23, 2, 3, 0, NULL),
(24, 2, 3, 0, NULL),
(25, 2, 3, 0, NULL),
(26, 2, 3, 0, NULL),
(27, 2, 3, 0, NULL),
(28, 2, 3, 0, NULL),
(29, 2, 3, 0, NULL),
(30, 2, 3, 0, NULL),
(31, 2, 3, 0, NULL),
(32, 2, 3, 0, NULL),
(33, 2, 3, 0, NULL),
(34, 2, 3, 0, NULL),
(35, 2, 3, 0, NULL),
(36, 2, 3, 0, NULL),
(37, 2, 3, 0, NULL),
(38, 2, 3, 0, NULL),
(39, 2, 3, 0, NULL),
(40, 2, 3, 0, NULL),
(41, 2, 3, 0, NULL),
(42, 2, 3, 0, NULL),
(43, 2, 3, 0, NULL),
(44, 2, 3, 0, NULL),
(45, 2, 3, 0, NULL),
(46, 2, 3, 0, NULL),
(47, 2, 3, 0, NULL),
(48, 2, 3, 0, NULL);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `cinema_hall`
--
ALTER TABLE `cinema_hall`
  ADD PRIMARY KEY (`Hall_ID`);

--
-- Indeksy dla tabeli `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`movie_ID`);

--
-- Indeksy dla tabeli `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`reservation_ID`);

--
-- Indeksy dla tabeli `seats`
--
ALTER TABLE `seats`
  ADD KEY `FK_SEATS_HallId` (`hall_Id`),
  ADD KEY `FK_SEATS_MoviesId` (`movie_Id`),
  ADD KEY `FK_SEATS_ReservationId` (`reservation_Id`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `cinema_hall`
--
ALTER TABLE `cinema_hall`
  MODIFY `Hall_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT dla tabeli `movies`
--
ALTER TABLE `movies`
  MODIFY `movie_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT dla tabeli `reservation`
--
ALTER TABLE `reservation`
  MODIFY `reservation_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `seats`
--
ALTER TABLE `seats`
  ADD CONSTRAINT `FK_SEATS_HallId` FOREIGN KEY (`hall_Id`) REFERENCES `cinema_hall` (`Hall_ID`),
  ADD CONSTRAINT `FK_SEATS_MoviesId` FOREIGN KEY (`movie_Id`) REFERENCES `movies` (`movie_ID`),
  ADD CONSTRAINT `FK_SEATS_ReservationId` FOREIGN KEY (`reservation_Id`) REFERENCES `reservation` (`reservation_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
