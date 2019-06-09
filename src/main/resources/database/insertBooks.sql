-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 09, 2019 at 07:04 AM
-- Server version: 8.0.13-4
-- PHP Version: 7.2.19-0ubuntu0.18.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vH1WjvdNx9`
--

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `book_id` int(11) NOT NULL,
  `author` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `isbn` varchar(13) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `release_date` int(11) DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`book_id`, `author`, `description`, `isbn`, `release_date`, `status`, `title`) VALUES
(1, 'Murakami Haruki', 'Polski przekład \"1Q84\" autorstwa Anny Zielińskiej-Elliott jest czwartym na świecie tłumaczeniem powieści Harukiego Murakamiego. ', '543254343328', 2009, 'AVAILABLE', '1Q84: Tom 1 '),
(2, 'Roth Philip', 'Powieść została uhonorowana Nagrodą Pulitzera za 1998 rok. ', '4643264325534', 1997, 'AVAILABLE', 'Amerykańska sielanka'),
(3, 'Bator Joanna', 'Kontynuacja \"Piaskowej Góry\", jednej z najciekawszych książek polskich ostatnich lat.', '53298532843', 2010, 'UNAVAILABLE', 'Chmurdalia'),
(5, 'Oz Amos', '\"»Czarna skrzynka« wibruje echem żydowskiej literatury, od Biblii aż po Bellowa\". \r\n\"Times Literary Supplement\" ', '534465757636', 1987, 'AVAILABLE', 'Czarna skrzynka'),
(6, 'King Stephen', 'Thriller psychologiczny będący błyskotliwym studium charakteru i ciemnych stron kobiecej psychiki, literacki triumf Kinga.', '9930774002532', 1994, 'AVAILABLE', 'Dolores Claiborne '),
(7, 'Larsson Stieg', 'Druga część trylogii norweskiej.', '9943662991297', 2009, 'AVAILABLE', 'Dziewczyna, która igrała z ogniem '),
(8, 'Miłoszewski Zygmunt', 'Zygmunt Miłoszewski to dziś jeden z najciekawszych polskich twórców literatury kryminalnej.', '990376122213', 2014, 'AVAILABLE', 'Gniew'),
(9, 'Irving John', '\"Hotel New Hampshire\"   to pełna erotyki i humoru niekonwencjonalna saga.', '7630026642343', 1992, 'AVAILABLE', 'Hotel New Hampshire '),
(10, 'Wiesław Myśliwski', '„Kamień na kamieniu” Wiesława Myśliwskiego to książka znakomita pod każdym względem. ', '772004652782', 1984, 'AVAILABLE', 'Kamień na kamieniu '),
(11, 'Smith Zadie', 'Przedstawia problem imigrantów przybywających do Europy z różnych zakątków świata w niekonwencjonalny sposób.', '520477299023', 2002, 'AVAILABLE', 'Białe zęby'),
(12, 'Russell Willy', 'Raymond Marks, pod presją rodziny ma podjąć pierwszą w życiu pracę, z dala od domu. Podczas  podróży pisze listy do swojego ulubionego piosenkarza, Morrisseya, któremu opowiada, w jaki sposób stał się Innym Chłopcem. ', '994782994224', 2003, 'AVAILABLE', 'Inny chłopiec '),
(13, 'Choderlos de Laclos Piere', '\"Niebezpieczne związki\" to jedna z najlepszych książek epoki libertynizmu we Francji. ', '88935654829', 1912, 'AVAILABLE', 'Niebezpieczne związki '),
(14, 'Irving John', '„Regulamin tłoczni win” to wzruszająca i pełna ciepłego humoru opowieść o ludzkich losach i niełatwych życiowych wyborach. ', '655230089402', 1995, 'AVAILABLE', 'Regulamin tłoczni win'),
(15, 'Myśliwski Wiesław', '\"Traktat o łuskaniu fasoli\" to wielka powieść metafizyczna. Instykt pisarski pozwala autorowi to, co doświadczone i przemyślane, przekształcić w wybitne dzieło literackie - przemawiające także do młodego czytelnika. ', '9973256722421', 2006, 'AVAILABLE', 'Traktat o łuskaniu fasoli '),
(16, 'Wharton William', 'Historia o szaleństwie, przyjaźni, wojnie i pragnieniu wolności. ', '655629920073', 1985, 'AVAILABLE', 'Ptasiek  ');

-- --------------------------------------------------------

--
-- Table structure for table `borrows`
--

CREATE TABLE `borrows` (
  `borrow_id` int(11) NOT NULL,
  `end_date` date DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `book_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `borrows`
--

