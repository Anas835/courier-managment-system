-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: jan 07, 2021 at 08:10 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cms_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `branches`
--

CREATE TABLE `branches` (
  `id` int(30) NOT NULL,
  `branch_code` varchar(50) NOT NULL,
  `street` text NOT NULL,
  `city` text NOT NULL,
  `state` text NOT NULL,
  `zip_code` varchar(50) NOT NULL,
  `country` text NOT NULL,
  `contact` varchar(100) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `branches`
--

INSERT INTO `branches` (`id`, `branch_code`, `street`, `city`, `state`, `zip_code`, `country`, `contact`, `date_created`) VALUES
(1, 'vzTL0PqMogyOWhF', 'Branch 1 St., JP Nagar', 'Bangalore', 'Karnataka', '560078', 'India', '+080 123 455 623', '2021-01-16 11:21:41'),
(3, 'KyIab3mYBgAX71t', 'VV Road', 'Mandya', 'Karnataka', '571401', 'India', '+080 1234567489', '2021-01-16 16:45:05'),
(4, 'dIbUK5mEh96f0Zc', 'Bannimantapa', 'Mysore', 'Karnataka', '570075', 'India', '080 123456858', '2021-01-17 13:31:49');

-- --------------------------------------------------------

--
-- Table structure for table `parcels`
--

CREATE TABLE `parcels` (
  `id` int(30) NOT NULL,
  `reference_number` varchar(100) NOT NULL,
  `sender_name` text NOT NULL,
  `sender_address` text NOT NULL,
  `sender_contact` text NOT NULL,
  `recipient_name` text NOT NULL,
  `recipient_address` text NOT NULL,
  `recipient_contact` text NOT NULL,
  `type` int(1) NOT NULL COMMENT '1 = Deliver, 2=Pickup',
  `from_branch_id` int(30) NOT NULL,
  `to_branch_id` int(30) NOT NULL,
  `weight` varchar(100) NOT NULL,
  `height` varchar(100) NOT NULL,
  `width` varchar(100) NOT NULL,
  `length` varchar(100) NOT NULL,
  `price` float NOT NULL,
  `status` int(2) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `parcels`
--

INSERT INTO `parcels` (`id`, `reference_number`, `sender_name`, `sender_address`, `sender_contact`, `recipient_name`, `recipient_address`, `recipient_contact`, `type`, `from_branch_id`, `to_branch_id`, `weight`, `height`, `width`, `length`, `price`, `status`, `date_created`) VALUES
(1, '201406231415', 'Moin', 'Bangalore', '+91 8987123456', 'Vipul', 'Mandya', '+91875531464', 1, 1, 0, '30kg', '12in', '12in', '15in', 2500, 7, '2021-01-16 16:15:46'),
(2, '117967400213', 'Sarfaraz', 'Mandya', '+918969123456', 'Nithin', 'Mysore', '+9187458844', 2, 1, 3, '30kg', '12in', '12in', '15in', 2500, 1, '2021-01-16 16:46:03'),
(3, '983186540795', 'Amith', 'Mysore', '+918754123456', 'Nanda', 'Bangalore', '+918856432177', 2, 1, 3, '20Kg', '10in', '10in', '10in', 1500, 2, '2021-01-16 16:46:03'),
(4, '514912669061', 'Manoj', 'Bangalore', '+918569123456', 'Prokshith', 'Mysore', '+91887612345', 2, 4, 1, '23kg', '12in', '12in', '15in', 1900, 0, '2021-01-17 13:52:14'),
(5, '897856905844', 'Sudeep', 'Mysore', '+918239123456', 'Shourish', 'Mandya', '+91987612345', 2, 4, 1, '30kg', '10in', '10in', '10in', 1450, 0, '2021-01-17 13:52:14'),
(6, '505604168988', 'Vyshak', 'Mandya', '+918965123456', 'Arvind', 'Bangalore', '+91965412345', 1, 0, 0, '23kg', '12in', '12in', '15in', 2500, 1, '2021-01-17 14:06:42');

-- --------------------------------------------------------

--
-- Table structure for table `parcel_tracks`
--

CREATE TABLE `parcel_tracks` (
  `id` int(30) NOT NULL,
  `parcel_id` int(30) NOT NULL,
  `status` int(2) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `parcel_tracks`
--

INSERT INTO `parcel_tracks` (`id`, `parcel_id`, `status`, `date_created`) VALUES
(1, 2, 1, '2021-01-17 09:53:27'),
(2, 3, 1, '2021-01-17 09:55:17'),
(3, 1, 1, '2021-01-17 10:28:01'),
(4, 1, 2, '2021-01-17 10:28:10'),
(5, 1, 3, '2021-01-17 10:28:16'),
(6, 1, 4, '2021-01-17 11:05:03'),
(7, 1, 5, '2021-01-17 11:05:17'),
(8, 1, 7, '2021-01-17 11:05:26'),
(9, 3, 2, '2021-01-17 11:05:41'),
(10, 6, 1, '2021-01-17 14:06:57');

-- --------------------------------------------------------

--
-- Table structure for table `system_settings`
--

CREATE TABLE `system_settings` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(200) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `address` text NOT NULL,
  `cover_img` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `system_settings`
--

INSERT INTO `system_settings` (`id`, `name`, `email`, `contact`, `address`, `cover_img`) VALUES
(1, 'Courier Management System', 'info@sample.comm', '+0808 8542 623', '2102  JP Nagar, Bangalore, India, 14608', '');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(30) NOT NULL,
  `firstname` varchar(200) NOT NULL,
  `lastname` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` text NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 2 COMMENT '1 = admin, 2 = staff',
  `branch_id` int(30) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `password`, `type`, `branch_id`, `date_created`) VALUES
(1, 'Moin', 'Khan M', 'moin@gmail.com', 'moin@123', 1, 0, '2021-01-16 10:57:04'),
(2, 'Mohammed', 'Sarafaraz', 'sarfaraz@gmail.com', 'sarfaraz@123', 2, 1, '2021-01-16 11:52:04'),
(3, 'Amith', 'Gupta', 'amith@gmail.com', 'amith@123', 2, 4, '2021-01-17 13:32:12');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `branches`
--
ALTER TABLE `branches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `parcels`
--
ALTER TABLE `parcels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `parcel_tracks`
--
ALTER TABLE `parcel_tracks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_settings`
--
ALTER TABLE `system_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `branches`
--
ALTER TABLE `branches`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `parcels`
--
ALTER TABLE `parcels`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `parcel_tracks`
--
ALTER TABLE `parcel_tracks`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `system_settings`
--
ALTER TABLE `system_settings`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
