-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 19, 2023 at 12:47 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `care`
--

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `Name`, `status`) VALUES
(1, 'Karachi', 1),
(2, 'Lahore', 1),
(3, 'Multan', 1);

-- --------------------------------------------------------

--
-- Table structure for table `diseases`
--

CREATE TABLE `diseases` (
  `ID` int(11) NOT NULL,
  `Name` varchar(200) NOT NULL,
  `Description` text NOT NULL,
  `uploadDate` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `doctorsspecializations`
--

CREATE TABLE `doctorsspecializations` (
  `ID` int(11) NOT NULL,
  `user_ID` int(11) NOT NULL,
  `specialization_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hospitals`
--

CREATE TABLE `hospitals` (
  `ID` int(11) NOT NULL,
  `City_ID` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `ID` int(11) NOT NULL,
  `User_ID` int(11) NOT NULL,
  `Role_ID` int(11) NOT NULL,
  `Username` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`ID`, `User_ID`, `Role_ID`, `Username`, `Password`) VALUES
(1, 1, 1, 'admin', 'admin@123');

-- --------------------------------------------------------

--
-- Table structure for table `medicalnews`
--

CREATE TABLE `medicalnews` (
  `ID` int(11) NOT NULL,
  `Headline` varchar(200) NOT NULL,
  `NewsBody` text NOT NULL,
  `Author` varchar(100) NOT NULL,
  `Source` varchar(100) NOT NULL,
  `PublicationDate` date NOT NULL,
  `UploadDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `ID` int(11) NOT NULL,
  `Role` varchar(100) NOT NULL,
  `Description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`ID`, `Role`, `Description`) VALUES
(1, 'Administrator', 'Web Administrator, Master Login.'),
(2, 'Doctor', 'Doctor of Medicine.'),
(3, 'Patient', 'A person in medical need.');

-- --------------------------------------------------------

--
-- Table structure for table `specializations`
--

CREATE TABLE `specializations` (
  `ID` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `specializations`
--

INSERT INTO `specializations` (`ID`, `Name`, `Description`) VALUES
(1, 'General Medicine', 'Specialization in General Medicine (more than covers the entire body excluding maxo-facial and eye)'),
(2, 'General Surgery', 'Specialization in General Surgery'),
(3, 'Otorhinolaryngology', 'Specialization  dealing  with  the  surgical  and  medical management of conditions of the head and neck.'),
(4, 'Internal Medicine', 'Similar to general medicine, with the difference that this only  caters  to  adult  patients  only.  Specialization  in prevention, diagnosis, and treatment of internal diseases'),
(5, 'Immunology', 'Specialization in immune systems in the body and antigen-antibody allergic reactions.'),
(6, 'Critical Care Medicine', 'Specialization in critically ill patients with life-threatening conditions'),
(7, 'Infectious Diseases', 'Specialization  in  diagnosis  and  treatment  of  complex infections.');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `ID` int(11) NOT NULL,
  `FirstName` varchar(100) NOT NULL,
  `MidName` varchar(100) NOT NULL,
  `LastName` varchar(100) NOT NULL,
  `Contact_Residence` varchar(50) NOT NULL,
  `Contact_Mobile` varchar(50) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Address` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`ID`, `FirstName`, `MidName`, `LastName`, `Contact_Residence`, `Contact_Mobile`, `Email`, `Address`) VALUES
(1, 'Syed', 'Murtaza', 'Hussain', '0307-2526307', '0314-2308332', 'sirmurtazaaptechtr@outlook.com', 'Karachi, Pakistan.');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `diseases`
--
ALTER TABLE `diseases`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `doctorsspecializations`
--
ALTER TABLE `doctorsspecializations`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `specialization_ID` (`specialization_ID`),
  ADD KEY `user_ID` (`user_ID`);

--
-- Indexes for table `hospitals`
--
ALTER TABLE `hospitals`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `City_ID` (`City_ID`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Role_ID` (`Role_ID`),
  ADD KEY `User_ID` (`User_ID`);

--
-- Indexes for table `medicalnews`
--
ALTER TABLE `medicalnews`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `specializations`
--
ALTER TABLE `specializations`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `diseases`
--
ALTER TABLE `diseases`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `doctorsspecializations`
--
ALTER TABLE `doctorsspecializations`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hospitals`
--
ALTER TABLE `hospitals`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `medicalnews`
--
ALTER TABLE `medicalnews`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `specializations`
--
ALTER TABLE `specializations`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `doctorsspecializations`
--
ALTER TABLE `doctorsspecializations`
  ADD CONSTRAINT `doctorsspecializations_ibfk_1` FOREIGN KEY (`specialization_ID`) REFERENCES `specializations` (`ID`),
  ADD CONSTRAINT `doctorsspecializations_ibfk_2` FOREIGN KEY (`user_ID`) REFERENCES `users` (`ID`);

--
-- Constraints for table `hospitals`
--
ALTER TABLE `hospitals`
  ADD CONSTRAINT `hospitals_ibfk_1` FOREIGN KEY (`City_ID`) REFERENCES `cities` (`id`);

--
-- Constraints for table `login`
--
ALTER TABLE `login`
  ADD CONSTRAINT `login_ibfk_1` FOREIGN KEY (`Role_ID`) REFERENCES `roles` (`ID`),
  ADD CONSTRAINT `login_ibfk_2` FOREIGN KEY (`User_ID`) REFERENCES `users` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
