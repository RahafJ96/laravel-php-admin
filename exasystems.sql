-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 10, 2022 at 11:20 PM
-- Server version: 5.7.36
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `exasystems`
--

-- --------------------------------------------------------

--
-- Table structure for table `merchants`
--

DROP TABLE IF EXISTS `merchants`;
CREATE TABLE IF NOT EXISTS `merchants` (
  `id` int(11) NOT NULL,
  `merchant_name` varchar(25) NOT NULL,
  `created_at` varchar(25) NOT NULL,
  `admin_id` int(11) NOT NULL,
  KEY `admin_id` (`admin_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `merchants`
--

INSERT INTO `merchants` (`id`, `merchant_name`, `created_at`, `admin_id`) VALUES
(1, 'Germany', 'today', 1),
(2, 'Mexico', '2022-03-09 20:56:58', 1);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` varchar(25) NOT NULL,
  `created_at` varchar(25) NOT NULL,
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `status`, `created_at`) VALUES
(1, 1, 'new', 'today');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
CREATE TABLE IF NOT EXISTS `order_items` (
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`order_id`, `product_id`, `quantity`) VALUES
(1, 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `merchant_id` int(11) NOT NULL,
  `price` float NOT NULL,
  `status` varchar(25) NOT NULL,
  `created_at` datetime NOT NULL,
  KEY `merchant_id` (`merchant_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `merchant_id`, `price`, `status`, `created_at`) VALUES
(1, 'Alfreds Futterkiste', 1, 100, 'new', '2022-03-09 17:52:26'),
(2, 'Centro comercial Moctezuma', 2, 120.96, 'new', '2022-03-09 22:46:03');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL,
  `full_name` varchar(25) NOT NULL,
  `slug` varchar(25) NOT NULL,
  `created_at` timestamp NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `full_name`, `slug`, `created_at`) VALUES
(1, 'rahaf', 'test', '2022-03-09 17:56:58');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
