-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 05, 2025 at 09:22 AM
-- Server version: 8.0.41
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `railwaydb`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_passenger_names` ()   BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE p_name VARCHAR(100);
    DECLARE cur CURSOR FOR SELECT name FROM passengers;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur;

    read_loop: LOOP
        FETCH cur INTO p_name;
        IF done THEN
            LEAVE read_loop;
        END IF;
        INSERT INTO passenger_names (name) VALUES (p_name);
    END LOOP;

    CLOSE cur;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ShowPassengerNames` ()   BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE pname VARCHAR(100);
    DECLARE cur CURSOR FOR SELECT name FROM passenger;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO pname;
        IF done THEN
            LEAVE read_loop;
        END IF;
        SELECT pname AS Passenger_Name;
    END LOOP;
    CLOSE cur;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `ID` int NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Position` varchar(100) DEFAULT NULL,
  `Salary` double DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Tel` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`ID`, `Name`, `Position`, `Salary`, `Email`, `Tel`) VALUES
(1, 'Harsh', 'Manager', 60000, 'harsh@example.com', '9876543210'),
(2, 'Rahul', 'Driver', 40000, 'rahul@example.com', '9123456789'),
(3, 'Priya', 'Ticket Clerk', 35000, 'priya@example.com', '9988776655'),
(4, 'Diya', 'Manager', 100000, 'diyasharma04@gmail.com', '0987654321');

-- --------------------------------------------------------

--
-- Table structure for table `passenger`
--

