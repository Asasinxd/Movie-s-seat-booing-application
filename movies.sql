-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 05 Lis 2022, 14:00
-- Wersja serwera: 10.4.11-MariaDB
-- Wersja PHP: 7.2.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `movies`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `first`
--

CREATE TABLE `first` (
  `place_id` int(11) NOT NULL,
  `reservation` text COLLATE utf8_bin NOT NULL,
  `client_name` text COLLATE utf8_bin NOT NULL,
  `client_number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Zrzut danych tabeli `first`
--

INSERT INTO `first` (`place_id`, `reservation`, `client_name`, `client_number`) VALUES
(1, 'yes', 'test', 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `fourth`
--

CREATE TABLE `fourth` (
  `place_id` int(11) NOT NULL,
  `reservation` text COLLATE utf8_bin NOT NULL,
  `client_name` text COLLATE utf8_bin NOT NULL,
  `client_number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Zrzut danych tabeli `fourth`
--

INSERT INTO `fourth` (`place_id`, `reservation`, `client_name`, `client_number`) VALUES
(1, 'no', '', 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `second`
--

CREATE TABLE `second` (
  `place_id` int(11) NOT NULL,
  `reservation` text COLLATE utf8_bin NOT NULL,
  `client_name` text COLLATE utf8_bin NOT NULL,
  `client_number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Zrzut danych tabeli `second`
--

INSERT INTO `second` (`place_id`, `reservation`, `client_name`, `client_number`) VALUES
(1, 'yes', '', 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `third`
--

CREATE TABLE `third` (
  `place_id` int(11) NOT NULL,
  `reservation` text COLLATE utf8_bin NOT NULL,
  `client_name` text COLLATE utf8_bin NOT NULL,
  `client_number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Zrzut danych tabeli `third`
--

INSERT INTO `third` (`place_id`, `reservation`, `client_name`, `client_number`) VALUES
(1, 'yes', 'Adrian', 0);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `first`
--
ALTER TABLE `first`
  ADD PRIMARY KEY (`place_id`);

--
-- Indeksy dla tabeli `fourth`
--
ALTER TABLE `fourth`
  ADD PRIMARY KEY (`place_id`);

--
-- Indeksy dla tabeli `second`
--
ALTER TABLE `second`
  ADD PRIMARY KEY (`place_id`);

--
-- Indeksy dla tabeli `third`
--
ALTER TABLE `third`
  ADD PRIMARY KEY (`place_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `first`
--
ALTER TABLE `first`
  MODIFY `place_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=506;

--
-- AUTO_INCREMENT dla tabeli `fourth`
--
ALTER TABLE `fourth`
  MODIFY `place_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=506;

--
-- AUTO_INCREMENT dla tabeli `second`
--
ALTER TABLE `second`
  MODIFY `place_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=506;

--
-- AUTO_INCREMENT dla tabeli `third`
--
ALTER TABLE `third`
  MODIFY `place_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=506;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
