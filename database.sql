-- phpMyAdmin SQL Dump
-- version 4.6.6
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 23, 2019 at 07:35 AM
-- Server version: 10.1.37-MariaDB-2.cba
-- PHP Version: 7.1.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `amakarem`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `firstname`, `lastname`, `email`, `password`) VALUES
(1, 'Ahmed', 'Elaaser', 'admin@admin.com', 'e99a18c428cb38d5f260853678922e03');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'Food');

-- --------------------------------------------------------

--
-- Table structure for table `orderitems`
--

CREATE TABLE `orderitems` (
  `id` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `pquantity` varchar(255) NOT NULL,
  `orderid` int(11) NOT NULL,
  `productprice` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orderitems`
--

INSERT INTO `orderitems` (`id`, `pid`, `pquantity`, `orderid`, `productprice`) VALUES
(10, 2, '1', 7, '2.00'),
(11, 18, '20', 8, '1.00'),
(12, 19, '20', 8, '3.74'),
(13, 19, '20', 9, '3.74'),
(14, 1, '10', 10, '0.3'),
(15, 18, '10', 11, '1.00'),
(16, 2, '10', 12, '2.00'),
(17, 2, '1', 13, '2.00'),
(18, 1, '100', 14, '0.3'),
(19, 2, '20', 14, '2.00'),
(20, 1, '100', 15, '0.3'),
(21, 2, '20', 16, '2.00'),
(22, 18, '13', 17, '1.00');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `totalprice` varchar(255) NOT NULL,
  `orderstatus` varchar(255) NOT NULL,
  `shipping` varchar(30) NOT NULL,
  `paymentmode` varchar(255) NOT NULL,
  `timestamp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `uid`, `totalprice`, `orderstatus`, `shipping`, `paymentmode`, `timestamp`) VALUES
(6, 7, '0', 'Order Placed', 'DHL', 'bln', '2018-06-19 08:25:54'),
(7, 7, '2', 'Order Placed', 'UPS', 'bln', '2018-06-19 08:33:18'),
(8, 7, '94.8', 'Order Placed', 'DHL', 'bln', '2018-06-19 10:25:04'),
(9, 7, '74.8', 'Order Placed', 'UPS', 'bln', '2018-06-21 14:50:31'),
(10, 7, '3', 'Order Placed', 'UPS', 'bln', '2018-06-21 15:03:11'),
(11, 7, '10', 'Order Placed', 'UPS', 'bln', '2018-06-21 15:07:29'),
(12, 7, '20', 'Order Placed', 'UPS', 'bln', '2018-06-21 15:09:56'),
(13, 7, '2', 'Order Placed', 'Free Shipping', 'bln', '2018-06-21 17:15:39'),
(14, 10, '70', 'Order Placed', 'UPS', 'bln', '2018-06-21 17:20:51'),
(15, 10, '30', 'Order Placed', 'UPS', 'bln', '2018-07-02 16:31:44'),
(16, 11, '40', 'Order Placed', 'UPS', 'bln', '2018-07-02 16:33:46'),
(17, 7, '18', 'Order Placed', 'UPS', 'bln', '2018-07-02 18:59:57');

-- --------------------------------------------------------

--
-- Table structure for table `ordertracking`
--

CREATE TABLE `ordertracking` (
  `id` int(11) NOT NULL,
  `orderid` int(11) NOT NULL,
  `status` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `timestamp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ordertracking`
--

INSERT INTO `ordertracking` (`id`, `orderid`, `status`, `message`, `timestamp`) VALUES
(7, 7, 'Cancelled', ' ', '2018-06-19 08:47:44');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `catid` int(11) NOT NULL,
  `price` varchar(255) NOT NULL,
  `thumb` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `unit` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `catid`, `price`, `thumb`, `description`, `unit`) VALUES
(1, 'Apple', 1, '0.3', 'uploads/495878092.jpg', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Sed elit dui, pellentesque a, faucibus vel, interdum nec, diam. Aenean id metus id velit ullamcorper pulvinar.', 'KG'),
(2, 'Beer', 1, '2.00', 'uploads/1448031613421.jpeg', 'Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur', 'Bottle'),
(18, 'Water', 1, '1.00', 'uploads/The-Health-Benefits-of-Water-722x406.jpg', 'sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem', 'Bottle'),
(19, 'Cheese', 1, '3.74', 'uploads/gouda_hero.jpg', 'eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Sed convallis magna eu sem', 'KG');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `review` text NOT NULL,
  `rate` int(1) NOT NULL,
  `timestamp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `pid`, `uid`, `review`, `rate`, `timestamp`) VALUES
(6, 18, 7, 'revew with stars test', 4, '2018-07-02 18:54:21'),
(7, 1, 11, '', 4, '2018-07-02 20:16:07'),
(8, 1, 10, '', 2, '2018-07-02 20:17:08');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `timestamp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `timestamp`) VALUES
(7, 'ahmed.elaaser@outlook.com', '$2y$10$4MX6Oe8ovOvbwLCl6V.UV.6cRZdA6/zCr8vndT7hZedMJ0.Nv4nZm', '2018-06-19 08:25:16'),
(8, 'ninoskaduin@gmail.com', '$2y$10$nEAaBft1T43lcVLDyjgOju3t6xykt8Df7I3eskhdMWvKWd3pU5Lx.', '2018-06-21 15:19:33'),
(9, 'abc@gmail.com', '$2y$10$2/9/rCK3UjGir1EsDRqNVeJQhKIAM1yvuD/mtJ.INWyHgwZIdWUZW', '2018-06-21 15:47:23'),
(10, 'test1@gmail.com', '$2y$10$/pKEWtlbBAuVN3bqg.q1YusjAI5bxpNaW68J7jEk7qTWgvsXupGS2', '2018-06-21 17:00:57'),
(11, 'test2@gmail.com', '$2y$10$YRL6Nuys88OAJxMj8m2.aug10Yv/9XypProRKrpKXdN7xumRuAoLy', '2018-07-02 16:32:26');

-- --------------------------------------------------------

--
-- Table structure for table `usersmeta`
--

CREATE TABLE `usersmeta` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `company` varchar(255) NOT NULL,
  `address1` varchar(255) NOT NULL,
  `address2` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `zip` varchar(255) NOT NULL,
  `mobile` varchar(255) NOT NULL,
  `balance` varchar(10) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `usersmeta`
--

INSERT INTO `usersmeta` (`id`, `uid`, `firstname`, `lastname`, `company`, `address1`, `address2`, `city`, `state`, `country`, `zip`, `mobile`, `balance`) VALUES
(3, 7, 'Ahmed', 'demo', 'ABC', 'street 14', '44', 'maadi', 'cairo', '', '1131', '201001961292', '102'),
(4, 10, '', '', '', '', '', '', '', '', '', '', '0'),
(5, 11, '', '', '', '', '', '', '', '', '', '', '60');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `timestamp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`id`, `pid`, `uid`, `timestamp`) VALUES
(4, 19, 8, '2018-06-21 14:17:32');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orderitems`
--
ALTER TABLE `orderitems`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ordertracking`
--
ALTER TABLE `ordertracking`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `usersmeta`
--
ALTER TABLE `usersmeta`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `orderitems`
--
ALTER TABLE `orderitems`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `ordertracking`
--
ALTER TABLE `ordertracking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `usersmeta`
--
ALTER TABLE `usersmeta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