CREATE TABLE `passenger` (
  `passenger_id` int NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `age` int DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `contact_number` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `passenger`
--

INSERT INTO `passenger` (`passenger_id`, `name`, `age`, `gender`, `contact_number`) VALUES
(1, 'Harsh Thakur', 22, 'Male', NULL),
(2, 'Diya Sharma', 21, 'Female', NULL),
(3, 'Aarav Mehta', 25, 'Male', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `passengers`
--

CREATE TABLE `passengers` (
  `passenger_id` int NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `age` int DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `contact_number` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `passengers`
--

INSERT INTO `passengers` (`passenger_id`, `name`, `age`, `gender`, `contact_number`) VALUES
(1, 'Harsh', 21, 'Male', '9876543210'),
(2, 'diya', 20, 'female', '9831509492');

--
-- Triggers `passengers`
--
DELIMITER $$
CREATE TRIGGER `after_passenger_insert` AFTER INSERT ON `passengers` FOR EACH ROW BEGIN
    INSERT INTO passenger_log (passenger_id)
    VALUES (NEW.passenger_id);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `passenger_log`
--

CREATE TABLE `passenger_log` (
  `log_id` int NOT NULL,
  `passenger_id` int DEFAULT NULL,
  `action_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `passenger_log`
--

INSERT INTO `passenger_log` (`log_id`, `passenger_id`, `action_time`) VALUES
(1, 1, '2025-04-08 03:01:09'),
(2, 2, '2025-04-08 03:11:27');

-- --------------------------------------------------------

--
-- Table structure for table `passenger_names`
--

CREATE TABLE `passenger_names` (
  `name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `passenger_names`
--

INSERT INTO `passenger_names` (`name`) VALUES
('Harsh');

-- --------------------------------------------------------

--
-- Stand-in structure for view `passenger_reservation_view`
-- (See below for the actual view)
--
CREATE TABLE `passenger_reservation_view` (
`passenger_id` int
,`name` varchar(100)
,`reservation_id` int
,`train_id` int
,`seat_number` varchar(10)
,`travel_date` date
);

-- --------------------------------------------------------

--
-- Table structure for table `reservations`
--

CREATE TABLE `reservations` (
  `reservation_id` int NOT NULL,
  `passenger_id` int DEFAULT NULL,
  `train_id` int DEFAULT NULL,
  `seat_number` varchar(10) DEFAULT NULL,
  `travel_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `reservations`
--

INSERT INTO `reservations` (`reservation_id`, `passenger_id`, `train_id`, `seat_number`, `travel_date`) VALUES
(1, 1, 101, 'A1-05', '2025-04-10');

-- --------------------------------------------------------

--
-- Table structure for table `reservation_log`
--

CREATE TABLE `reservation_log` (
  `log_id` int NOT NULL,
  `reservation_id` int DEFAULT NULL,
  `log_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `trains`
--

CREATE TABLE `trains` (
  `ID` int NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Capacity` int DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `train_name` varchar(100) DEFAULT NULL,
  `source` varchar(100) DEFAULT NULL,
  `destination` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `trains`
--

INSERT INTO `trains` (`ID`, `Name`, `Capacity`, `Description`, `train_name`, `source`, `destination`) VALUES
(101, 'Express 1', 200, NULL, NULL, NULL, NULL),
(102, 'Superfast 2', 250, NULL, NULL, NULL, NULL),
(103, NULL, 20, 'this is a test', NULL, NULL, NULL),
(104, NULL, 50, 'longest test', NULL, NULL, NULL),
(105, NULL, 70, 'sex', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `trips`
--

CREATE TABLE `trips` (
  `ID` int NOT NULL,
  `Start` varchar(100) DEFAULT NULL,
  `Destination` varchar(100) DEFAULT NULL,
  `DepartureTime` time DEFAULT NULL,
  `ArrTime` time DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `BookedSeats` int DEFAULT NULL,
  `Price` double DEFAULT NULL,
  `Driver` int DEFAULT NULL,
  `Train` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `trips`
--

INSERT INTO `trips` (`ID`, `Start`, `Destination`, `DepartureTime`, `ArrTime`, `Date`, `BookedSeats`, `Price`, `Driver`, `Train`) VALUES
(1, 'Chennai', 'Delhi', '10:00:00', '20:00:00', '2025-03-22', 0, 1500.5, 2, 101),
(2, 'Mumbai', 'Kolkata', '08:30:00', '18:45:00', '2025-03-23', 0, 1800.75, 2, 102);

-- --------------------------------------------------------

--
-- Table structure for table `trip_passengers`
--

CREATE TABLE `trip_passengers` (
  `TripID` int NOT NULL,
  `PassengerID` int NOT NULL,
  `Tickets` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `trip_passengers`
--

INSERT INTO `trip_passengers` (`TripID`, `PassengerID`, `Tickets`) VALUES
(1, 1001, 2),
(1, 1002, 1),
(2, 1003, 3);

-- --------------------------------------------------------

--
-- Structure for view `passenger_reservation_view`
--
DROP TABLE IF EXISTS `passenger_reservation_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `passenger_reservation_view`  AS SELECT `p`.`passenger_id` AS `passenger_id`, `p`.`name` AS `name`, `r`.`reservation_id` AS `reservation_id`, `r`.`train_id` AS `train_id`, `r`.`seat_number` AS `seat_number`, `r`.`travel_date` AS `travel_date` FROM (`passengers` `p` join `reservations` `r` on((`p`.`passenger_id` = `r`.`passenger_id`))) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `passenger`
--
ALTER TABLE `passenger`
  ADD PRIMARY KEY (`passenger_id`);

--
-- Indexes for table `passengers`
--
ALTER TABLE `passengers`
  ADD PRIMARY KEY (`passenger_id`);

--
-- Indexes for table `passenger_log`
--
ALTER TABLE `passenger_log`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `reservations`
--
ALTER TABLE `reservations`
  ADD PRIMARY KEY (`reservation_id`),
  ADD KEY `passenger_id` (`passenger_id`);

--
-- Indexes for table `reservation_log`
--
ALTER TABLE `reservation_log`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `trains`
--
ALTER TABLE `trains`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `trips`
--
ALTER TABLE `trips`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `trip_passengers`
--
ALTER TABLE `trip_passengers`
  ADD PRIMARY KEY (`TripID`,`PassengerID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `passenger`
--
ALTER TABLE `passenger`
  MODIFY `passenger_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `passengers`
--
ALTER TABLE `passengers`
  MODIFY `passenger_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `passenger_log`
--
ALTER TABLE `passenger_log`
  MODIFY `log_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `reservations`
--
ALTER TABLE `reservations`
  MODIFY `reservation_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `reservation_log`
--
ALTER TABLE `reservation_log`
  MODIFY `log_id` int NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `reservations`
--
ALTER TABLE `reservations`
  ADD CONSTRAINT `reservations_ibfk_1` FOREIGN KEY (`passenger_id`) REFERENCES `passengers` (`passenger_id`);

--
-- Constraints for table `trip_passengers`
--
ALTER TABLE `trip_passengers`
  ADD CONSTRAINT `trip_passengers_ibfk_1` FOREIGN KEY (`TripID`) REFERENCES `trips` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