INSERT INTO `borrows` (`borrow_id`, `end_date`, `start_date`, `book_id`, `user_id`) VALUES
(2, '2019-06-05', '2019-06-04', 3, 2),
(3, '2019-06-05', '2019-06-03', 1, 2),
(4, '2019-06-08', '2019-06-04', 2, 2),
(5, '2019-06-05', '2019-06-04', 3, 2),
(6, '2019-06-05', '2019-06-04', 5, 2),
(7, '2019-06-07', '2019-06-04', 1, 2),
(8, NULL, '2019-06-05', 3, 2),
(9, '2019-06-07', '2019-06-07', 5, 2),
(10, '2019-06-07', '2019-06-06', 2, 9),
(11, '2019-06-07', '2019-06-06', 2, 9),
(12, '2019-06-07', '2019-06-06', 2, 10);

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `role_id` int(11) NOT NULL,
  `role` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`role_id`, `role`) VALUES
(1, 'ROLE_ADMIN'),
(2, 'ROLE_USER');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `login` varchar(25) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `active` tinyint(4) NOT NULL,
  `ban` bit(1) DEFAULT NULL,
  `costs` decimal(19,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `login`, `email`, `password`, `first_name`, `last_name`, `active`, `ban`, `costs`) VALUES
(1, 'admin', 'admin@gmail.com', '$2a$10$Pl.mEJvC/1zsg7FFgC5ihe0ddvPNeY3ag8S8Gm2E50sgH6sE8rh22', 'Admin', 'Admin', 1, b'0', '0.00'),
(2, 'test', 'test@gmail.com', '$2a$10$TM92qxuC.39DpmnqX3hIxuQchUJIzUgh9h45JrU.3Alb.jzqgM5d2', 'Tester', 'Test', 1, b'0', '0.00'),
(3, 'test2', 'test2@gmail.com', '$2a$10$TM92qxuC.39DpmnqX3hIxuQchUJIzUgh9h45JrU.3Alb.jzqgM5d2', 'Tester', 'Test', 1, b'0', '0.00'),
(4, 'test3', 'test3@gmail.com', '$2a$10$TM92qxuC.39DpmnqX3hIxuQchUJIzUgh9h45JrU.3Alb.jzqgM5d2', 'Tester', 'Test', 1, b'0', '0.00'),
(6, 'test5', 'test5@gmail.com', '$2a$10$rMQ3bRZF81x7glE4RWegauMihvnrnQw6T/Q./t.jEDMOQwF1mgB82', 'Tester', 'Test', 0, b'0', '0.00'),
(7, 'test6', 'test6@gmail.com', '$2a$10$BDCYEFK8hQqN1x/bO1WTKOTLjiLSqMSEdZx6Cyua43VDbOr45ti8C', 'Tester', 'Testowy', 1, b'0', '0.00'),
(8, 'fddgfdfg', 'dfgdfg@fdgdsfgdsf.pl', '$2a$10$raePnLhLfKOVxe/g6u2OVugOTmpa4CW41VNEI0Wbd1uxLu/XQyWsy', 'werewr', 'erwrw', 1, b'0', NULL),
(9, 'radek9553', 'radek.wlazly@gmail.com', '$2a$10$vOBIzeU09gzo6NUmKlHx4.Xc/MY3gBaJ5mjoLkyaNa8fiwpKb9zH.', 'Radosław', 'Wlazły', 1, b'0', '0.00'),
(10, 'onpotrafi', 'radek@gmail.com', '$2a$10$.h3mKCadnigbmKhMbh/gaeR4r6bj7ocW1mpFK56j8ZGlLBJDResH.', 'Radosław', 'Wlazły', 1, b'0', '0.00');

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

CREATE TABLE `user_role` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user_role`
--

INSERT INTO `user_role` (`user_id`, `role_id`) VALUES
(4, 2),
(1, 1),
(2, 2),
(3, 2),
(6, 2),
(7, 2),
(8, 2),
(8, 2),
(9, 2),
(10, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`book_id`);

--
-- Indexes for table `borrows`
--
ALTER TABLE `borrows`
  ADD PRIMARY KEY (`borrow_id`),
  ADD KEY `FK8789wjikihu9ocbhamiw789y9` (`book_id`),
  ADD KEY `FK8n485wdcvxbjno4gf3c7gx1ew` (`user_id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_role`
--
ALTER TABLE `user_role`
  ADD KEY `FKa68196081fvovjhkek5m97n3y` (`role_id`),
  ADD KEY `FK859n2jvi8ivhui0rl0esws6o` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `book_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `borrows`
--
ALTER TABLE `borrows`
  MODIFY `borrow_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `borrows`
--
ALTER TABLE `borrows`
  ADD CONSTRAINT `FK8789wjikihu9ocbhamiw789y9` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`),
  ADD CONSTRAINT `FK8n485wdcvxbjno4gf3c7gx1ew` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `user_role`
--
ALTER TABLE `user_role`
  ADD CONSTRAINT `FK859n2jvi8ivhui0rl0esws6o` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `FKa68196081fvovjhkek5m97n3y` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
