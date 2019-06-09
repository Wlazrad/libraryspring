-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 05 Cze 2019, 17:33
-- Wersja serwera: 10.1.36-MariaDB
-- Wersja PHP: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `portal`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `books`
--

CREATE TABLE `books` (
  `book_id` int(11) NOT NULL,
  `author` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `isbn` varchar(13) COLLATE utf8_unicode_ci DEFAULT NULL,
  `release_date` int(11) DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Zrzut danych tabeli `books`
--

INSERT INTO `books` (`book_id`, `author`, `description`, `isbn`, `release_date`, `status`, `title`) VALUES
(1, 'Bork Amator', 'Albo i najgorsza tesz morze byci', '5432543', 1999, 'AVAILABLE', 'Najlepsza ksionszka'),
(2, 'Kozak koza', 'haharagra', '464326432', 2010, 'AVAILABLE', 'Pewnego razu'),
(3, 'Roman Pozer', 'Spring i Hibernate to koks', '532985328', 2018, 'UNAVAILABLE', 'Hibernate'),
(5, 'Lorek Morek', 'Hahaha', '5344657576436', 2018, 'AVAILABLE', 'Nowy rozdzia?');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `borrows`
--

CREATE TABLE `borrows` (
  `borrow_id` int(11) NOT NULL,
  `end_date` date DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `book_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Zrzut danych tabeli `borrows`
--

INSERT INTO `borrows` (`borrow_id`, `end_date`, `start_date`, `book_id`, `user_id`) VALUES
(2, NULL, '2019-06-05', 3, 2);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `role`
--

CREATE TABLE `role` (
  `role_id` int(11) NOT NULL,
  `role` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Zrzut danych tabeli `role`
--

INSERT INTO `role` (`role_id`, `role`) VALUES
(1, 'ROLE_ADMIN'),
(2, 'ROLE_USER');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `login` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `active` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Zrzut danych tabeli `user`
--

INSERT INTO `user` (`user_id`, `login`, `email`, `password`, `first_name`, `last_name`, `active`) VALUES
(1, 'admin', 'admin@gmail.com', '$2a$10$Pl.mEJvC/1zsg7FFgC5ihe0ddvPNeY3ag8S8Gm2E50sgH6sE8rh22', 'Admin', 'Admin', 1),
(2, 'test', 'test@gmail.com', '$2a$10$TM92qxuC.39DpmnqX3hIxuQchUJIzUgh9h45JrU.3Alb.jzqgM5d2', 'Tester', 'Test', 1),
(3, 'test2', 'test2@gmail.com', '$2a$10$TM92qxuC.39DpmnqX3hIxuQchUJIzUgh9h45JrU.3Alb.jzqgM5d2', 'Tester', 'Test', 1),
(4, 'test3', 'test3@gmail.com', '$2a$10$TM92qxuC.39DpmnqX3hIxuQchUJIzUgh9h45JrU.3Alb.jzqgM5d2', 'Tester', 'Test', 1),
(6, 'test5', 'test5@gmail.com', '$2a$10$rMQ3bRZF81x7glE4RWegauMihvnrnQw6T/Q./t.jEDMOQwF1mgB82', 'Tester', 'Test', 0),
(7, 'test6', 'test6@gmail.com', '$2a$10$BDCYEFK8hQqN1x/bO1WTKOTLjiLSqMSEdZx6Cyua43VDbOr45ti8C', 'Tester', 'Testowy', 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user_role`
--

CREATE TABLE `user_role` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Zrzut danych tabeli `user_role`
--

INSERT INTO `user_role` (`user_id`, `role_id`) VALUES
(4, 2),
(1, 1),
(2, 2),
(3, 2),
(6, 2),
(7, 2),
(8, 2);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`book_id`);

--
-- Indeksy dla tabeli `borrows`
--
ALTER TABLE `borrows`
  ADD PRIMARY KEY (`borrow_id`),
  ADD KEY `FK8789wjikihu9ocbhamiw789y9` (`book_id`),
  ADD KEY `FK8n485wdcvxbjno4gf3c7gx1ew` (`user_id`);

--
-- Indeksy dla tabeli `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`role_id`);

--
-- Indeksy dla tabeli `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- Indeksy dla tabeli `user_role`
--
ALTER TABLE `user_role`
  ADD KEY `FKa68196081fvovjhkek5m97n3y` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `books`
--
ALTER TABLE `books`
  MODIFY `book_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT dla tabeli `borrows`
--
ALTER TABLE `borrows`
  MODIFY `borrow_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT dla tabeli `role`
--
ALTER TABLE `role`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT dla tabeli `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `borrows`
--
ALTER TABLE `borrows`
  ADD CONSTRAINT `FK8789wjikihu9ocbhamiw789y9` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`),
  ADD CONSTRAINT `FK8n485wdcvxbjno4gf3c7gx1ew` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Ograniczenia dla tabeli `user_role`
--
ALTER TABLE `user_role`
  ADD CONSTRAINT `FKa68196081fvovjhkek5m97n3y` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
