-- phpMyAdmin SQL Dump
-- version 4.0.10.14
-- http://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: Jan 18, 2017 at 04:10 AM
-- Server version: 5.6.34
-- PHP Version: 5.6.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `sitadmin_pos1`
--

-- --------------------------------------------------------

--
-- Table structure for table `sma_addresses`
--

CREATE TABLE IF NOT EXISTS `sma_addresses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `line1` varchar(50) NOT NULL,
  `line2` varchar(50) DEFAULT NULL,
  `city` varchar(25) NOT NULL,
  `postal_code` varchar(20) DEFAULT NULL,
  `state` varchar(25) NOT NULL,
  `country` varchar(50) NOT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `company_id` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sma_adjustments`
--

CREATE TABLE IF NOT EXISTS `sma_adjustments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `reference_no` varchar(55) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `note` text,
  `attachment` varchar(55) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `count_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `warehouse_id` (`warehouse_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `sma_adjustments`
--

INSERT INTO `sma_adjustments` (`id`, `date`, `reference_no`, `warehouse_id`, `note`, `attachment`, `created_by`, `updated_by`, `updated_at`, `count_id`) VALUES
(1, '2016-11-17 14:23:00', '123TTH', 1, '', NULL, 4, NULL, NULL, NULL),
(2, '2016-11-22 12:29:00', '1278945', 2, '', NULL, 2, NULL, NULL, NULL),
(3, '2016-11-26 12:49:00', 'PR/2016/11/0001', 2, '', NULL, 2, NULL, NULL, NULL),
(5, '2016-11-29 10:47:00', '123tth', 2, '', NULL, 2, NULL, NULL, NULL),
(6, '2016-11-29 10:48:00', '124tth', 1, '', NULL, 2, NULL, NULL, NULL),
(7, '2016-11-30 15:54:00', 'golden tea', 1, '', NULL, 2, NULL, NULL, NULL),
(8, '2016-12-01 12:00:00', '125', 2, '', NULL, 2, NULL, NULL, NULL),
(9, '2016-12-02 17:47:00', 'PR/2016/12/0003', 1, '', NULL, 2, NULL, NULL, NULL),
(10, '2016-12-14 11:29:00', 'PR/2016/12/0001', 1, '', NULL, 2, NULL, NULL, NULL),
(11, '2016-12-20 16:22:00', 'PR/2016/12/0002', 1, '', NULL, 2, NULL, NULL, NULL),
(12, '2016-12-23 13:17:00', 'PR/2016/12/0003', 1, '', NULL, 2, NULL, NULL, NULL),
(13, '2017-01-16 19:26:00', 'PR/2017/01/0001', 1, '', NULL, 2, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_adjustment_items`
--

CREATE TABLE IF NOT EXISTS `sma_adjustment_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adjustment_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `type` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `adjustment_id` (`adjustment_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `sma_adjustment_items`
--

INSERT INTO `sma_adjustment_items` (`id`, `adjustment_id`, `product_id`, `option_id`, `quantity`, `warehouse_id`, `serial_no`, `type`) VALUES
(2, 2, 3, NULL, '2.0000', 2, NULL, 'addition'),
(3, 3, 1, NULL, '100.0000', 2, NULL, 'subtraction'),
(5, 5, 8, NULL, '1.0000', 2, NULL, 'addition'),
(6, 6, 1, NULL, '1.0000', 1, NULL, 'subtraction'),
(7, 6, 8, NULL, '1.0000', 1, NULL, 'subtraction'),
(8, 1, 1, NULL, '100.0000', 1, NULL, 'addition'),
(9, 1, 12, NULL, '100.0000', 1, NULL, 'subtraction'),
(13, 8, 22, NULL, '1.0000', 2, NULL, 'addition'),
(14, 9, 28, NULL, '25.0000', 1, NULL, 'addition'),
(15, 10, 31, NULL, '2.0000', 1, NULL, 'addition'),
(16, 7, 14, NULL, '10.0000', 1, NULL, 'addition'),
(17, 7, 16, NULL, '200.0000', 1, NULL, 'addition'),
(18, 11, 16, NULL, '1000.0000', 1, NULL, 'addition'),
(19, 12, 32, NULL, '4.0000', 1, NULL, 'addition'),
(20, 13, 26, NULL, '10.0000', 1, NULL, 'addition');

-- --------------------------------------------------------

--
-- Table structure for table `sma_apinotify`
--

CREATE TABLE IF NOT EXISTS `sma_apinotify` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `merchant_code` bigint(100) NOT NULL,
  `customer_code` bigint(100) NOT NULL,
  `customer_name` varchar(100) NOT NULL,
  `comment` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=38 ;

--
-- Dumping data for table `sma_apinotify`
--

INSERT INTO `sma_apinotify` (`id`, `merchant_code`, `customer_code`, `customer_name`, `comment`) VALUES
(1, 123456789, 123, 'abc', 'wants to ab added'),
(2, 123456789, 123, 'abc', 'A customer sends a request to merchant'),
(3, 123456789, 123, 'abc', 'A customer sends a request to merchant'),
(4, 2147483647, 2147483647, 'chetan', 'A customer sends a request to merchant'),
(5, 2147483647, 2147483647, 'chetan', 'A customer sends a request to merchant'),
(6, 2147483647, 2147483647, 'chetan', 'A customer sends a request to merchant'),
(7, 2147483647, 2147483647, 'chetan', 'A customer sends a request to merchant'),
(8, 8087448286, 8087448287, 'chetan', 'A customer sends a request to merchant'),
(9, 8087448286, 8087448287, 'chetan', 'A customer sends a request to merchant'),
(10, 8087448286, 8087448287, 'chetan', 'A customer sends a request to merchant'),
(11, 8087448286, 8087448287, 'chetan', 'A customer sends a request to merchant'),
(12, 8087448286, 8087448287, 'chetan', 'A customer sends a request to merchant'),
(13, 8087448286, 8087448287, 'chetan', 'A customer sends a request to merchant'),
(14, 8087448286, 8087448287, 'chetan', 'A customer sends a request to merchant'),
(15, 8087448286, 8087448287, 'chetan', 'A customer sends a request to merchant'),
(16, 8087448286, 8087448287, 'chetan', 'A customer sends a request to merchant'),
(17, 8087448286, 8087448287, 'chetan', 'A customer sends a request to merchant'),
(18, 8087448286, 8087448287, 'chetan', 'A customer sends a request to merchant'),
(19, 8087448286, 8087448287, 'chetan', 'A customer sends a request to merchant'),
(20, 8087448286, 8087448287, 'chetan', 'A customer sends a request to merchant'),
(21, 8087448286, 8087448287, 'chetan', 'A customer sends a request to merchant'),
(22, 8087448286, 8087448287, 'chetan', 'A customer sends a request to merchant'),
(23, 8087448286, 8087448287, 'chetan', 'A customer sends a request to merchant'),
(24, 8087448286, 8087448287, 'chetan', 'A customer sends a request to merchant'),
(25, 8087448286, 8087448287, 'chetan', 'A customer sends a request to merchant'),
(26, 8087448286, 8087448287, 'chetan', 'A customer sends a request to merchant'),
(27, 8087448286, 8087448287, 'chetan', 'A customer sends a request to merchant'),
(28, 8087448286, 8087448287, 'chetan', 'A customer sends a request to merchant'),
(29, 8087448286, 8087448287, 'chetan', 'A customer sends a request to merchant'),
(30, 8087448286, 8087448287, 'chetan', 'A customer sends a request to merchant'),
(31, 8087448286, 8087448287, 'chetan', 'A customer sends a request to merchant'),
(32, 8087448286, 9096572182, 'Mohit', 'A customer sends a request to merchant'),
(33, 8087448286, 9096572182, 'Mohit', 'A customer sends a request to merchant'),
(34, 8087448286, 8087448287, 'chetan', 'A customer sends a request to merchant'),
(35, 8087448286, 8087448287, 'chetan', 'A customer sends a request to merchant'),
(36, 8087448286, 8087448287, 'chetan', 'A customer sends a request to merchant'),
(37, 8087448286, 8087448287, 'chetan', 'A customer sends a request to merchant');

-- --------------------------------------------------------

--
-- Table structure for table `sma_brands`
--

CREATE TABLE IF NOT EXISTS `sma_brands` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `image` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

--
-- Dumping data for table `sma_brands`
--

INSERT INTO `sma_brands` (`id`, `code`, `name`, `image`) VALUES
(1, 'GHEE200ML JAR', 'Milma', '270c59b1090b401571a37fa15bf9f073.png'),
(2, 'BRI78952', 'Britannia', 'aecd72c9e051072367995197b5519344.png'),
(3, 'txtbrand', 'test brand', NULL),
(4, 'clinic+', 'Clinic Plus', '7a4ce4e712a6e8d635f5ae6f0ce35035.jpg'),
(5, 'marvel', 'marvel', '8c9d6902ca42e70bcfd5643c55f98383.jpg'),
(6, 'pratima(14)', 'bajaj almond oil', '4c055032ea5c3d9c9a0e8bcfc1574e51.jpg'),
(7, 'gk', 'rice', '4972c3c0e7bf6e3388adf02062f3ce09.jpg'),
(8, 'toothpaste', 'vicco tooth paste', 'd3b440810635737b136fba0ae0ad4632.jpg'),
(9, 'p(123)', 'horlicks', '798db2212e4327e84c42df36f9a5608c.jpg'),
(10, 'i341', 'gugal dhoop', 'd36554f9b9d39d87ff7fe8ad8c520330.jpg'),
(11, 'tea', 'tata tea gold', '0dad4f425d2e1f99177370d5dcb31fe8.jpg'),
(12, '241', 'sultana bulk', '4c568c02e1611864fa6807e34e89cc60.jpg'),
(13, '125', 'tomato ketchup', '15cfa742183a4fdb4063e1337ad8ee67.jpg'),
(14, 'honey', 'dabur honey', '0fe64d449b2417b76a67e95b12a0d2ad.jpg'),
(15, '45', 'eno lemon', 'dab7b72b0b4e54ae846a1f377839d8de.jpg'),
(16, 'jilebi(p)', 'gits jilebi', '728cd1c0d2ed621879ae80f1271055cc.jpg'),
(17, 'pooja(pratima)', 'durga pack', '9701bfa69573c05d8e8bc6dacfdb18c2.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `sma_calendar`
--

CREATE TABLE IF NOT EXISTS `sma_calendar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(55) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `start` datetime NOT NULL,
  `end` datetime DEFAULT NULL,
  `color` varchar(7) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `sma_calendar`
--

INSERT INTO `sma_calendar` (`id`, `title`, `description`, `start`, `end`, `color`, `user_id`) VALUES
(3, 'ibm', 'good', '2016-11-21 00:00:00', '2016-11-22 00:00:00', '#3a87ad', 2);

-- --------------------------------------------------------

--
-- Table structure for table `sma_captcha`
--

CREATE TABLE IF NOT EXISTS `sma_captcha` (
  `captcha_id` bigint(13) unsigned NOT NULL AUTO_INCREMENT,
  `captcha_time` int(10) unsigned NOT NULL,
  `ip_address` varchar(16) CHARACTER SET latin1 NOT NULL DEFAULT '0',
  `word` varchar(20) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`captcha_id`),
  KEY `word` (`word`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sma_categories`
--

CREATE TABLE IF NOT EXISTS `sma_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(55) NOT NULL,
  `name` varchar(55) NOT NULL,
  `image` varchar(55) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=55 ;

--
-- Dumping data for table `sma_categories`
--

INSERT INTO `sma_categories` (`id`, `code`, `name`, `image`, `parent_id`) VALUES
(1, 'C1', 'Category 1', NULL, NULL),
(2, '4444', 'Dals', NULL, 1),
(3, '564', 'Water', NULL, 0),
(4, '456', 'Milk', NULL, 0),
(5, 'BRE946521', 'Bread', '9b73a25781dc03aa6861d2c4d6e231c4.jpg', 0),
(6, 'testcode', 'Test Category', NULL, 0),
(7, 'subcat', 'Test SubCategory', NULL, 6),
(9, 'yogesh123', 'Hair Products', '67b5ad673f862f968afb9d52bbfab2d5.jpg', 0),
(10, 'yogesh1234', 'Sampoo', 'f4d7c8c1e9c6c463e56e989f00f97bad.png', 9),
(11, 'tea', 'tea', '176f28db90c041ad5bb9b19ed6e7d003.jpg', 0),
(12, '124', 'tea', '8a71c9c21bba2d8f9667d76e29a333fd.jpg', 11),
(13, 'open tea(200)', 'open tea', '72bc2c5d8fbb0f63617957f8681b890d.jpg', 11),
(14, 'paste', 'toothpaste', 'bdc3f138694e58cb1b2fdfc7c655d2b1.jpg', 0),
(15, 'colgate', 'colgate', '55e3d2d873b8ad769c5c3298db66195a.png', 14),
(16, 'Biscuits', 'Biscuits', 'b9fd716160d42d005353bc23515f1944.jpg', 0),
(17, 'biscuits(b)', 'britanina bourbon', '55678b1c0fe4529196abbb3024d3658f.jpg', 16),
(18, 'pratima(14)', 'hair product', 'b82bf6ed76b0b937a8fc0bb612d5f271.jpg', 9),
(19, 'rice1', 'rice', '50a99b249c46ecc4b19219edb94b86aa.jpg', 0),
(20, 'rice', 'rice', '912910148a49191d855023200d7d50ac.jpg', 19),
(21, 'Pratima143', 'vico tooth paste', 'eb019f1331a135d382eff36b333f835e.jpg', 14),
(22, 'drink 12', 'drinks', 'f7e0245328fdc4485b9399602835407a.jpg', 0),
(23, 'drnik(12)', 'drinks', 'af84a3ec09ce94af1ca8217465e8660b.jpg', 22),
(24, 'i213', 'incense', 'c3cb102ae7b79d7e31ee16054fd3c219.jpg', 0),
(25, 'p235', 'incense', '9c30d3fbe40d3d775f6cd83df5718e18.jpg', 24),
(26, 'daal 1', 'daal', '99c1ce532918576bd91263b537d9f5ea.jpeg', 0),
(27, 'daal', 'daal', '81c64dc5cc75cfaf8e6c0cb753464b0a.jpeg', 26),
(28, 'sugar 1', 'sugar', '053d773edb2cc8c3666b312006d0ad4c.jpg', 0),
(29, 'facewash (f)', 'facewash', '60d4791144d2a6ff103435e0f41e7386.jpg', 0),
(30, 'soap(S)', 'soap', '2e1be67ad340e0ed091d6cea5d289bb4.jpg', 30),
(31, 'Colddrinkd (cd)', 'coldrink', '6cd3af306eede88ce1e551dbdb4a3bc0.jpg', 22),
(32, 'Namkeen (N-1)', 'Namkeen', '178660eb0f703806bc72e9820dfd3a95.jpg', 0),
(33, 'Poha(p)', 'Poha', '027abbb902cf838e1f731fbf0836a05a.jpg', 19),
(34, 'halwa', 'Instant mixes', '68c953bddda1860d58e2f9e94840eb55.jpg', 0),
(35, '123', 'instant mixes', '625c04a495c6129ec2ca812e0aab33a9.jpg', 0),
(36, '241', 'nuts', '77196ce95d295703e40a3ee4a27a50bc.jpg', 0),
(37, 'nuts bulk', 'nuts', 'f47485a9ea9bf96c394d670a135d8ea0.jpg', 36),
(38, 'ketchup', 'sauces', '3ba50d66d38e10444e802617fa5359e5.jpg', 0),
(39, 'top tomato(p)', 'top sauces', '462a5168595439e406cf26a31dda23da.jpg', 38),
(40, 'drink (dn)', 'water', '02a986c704c06d1eca7882bc86ee7b8a.jpg', 3),
(41, 'peanut (P)', 'peanut( mungfuli)', '8284036e3cf6642797dc70159365ab76.jpg', 0),
(42, 'peanuts (P)', 'peanut(moongfilli)', '89dc544b4b7ee378bfbdd8bbc9376c18.jpg', 41),
(43, 'aata(A)', 'aata', '38bcaccc1cf181486ee877ea855874fd.jpg', 0),
(44, 'honey', 'health product', '1b73b689bb36dd624457a55d550144e4.jpg', 0),
(45, '265', 'health product', 'e899e5b7d921cf3cfd4a922272de3e2e.jpg', 44),
(46, 'Butter(B)', 'Butter (Ghee)', '50d5e9f3690da036f49bdb62340177fc.jpg', 0),
(47, 'eno(gajendra)', 'health product', 'f5b0bd742318380b90a75139a50715ce.jpg', 44),
(48, 'jilebi(pratima)', 'gits instant mixes', 'ce0973373fbecf78f565093ad38d717d.jpg', 48),
(49, 'jileabi(pratima)', 'instant mixes', 'd8e5e00db38a13cd3553ebbf822a67f6.jpg', 34),
(50, 'pooja pack(pratima)', 'pooja items', 'a7ab5a67692f70469fb26ea9590c1706.jpg', 0),
(51, 'pooja pack', 'pooja items', '500b9d323f064b87ca8f5f607e0bf479.jpg', 50),
(52, 'butter (B1)', 'butter', '6fea4588e60e41170245e08236745255.jpg', 46),
(53, '5550', 'spB115189201', NULL, 0),
(54, 'mn001', 'milk', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sma_combo_items`
--

CREATE TABLE IF NOT EXISTS `sma_combo_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `item_code` varchar(20) NOT NULL,
  `quantity` decimal(12,4) NOT NULL,
  `unit_price` decimal(25,4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `sma_combo_items`
--

INSERT INTO `sma_combo_items` (`id`, `product_id`, `item_code`, `quantity`, `unit_price`) VALUES
(2, 7, '40766584', '1.0000', '80.0000'),
(5, 6, '07009110', '2.0000', '2500.0000'),
(6, 13, '40766584', '1.0000', '80.0000'),
(7, 9, '22811123', '1.0000', '180.0000'),
(8, 10, '22811123', '2.0000', '180.0000');

-- --------------------------------------------------------

--
-- Table structure for table `sma_companies`
--

CREATE TABLE IF NOT EXISTS `sma_companies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(10) unsigned DEFAULT NULL,
  `group_name` varchar(20) NOT NULL,
  `customer_group_id` int(11) DEFAULT NULL,
  `customer_group_name` varchar(100) DEFAULT NULL,
  `name` varchar(55) NOT NULL,
  `company` varchar(255) NOT NULL,
  `vat_no` varchar(100) DEFAULT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(55) NOT NULL,
  `state` varchar(55) DEFAULT NULL,
  `postal_code` varchar(8) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `cf1` varchar(100) DEFAULT NULL,
  `cf2` varchar(100) DEFAULT NULL,
  `cf3` varchar(100) DEFAULT NULL,
  `cf4` varchar(100) DEFAULT NULL,
  `cf5` varchar(100) DEFAULT NULL,
  `cf6` varchar(100) DEFAULT NULL,
  `invoice_footer` text,
  `payment_term` int(11) DEFAULT '0',
  `logo` varchar(255) DEFAULT 'logo.png',
  `award_points` int(11) DEFAULT '0',
  `deposit_amount` decimal(25,4) DEFAULT NULL,
  `price_group_id` int(11) DEFAULT NULL,
  `price_group_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `group_id` (`group_id`),
  KEY `group_id_2` (`group_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=32 ;

--
-- Dumping data for table `sma_companies`
--

INSERT INTO `sma_companies` (`id`, `group_id`, `group_name`, `customer_group_id`, `customer_group_name`, `name`, `company`, `vat_no`, `address`, `city`, `state`, `postal_code`, `country`, `phone`, `email`, `cf1`, `cf2`, `cf3`, `cf4`, `cf5`, `cf6`, `invoice_footer`, `payment_term`, `logo`, `award_points`, `deposit_amount`, `price_group_id`, `price_group_name`) VALUES
(1, 3, 'customer', 1, 'General', 'Walk-in Customer', 'Walk-in Customer', '', 'Customer Address', 'Petaling Jaya', 'Selangor', '46000', 'Malaysia', '0123456789', 'customer@tecdiary.com', '', '', '', '', '', '', NULL, 0, 'logo.png', 0, NULL, NULL, NULL),
(2, 4, 'supplier', NULL, NULL, 'Test Supplier', 'Supplier Company Name', NULL, 'Supplier Address', 'Petaling Jaya', 'Selangor', '46050', 'Malaysia', '0123456789', 'supplier@tecdiary.com', '-', '-', '-', '-', '-', '-', NULL, 0, 'logo.png', 0, NULL, NULL, NULL),
(3, NULL, 'biller', NULL, NULL, 'Priya Manmode', 'GWS Biller', '5555', 'Biller adddress', 'Nagpur', '', '', 'india', '0123456789', 'sheetal.m@greatwebsoft.com', '', '', '', '', '', '', ' Thank you for shopping with us. Please come again', 0, 'logo1.png', 0, NULL, NULL, NULL),
(4, 4, 'supplier', NULL, NULL, 'sanjay kumar gupta', 'survine pvt ltd ', '14656445', 'h.no. 458 B-HX Arera colony bhopal ', 'Bhopal ', 'madhaya pradesh ', '45489', 'india', '9993405068', 'gupta212@gmailL.com', 'sde', '', '', '', '', '', NULL, 0, 'logo.png', 0, NULL, NULL, NULL),
(5, NULL, 'biller', NULL, NULL, 'Hamarisalah', 'Hamarisalah', 'yogesh123456', 'H3b Nisat colony Bhopal', 'Bhopal', 'MP', '462003', 'India', '9993012042', 'yogesh@simplysafe.in', '', '', '', '', '', '', 'Hamarisalah Bhopal', 0, 'logo.png', 0, NULL, NULL, NULL),
(6, 3, 'customer', 1, 'General', 'Hamarisalah', 'Hamarisalah1', 'yogesh123458', 'H3b Nisat colony Bhopal', 'Bhopal', 'MP', '4523301', 'India', '9993012042', 'roji@hamarisalah.com', '', '', '', '', '', '', NULL, 0, 'logo.png', 0, NULL, 1, 'Default'),
(7, 4, 'supplier', NULL, NULL, 'pawan', 'pawan', 'pawan123', 'H3b Nisat colony Bhopal', 'Bhopal', 'MP', '462003', 'India', '9993012042', 'pawan@simplysafe.in', '', '', '', '', '', '', NULL, 0, 'logo.png', 0, NULL, NULL, NULL),
(8, 3, 'customer', 1, 'General', 'PRATIMA', 'SIMPLYSAFE', '', 'B-13 VANIKA CALONY', 'BHOPAL', 'M.P', '', 'INDIAN', '8359083498', 'SinghPrat@simplysafe.in', 'manufacturing date', 'packing date', 'expiry date', 'COST PRICE', 'SELLING PRICE', '', NULL, 0, 'logo.png', 0, NULL, 2, 'Standered'),
(9, 3, 'customer', 1, 'General', 'shri niwas', 'shri niwas', '', 'H3b kotra bhopal', 'Bhopal', 'MP', '462003', 'India', '865427196', 'p.s@simplysafe.in', '', '', '', '09993012042', '', 'pawan@simplysafe.in', NULL, 0, 'logo.png', 76, NULL, 2, 'Standered'),
(10, 3, 'customer', 1, 'General', 'swati', 'c.sm', '422', 'c-22,vanika colonty', 'bhopal', 'M.P', '462003', 'INADIAN', '984576231', 'swati@gmail.com', '', '', '', '', '', '', NULL, 0, 'logo.png', 0, NULL, 2, 'Standered'),
(11, 3, 'customer', 1, 'General', 'diksha', 'b.v.g', '422', '22-h,kotra bhopal', 'bhoapl', 'M.P', '', '', '975688423', 'diksha42@gmail.com', '', '', '', '', '', '', NULL, 0, 'logo.png', 1, NULL, 1, 'Default'),
(12, 3, 'customer', 1, 'General', 'ashok', 'bvg', '452', 'matamandir', 'Bhopal', 'mp', '', '', '98245163', 'ashok@gmail.com', '', '', '', '', '', '', NULL, 0, 'logo.png', 0, NULL, 2, 'Standered'),
(13, 3, 'customer', 1, 'General', 'priyanka', 's.sp', '256', 'c-23 mata mandir', 'bhopal', 'm.p', '', '', '856742315', 'priyanka@gmail.com', '', '', '', '', '', '', NULL, 0, 'logo.png', 0, NULL, 2, 'Standered'),
(14, 3, 'customer', 4, 'New Customer (+10)', 'ajay', 'c.v.g', '241', '23-h p.nt colony', 'agra', 'u.p', '', '', '826542231', 'ajay@gmail.com', '', '', '', '', '', '', NULL, 0, 'logo.png', 0, NULL, 2, 'Standered'),
(15, 4, 'supplier', NULL, NULL, 'kajal', 'balaji store', '422', 'k-12 new market', 'bhopal', 'M.P', '', 'INADIAN', '875642322', 'kajal@gmail.com', '', '', '', '', '', '', NULL, 0, 'logo.png', 0, NULL, NULL, NULL),
(16, 3, 'customer', 1, 'General', 'neha', 'shyam store', '4222', 'm.p nagar', 'bhopal', 'M.P', '', 'INDIAN', '984526877', 'neha@gmail.com', '', '', '', '', '', '', NULL, 0, 'logo.png', 0, NULL, 2, 'Standered'),
(17, 4, 'supplier', NULL, NULL, 'alok singh', 'MSN K ltd', 'AWR00235', 'h.no. 458 B-HX Arera colony bhopal', 'Bhopal', 'madhaya pradesh', '45489', 'India', '9993405068', 'alok@gmail.com', '', '', '', '09993405068', '', '', NULL, 0, 'logo.png', 0, NULL, NULL, NULL),
(18, 4, 'supplier', NULL, NULL, 'MANJU', 'SAI STORE', '236', 'kolar road', 'bhopal', 'M.P', '', 'INADIAN', '82694523', 'manju@gmail.com', '', '', '', '', '', '', NULL, 0, 'logo.png', 0, NULL, NULL, NULL),
(19, 4, 'supplier', NULL, NULL, 'pinki', 'general store', '725', 'nehru nagar', 'bhopal', 'M.P', '', '', '925688423', 'pinki@gmail.com', '', '', '', '', '', '', NULL, 0, 'logo.png', 0, NULL, NULL, NULL),
(20, 3, 'customer', 1, 'General', 'monika', 'I.C.M', '420', 't.t nagar', 'bhopal', 'M.P', '', '', '875624531', 'monica@gmail.com', '', '', '', '', '', '', NULL, 0, 'logo.png', 0, NULL, 2, 'Standered'),
(21, 4, 'supplier', NULL, NULL, 'preeti', 'i.t.m', '236', 'minal', 'bhopal', 'M.P', '', '', '962545231', 'preeti@gmail.com', '', '', '', '', '', '', NULL, 0, 'logo.png', 0, NULL, NULL, NULL),
(22, 3, 'customer', 1, 'General', 'pintu', 'g.st', '233', 'dwarikapuri', 'bhopal', '', '', '', '9826543121', 'pintu@gmail.com', '', '', '', '', '', '', NULL, 0, 'logo.png', 0, NULL, 2, 'Standered'),
(23, 4, 'supplier', NULL, NULL, 'anil kumar', 'macson pvt ltd ', 'ans 1234', 'ashok vihaar colony ', 'nagpur ', 'M.P', '', '', '75986158555', 'anil@gmail.com', '', '', '', '', '', '', NULL, 0, 'logo.png', 0, NULL, NULL, NULL),
(24, 3, 'customer', 3, 'Distributor', 'gws', 'gws', '', 'ngp', 'ngp', 'mh', '440022', '', '8087448286', 'chtnghgrabc8@gmail.com', '', '', '', '', '', '', NULL, 0, 'logo.png', 0, NULL, 2, 'Standered'),
(25, 4, 'supplier', NULL, NULL, 'sunita', 'gits ', '233', 's-31 mata mandir', 'bhopal', 'M.P', '', '', '825697423', 'sunita@gits.com', '', '', '', '', '', '', NULL, 0, 'logo.png', 0, NULL, NULL, NULL),
(26, 3, 'customer', 1, 'General', 'priya', 'git', '423', 'new market', 'bhopal', 'M.P', '', '', '82456398', 'priya@gmail.com', '', '', '', '', '', '', NULL, 0, 'logo.png', 0, NULL, 2, 'Standered'),
(27, 4, 'supplier', NULL, NULL, 'pooja', 'durga pooja', '487', 'm.p nagar', 'sagar', 'M.P', '', '', '98265473', 'pooja@gmail.com', '', '', '', '', '', '', NULL, 0, 'logo.png', 0, NULL, NULL, NULL),
(28, 3, 'customer', 1, 'General', 'pooja', 'durga ', '899', 'shahpura', 'betul', 'M.P', '', '', '98564235', 'poojap@gmail.com', '', '', '', '', '', '', NULL, 0, 'logo.png', 0, NULL, 2, 'Standered'),
(29, 4, 'supplier', NULL, NULL, 'pawan agrwal', 'bhaskar pvt ltd', '4564', 'bhaskar pvt ltd plot no. 121 ,122', 'Bhopal', 'madhaya pradesh', '45489', 'India', '9895666541', 'pawan@gmail.com', '', '', '', '09993405068', '', '', NULL, 0, 'logo.png', 0, NULL, NULL, NULL),
(30, 3, 'customer', 4, 'New Customer (+10)', 'chetaan', 'simplysafe', '', 'Trimurti Nagar, Nagpur', 'nagpur', 'Maharashtra', '440022', 'India', '8087448286', 'chtnghgr8@gmail.com', '', '', '', '+918087448286', '', 'chtnghgr8@gmail.com', NULL, 0, 'logo.png', 0, NULL, 2, 'Standered'),
(31, 4, 'supplier', NULL, NULL, 'ankush gupta', 'makson ltd', '565610', 'plotno.619 phase-1 mandideep bhopal', 'bhopal', 'Madhaya Pradesh ', '462014', 'India', '9658963262', 'ankushgupta@gmail.com', '', '', '', '', '', '', NULL, 0, 'logo.png', 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_costing`
--

CREATE TABLE IF NOT EXISTS `sma_costing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `sale_item_id` int(11) NOT NULL,
  `sale_id` int(11) DEFAULT NULL,
  `purchase_item_id` int(11) DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `purchase_net_unit_cost` decimal(25,4) DEFAULT NULL,
  `purchase_unit_cost` decimal(25,4) DEFAULT NULL,
  `sale_net_unit_price` decimal(25,4) NOT NULL,
  `sale_unit_price` decimal(25,4) NOT NULL,
  `quantity_balance` decimal(15,4) DEFAULT NULL,
  `inventory` tinyint(1) DEFAULT '0',
  `overselling` tinyint(1) DEFAULT '0',
  `option_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=469 ;

--
-- Dumping data for table `sma_costing`
--

INSERT INTO `sma_costing` (`id`, `date`, `product_id`, `sale_item_id`, `sale_id`, `purchase_item_id`, `quantity`, `purchase_net_unit_cost`, `purchase_unit_cost`, `sale_net_unit_price`, `sale_unit_price`, `quantity_balance`, `inventory`, `overselling`, `option_id`) VALUES
(1, '2016-11-15', 1, 1, 1, 1, '1.0000', '2000.0000', '2000.0000', '2500.0000', '2500.0000', '199.0000', 1, 0, NULL),
(2, '2016-11-15', 1, 2, 2, 1, '1.0000', '2000.0000', '2000.0000', '2500.0000', '2500.0000', '198.0000', 1, 0, NULL),
(3, '2016-11-15', 1, 3, 3, 1, '1.0000', '2000.0000', '2000.0000', '2500.0000', '2500.0000', '197.0000', 1, 0, NULL),
(4, '2016-11-15', 1, 4, 4, 1, '1.0000', '2000.0000', '2000.0000', '2500.0000', '2500.0000', '196.0000', 1, 0, NULL),
(5, '2016-11-15', 1, 5, 5, 1, '1.0000', '2000.0000', '2000.0000', '2500.0000', '2500.0000', '195.0000', 1, 0, NULL),
(7, '2016-11-16', 1, 7, 7, 1, '5.0000', '2000.0000', '2000.0000', '2500.0000', '2500.0000', '189.0000', 1, 0, NULL),
(8, '2016-11-16', 1, 8, 8, 1, '1.0000', '2000.0000', '2000.0000', '2500.0000', '2500.0000', '188.0000', 1, 0, NULL),
(9, '2016-11-16', 1, 9, 9, 1, '1.0000', '2000.0000', '2000.0000', '2500.0000', '2500.0000', '187.0000', 1, 0, NULL),
(10, '2016-11-16', 1, 10, 10, 1, '1.0000', '2000.0000', '2000.0000', '2500.0000', '2500.0000', '186.0000', 1, 0, NULL),
(11, '2016-11-16', 1, 11, 10, 1, '1.0000', '2000.0000', '2000.0000', '34.0000', '34.0000', '186.0000', 1, 0, NULL),
(12, '2016-11-17', 1, 12, 11, 1, '1.0000', '2000.0000', '2000.0000', '2500.0000', '2500.0000', '184.0000', 1, 0, NULL),
(14, '2016-11-17', 1, 14, 6, 1, '1.0000', '2000.0000', '2000.0000', '2500.0000', '2500.0000', '269.0000', 1, 0, NULL),
(15, '2016-11-17', 1, 15, 13, 1, '10.0000', '2000.0000', '2000.0000', '2500.0000', '2500.0000', '159.0000', 1, 0, NULL),
(16, '2016-11-18', 1, 16, 14, 1, '1.0000', '2000.0000', '2000.0000', '2500.0000', '2500.0000', '158.0000', 1, 0, NULL),
(17, '2016-11-19', 1, 17, 15, 1, '1.0000', '2000.0000', '2000.0000', '2500.0000', '2500.0000', '157.0000', 1, 0, NULL),
(18, '2016-11-19', 1, 18, 16, 1, '1.0000', '2000.0000', '2000.0000', '2500.0000', '2500.0000', '156.0000', 1, 0, NULL),
(19, '2016-11-21', 1, 19, 12, 1, '15.0000', '2000.0000', '2000.0000', '2500.0000', '2500.0000', '156.0000', 1, 0, NULL),
(20, '2016-11-21', 2, 20, 17, 6, '1.0000', '36.0000', '36.0000', '36.0000', '36.0000', '99.0000', 1, 0, NULL),
(21, '2016-11-21', 1, 21, 17, 4, '1.0000', '1900.0000', '1900.0000', '2500.0000', '2500.0000', '0.0000', 1, 0, NULL),
(22, '2016-11-22', 1, 22, 18, 1, '1.0000', '2000.0000', '2000.0000', '2500.0000', '2500.0000', '155.0000', 1, 0, NULL),
(23, '2016-11-23', 1, 23, 19, 1, '1.0000', '2000.0000', '2000.0000', '2500.0000', '2500.0000', '154.0000', 1, 0, NULL),
(24, '2016-11-23', 1, 24, 20, 1, '1.0000', '2000.0000', '2000.0000', '2500.0000', '2500.0000', '153.0000', 1, 0, NULL),
(25, '2016-11-23', 2, 25, 21, 6, '1.0000', '36.0000', '36.0000', '36.0000', '36.0000', '98.0000', 1, 0, NULL),
(26, '2016-11-23', 1, 26, 21, 1, '1.0000', '2000.0000', '2000.0000', '2500.0000', '2500.0000', '152.0000', 1, 0, NULL),
(27, '2016-11-23', 1, 27, 22, 1, '1.0000', '2000.0000', '2000.0000', '2500.0000', '2500.0000', '151.0000', 1, 0, NULL),
(28, '2016-11-23', 2, 28, 22, 6, '1.0000', '36.0000', '36.0000', '36.0000', '36.0000', '97.0000', 1, 0, NULL),
(29, '2016-11-23', 1, 29, 23, 1, '1.0000', '2000.0000', '2000.0000', '2500.0000', '2500.0000', '150.0000', 1, 0, NULL),
(30, '2016-11-23', 1, 30, 24, 1, '1.0000', '2000.0000', '2000.0000', '2500.0000', '2500.0000', '149.0000', 1, 0, NULL),
(31, '2016-11-23', 2, 31, 25, 6, '1.0000', '36.0000', '36.0000', '36.0000', '36.0000', '96.0000', 1, 0, NULL),
(32, '2016-11-23', 1, 32, 25, 1, '1.0000', '2000.0000', '2000.0000', '2500.0000', '2500.0000', '148.0000', 1, 0, NULL),
(33, '2016-11-23', 1, 33, 25, 1, '1.0000', '2000.0000', '2000.0000', '2500.0000', '2500.0000', '148.0000', 1, 0, NULL),
(34, '2016-11-23', 1, 34, 26, 1, '1.0000', '2000.0000', '2000.0000', '2500.0000', '2500.0000', '146.0000', 1, 0, NULL),
(35, '2016-11-23', 1, 35, 27, 1, '1.0000', '2000.0000', '2000.0000', '2500.0000', '2500.0000', '145.0000', 1, 0, NULL),
(36, '2016-11-23', 2, 36, 27, 6, '1.0000', '36.0000', '36.0000', '36.0000', '36.0000', '95.0000', 1, 0, NULL),
(37, '2016-11-23', 3, 37, 27, 8, '1.0000', '22.7273', '25.0000', '22.7273', '25.0000', '49.0000', 1, 0, NULL),
(38, '2016-11-24', 1, 38, 28, 1, '1.0000', '2000.0000', '2000.0000', '2500.0000', '2500.0000', '144.0000', 1, 0, NULL),
(39, '2016-11-25', 1, 39, 29, 1, '1.0000', '2000.0000', '2000.0000', '2500.0000', '2500.0000', '143.0000', 1, 0, NULL),
(40, '2016-11-25', 1, 40, 30, 1, '1.0000', '2000.0000', '2000.0000', '2500.0000', '2500.0000', '142.0000', 1, 0, NULL),
(41, '2016-11-25', 3, 41, 30, 8, '1.0000', '22.7273', '25.0000', '22.7273', '25.0000', '48.0000', 1, 0, NULL),
(42, '2016-11-25', 1, 42, 31, 1, '1.0000', '2000.0000', '2000.0000', '2500.0000', '2500.0000', '141.0000', 1, 0, NULL),
(43, '2016-11-25', 3, 43, 31, 8, '1.0000', '22.7273', '25.0000', '22.7273', '25.0000', '47.0000', 1, 0, NULL),
(44, '2016-11-25', 1, 44, 32, 1, '1.0000', '2000.0000', '2000.0000', '2500.0000', '2500.0000', '140.0000', 1, 0, NULL),
(45, '2016-11-25', 3, 45, 32, 8, '1.0000', '22.7273', '25.0000', '22.7273', '25.0000', '46.0000', 1, 0, NULL),
(46, '2016-11-26', 1, 46, 33, 1, '50.0000', '2000.0000', '2000.0000', '2500.0000', '2500.0000', '90.0000', 1, 0, NULL),
(47, '2016-11-26', 2, 47, 34, 6, '1.0000', '36.0000', '36.0000', '36.0000', '36.0000', '94.0000', 1, 0, NULL),
(48, '2016-11-26', 1, 48, 34, 1, '1.0000', '2000.0000', '2000.0000', '2500.0000', '2500.0000', '89.0000', 1, 0, NULL),
(49, '2016-11-26', 4, 49, 35, 10, '5.0000', '90.0000', '90.0000', '100.0000', '100.0000', '995.0000', 1, 0, NULL),
(50, '2016-11-26', 1, 50, 36, 12, '1.0000', '1900.0000', '1900.0000', '2500.0000', '2650.0000', '999.0000', 1, 0, NULL),
(51, '2016-11-26', 3, 51, 37, 13, '1.0000', '22.7273', '25.0000', '22.7273', '25.0000', '999.0000', 1, 0, NULL),
(52, '2016-11-26', 1, 52, 37, 12, '1.0000', '1900.0000', '1900.0000', '2500.0000', '2650.0000', '998.0000', 1, 0, NULL),
(53, '2016-11-26', 1, 53, 37, 12, '1.0000', '1900.0000', '1900.0000', '2500.0000', '2650.0000', '998.0000', 1, 0, NULL),
(54, '2016-11-26', 3, 54, 37, 13, '1.0000', '22.7273', '25.0000', '22.7273', '25.0000', '999.0000', 1, 0, NULL),
(55, '2016-11-26', 1, 55, 38, 12, '1.0000', '1900.0000', '1900.0000', '2500.0000', '2650.0000', '996.0000', 1, 0, NULL),
(56, '2016-11-27', 1, 56, 39, 12, '1.0000', '1900.0000', '1900.0000', '2500.0000', '2650.0000', '995.0000', 1, 0, NULL),
(57, '2016-11-27', 1, 57, 40, 12, '1.0000', '1900.0000', '1900.0000', '2500.0000', '2650.0000', '994.0000', 1, 0, NULL),
(58, '2016-11-27', 3, 58, 40, 13, '1.0000', '22.7273', '25.0000', '22.7273', '25.0000', '997.0000', 1, 0, NULL),
(59, '2016-11-27', 1, 59, 41, 12, '1.0000', '1900.0000', '1900.0000', '2500.0000', '2650.0000', '993.0000', 1, 0, NULL),
(60, '2016-11-27', 3, 60, 42, 13, '1.0000', '22.7273', '25.0000', '22.7273', '25.0000', '996.0000', 1, 0, NULL),
(61, '2016-11-27', 1, 61, 42, 12, '1.0000', '1900.0000', '1900.0000', '2500.0000', '2650.0000', '992.0000', 1, 0, NULL),
(62, '2016-11-27', 1, 62, 43, 12, '1.0000', '1900.0000', '1900.0000', '2500.0000', '2650.0000', '991.0000', 1, 0, NULL),
(63, '2016-11-28', 1, 63, 44, 12, '1.0000', '1900.0000', '1900.0000', '2500.0000', '2650.0000', '990.0000', 1, 0, NULL),
(64, '2016-12-01', 20, 64, 45, 36, '1.0000', '100.0000', '100.0000', '80.0000', '80.0000', '14.0000', 1, 0, NULL),
(65, '2016-12-02', 16, 65, 46, 26, '7.0000', '0.0000', '0.0000', '60.0000', '60.0000', '193.0000', 1, 0, NULL),
(66, '2016-12-02', 24, 66, 47, 41, '1.0000', '200.0000', '200.0000', '220.0000', '220.0000', '24.0000', 1, 0, NULL),
(67, '2016-12-02', 26, 67, 48, 46, '1.0000', '180.0000', '180.0000', '200.0000', '200.0000', '0.0000', 1, 0, NULL),
(68, '2016-12-02', 27, 68, 49, 48, '1.0000', '300.0000', '300.0000', '300.0000', '300.0000', '1.0000', 1, 0, NULL),
(69, '2016-12-02', 27, 69, 50, 50, '1.0000', '280.0000', '280.0000', '300.0000', '300.0000', '0.0000', 1, 0, NULL),
(70, '2016-12-02', 28, 70, 51, 51, '1.0000', '20.0000', '20.0000', '27.0000', '27.0000', '9.0000', 1, 0, NULL),
(71, '2016-12-03', 16, 71, 52, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '192.0000', 1, 0, NULL),
(72, '2016-12-03', 16, 72, 53, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '191.0000', 1, 0, NULL),
(73, '2016-12-04', 16, 73, 54, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '190.0000', 1, 0, NULL),
(74, '2016-12-04', 16, 74, 55, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '189.0000', 1, 0, NULL),
(75, '2016-12-04', 23, 75, 56, 39, '1.0000', '120.0000', '120.0000', '150.0000', '150.0000', '0.0000', 1, 0, NULL),
(76, '2016-12-04', 16, 76, 56, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '188.0000', 1, 0, NULL),
(77, '2016-12-04', 16, 77, 57, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '187.0000', 1, 0, NULL),
(78, '2016-12-04', 16, 78, 58, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '186.0000', 1, 0, NULL),
(79, '2016-12-04', 16, 79, 58, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '186.0000', 1, 0, NULL),
(80, '2016-12-04', 16, 80, 59, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '184.0000', 1, 0, NULL),
(81, '2016-12-04', 16, 81, 60, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '183.0000', 1, 0, NULL),
(82, '2016-12-04', 16, 82, 61, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '182.0000', 1, 0, NULL),
(83, '2016-12-04', 16, 83, 62, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '181.0000', 1, 0, NULL),
(84, '2016-12-05', 16, 84, 63, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '180.0000', 1, 0, NULL),
(85, '2016-12-05', 16, 85, 64, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '179.0000', 1, 0, NULL),
(86, '2016-12-05', 16, 86, 65, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '178.0000', 1, 0, NULL),
(87, '2016-12-05', 16, 87, 66, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '177.0000', 1, 0, NULL),
(88, '2016-12-05', 16, 88, 67, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '176.0000', 1, 0, NULL),
(89, '2016-12-05', 29, 89, 68, 54, '1.0000', '100.0000', '100.0000', '150.0000', '150.0000', '1.0000', 1, 0, NULL),
(90, '2016-12-05', 30, 90, 69, 57, '1.0000', '40.0000', '40.0000', '50.0000', '50.0000', '0.0000', 1, 0, NULL),
(91, '2016-12-05', 16, 91, 70, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '175.0000', 1, 0, NULL),
(92, '2016-12-05', 1, 92, 71, 12, '1.0000', '1900.0000', '1900.0000', '2500.0000', '2500.0000', '988.0000', 1, 0, NULL),
(93, '2016-12-05', 2, 93, 71, 6, '1.0000', '36.0000', '36.0000', '36.0000', '36.0000', '93.0000', 1, 0, NULL),
(94, '2016-12-05', 16, 94, 72, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '174.0000', 1, 0, NULL),
(95, '2016-12-06', 16, 95, 73, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '173.0000', 1, 0, NULL),
(96, '2016-12-06', 16, 96, 73, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '173.0000', 1, 0, NULL),
(97, '2016-12-06', 16, 97, 74, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '171.0000', 1, 0, NULL),
(98, '2016-12-06', 1, 98, 74, 12, '1.0000', '1900.0000', '1900.0000', '300.0000', '318.0000', '987.0000', 1, 0, NULL),
(99, '2016-12-06', 14, 99, 75, 27, '1.0000', '0.0000', '0.0000', '40.0000', '40.0000', '9.0000', 1, 0, NULL),
(100, '2016-12-06', 16, 100, 76, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '170.0000', 1, 0, NULL),
(101, '2016-12-06', 16, 101, 77, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '169.0000', 1, 0, NULL),
(102, '2016-12-06', 16, 102, 78, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '168.0000', 1, 0, NULL),
(103, '2016-12-06', 16, 103, 79, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '167.0000', 1, 0, NULL),
(104, '2016-12-06', 16, 104, 80, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '166.0000', 1, 0, NULL),
(105, '2016-12-06', 16, 105, 81, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '165.0000', 1, 0, NULL),
(106, '2016-12-06', 16, 106, 82, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '164.0000', 1, 0, NULL),
(107, '2016-12-06', 16, 107, 82, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '164.0000', 1, 0, NULL),
(108, '2016-12-06', 14, 108, 83, 27, '1.0000', '0.0000', '0.0000', '40.0000', '40.0000', '8.0000', 1, 0, NULL),
(109, '2016-12-06', 16, 109, 83, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '162.0000', 1, 0, NULL),
(110, '2016-12-06', 14, 110, 84, 27, '1.0000', '0.0000', '0.0000', '40.0000', '40.0000', '7.0000', 1, 0, NULL),
(111, '2016-12-06', 16, 111, 84, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '161.0000', 1, 0, NULL),
(112, '2016-12-06', 14, 112, 85, 27, '1.0000', '0.0000', '0.0000', '40.0000', '40.0000', '6.0000', 1, 0, NULL),
(113, '2016-12-06', 16, 113, 85, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '160.0000', 1, 0, NULL),
(114, '2016-12-06', 14, 114, 86, 27, '1.0000', '0.0000', '0.0000', '40.0000', '40.0000', '5.0000', 1, 0, NULL),
(115, '2016-12-06', 16, 115, 86, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '159.0000', 1, 0, NULL),
(116, '2016-12-06', 14, 116, 87, 27, '1.0000', '0.0000', '0.0000', '40.0000', '40.0000', '4.0000', 1, 0, NULL),
(117, '2016-12-06', 16, 117, 87, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '158.0000', 1, 0, NULL),
(118, '2016-12-06', 14, 118, 88, 27, '1.0000', '0.0000', '0.0000', '40.0000', '40.0000', '3.0000', 1, 0, NULL),
(119, '2016-12-06', 16, 119, 88, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '157.0000', 1, 0, NULL),
(120, '2016-12-06', 14, 120, 89, 27, '1.0000', '0.0000', '0.0000', '40.0000', '40.0000', '2.0000', 1, 0, NULL),
(121, '2016-12-06', 16, 121, 89, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '156.0000', 1, 0, NULL),
(122, '2016-12-06', 16, 122, 90, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '155.0000', 1, 0, NULL),
(123, '2016-12-06', 16, 123, 90, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '155.0000', 1, 0, NULL),
(124, '2016-12-06', 16, 124, 91, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '153.0000', 1, 0, NULL),
(125, '2016-12-06', 16, 125, 91, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '153.0000', 1, 0, NULL),
(126, '2016-12-06', 16, 126, 92, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '151.0000', 1, 0, NULL),
(127, '2016-12-06', 16, 127, 93, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '150.0000', 1, 0, NULL),
(128, '2016-12-07', 16, 128, 94, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '149.0000', 1, 0, NULL),
(129, '2016-12-07', 1, 129, 94, 12, '1.0000', '1900.0000', '1900.0000', '300.0000', '318.0000', '986.0000', 1, 0, NULL),
(130, '2016-12-07', 16, 130, 95, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '148.0000', 1, 0, NULL),
(131, '2016-12-07', 16, 131, 96, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '147.0000', 1, 0, NULL),
(132, '2016-12-07', 18, 132, 97, 32, '1.0000', '80.0000', '80.0000', '60.0000', '60.0000', '4.0000', 1, 0, NULL),
(133, '2016-12-08', 16, 133, 98, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '146.0000', 1, 0, NULL),
(134, '2016-12-08', 16, 134, 99, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '145.0000', 1, 0, NULL),
(135, '2016-12-08', 12, 135, 100, 22, '1.0000', '72.7273', '80.0000', '81.8182', '90.0000', '99.0000', 1, 0, NULL),
(136, '2016-12-08', 16, 136, 101, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '144.0000', 1, 0, NULL),
(137, '2016-12-08', 16, 137, 102, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '143.0000', 1, 0, NULL),
(138, '2016-12-09', 16, 138, 103, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '142.0000', 1, 0, NULL),
(139, '2016-12-10', 16, 139, 104, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '141.0000', 1, 0, NULL),
(140, '2016-12-10', 30, 140, 105, 55, '1.0000', '40.0000', '40.0000', '50.0000', '50.0000', '1.0000', 1, 0, NULL),
(141, '2016-12-10', 16, 141, 105, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '140.0000', 1, 0, NULL),
(142, '2016-12-10', 16, 142, 106, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '139.0000', 1, 0, NULL),
(143, '2016-12-10', 16, 143, 106, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '139.0000', 1, 0, NULL),
(144, '2016-12-10', 16, 144, 107, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '137.0000', 1, 0, NULL),
(145, '2016-12-11', 16, 145, 108, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '136.0000', 1, 0, NULL),
(146, '2016-12-11', 16, 146, 109, 26, '2.0000', '0.0000', '0.0000', '60.0000', '60.0000', '134.0000', 1, 0, NULL),
(147, '2016-12-11', 16, 147, 110, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '133.0000', 1, 0, NULL),
(148, '2016-12-11', 16, 148, 111, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '132.0000', 1, 0, NULL),
(149, '2016-12-11', 16, 149, 112, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '131.0000', 1, 0, NULL),
(150, '2016-12-11', 16, 150, 113, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '130.0000', 1, 0, NULL),
(151, '2016-12-11', 14, 151, 114, 27, '1.0000', '0.0000', '0.0000', '40.0000', '40.0000', '1.0000', 1, 0, NULL),
(152, '2016-12-11', 16, 152, 114, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '129.0000', 1, 0, NULL),
(153, '2016-12-11', 14, 153, 115, 27, '1.0000', '0.0000', '0.0000', '40.0000', '40.0000', '0.0000', 1, 0, NULL),
(154, '2016-12-11', 16, 154, 115, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '128.0000', 1, 0, NULL),
(155, '2016-12-11', 16, 155, 116, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '127.0000', 1, 0, NULL),
(156, '2016-12-11', 16, 156, 117, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '126.0000', 1, 0, NULL),
(157, '2016-12-11', 16, 157, 118, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '125.0000', 1, 0, NULL),
(158, '2016-12-11', 16, 158, 119, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '124.0000', 1, 0, NULL),
(159, '2016-12-11', 16, 159, 120, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '123.0000', 1, 0, NULL),
(160, '2016-12-11', 16, 160, 121, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '122.0000', 1, 0, NULL),
(161, '2016-12-12', 16, 161, 122, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '121.0000', 1, 0, NULL),
(162, '2016-12-12', 16, 162, 123, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '120.0000', 1, 0, NULL),
(163, '2016-12-12', 16, 163, 124, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '119.0000', 1, 0, NULL),
(164, '2016-12-12', 16, 164, 125, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '118.0000', 1, 0, NULL),
(165, '2016-12-12', 12, 165, 126, 22, '1.0000', '72.7273', '80.0000', '81.8182', '90.0000', '98.0000', 1, 0, NULL),
(166, '2016-12-12', 12, 166, 126, 22, '1.0000', '72.7273', '80.0000', '81.8182', '90.0000', '98.0000', 1, 0, NULL),
(167, '2016-12-12', 12, 167, 126, 22, '1.0000', '72.7273', '80.0000', '81.8182', '90.0000', '98.0000', 1, 0, NULL),
(168, '2016-12-12', 18, 168, 126, 32, '1.0000', '80.0000', '80.0000', '60.0000', '60.0000', '3.0000', 1, 0, NULL),
(169, '2016-12-13', 16, 169, 127, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '117.0000', 1, 0, NULL),
(170, '2016-12-14', 16, 170, 128, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '116.0000', 1, 0, NULL),
(171, '2016-12-14', 16, 171, 128, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '116.0000', 1, 0, NULL),
(172, '2016-12-14', 16, 172, 129, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '114.0000', 1, 0, NULL),
(173, '2016-12-14', 16, 173, 130, 26, '13.0000', '0.0000', '0.0000', '60.0000', '60.0000', '101.0000', 1, 0, NULL),
(174, '2016-12-14', 16, 174, 131, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '100.0000', 1, 0, NULL),
(175, '2016-12-14', 12, 175, 132, 22, '1.0000', '72.7273', '80.0000', '81.8182', '90.0000', '95.0000', 1, 0, NULL),
(176, '2016-12-14', 16, 176, 133, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '99.0000', 1, 0, NULL),
(177, '2016-12-14', 16, 177, 134, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '98.0000', 1, 0, NULL),
(178, '2016-12-14', 16, 178, 135, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '97.0000', 1, 0, NULL),
(179, '2016-12-14', 12, 179, 136, 22, '1.0000', '72.7273', '80.0000', '81.8182', '90.0000', '94.0000', 1, 0, NULL),
(180, '2016-12-14', 17, 180, 137, 30, '1.0000', '50.0000', '50.0000', '40.0000', '40.0000', '9.0000', 1, 0, NULL),
(181, '2016-12-14', 16, 181, 138, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '96.0000', 1, 0, NULL),
(182, '2016-12-14', 16, 182, 139, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '95.0000', 1, 0, NULL),
(183, '2016-12-14', 16, 183, 139, 26, '2.0000', '0.0000', '0.0000', '60.0000', '60.0000', '94.0000', 1, 0, NULL),
(184, '2016-12-14', 16, 184, 140, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '92.0000', 1, 0, NULL),
(185, '2016-12-14', 16, 185, 141, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '91.0000', 1, 0, NULL),
(186, '2016-12-14', 16, 186, 142, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '90.0000', 1, 0, NULL),
(187, '2016-12-14', 16, 187, 143, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '89.0000', 1, 0, NULL),
(188, '2016-12-14', 16, 188, 144, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '88.0000', 1, 0, NULL),
(189, '2016-12-14', 30, 189, 145, 55, '1.0000', '40.0000', '40.0000', '50.0000', '50.0000', '0.0000', 1, 0, NULL),
(190, '2016-12-14', 16, 190, 145, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '87.0000', 1, 0, NULL),
(191, '2016-12-14', 16, 191, 146, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '86.0000', 1, 0, NULL),
(192, '2016-12-14', 16, 192, 147, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '85.0000', 1, 0, NULL),
(193, '2016-12-14', 16, 193, 148, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '84.0000', 1, 0, NULL),
(194, '2016-12-14', 16, 194, 149, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '83.0000', 1, 0, NULL),
(195, '2016-12-14', 16, 195, 149, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '83.0000', 1, 0, NULL),
(196, '2016-12-14', 16, 196, 150, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '81.0000', 1, 0, NULL),
(197, '2016-12-14', 16, 197, 151, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '80.0000', 1, 0, NULL),
(198, '2016-12-14', 16, 198, 152, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '79.0000', 1, 0, NULL),
(199, '2016-12-14', 16, 199, 153, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '78.0000', 1, 0, NULL),
(200, '2016-12-14', 16, 200, 154, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '77.0000', 1, 0, NULL),
(201, '2016-12-14', 16, 201, 155, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '76.0000', 1, 0, NULL),
(202, '2016-12-14', 16, 202, 156, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '75.0000', 1, 0, NULL),
(203, '2016-12-14', 16, 203, 157, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '74.0000', 1, 0, NULL),
(204, '2016-12-14', 16, 204, 158, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '73.0000', 1, 0, NULL),
(205, '2016-12-14', 16, 205, 159, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '72.0000', 1, 0, NULL),
(206, '2016-12-14', 16, 206, 160, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '71.0000', 1, 0, NULL),
(207, '2016-12-14', 16, 207, 161, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '70.0000', 1, 0, NULL),
(208, '2016-12-14', 16, 208, 162, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '69.0000', 1, 0, NULL),
(209, '2016-12-14', 16, 209, 163, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '68.0000', 1, 0, NULL),
(210, '2016-12-14', 16, 210, 164, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '67.0000', 1, 0, NULL),
(211, '2016-12-14', 16, 211, 165, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '66.0000', 1, 0, NULL),
(212, '2016-12-14', 16, 212, 166, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '65.0000', 1, 0, NULL),
(213, '2016-12-15', 16, 213, 167, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '64.0000', 1, 0, NULL),
(214, '2016-12-15', 16, 214, 168, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '63.0000', 1, 0, NULL),
(215, '2016-12-15', 16, 215, 169, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '62.0000', 1, 0, NULL),
(216, '2016-12-15', 16, 216, 170, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '61.0000', 1, 0, NULL),
(217, '2016-12-15', 16, 217, 171, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '60.0000', 1, 0, NULL),
(218, '2016-12-15', 16, 218, 172, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '59.0000', 1, 0, NULL),
(219, '2016-12-15', 16, 219, 173, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '58.0000', 1, 0, NULL),
(220, '2016-12-15', 16, 220, 174, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '57.0000', 1, 0, NULL),
(221, '2016-12-15', 16, 221, 175, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '56.0000', 1, 0, NULL),
(222, '2016-12-15', 16, 222, 176, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '55.0000', 1, 0, NULL),
(223, '2016-12-15', 16, 223, 177, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '54.0000', 1, 0, NULL),
(224, '2016-12-15', 16, 224, 178, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '53.0000', 1, 0, NULL),
(225, '2016-12-15', 12, 225, 179, 22, '1.0000', '72.7273', '80.0000', '81.8182', '90.0000', '93.0000', 1, 0, NULL),
(226, '2016-12-15', 17, 226, 180, 30, '1.0000', '50.0000', '50.0000', '40.0000', '40.0000', '8.0000', 1, 0, NULL),
(227, '2016-12-15', 28, 227, 181, 51, '1.0000', '20.0000', '20.0000', '27.0000', '27.0000', '33.0000', 1, 0, NULL),
(228, '2016-12-15', 16, 228, 182, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '52.0000', 1, 0, NULL),
(229, '2016-12-15', 16, 229, 183, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '51.0000', 1, 0, NULL),
(230, '2016-12-15', 16, 230, 184, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '50.0000', 1, 0, NULL),
(231, '2016-12-15', 16, 231, 185, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '49.0000', 1, 0, NULL),
(232, '2016-12-15', 16, 232, 186, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '48.0000', 1, 0, NULL),
(233, '2016-12-15', 16, 233, 187, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '47.0000', 1, 0, NULL),
(234, '2016-12-15', 16, 234, 188, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '46.0000', 1, 0, NULL),
(235, '2016-12-15', 16, 235, 189, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '45.0000', 1, 0, NULL),
(236, '2016-12-15', 16, 236, 190, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '44.0000', 1, 0, NULL),
(237, '2016-12-15', 16, 237, 191, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '43.0000', 1, 0, NULL),
(238, '2016-12-15', 16, 238, 192, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '42.0000', 1, 0, NULL),
(239, '2016-12-15', 16, 239, 193, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '41.0000', 1, 0, NULL),
(240, '2016-12-15', 16, 240, 194, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '40.0000', 1, 0, NULL),
(241, '2016-12-15', 16, 241, 195, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '39.0000', 1, 0, NULL),
(242, '2016-12-15', 16, 242, 196, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '38.0000', 1, 0, NULL),
(243, '2016-12-15', 16, 243, 197, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '37.0000', 1, 0, NULL),
(244, '2016-12-15', 16, 244, 198, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '36.0000', 1, 0, NULL),
(245, '2016-12-15', 16, 245, 198, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '36.0000', 1, 0, NULL),
(246, '2016-12-15', 16, 246, 199, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '34.0000', 1, 0, NULL),
(247, '2016-12-15', 16, 247, 200, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '33.0000', 1, 0, NULL),
(248, '2016-12-15', 16, 248, 201, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '32.0000', 1, 0, NULL),
(249, '2016-12-16', 16, 250, 202, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '31.0000', 1, 0, NULL),
(250, '2016-12-16', 16, 251, 203, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '30.0000', 1, 0, NULL),
(251, '2016-12-16', 16, 252, 204, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '29.0000', 1, 0, NULL),
(252, '2016-12-16', 16, 254, 205, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '28.0000', 1, 0, NULL),
(253, '2016-12-16', 16, 256, 206, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '27.0000', 1, 0, NULL),
(254, '2016-12-16', 16, 257, 207, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '26.0000', 1, 0, NULL),
(255, '2016-12-16', 16, 258, 207, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '26.0000', 1, 0, NULL),
(256, '2016-12-16', 16, 259, 208, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '24.0000', 1, 0, NULL),
(257, '2016-12-16', 16, 260, 208, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '24.0000', 1, 0, NULL),
(258, '2016-12-16', 16, 261, 209, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '22.0000', 1, 0, NULL),
(259, '2016-12-16', 16, 262, 210, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '21.0000', 1, 0, NULL),
(260, '2016-12-16', 16, 263, 211, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '20.0000', 1, 0, NULL),
(261, '2016-12-16', 16, 264, 212, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '19.0000', 1, 0, NULL),
(262, '2016-12-16', 16, 265, 213, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '18.0000', 1, 0, NULL),
(263, '2016-12-16', 16, 266, 214, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '17.0000', 1, 0, NULL),
(264, '2016-12-16', 16, 267, 215, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '16.0000', 1, 0, NULL),
(265, '2016-12-16', 16, 268, 216, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '15.0000', 1, 0, NULL),
(266, '2016-12-16', 16, 269, 217, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '14.0000', 1, 0, NULL),
(267, '2016-12-17', 16, 270, 218, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '13.0000', 1, 0, NULL),
(268, '2016-12-17', 16, 271, 219, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '12.0000', 1, 0, NULL),
(269, '2016-12-17', 16, 272, 220, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '11.0000', 1, 0, NULL),
(270, '2016-12-17', 16, 273, 221, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '10.0000', 1, 0, NULL),
(271, '2016-12-18', 16, 274, 222, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '9.0000', 1, 0, NULL),
(272, '2016-12-19', 16, 275, 223, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '8.0000', 1, 0, NULL),
(273, '2016-12-20', 16, 276, 224, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '7.0000', 1, 0, NULL),
(274, '2016-12-20', 16, 277, 225, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '6.0000', 1, 0, NULL),
(275, '2016-12-20', 16, 278, 226, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '5.0000', 1, 0, NULL),
(276, '2016-12-20', 16, 279, 227, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '4.0000', 1, 0, NULL),
(277, '2016-12-20', 16, 280, 228, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '3.0000', 1, 0, NULL),
(278, '2016-12-20', 16, 281, 229, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '2.0000', 1, 0, NULL),
(279, '2016-12-20', 16, 282, 230, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '1.0000', 1, 0, NULL),
(280, '2016-12-20', 16, 283, 231, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '0.0000', 1, 0, NULL),
(281, '2016-12-20', 16, 284, 232, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '999.0000', 1, 0, NULL),
(282, '2016-12-20', 16, 285, 232, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '999.0000', 1, 0, NULL),
(283, '2016-12-20', 16, 286, 233, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '997.0000', 1, 0, NULL),
(284, '2016-12-21', 16, 287, 234, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '996.0000', 1, 0, NULL),
(285, '2016-12-21', 16, 288, 235, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '995.0000', 1, 0, NULL),
(286, '2016-12-21', 16, 289, 236, 26, '15.0000', '0.0000', '0.0000', '60.0000', '60.0000', '980.0000', 1, 0, NULL),
(287, '2016-12-21', 16, 290, 237, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '979.0000', 1, 0, NULL),
(288, '2016-12-21', 16, 291, 238, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '978.0000', 1, 0, NULL),
(289, '2016-12-21', 16, 292, 239, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '977.0000', 1, 0, NULL),
(290, '2016-12-21', 16, 293, 240, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '976.0000', 1, 0, NULL),
(291, '2016-12-21', 16, 294, 241, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '975.0000', 1, 0, NULL),
(292, '2016-12-21', 16, 295, 242, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '974.0000', 1, 0, NULL),
(293, '2016-12-21', 16, 296, 243, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '973.0000', 1, 0, NULL),
(294, '2016-12-21', 16, 297, 244, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '972.0000', 1, 0, NULL),
(295, '2016-12-21', 16, 298, 245, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '971.0000', 1, 0, NULL),
(296, '2016-12-21', 16, 299, 245, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '971.0000', 1, 0, NULL),
(297, '2016-12-21', 16, 300, 246, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '969.0000', 1, 0, NULL),
(298, '2016-12-21', 16, 301, 247, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '968.0000', 1, 0, NULL),
(299, '2016-12-21', 16, 302, 248, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '967.0000', 1, 0, NULL),
(300, '2016-12-21', 16, 303, 249, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '966.0000', 1, 0, NULL),
(301, '2016-12-21', 16, 304, 250, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '965.0000', 1, 0, NULL),
(302, '2016-12-21', 16, 305, 251, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '964.0000', 1, 0, NULL),
(303, '2016-12-21', 16, 306, 252, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '963.0000', 1, 0, NULL),
(304, '2016-12-21', 16, 307, 253, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '962.0000', 1, 0, NULL),
(305, '2016-12-21', 16, 308, 254, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '961.0000', 1, 0, NULL),
(306, '2016-12-21', 16, 309, 255, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '960.0000', 1, 0, NULL),
(307, '2016-12-21', 28, 310, 256, 51, '1.0000', '20.0000', '20.0000', '27.0000', '27.0000', '32.0000', 1, 0, NULL),
(308, '2016-12-21', 16, 311, 256, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '959.0000', 1, 0, NULL),
(309, '2016-12-21', 16, 312, 257, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '958.0000', 1, 0, NULL),
(310, '2016-12-21', 16, 313, 258, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '957.0000', 1, 0, NULL),
(311, '2016-12-22', 16, 314, 259, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '956.0000', 1, 0, NULL),
(312, '2016-12-22', 16, 315, 260, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '955.0000', 1, 0, NULL),
(313, '2016-12-22', 12, 316, 261, 22, '1.0000', '72.7273', '80.0000', '81.8182', '90.0000', '92.0000', 1, 0, NULL),
(314, '2016-12-22', 12, 317, 262, 22, '1.0000', '72.7273', '80.0000', '81.8182', '90.0000', '91.0000', 1, 0, NULL),
(315, '2016-12-22', 18, 318, 262, 32, '1.0000', '80.0000', '80.0000', '60.0000', '60.0000', '2.0000', 1, 0, NULL),
(316, '2016-12-22', 16, 319, 263, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '954.0000', 1, 0, NULL),
(317, '2016-12-22', 16, 320, 264, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '953.0000', 1, 0, NULL),
(318, '2016-12-22', 16, 321, 264, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '953.0000', 1, 0, NULL),
(319, '2016-12-22', 16, 322, 265, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '951.0000', 1, 0, NULL),
(320, '2016-12-22', 16, 323, 266, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '950.0000', 1, 0, NULL),
(321, '2016-12-22', 16, 324, 267, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '949.0000', 1, 0, NULL),
(322, '2016-12-23', 16, 325, 268, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '948.0000', 1, 0, NULL),
(323, '2016-12-23', 16, 326, 269, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '947.0000', 1, 0, NULL),
(324, '2016-12-23', 16, 327, 270, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '946.0000', 1, 0, NULL),
(325, '2016-12-23', 16, 328, 271, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '945.0000', 1, 0, NULL),
(326, '2016-12-23', 16, 329, 272, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '944.0000', 1, 0, NULL),
(327, '2016-12-23', 16, 330, 273, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '943.0000', 1, 0, NULL),
(328, '2016-12-23', 18, 331, 274, 32, '1.0000', '80.0000', '80.0000', '60.0000', '60.0000', '1.0000', 1, 0, NULL),
(329, '2016-12-23', 16, 332, 275, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '942.0000', 1, 0, NULL),
(330, '2016-12-23', 16, 333, 276, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '941.0000', 1, 0, NULL),
(331, '2016-12-23', 16, 334, 277, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '940.0000', 1, 0, NULL),
(332, '2016-12-23', 16, 335, 278, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '939.0000', 1, 0, NULL),
(333, '2016-12-23', 16, 336, 279, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '938.0000', 1, 0, NULL),
(334, '2016-12-23', 16, 337, 280, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '937.0000', 1, 0, NULL),
(335, '2016-12-23', 16, 338, 281, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '936.0000', 1, 0, NULL),
(336, '2016-12-23', 16, 339, 282, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '935.0000', 1, 0, NULL),
(337, '2016-12-23', 12, 340, 283, 22, '1.0000', '72.7273', '80.0000', '81.8182', '90.0000', '90.0000', 1, 0, NULL),
(338, '2016-12-23', 16, 341, 284, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '934.0000', 1, 0, NULL),
(339, '2016-12-23', 16, 342, 285, 26, '0.0010', '0.0000', '0.0000', '0.0000', '0.0000', '933.9990', 1, 0, NULL),
(340, '2016-12-23', 16, 343, 286, 26, '0.0010', '0.0000', '0.0000', '0.0000', '0.0000', '933.9980', 1, 0, NULL),
(341, '2016-12-23', 16, 344, 287, 26, '0.0010', '0.0000', '0.0000', '0.0000', '0.0000', '933.9970', 1, 0, NULL),
(342, '2016-12-23', 16, 345, 288, 26, '0.0010', '0.0000', '0.0000', '0.0000', '0.0000', '933.9960', 1, 0, NULL),
(343, '2016-12-23', 16, 346, 289, 26, '0.0010', '0.0000', '0.0000', '0.0000', '0.0000', '933.9950', 1, 0, NULL),
(344, '2016-12-23', 16, 347, 290, 26, '0.0010', '0.0000', '0.0000', '0.0000', '0.0000', '933.9940', 1, 0, NULL),
(345, '2016-12-23', 16, 348, 291, 26, '0.0010', '0.0000', '0.0000', '50000.0000', '50000.0000', '933.9930', 1, 0, NULL),
(346, '2016-12-23', 16, 349, 292, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '932.9930', 1, 0, NULL),
(347, '2016-12-23', 16, 350, 293, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '931.9930', 1, 0, NULL),
(348, '2016-12-23', 16, 351, 294, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '930.9930', 1, 0, NULL),
(349, '2016-12-23', 16, 352, 295, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '929.9930', 1, 0, NULL),
(350, '2016-12-23', 16, 353, 296, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '928.9930', 1, 0, NULL),
(351, '2016-12-23', 16, 354, 297, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '927.9930', 1, 0, NULL),
(352, '2016-12-23', 16, 355, 298, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '926.9930', 1, 0, NULL),
(353, '2016-12-23', 16, 356, 299, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '925.9930', 1, 0, NULL),
(354, '2016-12-23', 16, 357, 300, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '924.9930', 1, 0, NULL),
(355, '2016-12-23', 16, 358, 301, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '923.9930', 1, 0, NULL),
(356, '2016-12-23', 16, 359, 302, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '922.9930', 1, 0, NULL),
(357, '2016-12-23', 16, 360, 303, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '921.9930', 1, 0, NULL),
(358, '2016-12-23', 16, 361, 304, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '920.9930', 1, 0, NULL),
(359, '2016-12-23', 16, 362, 305, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '919.9930', 1, 0, NULL),
(360, '2016-12-23', 16, 363, 306, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '918.9930', 1, 0, NULL),
(361, '2016-12-23', 16, 364, 307, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '917.9930', 1, 0, NULL),
(362, '2016-12-23', 16, 365, 308, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '916.9930', 1, 0, NULL),
(363, '2016-12-23', 16, 366, 308, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '916.9930', 1, 0, NULL),
(364, '2016-12-23', 16, 367, 309, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '914.9930', 1, 0, NULL),
(365, '2016-12-23', 16, 368, 310, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '913.9930', 1, 0, NULL),
(366, '2016-12-23', 16, 369, 311, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '912.9930', 1, 0, NULL),
(367, '2016-12-23', 16, 370, 312, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '911.9930', 1, 0, NULL),
(368, '2016-12-24', 16, 371, 313, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '910.9930', 1, 0, NULL),
(369, '2016-12-24', 16, 372, 314, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '909.9930', 1, 0, NULL),
(370, '2016-12-24', 16, 373, 314, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '909.9930', 1, 0, NULL),
(371, '2016-12-24', 16, 374, 315, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '907.9930', 1, 0, NULL),
(372, '2016-12-24', 16, 375, 316, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '906.9930', 1, 0, NULL),
(373, '2016-12-24', 16, 376, 317, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '905.9930', 1, 0, NULL),
(374, '2016-12-24', 16, 377, 318, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '904.9930', 1, 0, NULL),
(375, '2016-12-24', 28, 378, 319, 51, '1.0000', '20.0000', '20.0000', '27.0000', '27.0000', '31.0000', 1, 0, NULL),
(376, '2016-12-24', 16, 379, 320, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '903.9930', 1, 0, NULL),
(377, '2016-12-24', 16, 380, 321, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '902.9930', 1, 0, NULL),
(378, '2016-12-24', 16, 381, 322, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '901.9930', 1, 0, NULL),
(379, '2016-12-24', 16, 382, 323, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '900.9930', 1, 0, NULL),
(380, '2016-12-29', 16, 383, 324, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '899.9930', 1, 0, NULL),
(381, '2016-12-29', 16, 384, 325, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '898.9930', 1, 0, NULL),
(382, '2016-12-29', 16, 385, 326, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '897.9930', 1, 0, NULL),
(383, '2016-12-29', 16, 386, 326, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '897.9930', 1, 0, NULL),
(384, '2016-12-29', 16, 387, 327, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '895.9930', 1, 0, NULL),
(385, '2016-12-29', 16, 388, 328, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '894.9930', 1, 0, NULL),
(386, '2016-12-29', 16, 389, 329, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '893.9930', 1, 0, NULL),
(387, '2016-12-29', 16, 390, 330, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '892.9930', 1, 0, NULL),
(388, '2017-01-03', 16, 391, 331, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '891.9930', 1, 0, NULL),
(389, '2017-01-03', 16, 392, 332, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '890.9930', 1, 0, NULL),
(390, '2017-01-03', 16, 393, 333, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '889.9930', 1, 0, NULL),
(391, '2017-01-03', 16, 394, 334, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '888.9930', 1, 0, NULL),
(392, '2017-01-03', 16, 395, 335, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '887.9930', 1, 0, NULL),
(393, '2017-01-03', 27, 396, 336, 48, '1.0000', '300.0000', '300.0000', '300.0000', '300.0000', '0.0000', 1, 0, NULL),
(394, '2017-01-03', 16, 397, 336, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '886.9930', 1, 0, NULL),
(395, '2017-01-03', 12, 398, 337, 22, '1.0000', '72.7273', '80.0000', '81.8182', '90.0000', '89.0000', 1, 0, NULL),
(396, '2017-01-03', 16, 399, 337, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '885.9930', 1, 0, NULL),
(397, '2017-01-03', 16, 400, 338, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '884.9930', 1, 0, NULL),
(398, '2017-01-03', 16, 401, 339, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '883.9930', 1, 0, NULL),
(399, '2017-01-03', 16, 402, 340, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '882.9930', 1, 0, NULL),
(400, '2017-01-03', 16, 403, 341, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '881.9930', 1, 0, NULL),
(401, '2017-01-03', 16, 404, 342, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '880.9930', 1, 0, NULL),
(402, '2017-01-03', 16, 405, 343, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '879.9930', 1, 0, NULL),
(403, '2017-01-03', 16, 406, 344, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '878.9930', 1, 0, NULL),
(404, '2017-01-04', 16, 407, 345, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '877.9930', 1, 0, NULL),
(405, '2017-01-04', 16, 408, 346, 26, '1.0000', '0.0000', '0.0000', '60.0000', '60.0000', '876.9930', 1, 0, NULL),
(406, '2017-01-04', 15, 409, 347, NULL, '1.0000', NULL, NULL, '60.0000', '60.0000', NULL, 1, 1, NULL),
(407, '2017-01-04', 16, 410, 348, NULL, '1.0000', '50.0000', '50.0000', '60.0000', '60.0000', NULL, 1, 1, NULL),
(408, '2017-01-04', 16, 411, 349, NULL, '5.0000', '50.0000', '50.0000', '60.0000', '60.0000', NULL, 1, 1, NULL),
(409, '2017-01-05', 16, 412, 350, NULL, '1.0000', '50.0000', '50.0000', '60.0000', '60.0000', NULL, 1, 1, NULL),
(410, '2017-01-06', 16, 413, 351, NULL, '1.0000', '50.0000', '50.0000', '60.0000', '60.0000', NULL, 1, 1, NULL),
(411, '2017-01-06', 16, 414, 352, NULL, '1.0000', '50.0000', '50.0000', '60.0000', '60.0000', NULL, 1, 1, NULL),
(412, '2017-01-06', 15, 415, 352, NULL, '1.0000', '50.0000', '50.0000', '60.0000', '60.0000', NULL, 1, 1, NULL),
(413, '2017-01-06', 16, 416, 352, NULL, '1.0000', '50.0000', '50.0000', '60.0000', '60.0000', NULL, 1, 1, NULL),
(414, '2017-01-06', 16, 417, 353, NULL, '1.0000', '50.0000', '50.0000', '60.0000', '60.0000', NULL, 1, 1, NULL),
(415, '2017-01-06', 16, 418, 354, NULL, '1.0000', '50.0000', '50.0000', '60.0000', '60.0000', NULL, 1, 1, NULL),
(416, '2017-01-07', 16, 419, 355, NULL, '1.0000', '50.0000', '50.0000', '60.0000', '60.0000', NULL, 1, 1, NULL),
(417, '2017-01-07', 16, 420, 355, NULL, '1.0000', '50.0000', '50.0000', '60.0000', '60.0000', NULL, 1, 1, NULL),
(418, '2017-01-07', 16, 421, 356, NULL, '1.0000', '50.0000', '50.0000', '60.0000', '60.0000', NULL, 1, 1, NULL),
(419, '2017-01-09', 16, 422, 357, NULL, '1.0000', '50.0000', '50.0000', '60.0000', '60.0000', NULL, 1, 1, NULL),
(420, '2017-01-09', 16, 423, 358, NULL, '1.0000', '50.0000', '50.0000', '60.0000', '60.0000', NULL, 1, 1, NULL),
(421, '2017-01-09', 16, 424, 359, NULL, '1.0000', '50.0000', '50.0000', '60.0000', '60.0000', NULL, 1, 1, NULL),
(422, '2017-01-11', 16, 425, 360, NULL, '1.0000', '50.0000', '50.0000', '60.0000', '60.0000', NULL, 1, 1, NULL),
(423, '2017-01-11', 16, 426, 361, NULL, '1.0000', '50.0000', '50.0000', '60.0000', '60.0000', NULL, 1, 1, NULL),
(424, '2017-01-11', 16, 428, 362, NULL, '1.0000', '50.0000', '50.0000', '60.0000', '60.0000', NULL, 1, 1, NULL),
(425, '2017-01-11', 16, 429, 362, NULL, '1.0000', '50.0000', '50.0000', '60.0000', '60.0000', NULL, 1, 1, NULL),
(426, '2017-01-11', 16, 430, 363, NULL, '1.0000', '50.0000', '50.0000', '60.0000', '60.0000', NULL, 1, 1, NULL),
(427, '2017-01-11', 15, 431, 364, NULL, '1.0000', '50.0000', '50.0000', '60.0000', '60.0000', NULL, 1, 1, NULL),
(428, '2017-01-11', 15, 432, 364, NULL, '1.0000', '50.0000', '50.0000', '60.0000', '60.0000', NULL, 1, 1, NULL),
(429, '2017-01-11', 14, 433, 365, NULL, '1.0000', '34.0000', '34.0000', '40.0000', '40.0000', NULL, 1, 1, NULL),
(430, '2017-01-11', 15, 434, 366, NULL, '1.0000', '50.0000', '50.0000', '60.0000', '60.0000', NULL, 1, 1, NULL),
(431, '2017-01-11', 3, 436, 368, 13, '1.0000', '25.0000', '25.0000', '9.0909', '10.0000', '995.0000', 1, 0, NULL),
(432, '2017-01-11', 15, 437, 369, NULL, '1.0000', '50.0000', '50.0000', '60.0000', '60.0000', NULL, 1, 1, NULL),
(433, '2017-01-11', 15, 438, 369, NULL, '6.0000', '50.0000', '50.0000', '60.0000', '60.0000', NULL, 1, 1, NULL),
(434, '2017-01-11', 15, 439, 370, NULL, '1.0000', '50.0000', '50.0000', '60.0000', '60.0000', NULL, 1, 1, NULL),
(435, '2017-01-12', 15, 440, 371, NULL, '1.0000', '50.0000', '50.0000', '60.0000', '60.0000', NULL, 1, 1, NULL),
(436, '2017-01-12', 15, 441, 371, NULL, '1.0000', '50.0000', '50.0000', '60.0000', '60.0000', NULL, 1, 1, NULL),
(437, '2017-01-12', 15, 442, 371, NULL, '1.0000', '50.0000', '50.0000', '60.0000', '60.0000', NULL, 1, 1, NULL),
(438, '2017-01-12', 15, 443, 372, NULL, '1.0000', '50.0000', '50.0000', '60.0000', '60.0000', NULL, 1, 1, NULL),
(439, '2017-01-12', 15, 444, 373, NULL, '1.0000', '50.0000', '50.0000', '60.0000', '60.0000', NULL, 1, 1, NULL),
(440, '2017-01-12', 15, 445, 373, NULL, '1.0000', '50.0000', '50.0000', '60.0000', '60.0000', NULL, 1, 1, NULL),
(441, '2017-01-12', 15, 446, 373, NULL, '1.0000', '50.0000', '50.0000', '60.0000', '60.0000', NULL, 1, 1, NULL),
(442, '2017-01-12', 22, 447, 374, NULL, '1.0000', '500.0000', '500.0000', '450.0000', '450.0000', NULL, 1, 1, NULL),
(443, '2017-01-12', 15, 448, 375, NULL, '1.0000', '50.0000', '50.0000', '60.0000', '60.0000', NULL, 1, 1, NULL);
INSERT INTO `sma_costing` (`id`, `date`, `product_id`, `sale_item_id`, `sale_id`, `purchase_item_id`, `quantity`, `purchase_net_unit_cost`, `purchase_unit_cost`, `sale_net_unit_price`, `sale_unit_price`, `quantity_balance`, `inventory`, `overselling`, `option_id`) VALUES
(444, '2017-01-13', 15, 449, 376, NULL, '1.0000', '50.0000', '50.0000', '60.0000', '60.0000', NULL, 1, 1, NULL),
(445, '2017-01-13', 15, 450, 376, NULL, '1.0000', '50.0000', '50.0000', '60.0000', '60.0000', NULL, 1, 1, NULL),
(446, '2017-01-13', 28, 451, 377, 51, '1.0000', '20.0000', '20.0000', '27.0000', '27.0000', '30.0000', 1, 0, NULL),
(447, '2017-01-13', 26, 452, 377, NULL, '1.0000', '180.0000', '180.0000', '200.0000', '200.0000', NULL, 1, 1, NULL),
(448, '2017-01-13', 15, 453, 378, NULL, '1.0000', '50.0000', '50.0000', '60.0000', '60.0000', NULL, 1, 1, NULL),
(449, '2017-01-13', 16, 454, 379, NULL, '1.0000', '50.0000', '50.0000', '60.0000', '60.0000', NULL, 1, 1, NULL),
(450, '2017-01-13', 15, 455, 379, NULL, '1.0000', '50.0000', '50.0000', '60.0000', '60.0000', NULL, 1, 1, NULL),
(451, '2017-01-14', 16, 456, 380, NULL, '1.0000', '50.0000', '50.0000', '60.0000', '60.0000', NULL, 1, 1, NULL),
(452, '2017-01-14', 15, 457, 380, NULL, '1.0000', '50.0000', '50.0000', '60.0000', '60.0000', NULL, 1, 1, NULL),
(453, '2017-01-14', 15, 458, 381, NULL, '1.0000', '50.0000', '50.0000', '60.0000', '60.0000', NULL, 1, 1, NULL),
(454, '2017-01-14', 15, 459, 381, NULL, '1.0000', '50.0000', '50.0000', '60.0000', '60.0000', NULL, 1, 1, NULL),
(455, '2017-01-14', 15, 460, 382, NULL, '1.0000', '50.0000', '50.0000', '60.0000', '60.0000', NULL, 1, 1, NULL),
(456, '2017-01-14', 15, 461, 383, NULL, '1.0000', '50.0000', '50.0000', '60.0000', '60.0000', NULL, 1, 1, NULL),
(457, '2017-01-15', 15, 462, 384, NULL, '1.0000', '50.0000', '50.0000', '60.0000', '60.0000', NULL, 1, 1, NULL),
(458, '2017-01-16', 15, 463, 385, NULL, '1.0000', '50.0000', '50.0000', '60.0000', '60.0000', NULL, 1, 1, NULL),
(459, '2017-01-17', 15, 464, 386, NULL, '1.0000', '50.0000', '50.0000', '60.0000', '60.0000', NULL, 1, 1, NULL),
(460, '2017-01-17', 15, 465, 387, NULL, '1.0000', '50.0000', '50.0000', '60.0000', '60.0000', NULL, 1, 1, NULL),
(461, '2017-01-17', 15, 466, 388, NULL, '5.0000', '50.0000', '50.0000', '60.0000', '60.0000', NULL, 1, 1, NULL),
(462, '2017-01-17', 15, 467, 389, NULL, '1.0000', '50.0000', '50.0000', '60.0000', '60.0000', NULL, 1, 1, NULL),
(463, '2017-01-17', 22, 468, 390, NULL, '1.0000', '500.0000', '500.0000', '450.0000', '450.0000', NULL, 1, 1, NULL),
(464, '2017-01-17', 14, 469, 391, NULL, '1.0000', '34.0000', '34.0000', '40.0000', '40.0000', NULL, 1, 1, NULL),
(465, '2017-01-17', 16, 470, 391, NULL, '1.0000', '50.0000', '50.0000', '60.0000', '60.0000', NULL, 1, 1, NULL),
(466, '2017-01-17', 4, 471, 392, 10, '1.0000', '90.0000', '90.0000', '0.0000', '0.0000', '994.0000', 1, 0, NULL),
(467, '2017-01-17', 15, 472, 393, NULL, '1.0000', '50.0000', '50.0000', '60.0000', '60.0000', NULL, 1, 1, NULL),
(468, '2017-01-17', 16, 473, 393, NULL, '1.0000', '50.0000', '50.0000', '60.0000', '60.0000', NULL, 1, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_currencies`
--

CREATE TABLE IF NOT EXISTS `sma_currencies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(5) NOT NULL,
  `name` varchar(55) NOT NULL,
  `rate` decimal(12,4) NOT NULL,
  `auto_update` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `sma_currencies`
--

INSERT INTO `sma_currencies` (`id`, `code`, `name`, `rate`, `auto_update`) VALUES
(2, 'INR', 'Rupee', '1.0000', 0),
(3, 'USD', 'Dollar', '68.1200', 0);

-- --------------------------------------------------------

--
-- Table structure for table `sma_custemail`
--

CREATE TABLE IF NOT EXISTS `sma_custemail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sender` varchar(100) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `message` varchar(100) NOT NULL,
  `send_date` date NOT NULL,
  `customer_list` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `sma_custemail`
--

INSERT INTO `sma_custemail` (`id`, `sender`, `subject`, `message`, `send_date`, `customer_list`) VALUES
(1, 'chetan@gmail.com', 'report', 'hello', '2017-01-01', 'sana@hi.com'),
(2, '', '', '', '0000-00-00', '');

-- --------------------------------------------------------

--
-- Table structure for table `sma_customer_groups`
--

CREATE TABLE IF NOT EXISTS `sma_customer_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `percent` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `sma_customer_groups`
--

INSERT INTO `sma_customer_groups` (`id`, `name`, `percent`) VALUES
(1, 'General', 0),
(2, 'Reseller', -5),
(3, 'Distributor', -15),
(4, 'New Customer (+10)', 10),
(5, 'Wholesaler', 20);

-- --------------------------------------------------------

--
-- Table structure for table `sma_date_format`
--

CREATE TABLE IF NOT EXISTS `sma_date_format` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `js` varchar(20) NOT NULL,
  `php` varchar(20) NOT NULL,
  `sql` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `sma_date_format`
--

INSERT INTO `sma_date_format` (`id`, `js`, `php`, `sql`) VALUES
(1, 'mm-dd-yyyy', 'm-d-Y', '%m-%d-%Y'),
(2, 'mm/dd/yyyy', 'm/d/Y', '%m/%d/%Y'),
(3, 'mm.dd.yyyy', 'm.d.Y', '%m.%d.%Y'),
(4, 'dd-mm-yyyy', 'd-m-Y', '%d-%m-%Y'),
(5, 'dd/mm/yyyy', 'd/m/Y', '%d/%m/%Y'),
(6, 'dd.mm.yyyy', 'd.m.Y', '%d.%m.%Y');

-- --------------------------------------------------------

--
-- Table structure for table `sma_deliveries`
--

CREATE TABLE IF NOT EXISTS `sma_deliveries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sale_id` int(11) NOT NULL,
  `do_reference_no` varchar(50) NOT NULL,
  `sale_reference_no` varchar(50) NOT NULL,
  `customer` varchar(55) NOT NULL,
  `address` varchar(1000) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `status` varchar(15) DEFAULT NULL,
  `attachment` varchar(50) DEFAULT NULL,
  `delivered_by` varchar(50) DEFAULT NULL,
  `received_by` varchar(50) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sma_deposits`
--

CREATE TABLE IF NOT EXISTS `sma_deposits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `company_id` int(11) NOT NULL,
  `amount` decimal(25,4) NOT NULL,
  `paid_by` varchar(50) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sma_expenses`
--

CREATE TABLE IF NOT EXISTS `sma_expenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reference` varchar(50) NOT NULL,
  `amount` decimal(25,4) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `created_by` varchar(55) NOT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `sma_expenses`
--

INSERT INTO `sma_expenses` (`id`, `date`, `reference`, `amount`, `note`, `created_by`, `attachment`, `category_id`, `warehouse_id`) VALUES
(1, '2016-11-30 12:28:00', '424', '1007.0000', '', '2', NULL, 1, 2),
(2, '2016-11-30 12:29:00', '454', '2000.0000', '', '2', NULL, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sma_expense_categories`
--

CREATE TABLE IF NOT EXISTS `sma_expense_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(55) NOT NULL,
  `name` varchar(55) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `sma_expense_categories`
--

INSERT INTO `sma_expense_categories` (`id`, `code`, `name`) VALUES
(1, 'NagarPalikatax01', 'Nagar Palika tax');

-- --------------------------------------------------------

--
-- Table structure for table `sma_gift_cards`
--

CREATE TABLE IF NOT EXISTS `sma_gift_cards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `card_no` varchar(20) NOT NULL,
  `value` decimal(25,4) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `customer` varchar(255) DEFAULT NULL,
  `balance` decimal(25,4) NOT NULL,
  `expiry` date DEFAULT NULL,
  `created_by` varchar(55) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `card_no` (`card_no`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `sma_gift_cards`
--

INSERT INTO `sma_gift_cards` (`id`, `date`, `card_no`, `value`, `customer_id`, `customer`, `balance`, `expiry`, `created_by`) VALUES
(1, '2016-11-30 07:23:04', '1622009767424673', '100.0000', 8, 'SIMPLYSAFE', '100.0000', '2018-11-30', '2'),
(2, '2016-11-30 07:24:25', '7592673527726093', '150.0000', 6, 'Hamarisalah1', '250.0000', '2018-11-30', '2'),
(3, '2016-12-01 09:33:31', '1100664579655323', '50.0000', 9, 'shri niwas', '50.0000', '2017-12-01', '2'),
(4, '2016-12-01 09:39:11', '3606165412831153', '500.0000', 10, 'c.sm', '500.0000', '2016-12-01', '2'),
(5, '2016-12-01 09:40:25', '4824296811598352', '500.0000', 6, 'Hamarisalah1', '500.0000', '2016-12-01', '2'),
(6, '2016-12-01 09:41:56', '7018404979780949', '500.0000', 6, 'Hamarisalah1', '500.0000', '2016-12-01', '2'),
(7, '2016-12-01 09:46:43', '0630872433746120', '1.0000', 12, 'bvg', '1.0000', '2018-12-01', '2'),
(8, '2016-12-16 06:47:20', '0929192457402452', '200.0000', 1, 'Walk-in Customer', '200.0000', '2019-01-04', '2'),
(9, '2016-12-16 06:49:46', '12345', '200.0000', 9, 'shri niwas', '200.0000', '2016-12-17', '2'),
(10, '2016-12-16 06:58:11', '123456789', '200.0000', 9, 'shri niwas', '0.0000', '2019-01-04', '2'),
(11, '2016-12-16 06:59:47', '3790527574474598', '2000.0000', 9, 'shri niwas', '1820.0000', '2019-01-12', '2');

-- --------------------------------------------------------

--
-- Table structure for table `sma_gift_card_topups`
--

CREATE TABLE IF NOT EXISTS `sma_gift_card_topups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `card_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `created_by` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `card_id` (`card_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `sma_gift_card_topups`
--

INSERT INTO `sma_gift_card_topups` (`id`, `date`, `card_id`, `amount`, `created_by`) VALUES
(1, '2016-11-30 12:56:06', 2, '100.0000', 2);

-- --------------------------------------------------------

--
-- Table structure for table `sma_groups`
--

CREATE TABLE IF NOT EXISTS `sma_groups` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `sma_groups`
--

INSERT INTO `sma_groups` (`id`, `name`, `description`) VALUES
(1, 'owner', 'Owner'),
(2, 'admin', 'Administrator'),
(3, 'customer', 'Customer'),
(4, 'supplier', 'Supplier'),
(5, 'sales', 'Sales Staff'),
(6, 'sweeper', 'saaf safai');

-- --------------------------------------------------------

--
-- Table structure for table `sma_login_attempts`
--

CREATE TABLE IF NOT EXISTS `sma_login_attempts` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varbinary(16) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=91 ;

--
-- Dumping data for table `sma_login_attempts`
--

INSERT INTO `sma_login_attempts` (`id`, `ip_address`, `login`, `time`) VALUES
(90, '59.90.36.151', 'simplypos', 1484652546);

-- --------------------------------------------------------

--
-- Table structure for table `sma_migrations`
--

CREATE TABLE IF NOT EXISTS `sma_migrations` (
  `version` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_migrations`
--

INSERT INTO `sma_migrations` (`version`) VALUES
(315);

-- --------------------------------------------------------

--
-- Table structure for table `sma_notifications`
--

CREATE TABLE IF NOT EXISTS `sma_notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comment` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `from_date` datetime DEFAULT NULL,
  `till_date` datetime DEFAULT NULL,
  `scope` tinyint(1) NOT NULL DEFAULT '3',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `sma_notifications`
--

INSERT INTO `sma_notifications` (`id`, `comment`, `date`, `from_date`, `till_date`, `scope`) VALUES
(2, '<p>Visit for enjoy</p>', '2016-11-29 05:28:47', '2016-12-02 02:05:00', '2016-11-03 04:50:00', 3);

-- --------------------------------------------------------

--
-- Table structure for table `sma_order_ref`
--

CREATE TABLE IF NOT EXISTS `sma_order_ref` (
  `ref_id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `so` int(11) NOT NULL DEFAULT '1',
  `qu` int(11) NOT NULL DEFAULT '1',
  `po` int(11) NOT NULL DEFAULT '1',
  `to` int(11) NOT NULL DEFAULT '1',
  `pos` int(11) NOT NULL DEFAULT '1',
  `do` int(11) NOT NULL DEFAULT '1',
  `pay` int(11) NOT NULL DEFAULT '1',
  `re` int(11) NOT NULL DEFAULT '1',
  `rep` int(11) NOT NULL DEFAULT '1',
  `ex` int(11) NOT NULL DEFAULT '1',
  `ppay` int(11) NOT NULL DEFAULT '1',
  `qa` int(11) DEFAULT '1',
  PRIMARY KEY (`ref_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `sma_order_ref`
--

INSERT INTO `sma_order_ref` (`ref_id`, `date`, `so`, `qu`, `po`, `to`, `pos`, `do`, `pay`, `re`, `rep`, `ex`, `ppay`, `qa`) VALUES
(1, '2017-01-01', 1, 1, 1, 1, 58, 1, 55, 1, 1, 1, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `sma_payments`
--

CREATE TABLE IF NOT EXISTS `sma_payments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `sale_id` int(11) DEFAULT NULL,
  `return_id` int(11) DEFAULT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `reference_no` varchar(50) NOT NULL,
  `transaction_id` varchar(50) DEFAULT NULL,
  `paid_by` varchar(20) NOT NULL,
  `cheque_no` varchar(20) DEFAULT NULL,
  `cc_no` varchar(20) DEFAULT NULL,
  `cc_holder` varchar(25) DEFAULT NULL,
  `cc_month` varchar(2) DEFAULT NULL,
  `cc_year` varchar(4) DEFAULT NULL,
  `cc_type` varchar(20) DEFAULT NULL,
  `amount` decimal(25,4) NOT NULL,
  `currency` varchar(3) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `type` varchar(20) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `pos_paid` decimal(25,4) DEFAULT '0.0000',
  `pos_balance` decimal(25,4) DEFAULT '0.0000',
  `approval_code` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=331 ;

--
-- Dumping data for table `sma_payments`
--

INSERT INTO `sma_payments` (`id`, `date`, `sale_id`, `return_id`, `purchase_id`, `reference_no`, `transaction_id`, `paid_by`, `cheque_no`, `cc_no`, `cc_holder`, `cc_month`, `cc_year`, `cc_type`, `amount`, `currency`, `created_by`, `attachment`, `type`, `note`, `pos_paid`, `pos_balance`, `approval_code`) VALUES
(1, '2016-11-15 15:38:38', 1, NULL, NULL, 'IPAY/2016/11/0001', NULL, 'cash', '', '', '', '', '', '', '2500.0000', NULL, 2, NULL, 'received', '', '2500.0000', '0.0000', NULL),
(2, '2016-11-15 15:43:39', 2, NULL, NULL, 'IPAY/2016/11/0002', NULL, 'cash', '', '', '', '', '', '', '2500.0000', NULL, 2, NULL, 'received', '', '2500.0000', '0.0000', NULL),
(3, '2016-11-15 16:52:01', 3, NULL, NULL, 'IPAY/2016/11/0003', NULL, 'cash', '', '', '', '', '', '', '2500.0000', NULL, 2, NULL, 'received', '', '2500.0000', '0.0000', NULL),
(4, '2016-11-15 16:54:37', 4, NULL, NULL, 'IPAY/2016/11/0004', NULL, 'cash', '', '', '', '', '', '', '2500.0000', NULL, 2, NULL, 'received', '', '2500.0000', '0.0000', NULL),
(5, '2016-11-15 16:55:09', 5, NULL, NULL, 'IPAY/2016/11/0005', NULL, 'cash', '', '', '', '', '', '', '2500.0000', NULL, 2, NULL, 'received', '', '2500.0000', '0.0000', NULL),
(6, '2016-11-16 18:01:24', 7, NULL, NULL, 'IPAY/2016/11/0006', NULL, 'cash', '', '', '', '', '', '', '12500.0000', NULL, 2, NULL, 'received', '\r\n\r\n', '12500.0000', '0.0000', NULL),
(7, '2016-11-16 19:42:39', 8, NULL, NULL, 'IPAY/2016/11/0007', NULL, 'cash', '', '', '', '', '', '', '2750.0000', NULL, 2, NULL, 'received', '', '14250.0000', '11500.0000', NULL),
(8, '2016-11-16 19:47:31', 9, NULL, NULL, 'IPAY/2016/11/0008', NULL, 'cash', '', '', '', '', '', '', '2375.0000', NULL, 2, NULL, 'received', '', '2375.0000', '0.0000', NULL),
(9, '2016-11-16 19:56:04', 10, NULL, NULL, 'IPAY/2016/11/0009', NULL, 'cash', '', '', '', '', '', '', '2407.3000', NULL, 2, NULL, 'received', '', '2407.3000', '0.0000', NULL),
(10, '2016-11-17 12:55:59', 11, NULL, NULL, 'IPAY/2016/11/0010', NULL, 'cash', '', '', '', '', '', '', '2500.0000', NULL, 2, NULL, 'received', '', '2500.0000', '0.0000', NULL),
(11, '2016-11-17 14:27:00', 12, NULL, NULL, '200', NULL, 'cash', '', '', '', '', '', 'Visa', '39750.0000', NULL, 2, NULL, 'received', '', '0.0000', '0.0000', NULL),
(12, '2016-11-17 14:34:00', NULL, NULL, 1, 'POP/2016/11/0001', NULL, 'cash', '', '', '', '', '', 'Visa', '2014.0000', NULL, 2, NULL, 'sent', '', '0.0000', '0.0000', NULL),
(13, '2016-11-17 17:17:46', 13, NULL, NULL, 'IPAY/2016/11/0011', NULL, 'cash', '', '', '', '', '', '', '25000.0000', NULL, 2, NULL, 'received', '', '25000.0000', '0.0000', NULL),
(14, '2016-11-18 12:48:25', 14, NULL, NULL, 'IPAY/2016/11/0012', NULL, 'cash', '', '', '', '', '', '', '2500.0000', NULL, 2, NULL, 'received', '', '2500.0000', '0.0000', NULL),
(15, '2016-11-19 13:50:18', 15, NULL, NULL, 'IPAY/2016/11/0013', NULL, 'cash', '', '', '', '', '', '', '2500.0000', NULL, 2, NULL, 'received', '', '2500.0000', '0.0000', NULL),
(16, '2016-11-19 19:12:26', 16, NULL, NULL, 'IPAY/2016/11/0014', NULL, 'cash', '', '', '', '', '', '', '2500.0000', NULL, 2, NULL, 'received', 'g', '10000.0000', '7500.0000', NULL),
(17, '2016-11-21 18:36:00', NULL, NULL, 2, 'POP/2016/11/0001', NULL, 'cash', '', '', '', '', '', 'Visa', '3816.0000', NULL, 2, NULL, 'sent', '', '0.0000', '0.0000', NULL),
(18, '2016-11-21 18:38:22', 17, NULL, NULL, 'IPAY/2016/11/0001', NULL, 'cash', '', '', '', '', '', '', '2536.0000', NULL, 2, NULL, 'received', '', '2536.0000', '0.0000', NULL),
(19, '2016-11-22 09:51:13', 18, NULL, NULL, 'IPAY/2016/11/0002', NULL, 'cash', '', '', '', '', '', '', '2500.0000', NULL, 2, NULL, 'received', '', '2500.0000', '0.0000', NULL),
(20, '2016-11-23 10:28:18', 19, NULL, NULL, 'IPAY/2016/11/0003', NULL, 'cash', '', '', '', '', '', '', '2500.0000', NULL, 2, NULL, 'received', '', '5000.0000', '2500.0000', NULL),
(21, '2016-11-23 14:28:16', 20, NULL, NULL, 'IPAY/2016/11/0004', NULL, 'cash', '', '', '', '', '', '', '2500.0000', NULL, 2, NULL, 'received', '', '2500.0000', '0.0000', NULL),
(22, '2016-11-23 14:38:17', 21, NULL, NULL, 'IPAY/2016/11/0005', NULL, 'cash', '', '', '', '', '', '', '2536.0000', NULL, 2, NULL, 'received', '', '2536.0000', '0.0000', NULL),
(23, '2016-11-23 15:08:27', 22, NULL, NULL, 'IPAY/2016/11/0006', NULL, 'cash', '', '', '', '', '', '', '2536.0000', NULL, 2, NULL, 'received', '', '2536.0000', '0.0000', NULL),
(24, '2016-11-23 15:09:18', 23, NULL, NULL, 'IPAY/2016/11/0007', NULL, 'cash', '', '', '', '', '', '', '2500.0000', NULL, 2, NULL, 'received', '', '2500.0000', '0.0000', NULL),
(25, '2016-11-23 15:14:46', 24, NULL, NULL, 'IPAY/2016/11/0008', NULL, 'cash', '', '', '', '', '', '', '2500.0000', NULL, 2, NULL, 'received', '', '2500.0000', '0.0000', NULL),
(26, '2016-11-23 15:25:04', 25, NULL, NULL, 'IPAY/2016/11/0009', NULL, 'cash', '', '', '', '', '', '', '5036.0000', NULL, 2, NULL, 'received', '', '5040.0000', '4.0000', NULL),
(27, '2016-11-23 18:35:45', 26, NULL, NULL, 'IPAY/2016/11/0010', NULL, 'cash', '', '', '', '', '', '', '2500.0000', NULL, 2, NULL, 'received', '', '2500.0000', '0.0000', NULL),
(28, '2016-11-23 18:42:12', 27, NULL, NULL, 'IPAY/2016/11/0011', NULL, 'cash', '', '', '', '', '', '', '2561.0000', NULL, 2, NULL, 'received', '', '2561.0000', '0.0000', NULL),
(29, '2016-11-24 14:43:42', 28, NULL, NULL, 'IPAY/2016/11/0012', NULL, 'cash', '', '', '', '', '', '', '2500.0000', NULL, 2, NULL, 'received', '', '2500.0000', '0.0000', NULL),
(30, '2016-11-25 16:09:21', 29, NULL, NULL, 'IPAY/2016/11/0013', NULL, 'cash', '', '', '', '', '', '', '2500.0000', NULL, 2, NULL, 'received', '', '2500.0000', '0.0000', NULL),
(31, '2016-11-25 16:35:20', 30, NULL, NULL, 'IPAY/2016/11/0014', NULL, 'cash', '', '', '', '', '', '', '2525.0000', NULL, 2, NULL, 'received', '', '2525.0000', '0.0000', NULL),
(32, '2016-11-25 16:45:52', 31, NULL, NULL, 'IPAY/2016/11/0015', NULL, 'cash', '', '', '', '', '', '', '2525.0000', NULL, 2, NULL, 'received', '', '2525.0000', '0.0000', NULL),
(33, '2016-11-25 17:55:05', 32, NULL, NULL, 'IPAY/2016/11/0016', NULL, 'cash', '', '', '', '', '', '', '2525.0000', NULL, 2, NULL, 'received', '', '5050.0000', '2525.0000', NULL),
(34, '2016-11-26 12:46:44', 33, NULL, NULL, 'IPAY/2016/11/0017', NULL, 'cash', '', '', '', '', '', '', '125000.0000', NULL, 2, NULL, 'received', '', '125000.0000', '0.0000', NULL),
(35, '2016-11-26 13:32:14', 34, NULL, NULL, 'IPAY/2016/11/0018', NULL, 'cash', '', '', '', '', '', '', '2536.0000', NULL, 2, NULL, 'received', '', '2536.0000', '0.0000', NULL),
(36, '2016-11-26 13:50:38', 35, NULL, NULL, 'IPAY/2016/11/0019', NULL, 'cash', '', '', '', '', '', '', '500.0000', NULL, 2, NULL, 'received', '', '500.0000', '0.0000', NULL),
(37, '2016-11-26 14:16:45', 36, NULL, NULL, 'IPAY/2016/11/0020', NULL, 'cash', '', '', '', '', '', '', '3000.0000', NULL, 2, NULL, 'received', '', '3000.0000', '-180.0000', NULL),
(38, '2016-11-26 14:16:45', 36, NULL, NULL, 'IPAY/2016/11/0021', NULL, 'other', '', '', '', '', '', '', '180.0000', NULL, 2, NULL, 'received', 'cc\r\n', '180.0000', '0.0000', NULL),
(39, '2016-11-26 16:26:44', 37, NULL, NULL, 'IPAY/2016/11/0022', NULL, 'cash', '', '', '', '', '', '', '5350.0000', NULL, 2, NULL, 'received', '', '5350.0000', '0.0000', NULL),
(40, '2016-11-26 20:18:50', 38, NULL, NULL, 'IPAY/2016/11/0023', NULL, 'CC', '', '', '', '', '', '', '2650.0000', NULL, 2, NULL, 'received', '', '2650.0000', '0.0000', NULL),
(41, '2016-11-27 04:50:36', 39, NULL, NULL, 'IPAY/2016/11/0024', NULL, 'CC', '', '', '', '', '', '', '2650.0000', NULL, 2, NULL, 'received', '', '5300.0000', '2650.0000', NULL),
(42, '2016-11-27 16:07:52', 40, NULL, NULL, 'IPAY/2016/11/0025', NULL, 'cash', '', '', '', '', '', '', '2675.0000', NULL, 2, NULL, 'received', '', '2675.0000', '0.0000', NULL),
(43, '2016-11-27 16:36:22', 41, NULL, NULL, 'IPAY/2016/11/0026', NULL, 'CC', '', '', '', '', '', '', '2650.0000', NULL, 2, NULL, 'received', '', '2650.0000', '0.0000', NULL),
(44, '2016-11-27 16:51:01', 42, NULL, NULL, 'IPAY/2016/11/0027', NULL, 'cash', '', '', '', '', '', '', '2675.0000', NULL, 2, NULL, 'received', '', '2675.0000', '0.0000', NULL),
(45, '2016-11-27 22:53:25', 43, NULL, NULL, 'IPAY/2016/11/0028', NULL, 'cash', '', '', '', '', '', '', '2650.0000', NULL, 2, NULL, 'received', '', '2650.0000', '0.0000', NULL),
(46, '2016-11-28 05:57:06', 44, NULL, NULL, 'IPAY/2016/11/0029', NULL, 'cash', '', '', '', '', '', '', '2650.0000', NULL, 2, NULL, 'received', '', '2650.0000', '0.0000', NULL),
(47, '2016-12-02 11:32:46', 46, NULL, NULL, 'IPAY/2016/12/0030', NULL, 'cash', '', '', '', '', '', '', '420.0000', NULL, 2, NULL, 'received', '', '420.0000', '0.0000', NULL),
(48, '2016-12-02 12:36:14', 47, NULL, NULL, 'IPAY/2016/12/0031', NULL, 'cash', '', '', '', '', '', '', '220.0000', NULL, 2, NULL, 'received', '', '220.0000', '0.0000', NULL),
(49, '2016-12-02 14:50:00', 48, NULL, NULL, 'IPAY/2016/12/0032', NULL, 'cash', '', '', '', '', '', '', '200.0000', NULL, 2, NULL, 'received', '', '200.0000', '0.0000', NULL),
(50, '2016-12-02 16:25:42', 49, NULL, NULL, 'IPAY/2016/12/0033', NULL, 'cash', '', '', '', '', '', '', '300.0000', NULL, 2, NULL, 'received', '', '300.0000', '0.0000', NULL),
(51, '2016-12-02 16:31:12', 50, NULL, NULL, 'IPAY/2016/12/0034', NULL, 'cash', '', '', '', '', '', '', '300.0000', NULL, 2, NULL, 'received', '', '300.0000', '0.0000', NULL),
(52, '2016-12-02 17:25:19', 51, NULL, NULL, 'IPAY/2016/12/0035', NULL, 'cash', '', '', '', '', '', '', '27.0000', NULL, 2, NULL, 'received', '', '27.0000', '0.0000', NULL),
(53, '2016-12-03 12:18:06', 52, NULL, NULL, 'IPAY/2016/12/0036', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(54, '2016-12-03 22:52:16', 53, NULL, NULL, 'IPAY/2016/12/0037', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(55, '2016-12-04 15:20:52', 54, NULL, NULL, 'IPAY/2016/12/0038', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(56, '2016-12-04 17:42:35', 55, NULL, NULL, 'IPAY/2016/12/0039', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(57, '2016-12-04 17:44:08', 56, NULL, NULL, 'IPAY/2016/12/0040', NULL, 'cash', '', '', '', '', '', '', '210.0000', NULL, 6, NULL, 'received', '', '210.0000', '0.0000', NULL),
(58, '2016-12-04 17:50:36', 57, NULL, NULL, 'IPAY/2016/12/0041', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 6, NULL, 'received', '', '60.0000', '0.0000', NULL),
(59, '2016-12-04 23:16:39', 58, NULL, NULL, 'IPAY/2016/12/0042', NULL, 'cash', '', '', '', '', '', '', '120.0000', NULL, 2, NULL, 'received', '', '500.0000', '380.0000', NULL),
(60, '2016-12-04 23:23:52', 59, NULL, NULL, 'IPAY/2016/12/0043', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '2090.0000', '2030.0000', NULL),
(61, '2016-12-04 23:25:58', 60, NULL, NULL, 'IPAY/2016/12/0044', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '134.0000', '74.0000', NULL),
(62, '2016-12-04 23:27:25', 61, NULL, NULL, 'IPAY/2016/12/0045', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(63, '2016-12-04 23:41:26', 62, NULL, NULL, 'IPAY/2016/12/0046', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(64, '2016-12-05 09:27:11', 63, NULL, NULL, 'IPAY/2016/12/0047', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '173.0000', '113.0000', NULL),
(65, '2016-12-05 09:37:50', 64, NULL, NULL, 'IPAY/2016/12/0048', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '224.0000', '164.0000', NULL),
(66, '2016-12-05 09:40:36', 65, NULL, NULL, 'IPAY/2016/12/0049', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '123.0000', '63.0000', NULL),
(67, '2016-12-05 09:54:50', 66, NULL, NULL, 'IPAY/2016/12/0050', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '400.0000', '340.0000', NULL),
(68, '2016-12-05 09:57:54', 67, NULL, NULL, 'IPAY/2016/12/0051', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '466.0000', '406.0000', NULL),
(69, '2016-12-05 10:29:14', 68, NULL, NULL, 'IPAY/2016/12/0052', NULL, 'cash', '', '', '', '', '', '', '150.0000', NULL, 2, NULL, 'received', '', '150.0000', '0.0000', NULL),
(70, '2016-12-05 11:22:56', 69, NULL, NULL, 'IPAY/2016/12/0053', NULL, 'cash', '', '', '', '', '', '', '50.0000', NULL, 2, NULL, 'received', '', '50.0000', '0.0000', NULL),
(71, '2016-12-05 13:02:39', 70, NULL, NULL, 'IPAY/2016/12/0054', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(72, '2016-12-05 14:38:21', 71, NULL, NULL, 'IPAY/2016/12/0055', NULL, 'cash', '', '', '', '', '', '', '2536.0000', NULL, 2, NULL, 'received', '', '2536.0000', '0.0000', NULL),
(73, '2016-12-05 15:01:31', 72, NULL, NULL, 'IPAY/2016/12/0056', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '2100.0000', '2040.0000', NULL),
(74, '2016-12-06 00:15:26', 73, NULL, NULL, 'IPAY/2016/12/0057', NULL, 'cash', '', '', '', '', '', '', '120.0000', NULL, 2, NULL, 'received', '', '123.0000', '3.0000', NULL),
(75, '2016-12-06 00:20:24', 74, NULL, NULL, 'IPAY/2016/12/0058', NULL, 'cash', '', '', '', '', '', '', '378.0000', NULL, 2, NULL, 'received', '', '378.0000', '0.0000', NULL),
(76, '2016-12-06 00:21:13', 75, NULL, NULL, 'IPAY/2016/12/0059', NULL, 'cash', '', '', '', '', '', '', '40.0000', NULL, 2, NULL, 'received', '', '123.0000', '83.0000', NULL),
(77, '2016-12-06 01:02:03', 76, NULL, NULL, 'IPAY/2016/12/0060', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(78, '2016-12-06 01:16:55', 77, NULL, NULL, 'IPAY/2016/12/0061', NULL, 'cash', '', '', '', '', '', '', '50.0000', NULL, 2, NULL, 'received', '', '50.0000', '-10.0000', NULL),
(79, '2016-12-06 01:20:19', 78, NULL, NULL, 'IPAY/2016/12/0062', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '500.0000', '440.0000', NULL),
(80, '2016-12-06 01:24:28', 79, NULL, NULL, 'IPAY/2016/12/0063', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '500.0000', '440.0000', NULL),
(81, '2016-12-06 01:29:11', 80, NULL, NULL, 'IPAY/2016/12/0064', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '500.0000', '440.0000', NULL),
(82, '2016-12-06 01:33:27', 81, NULL, NULL, 'IPAY/2016/12/0065', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '1000.0000', '940.0000', NULL),
(83, '2016-12-06 01:40:15', 82, NULL, NULL, 'IPAY/2016/12/0066', NULL, 'cash', '', '', '', '', '', '', '120.0000', NULL, 2, NULL, 'received', '', '5000.0000', '4880.0000', NULL),
(84, '2016-12-06 09:19:18', 83, NULL, NULL, 'IPAY/2016/12/0067', NULL, 'cash', '', '', '', '', '', '', '100.0000', NULL, 2, NULL, 'received', '', '1000.0000', '900.0000', NULL),
(85, '2016-12-06 09:34:21', 84, NULL, NULL, 'IPAY/2016/12/0068', NULL, 'cash', '', '', '', '', '', '', '100.0000', NULL, 2, NULL, 'received', '', '500.0000', '400.0000', NULL),
(86, '2016-12-06 09:43:43', 85, NULL, NULL, 'IPAY/2016/12/0069', NULL, 'cash', '', '', '', '', '', '', '100.0000', NULL, 2, NULL, 'received', '', '500.0000', '400.0000', NULL),
(87, '2016-12-06 09:50:46', 86, NULL, NULL, 'IPAY/2016/12/0070', NULL, 'cash', '', '', '', '', '', '', '100.0000', NULL, 2, NULL, 'received', '', '100.0000', '0.0000', NULL),
(88, '2016-12-06 10:04:48', 87, NULL, NULL, 'IPAY/2016/12/0071', NULL, 'cash', '', '', '', '', '', '', '100.0000', NULL, 2, NULL, 'received', '', '500.0000', '400.0000', NULL),
(89, '2016-12-06 10:07:13', 88, NULL, NULL, 'IPAY/2016/12/0072', NULL, 'cash', '', '', '', '', '', '', '100.0000', NULL, 2, NULL, 'received', '', '1100.0000', '1000.0000', NULL),
(90, '2016-12-06 10:08:23', 89, NULL, NULL, 'IPAY/2016/12/0073', NULL, 'cash', '', '', '', '', '', '', '100.0000', NULL, 2, NULL, 'received', '', '1000.0000', '900.0000', NULL),
(91, '2016-12-06 15:28:37', 90, NULL, NULL, 'IPAY/2016/12/0074', NULL, 'cash', '', '', '', '', '', '', '120.0000', NULL, 2, NULL, 'received', '', '120.0000', '0.0000', NULL),
(92, '2016-12-06 16:04:08', 91, NULL, NULL, 'IPAY/2016/12/0075', NULL, 'cash', '', '', '', '', '', '', '120.0000', NULL, 2, NULL, 'received', '', '240.0000', '120.0000', NULL),
(93, '2016-12-06 16:58:07', 92, NULL, NULL, 'IPAY/2016/12/0076', NULL, 'CC', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '120.0000', '60.0000', NULL),
(94, '2016-12-07 00:32:55', 94, NULL, NULL, 'IPAY/2016/12/0077', NULL, 'CC', '', '4111111111111111', 'chetan ghagre', '2', '17', '', '378.0000', NULL, 2, NULL, 'received', '', '378.0000', '0.0000', NULL),
(95, '2016-12-07 00:37:19', 95, NULL, NULL, 'IPAY/2016/12/0078', NULL, 'CC', '', '4012888888881881', 'chetan ghagre', '2', '17', '', '60.0000', NULL, 2, NULL, 'received', '', '438.0000', '378.0000', NULL),
(96, '2016-12-07 02:44:11', 96, NULL, NULL, 'IPAY/2016/12/0001', NULL, 'CC', '', '4111111111111111', 'cg gg', '3', '20', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(97, '2016-12-07 13:11:23', 97, NULL, NULL, 'IPAY/2016/12/0002', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(98, '2016-12-08 00:48:01', 98, NULL, NULL, 'IPAY/2016/12/0003', NULL, 'CC', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '1000.0000', '940.0000', NULL),
(99, '2016-12-08 01:01:33', 99, NULL, NULL, 'IPAY/2016/12/0004', NULL, 'CC', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '1110.0000', '1050.0000', NULL),
(100, '2016-12-08 13:23:28', 100, NULL, NULL, 'IPAY/2016/12/0005', NULL, 'cash', '', '', '', '', '', '', '90.0000', NULL, 2, NULL, 'received', '', '90.0000', '0.0000', NULL),
(101, '2016-12-08 23:43:12', 102, NULL, NULL, 'IPAY/2016/12/0006', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(102, '2016-12-10 00:46:32', 104, NULL, NULL, 'IPAY/2016/12/0007', NULL, 'Cheque', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '1000.0000', '940.0000', NULL),
(103, '2016-12-10 19:02:49', 107, NULL, NULL, 'IPAY/2016/12/0008', NULL, 'cash', '', '4032032169639769', 'sana-buyer@greatwebsoft.c', '06', '2021', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(104, '2016-12-11 05:49:09', 108, NULL, NULL, 'IPAY/2016/12/0009', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(105, '2016-12-11 05:50:38', 109, NULL, NULL, 'IPAY/2016/12/0010', NULL, 'cash', '', '', '', '', '', '', '120.0000', NULL, 2, NULL, 'received', '', '500.0000', '380.0000', NULL),
(106, '2016-12-11 15:18:28', 110, NULL, NULL, 'IPAY/2016/12/0011', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '5500.0000', '5440.0000', NULL),
(107, '2016-12-11 15:19:55', 111, NULL, NULL, 'IPAY/2016/12/0012', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '6000.0000', '5940.0000', NULL),
(108, '2016-12-11 15:21:15', 112, NULL, NULL, 'IPAY/2016/12/0013', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '500.0000', '440.0000', NULL),
(109, '2016-12-11 15:28:54', 113, NULL, NULL, 'IPAY/2016/12/0014', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '500.0000', '440.0000', NULL),
(110, '2016-12-11 15:29:45', 114, NULL, NULL, 'IPAY/2016/12/0015', NULL, 'cash', '', '', '', '', '', '', '100.0000', NULL, 2, NULL, 'received', '', '1500.0000', '1400.0000', NULL),
(111, '2016-12-11 15:30:17', 115, NULL, NULL, 'IPAY/2016/12/0016', NULL, 'cash', '', '', '', '', '', '', '100.0000', NULL, 2, NULL, 'received', '', '2000.0000', '1900.0000', NULL),
(112, '2016-12-11 15:37:16', 116, NULL, NULL, 'IPAY/2016/12/0017', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(113, '2016-12-11 15:39:51', 117, NULL, NULL, 'IPAY/2016/12/0018', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '500.0000', '440.0000', NULL),
(114, '2016-12-11 15:40:58', 118, NULL, NULL, 'IPAY/2016/12/0019', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '1000.0000', '940.0000', NULL),
(115, '2016-12-11 15:43:50', 119, NULL, NULL, 'IPAY/2016/12/0020', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '2000.0000', '1940.0000', NULL),
(116, '2016-12-11 15:46:28', 120, NULL, NULL, 'IPAY/2016/12/0021', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(117, '2016-12-11 22:24:26', 121, NULL, NULL, 'IPAY/2016/12/0022', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '602.0000', '542.0000', NULL),
(118, '2016-12-12 15:11:15', 122, NULL, NULL, 'IPAY/2016/12/0023', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(119, '2016-12-12 15:13:13', 123, NULL, NULL, 'IPAY/2016/12/0024', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(120, '2016-12-12 21:26:28', 125, NULL, NULL, 'IPAY/2016/12/0025', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(121, '2016-12-12 22:42:46', 126, NULL, NULL, 'IPAY/2016/12/0026', NULL, 'cash', '', '', '', '', '', '', '363.0000', NULL, 2, NULL, 'received', '', '363.0000', '0.0000', NULL),
(122, '2016-12-13 03:14:59', 127, NULL, NULL, 'IPAY/2016/12/0027', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(123, '2016-12-14 12:31:10', 134, NULL, NULL, 'IPAY/2016/12/0028', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(124, '2016-12-14 12:31:49', 135, NULL, NULL, 'IPAY/2016/12/0029', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(125, '2016-12-14 21:22:31', 145, NULL, NULL, 'IPAY/2016/12/0030', NULL, 'cash', '', '', '', '', '', '', '110.0000', NULL, 2, NULL, 'received', '', '110.0000', '0.0000', NULL),
(126, '2016-12-14 22:50:14', 147, NULL, NULL, 'IPAY/2016/12/0031', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(127, '2016-12-14 22:52:04', 148, NULL, NULL, 'IPAY/2016/12/0032', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '160.0000', '100.0000', NULL),
(128, '2016-12-14 22:53:13', 149, NULL, NULL, 'IPAY/2016/12/0033', NULL, 'cash', '', '', '', '', '', '', '120.0000', NULL, 2, NULL, 'received', '', '120.0000', '0.0000', NULL),
(129, '2016-12-14 23:01:37', 150, NULL, NULL, 'IPAY/2016/12/0034', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(130, '2016-12-14 23:06:14', 151, NULL, NULL, 'IPAY/2016/12/0035', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '520.0000', '460.0000', NULL),
(131, '2016-12-14 23:07:02', 152, NULL, NULL, 'IPAY/2016/12/0036', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(132, '2016-12-14 23:08:52', 153, NULL, NULL, 'IPAY/2016/12/0037', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '100.0000', '40.0000', NULL),
(133, '2016-12-14 23:11:09', 154, NULL, NULL, 'IPAY/2016/12/0038', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '100.0000', '40.0000', NULL),
(134, '2016-12-14 23:16:21', 155, NULL, NULL, 'IPAY/2016/12/0039', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '100.0000', '40.0000', NULL),
(135, '2016-12-14 23:26:56', 156, NULL, NULL, 'IPAY/2016/12/0040', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '500.0000', '440.0000', NULL),
(136, '2016-12-14 23:27:56', 157, NULL, NULL, 'IPAY/2016/12/0041', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '5000.0000', '4940.0000', NULL),
(137, '2016-12-14 23:28:56', 158, NULL, NULL, 'IPAY/2016/12/0042', NULL, 'cash', '', '', '', '', '', '', '50.0000', NULL, 2, NULL, 'received', '', '50.0000', '-10.0000', NULL),
(138, '2016-12-14 23:30:28', 159, NULL, NULL, 'IPAY/2016/12/0043', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '500.0000', '440.0000', NULL),
(139, '2016-12-14 23:33:29', 160, NULL, NULL, 'IPAY/2016/12/0044', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(140, '2016-12-14 23:36:04', 161, NULL, NULL, 'IPAY/2016/12/0045', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(141, '2016-12-14 23:37:13', 162, NULL, NULL, 'IPAY/2016/12/0046', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(142, '2016-12-14 23:46:34', 163, NULL, NULL, 'IPAY/2016/12/0047', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(143, '2016-12-14 23:48:52', 164, NULL, NULL, 'IPAY/2016/12/0048', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(144, '2016-12-14 23:49:24', 165, NULL, NULL, 'IPAY/2016/12/0049', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '120.0000', '60.0000', NULL),
(145, '2016-12-14 23:53:03', 166, NULL, NULL, 'IPAY/2016/12/0050', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(146, '2016-12-15 00:17:39', 167, NULL, NULL, 'IPAY/2016/12/0051', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(147, '2016-12-15 00:22:00', 168, NULL, NULL, 'IPAY/2016/12/0052', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(148, '2016-12-15 00:29:43', 169, NULL, NULL, 'IPAY/2016/12/0053', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(149, '2016-12-15 00:33:14', 170, NULL, NULL, 'IPAY/2016/12/0054', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(150, '2016-12-15 08:26:10', 173, NULL, NULL, 'IPAY/2016/12/0055', NULL, 'cash', '', '', '', '', '', '', '160.0000', NULL, 2, NULL, 'received', '', '160.0000', '0.0000', NULL),
(151, '2016-12-15 08:38:22', 174, NULL, NULL, 'IPAY/2016/12/0056', NULL, 'cash', '', '', '', '', '', '', '120.0000', NULL, 2, NULL, 'received', '', '120.0000', '0.0000', NULL),
(152, '2016-12-15 08:50:10', 175, NULL, NULL, 'IPAY/2016/12/0057', NULL, 'cash', '', '', '', '', '', '', '120.0000', NULL, 2, NULL, 'received', '', '120.0000', '0.0000', NULL),
(153, '2016-12-15 08:59:25', 176, NULL, NULL, 'IPAY/2016/12/0058', NULL, 'cash', '', '', '', '', '', '', '120.0000', NULL, 2, NULL, 'received', '', '120.0000', '0.0000', NULL),
(154, '2016-12-15 17:09:00', 185, NULL, NULL, 'IPAY/2016/12/0059', NULL, 'CC', '', '4111111111111111', 'hbgb h', '5', '16', 'Visa', '60.0000', NULL, 2, NULL, 'received', '', '0.0000', '0.0000', NULL),
(155, '2016-12-15 19:25:54', 192, NULL, NULL, 'IPAY/2016/12/0060', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(156, '2016-12-15 20:29:14', 194, NULL, NULL, 'IPAY/2016/12/0061', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(157, '2016-12-15 20:30:04', 195, NULL, NULL, 'IPAY/2016/12/0062', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(158, '2016-12-15 21:07:22', 199, NULL, NULL, 'IPAY/2016/12/0063', NULL, 'cash', '', '', '', '', '', '', '120.0000', NULL, 2, NULL, 'received', '', '120.0000', '0.0000', NULL),
(159, '2016-12-15 21:36:05', 200, NULL, NULL, 'IPAY/2016/12/0064', NULL, 'cash', '', '', '', '', '', '', '120.0000', NULL, 2, NULL, 'received', '', '120.0000', '0.0000', NULL),
(160, '2016-12-15 21:41:40', 201, NULL, NULL, 'IPAY/2016/12/0065', NULL, 'cash', '', '', '', '', '', '', '70.0000', NULL, 2, NULL, 'received', '', '70.0000', '0.0000', NULL),
(161, '2016-12-16 12:19:57', 202, NULL, NULL, 'IPAY/2016/12/0066', NULL, 'cash', '', '', '', '', '', '', '70.0000', NULL, 2, NULL, 'received', '', '70.0000', '0.0000', NULL),
(162, '2016-12-16 12:21:05', 203, NULL, NULL, 'IPAY/2016/12/0067', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', 'testing', '60.0000', '0.0000', NULL),
(163, '2016-12-16 12:22:04', 204, NULL, NULL, 'IPAY/2016/12/0068', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(164, '2016-12-16 12:28:31', 205, NULL, NULL, 'IPAY/2016/12/0069', NULL, 'cash', '', '', '', '', '', '', '70.0000', NULL, 2, NULL, 'received', '', '70.0000', '0.0000', NULL),
(165, '2016-12-16 12:29:56', 206, NULL, NULL, 'IPAY/2016/12/0070', NULL, 'cash', '', '', '', '', '', '', '70.0000', NULL, 2, NULL, 'received', '', '70.0000', '0.0000', NULL),
(166, '2016-12-16 12:31:20', 207, NULL, NULL, 'IPAY/2016/12/0071', NULL, 'cash', '', '', '', '', '', '', '120.0000', NULL, 2, NULL, 'received', '', '120.0000', '0.0000', NULL),
(167, '2016-12-16 12:33:02', 208, NULL, NULL, 'IPAY/2016/12/0072', NULL, 'gift_card', '', '3790527574474598', '', '', '', '', '120.0000', NULL, 2, NULL, 'received', 'tt', '120.0000', '0.0000', NULL),
(168, '2016-12-16 12:36:05', 209, NULL, NULL, 'IPAY/2016/12/0073', NULL, 'gift_card', '', '3790527574474598', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', 'tt', '60.0000', '0.0000', NULL),
(169, '2016-12-16 12:48:40', 210, NULL, NULL, 'IPAY/2016/12/0074', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', 'tt', '60.0000', '0.0000', NULL),
(170, '2016-12-16 14:12:47', 215, NULL, NULL, 'IPAY/2016/12/0075', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(171, '2016-12-16 14:32:08', 216, NULL, NULL, 'IPAY/2016/12/0076', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(172, '2016-12-16 23:21:32', 217, NULL, NULL, 'IPAY/2016/12/0077', NULL, 'CC', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(173, '2016-12-17 21:31:22', 218, NULL, NULL, 'IPAY/2016/12/0078', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(174, '2016-12-17 21:34:05', 219, NULL, NULL, 'IPAY/2016/12/0079', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(175, '2016-12-17 21:35:12', 220, NULL, NULL, 'IPAY/2016/12/0080', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(176, '2016-12-17 22:03:23', 221, NULL, NULL, 'IPAY/2016/12/0081', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(177, '2016-12-18 15:51:08', 222, NULL, NULL, 'IPAY/2016/12/0082', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(178, '2016-12-19 13:04:34', 223, NULL, NULL, 'IPAY/2016/12/0083', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(179, '2016-12-20 11:06:28', 224, NULL, NULL, 'IPAY/2016/12/0084', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', 'dfdfsd', '60.0000', '0.0000', NULL),
(180, '2016-12-20 11:07:06', 225, NULL, NULL, 'IPAY/2016/12/0085', NULL, 'gift_card', '', '4111111111111111', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(181, '2016-12-20 11:08:18', 226, NULL, NULL, 'IPAY/2016/12/0086', NULL, 'gift_card', '', '353164310366577', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(182, '2016-12-20 11:10:39', 227, NULL, NULL, 'IPAY/2016/12/0087', NULL, 'CC', '', '4032032169639769', 'sana-buyer@greatwebsoft.c', '06', '2021', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(183, '2016-12-20 11:26:20', 228, NULL, NULL, 'IPAY/2016/12/0088', NULL, 'Cheque', '0101', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(184, '2016-12-20 11:26:51', 229, NULL, NULL, 'IPAY/2016/12/0089', NULL, 'other', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(185, '2016-12-20 20:47:06', 233, NULL, NULL, 'IPAY/2016/12/0090', NULL, 'CC', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(186, '2016-12-21 00:01:42', 234, NULL, NULL, 'IPAY/2016/12/0091', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(187, '2016-12-21 00:10:58', 235, NULL, NULL, 'IPAY/2016/12/0092', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(188, '2016-12-21 00:13:41', 236, NULL, NULL, 'IPAY/2016/12/0093', NULL, 'gift_card', '', '123456789', '', '', '', '', '200.0000', NULL, 2, NULL, 'received', '', '200.0000', '0.0000', NULL),
(189, '2016-12-21 00:15:31', 237, NULL, NULL, 'IPAY/2016/12/0094', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(190, '2016-12-21 00:15:47', 238, NULL, NULL, 'IPAY/2016/12/0095', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(191, '2016-12-21 00:16:27', 239, NULL, NULL, 'IPAY/2016/12/0096', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(192, '2016-12-21 00:16:36', 240, NULL, NULL, 'IPAY/2016/12/0097', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(193, '2016-12-21 00:17:21', 241, NULL, NULL, 'IPAY/2016/12/0098', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(194, '2016-12-21 00:19:30', 242, NULL, NULL, 'IPAY/2016/12/0099', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(195, '2016-12-21 00:23:37', 243, NULL, NULL, 'IPAY/2016/12/0100', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(196, '2016-12-21 00:24:02', 244, NULL, NULL, 'IPAY/2016/12/0101', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(197, '2016-12-21 00:25:09', 245, NULL, NULL, 'IPAY/2016/12/0102', NULL, 'cash', '', '', '', '', '', '', '120.0000', NULL, 2, NULL, 'received', '', '120.0000', '0.0000', NULL),
(198, '2016-12-21 00:25:50', 246, NULL, NULL, 'IPAY/2016/12/0103', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(199, '2016-12-21 00:30:00', 247, NULL, NULL, 'IPAY/2016/12/0104', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(200, '2016-12-21 00:33:54', 248, NULL, NULL, 'IPAY/2016/12/0105', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(201, '2016-12-21 00:34:15', 249, NULL, NULL, 'IPAY/2016/12/0106', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(202, '2016-12-21 00:35:25', 250, NULL, NULL, 'IPAY/2016/12/0107', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(203, '2016-12-21 00:36:41', 251, NULL, NULL, 'IPAY/2016/12/0108', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(204, '2016-12-21 00:42:22', 252, NULL, NULL, 'IPAY/2016/12/0109', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(205, '2016-12-21 00:43:56', 253, NULL, NULL, 'IPAY/2016/12/0110', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(206, '2016-12-21 00:46:56', 254, NULL, NULL, 'IPAY/2016/12/0111', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(207, '2016-12-21 00:51:19', 255, NULL, NULL, 'IPAY/2016/12/0112', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(208, '2016-12-21 08:38:38', 256, NULL, NULL, 'IPAY/2016/12/0113', NULL, 'cash', '', '', '', '', '', '', '87.0000', NULL, 2, NULL, 'received', '', '87.0000', '0.0000', NULL),
(209, '2016-12-21 08:40:40', 257, NULL, NULL, 'IPAY/2016/12/0114', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(210, '2016-12-22 11:47:35', 259, NULL, NULL, 'IPAY/2016/12/0115', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(211, '2016-12-22 12:27:46', 260, NULL, NULL, 'IPAY/2016/12/0116', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(212, '2016-12-22 12:29:33', 261, NULL, NULL, 'IPAY/2016/12/0117', NULL, 'cash', '', '', '', '', '', '', '90.0000', NULL, 2, NULL, 'received', '', '90.0000', '0.0000', NULL),
(213, '2016-12-22 12:32:13', 262, NULL, NULL, 'IPAY/2016/12/0118', NULL, 'cash', '', '', '', '', '', '', '150.0000', NULL, 2, NULL, 'received', '', '150.0000', '0.0000', NULL),
(214, '2016-12-22 13:30:26', 263, NULL, NULL, 'IPAY/2016/12/0119', NULL, 'cash', '', '', '', '', '', '', '5560.0000', NULL, 2, NULL, 'received', '', '5560.0000', '0.0000', NULL),
(215, '2016-12-22 15:24:31', 264, NULL, NULL, 'IPAY/2016/12/0120', NULL, 'cash', '', '', '', '', '', '', '120.0000', NULL, 2, NULL, 'received', '', '120.0000', '0.0000', NULL),
(216, '2016-12-22 15:29:20', 265, NULL, NULL, 'IPAY/2016/12/0121', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(217, '2016-12-22 15:29:57', 266, NULL, NULL, 'IPAY/2016/12/0122', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(218, '2016-12-22 15:32:28', 267, NULL, NULL, 'IPAY/2016/12/0123', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(219, '2016-12-23 12:14:34', 268, NULL, NULL, 'IPAY/2016/12/0124', NULL, 'cash', '', '', '', '', '', '', '160.0000', NULL, 2, NULL, 'received', '', '160.0000', '0.0000', NULL),
(220, '2016-12-23 12:15:56', 269, NULL, NULL, 'IPAY/2016/12/0125', NULL, 'cash', '', '', '', '', '', '', '160.0000', NULL, 2, NULL, 'received', '', '160.0000', '0.0000', NULL),
(221, '2016-12-23 12:19:06', 270, NULL, NULL, 'IPAY/2016/12/0126', NULL, 'cash', '', '', '', '', '', '', '100.0000', NULL, 2, NULL, 'received', '', '100.0000', '0.0000', NULL),
(222, '2016-12-23 12:24:04', 271, NULL, NULL, 'IPAY/2016/12/0127', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(223, '2016-12-23 12:28:53', 272, NULL, NULL, 'IPAY/2016/12/0128', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(224, '2016-12-23 12:33:41', 273, NULL, NULL, 'IPAY/2016/12/0129', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(225, '2016-12-23 12:53:20', 274, NULL, NULL, 'IPAY/2016/12/0130', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(226, '2016-12-23 12:59:58', 275, NULL, NULL, 'IPAY/2016/12/0131', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(227, '2016-12-23 13:03:22', 276, NULL, NULL, 'IPAY/2016/12/0132', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(228, '2016-12-23 13:03:33', 277, NULL, NULL, 'IPAY/2016/12/0133', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(229, '2016-12-23 13:04:46', 278, NULL, NULL, 'IPAY/2016/12/0134', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(230, '2016-12-23 13:06:40', 279, NULL, NULL, 'IPAY/2016/12/0135', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(231, '2016-12-23 13:07:18', 280, NULL, NULL, 'IPAY/2016/12/0136', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(232, '2016-12-23 13:14:05', 281, NULL, NULL, 'IPAY/2016/12/0137', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(233, '2016-12-23 13:15:46', 282, NULL, NULL, 'IPAY/2016/12/0138', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(234, '2016-12-23 13:24:20', 283, NULL, NULL, 'IPAY/2016/12/0139', NULL, 'cash', '', '', '', '', '', '', '90.0000', NULL, 2, NULL, 'received', '', '90.0000', '0.0000', NULL),
(235, '2016-12-23 13:32:22', 284, NULL, NULL, 'IPAY/2016/12/0140', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(236, '2016-12-23 15:39:32', 291, NULL, NULL, 'IPAY/2016/12/0141', NULL, 'cash', '', '', '', '', '', '', '50.0000', NULL, 2, NULL, 'received', '', '50.0000', '0.0000', NULL),
(237, '2016-12-23 16:26:33', 292, NULL, NULL, 'IPAY/2016/12/0142', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(238, '2016-12-23 16:28:38', 293, NULL, NULL, 'IPAY/2016/12/0143', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(239, '2016-12-23 16:37:35', 294, NULL, NULL, 'IPAY/2016/12/0144', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(240, '2016-12-23 16:38:45', 295, NULL, NULL, 'IPAY/2016/12/0145', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(241, '2016-12-23 16:39:46', 296, NULL, NULL, 'IPAY/2016/12/0146', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(242, '2016-12-23 16:40:58', 297, NULL, NULL, 'IPAY/2016/12/0147', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(243, '2016-12-23 16:41:53', 298, NULL, NULL, 'IPAY/2016/12/0148', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(244, '2016-12-23 16:42:50', 299, NULL, NULL, 'IPAY/2016/12/0149', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(245, '2016-12-23 16:45:55', 300, NULL, NULL, 'IPAY/2016/12/0150', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(246, '2016-12-23 17:04:39', 301, NULL, NULL, 'IPAY/2016/12/0151', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(247, '2016-12-23 17:08:53', 302, NULL, NULL, 'IPAY/2016/12/0152', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(248, '2016-12-23 17:10:57', 303, NULL, NULL, 'IPAY/2016/12/0153', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(249, '2016-12-23 17:14:26', 305, NULL, NULL, 'IPAY/2016/12/0154', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(250, '2016-12-23 17:58:47', 306, NULL, NULL, 'IPAY/2016/12/0155', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(251, '2016-12-23 17:59:43', 307, NULL, NULL, 'IPAY/2016/12/0156', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(252, '2016-12-23 18:37:17', 309, NULL, NULL, 'IPAY/2016/12/0157', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(253, '2016-12-23 23:35:40', 310, NULL, NULL, 'IPAY/2016/12/0158', NULL, 'CC', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(254, '2016-12-23 23:57:17', 311, NULL, NULL, 'IPAY/2016/12/0159', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(255, '2016-12-23 23:58:42', 312, NULL, NULL, 'IPAY/2016/12/0160', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(256, '2016-12-24 00:10:22', 313, NULL, NULL, 'IPAY/2016/12/0161', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(257, '2016-12-24 00:11:46', 314, NULL, NULL, 'IPAY/2016/12/0162', NULL, 'cash', '', '', '', '', '', '', '120.0000', NULL, 2, NULL, 'received', '', '120.0000', '0.0000', NULL),
(258, '2016-12-24 00:13:43', 315, NULL, NULL, 'IPAY/2016/12/0163', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(259, '2016-12-24 00:23:04', 316, NULL, NULL, 'IPAY/2016/12/0164', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(260, '2016-12-24 00:24:28', 317, NULL, NULL, 'IPAY/2016/12/0165', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(261, '2016-12-24 09:50:22', 318, NULL, NULL, 'IPAY/2016/12/0166', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(262, '2016-12-24 11:56:32', 319, NULL, NULL, 'IPAY/2016/12/0167', NULL, 'cash', '', '', '', '', '', '', '27.0000', NULL, 2, NULL, 'received', '', '27.0000', '0.0000', NULL),
(263, '2016-12-24 16:39:39', 320, NULL, NULL, 'IPAY/2016/12/0168', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(264, '2016-12-24 16:48:10', 321, NULL, NULL, 'IPAY/2016/12/0169', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(265, '2016-12-24 16:51:30', 322, NULL, NULL, 'IPAY/2016/12/0170', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(266, '2016-12-24 18:19:39', 323, NULL, NULL, 'IPAY/2016/12/0171', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(267, '2016-12-29 18:04:55', 324, NULL, NULL, 'IPAY/2016/12/0172', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', 'abc', '60.0000', '0.0000', NULL),
(268, '2016-12-29 18:05:29', 325, NULL, NULL, 'IPAY/2016/12/0173', NULL, 'Cheque', '1234567894', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(269, '2016-12-29 18:16:24', 327, NULL, NULL, 'IPAY/2016/12/0174', NULL, 'other', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', 'fgfdgdfg', '60.0000', '0.0000', NULL),
(270, '2016-12-29 18:31:09', 328, NULL, NULL, 'IPAY/2016/12/0175', NULL, 'CC', '', '4032032169639769', 'sana', '06', '2021', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(271, '2017-01-03 00:12:41', 331, NULL, NULL, 'IPAY/2017/01/0176', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(272, '2017-01-03 00:13:55', 332, NULL, NULL, 'IPAY/2017/01/0177', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(273, '2017-01-03 00:15:11', 333, NULL, NULL, 'IPAY/2017/01/0178', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(274, '2017-01-03 00:20:09', 334, NULL, NULL, 'IPAY/2017/01/0179', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(275, '2017-01-03 06:19:18', 335, NULL, NULL, 'IPAY/2017/01/0180', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(276, '2017-01-03 06:21:00', 336, NULL, NULL, 'IPAY/2017/01/0181', NULL, 'cash', '', '', '', '', '', '', '360.0000', NULL, 2, NULL, 'received', '', '360.0000', '0.0000', NULL),
(277, '2017-01-03 20:57:57', 337, NULL, NULL, 'IPAY/2017/01/0001', NULL, 'cash', '', '', '', '', '', '', '150.0000', NULL, 2, NULL, 'received', '', '150.0000', '0.0000', NULL),
(278, '2017-01-03 20:58:25', 338, NULL, NULL, 'IPAY/2017/01/0002', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(279, '2017-01-03 21:14:58', 339, NULL, NULL, 'IPAY/2017/01/0003', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(280, '2017-01-03 22:33:21', 340, NULL, NULL, 'IPAY/2017/01/0004', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(281, '2017-01-03 22:36:52', 341, NULL, NULL, 'IPAY/2017/01/0005', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(282, '2017-01-03 22:37:12', 342, NULL, NULL, 'IPAY/2017/01/0006', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(283, '2017-01-03 23:37:39', 343, NULL, NULL, 'IPAY/2017/01/0007', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL);
INSERT INTO `sma_payments` (`id`, `date`, `sale_id`, `return_id`, `purchase_id`, `reference_no`, `transaction_id`, `paid_by`, `cheque_no`, `cc_no`, `cc_holder`, `cc_month`, `cc_year`, `cc_type`, `amount`, `currency`, `created_by`, `attachment`, `type`, `note`, `pos_paid`, `pos_balance`, `approval_code`) VALUES
(284, '2017-01-04 04:54:40', 344, NULL, NULL, 'IPAY/2017/01/0008', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(285, '2017-01-04 05:02:01', 345, NULL, NULL, 'IPAY/2017/01/0009', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(286, '2017-01-04 07:31:15', 346, NULL, NULL, 'IPAY/2017/01/0010', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(287, '2017-01-04 09:17:44', 347, NULL, NULL, 'IPAY/2017/01/0011', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(288, '2017-01-04 09:26:03', 348, NULL, NULL, 'IPAY/2017/01/0012', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(289, '2017-01-04 17:38:40', 349, NULL, NULL, 'IPAY/2017/01/0013', NULL, 'cash', '', '', '', '', '', '', '300.0000', NULL, 2, NULL, 'received', 'Paid by cash by gajendra', '300.0000', '0.0000', NULL),
(290, '2017-01-06 07:46:39', 351, NULL, NULL, 'IPAY/2017/01/0014', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(291, '2017-01-06 07:52:43', 352, NULL, NULL, 'IPAY/2017/01/0015', NULL, 'cash', '', '', '', '', '', '', '180.0000', NULL, 2, NULL, 'received', '', '180.0000', '0.0000', NULL),
(292, '2017-01-06 08:28:52', 353, NULL, NULL, 'IPAY/2017/01/0016', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '160.0000', '100.0000', NULL),
(293, '2017-01-06 08:30:18', 354, NULL, NULL, 'IPAY/2017/01/0017', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(294, '2017-01-07 16:10:18', 355, NULL, NULL, 'IPAY/2017/01/0018', NULL, 'cash', '', '', '', '', '', '', '120.0000', NULL, 2, NULL, 'received', '', '120.0000', '0.0000', NULL),
(295, '2017-01-07 16:38:50', 356, NULL, NULL, 'IPAY/2017/01/0019', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(296, '2017-01-09 20:22:52', 357, NULL, NULL, 'IPAY/2017/01/0020', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(297, '2017-01-09 20:26:01', 358, NULL, NULL, 'IPAY/2017/01/0021', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(298, '2017-01-11 17:46:42', 360, NULL, NULL, 'IPAY/2017/01/0022', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(299, '2017-01-11 20:20:45', 361, NULL, NULL, 'IPAY/2017/01/0023', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(300, '2017-01-11 20:27:27', 362, NULL, NULL, 'IPAY/2017/01/0024', NULL, 'cash', '', '', '', '', '', '', '220.0000', NULL, 2, NULL, 'received', '', '220.0000', '0.0000', NULL),
(301, '2017-01-11 21:25:27', 363, NULL, NULL, 'IPAY/2017/01/0025', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(302, '2017-01-11 22:49:53', 364, NULL, NULL, 'IPAY/2017/01/0026', NULL, 'cash', '', '', '', '', '', '', '120.0000', NULL, 2, NULL, 'received', '', '120.0000', '0.0000', NULL),
(303, '2017-01-11 22:53:30', 365, NULL, NULL, 'IPAY/2017/01/0027', NULL, 'cash', '', '', '', '', '', '', '40.0000', NULL, 2, NULL, 'received', '', '40.0000', '0.0000', NULL),
(304, '2017-01-11 23:23:01', 366, NULL, NULL, 'IPAY/2017/01/0028', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(305, '2017-01-11 23:37:49', 367, NULL, NULL, 'IPAY/2017/01/0029', NULL, 'cash', '', '', '', '', '', '', '1000.0000', NULL, 2, NULL, 'received', '', '1000.0000', '0.0000', NULL),
(306, '2017-01-12 01:03:00', 368, NULL, NULL, 'IPAY/2017/01/0030', NULL, 'cash', '', '', '', '', '', '', '10.0000', NULL, 2, NULL, 'received', '', '10.0000', '0.0000', NULL),
(307, '2017-01-12 01:04:03', 369, NULL, NULL, 'IPAY/2017/01/0031', NULL, 'cash', '', '', '', '', '', '', '420.0000', NULL, 2, NULL, 'received', '', '1340.0000', '920.0000', NULL),
(308, '2017-01-12 01:05:08', 370, NULL, NULL, 'IPAY/2017/01/0032', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(309, '2017-01-12 16:16:10', 371, NULL, NULL, 'IPAY/2017/01/0033', NULL, 'cash', '', '', '', '', '', '', '180.0000', NULL, 2, NULL, 'received', '', '180.0000', '0.0000', NULL),
(310, '2017-01-12 16:19:05', 372, NULL, NULL, 'IPAY/2017/01/0034', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(311, '2017-01-12 17:16:08', 373, NULL, NULL, 'IPAY/2017/01/0035', NULL, 'cash', '', '', '', '', '', '', '180.0000', NULL, 2, NULL, 'received', '', '180.0000', '0.0000', NULL),
(312, '2017-01-12 21:58:02', 374, NULL, NULL, 'IPAY/2017/01/0036', NULL, 'cash', '', '', '', '', '', '', '450.0000', NULL, 2, NULL, 'received', '', '450.0000', '0.0000', NULL),
(313, '2017-01-12 23:11:07', 375, NULL, NULL, 'IPAY/2017/01/0037', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(314, '2017-01-13 05:01:29', 376, NULL, NULL, 'IPAY/2017/01/0038', NULL, 'cash', '', '', '', '', '', '', '120.0000', NULL, 2, NULL, 'received', '', '120.0000', '0.0000', NULL),
(315, '2017-01-13 14:53:05', 377, NULL, NULL, 'IPAY/2017/01/0039', NULL, 'cash', '', '', '', '', '', '', '227.0000', NULL, 2, NULL, 'received', '', '227.0000', '0.0000', NULL),
(316, '2017-01-13 14:54:18', 378, NULL, NULL, 'IPAY/2017/01/0040', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(317, '2017-01-14 03:34:11', 379, NULL, NULL, 'IPAY/2017/01/0041', NULL, 'cash', '', '', '', '', '', '', '120.0000', NULL, 2, NULL, 'received', '', '120.0000', '0.0000', NULL),
(318, '2017-01-14 14:04:11', 380, NULL, NULL, 'IPAY/2017/01/0042', NULL, 'cash', '', '', '', '', '', '', '120.0000', NULL, 2, NULL, 'received', '', '120.0000', '0.0000', NULL),
(319, '2017-01-14 19:56:22', 381, NULL, NULL, 'IPAY/2017/01/0043', NULL, 'cash', '', '', '', '', '', '', '120.0000', NULL, 2, NULL, 'received', '', '120.0000', '0.0000', NULL),
(320, '2017-01-14 21:45:19', 382, NULL, NULL, 'IPAY/2017/01/0044', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(321, '2017-01-14 22:41:28', 383, NULL, NULL, 'IPAY/2017/01/0045', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '500.0000', '440.0000', NULL),
(322, '2017-01-16 01:20:29', 384, NULL, NULL, 'IPAY/2017/01/0046', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(323, '2017-01-16 17:14:37', 385, NULL, NULL, 'IPAY/2017/01/0047', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(324, '2017-01-17 18:03:04', 386, NULL, NULL, 'IPAY/2017/01/0048', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(325, '2017-01-17 19:34:01', 387, NULL, NULL, 'IPAY/2017/01/0049', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(326, '2017-01-17 19:34:42', 388, NULL, NULL, 'IPAY/2017/01/0050', NULL, 'cash', '', '', '', '', '', '', '300.0000', NULL, 2, NULL, 'received', '', '300.0000', '0.0000', NULL),
(327, '2017-01-17 19:41:49', 389, NULL, NULL, 'IPAY/2017/01/0051', NULL, 'cash', '', '', '', '', '', '', '60.0000', NULL, 2, NULL, 'received', '', '60.0000', '0.0000', NULL),
(328, '2017-01-17 19:42:59', 390, NULL, NULL, 'IPAY/2017/01/0052', NULL, 'cash', '', '', '', '', '', '', '450.0000', NULL, 2, NULL, 'received', '', '450.0000', '0.0000', NULL),
(329, '2017-01-17 19:54:27', 391, NULL, NULL, 'IPAY/2017/01/0053', NULL, 'cash', '', '', '', '', '', '', '100.0000', NULL, 2, NULL, 'received', '', '100.0000', '0.0000', NULL),
(330, '2017-01-17 20:40:53', 393, NULL, NULL, 'IPAY/2017/01/0054', NULL, 'cash', '', '', '', '', '', '', '120.0000', NULL, 2, NULL, 'received', '', '120.0000', '0.0000', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_paypal`
--

CREATE TABLE IF NOT EXISTS `sma_paypal` (
  `id` int(11) NOT NULL,
  `active` tinyint(4) NOT NULL,
  `account_email` varchar(255) NOT NULL,
  `paypal_currency` varchar(3) NOT NULL DEFAULT 'USD',
  `fixed_charges` decimal(25,4) NOT NULL DEFAULT '2.0000',
  `extra_charges_my` decimal(25,4) NOT NULL DEFAULT '3.9000',
  `extra_charges_other` decimal(25,4) NOT NULL DEFAULT '4.4000',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_paypal`
--

INSERT INTO `sma_paypal` (`id`, `active`, `account_email`, `paypal_currency`, `fixed_charges`, `extra_charges_my`, `extra_charges_other`) VALUES
(1, 1, 'sana@greatwebsoft@gmail.com', 'USD', '0.0000', '0.0000', '0.0000');

-- --------------------------------------------------------

--
-- Table structure for table `sma_permissions`
--

CREATE TABLE IF NOT EXISTS `sma_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `products-index` tinyint(1) DEFAULT '0',
  `products-add` tinyint(1) DEFAULT '0',
  `products-edit` tinyint(1) DEFAULT '0',
  `products-delete` tinyint(1) DEFAULT '0',
  `products-cost` tinyint(1) DEFAULT '0',
  `products-price` tinyint(1) DEFAULT '0',
  `quotes-index` tinyint(1) DEFAULT '0',
  `quotes-add` tinyint(1) DEFAULT '0',
  `quotes-edit` tinyint(1) DEFAULT '0',
  `quotes-pdf` tinyint(1) DEFAULT '0',
  `quotes-email` tinyint(1) DEFAULT '0',
  `quotes-delete` tinyint(1) DEFAULT '0',
  `sales-index` tinyint(1) DEFAULT '0',
  `sales-add` tinyint(1) DEFAULT '0',
  `sales-edit` tinyint(1) DEFAULT '0',
  `sales-pdf` tinyint(1) DEFAULT '0',
  `sales-email` tinyint(1) DEFAULT '0',
  `sales-delete` tinyint(1) DEFAULT '0',
  `purchases-index` tinyint(1) DEFAULT '0',
  `purchases-add` tinyint(1) DEFAULT '0',
  `purchases-edit` tinyint(1) DEFAULT '0',
  `purchases-pdf` tinyint(1) DEFAULT '0',
  `purchases-email` tinyint(1) DEFAULT '0',
  `purchases-delete` tinyint(1) DEFAULT '0',
  `transfers-index` tinyint(1) DEFAULT '0',
  `transfers-add` tinyint(1) DEFAULT '0',
  `transfers-edit` tinyint(1) DEFAULT '0',
  `transfers-pdf` tinyint(1) DEFAULT '0',
  `transfers-email` tinyint(1) DEFAULT '0',
  `transfers-delete` tinyint(1) DEFAULT '0',
  `customers-index` tinyint(1) DEFAULT '0',
  `customers-add` tinyint(1) DEFAULT '0',
  `customers-edit` tinyint(1) DEFAULT '0',
  `customers-delete` tinyint(1) DEFAULT '0',
  `suppliers-index` tinyint(1) DEFAULT '0',
  `suppliers-add` tinyint(1) DEFAULT '0',
  `suppliers-edit` tinyint(1) DEFAULT '0',
  `suppliers-delete` tinyint(1) DEFAULT '0',
  `sales-deliveries` tinyint(1) DEFAULT '0',
  `sales-add_delivery` tinyint(1) DEFAULT '0',
  `sales-edit_delivery` tinyint(1) DEFAULT '0',
  `sales-delete_delivery` tinyint(1) DEFAULT '0',
  `sales-email_delivery` tinyint(1) DEFAULT '0',
  `sales-pdf_delivery` tinyint(1) DEFAULT '0',
  `sales-gift_cards` tinyint(1) DEFAULT '0',
  `sales-add_gift_card` tinyint(1) DEFAULT '0',
  `sales-edit_gift_card` tinyint(1) DEFAULT '0',
  `sales-delete_gift_card` tinyint(1) DEFAULT '0',
  `pos-index` tinyint(1) DEFAULT '0',
  `sales-return_sales` tinyint(1) DEFAULT '0',
  `reports-index` tinyint(1) DEFAULT '0',
  `reports-warehouse_stock` tinyint(1) DEFAULT '0',
  `reports-quantity_alerts` tinyint(1) DEFAULT '0',
  `reports-expiry_alerts` tinyint(1) DEFAULT '0',
  `reports-products` tinyint(1) DEFAULT '0',
  `reports-daily_sales` tinyint(1) DEFAULT '0',
  `reports-monthly_sales` tinyint(1) DEFAULT '0',
  `reports-sales` tinyint(1) DEFAULT '0',
  `reports-payments` tinyint(1) DEFAULT '0',
  `reports-purchases` tinyint(1) DEFAULT '0',
  `reports-profit_loss` tinyint(1) DEFAULT '0',
  `reports-customers` tinyint(1) DEFAULT '0',
  `reports-suppliers` tinyint(1) DEFAULT '0',
  `reports-staff` tinyint(1) DEFAULT '0',
  `reports-register` tinyint(1) DEFAULT '0',
  `sales-payments` tinyint(1) DEFAULT '0',
  `purchases-payments` tinyint(1) DEFAULT '0',
  `purchases-expenses` tinyint(1) DEFAULT '0',
  `products-adjustments` tinyint(1) NOT NULL DEFAULT '0',
  `bulk_actions` tinyint(1) NOT NULL DEFAULT '0',
  `customers-deposits` tinyint(1) NOT NULL DEFAULT '0',
  `customers-delete_deposit` tinyint(1) NOT NULL DEFAULT '0',
  `products-barcode` tinyint(1) NOT NULL DEFAULT '0',
  `purchases-return_purchases` tinyint(1) NOT NULL DEFAULT '0',
  `reports-expenses` tinyint(1) NOT NULL DEFAULT '0',
  `reports-daily_purchases` tinyint(1) DEFAULT '0',
  `reports-monthly_purchases` tinyint(1) DEFAULT '0',
  `products-stock_count` tinyint(1) DEFAULT '0',
  `edit_price` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `sma_permissions`
--

INSERT INTO `sma_permissions` (`id`, `group_id`, `products-index`, `products-add`, `products-edit`, `products-delete`, `products-cost`, `products-price`, `quotes-index`, `quotes-add`, `quotes-edit`, `quotes-pdf`, `quotes-email`, `quotes-delete`, `sales-index`, `sales-add`, `sales-edit`, `sales-pdf`, `sales-email`, `sales-delete`, `purchases-index`, `purchases-add`, `purchases-edit`, `purchases-pdf`, `purchases-email`, `purchases-delete`, `transfers-index`, `transfers-add`, `transfers-edit`, `transfers-pdf`, `transfers-email`, `transfers-delete`, `customers-index`, `customers-add`, `customers-edit`, `customers-delete`, `suppliers-index`, `suppliers-add`, `suppliers-edit`, `suppliers-delete`, `sales-deliveries`, `sales-add_delivery`, `sales-edit_delivery`, `sales-delete_delivery`, `sales-email_delivery`, `sales-pdf_delivery`, `sales-gift_cards`, `sales-add_gift_card`, `sales-edit_gift_card`, `sales-delete_gift_card`, `pos-index`, `sales-return_sales`, `reports-index`, `reports-warehouse_stock`, `reports-quantity_alerts`, `reports-expiry_alerts`, `reports-products`, `reports-daily_sales`, `reports-monthly_sales`, `reports-sales`, `reports-payments`, `reports-purchases`, `reports-profit_loss`, `reports-customers`, `reports-suppliers`, `reports-staff`, `reports-register`, `sales-payments`, `purchases-payments`, `purchases-expenses`, `products-adjustments`, `bulk_actions`, `customers-deposits`, `customers-delete_deposit`, `products-barcode`, `purchases-return_purchases`, `reports-expenses`, `reports-daily_purchases`, `reports-monthly_purchases`, `products-stock_count`, `edit_price`) VALUES
(1, 5, 1, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sma_pos_register`
--

CREATE TABLE IF NOT EXISTS `sma_pos_register` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL,
  `cash_in_hand` decimal(25,4) NOT NULL,
  `status` varchar(10) NOT NULL,
  `total_cash` decimal(25,4) DEFAULT NULL,
  `total_cheques` int(11) DEFAULT NULL,
  `total_cc_slips` int(11) DEFAULT NULL,
  `total_cash_submitted` decimal(25,4) DEFAULT NULL,
  `total_cheques_submitted` int(11) DEFAULT NULL,
  `total_cc_slips_submitted` int(11) DEFAULT NULL,
  `note` text,
  `closed_at` timestamp NULL DEFAULT NULL,
  `transfer_opened_bills` varchar(50) DEFAULT NULL,
  `closed_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `sma_pos_register`
--

INSERT INTO `sma_pos_register` (`id`, `date`, `user_id`, `cash_in_hand`, `status`, `total_cash`, `total_cheques`, `total_cc_slips`, `total_cash_submitted`, `total_cheques_submitted`, `total_cc_slips_submitted`, `note`, `closed_at`, `transfer_opened_bills`, `closed_by`) VALUES
(1, '2016-11-15 15:02:21', 1, '20000.0000', 'close', '0.0000', 0, 0, '0.0000', 0, 0, '', '2016-12-20 18:00:27', NULL, 2),
(2, '2016-11-15 15:23:36', 2, '2000.0000', 'close', '321099.3000', 3, 15, '321099.3000', 3, 15, '', '2017-01-04 07:44:30', '0', 2),
(3, '2016-11-29 12:20:24', 4, '15000.0000', 'open', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, '2016-12-04 17:43:45', 6, '2000.0000', 'close', '270.0000', 0, 0, '270.0000', 0, 0, '', '2016-12-20 18:00:04', NULL, 2),
(5, '2016-12-04 17:43:45', 6, '2000.0000', 'close', '2270.0000', 0, 0, '2270.0000', 0, 0, '', '2016-12-23 13:16:35', NULL, 2),
(6, '2017-01-04 07:46:34', 2, '2000.0000', 'close', '2420.0000', 0, 0, '2420.0000', 0, 0, '', '2017-01-06 04:57:55', '0', 2),
(7, '2017-01-06 05:02:35', 2, '2000.0000', 'open', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_pos_settings`
--

CREATE TABLE IF NOT EXISTS `sma_pos_settings` (
  `pos_id` int(1) NOT NULL,
  `cat_limit` int(11) NOT NULL,
  `pro_limit` int(11) NOT NULL,
  `default_category` int(11) NOT NULL,
  `default_customer` int(11) NOT NULL,
  `default_biller` int(11) NOT NULL,
  `display_time` varchar(3) NOT NULL DEFAULT 'yes',
  `cf_title1` varchar(255) DEFAULT NULL,
  `cf_title2` varchar(255) DEFAULT NULL,
  `cf_value1` varchar(255) DEFAULT NULL,
  `cf_value2` varchar(255) DEFAULT NULL,
  `receipt_printer` varchar(55) DEFAULT NULL,
  `cash_drawer_codes` varchar(55) DEFAULT NULL,
  `focus_add_item` varchar(55) DEFAULT NULL,
  `add_manual_product` varchar(55) DEFAULT NULL,
  `customer_selection` varchar(55) DEFAULT NULL,
  `add_customer` varchar(55) DEFAULT NULL,
  `toggle_category_slider` varchar(55) DEFAULT NULL,
  `toggle_subcategory_slider` varchar(55) DEFAULT NULL,
  `cancel_sale` varchar(55) DEFAULT NULL,
  `suspend_sale` varchar(55) DEFAULT NULL,
  `print_items_list` varchar(55) DEFAULT NULL,
  `finalize_sale` varchar(55) DEFAULT NULL,
  `today_sale` varchar(55) DEFAULT NULL,
  `open_hold_bills` varchar(55) DEFAULT NULL,
  `close_register` varchar(55) DEFAULT NULL,
  `keyboard` tinyint(1) NOT NULL,
  `pos_printers` varchar(255) DEFAULT NULL,
  `java_applet` tinyint(1) NOT NULL,
  `product_button_color` varchar(20) NOT NULL DEFAULT 'default',
  `tooltips` tinyint(1) DEFAULT '1',
  `paypal_pro` tinyint(1) DEFAULT '0',
  `stripe` tinyint(1) DEFAULT '0',
  `rounding` tinyint(1) DEFAULT '0',
  `char_per_line` tinyint(4) DEFAULT '42',
  `pin_code` varchar(20) DEFAULT NULL,
  `purchase_code` varchar(100) DEFAULT 'purchase_code',
  `envato_username` varchar(50) DEFAULT 'envato_username',
  `version` varchar(10) DEFAULT '3.0.2.22',
  `after_sale_page` tinyint(1) DEFAULT '0',
  `item_order` tinyint(1) DEFAULT '0',
  `authorize` tinyint(1) DEFAULT '0',
  `toggle_brands_slider` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`pos_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_pos_settings`
--

INSERT INTO `sma_pos_settings` (`pos_id`, `cat_limit`, `pro_limit`, `default_category`, `default_customer`, `default_biller`, `display_time`, `cf_title1`, `cf_title2`, `cf_value1`, `cf_value2`, `receipt_printer`, `cash_drawer_codes`, `focus_add_item`, `add_manual_product`, `customer_selection`, `add_customer`, `toggle_category_slider`, `toggle_subcategory_slider`, `cancel_sale`, `suspend_sale`, `print_items_list`, `finalize_sale`, `today_sale`, `open_hold_bills`, `close_register`, `keyboard`, `pos_printers`, `java_applet`, `product_button_color`, `tooltips`, `paypal_pro`, `stripe`, `rounding`, `char_per_line`, `pin_code`, `purchase_code`, `envato_username`, `version`, `after_sale_page`, `item_order`, `authorize`, `toggle_brands_slider`) VALUES
(1, 22, 20, 11, 9, 5, '1', 'Simplysafe', 'VAT Reg', '123456789', '987654321', 'BIXOLON SRP-350II', 'x1C', 'Ctrl+F3', 'Ctrl+Shift+M', 'Ctrl+Shift+C', 'Ctrl+Shift+A', 'Ctrl+F11', 'Ctrl+F12', 'F4', 'F7', 'F9', 'F8', 'Ctrl+F1', 'Ctrl+F2', 'Ctrl+F10', 0, 'BIXOLON SRP-350II, BIXOLON SRP-350II', 0, 'info', 0, 1, 1, 4, 42, '462003', 'purchase_code', 'envato_username', '3.0.2.22', 0, 1, 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `sma_price_groups`
--

CREATE TABLE IF NOT EXISTS `sma_price_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `sma_price_groups`
--

INSERT INTO `sma_price_groups` (`id`, `name`) VALUES
(1, 'Default'),
(2, 'Standered');

-- --------------------------------------------------------

--
-- Table structure for table `sma_products`
--

CREATE TABLE IF NOT EXISTS `sma_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `name` char(255) NOT NULL,
  `unit` int(11) DEFAULT NULL,
  `cost` decimal(25,4) DEFAULT NULL,
  `price` decimal(25,4) NOT NULL,
  `alert_quantity` decimal(15,4) DEFAULT '20.0000',
  `image` varchar(255) DEFAULT 'no_image.png',
  `category_id` int(11) NOT NULL,
  `subcategory_id` int(11) DEFAULT NULL,
  `cf1` varchar(255) DEFAULT NULL,
  `cf2` varchar(255) DEFAULT NULL,
  `cf3` varchar(255) DEFAULT NULL,
  `cf4` varchar(255) DEFAULT NULL,
  `cf5` varchar(255) DEFAULT NULL,
  `cf6` varchar(255) DEFAULT NULL,
  `quantity` decimal(15,4) DEFAULT '0.0000',
  `tax_rate` int(11) DEFAULT NULL,
  `track_quantity` tinyint(1) DEFAULT '1',
  `details` varchar(1000) DEFAULT NULL,
  `warehouse` int(11) DEFAULT NULL,
  `barcode_symbology` varchar(55) NOT NULL DEFAULT 'code128',
  `file` varchar(100) DEFAULT NULL,
  `product_details` text,
  `tax_method` tinyint(1) DEFAULT '0',
  `type` varchar(55) NOT NULL DEFAULT 'standard',
  `supplier1` int(11) DEFAULT NULL,
  `supplier1price` decimal(25,4) DEFAULT NULL,
  `supplier2` int(11) DEFAULT NULL,
  `supplier2price` decimal(25,4) DEFAULT NULL,
  `supplier3` int(11) DEFAULT NULL,
  `supplier3price` decimal(25,4) DEFAULT NULL,
  `supplier4` int(11) DEFAULT NULL,
  `supplier4price` decimal(25,4) DEFAULT NULL,
  `supplier5` int(11) DEFAULT NULL,
  `supplier5price` decimal(25,4) DEFAULT NULL,
  `promotion` tinyint(1) DEFAULT '0',
  `promo_price` decimal(25,4) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `supplier1_part_no` varchar(50) DEFAULT NULL,
  `supplier2_part_no` varchar(50) DEFAULT NULL,
  `supplier3_part_no` varchar(50) DEFAULT NULL,
  `supplier4_part_no` varchar(50) DEFAULT NULL,
  `supplier5_part_no` varchar(50) DEFAULT NULL,
  `sale_unit` int(11) DEFAULT NULL,
  `purchase_unit` int(11) DEFAULT NULL,
  `brand` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `category_id` (`category_id`),
  KEY `id` (`id`),
  KEY `id_2` (`id`),
  KEY `category_id_2` (`category_id`),
  KEY `unit` (`unit`),
  KEY `brand` (`brand`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=33 ;

--
-- Dumping data for table `sma_products`
--

INSERT INTO `sma_products` (`id`, `code`, `name`, `unit`, `cost`, `price`, `alert_quantity`, `image`, `category_id`, `subcategory_id`, `cf1`, `cf2`, `cf3`, `cf4`, `cf5`, `cf6`, `quantity`, `tax_rate`, `track_quantity`, `details`, `warehouse`, `barcode_symbology`, `file`, `product_details`, `tax_method`, `type`, `supplier1`, `supplier1price`, `supplier2`, `supplier2price`, `supplier3`, `supplier3price`, `supplier4`, `supplier4price`, `supplier5`, `supplier5price`, `promotion`, `promo_price`, `start_date`, `end_date`, `supplier1_part_no`, `supplier2_part_no`, `supplier3_part_no`, `supplier4_part_no`, `supplier5_part_no`, `sale_unit`, `purchase_unit`, `brand`) VALUES
(2, '88863516', 'Milk', 1, '36.0000', '36.0000', '0.0000', 'no_image.png', 4, NULL, '', '', '', '', '', '', '93.0000', 1, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(3, '85086124', 'Bread', 1, '25.0000', '25.0000', '0.0000', 'f7e16efeb989906b12c22588d82d4831.png', 5, NULL, '', '', '', '', '', '', '1044.0000', 2, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 2),
(4, '47391844', 'Test Product', 1, '90.0000', '100.0000', '100.0000', 'no_image.png', 6, 7, '', '', '', '', '', '', '1994.0000', 1, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 2, '90.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 0),
(9, '88916520', 'oil(pratima)', 0, NULL, '180.0000', '0.0000', '6159d644c3c853fa07295f3343a62183.jpg', 6, 7, '', '', '', '', '', '', NULL, 1, 0, '', NULL, 'code128', NULL, '', 0, 'combo', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 0, 0, 3),
(10, '8906033881051', 'oil(pratima singh)', 0, NULL, '360.0000', '0.0000', 'no_image.png', 1, NULL, '', '', '', '', '', '', NULL, 1, 0, '', NULL, 'code128', NULL, '', 0, 'combo', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 0, 0, 3),
(12, '57176110', 'Clinic Plus 100 ML', 1, '80.0000', '90.0000', '3.0000', '0dbb11af295679b4a31237de600fa726.jpg', 9, 10, '', '', '', '', '', '', '189.0000', 2, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 4),
(14, 'tea100', 'tea-100', 1, '34.0000', '40.0000', '3.0000', 'e05ea11eec57c3417e2ca7e8bc79a44c.jpg', 11, 12, '', '', '', '', '', '', '-2.0000', 1, 0, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 5),
(15, '28403364', 'golden (200)', 1, '50.0000', '60.0000', '5.0000', '32b542a41caeda396b1e0b3e72b315e2.jpg', 11, 12, '', '', '', '', '', '', '-41.0000', 1, 1, '', NULL, 'code39', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 5),
(16, '81567325', 'golden tea(200)', 2, '50.0000', '60.0000', '5.0000', '337629706f30b61647de50d083a2f1ae.jpg', 11, 13, '', '', '', '', '', '', '849.9930', 1, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 2, 2, 5),
(19, '82993694', 'rice', 2, '270.0000', '295.0000', '5.0000', '35f4f503bca8a338d98bb5318eb272e8.jpg', 19, 20, '', '', '', '', '', '', '20.0000', 1, 0, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 2, 2, 7),
(20, '74964595', ' tooth paste', 1, '100.0000', '80.0000', '10.0000', 'a1846ef08edaf5d35e92c4b3e266b0da.jpg', 14, 21, '', '', '', '', '', '', '24.0000', 1, 0, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 8),
(22, '51511218', 'gugal dhoop sticks', 1, '500.0000', '450.0000', '0.0000', 'd111bb6015cab68e885020795ff98a36.jpg', 24, 25, '', '', '', '', '', '', '-1.0000', 1, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 10),
(25, '68285732', 'sugar1', 2, '150.0000', '165.0000', '5.0000', '6ad9060810d1ad3ea53355b87225519c.jpg', 28, NULL, '', '', '', '', '', '', '5.0000', 1, 0, '', NULL, 'code128', NULL, '', 1, 'standard', 0, '150.0000', 4, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '45648', 'MNS', '', NULL, NULL, 2, 2, 3),
(26, '60275895', 'KETCHUP(PRATIMA)', 2, '180.0000', '200.0000', '0.0000', '5ddf3168ada0a59810353f3b91dc82ff.jpg', 38, 39, '', '', '', '', '', '', '9.0000', 1, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 2, 2, 13),
(28, '77982237', 'eno lemon', 1, '20.0000', '27.0000', '0.0000', 'e1d6fac351c3d92068269799f3698fa7.jpg', 44, 45, '', '', '', '', '', '', '30.0000', 1, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 15),
(31, '71936837', 'biscuit', 1, '50.0000', '40.0000', '0.0000', 'no_image.png', 16, 17, '', '', '', '', '', '', '2.0000', 1, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `sma_product_photos`
--

CREATE TABLE IF NOT EXISTS `sma_product_photos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `photo` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

--
-- Dumping data for table `sma_product_photos`
--

INSERT INTO `sma_product_photos` (`id`, `product_id`, `photo`) VALUES
(1, 12, '82b6f6823c85777f0ae86c351b68f832.jpg'),
(2, 14, '45b3cb06234938d72acf591dc1f63694.jpg'),
(3, 15, 'ee8d1b5578599c160fa306e6d088ff58.jpg'),
(4, 16, '29134111081ced3bf98c6360bde07ca8.jpg'),
(7, 19, '8ce1425bd9a04d1f53e39df8e7d36aca.jpg'),
(8, 20, '83dc8b1c277fa1a1cd51a028c16d6645.jpg'),
(10, 22, '6d3ef5f566613411f3a4b15d52786b93.jpg'),
(11, 22, 'e6fcfb76009f3014d2d8b59780b78edf.jpg'),
(13, 25, '26702fcf9bad3ff28a713d8cdc377686.jpg'),
(14, 26, 'dcb918679492ed26aec5864a037efc5a.jpg'),
(15, 28, 'ecb80fb95ebfdc62c5614bd0f63c3806.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `sma_product_prices`
--

CREATE TABLE IF NOT EXISTS `sma_product_prices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `price_group_id` int(11) NOT NULL,
  `price` decimal(25,4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  KEY `price_group_id` (`price_group_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `sma_product_prices`
--

INSERT INTO `sma_product_prices` (`id`, `product_id`, `price_group_id`, `price`) VALUES
(1, 10, 2, '50.0000'),
(6, 4, 2, '0.0000'),
(8, 3, 2, '10.0000'),
(9, 2, 2, '20.0000'),
(10, 9, 2, '30.0000');

-- --------------------------------------------------------

--
-- Table structure for table `sma_product_variants`
--

CREATE TABLE IF NOT EXISTS `sma_product_variants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `name` varchar(55) NOT NULL,
  `cost` decimal(25,4) DEFAULT NULL,
  `price` decimal(25,4) DEFAULT NULL,
  `quantity` decimal(15,4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sma_purchases`
--

CREATE TABLE IF NOT EXISTS `sma_purchases` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(55) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `supplier_id` int(11) NOT NULL,
  `supplier` varchar(55) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `note` varchar(1000) NOT NULL,
  `total` decimal(25,4) DEFAULT NULL,
  `product_discount` decimal(25,4) DEFAULT NULL,
  `order_discount_id` varchar(20) DEFAULT NULL,
  `order_discount` decimal(25,4) DEFAULT NULL,
  `total_discount` decimal(25,4) DEFAULT NULL,
  `product_tax` decimal(25,4) DEFAULT NULL,
  `order_tax_id` int(11) DEFAULT NULL,
  `order_tax` decimal(25,4) DEFAULT NULL,
  `total_tax` decimal(25,4) DEFAULT '0.0000',
  `shipping` decimal(25,4) DEFAULT '0.0000',
  `grand_total` decimal(25,4) NOT NULL,
  `paid` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `status` varchar(55) DEFAULT '',
  `payment_status` varchar(20) DEFAULT 'pending',
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `payment_term` tinyint(4) DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `return_id` int(11) DEFAULT NULL,
  `surcharge` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `return_purchase_ref` varchar(55) DEFAULT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `return_purchase_total` decimal(25,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `sma_purchases`
--

INSERT INTO `sma_purchases` (`id`, `reference_no`, `date`, `supplier_id`, `supplier`, `warehouse_id`, `note`, `total`, `product_discount`, `order_discount_id`, `order_discount`, `total_discount`, `product_tax`, `order_tax_id`, `order_tax`, `total_tax`, `shipping`, `grand_total`, `paid`, `status`, `payment_status`, `created_by`, `updated_by`, `updated_at`, `attachment`, `payment_term`, `due_date`, `return_id`, `surcharge`, `return_purchase_ref`, `purchase_id`, `return_purchase_total`) VALUES
(1, '524', '2016-11-17 14:32:00', 2, 'Supplier Company Name', 1, '', '1900.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 3, '114.0000', '114.0000', '0.0000', '2014.0000', '2014.0000', 'received', 'paid', 2, 2, '2016-11-17 14:35:11', NULL, 0, NULL, NULL, '0.0000', NULL, NULL, '0.0000'),
(2, 'PO/2016/11/0001', '2016-11-21 18:34:00', 2, 'Supplier Company Name', 1, '', '3600.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 3, '216.0000', '216.0000', '0.0000', '3816.0000', '3816.0000', 'received', 'paid', 2, NULL, NULL, NULL, 0, NULL, NULL, '0.0000', NULL, NULL, '0.0000'),
(3, '555', '2016-11-23 18:39:00', 2, 'Supplier Company Name', 1, '', '1159.0923', '0.0000', NULL, '0.0000', '0.0000', '115.9077', 1, '0.0000', '115.9077', '0.0000', '1275.0000', '0.0000', 'received', 'pending', 2, NULL, NULL, NULL, 0, NULL, NULL, '0.0000', NULL, NULL, '0.0000'),
(4, 'test ', '2016-11-26 14:01:00', 2, 'Supplier Company Name', 1, '', '1922727.3000', '0.0000', NULL, '0.0000', '0.0000', '2272.7000', 1, '0.0000', '2272.7000', '0.0000', '1925000.0000', '0.0000', 'received', 'pending', 2, NULL, NULL, NULL, 0, NULL, NULL, '0.0000', NULL, NULL, '0.0000'),
(5, '232', '2016-11-29 12:42:00', 7, 'pawan', 1, '', '14545.4600', '0.0000', NULL, '0.0000', '0.0000', '1454.5400', 1, '0.0000', '1454.5400', '0.0000', '16000.0000', '0.0000', 'received', 'pending', 4, NULL, NULL, NULL, 0, NULL, NULL, '0.0000', NULL, NULL, '0.0000'),
(6, '424', '2016-11-30 12:31:00', 7, 'pawan', 2, '', '0.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', 'received', 'pending', 2, NULL, NULL, NULL, 0, NULL, NULL, '0.0000', NULL, NULL, '0.0000'),
(7, 'pratima', '2016-11-30 16:39:00', 2, 'Supplier Company Name', 1, '', '1510.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '1510.0000', '0.0000', 'ordered', 'pending', 2, NULL, NULL, NULL, 0, NULL, NULL, '0.0000', NULL, NULL, '0.0000'),
(8, '521', '2016-12-02 12:51:00', 18, 'SAI STORE', 1, '', '50.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '50.0000', '0.0000', 'ordered', 'pending', 2, NULL, NULL, NULL, 0, NULL, NULL, '0.0000', NULL, NULL, '0.0000'),
(9, '289', '2016-12-02 14:43:00', 19, 'general store', 1, '', '180.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '180.0000', '0.0000', 'received', 'pending', 2, 2, '2016-12-02 14:49:22', NULL, 0, NULL, NULL, '0.0000', NULL, NULL, '0.0000'),
(10, '555', '2016-12-02 16:30:00', 21, 'i.t.m', 1, '', '280.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '280.0000', '0.0000', 'received', 'pending', 2, NULL, NULL, NULL, 0, NULL, NULL, '0.0000', NULL, NULL, '0.0000'),
(11, '659', '2016-12-02 17:22:00', 23, 'macson pvt ltd ', 1, '', '200.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '200.0000', '0.0000', 'received', 'pending', 2, NULL, NULL, NULL, 0, NULL, NULL, '0.0000', NULL, NULL, '0.0000'),
(12, '423', '2016-12-05 10:18:00', 25, 'gits ', 1, '', '200.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '200.0000', '0.0000', 'received', 'pending', 2, 2, '2016-12-05 10:24:50', NULL, 0, NULL, NULL, '0.0000', NULL, NULL, '0.0000'),
(13, '789', '2016-12-05 11:20:00', 27, 'durga pooja', 1, '', '40.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '40.0000', '0.0000', 'received', 'pending', 2, NULL, NULL, NULL, 0, NULL, NULL, '0.0000', NULL, NULL, '0.0000');

-- --------------------------------------------------------

--
-- Table structure for table `sma_purchase_items`
--

CREATE TABLE IF NOT EXISTS `sma_purchase_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `purchase_id` int(11) DEFAULT NULL,
  `transfer_id` int(11) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `product_code` varchar(50) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `option_id` int(11) DEFAULT NULL,
  `net_unit_cost` decimal(25,4) NOT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(20) DEFAULT NULL,
  `discount` varchar(20) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `expiry` date DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `quantity_balance` decimal(15,4) DEFAULT '0.0000',
  `date` date NOT NULL,
  `status` varchar(50) NOT NULL,
  `unit_cost` decimal(25,4) DEFAULT NULL,
  `real_unit_cost` decimal(25,4) DEFAULT NULL,
  `quantity_received` decimal(15,4) DEFAULT NULL,
  `supplier_part_no` varchar(50) DEFAULT NULL,
  `purchase_item_id` int(11) DEFAULT NULL,
  `product_unit_id` int(11) DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `purchase_id` (`purchase_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=62 ;

--
-- Dumping data for table `sma_purchase_items`
--

INSERT INTO `sma_purchase_items` (`id`, `purchase_id`, `transfer_id`, `product_id`, `product_code`, `product_name`, `option_id`, `net_unit_cost`, `quantity`, `warehouse_id`, `item_tax`, `tax_rate_id`, `tax`, `discount`, `item_discount`, `expiry`, `subtotal`, `quantity_balance`, `date`, `status`, `unit_cost`, `real_unit_cost`, `quantity_received`, `supplier_part_no`, `purchase_item_id`, `product_unit_id`, `product_unit_code`, `unit_quantity`) VALUES
(1, NULL, NULL, 1, '07009110', 'samsung S Duos', NULL, '2000.0000', '200.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '400000.0000', '89.0000', '2016-11-15', 'received', '2000.0000', '2000.0000', NULL, NULL, NULL, NULL, NULL, '0.0000'),
(2, NULL, NULL, 1, '07009110', 'samsung S Duos', NULL, '2000.0000', '1000.0000', 2, '0.0000', 1, '0.0000', NULL, NULL, NULL, '2000000.0000', '1000.0000', '2016-11-15', 'received', '2000.0000', '2000.0000', NULL, NULL, NULL, NULL, NULL, '0.0000'),
(4, 1, NULL, 1, '07009110', 'samsung S Duos', 0, '1900.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', NULL, '1900.0000', '0.0000', '2016-11-17', 'received', '1900.0000', '1900.0000', '1.0000', NULL, NULL, 1, 'Pis', '1.0000'),
(5, NULL, 1, 1, '07009110', 'samsung S Duos', NULL, '2000.0000', '100.0000', 2, '0.0000', 1, '0.0000', NULL, NULL, NULL, '200000.0000', '0.0000', '2016-11-17', 'received', '2000.0000', '2000.0000', NULL, NULL, NULL, 1, 'Pis', '100.0000'),
(6, 2, NULL, 2, '88863516', 'Milk', NULL, '36.0000', '100.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', NULL, '3600.0000', '93.0000', '2016-11-21', 'received', '36.0000', '36.0000', '100.0000', NULL, NULL, 1, 'Pis', '100.0000'),
(7, NULL, NULL, 3, '85086124', 'Bread', NULL, '0.0000', '0.0000', 2, '0.0000', 0, '', NULL, NULL, NULL, '0.0000', '2.0000', '2016-11-22', 'received', '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, '0.0000'),
(8, 3, NULL, 3, '85086124', 'Bread', NULL, '22.7273', '50.0000', 1, '113.6350', 2, '10.0000%', '0', '0.0000', NULL, '1250.0000', '46.0000', '2016-11-23', 'received', '25.0000', '25.0000', '50.0000', NULL, NULL, 1, 'Pis', '50.0000'),
(9, 3, NULL, 3, '85086124', 'Bread', NULL, '22.7273', '1.0000', 1, '2.2727', 2, '10.0000%', '0', '0.0000', NULL, '25.0000', '1.0000', '2016-11-23', 'received', '25.0000', '25.0000', '1.0000', NULL, NULL, 1, 'Pis', '1.0000'),
(10, NULL, NULL, 4, '47391844', 'Test Product', NULL, '90.0000', '1000.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '90000.0000', '994.0000', '2016-11-26', 'received', '90.0000', '90.0000', NULL, NULL, NULL, NULL, NULL, '0.0000'),
(11, NULL, NULL, 4, '47391844', 'Test Product', NULL, '90.0000', '1000.0000', 2, '0.0000', 1, '0.0000', NULL, NULL, NULL, '90000.0000', '1000.0000', '2016-11-26', 'received', '90.0000', '90.0000', NULL, NULL, NULL, NULL, NULL, '0.0000'),
(12, 4, NULL, 1, '07009110', 'samsung S Duos', NULL, '1900.0000', '1000.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', NULL, '1900000.0000', '986.0000', '2016-11-26', 'received', '1900.0000', '1900.0000', '1000.0000', NULL, NULL, 1, 'Pis', '1000.0000'),
(13, 4, NULL, 3, '85086124', 'Bread', NULL, '22.7273', '1000.0000', 1, '2272.7000', 2, '10.0000%', '0', '0.0000', NULL, '25000.0000', '995.0000', '2016-11-26', 'received', '25.0000', '25.0000', '1000.0000', NULL, NULL, 1, 'Pis', '1000.0000'),
(14, NULL, NULL, 5, '40766584', 'bread', NULL, '100.0000', '20.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '2000.0000', '20.0000', '2016-11-29', 'received', '100.0000', '100.0000', NULL, NULL, NULL, NULL, NULL, '0.0000'),
(15, NULL, NULL, 5, '40766584', 'bread', NULL, '100.0000', '10.0000', 2, '0.0000', 1, '0.0000', NULL, NULL, NULL, '1000.0000', '10.0000', '2016-11-29', 'received', '100.0000', '100.0000', NULL, NULL, NULL, NULL, NULL, '0.0000'),
(16, NULL, NULL, 8, '22811123', 'salt(pratima)', NULL, '200.0000', '20.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '4000.0000', '19.0000', '2016-11-29', 'received', '200.0000', '200.0000', NULL, NULL, NULL, NULL, NULL, '0.0000'),
(17, NULL, NULL, 8, '22811123', 'salt(pratima)', NULL, '200.0000', '15.0000', 2, '0.0000', 1, '0.0000', NULL, NULL, NULL, '3000.0000', '12.0000', '2016-11-29', 'received', '200.0000', '200.0000', NULL, NULL, NULL, NULL, NULL, '0.0000'),
(18, NULL, NULL, 11, '15002393', 'icecream', NULL, '100.0000', '20.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '2000.0000', '20.0000', '2016-11-29', 'received', '100.0000', '100.0000', NULL, NULL, NULL, NULL, NULL, '0.0000'),
(19, NULL, NULL, 11, '15002393', 'icecream', NULL, '100.0000', '10.0000', 2, '0.0000', 1, '0.0000', NULL, NULL, NULL, '1000.0000', '10.0000', '2016-11-29', 'received', '100.0000', '100.0000', NULL, NULL, NULL, NULL, NULL, '0.0000'),
(20, NULL, NULL, 12, '57176110', 'Clinic Plus 100 ML', NULL, '72.7273', '50.0000', 1, '363.6364', 2, '10.0000%', NULL, NULL, NULL, '4000.0000', '50.0000', '2016-11-29', 'received', '80.0000', '80.0000', NULL, NULL, NULL, NULL, NULL, '0.0000'),
(21, NULL, NULL, 12, '57176110', 'Clinic Plus 100 ML', NULL, '72.7273', '50.0000', 2, '363.6364', 2, '10.0000%', NULL, NULL, NULL, '4000.0000', '30.0000', '2016-11-29', 'received', '80.0000', '80.0000', NULL, NULL, NULL, NULL, NULL, '0.0000'),
(22, 5, NULL, 12, '57176110', 'Clinic Plus 100 ML', NULL, '72.7273', '200.0000', 1, '1454.5400', 2, '10.0000%', '0', '0.0000', '2017-02-04', '16000.0000', '89.0000', '2016-11-29', 'received', '80.0000', '80.0000', '200.0000', NULL, NULL, 1, 'Pis', '200.0000'),
(23, NULL, 2, 12, '57176110', 'Clinic Plus 100 ML', NULL, '72.7273', '20.0000', 1, '145.4540', 2, '10.0000%', NULL, NULL, '0000-00-00', '1600.0000', '20.0000', '2016-11-29', 'received', '80.0000', '80.0000', NULL, NULL, NULL, 1, 'Pis', '20.0000'),
(24, 6, NULL, 5, '40766584', 'bread', 0, '0.0000', '3.0000', 2, '0.0000', 1, '0.0000', '0', '0.0000', NULL, '0.0000', '3.0000', '2016-11-30', 'received', '0.0000', '0.0000', '3.0000', NULL, NULL, 1, 'Pis', '3.0000'),
(25, NULL, 3, 8, '22811123', 'salt(pratima)', NULL, '200.0000', '3.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, '0000-00-00', '600.0000', '3.0000', '2016-11-30', 'received', '200.0000', '200.0000', NULL, NULL, NULL, 1, 'Pis', '3.0000'),
(26, NULL, NULL, 16, '81567325', 'golden tea(200)', NULL, '0.0000', '0.0000', 1, '0.0000', 0, '', NULL, NULL, NULL, '0.0000', '849.9930', '2016-11-30', 'received', '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, '0.0000'),
(27, NULL, NULL, 14, 'tea100', 'tea-100', NULL, '0.0000', '0.0000', 1, '0.0000', 0, '', NULL, NULL, NULL, '0.0000', '-2.0000', '2016-11-30', 'received', '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, '0.0000'),
(28, 7, NULL, 14, 'tea100', 'tea-100', NULL, '34.0000', '15.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', NULL, '510.0000', '15.0000', '2016-11-30', 'ordered', '34.0000', '34.0000', '15.0000', NULL, NULL, 1, 'Pis', '15.0000'),
(29, 7, NULL, 16, '81567325', 'golden tea(200)', NULL, '50.0000', '20.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', NULL, '1000.0000', '20.0000', '2016-11-30', 'ordered', '50.0000', '50.0000', '20.0000', NULL, NULL, 1, 'Pis', '20.0000'),
(30, NULL, NULL, 17, '43376029', 'Biscuits bourbon(100gm)', NULL, '50.0000', '10.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '500.0000', '8.0000', '2016-12-01', 'received', '50.0000', '50.0000', NULL, NULL, NULL, NULL, NULL, '0.0000'),
(31, NULL, NULL, 17, '43376029', 'Biscuits bourbon(100gm)', NULL, '50.0000', '15.0000', 2, '0.0000', 1, '0.0000', NULL, NULL, NULL, '750.0000', '15.0000', '2016-12-01', 'received', '50.0000', '50.0000', NULL, NULL, NULL, NULL, NULL, '0.0000'),
(32, NULL, NULL, 18, '10824603', 'bajaj almond oil', NULL, '80.0000', '5.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '400.0000', '1.0000', '2016-12-01', 'received', '80.0000', '80.0000', NULL, NULL, NULL, NULL, NULL, '0.0000'),
(33, NULL, NULL, 18, '10824603', 'bajaj almond oil', NULL, '80.0000', '5.0000', 2, '0.0000', 1, '0.0000', NULL, NULL, NULL, '400.0000', '5.0000', '2016-12-01', 'received', '80.0000', '80.0000', NULL, NULL, NULL, NULL, NULL, '0.0000'),
(34, NULL, NULL, 19, '82993694', 'rice', NULL, '270.0000', '10.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '2700.0000', '10.0000', '2016-12-01', 'received', '270.0000', '270.0000', NULL, NULL, NULL, NULL, NULL, '0.0000'),
(35, NULL, NULL, 19, '82993694', 'rice', NULL, '270.0000', '10.0000', 2, '0.0000', 1, '0.0000', NULL, NULL, NULL, '2700.0000', '10.0000', '2016-12-01', 'received', '270.0000', '270.0000', NULL, NULL, NULL, NULL, NULL, '0.0000'),
(36, NULL, NULL, 20, '74964595', ' tooth paste', NULL, '100.0000', '15.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '1500.0000', '14.0000', '2016-12-01', 'received', '100.0000', '100.0000', NULL, NULL, NULL, NULL, NULL, '0.0000'),
(37, NULL, NULL, 20, '74964595', ' tooth paste', NULL, '100.0000', '10.0000', 2, '0.0000', 1, '0.0000', NULL, NULL, NULL, '1000.0000', '10.0000', '2016-12-01', 'received', '100.0000', '100.0000', NULL, NULL, NULL, NULL, NULL, '0.0000'),
(38, NULL, NULL, 22, '51511218', 'gugal dhoop sticks', NULL, '0.0000', '0.0000', 1, '0.0000', 0, '', NULL, NULL, NULL, '0.0000', '-2.0000', '2016-12-01', 'received', '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, '0.0000'),
(39, NULL, NULL, 23, '33817050', 'tata tea gold(1kg)', NULL, '120.0000', '1.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '120.0000', '0.0000', '2016-12-01', 'received', '120.0000', '120.0000', NULL, NULL, NULL, NULL, NULL, '0.0000'),
(40, NULL, NULL, 23, '33817050', 'tata tea gold(1kg)', NULL, '120.0000', '1.0000', 2, '0.0000', 1, '0.0000', NULL, NULL, NULL, '120.0000', '1.0000', '2016-12-01', 'received', '120.0000', '120.0000', NULL, NULL, NULL, NULL, NULL, '0.0000'),
(41, NULL, NULL, 24, '84773365', 'sultana bulk', NULL, '200.0000', '25.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '5000.0000', '24.0000', '2016-12-02', 'received', '200.0000', '200.0000', NULL, NULL, NULL, NULL, NULL, '0.0000'),
(42, NULL, NULL, 24, '84773365', 'sultana bulk', NULL, '200.0000', '20.0000', 2, '0.0000', 1, '0.0000', NULL, NULL, NULL, '4000.0000', '20.0000', '2016-12-02', 'received', '200.0000', '200.0000', NULL, NULL, NULL, NULL, NULL, '0.0000'),
(43, 8, NULL, 17, '43376029', 'Biscuits bourbon(100gm)', NULL, '50.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', NULL, '50.0000', '1.0000', '2016-12-02', 'ordered', '50.0000', '50.0000', '1.0000', NULL, NULL, 1, 'Pis', '1.0000'),
(44, NULL, NULL, 25, '68285732', 'sugar1', NULL, '150.0000', '5.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '750.0000', '5.0000', '2016-12-02', 'received', '150.0000', '150.0000', NULL, NULL, NULL, NULL, NULL, '0.0000'),
(46, 9, NULL, 26, '60275895', 'KETCHUP(PRATIMA)', 0, '180.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', NULL, '180.0000', '0.0000', '2016-12-02', 'received', '180.0000', '180.0000', '1.0000', NULL, NULL, 2, 'kg', '1.0000'),
(47, NULL, NULL, 22, '51511218', 'gugal dhoop sticks', NULL, '0.0000', '0.0000', 2, '0.0000', 0, '', NULL, NULL, NULL, '0.0000', '1.0000', '2016-12-02', 'received', '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, '0.0000'),
(48, NULL, NULL, 27, '15955134', 'dabur honey(pratima)', NULL, '300.0000', '2.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '600.0000', '0.0000', '2016-12-02', 'received', '300.0000', '300.0000', NULL, NULL, NULL, NULL, NULL, '0.0000'),
(49, NULL, NULL, 27, '15955134', 'dabur honey(pratima)', NULL, '300.0000', '2.0000', 2, '0.0000', 1, '0.0000', NULL, NULL, NULL, '600.0000', '2.0000', '2016-12-02', 'received', '300.0000', '300.0000', NULL, NULL, NULL, NULL, NULL, '0.0000'),
(50, 10, NULL, 27, '15955134', 'dabur honey(pratima)', NULL, '280.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', NULL, '280.0000', '0.0000', '2016-12-02', 'received', '280.0000', '280.0000', '1.0000', NULL, NULL, 1, 'Pis', '1.0000'),
(51, 11, NULL, 28, '77982237', 'eno lemon', NULL, '20.0000', '10.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', NULL, '200.0000', '30.0000', '2016-12-02', 'received', '20.0000', '20.0000', '10.0000', NULL, NULL, 1, 'Pis', '10.0000'),
(52, NULL, 4, 8, '22811123', 'salt(pratima)', NULL, '200.0000', '1.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, '0000-00-00', '200.0000', '1.0000', '2016-12-02', 'received', '200.0000', '200.0000', NULL, NULL, NULL, 1, 'Pis', '1.0000'),
(54, 12, NULL, 29, '25144924', 'gits jilebi', 0, '100.0000', '2.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', NULL, '200.0000', '1.0000', '2016-12-05', 'received', '100.0000', '100.0000', '2.0000', NULL, NULL, 2, 'kg', '2.0000'),
(55, NULL, NULL, 30, '03445420', 'durga pooja pack', NULL, '40.0000', '2.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '80.0000', '0.0000', '2016-12-05', 'received', '40.0000', '40.0000', NULL, NULL, NULL, NULL, NULL, '0.0000'),
(56, NULL, NULL, 30, '03445420', 'durga pooja pack', NULL, '40.0000', '2.0000', 2, '0.0000', 1, '0.0000', NULL, NULL, NULL, '80.0000', '2.0000', '2016-12-05', 'received', '40.0000', '40.0000', NULL, NULL, NULL, NULL, NULL, '0.0000'),
(57, 13, NULL, 30, '03445420', 'durga pooja pack', NULL, '40.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', NULL, '40.0000', '0.0000', '2016-12-05', 'received', '40.0000', '40.0000', '1.0000', NULL, NULL, 1, 'Pis', '1.0000'),
(58, NULL, NULL, 31, '71936837', 'biscuit', NULL, '0.0000', '0.0000', 1, '0.0000', 0, '', NULL, NULL, NULL, '0.0000', '2.0000', '2016-12-14', 'received', '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, '0.0000'),
(59, NULL, NULL, 32, '39661656', 'parle-g', NULL, '40.0000', '1.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '40.0000', '5.0000', '2016-12-23', 'received', '40.0000', '40.0000', NULL, NULL, NULL, NULL, NULL, '0.0000'),
(60, NULL, NULL, 15, '', '', NULL, '0.0000', '0.0000', 1, '0.0000', NULL, NULL, NULL, NULL, NULL, '0.0000', '-41.0000', '0000-00-00', 'received', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000'),
(61, NULL, NULL, 26, '', '', NULL, '0.0000', '0.0000', 1, '0.0000', NULL, NULL, NULL, NULL, NULL, '0.0000', '9.0000', '0000-00-00', 'received', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000');

-- --------------------------------------------------------

--
-- Table structure for table `sma_quotes`
--

CREATE TABLE IF NOT EXISTS `sma_quotes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reference_no` varchar(55) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer` varchar(55) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `biller_id` int(11) NOT NULL,
  `biller` varchar(55) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `internal_note` varchar(1000) DEFAULT NULL,
  `total` decimal(25,4) NOT NULL,
  `product_discount` decimal(25,4) DEFAULT '0.0000',
  `order_discount` decimal(25,4) DEFAULT NULL,
  `order_discount_id` varchar(20) DEFAULT NULL,
  `total_discount` decimal(25,4) DEFAULT '0.0000',
  `product_tax` decimal(25,4) DEFAULT '0.0000',
  `order_tax_id` int(11) DEFAULT NULL,
  `order_tax` decimal(25,4) DEFAULT NULL,
  `total_tax` decimal(25,4) DEFAULT NULL,
  `shipping` decimal(25,4) DEFAULT '0.0000',
  `grand_total` decimal(25,4) NOT NULL,
  `status` varchar(20) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `supplier` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `sma_quotes`
--

INSERT INTO `sma_quotes` (`id`, `date`, `reference_no`, `customer_id`, `customer`, `warehouse_id`, `biller_id`, `biller`, `note`, `internal_note`, `total`, `product_discount`, `order_discount`, `order_discount_id`, `total_discount`, `product_tax`, `order_tax_id`, `order_tax`, `total_tax`, `shipping`, `grand_total`, `status`, `created_by`, `updated_by`, `updated_at`, `attachment`, `supplier_id`, `supplier`) VALUES
(1, '2016-11-29 14:38:00', '123tth', 8, 'SIMPLYSAFE', 2, 3, 'GWS Biller', '', NULL, '50.0000', '0.0000', '10.0000', '20%', '10.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '40.0000', 'pending', 2, NULL, NULL, NULL, 4, 'survine pvt ltd '),
(2, '2016-11-29 14:48:00', '124tth/pr', 6, 'Hamarisalah1', 2, 5, 'Hamarisalah', '', NULL, '360.0000', '0.0000', '36.0000', '10%', '36.0000', '0.0000', 5, '64.8000', '64.8000', '0.0000', '388.8000', 'sent', 2, NULL, NULL, NULL, 2, 'Supplier Company Name'),
(3, '2016-11-30 14:51:00', '124tth', 8, 'SIMPLYSAFE', 1, 3, 'GWS Biller', '', NULL, '300.0000', '0.0000', '31.8000', '10%', '31.8000', '18.0000', 1, '0.0000', '18.0000', '0.0000', '286.2000', 'pending', 2, NULL, NULL, NULL, 7, 'pawan'),
(4, '2016-11-30 16:50:00', 'singh', 9, 'shri niwas', 2, 3, 'GWS Biller', '', NULL, '100.0000', '0.0000', '0.0000', NULL, '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '100.0000', 'pending', 2, NULL, NULL, NULL, 4, 'survine pvt ltd '),
(5, '2016-12-01 12:31:00', '11', 1, 'Walk-in Customer', 1, 3, 'GWS Biller', '', NULL, '12860.0000', '0.0000', '0.0000', NULL, '0.0000', '750.0000', 1, '0.0000', '750.0000', '0.0000', '13610.0000', 'sent', 2, NULL, NULL, NULL, 2, 'Supplier Company Name');

-- --------------------------------------------------------

--
-- Table structure for table `sma_quote_items`
--

CREATE TABLE IF NOT EXISTS `sma_quote_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quote_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_type` varchar(20) DEFAULT NULL,
  `option_id` int(11) DEFAULT NULL,
  `net_unit_price` decimal(25,4) NOT NULL,
  `unit_price` decimal(25,4) DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `discount` varchar(55) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `real_unit_price` decimal(25,4) DEFAULT NULL,
  `product_unit_id` int(11) DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `quote_id` (`quote_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `sma_quote_items`
--

INSERT INTO `sma_quote_items` (`id`, `quote_id`, `product_id`, `product_code`, `product_name`, `product_type`, `option_id`, `net_unit_price`, `unit_price`, `quantity`, `warehouse_id`, `item_tax`, `tax_rate_id`, `tax`, `discount`, `item_discount`, `subtotal`, `serial_no`, `real_unit_price`, `product_unit_id`, `product_unit_code`, `unit_quantity`) VALUES
(1, 1, 7, '58988117', 'sugar(pratima)', 'combo', NULL, '50.0000', '50.0000', '1.0000', 2, '0.0000', 1, '0.0000', '0', '0.0000', '50.0000', NULL, '50.0000', 0, NULL, '1.0000'),
(2, 2, 9, '88916520', 'oil(pratima)', 'combo', NULL, '180.0000', '180.0000', '2.0000', 2, '0.0000', 1, '0.0000', '0', '0.0000', '360.0000', NULL, '180.0000', 0, NULL, '2.0000'),
(3, 3, 1, '07009110', 'samsung S Duos', 'standard', NULL, '300.0000', '318.0000', '1.0000', 1, '18.0000', 3, '6.0000%', '0', '0.0000', '318.0000', NULL, '300.0000', 1, 'Pis', '1.0000'),
(4, 4, 15, '28403364', 'golden(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 2, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', NULL, '60.0000', 1, 'Pis', '1.0000'),
(5, 4, 14, 'tea100', 'tea-100', 'standard', NULL, '40.0000', '40.0000', '1.0000', 2, '0.0000', 1, '0.0000', '0', '0.0000', '40.0000', NULL, '40.0000', 1, 'Pis', '1.0000'),
(6, 5, 1, '07009110', 'samsung S Duos', 'standard', NULL, '2500.0000', '2650.0000', '5.0000', 1, '750.0000', 3, '6.0000%', '0', '0.0000', '13250.0000', NULL, '2500.0000', 1, 'Pis', '5.0000'),
(7, 5, 2, '88863516', 'Milk', 'standard', NULL, '36.0000', '36.0000', '10.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '360.0000', NULL, '36.0000', 1, 'Pis', '10.0000');

-- --------------------------------------------------------

--
-- Table structure for table `sma_sales`
--

CREATE TABLE IF NOT EXISTS `sma_sales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reference_no` varchar(55) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer` varchar(55) NOT NULL,
  `biller_id` int(11) NOT NULL,
  `biller` varchar(55) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `staff_note` varchar(1000) DEFAULT NULL,
  `total` decimal(25,4) NOT NULL,
  `product_discount` decimal(25,4) DEFAULT '0.0000',
  `order_discount_id` varchar(20) DEFAULT NULL,
  `total_discount` decimal(25,4) DEFAULT '0.0000',
  `order_discount` decimal(25,4) DEFAULT '0.0000',
  `product_tax` decimal(25,4) DEFAULT '0.0000',
  `order_tax_id` int(11) DEFAULT NULL,
  `order_tax` decimal(25,4) DEFAULT '0.0000',
  `total_tax` decimal(25,4) DEFAULT '0.0000',
  `shipping` decimal(25,4) DEFAULT '0.0000',
  `grand_total` decimal(25,4) NOT NULL,
  `sale_status` varchar(20) DEFAULT NULL,
  `payment_status` varchar(20) DEFAULT NULL,
  `payment_term` tinyint(4) DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `total_items` tinyint(4) DEFAULT NULL,
  `pos` tinyint(1) NOT NULL DEFAULT '0',
  `paid` decimal(25,4) DEFAULT '0.0000',
  `return_id` int(11) DEFAULT NULL,
  `surcharge` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `attachment` varchar(55) DEFAULT NULL,
  `return_sale_ref` varchar(55) DEFAULT NULL,
  `sale_id` int(11) DEFAULT NULL,
  `return_sale_total` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `rounding` decimal(10,4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=394 ;

--
-- Dumping data for table `sma_sales`
--

INSERT INTO `sma_sales` (`id`, `date`, `reference_no`, `customer_id`, `customer`, `biller_id`, `biller`, `warehouse_id`, `note`, `staff_note`, `total`, `product_discount`, `order_discount_id`, `total_discount`, `order_discount`, `product_tax`, `order_tax_id`, `order_tax`, `total_tax`, `shipping`, `grand_total`, `sale_status`, `payment_status`, `payment_term`, `due_date`, `created_by`, `updated_by`, `updated_at`, `total_items`, `pos`, `paid`, `return_id`, `surcharge`, `attachment`, `return_sale_ref`, `sale_id`, `return_sale_total`, `rounding`) VALUES
(1, '2016-11-15 15:38:38', 'SALE/POS/2016/11/0001', 1, 'Walk-in Customer', 3, 'Test Biller', 1, 'ff', 'vv\r&NewLine;\r&NewLine;', '2500.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '2500.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '2500.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(2, '2016-11-15 15:43:39', 'SALE/POS/2016/11/0002', 1, 'Walk-in Customer', 3, 'Test Biller', 1, '', '', '2500.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '2500.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '2500.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(3, '2016-11-15 16:52:01', 'SALE/POS/2016/11/0003', 1, 'Walk-in Customer', 3, 'Test Biller', 1, '', '', '2500.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '2500.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '2500.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(4, '2016-11-15 16:54:37', 'SALE/POS/2016/11/0004', 1, 'Walk-in Customer', 3, 'Test Biller', 1, '', '', '2500.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '2500.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '2500.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(5, '2016-11-15 16:55:09', 'SALE/POS/2016/11/0005', 1, 'Walk-in Customer', 3, 'Test Biller', 1, '', '', '2500.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '2500.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '2500.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(6, '2016-11-15 17:47:00', 'SALE/POS/2016/11/0006', 1, 'Walk-in Customer', 3, 'Test Biller', 1, '', '', '2500.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 2, '250.0000', '250.0000', '0.0000', '2750.0000', 'completed', 'due', 0, NULL, 2, 2, '2016-11-17 14:30:09', 1, 1, '0.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(7, '2016-11-16 18:01:24', 'SALE/POS/2016/11/0007', 1, 'Walk-in Customer', 3, 'Test Biller', 1, '', '', '12500.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '12500.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 5, 1, '12500.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(8, '2016-11-16 19:42:39', 'SALE/POS/2016/11/0008', 1, 'Walk-in Customer', 3, 'Test Biller', 1, '', '', '2500.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 2, '250.0000', '250.0000', '0.0000', '2750.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '2750.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(9, '2016-11-16 19:47:31', 'SALE/POS/2016/11/0009', 1, 'Walk-in Customer', 3, 'Test Biller', 1, '', '', '2500.0000', '0.0000', '5%', '125.0000', '125.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '2375.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '2375.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(10, '2016-11-16 19:56:04', 'SALE/POS/2016/11/0010', 1, 'Walk-in Customer', 3, 'Test Biller', 1, '', '', '2534.0000', '0.0000', '5%', '126.7000', '126.7000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '2407.3000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 2, 1, '2407.3000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(11, '2016-11-17 12:55:59', 'SALE/POS/2016/11/0011', 1, 'Walk-in Customer', 3, 'Test Biller', 1, '', '', '2500.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '2500.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '2500.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(12, '2016-11-17 14:27:00', 'SALE/2016/11/0001', 1, 'Walk-in Customer', 3, 'GWS Biller', 1, '', '', '37500.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 3, '2250.0000', '2250.0000', '0.0000', '39750.0000', 'completed', 'paid', 0, NULL, 2, 2, '2016-11-21 16:57:50', 15, 0, '39750.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', NULL),
(13, '2016-11-17 17:17:46', 'SALE/POS/2016/11/0012', 1, 'Walk-in Customer', 3, 'GWS Biller', 1, '', '', '25000.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '25000.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 10, 1, '25000.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(14, '2016-11-18 12:48:25', 'SALE/POS/2016/11/0013', 1, 'Walk-in Customer', 3, 'GWS Biller', 1, '', '', '2500.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '2500.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '2500.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(15, '2016-11-19 13:50:18', 'SALE/POS/2016/11/0014', 1, 'Walk-in Customer', 3, 'GWS Biller', 1, '', '', '2500.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '2500.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '2500.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(16, '2016-11-19 19:12:26', 'SALE/POS/2016/11/0015', 1, 'Walk-in Customer', 3, 'GWS Biller', 1, '', '', '2500.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '2500.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '2500.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(17, '2016-11-21 18:38:22', 'SALE/POS/2016/11/0001', 1, 'Walk-in Customer', 3, 'GWS Biller', 1, '', '', '2536.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '2536.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 2, 1, '2536.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(18, '2016-11-22 09:51:13', 'SALE/POS/2016/11/0002', 1, 'Walk-in Customer', 3, 'GWS Biller', 1, '', '', '2500.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '2500.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '2500.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(19, '2016-11-23 10:28:18', 'SALE/POS/2016/11/0003', 1, 'Walk-in Customer', 3, 'GWS Biller', 1, '', '', '2500.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '2500.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '2500.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(20, '2016-11-23 14:28:16', 'SALE/POS/2016/11/0004', 1, 'Walk-in Customer', 3, 'GWS Biller', 1, '', '', '2500.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '2500.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '2500.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(21, '2016-11-23 14:38:17', 'SALE/POS/2016/11/0005', 1, 'Walk-in Customer', 3, 'GWS Biller', 1, '', '', '2536.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '2536.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 2, 1, '2536.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(22, '2016-11-23 15:08:27', 'SALE/POS/2016/11/0006', 1, 'Walk-in Customer', 3, 'GWS Biller', 1, '', '', '2536.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '2536.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 2, 1, '2536.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(23, '2016-11-23 15:09:18', 'SALE/POS/2016/11/0007', 1, 'Walk-in Customer', 3, 'GWS Biller', 1, '', '', '2500.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '2500.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '2500.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(24, '2016-11-23 15:14:46', 'SALE/POS/2016/11/0008', 1, 'Walk-in Customer', 3, 'GWS Biller', 1, '', '', '2500.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '2500.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '2500.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(25, '2016-11-23 15:25:04', 'SALE/POS/2016/11/0009', 1, 'Walk-in Customer', 3, 'GWS Biller', 1, '', '', '5036.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '5036.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 3, 1, '5036.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(26, '2016-11-23 18:35:45', 'SALE/POS/2016/11/0010', 1, 'Walk-in Customer', 3, 'GWS Biller', 1, '', '', '2500.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '2500.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '2500.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(27, '2016-11-23 18:42:12', 'SALE/POS/2016/11/0011', 1, 'Walk-in Customer', 3, 'GWS Biller', 1, '', '', '2558.7273', '0.0000', NULL, '0.0000', '0.0000', '2.2727', 1, '0.0000', '2.2727', '0.0000', '2561.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 3, 1, '2561.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(28, '2016-11-24 14:43:42', 'SALE/POS/2016/11/0012', 1, 'Walk-in Customer', 3, 'GWS Biller', 1, '', '', '2500.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '2500.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '2500.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(29, '2016-11-25 16:09:21', 'SALE/POS/2016/11/0013', 1, 'Walk-in Customer', 3, 'GWS Biller', 1, '', '', '2500.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '2500.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '2500.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(30, '2016-11-25 16:35:20', 'SALE/POS/2016/11/0014', 1, 'Walk-in Customer', 3, 'GWS Biller', 1, '', '', '2522.7273', '0.0000', NULL, '0.0000', '0.0000', '2.2727', 1, '0.0000', '2.2727', '0.0000', '2525.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 2, 1, '2525.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(31, '2016-11-25 16:45:52', 'SALE/POS/2016/11/0015', 1, 'Walk-in Customer', 3, 'GWS Biller', 1, '', '', '2522.7273', '0.0000', NULL, '0.0000', '0.0000', '2.2727', 1, '0.0000', '2.2727', '0.0000', '2525.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 2, 1, '2525.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(32, '2016-11-25 17:55:05', 'SALE/POS/2016/11/0016', 1, 'Walk-in Customer', 3, 'GWS Biller', 1, '', '', '2522.7273', '0.0000', NULL, '0.0000', '0.0000', '2.2727', 1, '0.0000', '2.2727', '0.0000', '2525.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 2, 1, '2525.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(33, '2016-11-26 12:46:44', 'SALE/POS/2016/11/0017', 1, 'Walk-in Customer', 3, 'GWS Biller', 1, '', '', '125000.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '125000.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 50, 1, '125000.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(34, '2016-11-26 13:32:14', 'SALE/POS/2016/11/0018', 1, 'Walk-in Customer', 3, 'GWS Biller', 1, '', '', '2536.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '2536.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 2, 1, '2536.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(35, '2016-11-26 13:50:38', 'SALE/POS/2016/11/0019', 1, 'Walk-in Customer', 3, 'GWS Biller', 1, '', '', '500.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '500.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 5, 1, '500.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(36, '2016-11-26 14:16:45', 'SALE/POS/2016/11/0020', 1, 'Walk-in Customer', 3, 'GWS Biller', 1, '', '', '2500.0000', '0.0000', NULL, '0.0000', '0.0000', '150.0000', 4, '530.0000', '680.0000', '0.0000', '3180.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '3180.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(37, '2016-11-26 16:26:44', 'SALE/POS/2016/11/0021', 1, 'Walk-in Customer', 3, 'GWS Biller', 1, '', '', '5045.4546', '0.0000', NULL, '0.0000', '0.0000', '304.5454', 1, '0.0000', '304.5454', '0.0000', '5350.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 4, 1, '5350.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(38, '2016-11-26 20:18:50', 'SALE/POS/2016/11/0022', 1, 'Walk-in Customer', 3, 'GWS Biller', 1, '', '', '2500.0000', '0.0000', NULL, '0.0000', '0.0000', '150.0000', 1, '0.0000', '150.0000', '0.0000', '2650.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '2650.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(39, '2016-11-27 04:50:36', 'SALE/POS/2016/11/0023', 1, 'Walk-in Customer', 3, 'GWS Biller', 1, '', '', '2500.0000', '0.0000', NULL, '0.0000', '0.0000', '150.0000', 1, '0.0000', '150.0000', '0.0000', '2650.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '2650.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(40, '2016-11-27 16:07:52', 'SALE/POS/2016/11/0024', 1, 'Walk-in Customer', 3, 'GWS Biller', 1, '', '', '2522.7273', '0.0000', NULL, '0.0000', '0.0000', '152.2727', 1, '0.0000', '152.2727', '0.0000', '2675.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 2, 1, '2675.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(41, '2016-11-27 16:36:22', 'SALE/POS/2016/11/0025', 1, 'Walk-in Customer', 3, 'GWS Biller', 1, '', '', '2500.0000', '0.0000', NULL, '0.0000', '0.0000', '150.0000', 1, '0.0000', '150.0000', '0.0000', '2650.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '2650.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(42, '2016-11-27 16:51:01', 'SALE/POS/2016/11/0026', 1, 'Walk-in Customer', 3, 'GWS Biller', 1, '', '', '2522.7273', '0.0000', NULL, '0.0000', '0.0000', '152.2727', 1, '0.0000', '152.2727', '0.0000', '2675.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 2, 1, '2675.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(43, '2016-11-27 22:53:25', 'SALE/POS/2016/11/0027', 1, 'Walk-in Customer', 3, 'GWS Biller', 1, '', '', '2500.0000', '0.0000', NULL, '0.0000', '0.0000', '150.0000', 1, '0.0000', '150.0000', '0.0000', '2650.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '2650.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(44, '2016-11-28 05:57:06', 'SALE/POS/2016/11/0028', 1, 'Walk-in Customer', 3, 'GWS Biller', 1, '', '', '2500.0000', '0.0000', NULL, '0.0000', '0.0000', '150.0000', 1, '0.0000', '150.0000', '0.0000', '2650.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '2650.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(45, '2016-12-01 11:22:00', '145', 13, 's.sp', 3, 'GWS Biller', 1, '', '', '80.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '80.0000', 'completed', 'pending', 0, NULL, 2, NULL, NULL, 1, 0, '0.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', NULL),
(46, '2016-12-02 11:32:46', 'SALE/POS/2016/12/0029', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '420.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '420.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 7, 1, '420.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(47, '2016-12-02 12:36:14', 'SALE/POS/2016/12/0030', 16, 'shyam store', 3, 'GWS Biller', 1, '', '', '220.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '220.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '220.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(48, '2016-12-02 14:50:00', 'SALE/POS/2016/12/0031', 20, 'I.C.M', 5, 'Hamarisalah', 1, '', '', '200.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '200.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '200.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(49, '2016-12-02 16:25:42', 'SALE/POS/2016/12/0032', 22, 'g.st', 5, 'Hamarisalah', 1, '', '', '300.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '300.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '300.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(50, '2016-12-02 16:31:12', 'SALE/POS/2016/12/0033', 22, 'g.st', 5, 'Hamarisalah', 1, '', '', '300.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '300.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '300.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(51, '2016-12-02 17:25:19', 'SALE/POS/2016/12/0034', 1, 'Walk-in Customer', 5, 'Hamarisalah', 1, '', '', '27.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '27.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '27.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(52, '2016-12-03 12:18:06', 'SALE/POS/2016/12/0035', 24, 'gws', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(53, '2016-12-03 22:52:16', 'SALE/POS/2016/12/0036', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(54, '2016-12-04 15:20:52', 'SALE/POS/2016/12/0037', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(55, '2016-12-04 17:42:35', 'SALE/POS/2016/12/0038', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(56, '2016-12-04 17:44:08', 'SALE/POS/2016/12/0039', 9, 'shri niwas', 3, 'GWS Biller', 1, '', '', '210.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '210.0000', 'completed', 'paid', 0, NULL, 6, NULL, NULL, 2, 1, '210.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(57, '2016-12-04 17:50:36', 'SALE/POS/2016/12/0040', 9, 'shri niwas', 3, 'GWS Biller', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 6, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(58, '2016-12-04 23:16:39', 'SALE/POS/2016/12/0041', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '120.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '120.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 2, 1, '120.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(59, '2016-12-04 23:23:52', 'SALE/POS/2016/12/0042', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(60, '2016-12-04 23:25:58', 'SALE/POS/2016/12/0043', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(61, '2016-12-04 23:27:25', 'SALE/POS/2016/12/0044', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(62, '2016-12-04 23:41:26', 'SALE/POS/2016/12/0045', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(63, '2016-12-05 09:27:11', 'SALE/POS/2016/12/0046', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(64, '2016-12-05 09:37:50', 'SALE/POS/2016/12/0047', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(65, '2016-12-05 09:40:36', 'SALE/POS/2016/12/0048', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(66, '2016-12-05 09:54:50', 'SALE/POS/2016/12/0049', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(67, '2016-12-05 09:57:54', 'SALE/POS/2016/12/0050', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(68, '2016-12-05 10:29:14', 'SALE/POS/2016/12/0051', 26, 'git', 5, 'Hamarisalah', 1, '', '', '150.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '150.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '150.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(69, '2016-12-05 11:22:56', 'SALE/POS/2016/12/0052', 28, 'durga ', 5, 'Hamarisalah', 1, '', '', '50.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '50.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '50.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(70, '2016-12-05 13:02:39', 'SALE/POS/2016/12/0053', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(71, '2016-12-05 14:38:21', 'SALE/POS/2016/12/0054', 1, 'Walk-in Customer', 5, 'Hamarisalah', 1, '', '', '2536.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '2536.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 2, 1, '2536.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(72, '2016-12-05 15:01:31', 'SALE/POS/2016/12/0055', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(73, '2016-12-06 00:15:26', 'SALE/POS/2016/12/0056', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '120.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '120.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 2, 1, '120.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(74, '2016-12-06 00:20:24', 'SALE/POS/2016/12/0057', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '360.0000', '0.0000', NULL, '0.0000', '0.0000', '18.0000', 1, '0.0000', '18.0000', '0.0000', '378.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 2, 1, '378.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(75, '2016-12-06 00:21:13', 'SALE/POS/2016/12/0058', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '40.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '40.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '40.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(76, '2016-12-06 01:02:03', 'SALE/POS/2016/12/0059', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(77, '2016-12-06 01:16:55', 'SALE/POS/2016/12/0060', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'partial', 0, NULL, 2, NULL, NULL, 1, 1, '50.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(78, '2016-12-06 01:20:19', 'SALE/POS/2016/12/0061', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(79, '2016-12-06 01:24:28', 'SALE/POS/2016/12/0062', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(80, '2016-12-06 01:29:11', 'SALE/POS/2016/12/0063', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(81, '2016-12-06 01:33:27', 'SALE/POS/2016/12/0064', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(82, '2016-12-06 01:40:15', 'SALE/POS/2016/12/0065', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '120.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '120.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 2, 1, '120.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(83, '2016-12-06 09:19:18', 'SALE/POS/2016/12/0066', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '100.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '100.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 2, 1, '100.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(84, '2016-12-06 09:34:21', 'SALE/POS/2016/12/0067', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '100.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '100.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 2, 1, '100.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(85, '2016-12-06 09:43:43', 'SALE/POS/2016/12/0068', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '100.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '100.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 2, 1, '100.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(86, '2016-12-06 09:50:46', 'SALE/POS/2016/12/0069', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '100.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '100.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 2, 1, '100.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(87, '2016-12-06 10:04:48', 'SALE/POS/2016/12/0070', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '100.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '100.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 2, 1, '100.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(88, '2016-12-06 10:07:13', 'SALE/POS/2016/12/0071', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '100.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '100.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 2, 1, '100.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(89, '2016-12-06 10:08:23', 'SALE/POS/2016/12/0072', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '100.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '100.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 2, 1, '100.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(90, '2016-12-06 15:28:37', 'SALE/POS/2016/12/0073', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '120.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '120.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 2, 1, '120.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(91, '2016-12-06 16:04:08', 'SALE/POS/2016/12/0074', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '120.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '120.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 2, 1, '120.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(92, '2016-12-06 16:58:07', 'SALE/POS/2016/12/0075', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(93, '2016-12-06 19:09:13', 'SALE/POS/2016/12/0076', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'due', 0, NULL, 2, NULL, NULL, 1, 1, '0.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(94, '2016-12-07 00:32:55', 'SALE/POS/2016/12/0077', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '360.0000', '0.0000', NULL, '0.0000', '0.0000', '18.0000', 1, '0.0000', '18.0000', '0.0000', '378.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 2, 1, '378.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(95, '2016-12-07 00:37:19', 'SALE/POS/2016/12/0078', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(96, '2016-12-07 02:44:11', 'SALE/POS/2016/12/0001', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(97, '2016-12-07 13:11:23', 'SALE/POS/2016/12/0002', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(98, '2016-12-08 00:48:01', 'SALE/POS/2016/12/0003', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(99, '2016-12-08 01:01:33', 'SALE/POS/2016/12/0004', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(100, '2016-12-08 13:23:28', 'SALE/POS/2016/12/0005', 1, 'Walk-in Customer', 5, 'Hamarisalah', 1, '', '', '81.8182', '0.0000', NULL, '0.0000', '0.0000', '8.1818', 1, '0.0000', '8.1818', '0.0000', '90.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '90.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(101, '2016-12-08 22:17:06', 'SALE/POS/2016/12/0006', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'due', 0, NULL, 2, NULL, NULL, 1, 1, '0.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(102, '2016-12-08 23:43:12', 'SALE/POS/2016/12/0007', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(103, '2016-12-09 17:12:53', 'SALE/POS/2016/12/0008', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'due', 0, NULL, 2, NULL, NULL, 1, 1, '0.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(104, '2016-12-10 00:46:32', 'SALE/POS/2016/12/0009', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(105, '2016-12-10 14:02:45', 'SALE/POS/2016/12/0010', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '110.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '110.0000', 'completed', 'due', 0, NULL, 2, NULL, NULL, 2, 1, '0.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(106, '2016-12-10 18:27:22', 'SALE/POS/2016/12/0011', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '120.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '120.0000', 'completed', 'due', 0, NULL, 2, NULL, NULL, 2, 1, '0.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(107, '2016-12-10 19:02:49', 'SALE/POS/2016/12/0012', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(108, '2016-12-11 05:49:09', 'SALE/POS/2016/12/0013', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(109, '2016-12-11 05:50:38', 'SALE/POS/2016/12/0014', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '120.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '120.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 2, 1, '120.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(110, '2016-12-11 15:18:28', 'SALE/POS/2016/12/0015', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(111, '2016-12-11 15:19:55', 'SALE/POS/2016/12/0016', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(112, '2016-12-11 15:21:15', 'SALE/POS/2016/12/0017', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(113, '2016-12-11 15:28:54', 'SALE/POS/2016/12/0018', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(114, '2016-12-11 15:29:45', 'SALE/POS/2016/12/0019', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '100.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '100.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 2, 1, '100.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(115, '2016-12-11 15:30:17', 'SALE/POS/2016/12/0020', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '100.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '100.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 2, 1, '100.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(116, '2016-12-11 15:37:16', 'SALE/POS/2016/12/0021', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(117, '2016-12-11 15:39:51', 'SALE/POS/2016/12/0022', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(118, '2016-12-11 15:40:58', 'SALE/POS/2016/12/0023', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(119, '2016-12-11 15:43:50', 'SALE/POS/2016/12/0024', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(120, '2016-12-11 15:46:28', 'SALE/POS/2016/12/0025', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(121, '2016-12-11 22:24:26', 'SALE/POS/2016/12/0026', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(122, '2016-12-12 15:11:15', 'SALE/POS/2016/12/0027', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(123, '2016-12-12 15:13:13', 'SALE/POS/2016/12/0028', 9, 'shri niwas', 3, 'GWS Biller', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(124, '2016-12-12 18:57:38', 'SALE/POS/2016/12/0029', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'due', 0, NULL, 2, NULL, NULL, 1, 1, '0.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(125, '2016-12-12 21:26:28', 'SALE/POS/2016/12/0030', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(126, '2016-12-12 22:42:46', 'SALE/POS/2016/12/0031', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '305.4546', '0.0000', NULL, '0.0000', '0.0000', '24.5454', 2, '33.0000', '57.5454', '0.0000', '363.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 4, 1, '363.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(127, '2016-12-13 03:14:59', 'SALE/POS/2016/12/0032', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(128, '2016-12-14 11:54:05', 'SALE/POS/2016/12/0033', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '120.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '120.0000', 'completed', 'due', 0, NULL, 2, NULL, NULL, 2, 1, '0.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(129, '2016-12-14 12:20:18', 'SALE/POS/2016/12/0034', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'due', 0, NULL, 2, NULL, NULL, 1, 1, '0.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(130, '2016-12-14 12:22:19', 'SALE/POS/2016/12/0035', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '780.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '780.0000', 'completed', 'due', 0, NULL, 2, NULL, NULL, 13, 1, '0.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(131, '2016-12-14 12:26:58', 'SALE/POS/2016/12/0036', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'due', 0, NULL, 2, NULL, NULL, 1, 1, '0.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(132, '2016-12-14 12:28:20', 'SALE/POS/2016/12/0037', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '81.8182', '0.0000', NULL, '0.0000', '0.0000', '8.1818', 1, '0.0000', '8.1818', '0.0000', '90.0000', 'completed', 'due', 0, NULL, 2, NULL, NULL, 1, 1, '0.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(133, '2016-12-14 12:31:00', 'SALE/POS/2016/12/0038', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'due', 0, NULL, 2, NULL, NULL, 1, 1, '0.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(134, '2016-12-14 12:31:10', 'SALE/POS/2016/12/0039', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(135, '2016-12-14 12:31:49', 'SALE/POS/2016/12/0040', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(136, '2016-12-14 12:42:39', 'SALE/POS/2016/12/0041', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '81.8182', '0.0000', NULL, '0.0000', '0.0000', '8.1818', 1, '0.0000', '8.1818', '0.0000', '90.0000', 'completed', 'due', 0, NULL, 2, NULL, NULL, 1, 1, '0.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(137, '2016-12-14 12:46:39', 'SALE/POS/2016/12/0042', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '40.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '40.0000', 'completed', 'due', 0, NULL, 2, NULL, NULL, 1, 1, '0.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(138, '2016-12-14 13:15:00', 'SALE/POS/2016/12/0043', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'due', 0, NULL, 2, NULL, NULL, 1, 1, '0.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(139, '2016-12-14 19:30:36', 'SALE/POS/2016/12/0044', 11, 'b.v.g', 5, 'Hamarisalah', 1, '', '', '180.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '180.0000', 'completed', 'due', 0, NULL, 2, NULL, NULL, 3, 1, '0.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(140, '2016-12-14 19:35:57', 'SALE/POS/2016/12/0045', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'due', 0, NULL, 2, NULL, NULL, 1, 1, '0.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(141, '2016-12-14 21:03:59', 'SALE/POS/2016/12/0046', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'due', 0, NULL, 2, NULL, NULL, 1, 1, '0.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(142, '2016-12-14 21:08:20', 'SALE/POS/2016/12/0047', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'due', 0, NULL, 2, NULL, NULL, 1, 1, '0.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(143, '2016-12-14 21:14:32', 'SALE/POS/2016/12/0048', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'due', 0, NULL, 2, NULL, NULL, 1, 1, '0.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(144, '2016-12-14 21:18:16', 'SALE/POS/2016/12/0049', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'due', 0, NULL, 2, NULL, NULL, 1, 1, '0.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(145, '2016-12-14 21:22:31', 'SALE/POS/2016/12/0050', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '110.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '110.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 2, 1, '110.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(146, '2016-12-14 21:24:37', 'SALE/POS/2016/12/0051', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'due', 0, NULL, 2, NULL, NULL, 1, 1, '0.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(147, '2016-12-14 22:50:14', 'SALE/POS/2016/12/0052', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(148, '2016-12-14 22:52:04', 'SALE/POS/2016/12/0053', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(149, '2016-12-14 22:53:13', 'SALE/POS/2016/12/0054', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '120.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '120.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 2, 1, '120.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(150, '2016-12-14 23:01:37', 'SALE/POS/2016/12/0055', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(151, '2016-12-14 23:06:14', 'SALE/POS/2016/12/0056', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(152, '2016-12-14 23:07:02', 'SALE/POS/2016/12/0057', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(153, '2016-12-14 23:08:52', 'SALE/POS/2016/12/0058', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(154, '2016-12-14 23:11:09', 'SALE/POS/2016/12/0059', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000');
INSERT INTO `sma_sales` (`id`, `date`, `reference_no`, `customer_id`, `customer`, `biller_id`, `biller`, `warehouse_id`, `note`, `staff_note`, `total`, `product_discount`, `order_discount_id`, `total_discount`, `order_discount`, `product_tax`, `order_tax_id`, `order_tax`, `total_tax`, `shipping`, `grand_total`, `sale_status`, `payment_status`, `payment_term`, `due_date`, `created_by`, `updated_by`, `updated_at`, `total_items`, `pos`, `paid`, `return_id`, `surcharge`, `attachment`, `return_sale_ref`, `sale_id`, `return_sale_total`, `rounding`) VALUES
(155, '2016-12-14 23:16:21', 'SALE/POS/2016/12/0060', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(156, '2016-12-14 23:26:56', 'SALE/POS/2016/12/0061', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(157, '2016-12-14 23:27:56', 'SALE/POS/2016/12/0062', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(158, '2016-12-14 23:28:56', 'SALE/POS/2016/12/0063', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'partial', 0, NULL, 2, NULL, NULL, 1, 1, '50.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(159, '2016-12-14 23:30:28', 'SALE/POS/2016/12/0064', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(160, '2016-12-14 23:33:29', 'SALE/POS/2016/12/0065', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(161, '2016-12-14 23:36:04', 'SALE/POS/2016/12/0066', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(162, '2016-12-14 23:37:13', 'SALE/POS/2016/12/0067', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(163, '2016-12-14 23:46:34', 'SALE/POS/2016/12/0068', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(164, '2016-12-14 23:48:52', 'SALE/POS/2016/12/0069', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(165, '2016-12-14 23:49:24', 'SALE/POS/2016/12/0070', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(166, '2016-12-14 23:53:03', 'SALE/POS/2016/12/0071', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(167, '2016-12-15 00:17:39', 'SALE/POS/2016/12/0072', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(168, '2016-12-15 00:22:00', 'SALE/POS/2016/12/0073', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(169, '2016-12-15 00:29:43', 'SALE/POS/2016/12/0074', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(170, '2016-12-15 00:33:14', 'SALE/POS/2016/12/0075', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(171, '2016-12-15 00:34:28', 'SALE/POS/2016/12/0076', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'due', 0, NULL, 2, NULL, NULL, 1, 1, '0.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(172, '2016-12-15 01:14:01', 'SALE/POS/2016/12/0077', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'due', 0, NULL, 2, NULL, NULL, 1, 1, '0.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(173, '2016-12-15 08:26:10', 'SALE/POS/2016/12/0078', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'partial', 0, NULL, 2, NULL, NULL, 1, 1, '160.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(174, '2016-12-15 08:38:22', 'SALE/POS/2016/12/0079', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'partial', 0, NULL, 2, NULL, NULL, 1, 1, '120.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(175, '2016-12-15 08:50:10', 'SALE/POS/2016/12/0080', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'partial', 0, NULL, 2, NULL, NULL, 1, 1, '120.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(176, '2016-12-15 08:59:25', 'SALE/POS/2016/12/0081', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'partial', 0, NULL, 2, NULL, NULL, 1, 1, '120.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(177, '2016-12-15 09:10:47', 'SALE/POS/2016/12/0082', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'due', 0, NULL, 2, NULL, NULL, 1, 1, '0.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(178, '2016-12-15 10:20:20', 'SALE/POS/2016/12/0083', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'due', 0, NULL, 2, NULL, NULL, 1, 1, '0.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(179, '2016-12-15 10:20:53', 'SALE/POS/2016/12/0084', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '81.8182', '0.0000', NULL, '0.0000', '0.0000', '8.1818', 1, '0.0000', '8.1818', '0.0000', '90.0000', 'completed', 'due', 0, NULL, 2, NULL, NULL, 1, 1, '0.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(180, '2016-12-15 10:21:41', 'SALE/POS/2016/12/0085', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '40.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '40.0000', 'completed', 'due', 0, NULL, 2, NULL, NULL, 1, 1, '0.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(181, '2016-12-15 10:22:35', 'SALE/POS/2016/12/0086', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '27.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '27.0000', 'completed', 'due', 0, NULL, 2, NULL, NULL, 1, 1, '0.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(182, '2016-12-15 16:33:21', 'SALE/POS/2016/12/0087', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'due', 0, NULL, 2, NULL, NULL, 1, 1, '0.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(183, '2016-12-15 16:56:54', 'SALE/POS/2016/12/0088', 16, 'shyam store', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'due', 0, NULL, 2, NULL, NULL, 1, 1, '0.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(184, '2016-12-15 17:00:10', 'SALE/POS/2016/12/0089', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'due', 0, NULL, 2, NULL, NULL, 1, 1, '0.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(185, '2016-12-15 17:07:04', 'SALE/POS/2016/12/0090', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(186, '2016-12-15 17:10:36', 'SALE/POS/2016/12/0091', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'due', 0, NULL, 2, NULL, NULL, 1, 1, '0.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(187, '2016-12-15 17:46:56', 'SALE/POS/2016/12/0092', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'due', 0, NULL, 2, NULL, NULL, 1, 1, '0.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(188, '2016-12-15 17:47:29', 'SALE/POS/2016/12/0093', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'due', 0, NULL, 2, NULL, NULL, 1, 1, '0.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(189, '2016-12-15 17:54:14', 'SALE/POS/2016/12/0094', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'due', 0, NULL, 2, NULL, NULL, 1, 1, '0.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(190, '2016-12-15 18:15:43', 'SALE/POS/2016/12/0095', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'due', 0, NULL, 2, NULL, NULL, 1, 1, '0.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(191, '2016-12-15 18:24:25', 'SALE/POS/2016/12/0096', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'due', 0, NULL, 2, NULL, NULL, 1, 1, '0.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(192, '2016-12-15 19:25:54', 'SALE/POS/2016/12/0097', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(193, '2016-12-15 20:27:39', 'SALE/POS/2016/12/0098', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'due', 0, NULL, 2, NULL, NULL, 1, 1, '0.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(194, '2016-12-15 20:29:14', 'SALE/POS/2016/12/0099', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(195, '2016-12-15 20:30:04', 'SALE/POS/2016/12/0100', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(196, '2016-12-15 20:31:28', 'SALE/POS/2016/12/0101', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'due', 0, NULL, 2, NULL, NULL, 1, 1, '0.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(197, '2016-12-15 20:47:47', 'SALE/POS/2016/12/0102', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'due', 0, NULL, 2, NULL, NULL, 1, 1, '0.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(198, '2016-12-15 20:58:23', 'SALE/POS/2016/12/0103', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '120.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '120.0000', 'completed', 'due', 0, NULL, 2, NULL, NULL, 2, 1, '0.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(199, '2016-12-15 21:07:22', 'SALE/POS/2016/12/0104', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'partial', 0, NULL, 2, NULL, NULL, 1, 1, '120.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(200, '2016-12-15 21:36:05', 'SALE/POS/2016/12/0105', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'partial', 0, NULL, 2, NULL, NULL, 1, 1, '120.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(201, '2016-12-15 21:41:40', 'SALE/POS/2016/12/0106', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'partial', 0, NULL, 2, NULL, NULL, 1, 1, '70.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(202, '2016-12-16 12:19:57', 'SALE/POS/2016/12/0107', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '70.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '70.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 2, 1, '70.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(203, '2016-12-16 12:21:05', 'SALE/POS/2016/12/0108', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(204, '2016-12-16 12:22:04', 'SALE/POS/2016/12/0109', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(205, '2016-12-16 12:28:31', 'SALE/POS/2016/12/0110', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '70.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '70.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 2, 1, '70.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(206, '2016-12-16 12:29:56', 'SALE/POS/2016/12/0111', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '70.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '70.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 2, 1, '70.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(207, '2016-12-16 12:31:20', 'SALE/POS/2016/12/0112', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '120.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '120.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 2, 1, '120.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(208, '2016-12-16 12:33:02', 'SALE/POS/2016/12/0113', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '120.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '120.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 2, 1, '120.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(209, '2016-12-16 12:36:05', 'SALE/POS/2016/12/0114', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(210, '2016-12-16 12:48:40', 'SALE/POS/2016/12/0115', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(211, '2016-12-16 12:57:27', 'SALE/POS/2016/12/0116', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'due', 0, NULL, 2, NULL, NULL, 1, 1, '0.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(212, '2016-12-16 12:59:21', 'SALE/POS/2016/12/0117', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'due', 0, NULL, 2, NULL, NULL, 1, 1, '0.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(213, '2016-12-16 13:01:45', 'SALE/POS/2016/12/0118', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'due', 0, NULL, 2, NULL, NULL, 1, 1, '0.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(214, '2016-12-16 13:18:08', 'SALE/POS/2016/12/0119', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'due', 0, NULL, 2, NULL, NULL, 1, 1, '0.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(215, '2016-12-16 14:12:47', 'SALE/POS/2016/12/0120', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(216, '2016-12-16 14:32:08', 'SALE/POS/2016/12/0121', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(217, '2016-12-16 23:21:32', 'SALE/POS/2016/12/0122', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(218, '2016-12-17 21:31:22', 'SALE/POS/2016/12/0123', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(219, '2016-12-17 21:34:05', 'SALE/POS/2016/12/0124', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(220, '2016-12-17 21:35:12', 'SALE/POS/2016/12/0125', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(221, '2016-12-17 22:03:23', 'SALE/POS/2016/12/0126', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(222, '2016-12-18 15:51:08', 'SALE/POS/2016/12/0127', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(223, '2016-12-19 13:04:34', 'SALE/POS/2016/12/0128', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(224, '2016-12-20 11:06:28', 'SALE/POS/2016/12/0129', 11, 'b.v.g', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(225, '2016-12-20 11:07:06', 'SALE/POS/2016/12/0130', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(226, '2016-12-20 11:08:18', 'SALE/POS/2016/12/0131', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(227, '2016-12-20 11:10:39', 'SALE/POS/2016/12/0132', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(228, '2016-12-20 11:26:20', 'SALE/POS/2016/12/0133', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(229, '2016-12-20 11:26:51', 'SALE/POS/2016/12/0134', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(230, '2016-12-20 11:29:49', 'SALE/POS/2016/12/0135', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'due', 0, NULL, 2, NULL, NULL, 1, 1, '0.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(231, '2016-12-20 11:52:08', 'SALE/POS/2016/12/0136', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'due', 0, NULL, 2, NULL, NULL, 1, 1, '0.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(232, '2016-12-20 17:50:22', 'SALE/POS/2016/12/0137', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '120.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '120.0000', 'completed', 'due', 0, NULL, 2, NULL, NULL, 2, 1, '0.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(233, '2016-12-20 20:47:06', 'SALE/POS/2016/12/0138', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(234, '2016-12-21 00:01:42', 'SALE/POS/2016/12/0139', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(235, '2016-12-21 00:10:58', 'SALE/POS/2016/12/0140', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(236, '2016-12-21 00:13:41', 'SALE/POS/2016/12/0141', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '900.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '900.0000', 'completed', 'partial', 0, NULL, 2, NULL, NULL, 15, 1, '200.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(237, '2016-12-21 00:15:31', 'SALE/POS/2016/12/0142', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(238, '2016-12-21 00:15:47', 'SALE/POS/2016/12/0143', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(239, '2016-12-21 00:16:27', 'SALE/POS/2016/12/0144', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(240, '2016-12-21 00:16:36', 'SALE/POS/2016/12/0145', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(241, '2016-12-21 00:17:21', 'SALE/POS/2016/12/0146', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(242, '2016-12-21 00:19:30', 'SALE/POS/2016/12/0147', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(243, '2016-12-21 00:23:37', 'SALE/POS/2016/12/0148', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(244, '2016-12-21 00:24:02', 'SALE/POS/2016/12/0149', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(245, '2016-12-21 00:25:09', 'SALE/POS/2016/12/0150', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '120.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '120.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 2, 1, '120.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(246, '2016-12-21 00:25:50', 'SALE/POS/2016/12/0151', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(247, '2016-12-21 00:30:00', 'SALE/POS/2016/12/0152', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(248, '2016-12-21 00:33:54', 'SALE/POS/2016/12/0153', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(249, '2016-12-21 00:34:15', 'SALE/POS/2016/12/0154', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(250, '2016-12-21 00:35:25', 'SALE/POS/2016/12/0155', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(251, '2016-12-21 00:36:41', 'SALE/POS/2016/12/0156', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(252, '2016-12-21 00:42:22', 'SALE/POS/2016/12/0157', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(253, '2016-12-21 00:43:56', 'SALE/POS/2016/12/0158', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(254, '2016-12-21 00:46:56', 'SALE/POS/2016/12/0159', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(255, '2016-12-21 00:51:19', 'SALE/POS/2016/12/0160', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(256, '2016-12-21 08:38:38', 'SALE/POS/2016/12/0161', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '87.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '87.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 2, 1, '87.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(257, '2016-12-21 08:40:40', 'SALE/POS/2016/12/0162', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(258, '2016-12-21 12:29:08', 'SALE/POS/2016/12/0163', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'due', 0, NULL, 2, NULL, NULL, 1, 1, '0.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(259, '2016-12-22 11:47:35', 'SALE/POS/2016/12/0164', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(260, '2016-12-22 12:27:46', 'SALE/POS/2016/12/0165', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(261, '2016-12-22 12:29:33', 'SALE/POS/2016/12/0166', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '81.8182', '0.0000', NULL, '0.0000', '0.0000', '8.1818', 1, '0.0000', '8.1818', '0.0000', '90.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '90.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(262, '2016-12-22 12:32:13', 'SALE/POS/2016/12/0167', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '141.8182', '0.0000', NULL, '0.0000', '0.0000', '8.1818', 1, '0.0000', '8.1818', '0.0000', '150.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 2, 1, '150.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(263, '2016-12-22 13:30:26', 'SALE/POS/2016/12/0168', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'partial', 0, NULL, 2, NULL, NULL, 1, 1, '5560.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(264, '2016-12-22 15:24:31', 'SALE/POS/2016/12/0169', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '120.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '120.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 2, 1, '120.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(265, '2016-12-22 15:29:20', 'SALE/POS/2016/12/0170', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(266, '2016-12-22 15:29:57', 'SALE/POS/2016/12/0171', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(267, '2016-12-22 15:32:28', 'SALE/POS/2016/12/0172', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(268, '2016-12-23 12:14:34', 'SALE/POS/2016/12/0173', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'partial', 0, NULL, 2, NULL, NULL, 1, 1, '160.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(269, '2016-12-23 12:15:56', 'SALE/POS/2016/12/0174', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'partial', 0, NULL, 2, NULL, NULL, 1, 1, '160.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(270, '2016-12-23 12:19:06', 'SALE/POS/2016/12/0175', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'partial', 0, NULL, 2, NULL, NULL, 1, 1, '100.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(271, '2016-12-23 12:24:04', 'SALE/POS/2016/12/0176', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(272, '2016-12-23 12:28:53', 'SALE/POS/2016/12/0177', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(273, '2016-12-23 12:33:41', 'SALE/POS/2016/12/0178', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(274, '2016-12-23 12:53:20', 'SALE/POS/2016/12/0179', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(275, '2016-12-23 12:59:58', 'SALE/POS/2016/12/0180', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(276, '2016-12-23 13:03:22', 'SALE/POS/2016/12/0181', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(277, '2016-12-23 13:03:33', 'SALE/POS/2016/12/0182', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(278, '2016-12-23 13:04:46', 'SALE/POS/2016/12/0183', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(279, '2016-12-23 13:06:40', 'SALE/POS/2016/12/0184', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(280, '2016-12-23 13:07:18', 'SALE/POS/2016/12/0185', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(281, '2016-12-23 13:14:05', 'SALE/POS/2016/12/0186', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(282, '2016-12-23 13:15:46', 'SALE/POS/2016/12/0187', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(283, '2016-12-23 13:24:20', 'SALE/POS/2016/12/0188', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '81.8182', '0.0000', NULL, '0.0000', '0.0000', '8.1818', 1, '0.0000', '8.1818', '0.0000', '90.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '90.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(284, '2016-12-23 13:32:22', 'SALE/POS/2016/12/0189', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(285, '2016-12-23 14:54:00', 'SALE/POS/2016/12/0190', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '0.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '0.0000', 'completed', 'due', 0, NULL, 2, NULL, NULL, 1, 1, '0.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(286, '2016-12-23 14:55:53', 'SALE/POS/2016/12/0191', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '0.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '0.0000', 'completed', 'due', 0, NULL, 2, NULL, NULL, 1, 1, '0.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(287, '2016-12-23 15:00:07', 'SALE/POS/2016/12/0192', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '0.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '0.0000', 'completed', 'due', 0, NULL, 2, NULL, NULL, 1, 1, '0.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(288, '2016-12-23 15:01:59', 'SALE/POS/2016/12/0193', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '0.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '0.0000', 'completed', 'due', 0, NULL, 2, NULL, NULL, 1, 1, '0.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(289, '2016-12-23 15:13:39', 'SALE/POS/2016/12/0194', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '0.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '0.0000', 'completed', 'due', 0, NULL, 2, NULL, NULL, 1, 1, '0.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(290, '2016-12-23 15:37:53', 'SALE/POS/2016/12/0195', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '0.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '0.0000', 'completed', 'due', 0, NULL, 2, NULL, NULL, 1, 1, '0.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(291, '2016-12-23 15:39:32', 'SALE/POS/2016/12/0196', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '50.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '50.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '50.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(292, '2016-12-23 16:26:33', 'SALE/POS/2016/12/0197', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(293, '2016-12-23 16:28:38', 'SALE/POS/2016/12/0198', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(294, '2016-12-23 16:37:35', 'SALE/POS/2016/12/0199', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(295, '2016-12-23 16:38:45', 'SALE/POS/2016/12/0200', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(296, '2016-12-23 16:39:46', 'SALE/POS/2016/12/0201', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(297, '2016-12-23 16:40:58', 'SALE/POS/2016/12/0202', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(298, '2016-12-23 16:41:53', 'SALE/POS/2016/12/0203', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(299, '2016-12-23 16:42:50', 'SALE/POS/2016/12/0204', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(300, '2016-12-23 16:45:55', 'SALE/POS/2016/12/0205', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(301, '2016-12-23 17:04:39', 'SALE/POS/2016/12/0206', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(302, '2016-12-23 17:08:53', 'SALE/POS/2016/12/0207', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(303, '2016-12-23 17:10:57', 'SALE/POS/2016/12/0208', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(304, '2016-12-23 17:11:42', 'SALE/POS/2016/12/0209', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'due', 0, NULL, 2, NULL, NULL, 1, 1, '0.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(305, '2016-12-23 17:14:26', 'SALE/POS/2016/12/0210', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(306, '2016-12-23 17:58:47', 'SALE/POS/2016/12/0211', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(307, '2016-12-23 17:59:43', 'SALE/POS/2016/12/0212', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(308, '2016-12-23 18:36:26', 'SALE/POS/2016/12/0213', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '120.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '120.0000', 'completed', 'due', 0, NULL, 2, NULL, NULL, 2, 1, '0.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(309, '2016-12-23 18:37:17', 'SALE/POS/2016/12/0214', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(310, '2016-12-23 23:35:40', 'SALE/POS/2016/12/0215', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000');
INSERT INTO `sma_sales` (`id`, `date`, `reference_no`, `customer_id`, `customer`, `biller_id`, `biller`, `warehouse_id`, `note`, `staff_note`, `total`, `product_discount`, `order_discount_id`, `total_discount`, `order_discount`, `product_tax`, `order_tax_id`, `order_tax`, `total_tax`, `shipping`, `grand_total`, `sale_status`, `payment_status`, `payment_term`, `due_date`, `created_by`, `updated_by`, `updated_at`, `total_items`, `pos`, `paid`, `return_id`, `surcharge`, `attachment`, `return_sale_ref`, `sale_id`, `return_sale_total`, `rounding`) VALUES
(311, '2016-12-23 23:57:17', 'SALE/POS/2016/12/0216', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(312, '2016-12-23 23:58:42', 'SALE/POS/2016/12/0217', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(313, '2016-12-24 00:10:22', 'SALE/POS/2016/12/0218', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(314, '2016-12-24 00:11:46', 'SALE/POS/2016/12/0219', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '120.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '120.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 2, 1, '120.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(315, '2016-12-24 00:13:43', 'SALE/POS/2016/12/0220', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(316, '2016-12-24 00:23:04', 'SALE/POS/2016/12/0221', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(317, '2016-12-24 00:24:28', 'SALE/POS/2016/12/0222', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(318, '2016-12-24 09:50:22', 'SALE/POS/2016/12/0223', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(319, '2016-12-24 11:56:32', 'SALE/POS/2016/12/0224', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '27.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '27.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '27.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(320, '2016-12-24 16:39:39', 'SALE/POS/2016/12/0225', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(321, '2016-12-24 16:48:10', 'SALE/POS/2016/12/0226', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(322, '2016-12-24 16:51:30', 'SALE/POS/2016/12/0227', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(323, '2016-12-24 18:19:39', 'SALE/POS/2016/12/0228', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(324, '2016-12-29 18:04:55', 'SALE/POS/2016/12/0229', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(325, '2016-12-29 18:05:29', 'SALE/POS/2016/12/0230', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(326, '2016-12-29 18:15:49', 'SALE/POS/2016/12/0231', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '120.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '120.0000', 'completed', 'due', 0, NULL, 2, NULL, NULL, 2, 1, '0.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(327, '2016-12-29 18:16:24', 'SALE/POS/2016/12/0232', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(328, '2016-12-29 18:31:09', 'SALE/POS/2016/12/0233', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(329, '2016-12-29 18:32:04', 'SALE/POS/2016/12/0234', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'due', 0, NULL, 2, NULL, NULL, 1, 1, '0.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(330, '2016-12-29 18:34:00', 'SALE/POS/2016/12/0235', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'due', 0, NULL, 2, NULL, NULL, 1, 1, '0.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(331, '2017-01-03 00:12:41', 'SALE/POS/2017/01/0236', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(332, '2017-01-03 00:13:55', 'SALE/POS/2017/01/0237', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(333, '2017-01-03 00:15:11', 'SALE/POS/2017/01/0238', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(334, '2017-01-03 00:20:09', 'SALE/POS/2017/01/0239', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(335, '2017-01-03 06:19:18', 'SALE/POS/2017/01/0240', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(336, '2017-01-03 06:21:00', 'SALE/POS/2017/01/0241', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '360.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '360.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 2, 1, '360.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(337, '2017-01-03 20:57:57', 'SALE/POS/2017/01/0001', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '141.8182', '0.0000', NULL, '0.0000', '0.0000', '8.1818', 1, '0.0000', '8.1818', '0.0000', '150.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 2, 1, '150.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(338, '2017-01-03 20:58:25', 'SALE/POS/2017/01/0002', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(339, '2017-01-03 21:14:58', 'SALE/POS/2017/01/0003', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(340, '2017-01-03 22:33:21', 'SALE/POS/2017/01/0004', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(341, '2017-01-03 22:36:52', 'SALE/POS/2017/01/0005', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(342, '2017-01-03 22:37:12', 'SALE/POS/2017/01/0006', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(343, '2017-01-03 23:37:39', 'SALE/POS/2017/01/0007', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(344, '2017-01-04 04:54:40', 'SALE/POS/2017/01/0008', 1, 'Walk-in Customer', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(345, '2017-01-04 05:02:01', 'SALE/POS/2017/01/0009', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(346, '2017-01-04 07:31:15', 'SALE/POS/2017/01/0010', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(347, '2017-01-04 09:17:44', 'SALE/POS/2017/01/0011', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(348, '2017-01-04 09:26:03', 'SALE/POS/2017/01/0012', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(349, '2017-01-04 17:38:40', 'SALE/POS/2017/01/0013', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '300.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '300.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 5, 1, '300.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(350, '2017-01-06 03:34:57', 'SALE/POS/2017/01/0014', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'due', 0, NULL, 2, NULL, NULL, 1, 1, '0.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(351, '2017-01-06 07:46:39', 'SALE/POS/2017/01/0015', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(352, '2017-01-06 07:52:43', 'SALE/POS/2017/01/0016', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '180.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '180.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 3, 1, '180.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(353, '2017-01-06 08:28:52', 'SALE/POS/2017/01/0017', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(354, '2017-01-06 08:30:18', 'SALE/POS/2017/01/0018', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(355, '2017-01-07 16:10:18', 'SALE/POS/2017/01/0019', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '120.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '120.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 2, 1, '120.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(356, '2017-01-07 16:38:50', 'SALE/POS/2017/01/0020', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(357, '2017-01-09 20:22:52', 'SALE/POS/2017/01/0021', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(358, '2017-01-09 20:26:01', 'SALE/POS/2017/01/0022', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(359, '2017-01-09 20:26:23', 'SALE/POS/2017/01/0023', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'due', 0, NULL, 2, NULL, NULL, 1, 1, '0.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(360, '2017-01-11 17:46:42', 'SALE/POS/2017/01/0024', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(361, '2017-01-11 20:20:45', 'SALE/POS/2017/01/0025', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(362, '2017-01-11 20:27:27', 'SALE/POS/2017/01/0026', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '220.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '220.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 7, 1, '220.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(363, '2017-01-11 21:25:27', 'SALE/POS/2017/01/0027', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(364, '2017-01-11 22:49:53', 'SALE/POS/2017/01/0028', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '120.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '120.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 2, 1, '120.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(365, '2017-01-11 22:53:30', 'SALE/POS/2017/01/0029', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '40.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '40.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '40.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(366, '2017-01-11 23:23:01', 'SALE/POS/2017/01/0030', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(367, '2017-01-11 23:37:49', 'SALE/POS/2017/01/0031', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '1000.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '1000.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 100, 1, '1000.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(368, '2017-01-12 01:03:00', 'SALE/POS/2017/01/0032', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '9.0909', '0.0000', NULL, '0.0000', '0.0000', '0.9091', 1, '0.0000', '0.9091', '0.0000', '10.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '10.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(369, '2017-01-12 01:04:03', 'SALE/POS/2017/01/0033', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '420.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '420.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 7, 1, '420.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(370, '2017-01-12 01:05:08', 'SALE/POS/2017/01/0034', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(371, '2017-01-12 16:16:10', 'SALE/POS/2017/01/0035', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '180.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '180.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 3, 1, '180.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(372, '2017-01-12 16:19:05', 'SALE/POS/2017/01/0036', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(373, '2017-01-12 17:16:08', 'SALE/POS/2017/01/0037', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '180.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '180.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 3, 1, '180.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(374, '2017-01-12 21:58:02', 'SALE/POS/2017/01/0038', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '450.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '450.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '450.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(375, '2017-01-12 23:11:07', 'SALE/POS/2017/01/0039', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(376, '2017-01-13 05:01:29', 'SALE/POS/2017/01/0040', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '120.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '120.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 2, 1, '120.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(377, '2017-01-13 14:53:05', 'SALE/POS/2017/01/0041', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '227.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '227.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 2, 1, '227.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(378, '2017-01-13 14:54:18', 'SALE/POS/2017/01/0042', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(379, '2017-01-14 03:34:11', 'SALE/POS/2017/01/0043', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '120.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '120.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 2, 1, '120.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(380, '2017-01-14 14:04:11', 'SALE/POS/2017/01/0044', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '120.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '120.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 2, 1, '120.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(381, '2017-01-14 19:56:22', 'SALE/POS/2017/01/0045', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '120.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '120.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 2, 1, '120.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(382, '2017-01-14 21:45:19', 'SALE/POS/2017/01/0046', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(383, '2017-01-14 22:41:28', 'SALE/POS/2017/01/0047', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(384, '2017-01-16 01:20:29', 'SALE/POS/2017/01/0048', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(385, '2017-01-16 17:14:37', 'SALE/POS/2017/01/0049', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(386, '2017-01-17 18:03:04', 'SALE/POS/2017/01/0050', 1, 'Walk-in Customer', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(387, '2017-01-17 19:34:01', 'SALE/POS/2017/01/0051', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(388, '2017-01-17 19:34:42', 'SALE/POS/2017/01/0052', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '300.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '300.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 5, 1, '300.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(389, '2017-01-17 19:41:49', 'SALE/POS/2017/01/0053', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '60.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(390, '2017-01-17 19:42:59', 'SALE/POS/2017/01/0054', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '450.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '450.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 1, 1, '450.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(391, '2017-01-17 19:54:27', 'SALE/POS/2017/01/0055', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '100.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '100.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 2, 1, '100.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(392, '2017-01-17 19:55:40', 'SALE/POS/2017/01/0056', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '0.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '0.0000', 'completed', 'due', 0, NULL, 2, NULL, NULL, 1, 1, '0.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000'),
(393, '2017-01-17 20:40:53', 'SALE/POS/2017/01/0057', 9, 'shri niwas', 5, 'Hamarisalah', 1, '', '', '120.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '120.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 2, 1, '120.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000');

-- --------------------------------------------------------

--
-- Table structure for table `sma_sale_items`
--

CREATE TABLE IF NOT EXISTS `sma_sale_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sale_id` int(11) unsigned NOT NULL,
  `product_id` int(11) unsigned NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_type` varchar(20) DEFAULT NULL,
  `option_id` int(11) DEFAULT NULL,
  `net_unit_price` decimal(25,4) NOT NULL,
  `unit_price` decimal(25,4) DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `discount` varchar(55) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `real_unit_price` decimal(25,4) DEFAULT NULL,
  `sale_item_id` int(11) DEFAULT NULL,
  `product_unit_id` int(11) DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sale_id` (`sale_id`),
  KEY `product_id` (`product_id`),
  KEY `product_id_2` (`product_id`,`sale_id`),
  KEY `sale_id_2` (`sale_id`,`product_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=474 ;

--
-- Dumping data for table `sma_sale_items`
--

INSERT INTO `sma_sale_items` (`id`, `sale_id`, `product_id`, `product_code`, `product_name`, `product_type`, `option_id`, `net_unit_price`, `unit_price`, `quantity`, `warehouse_id`, `item_tax`, `tax_rate_id`, `tax`, `discount`, `item_discount`, `subtotal`, `serial_no`, `real_unit_price`, `sale_item_id`, `product_unit_id`, `product_unit_code`, `unit_quantity`) VALUES
(1, 1, 1, '07009110', 'samsung S Duos', 'standard', NULL, '2500.0000', '2500.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '2500.0000', '', '2500.0000', NULL, 1, 'Pis', '1.0000'),
(2, 2, 1, '07009110', 'samsung S Duos', 'standard', NULL, '2500.0000', '2500.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '2500.0000', '', '2500.0000', NULL, 1, 'Pis', '1.0000'),
(3, 3, 1, '07009110', 'samsung S Duos', 'standard', NULL, '2500.0000', '2500.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '2500.0000', '', '2500.0000', NULL, 1, 'Pis', '1.0000'),
(4, 4, 1, '07009110', 'samsung S Duos', 'standard', NULL, '2500.0000', '2500.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '2500.0000', '', '2500.0000', NULL, 1, 'Pis', '1.0000'),
(5, 5, 1, '07009110', 'samsung S Duos', 'standard', NULL, '2500.0000', '2500.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '2500.0000', '', '2500.0000', NULL, 1, 'Pis', '1.0000'),
(7, 7, 1, '07009110', 'samsung S Duos', 'standard', NULL, '2500.0000', '2500.0000', '5.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '12500.0000', '', '2500.0000', NULL, 1, 'Pis', '5.0000'),
(8, 8, 1, '07009110', 'samsung S Duos', 'standard', NULL, '2500.0000', '2500.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '2500.0000', '', '2500.0000', NULL, 1, 'Pis', '1.0000'),
(9, 9, 1, '07009110', 'samsung S Duos', 'standard', NULL, '2500.0000', '2500.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '2500.0000', '', '2500.0000', NULL, 1, 'Pis', '1.0000'),
(10, 10, 1, '07009110', 'samsung S Duos', 'standard', NULL, '2500.0000', '2500.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '2500.0000', '', '2500.0000', NULL, 1, 'Pis', '1.0000'),
(11, 10, 1, '07009110', 'samsung S Duos', 'standard', 0, '34.0000', '34.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '34.0000', '', '34.0000', NULL, 1, 'Pis', '1.0000'),
(12, 11, 1, '07009110', 'samsung S Duos', 'standard', NULL, '2500.0000', '2500.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '2500.0000', '', '2500.0000', NULL, 1, 'Pis', '1.0000'),
(14, 6, 1, '07009110', 'samsung S Duos', 'standard', NULL, '2500.0000', '2500.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '2500.0000', '', '2500.0000', NULL, 1, 'Pis', '1.0000'),
(15, 13, 1, '07009110', 'samsung S Duos', 'standard', NULL, '2500.0000', '2500.0000', '10.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '25000.0000', '', '2500.0000', NULL, 1, 'Pis', '10.0000'),
(16, 14, 1, '07009110', 'samsung S Duos', 'standard', NULL, '2500.0000', '2500.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '2500.0000', '', '2500.0000', NULL, 1, 'Pis', '1.0000'),
(17, 15, 1, '07009110', 'samsung S Duos', 'standard', NULL, '2500.0000', '2500.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '2500.0000', '', '2500.0000', NULL, 1, 'Pis', '1.0000'),
(18, 16, 1, '07009110', 'samsung S Duos', 'standard', NULL, '2500.0000', '2500.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '2500.0000', '', '2500.0000', NULL, 1, 'Pis', '1.0000'),
(19, 12, 1, '07009110', 'samsung S Duos', 'standard', NULL, '2500.0000', '2500.0000', '15.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '37500.0000', '', '2500.0000', NULL, 1, 'Pis', '15.0000'),
(20, 17, 2, '88863516', 'Milk', 'standard', NULL, '36.0000', '36.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '36.0000', '', '36.0000', NULL, 1, 'Pis', '1.0000'),
(21, 17, 1, '07009110', 'samsung S Duos', 'standard', NULL, '2500.0000', '2500.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '2500.0000', '', '2500.0000', NULL, 1, 'Pis', '1.0000'),
(22, 18, 1, '07009110', 'samsung S Duos', 'standard', NULL, '2500.0000', '2500.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '2500.0000', '', '2500.0000', NULL, 1, 'Pis', '1.0000'),
(23, 19, 1, '07009110', 'samsung S Duos', 'standard', NULL, '2500.0000', '2500.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '2500.0000', '', '2500.0000', NULL, 1, 'Pis', '1.0000'),
(24, 20, 1, '07009110', 'samsung S Duos', 'standard', NULL, '2500.0000', '2500.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '2500.0000', '', '2500.0000', NULL, 1, 'Pis', '1.0000'),
(25, 21, 2, '88863516', 'Milk', 'standard', NULL, '36.0000', '36.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '36.0000', '', '36.0000', NULL, 1, 'Pis', '1.0000'),
(26, 21, 1, '07009110', 'samsung S Duos', 'standard', NULL, '2500.0000', '2500.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '2500.0000', '', '2500.0000', NULL, 1, 'Pis', '1.0000'),
(27, 22, 1, '07009110', 'samsung S Duos', 'standard', 0, '2500.0000', '2500.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '2500.0000', '', '2500.0000', NULL, 1, 'Pis', '1.0000'),
(28, 22, 2, '88863516', 'Milk', 'standard', 0, '36.0000', '36.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '36.0000', '', '36.0000', NULL, 1, 'Pis', '1.0000'),
(29, 23, 1, '07009110', 'samsung S Duos', 'standard', NULL, '2500.0000', '2500.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '2500.0000', '', '2500.0000', NULL, 1, 'Pis', '1.0000'),
(30, 24, 1, '07009110', 'samsung S Duos', 'standard', NULL, '2500.0000', '2500.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '2500.0000', '', '2500.0000', NULL, 1, 'Pis', '1.0000'),
(31, 25, 2, '88863516', 'Milk', 'standard', NULL, '36.0000', '36.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '36.0000', '', '36.0000', NULL, 1, 'Pis', '1.0000'),
(32, 25, 1, '07009110', 'samsung S Duos', 'standard', NULL, '2500.0000', '2500.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '2500.0000', '', '2500.0000', NULL, 1, 'Pis', '1.0000'),
(33, 25, 1, '07009110', 'samsung S Duos', 'standard', NULL, '2500.0000', '2500.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '2500.0000', '', '2500.0000', NULL, 1, 'Pis', '1.0000'),
(34, 26, 1, '07009110', 'samsung S Duos', 'standard', NULL, '2500.0000', '2500.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '2500.0000', '', '2500.0000', NULL, 1, 'Pis', '1.0000'),
(35, 27, 1, '07009110', 'samsung S Duos', 'standard', 0, '2500.0000', '2500.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '2500.0000', '', '2500.0000', NULL, 1, 'Pis', '1.0000'),
(36, 27, 2, '88863516', 'Milk', 'standard', 0, '36.0000', '36.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '36.0000', '', '36.0000', NULL, 1, 'Pis', '1.0000'),
(37, 27, 3, '85086124', 'Bread', 'standard', 0, '22.7273', '25.0000', '1.0000', 1, '2.2727', 2, '10.0000%', '0', '0.0000', '25.0000', '', '25.0000', NULL, 1, 'Pis', '1.0000'),
(38, 28, 1, '07009110', 'samsung S Duos', 'standard', NULL, '2500.0000', '2500.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '2500.0000', '', '2500.0000', NULL, 1, 'Pis', '1.0000'),
(39, 29, 1, '07009110', 'samsung S Duos', 'standard', NULL, '2500.0000', '2500.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '2500.0000', '', '2500.0000', NULL, 1, 'Pis', '1.0000'),
(40, 30, 1, '07009110', 'samsung S Duos', 'standard', NULL, '2500.0000', '2500.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '2500.0000', '', '2500.0000', NULL, 1, 'Pis', '1.0000'),
(41, 30, 3, '85086124', 'Bread', 'standard', NULL, '22.7273', '25.0000', '1.0000', 1, '2.2727', 2, '10.0000%', '0', '0.0000', '25.0000', '', '25.0000', NULL, 1, 'Pis', '1.0000'),
(42, 31, 1, '07009110', 'samsung S Duos', 'standard', NULL, '2500.0000', '2500.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '2500.0000', '', '2500.0000', NULL, 1, 'Pis', '1.0000'),
(43, 31, 3, '85086124', 'Bread', 'standard', NULL, '22.7273', '25.0000', '1.0000', 1, '2.2727', 2, '10.0000%', '0', '0.0000', '25.0000', '', '25.0000', NULL, 1, 'Pis', '1.0000'),
(44, 32, 1, '07009110', 'samsung S Duos', 'standard', NULL, '2500.0000', '2500.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '2500.0000', '', '2500.0000', NULL, 1, 'Pis', '1.0000'),
(45, 32, 3, '85086124', 'Bread', 'standard', NULL, '22.7273', '25.0000', '1.0000', 1, '2.2727', 2, '10.0000%', '0', '0.0000', '25.0000', '', '25.0000', NULL, 1, 'Pis', '1.0000'),
(46, 33, 1, '07009110', 'samsung S Duos', 'standard', 0, '2500.0000', '2500.0000', '50.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '125000.0000', '', '2500.0000', NULL, 1, 'Pis', '50.0000'),
(47, 34, 2, '88863516', 'Milk', 'standard', NULL, '36.0000', '36.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '36.0000', '', '36.0000', NULL, 1, 'Pis', '1.0000'),
(48, 34, 1, '07009110', 'samsung S Duos', 'standard', NULL, '2500.0000', '2500.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '2500.0000', '', '2500.0000', NULL, 1, 'Pis', '1.0000'),
(49, 35, 4, '47391844', 'Test Product', 'standard', NULL, '100.0000', '100.0000', '5.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '500.0000', '', '100.0000', NULL, 1, 'Pis', '5.0000'),
(50, 36, 1, '07009110', 'samsung S Duos', 'standard', NULL, '2500.0000', '2650.0000', '1.0000', 1, '150.0000', 3, '6.0000%', '0', '0.0000', '2650.0000', '', '2500.0000', NULL, 1, 'Pis', '1.0000'),
(51, 37, 3, '85086124', 'Bread', 'standard', NULL, '22.7273', '25.0000', '1.0000', 1, '2.2727', 2, '10.0000%', '0', '0.0000', '25.0000', '', '25.0000', NULL, 1, 'Pis', '1.0000'),
(52, 37, 1, '07009110', 'samsung S Duos', 'standard', NULL, '2500.0000', '2650.0000', '1.0000', 1, '150.0000', 3, '6.0000%', '0', '0.0000', '2650.0000', '', '2500.0000', NULL, 1, 'Pis', '1.0000'),
(53, 37, 1, '07009110', 'samsung S Duos', 'standard', NULL, '2500.0000', '2650.0000', '1.0000', 1, '150.0000', 3, '6.0000%', '0', '0.0000', '2650.0000', '', '2500.0000', NULL, 1, 'Pis', '1.0000'),
(54, 37, 3, '85086124', 'Bread', 'standard', NULL, '22.7273', '25.0000', '1.0000', 1, '2.2727', 2, '10.0000%', '0', '0.0000', '25.0000', '', '25.0000', NULL, 1, 'Pis', '1.0000'),
(55, 38, 1, '07009110', 'samsung S Duos', 'standard', NULL, '2500.0000', '2650.0000', '1.0000', 1, '150.0000', 3, '6.0000%', '0', '0.0000', '2650.0000', '', '2500.0000', NULL, 1, 'Pis', '1.0000'),
(56, 39, 1, '07009110', 'samsung S Duos', 'standard', NULL, '2500.0000', '2650.0000', '1.0000', 1, '150.0000', 3, '6.0000%', '0', '0.0000', '2650.0000', '', '2500.0000', NULL, 1, 'Pis', '1.0000'),
(57, 40, 1, '07009110', 'samsung S Duos', 'standard', NULL, '2500.0000', '2650.0000', '1.0000', 1, '150.0000', 3, '6.0000%', '0', '0.0000', '2650.0000', '', '2500.0000', NULL, 1, 'Pis', '1.0000'),
(58, 40, 3, '85086124', 'Bread', 'standard', NULL, '22.7273', '25.0000', '1.0000', 1, '2.2727', 2, '10.0000%', '0', '0.0000', '25.0000', '', '25.0000', NULL, 1, 'Pis', '1.0000'),
(59, 41, 1, '07009110', 'samsung S Duos', 'standard', NULL, '2500.0000', '2650.0000', '1.0000', 1, '150.0000', 3, '6.0000%', '0', '0.0000', '2650.0000', '', '2500.0000', NULL, 1, 'Pis', '1.0000'),
(60, 42, 3, '85086124', 'Bread', 'standard', NULL, '22.7273', '25.0000', '1.0000', 1, '2.2727', 2, '10.0000%', '0', '0.0000', '25.0000', '', '25.0000', NULL, 1, 'Pis', '1.0000'),
(61, 42, 1, '07009110', 'samsung S Duos', 'standard', NULL, '2500.0000', '2650.0000', '1.0000', 1, '150.0000', 3, '6.0000%', '0', '0.0000', '2650.0000', '', '2500.0000', NULL, 1, 'Pis', '1.0000'),
(62, 43, 1, '07009110', 'samsung S Duos', 'standard', NULL, '2500.0000', '2650.0000', '1.0000', 1, '150.0000', 3, '6.0000%', '0', '0.0000', '2650.0000', '', '2500.0000', NULL, 1, 'Pis', '1.0000'),
(63, 44, 1, '07009110', 'samsung S Duos', 'standard', NULL, '2500.0000', '2650.0000', '1.0000', 1, '150.0000', 3, '6.0000%', '0', '0.0000', '2650.0000', '', '2500.0000', NULL, 1, 'Pis', '1.0000'),
(64, 45, 20, '74964595', ' tooth paste', 'standard', NULL, '80.0000', '80.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '80.0000', '', '80.0000', NULL, 1, 'Pis', '1.0000'),
(65, 46, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '7.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '420.0000', '', '60.0000', NULL, 1, 'Pis', '7.0000'),
(66, 47, 24, '84773365', 'sultana bulk', 'standard', NULL, '220.0000', '220.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '220.0000', '', '220.0000', NULL, 1, 'Pis', '1.0000'),
(67, 48, 26, '60275895', 'KETCHUP(PRATIMA)', 'standard', NULL, '200.0000', '200.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '200.0000', '', '200.0000', NULL, 2, 'kg', '1.0000'),
(68, 49, 27, '15955134', 'dabur honey(pratima)', 'standard', NULL, '300.0000', '300.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '300.0000', '', '300.0000', NULL, 1, 'Pis', '1.0000'),
(69, 50, 27, '15955134', 'dabur honey(pratima)', 'standard', NULL, '300.0000', '300.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '300.0000', '', '300.0000', NULL, 1, 'Pis', '1.0000'),
(70, 51, 28, '77982237', 'eno lemon', 'standard', NULL, '27.0000', '27.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '27.0000', '', '27.0000', NULL, 1, 'Pis', '1.0000'),
(71, 52, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(72, 53, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(73, 54, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(74, 55, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(75, 56, 23, '33817050', 'tata tea gold(1kg)', 'standard', NULL, '150.0000', '150.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '150.0000', '', '150.0000', NULL, 2, 'kg', '1.0000'),
(76, 56, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(77, 57, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(78, 58, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(79, 58, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(80, 59, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(81, 60, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(82, 61, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(83, 62, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(84, 63, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(85, 64, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(86, 65, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(87, 66, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(88, 67, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(89, 68, 29, '25144924', 'gits jilebi', 'standard', NULL, '150.0000', '150.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '150.0000', '', '150.0000', NULL, 2, 'kg', '1.0000'),
(90, 69, 30, '03445420', 'durga pooja pack', 'standard', NULL, '50.0000', '50.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '50.0000', '', '50.0000', NULL, 1, 'Pis', '1.0000'),
(91, 70, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(92, 71, 1, '07009110', 'samsung S Duos', 'standard', 0, '2500.0000', '2500.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '2500.0000', '', '2500.0000', NULL, 1, 'Pis', '1.0000'),
(93, 71, 2, '88863516', 'Milk', 'standard', 0, '36.0000', '36.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '36.0000', '', '36.0000', NULL, 1, 'Pis', '1.0000'),
(94, 72, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(95, 73, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(96, 73, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(97, 74, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(98, 74, 1, '07009110', 'samsung S Duos', 'standard', NULL, '300.0000', '318.0000', '1.0000', 1, '18.0000', 3, '6.0000%', '0', '0.0000', '318.0000', '', '300.0000', NULL, 1, 'Pis', '1.0000'),
(99, 75, 14, 'tea100', 'tea-100', 'standard', NULL, '40.0000', '40.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '40.0000', '', '40.0000', NULL, 1, 'Pis', '1.0000'),
(100, 76, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(101, 77, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(102, 78, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(103, 79, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(104, 80, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(105, 81, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(106, 82, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(107, 82, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(108, 83, 14, 'tea100', 'tea-100', 'standard', NULL, '40.0000', '40.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '40.0000', '', '40.0000', NULL, 1, 'Pis', '1.0000'),
(109, 83, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(110, 84, 14, 'tea100', 'tea-100', 'standard', NULL, '40.0000', '40.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '40.0000', '', '40.0000', NULL, 1, 'Pis', '1.0000'),
(111, 84, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(112, 85, 14, 'tea100', 'tea-100', 'standard', NULL, '40.0000', '40.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '40.0000', '', '40.0000', NULL, 1, 'Pis', '1.0000'),
(113, 85, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(114, 86, 14, 'tea100', 'tea-100', 'standard', NULL, '40.0000', '40.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '40.0000', '', '40.0000', NULL, 1, 'Pis', '1.0000'),
(115, 86, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(116, 87, 14, 'tea100', 'tea-100', 'standard', NULL, '40.0000', '40.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '40.0000', '', '40.0000', NULL, 1, 'Pis', '1.0000'),
(117, 87, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(118, 88, 14, 'tea100', 'tea-100', 'standard', NULL, '40.0000', '40.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '40.0000', '', '40.0000', NULL, 1, 'Pis', '1.0000'),
(119, 88, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(120, 89, 14, 'tea100', 'tea-100', 'standard', NULL, '40.0000', '40.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '40.0000', '', '40.0000', NULL, 1, 'Pis', '1.0000'),
(121, 89, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(122, 90, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(123, 90, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(124, 91, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(125, 91, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(126, 92, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(127, 93, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(128, 94, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(129, 94, 1, '07009110', 'samsung S Duos', 'standard', NULL, '300.0000', '318.0000', '1.0000', 1, '18.0000', 3, '6.0000%', '0', '0.0000', '318.0000', '', '300.0000', NULL, 1, 'Pis', '1.0000'),
(130, 95, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(131, 96, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(132, 97, 18, '10824603', 'bajaj almond oil', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(133, 98, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(134, 99, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(135, 100, 12, '57176110', 'Clinic Plus 100 ML', 'standard', NULL, '81.8182', '90.0000', '1.0000', 1, '8.1818', 2, '10.0000%', '0', '0.0000', '90.0000', '', '90.0000', NULL, 1, 'Pis', '1.0000'),
(136, 101, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(137, 102, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(138, 103, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(139, 104, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(140, 105, 30, '03445420', 'durga pooja pack', 'standard', NULL, '50.0000', '50.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '50.0000', '', '50.0000', NULL, 1, 'Pis', '1.0000'),
(141, 105, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(142, 106, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(143, 106, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(144, 107, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(145, 108, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(146, 109, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '2.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '120.0000', '', '60.0000', NULL, 1, 'Pis', '2.0000'),
(147, 110, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(148, 111, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(149, 112, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(150, 113, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(151, 114, 14, 'tea100', 'tea-100', 'standard', NULL, '40.0000', '40.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '40.0000', '', '40.0000', NULL, 1, 'Pis', '1.0000'),
(152, 114, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(153, 115, 14, 'tea100', 'tea-100', 'standard', NULL, '40.0000', '40.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '40.0000', '', '40.0000', NULL, 1, 'Pis', '1.0000'),
(154, 115, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(155, 116, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(156, 117, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(157, 118, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(158, 119, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(159, 120, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(160, 121, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(161, 122, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(162, 123, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(163, 124, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(164, 125, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(165, 126, 12, '57176110', 'Clinic Plus 100 ML', 'standard', NULL, '81.8182', '90.0000', '1.0000', 1, '8.1818', 2, '10.0000%', '0', '0.0000', '90.0000', '', '90.0000', NULL, 1, 'Pis', '1.0000'),
(166, 126, 12, '57176110', 'Clinic Plus 100 ML', 'standard', NULL, '81.8182', '90.0000', '1.0000', 1, '8.1818', 2, '10.0000%', '0', '0.0000', '90.0000', '', '90.0000', NULL, 1, 'Pis', '1.0000'),
(167, 126, 12, '57176110', 'Clinic Plus 100 ML', 'standard', NULL, '81.8182', '90.0000', '1.0000', 1, '8.1818', 2, '10.0000%', '0', '0.0000', '90.0000', '', '90.0000', NULL, 1, 'Pis', '1.0000'),
(168, 126, 18, '10824603', 'bajaj almond oil', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(169, 127, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(170, 128, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(171, 128, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(172, 129, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(173, 130, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '13.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '780.0000', '', '60.0000', NULL, 1, 'Pis', '13.0000'),
(174, 131, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(175, 132, 12, '57176110', 'Clinic Plus 100 ML', 'standard', NULL, '81.8182', '90.0000', '1.0000', 1, '8.1818', 2, '10.0000%', '0', '0.0000', '90.0000', '', '90.0000', NULL, 1, 'Pis', '1.0000'),
(176, 133, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(177, 134, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(178, 135, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(179, 136, 12, '57176110', 'Clinic Plus 100 ML', 'standard', NULL, '81.8182', '90.0000', '1.0000', 1, '8.1818', 2, '10.0000%', '0', '0.0000', '90.0000', '', '90.0000', NULL, 1, 'Pis', '1.0000'),
(180, 137, 17, '43376029', 'Biscuits bourbon(100gm)', 'standard', NULL, '40.0000', '40.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '40.0000', '', '40.0000', NULL, 1, 'Pis', '1.0000'),
(181, 138, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(182, 139, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(183, 139, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '2.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '120.0000', '', '60.0000', NULL, 1, 'Pis', '2.0000'),
(184, 140, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(185, 141, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(186, 142, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(187, 143, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(188, 144, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(189, 145, 30, '03445420', 'durga pooja pack', 'standard', NULL, '50.0000', '50.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '50.0000', '', '50.0000', NULL, 1, 'Pis', '1.0000'),
(190, 145, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(191, 146, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(192, 147, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(193, 148, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(194, 149, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(195, 149, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(196, 150, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(197, 151, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(198, 152, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(199, 153, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(200, 154, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(201, 155, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(202, 156, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(203, 157, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(204, 158, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(205, 159, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(206, 160, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(207, 161, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(208, 162, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(209, 163, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(210, 164, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(211, 165, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(212, 166, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(213, 167, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(214, 168, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(215, 169, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(216, 170, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(217, 171, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(218, 172, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(219, 173, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(220, 174, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(221, 175, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(222, 176, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(223, 177, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(224, 178, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(225, 179, 12, '57176110', 'Clinic Plus 100 ML', 'standard', NULL, '81.8182', '90.0000', '1.0000', 1, '8.1818', 2, '10.0000%', '0', '0.0000', '90.0000', '', '90.0000', NULL, 1, 'Pis', '1.0000'),
(226, 180, 17, '43376029', 'Biscuits bourbon(100gm)', 'standard', NULL, '40.0000', '40.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '40.0000', '', '40.0000', NULL, 1, 'Pis', '1.0000'),
(227, 181, 28, '77982237', 'eno lemon', 'standard', NULL, '27.0000', '27.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '27.0000', '', '27.0000', NULL, 1, 'Pis', '1.0000'),
(228, 182, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(229, 183, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(230, 184, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(231, 185, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(232, 186, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(233, 187, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(234, 188, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(235, 189, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(236, 190, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(237, 191, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(238, 192, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(239, 193, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(240, 194, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(241, 195, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(242, 196, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(243, 197, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(244, 198, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(245, 198, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(246, 199, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(247, 200, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(248, 201, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(249, 202, 4294967295, '12345', 'Gift Card', 'manual', 0, '10.0000', '10.0000', '0.0000', 1, '0.0000', 0, '', '0', '0.0000', '10.0000', '', '10.0000', NULL, 0, NULL, '1.0000'),
(250, 202, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(251, 203, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(252, 204, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(253, 205, 4294967295, '123456789', 'Gift Card', 'manual', 0, '10.0000', '10.0000', '0.0000', 1, '0.0000', 0, '', '0', '0.0000', '10.0000', '', '10.0000', NULL, 0, NULL, '1.0000'),
(254, 205, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(255, 206, 4294967295, '3790527574474598', 'Gift Card', 'manual', 0, '10.0000', '10.0000', '0.0000', 1, '0.0000', 0, '', '0', '0.0000', '10.0000', '', '10.0000', NULL, 0, NULL, '1.0000'),
(256, 206, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(257, 207, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(258, 207, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(259, 208, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(260, 208, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(261, 209, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(262, 210, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(263, 211, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(264, 212, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(265, 213, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(266, 214, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000');
INSERT INTO `sma_sale_items` (`id`, `sale_id`, `product_id`, `product_code`, `product_name`, `product_type`, `option_id`, `net_unit_price`, `unit_price`, `quantity`, `warehouse_id`, `item_tax`, `tax_rate_id`, `tax`, `discount`, `item_discount`, `subtotal`, `serial_no`, `real_unit_price`, `sale_item_id`, `product_unit_id`, `product_unit_code`, `unit_quantity`) VALUES
(267, 215, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(268, 216, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(269, 217, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(270, 218, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(271, 219, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(272, 220, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(273, 221, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(274, 222, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(275, 223, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(276, 224, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(277, 225, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(278, 226, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(279, 227, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(280, 228, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(281, 229, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(282, 230, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(283, 231, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(284, 232, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(285, 232, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(286, 233, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(287, 234, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(288, 235, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(289, 236, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '15.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '900.0000', '', '60.0000', NULL, 1, 'Pis', '15.0000'),
(290, 237, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(291, 238, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(292, 239, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(293, 240, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(294, 241, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(295, 242, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(296, 243, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(297, 244, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(298, 245, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(299, 245, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(300, 246, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(301, 247, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(302, 248, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(303, 249, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(304, 250, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(305, 251, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(306, 252, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(307, 253, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(308, 254, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(309, 255, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(310, 256, 28, '77982237', 'eno lemon', 'standard', NULL, '27.0000', '27.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '27.0000', '', '27.0000', NULL, 1, 'Pis', '1.0000'),
(311, 256, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(312, 257, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(313, 258, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(314, 259, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(315, 260, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(316, 261, 12, '57176110', 'Clinic Plus 100 ML', 'standard', NULL, '81.8182', '90.0000', '1.0000', 1, '8.1818', 2, '10.0000%', '0', '0.0000', '90.0000', '', '90.0000', NULL, 1, 'Pis', '1.0000'),
(317, 262, 12, '57176110', 'Clinic Plus 100 ML', 'standard', NULL, '81.8182', '90.0000', '1.0000', 1, '8.1818', 2, '10.0000%', '0', '0.0000', '90.0000', '', '90.0000', NULL, 1, 'Pis', '1.0000'),
(318, 262, 18, '10824603', 'bajaj almond oil', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(319, 263, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(320, 264, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(321, 264, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(322, 265, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(323, 266, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(324, 267, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(325, 268, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(326, 269, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(327, 270, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(328, 271, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(329, 272, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(330, 273, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(331, 274, 18, '10824603', 'bajaj almond oil', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(332, 275, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(333, 276, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(334, 277, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(335, 278, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(336, 279, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(337, 280, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(338, 281, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(339, 282, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(340, 283, 12, '57176110', 'Clinic Plus 100 ML', 'standard', NULL, '81.8182', '90.0000', '1.0000', 1, '8.1818', 2, '10.0000%', '0', '0.0000', '90.0000', '', '90.0000', NULL, 1, 'Pis', '1.0000'),
(341, 284, 16, '81567325', 'golden tea(200)', 'standard', 0, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 2, 'kg', '1.0000'),
(342, 285, 16, '81567325', 'golden tea(200)', 'standard', NULL, '0.0000', '0.0000', '0.0010', 1, '0.0000', 1, '0.0000', '0', '0.0000', '0.0000', '', '60.0000', NULL, 3, 'grm', '1.0000'),
(343, 286, 16, '81567325', 'golden tea(200)', 'standard', NULL, '0.0000', '0.0000', '0.0010', 1, '0.0000', 1, '0.0000', '0', '0.0000', '0.0000', '', '60.0000', NULL, 3, 'grm', '1.0000'),
(344, 287, 16, '81567325', 'golden tea(200)', 'standard', NULL, '0.0000', '0.0000', '0.0010', 1, '0.0000', 1, '0.0000', '0', '0.0000', '0.0000', '', '60.0000', NULL, 3, 'grm', '1.0000'),
(345, 288, 16, '81567325', 'golden tea(200)', 'standard', NULL, '0.0000', '0.0000', '0.0010', 1, '0.0000', 1, '0.0000', '0', '0.0000', '0.0000', '', '60.0000', NULL, 3, 'grm', '1.0000'),
(346, 289, 16, '81567325', 'golden tea(200)', 'standard', NULL, '0.0000', '0.0000', '0.0010', 1, '0.0000', 1, '0.0000', '0', '0.0000', '0.0000', '', '60.0000', NULL, 3, 'grm', '1.0000'),
(347, 290, 16, '81567325', 'golden tea(200)', 'standard', NULL, '0.0000', '0.0000', '0.0010', 1, '0.0000', 1, '0.0000', '0', '0.0000', '0.0000', '', '60.0000', NULL, 3, 'grm', '1.0000'),
(348, 291, 16, '81567325', 'golden tea(200)', 'standard', 0, '50.0000', '50.0000', '0.0010', 1, '0.0000', 1, '0.0000', '0', '0.0000', '50.0000', '', '50.0000', NULL, 3, 'grm', '1.0000'),
(349, 292, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 2, 'kg', '1.0000'),
(350, 293, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 2, 'kg', '1.0000'),
(351, 294, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 2, 'kg', '1.0000'),
(352, 295, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 2, 'kg', '1.0000'),
(353, 296, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 2, 'kg', '1.0000'),
(354, 297, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 2, 'kg', '1.0000'),
(355, 298, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 2, 'kg', '1.0000'),
(356, 299, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 2, 'kg', '1.0000'),
(357, 300, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 2, 'kg', '1.0000'),
(358, 301, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 2, 'kg', '1.0000'),
(359, 302, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 2, 'kg', '1.0000'),
(360, 303, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 2, 'kg', '1.0000'),
(361, 304, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 2, 'kg', '1.0000'),
(362, 305, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 2, 'kg', '1.0000'),
(363, 306, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 2, 'kg', '1.0000'),
(364, 307, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 2, 'kg', '1.0000'),
(365, 308, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 2, 'kg', '1.0000'),
(366, 308, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 2, 'kg', '1.0000'),
(367, 309, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 2, 'kg', '1.0000'),
(368, 310, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 2, 'kg', '1.0000'),
(369, 311, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 2, 'kg', '1.0000'),
(370, 312, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 2, 'kg', '1.0000'),
(371, 313, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 2, 'kg', '1.0000'),
(372, 314, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 2, 'kg', '1.0000'),
(373, 314, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 2, 'kg', '1.0000'),
(374, 315, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 2, 'kg', '1.0000'),
(375, 316, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 2, 'kg', '1.0000'),
(376, 317, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 2, 'kg', '1.0000'),
(377, 318, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 2, 'kg', '1.0000'),
(378, 319, 28, '77982237', 'eno lemon', 'standard', NULL, '27.0000', '27.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '27.0000', '', '27.0000', NULL, 1, 'Pis', '1.0000'),
(379, 320, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 2, 'kg', '1.0000'),
(380, 321, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 2, 'kg', '1.0000'),
(381, 322, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 2, 'kg', '1.0000'),
(382, 323, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 2, 'kg', '1.0000'),
(383, 324, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 2, 'kg', '1.0000'),
(384, 325, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 2, 'kg', '1.0000'),
(385, 326, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 2, 'kg', '1.0000'),
(386, 326, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 2, 'kg', '1.0000'),
(387, 327, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 2, 'kg', '1.0000'),
(388, 328, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 2, 'kg', '1.0000'),
(389, 329, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 2, 'kg', '1.0000'),
(390, 330, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 2, 'kg', '1.0000'),
(391, 331, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 2, 'kg', '1.0000'),
(392, 332, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 2, 'kg', '1.0000'),
(393, 333, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 2, 'kg', '1.0000'),
(394, 334, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 2, 'kg', '1.0000'),
(395, 335, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 2, 'kg', '1.0000'),
(396, 336, 27, '15955134', 'dabur honey(pratima)', 'standard', NULL, '300.0000', '300.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '300.0000', '', '300.0000', NULL, 1, 'Pis', '1.0000'),
(397, 336, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 2, 'kg', '1.0000'),
(398, 337, 12, '57176110', 'Clinic Plus 100 ML', 'standard', NULL, '81.8182', '90.0000', '1.0000', 1, '8.1818', 2, '10.0000%', '0', '0.0000', '90.0000', '', '90.0000', NULL, 1, 'Pis', '1.0000'),
(399, 337, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 2, 'kg', '1.0000'),
(400, 338, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 2, 'kg', '1.0000'),
(401, 339, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 2, 'kg', '1.0000'),
(402, 340, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 2, 'kg', '1.0000'),
(403, 341, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 2, 'kg', '1.0000'),
(404, 342, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 2, 'kg', '1.0000'),
(405, 343, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 2, 'kg', '1.0000'),
(406, 344, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 2, 'kg', '1.0000'),
(407, 345, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 2, 'kg', '1.0000'),
(408, 346, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 2, 'kg', '1.0000'),
(409, 347, 15, '28403364', 'golden(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(410, 348, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 2, 'kg', '1.0000'),
(411, 349, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '5.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '300.0000', '', '60.0000', NULL, 2, 'kg', '5.0000'),
(412, 350, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 2, 'kg', '1.0000'),
(413, 351, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 2, 'kg', '1.0000'),
(414, 352, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 2, 'kg', '1.0000'),
(415, 352, 15, '28403364', 'golden(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(416, 352, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 2, 'kg', '1.0000'),
(417, 353, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 2, 'kg', '1.0000'),
(418, 354, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 2, 'kg', '1.0000'),
(419, 355, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 2, 'kg', '1.0000'),
(420, 355, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 2, 'kg', '1.0000'),
(421, 356, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 2, 'kg', '1.0000'),
(422, 357, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 2, 'kg', '1.0000'),
(423, 358, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 2, 'kg', '1.0000'),
(424, 359, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 2, 'kg', '1.0000'),
(425, 360, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 2, 'kg', '1.0000'),
(426, 361, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 2, 'kg', '1.0000'),
(427, 362, 4294967295, 'sdsd seds sd s ds dss ds dd sd s ds ', 'sdsd seds sd s ds dss ds dd sd s ds ', 'manual', 0, '20.0000', '20.0000', '0.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '100.0000', '', '20.0000', NULL, 0, NULL, '5.0000'),
(428, 362, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 2, 'kg', '1.0000'),
(429, 362, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 2, 'kg', '1.0000'),
(430, 363, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 2, 'kg', '1.0000'),
(431, 364, 15, '28403364', 'golden (200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(432, 364, 15, '28403364', 'golden (200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(433, 365, 14, 'tea100', 'tea-100', 'standard', NULL, '40.0000', '40.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '40.0000', '', '40.0000', NULL, 1, 'Pis', '1.0000'),
(434, 366, 15, '28403364', 'golden (200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(435, 367, 4294967295, 'tea', 'tea', 'manual', 0, '10.0000', '10.0000', '0.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '1000.0000', '', '10.0000', NULL, 0, NULL, '100.0000'),
(436, 368, 3, '85086124', 'Bread', 'standard', NULL, '9.0909', '10.0000', '1.0000', 1, '0.9091', 2, '10.0000%', '0', '0.0000', '10.0000', '', '10.0000', NULL, 1, 'Pis', '1.0000'),
(437, 369, 15, '28403364', 'golden (200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(438, 369, 15, '28403364', 'golden (200)', 'standard', NULL, '60.0000', '60.0000', '6.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '360.0000', '', '60.0000', NULL, 1, 'Pis', '6.0000'),
(439, 370, 15, '28403364', 'golden (200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(440, 371, 15, '28403364', 'golden (200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(441, 371, 15, '28403364', 'golden (200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(442, 371, 15, '28403364', 'golden (200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(443, 372, 15, '28403364', 'golden (200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(444, 373, 15, '28403364', 'golden (200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(445, 373, 15, '28403364', 'golden (200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(446, 373, 15, '28403364', 'golden (200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(447, 374, 22, '51511218', 'gugal dhoop sticks', 'standard', NULL, '450.0000', '450.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '450.0000', '', '450.0000', NULL, 1, 'Pis', '1.0000'),
(448, 375, 15, '28403364', 'golden (200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(449, 376, 15, '28403364', 'golden (200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(450, 376, 15, '28403364', 'golden (200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(451, 377, 28, '77982237', 'eno lemon', 'standard', NULL, '27.0000', '27.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '27.0000', '', '27.0000', NULL, 1, 'Pis', '1.0000'),
(452, 377, 26, '60275895', 'KETCHUP(PRATIMA)', 'standard', NULL, '200.0000', '200.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '200.0000', '', '200.0000', NULL, 2, 'kg', '1.0000'),
(453, 378, 15, '28403364', 'golden (200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(454, 379, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 2, 'kg', '1.0000'),
(455, 379, 15, '28403364', 'golden (200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(456, 380, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 2, 'kg', '1.0000'),
(457, 380, 15, '28403364', 'golden (200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(458, 381, 15, '28403364', 'golden (200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(459, 381, 15, '28403364', 'golden (200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(460, 382, 15, '28403364', 'golden (200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(461, 383, 15, '28403364', 'golden (200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(462, 384, 15, '28403364', 'golden (200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(463, 385, 15, '28403364', 'golden (200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(464, 386, 15, '28403364', 'golden (200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(465, 387, 15, '28403364', 'golden (200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(466, 388, 15, '28403364', 'golden (200)', 'standard', NULL, '60.0000', '60.0000', '5.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '300.0000', '', '60.0000', NULL, 1, 'Pis', '5.0000'),
(467, 389, 15, '28403364', 'golden (200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(468, 390, 22, '51511218', 'gugal dhoop sticks', 'standard', NULL, '450.0000', '450.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '450.0000', '', '450.0000', NULL, 1, 'Pis', '1.0000'),
(469, 391, 14, 'tea100', 'tea-100', 'standard', NULL, '40.0000', '40.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '40.0000', '', '40.0000', NULL, 1, 'Pis', '1.0000'),
(470, 391, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 2, 'kg', '1.0000'),
(471, 392, 4, '47391844', 'Test Product', 'standard', NULL, '0.0000', '0.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '0.0000', '', '0.0000', NULL, 1, 'Pis', '1.0000'),
(472, 393, 15, '28403364', 'golden (200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 1, 'Pis', '1.0000'),
(473, 393, 16, '81567325', 'golden tea(200)', 'standard', NULL, '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', '60.0000', NULL, 2, 'kg', '1.0000');

-- --------------------------------------------------------

--
-- Table structure for table `sma_sessions`
--

CREATE TABLE IF NOT EXISTS `sma_sessions` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) unsigned NOT NULL DEFAULT '0',
  `data` blob NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ci_sessions_timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_sessions`
--

INSERT INTO `sma_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('0294665a8cb3b510aee0a219b73b6c878078b79c', '103.252.168.5', 1484725704, 0x5f5f63695f6c6173745f726567656e65726174657c693a313438343732353632363b7265717565737465645f706167657c733a333a22706f73223b6964656e746974797c733a363a22677773313233223b757365726e616d657c733a363a22677773313233223b656d61696c7c733a32333a2263686574616e406772656174776562736f66742e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343834373231333730223b6c6173745f69707c733a31343a223131322e3133332e3235312e3535223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313438343732353639313b72656769737465725f69647c733a313a2237223b636173685f696e5f68616e647c733a393a22323030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30312d30362030303a30323a3335223b),
('04092f56e64f0157282b3e181e86116255937f20', '103.252.168.5', 1484723436, 0x5f5f63695f6c6173745f726567656e65726174657c693a313438343732333433363b7265717565737465645f706167657c733a303a22223b),
('0456d149a3427ad99cd4c04c11b2637fd4fdf9cc', '103.252.168.5', 1484728471, 0x5f5f63695f6c6173745f726567656e65726174657c693a313438343732383435303b7265717565737465645f706167657c733a333a22706f73223b6964656e746974797c733a363a22677773313233223b757365726e616d657c733a363a22677773313233223b656d61696c7c733a32333a2263686574616e406772656174776562736f66742e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343834373231333730223b6c6173745f69707c733a31343a223131322e3133332e3235312e3535223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313438343732383436313b72656769737465725f69647c733a313a2237223b636173685f696e5f68616e647c733a393a22323030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30312d30362030303a30323a3335223b),
('0cd6db84fa579d861f4a2fa3a1d90741c57021d4', '103.252.168.5', 1484723657, 0x5f5f63695f6c6173745f726567656e65726174657c693a313438343732333635373b7265717565737465645f706167657c733a303a22223b),
('1672a29cda6fd0e66f87c4f412e0b34e65e70185', '103.252.168.5', 1484725626, 0x5f5f63695f6c6173745f726567656e65726174657c693a313438343732353632363b7265717565737465645f706167657c733a333a22706f73223b6964656e746974797c733a363a22677773313233223b757365726e616d657c733a363a22677773313233223b656d61696c7c733a32333a2263686574616e406772656174776562736f66742e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343834373231333730223b6c6173745f69707c733a31343a223131322e3133332e3235312e3535223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313438343732353632363b72656769737465725f69647c733a313a2237223b636173685f696e5f68616e647c733a393a22323030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30312d30362030303a30323a3335223b),
('25a1f80f0877c01319c1eeccda5050364874ad6b', '173.225.177.223', 1484726431, 0x5f5f63695f6c6173745f726567656e65726174657c693a313438343732363433313b7265717565737465645f706167657c733a333a22706f73223b),
('26c0c7cbec9c86b828757ac7afbe88028c14eec9', '23.99.101.118', 1484723405, 0x5f5f63695f6c6173745f726567656e65726174657c693a313438343732333430353b),
('276757562cb29deb44fb4776fcbc6159336611ca', '103.252.168.5', 1484723432, 0x5f5f63695f6c6173745f726567656e65726174657c693a313438343732333432333b),
('2df733f919c2cc2cb93170d8d6f0e69f36566b2f', '103.252.168.5', 1484725626, 0x5f5f63695f6c6173745f726567656e65726174657c693a313438343732353632363b7265717565737465645f706167657c733a333a22706f73223b6964656e746974797c733a363a22677773313233223b757365726e616d657c733a363a22677773313233223b656d61696c7c733a32333a2263686574616e406772656174776562736f66742e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343834373231333730223b6c6173745f69707c733a31343a223131322e3133332e3235312e3535223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313438343732353632363b72656769737465725f69647c733a313a2237223b636173685f696e5f68616e647c733a393a22323030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30312d30362030303a30323a3335223b),
('30580dea44861ec1e53767656c514514a6510c22', '103.252.168.5', 1484728497, 0x5f5f63695f6c6173745f726567656e65726174657c693a313438343732383437393b6964656e746974797c733a363a22677773313233223b757365726e616d657c733a363a22677773313233223b656d61696c7c733a32333a2263686574616e406772656174776562736f66742e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343834373233363635223b6c6173745f69707c733a31333a223130332e3235322e3136382e35223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313438343732383439303b72656769737465725f69647c733a313a2237223b636173685f696e5f68616e647c733a393a22323030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30312d30362030303a30323a3335223b),
('331d36316144d6e202032cbb1ecd1a9f08398b1d', '103.252.168.5', 1484725625, 0x5f5f63695f6c6173745f726567656e65726174657c693a313438343732353632353b7265717565737465645f706167657c733a333a22706f73223b6964656e746974797c733a363a22677773313233223b757365726e616d657c733a363a22677773313233223b656d61696c7c733a32333a2263686574616e406772656174776562736f66742e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343834373231333730223b6c6173745f69707c733a31343a223131322e3133332e3235312e3535223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313438343732353632353b72656769737465725f69647c733a313a2237223b636173685f696e5f68616e647c733a393a22323030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30312d30362030303a30323a3335223b),
('389b7ff83ed7927bf5505a11864b95bb3cb6e1f2', '103.252.168.5', 1484722260, 0x5f5f63695f6c6173745f726567656e65726174657c693a313438343732323236303b7265717565737465645f706167657c733a303a22223b),
('3b882464b01553a49232958471977f6aaa24e4c8', '173.225.177.223', 1484728448, 0x5f5f63695f6c6173745f726567656e65726174657c693a313438343732383434383b7265717565737465645f706167657c733a333a22706f73223b),
('3c5911e1eb2d01fddd636d23a7b02b00a530e2c4', '103.252.168.5', 1484722396, 0x5f5f63695f6c6173745f726567656e65726174657c693a313438343732323339363b),
('3cf0d065f9ec47cc530bc884c38f571a219b03a4', '23.99.101.118', 1484723760, 0x5f5f63695f6c6173745f726567656e65726174657c693a313438343732333736303b7265717565737465645f706167657c733a303a22223b),
('483a6b0efabb0f0e009aad6b5067c24cdee3609b', '103.252.168.5', 1484724245, 0x5f5f63695f6c6173745f726567656e65726174657c693a313438343732343234353b7265717565737465645f706167657c733a333a22706f73223b6964656e746974797c733a363a22677773313233223b757365726e616d657c733a363a22677773313233223b656d61696c7c733a32333a2263686574616e406772656174776562736f66742e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343834373231333730223b6c6173745f69707c733a31343a223131322e3133332e3235312e3535223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313438343732343234353b72656769737465725f69647c733a313a2237223b636173685f696e5f68616e647c733a393a22323030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30312d30362030303a30323a3335223b),
('49779131ffe3caf73fcb082747139780f8404355', '112.133.251.55', 1484721716, 0x5f5f63695f6c6173745f726567656e65726174657c693a313438343732313334353b7265717565737465645f706167657c733a333a22706f73223b6964656e746974797c733a363a22677773313233223b757365726e616d657c733a363a22677773313233223b656d61696c7c733a32333a2263686574616e406772656174776562736f66742e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343834373138323136223b6c6173745f69707c733a31333a223130332e3235322e3136382e35223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313438343732313731363b72656769737465725f69647c733a313a2237223b636173685f696e5f68616e647c733a393a22323030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30312d30362030303a30323a3335223b),
('5487436dc6915157fa4f139f16706dc8dfe7be4f', '103.252.168.5', 1484723561, 0x5f5f63695f6c6173745f726567656e65726174657c693a313438343732333335313b7265717565737465645f706167657c733a303a22223b),
('5b27411ed69592efd196cf81e69c2f693fc72821', '103.252.168.5', 1484725626, 0x5f5f63695f6c6173745f726567656e65726174657c693a313438343732353632363b7265717565737465645f706167657c733a333a22706f73223b6964656e746974797c733a363a22677773313233223b757365726e616d657c733a363a22677773313233223b656d61696c7c733a32333a2263686574616e406772656174776562736f66742e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343834373231333730223b6c6173745f69707c733a31343a223131322e3133332e3235312e3535223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313438343732353632363b72656769737465725f69647c733a313a2237223b636173685f696e5f68616e647c733a393a22323030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30312d30362030303a30323a3335223b),
('66fe85b6ec44c7b066bbcf77a8d4ae4cdeddab4b', '103.252.168.5', 1484724475, 0x5f5f63695f6c6173745f726567656e65726174657c693a313438343732343437353b7265717565737465645f706167657c733a333a22706f73223b),
('6a126b01bcb675c8cf90e97e3bac4b46cbf0ca08', '82.145.223.56', 1484724767, 0x5f5f63695f6c6173745f726567656e65726174657c693a313438343732343638333b7265717565737465645f706167657c733a333a22706f73223b6964656e746974797c733a363a22677773313233223b757365726e616d657c733a363a22677773313233223b656d61696c7c733a32333a2263686574616e406772656174776562736f66742e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343834373233383134223b6c6173745f69707c733a31333a223130332e3235322e3136382e35223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313438343732343736333b72656769737465725f69647c733a313a2237223b636173685f696e5f68616e647c733a393a22323030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30312d30362030303a30323a3335223b),
('6e5de875198c03cdb2d73371edc08bd8638efa8b', '103.252.168.5', 1484723669, 0x5f5f63695f6c6173745f726567656e65726174657c693a313438343732333631383b),
('71406c8091ea54a95e1609422229b52171e7f824', '23.99.101.118', 1484723761, 0x5f5f63695f6c6173745f726567656e65726174657c693a313438343732333736313b),
('728b0e3c91aee401a7aa3b4b77eec492a2537cc7', '112.133.251.55', 1484724715, 0x5f5f63695f6c6173745f726567656e65726174657c693a313438343732343730393b7265717565737465645f706167657c733a333a22706f73223b6964656e746974797c733a363a22677773313233223b757365726e616d657c733a363a22677773313233223b656d61696c7c733a32333a2263686574616e406772656174776562736f66742e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343834373138323136223b6c6173745f69707c733a31333a223130332e3235322e3136382e35223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313438343732343730393b72656769737465725f69647c733a313a2237223b636173685f696e5f68616e647c733a393a22323030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30312d30362030303a30323a3335223b),
('72e1b41cf374e5ce3c32e03bb97c662d9d3d0611', '103.252.168.5', 1484724245, 0x5f5f63695f6c6173745f726567656e65726174657c693a313438343732343234353b7265717565737465645f706167657c733a333a22706f73223b6964656e746974797c733a363a22677773313233223b757365726e616d657c733a363a22677773313233223b656d61696c7c733a32333a2263686574616e406772656174776562736f66742e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343834373231333730223b6c6173745f69707c733a31343a223131322e3133332e3235312e3535223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313438343732343234353b72656769737465725f69647c733a313a2237223b636173685f696e5f68616e647c733a393a22323030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30312d30362030303a30323a3335223b),
('73889ed6ff1c24993b857b34a08695a99e37e1db', '103.252.168.5', 1484724245, 0x5f5f63695f6c6173745f726567656e65726174657c693a313438343732343234353b7265717565737465645f706167657c733a333a22706f73223b6964656e746974797c733a363a22677773313233223b757365726e616d657c733a363a22677773313233223b656d61696c7c733a32333a2263686574616e406772656174776562736f66742e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343834373231333730223b6c6173745f69707c733a31343a223131322e3133332e3235312e3535223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313438343732343234353b72656769737465725f69647c733a313a2237223b636173685f696e5f68616e647c733a393a22323030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30312d30362030303a30323a3335223b),
('74ff54639ce3ec090679bc9bd515e853773129b2', '103.252.168.5', 1484722779, 0x5f5f63695f6c6173745f726567656e65726174657c693a313438343732323737393b),
('8126b5c339090026607a2e6c2931f9a0c7ba8369', '103.252.168.5', 1484724383, 0x5f5f63695f6c6173745f726567656e65726174657c693a313438343732343338333b),
('81f03076dc0483cbc71fa3e8728604f984c11069', '103.252.168.5', 1484723852, 0x5f5f63695f6c6173745f726567656e65726174657c693a313438343732333539383b7265717565737465645f706167657c733a333a22706f73223b6964656e746974797c733a363a22677773313233223b757365726e616d657c733a363a22677773313233223b656d61696c7c733a32333a2263686574616e406772656174776562736f66742e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343834373231333730223b6c6173745f69707c733a31343a223131322e3133332e3235312e3535223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313438343732333834313b72656769737465725f69647c733a313a2237223b636173685f696e5f68616e647c733a393a22323030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30312d30362030303a30323a3335223b),
('8223cea541173de3202322ba15a28643fb4aa40f', '173.225.177.223', 1484723898, 0x5f5f63695f6c6173745f726567656e65726174657c693a313438343732333839383b7265717565737465645f706167657c733a333a22706f73223b),
('8b9d90935a6317dc9f9dc4b24e333a249bd60236', '103.252.168.5', 1484721534, 0x5f5f63695f6c6173745f726567656e65726174657c693a313438343732313533343b7265717565737465645f706167657c733a303a22223b),
('8f32fb11cf84b6fa3917c6dce46760eaaeb2c865', '103.252.168.5', 1484725626, 0x5f5f63695f6c6173745f726567656e65726174657c693a313438343732353632363b7265717565737465645f706167657c733a333a22706f73223b6964656e746974797c733a363a22677773313233223b757365726e616d657c733a363a22677773313233223b656d61696c7c733a32333a2263686574616e406772656174776562736f66742e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343834373231333730223b6c6173745f69707c733a31343a223131322e3133332e3235312e3535223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313438343732353632363b72656769737465725f69647c733a313a2237223b636173685f696e5f68616e647c733a393a22323030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30312d30362030303a30323a3335223b),
('9399675eb6646ce5e65baa964f275c2dbc31163d', '117.247.52.22', 1484723082, 0x5f5f63695f6c6173745f726567656e65726174657c693a313438343732333038313b7265717565737465645f706167657c733a303a22223b),
('97bb1aa9aeb7a5046349a6670460a9e44213d468', '13.76.241.210', 1484727678, 0x5f5f63695f6c6173745f726567656e65726174657c693a313438343732373637383b),
('a060e74df8c74c95ea868c0f4ee0b1d651d943ef', '103.252.168.5', 1484727916, 0x5f5f63695f6c6173745f726567656e65726174657c693a313438343732333639333b6964656e746974797c733a363a22677773313233223b757365726e616d657c733a363a22677773313233223b656d61696c7c733a32333a2263686574616e406772656174776562736f66742e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343834373233363635223b6c6173745f69707c733a31333a223130332e3235322e3136382e35223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313438343732373931363b72656769737465725f69647c733a313a2237223b636173685f696e5f68616e647c733a393a22323030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30312d30362030303a30323a3335223b),
('a6db0b62a09cc25fddf7f6c9702c0b86441f5a2e', '52.22.7.208', 1484726039, 0x5f5f63695f6c6173745f726567656e65726174657c693a313438343732363033393b7265717565737465645f706167657c733a333a22706f73223b),
('a6faa44f3963ea12833fb6f9057c792fb7f4761e', '103.252.168.5', 1484722260, 0x5f5f63695f6c6173745f726567656e65726174657c693a313438343732323236303b),
('a92838c5e14138296dbc11e61391c5609ec0655b', '103.252.168.5', 1484724256, 0x5f5f63695f6c6173745f726567656e65726174657c693a313438343732343234353b7265717565737465645f706167657c733a333a22706f73223b6964656e746974797c733a363a22677773313233223b757365726e616d657c733a363a22677773313233223b656d61696c7c733a32333a2263686574616e406772656174776562736f66742e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343834373231333730223b6c6173745f69707c733a31343a223131322e3133332e3235312e3535223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313438343732343234353b72656769737465725f69647c733a313a2237223b636173685f696e5f68616e647c733a393a22323030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30312d30362030303a30323a3335223b),
('b2db3cf709a0afa84f1a8f19b69e8d86535897d1', '103.252.168.5', 1484726885, 0x5f5f63695f6c6173745f726567656e65726174657c693a313438343732363838353b7265717565737465645f706167657c733a333a22706f73223b),
('b5dd65c29cebcb70fd183ce7d37bc4632c338f94', '103.252.168.5', 1484722779, 0x5f5f63695f6c6173745f726567656e65726174657c693a313438343732323737393b7265717565737465645f706167657c733a303a22223b),
('b604ae2175a0d246fb24e9b05265784183d16984', '112.133.251.55', 1484721742, 0x5f5f63695f6c6173745f726567656e65726174657c693a313438343732313733373b7265717565737465645f706167657c733a333a22706f73223b6964656e746974797c733a363a22677773313233223b757365726e616d657c733a363a22677773313233223b656d61696c7c733a32333a2263686574616e406772656174776562736f66742e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343834373138323136223b6c6173745f69707c733a31333a223130332e3235322e3136382e35223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313438343732313733373b72656769737465725f69647c733a313a2237223b636173685f696e5f68616e647c733a393a22323030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30312d30362030303a30323a3335223b),
('bcfc2c1cddbe3177ff3f6bd02d670bdd3f05621b', '103.252.168.5', 1484723695, 0x5f5f63695f6c6173745f726567656e65726174657c693a313438343732333433303b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a363a22677773313233223b757365726e616d657c733a363a22677773313233223b656d61696c7c733a32333a2263686574616e406772656174776562736f66742e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343834373135323031223b6c6173745f69707c733a31333a223131372e3234372e35322e3232223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313438343731383231363b72656769737465725f69647c733a313a2237223b636173685f696e5f68616e647c733a393a22323030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30312d30362030303a30323a3335223b),
('bf9aa3dbd28b4234ad59b1b02745f4a83c40e5d7', '103.252.168.5', 1484730424, 0x5f5f63695f6c6173745f726567656e65726174657c693a313438343733303432333b7265717565737465645f706167657c733a333a22706f73223b),
('c11d02bc2dc29d6441ecc6f9a76c0b3ce24faadc', '103.252.168.5', 1484722395, 0x5f5f63695f6c6173745f726567656e65726174657c693a313438343732323339353b7265717565737465645f706167657c733a303a22223b),
('c248f35ae79851834afcf43a7a8cb4e492af9fb2', '103.252.168.5', 1484724245, 0x5f5f63695f6c6173745f726567656e65726174657c693a313438343732343234343b7265717565737465645f706167657c733a333a22706f73223b6964656e746974797c733a363a22677773313233223b757365726e616d657c733a363a22677773313233223b656d61696c7c733a32333a2263686574616e406772656174776562736f66742e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343834373231333730223b6c6173745f69707c733a31343a223131322e3133332e3235312e3535223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313438343732343234343b72656769737465725f69647c733a313a2237223b636173685f696e5f68616e647c733a393a22323030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30312d30362030303a30323a3335223b),
('c4796bebc9c3c0c9b69ada22f445c96e3924ab65', '103.252.168.5', 1484724677, 0x5f5f63695f6c6173745f726567656e65726174657c693a313438343732343338323b7265717565737465645f706167657c733a333a22706f73223b6964656e746974797c733a363a22677773313233223b757365726e616d657c733a363a22677773313233223b656d61696c7c733a32333a2263686574616e406772656174776562736f66742e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343834373233383134223b6c6173745f69707c733a31333a223130332e3235322e3136382e35223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313438343732343637373b72656769737465725f69647c733a313a2237223b636173685f696e5f68616e647c733a393a22323030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30312d30362030303a30323a3335223b),
('c5589fcd0ec387a167b22e7fd16785969f149404', '23.99.101.118', 1484723760, 0x5f5f63695f6c6173745f726567656e65726174657c693a313438343732333736303b7265717565737465645f706167657c733a303a22223b),
('cc0c88f0aaa232bfa8090e5acfeb04848bd4a066', '103.252.168.5', 1484721535, 0x5f5f63695f6c6173745f726567656e65726174657c693a313438343732313533353b),
('cd910641f71b445dd3d450e6963033a94cfbed2e', '52.22.7.208', 1484726015, 0x5f5f63695f6c6173745f726567656e65726174657c693a313438343732363031353b7265717565737465645f706167657c733a333a22706f73223b),
('d119b345057ed4844be95b07ff479fc786e1016f', '103.252.168.5', 1484724476, 0x5f5f63695f6c6173745f726567656e65726174657c693a313438343732343437363b),
('d43f2a226a402e2724d0d2838a99a7c8c9c19500', '103.252.168.5', 1484723890, 0x5f5f63695f6c6173745f726567656e65726174657c693a313438343732333532353b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a363a22677773313233223b757365726e616d657c733a363a22677773313233223b656d61696c7c733a32333a2263686574616e406772656174776562736f66742e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343834373233373037223b6c6173745f69707c733a31333a223130332e3235322e3136382e35223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313438343732333839303b72656769737465725f69647c733a313a2237223b636173685f696e5f68616e647c733a393a22323030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30312d30362030303a30323a3335223b),
('d4fc73f2dfac9440345ac60d60856197cc86195b', '103.252.168.5', 1484724244, 0x5f5f63695f6c6173745f726567656e65726174657c693a313438343732343234343b7265717565737465645f706167657c733a333a22706f73223b6964656e746974797c733a363a22677773313233223b757365726e616d657c733a363a22677773313233223b656d61696c7c733a32333a2263686574616e406772656174776562736f66742e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343834373231333730223b6c6173745f69707c733a31343a223131322e3133332e3235312e3535223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313438343732343234343b72656769737465725f69647c733a313a2237223b636173685f696e5f68616e647c733a393a22323030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30312d30362030303a30323a3335223b),
('d59f70d35fbc4767759a53ca15ca1b488f6fdfa9', '23.99.101.118', 1484723761, 0x5f5f63695f6c6173745f726567656e65726174657c693a313438343732333736313b),
('e4597c1c7a66f3c9893d8a022cda4b2d9a52b48b', '103.252.168.5', 1484724047, 0x5f5f63695f6c6173745f726567656e65726174657c693a313438343732343034373b),
('ef6ed84b0dacf175549d1cd63e858e3c77d74918', '103.252.168.5', 1484726442, 0x5f5f63695f6c6173745f726567656e65726174657c693a313438343732363336383b7265717565737465645f706167657c733a333a22706f73223b6964656e746974797c733a363a22677773313233223b757365726e616d657c733a363a22677773313233223b656d61696c7c733a32333a2263686574616e406772656174776562736f66742e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343834373231333730223b6c6173745f69707c733a31343a223131322e3133332e3235312e3535223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313438343732363434323b72656769737465725f69647c733a313a2237223b636173685f696e5f68616e647c733a393a22323030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30312d30362030303a30323a3335223b),
('f95c2bb07bae6f0f47e7f512dd97d1ad7e5a851d', '103.252.168.5', 1484724190, 0x5f5f63695f6c6173745f726567656e65726174657c693a313438343732333839393b7265717565737465645f706167657c733a333a22706f73223b6964656e746974797c733a363a22677773313233223b757365726e616d657c733a363a22677773313233223b656d61696c7c733a32333a2263686574616e406772656174776562736f66742e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343834373231333730223b6c6173745f69707c733a31343a223131322e3133332e3235312e3535223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313438343732343137383b72656769737465725f69647c733a313a2237223b636173685f696e5f68616e647c733a393a22323030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30312d30362030303a30323a3335223b),
('fa300e208edea9a4f93de870672ff7cca5888d33', '52.22.7.208', 1484726004, 0x5f5f63695f6c6173745f726567656e65726174657c693a313438343732363030343b7265717565737465645f706167657c733a333a22706f73223b),
('fc7d181bfbf202e664445a919a41a2169271886a', '103.252.168.5', 1484721966, 0x5f5f63695f6c6173745f726567656e65726174657c693a313438343732313934373b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a363a22677773313233223b757365726e616d657c733a363a22677773313233223b656d61696c7c733a32333a2263686574616e406772656174776562736f66742e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343834373135323031223b6c6173745f69707c733a31333a223131372e3234372e35322e3232223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313438343731383231363b72656769737465725f69647c733a313a2237223b636173685f696e5f68616e647c733a393a22323030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30312d30362030303a30323a3335223b);

-- --------------------------------------------------------

--
-- Table structure for table `sma_settings`
--

CREATE TABLE IF NOT EXISTS `sma_settings` (
  `setting_id` int(1) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `logo2` varchar(255) NOT NULL,
  `site_name` varchar(55) NOT NULL,
  `language` varchar(20) NOT NULL,
  `default_warehouse` int(2) NOT NULL,
  `accounting_method` tinyint(4) NOT NULL DEFAULT '0',
  `default_currency` varchar(3) NOT NULL,
  `default_tax_rate` int(2) NOT NULL,
  `rows_per_page` int(2) NOT NULL,
  `version` varchar(10) NOT NULL DEFAULT '1.0',
  `default_tax_rate2` int(11) NOT NULL DEFAULT '0',
  `dateformat` int(11) NOT NULL,
  `sales_prefix` varchar(20) DEFAULT NULL,
  `quote_prefix` varchar(20) DEFAULT NULL,
  `purchase_prefix` varchar(20) DEFAULT NULL,
  `transfer_prefix` varchar(20) DEFAULT NULL,
  `delivery_prefix` varchar(20) DEFAULT NULL,
  `payment_prefix` varchar(20) DEFAULT NULL,
  `return_prefix` varchar(20) DEFAULT NULL,
  `returnp_prefix` varchar(20) DEFAULT NULL,
  `expense_prefix` varchar(20) DEFAULT NULL,
  `item_addition` tinyint(1) NOT NULL DEFAULT '0',
  `theme` varchar(20) NOT NULL,
  `product_serial` tinyint(4) NOT NULL,
  `default_discount` int(11) NOT NULL,
  `product_discount` tinyint(1) NOT NULL DEFAULT '0',
  `discount_method` tinyint(4) NOT NULL,
  `tax1` tinyint(4) NOT NULL,
  `tax2` tinyint(4) NOT NULL,
  `overselling` tinyint(1) NOT NULL DEFAULT '0',
  `restrict_user` tinyint(4) NOT NULL DEFAULT '0',
  `restrict_calendar` tinyint(4) NOT NULL DEFAULT '0',
  `timezone` varchar(100) DEFAULT NULL,
  `iwidth` int(11) NOT NULL DEFAULT '0',
  `iheight` int(11) NOT NULL,
  `twidth` int(11) NOT NULL,
  `theight` int(11) NOT NULL,
  `watermark` tinyint(1) DEFAULT NULL,
  `reg_ver` tinyint(1) DEFAULT NULL,
  `allow_reg` tinyint(1) DEFAULT NULL,
  `reg_notification` tinyint(1) DEFAULT NULL,
  `auto_reg` tinyint(1) DEFAULT NULL,
  `protocol` varchar(20) NOT NULL DEFAULT 'mail',
  `mailpath` varchar(55) DEFAULT '/usr/sbin/sendmail',
  `smtp_host` varchar(100) DEFAULT NULL,
  `smtp_user` varchar(100) DEFAULT NULL,
  `smtp_pass` varchar(255) DEFAULT NULL,
  `smtp_port` varchar(10) DEFAULT '25',
  `smtp_crypto` varchar(10) DEFAULT NULL,
  `corn` datetime DEFAULT NULL,
  `customer_group` int(11) NOT NULL,
  `default_email` varchar(100) NOT NULL,
  `mmode` tinyint(1) NOT NULL,
  `bc_fix` tinyint(4) NOT NULL DEFAULT '0',
  `auto_detect_barcode` tinyint(1) NOT NULL DEFAULT '0',
  `captcha` tinyint(1) NOT NULL DEFAULT '1',
  `reference_format` tinyint(1) NOT NULL DEFAULT '1',
  `racks` tinyint(1) DEFAULT '0',
  `attributes` tinyint(1) NOT NULL DEFAULT '0',
  `product_expiry` tinyint(1) NOT NULL DEFAULT '0',
  `decimals` tinyint(2) NOT NULL DEFAULT '2',
  `qty_decimals` tinyint(2) NOT NULL DEFAULT '2',
  `decimals_sep` varchar(2) NOT NULL DEFAULT '.',
  `thousands_sep` varchar(2) NOT NULL DEFAULT ',',
  `invoice_view` tinyint(1) DEFAULT '0',
  `default_biller` int(11) DEFAULT NULL,
  `envato_username` varchar(50) DEFAULT NULL,
  `purchase_code` varchar(100) DEFAULT NULL,
  `rtl` tinyint(1) DEFAULT '0',
  `each_spent` decimal(15,4) DEFAULT NULL,
  `ca_point` tinyint(4) DEFAULT NULL,
  `each_sale` decimal(15,4) DEFAULT NULL,
  `sa_point` tinyint(4) DEFAULT NULL,
  `update` tinyint(1) DEFAULT '0',
  `sac` tinyint(1) DEFAULT '0',
  `display_all_products` tinyint(1) DEFAULT '0',
  `display_symbol` tinyint(1) DEFAULT NULL,
  `symbol` varchar(50) DEFAULT NULL,
  `remove_expired` tinyint(1) DEFAULT '0',
  `barcode_separator` varchar(2) NOT NULL DEFAULT '_',
  `set_focus` tinyint(1) NOT NULL DEFAULT '0',
  `price_group` int(11) DEFAULT NULL,
  `barcode_img` tinyint(1) NOT NULL DEFAULT '1',
  `ppayment_prefix` varchar(20) DEFAULT 'POP',
  `disable_editing` smallint(6) DEFAULT '90',
  `qa_prefix` varchar(55) DEFAULT NULL,
  `update_cost` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`setting_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_settings`
--

INSERT INTO `sma_settings` (`setting_id`, `logo`, `logo2`, `site_name`, `language`, `default_warehouse`, `accounting_method`, `default_currency`, `default_tax_rate`, `rows_per_page`, `version`, `default_tax_rate2`, `dateformat`, `sales_prefix`, `quote_prefix`, `purchase_prefix`, `transfer_prefix`, `delivery_prefix`, `payment_prefix`, `return_prefix`, `returnp_prefix`, `expense_prefix`, `item_addition`, `theme`, `product_serial`, `default_discount`, `product_discount`, `discount_method`, `tax1`, `tax2`, `overselling`, `restrict_user`, `restrict_calendar`, `timezone`, `iwidth`, `iheight`, `twidth`, `theight`, `watermark`, `reg_ver`, `allow_reg`, `reg_notification`, `auto_reg`, `protocol`, `mailpath`, `smtp_host`, `smtp_user`, `smtp_pass`, `smtp_port`, `smtp_crypto`, `corn`, `customer_group`, `default_email`, `mmode`, `bc_fix`, `auto_detect_barcode`, `captcha`, `reference_format`, `racks`, `attributes`, `product_expiry`, `decimals`, `qty_decimals`, `decimals_sep`, `thousands_sep`, `invoice_view`, `default_biller`, `envato_username`, `purchase_code`, `rtl`, `each_spent`, `ca_point`, `each_sale`, `sa_point`, `update`, `sac`, `display_all_products`, `display_symbol`, `symbol`, `remove_expired`, `barcode_separator`, `set_focus`, `price_group`, `barcode_img`, `ppayment_prefix`, `disable_editing`, `qa_prefix`, `update_cost`) VALUES
(1, 'logo300.png', 'logo3001.png', 'Simplysafe', 'english', 1, 2, 'INR', 1, 15, '3.0.2.22', 1, 5, 'SALE', 'QUOTE', 'PO', 'TR', 'DO', 'IPAY', 'SR', 'PR', '', 0, 'default', 1, 1, 1, 1, 1, 1, 1, 1, 0, 'Asia/Kolkata', 800, 800, 60, 60, 1, 0, 0, 0, NULL, 'mail', '/usr/sbin/sendmail', 'pop.gmail.com', 'contact@sma.tecdiary.org', 'jEFTM4T63AiQ9dsidxhPKt9CIg4HQjCN58n/RW9vmdC/UDXCzRLR469ziZ0jjpFlbOg43LyoSmpJLBkcAHh0Yw==', '25', NULL, NULL, 1, 'chetan@greatwebsoft.com', 0, 4, 1, 0, 2, 1, 1, 1, 2, 0, '.', ',', 1, 5, 'chetan_ghagre', 'b4444bf5-1e30-495a-a5d7-508e003df772', 0, '100.0000', 1, NULL, NULL, 0, 1, 1, 1, '₹', 0, '_', 0, 2, 1, 'POP', 90, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `sma_skrill`
--

CREATE TABLE IF NOT EXISTS `sma_skrill` (
  `id` int(11) NOT NULL,
  `active` tinyint(4) NOT NULL,
  `account_email` varchar(255) NOT NULL DEFAULT 'testaccount2@moneybookers.com',
  `secret_word` varchar(20) NOT NULL DEFAULT 'mbtest',
  `skrill_currency` varchar(3) NOT NULL DEFAULT 'USD',
  `fixed_charges` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `extra_charges_my` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `extra_charges_other` decimal(25,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_skrill`
--

INSERT INTO `sma_skrill` (`id`, `active`, `account_email`, `secret_word`, `skrill_currency`, `fixed_charges`, `extra_charges_my`, `extra_charges_other`) VALUES
(1, 1, 'testaccount2@moneybookers.com', 'mbtest', 'USD', '0.0000', '0.0000', '0.0000');

-- --------------------------------------------------------

--
-- Table structure for table `sma_stock_counts`
--

CREATE TABLE IF NOT EXISTS `sma_stock_counts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `reference_no` varchar(55) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `type` varchar(10) NOT NULL,
  `initial_file` varchar(50) NOT NULL,
  `final_file` varchar(50) DEFAULT NULL,
  `brands` varchar(50) DEFAULT NULL,
  `brand_names` varchar(100) DEFAULT NULL,
  `categories` varchar(50) DEFAULT NULL,
  `category_names` varchar(100) DEFAULT NULL,
  `note` text,
  `products` int(11) DEFAULT NULL,
  `rows` int(11) DEFAULT NULL,
  `differences` int(11) DEFAULT NULL,
  `matches` int(11) DEFAULT NULL,
  `missing` int(11) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `finalized` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `warehouse_id` (`warehouse_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

--
-- Dumping data for table `sma_stock_counts`
--

INSERT INTO `sma_stock_counts` (`id`, `date`, `reference_no`, `warehouse_id`, `type`, `initial_file`, `final_file`, `brands`, `brand_names`, `categories`, `category_names`, `note`, `products`, `rows`, `differences`, `matches`, `missing`, `created_by`, `updated_by`, `updated_at`, `finalized`) VALUES
(1, '2016-11-17 14:25:00', '', 1, 'full', 'bdaeed5a76ee1fd3574b5814bbbf8aa9.csv', NULL, '', '', '', '', NULL, 1, 1, NULL, NULL, NULL, 2, NULL, NULL, NULL),
(2, '2016-11-21 15:31:00', '', 1, 'full', 'a26758ffcae4a6729523510350281133.csv', NULL, '', '', '', '', NULL, 1, 1, NULL, NULL, NULL, 2, NULL, NULL, NULL),
(3, '2016-11-21 16:17:00', '', 1, 'full', '6346bfb4b52fa0a2c6f26de437cb9beb.csv', NULL, '', '', '', '', NULL, 1, 1, NULL, NULL, NULL, 2, NULL, NULL, NULL),
(4, '2016-11-26 12:53:00', '', 1, 'full', '89f9ae5b6145ea85d4cb0c3779a9b31a.csv', NULL, '', '', '', '', NULL, 3, 3, NULL, NULL, NULL, 2, NULL, NULL, NULL),
(5, '2016-11-26 12:54:00', 'for now', 1, 'full', '920e2b82b36d3f41b9de0b6da8fd87ef.csv', NULL, '', '', '', '', NULL, 3, 3, NULL, NULL, NULL, 2, NULL, NULL, NULL),
(6, '2016-11-26 12:55:00', 'For now', 2, 'full', '1f73c468f53185092a7d0400899c5827.csv', NULL, '', '', '', '', NULL, 3, 3, NULL, NULL, NULL, 2, NULL, NULL, NULL),
(7, '2016-11-26 13:54:00', 'test count', 1, 'full', 'd7f6f3bc4bad71c505ddd83ad3f9d3b7.csv', NULL, '', '', '', '', NULL, 4, 4, NULL, NULL, NULL, 2, NULL, NULL, NULL),
(8, '2016-11-26 14:03:00', 'now', 1, 'full', 'd5e565d0dae52e3dbf948fc5e33a87c5.csv', NULL, '', '', '', '', NULL, 4, 4, NULL, NULL, NULL, 2, NULL, NULL, NULL),
(9, '2016-11-29 10:51:00', '123tth', 1, 'full', 'f7253c10c29ab0346e630f201f33501a.csv', NULL, '', '', '', '', NULL, 6, 6, NULL, NULL, NULL, 2, NULL, NULL, NULL),
(10, '2016-11-29 14:35:00', '', 1, 'full', 'efe9eb677cf311e1f11954be581d149c.csv', NULL, '', '', '', '', NULL, 8, 8, NULL, NULL, NULL, 4, NULL, NULL, NULL),
(11, '2016-11-29 14:36:00', '', 1, 'partial', '2f54a3dc9e806752b9de7fd7d54bcc84.csv', NULL, '4', 'Clinic Plus', '', '', NULL, 1, 1, NULL, NULL, NULL, 4, NULL, NULL, NULL),
(12, '2016-11-29 14:39:00', '', 1, 'full', '2909ebcf9130ce460e242201394e7de1.csv', NULL, '', '', '', '', NULL, 8, 8, NULL, NULL, NULL, 4, NULL, NULL, NULL),
(13, '2016-12-01 12:26:00', '22', 1, 'full', '64cfec0a20728b59349eacf37b0ca45a.csv', NULL, '', '', '', '', NULL, 15, 15, NULL, NULL, NULL, 2, NULL, NULL, NULL),
(14, '2016-12-01 12:29:00', '11', 2, 'full', 'f9db5aecf7972cd79fb68e9f1d40a769.csv', NULL, '', '', '', '', NULL, 13, 13, NULL, NULL, NULL, 2, NULL, NULL, NULL),
(15, '2016-12-01 13:29:00', '21', 1, 'full', '93770e9ad5024d54110d59d2642eff52.csv', NULL, '', '', '', '', NULL, 15, 15, NULL, NULL, NULL, 2, NULL, NULL, NULL),
(16, '2016-12-01 15:53:00', '1852', 1, 'full', '8f51dea386dde8f0c7f4dfd13d1dad98.csv', NULL, '', '', '', '', NULL, 15, 15, NULL, NULL, NULL, 2, NULL, NULL, NULL),
(17, '2016-12-02 11:34:00', '', 1, 'full', '24c8103ebc32b21c897be3adcb2e6373.csv', NULL, '', '', '', '', NULL, 16, 16, NULL, NULL, NULL, 2, NULL, NULL, NULL),
(18, '2016-12-13 00:20:00', '', 1, 'full', 'f5134127de221aeb8ee9df84c810a9c6.csv', NULL, '', '', '', '', NULL, 22, 22, NULL, NULL, NULL, 2, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_stock_count_items`
--

CREATE TABLE IF NOT EXISTS `sma_stock_count_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stock_count_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_code` varchar(50) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `product_variant` varchar(55) DEFAULT NULL,
  `product_variant_id` int(11) DEFAULT NULL,
  `expected` decimal(15,4) NOT NULL,
  `counted` decimal(15,4) NOT NULL,
  `cost` decimal(25,4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `stock_count_id` (`stock_count_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sma_suspended_bills`
--

CREATE TABLE IF NOT EXISTS `sma_suspended_bills` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `customer_id` int(11) NOT NULL,
  `customer` varchar(55) DEFAULT NULL,
  `count` int(11) NOT NULL,
  `order_discount_id` varchar(20) DEFAULT NULL,
  `order_tax_id` int(11) DEFAULT NULL,
  `total` decimal(25,4) NOT NULL,
  `biller_id` int(11) DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `suspend_note` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `sma_suspended_bills`
--

INSERT INTO `sma_suspended_bills` (`id`, `date`, `customer_id`, `customer`, `count`, `order_discount_id`, `order_tax_id`, `total`, `biller_id`, `warehouse_id`, `created_by`, `suspend_note`) VALUES
(5, '2016-12-24 11:55:08', 9, 'shri niwas', 1, NULL, 1, '90.0000', 5, 1, 2, 'swati'),
(6, '2017-01-12 17:53:19', 9, 'shri niwas', 3, NULL, 1, '220.0000', 5, 1, 2, 'said'),
(7, '2017-01-12 23:16:01', 9, 'shri niwas', 1, NULL, 1, '60.0000', 5, 1, 2, 'r1'),
(8, '2017-01-12 23:19:18', 9, 'shri niwas', 3, NULL, 1, '160.0000', 5, 1, 2, '1234'),
(9, '2017-01-16 19:31:31', 9, 'shri niwas', 1, NULL, 1, '40.0000', 5, 1, 2, '100'),
(10, '2017-01-17 19:39:46', 9, 'shri niwas', 2, NULL, 1, '120.0000', 5, 1, 2, 'Abc');

-- --------------------------------------------------------

--
-- Table structure for table `sma_suspended_items`
--

CREATE TABLE IF NOT EXISTS `sma_suspended_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `suspend_id` int(11) unsigned NOT NULL,
  `product_id` int(11) unsigned NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `net_unit_price` decimal(25,4) NOT NULL,
  `unit_price` decimal(25,4) NOT NULL,
  `quantity` decimal(15,4) DEFAULT '0.0000',
  `warehouse_id` int(11) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `discount` varchar(55) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `option_id` int(11) DEFAULT NULL,
  `product_type` varchar(20) DEFAULT NULL,
  `real_unit_price` decimal(25,4) DEFAULT NULL,
  `product_unit_id` int(11) DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

--
-- Dumping data for table `sma_suspended_items`
--

INSERT INTO `sma_suspended_items` (`id`, `suspend_id`, `product_id`, `product_code`, `product_name`, `net_unit_price`, `unit_price`, `quantity`, `warehouse_id`, `item_tax`, `tax_rate_id`, `tax`, `discount`, `item_discount`, `subtotal`, `serial_no`, `option_id`, `product_type`, `real_unit_price`, `product_unit_id`, `product_unit_code`, `unit_quantity`) VALUES
(8, 5, 12, '57176110', 'Clinic Plus 100 ML', '81.8182', '90.0000', '1.0000', 1, '8.1818', 2, '10.0000%', '0', '0.0000', '90.0000', '', NULL, 'standard', '90.0000', 1, 'Pis', '1.0000'),
(9, 6, 12, '57176110', 'Clinic Plus 100 ML', '81.8182', '90.0000', '2.0000', 1, '16.3636', 2, '10.0000%', '0', '0.0000', '180.0000', '', NULL, 'standard', '90.0000', 1, 'Pis', '2.0000'),
(10, 6, 14, 'tea100', 'tea-100', '40.0000', '40.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '40.0000', '', NULL, 'standard', '40.0000', 1, 'Pis', '1.0000'),
(11, 7, 16, '81567325', 'golden tea(200)', '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', NULL, 'standard', '60.0000', 2, 'kg', '1.0000'),
(12, 8, 14, 'tea100', 'tea-100', '40.0000', '40.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '40.0000', '', NULL, 'standard', '40.0000', 1, 'Pis', '1.0000'),
(13, 8, 16, '81567325', 'golden tea(200)', '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', NULL, 'standard', '60.0000', 2, 'kg', '1.0000'),
(14, 8, 15, '28403364', 'golden (200)', '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', NULL, 'standard', '60.0000', 1, 'Pis', '1.0000'),
(16, 9, 14, 'tea100', 'tea-100', '40.0000', '40.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '40.0000', '', NULL, 'standard', '40.0000', 1, 'Pis', '1.0000'),
(17, 10, 16, '81567325', 'golden tea(200)', '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', NULL, 'standard', '60.0000', 2, 'kg', '1.0000'),
(18, 10, 15, '28403364', 'golden (200)', '60.0000', '60.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '60.0000', '', NULL, 'standard', '60.0000', 1, 'Pis', '1.0000');

-- --------------------------------------------------------

--
-- Table structure for table `sma_tax_rates`
--

CREATE TABLE IF NOT EXISTS `sma_tax_rates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(55) NOT NULL,
  `code` varchar(10) DEFAULT NULL,
  `rate` decimal(12,4) NOT NULL,
  `type` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `sma_tax_rates`
--

INSERT INTO `sma_tax_rates` (`id`, `name`, `code`, `rate`, `type`) VALUES
(1, 'No Tax', 'NT', '0.0000', '2'),
(2, 'VAT @10%', 'VAT10', '10.0000', '1'),
(3, 'GST @6%', 'GST', '6.0000', '1'),
(4, 'VAT @20%', 'VT20', '20.0000', '1'),
(5, 'test', 'txt', '20.0000', '1'),
(6, 'Swaksha Bharat', 'SwstBrt', '0.5000', '1'),
(7, 'krishi Vikas', 'krishi', '0.5000', '1');

-- --------------------------------------------------------

--
-- Table structure for table `sma_transfers`
--

CREATE TABLE IF NOT EXISTS `sma_transfers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transfer_no` varchar(55) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `from_warehouse_id` int(11) NOT NULL,
  `from_warehouse_code` varchar(55) NOT NULL,
  `from_warehouse_name` varchar(55) NOT NULL,
  `to_warehouse_id` int(11) NOT NULL,
  `to_warehouse_code` varchar(55) NOT NULL,
  `to_warehouse_name` varchar(55) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `total` decimal(25,4) DEFAULT NULL,
  `total_tax` decimal(25,4) DEFAULT NULL,
  `grand_total` decimal(25,4) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `status` varchar(55) NOT NULL DEFAULT 'pending',
  `shipping` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `attachment` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `sma_transfers`
--

INSERT INTO `sma_transfers` (`id`, `transfer_no`, `date`, `from_warehouse_id`, `from_warehouse_code`, `from_warehouse_name`, `to_warehouse_id`, `to_warehouse_code`, `to_warehouse_name`, `note`, `total`, `total_tax`, `grand_total`, `created_by`, `status`, `shipping`, `attachment`) VALUES
(1, '45856', '2016-11-17 14:36:00', 1, 'WHI', 'Warehouse 1', 2, 'WHII', 'Warehouse 2', '', '200000.0000', '0.0000', '200000.0000', '2', 'completed', '0.0000', NULL),
(2, 'TR/2016/11/0001', '2016-11-29 14:43:00', 2, 'WHII', 'Warehouse 2', 1, 'WHI', 'Warehouse 1', '', '1454.5460', '145.4540', '1600.0000', '4', 'completed', '0.0000', NULL),
(3, '4756', '2016-11-30 12:39:00', 2, 'WHII', 'Warehouse 2', 1, 'WHI', 'Warehouse 1', '', '600.0000', '0.0000', '600.0000', '2', 'completed', '0.0000', NULL),
(4, '245', '2016-12-02 17:49:00', 2, 'WHII', 'Warehouse 2', 1, 'Ware house 1-1', 'Warehouse 1', '', '200.0000', '0.0000', '200.0000', '2', 'completed', '0.0000', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_transfer_items`
--

CREATE TABLE IF NOT EXISTS `sma_transfer_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transfer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `option_id` int(11) DEFAULT NULL,
  `expiry` date DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `net_unit_cost` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) DEFAULT NULL,
  `quantity_balance` decimal(15,4) NOT NULL,
  `unit_cost` decimal(25,4) DEFAULT NULL,
  `real_unit_cost` decimal(25,4) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `product_unit_id` int(11) DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `transfer_id` (`transfer_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sma_units`
--

CREATE TABLE IF NOT EXISTS `sma_units` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) NOT NULL,
  `name` varchar(55) NOT NULL,
  `base_unit` int(11) DEFAULT NULL,
  `operator` varchar(1) DEFAULT NULL,
  `unit_value` varchar(55) DEFAULT NULL,
  `operation_value` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `base_unit` (`base_unit`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `sma_units`
--

INSERT INTO `sma_units` (`id`, `code`, `name`, `base_unit`, `operator`, `unit_value`, `operation_value`) VALUES
(1, 'Pis', 'Pis', NULL, NULL, NULL, NULL),
(2, 'kg', 'KiloGrams', NULL, NULL, NULL, NULL),
(3, 'grm', 'Grams', 2, '/', NULL, '1000');

-- --------------------------------------------------------

--
-- Table structure for table `sma_users`
--

CREATE TABLE IF NOT EXISTS `sma_users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `last_ip_address` varbinary(45) DEFAULT NULL,
  `ip_address` varbinary(45) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(40) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int(11) unsigned DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int(11) unsigned NOT NULL,
  `last_login` int(11) unsigned DEFAULT NULL,
  `active` tinyint(1) unsigned DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `avatar` varchar(55) DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `group_id` int(10) unsigned NOT NULL,
  `warehouse_id` int(10) unsigned DEFAULT NULL,
  `biller_id` int(10) unsigned DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `show_cost` tinyint(1) DEFAULT '0',
  `show_price` tinyint(1) DEFAULT '0',
  `award_points` int(11) DEFAULT '0',
  `view_right` tinyint(1) NOT NULL DEFAULT '0',
  `edit_right` tinyint(1) NOT NULL DEFAULT '0',
  `allow_discount` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `group_id` (`group_id`,`warehouse_id`,`biller_id`),
  KEY `group_id_2` (`group_id`,`company_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `sma_users`
--

INSERT INTO `sma_users` (`id`, `last_ip_address`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`, `avatar`, `gender`, `group_id`, `warehouse_id`, `biller_id`, `company_id`, `show_cost`, `show_price`, `award_points`, `view_right`, `edit_right`, `allow_discount`) VALUES
(2, '103.252.168.5', '103.252.168.5', 'gws123', '3603c32029875a5531567a546543641a73bb24d7', NULL, 'chetan@greatwebsoft.com', NULL, NULL, NULL, 'c9a7372ba8b03b05b1151c0e0e24dadd4d73065b', 1479203521, 1484724557, 1, 'cheatan ', 'singh', 'Great Web Soft', '7054623186', NULL, 'male', 1, 0, 0, NULL, 0, 0, 0, 1, 0, 0),
(3, NULL, '117.247.52.194', 'pratimasingh', 'b9eb43b03b1d863955e6b3356215f0819927946e', NULL, 'singhprat@gmail.com', NULL, NULL, NULL, NULL, 1480140241, 1480140241, 1, 'pratima', 'singh', 'simplysafe', '8359083498', NULL, 'female', 1, NULL, NULL, NULL, 0, 0, 0, 1, 0, 0),
(4, '117.247.52.37', '59.90.36.174', 'yogesh', '599aa3549a394b128a810677c84fa2737a8c9ffb', NULL, 'yogesh@simplysafe.in', NULL, NULL, NULL, NULL, 1480395673, 1480403540, 1, 'yogesh', 'Gupta', 'Simplysafe', '9993012042', NULL, 'male', 1, 0, 0, NULL, 0, 0, 0, 1, 0, 0),
(5, '27.58.50.175', '103.252.168.5', 'chtnghgr8', 'f74b63f9c1d2e869fd5655b7f82cb42daa08781c', NULL, 'chtnghgr8@gmail.com', NULL, NULL, NULL, NULL, 1480747578, 1480853961, 1, 'che', 'gha', 'gws', '', NULL, 'male', 3, NULL, NULL, 24, 0, 0, 0, 0, 0, 0),
(6, '27.58.50.175', '27.58.50.175', 'webkart', '6d793de02538cac4af20f6485ab831af4144514b', NULL, 'payments@webkart.xyz', NULL, NULL, NULL, NULL, 1480853534, 1480854016, 1, 'Chetan', 'Ghagre', 'WebKart', '8087448286', NULL, 'male', 5, 0, 3, NULL, 0, 0, 0, 1, 1, 1),
(7, '71.142.6.63', '106.221.156.79', 'sunil', '8a3de452b371b3b1dc36f11823ab4860a19698bf', NULL, 'sunil@simplysafe.in', NULL, NULL, NULL, NULL, 1481376224, 1481376327, 1, 'Sunil', 'Sadani', 'simplysafe', '8087448286', NULL, 'male', 3, NULL, NULL, 30, 0, 0, 0, 0, 0, 0),
(8, NULL, '', 'sana123', '123', NULL, 'cg@hi.com', NULL, NULL, NULL, NULL, 0, NULL, NULL, 'sana', 'rahman', 'gtm', '1234567894', NULL, 'femail', 0, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0),
(9, NULL, '', 'yogesh', '123', NULL, 'cg@hi.com', NULL, NULL, NULL, NULL, 0, NULL, NULL, 'sana', 'rahman', 'gtm', '1234567894', NULL, 'femail', 0, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0),
(10, NULL, '', 'cg', '202cb962ac59075b964b07152d234b70', NULL, 'cg@hi.com', NULL, NULL, NULL, NULL, 0, NULL, NULL, 'sana', 'rahman', 'gtm', '1234567894', NULL, 'femail', 0, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0),
(11, NULL, '', 'priya', '202cb962ac59075b964b07152d234b70', NULL, 'cg@hi.com', NULL, NULL, NULL, '\n', 0, NULL, 1, 'sana', 'rahman', 'gtm', '1234567894', NULL, 'femail', 0, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sma_user_logins`
--

CREATE TABLE IF NOT EXISTS `sma_user_logins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `ip_address` varbinary(16) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=569 ;

--
-- Dumping data for table `sma_user_logins`
--

INSERT INTO `sma_user_logins` (`id`, `user_id`, `company_id`, `ip_address`, `login`, `time`) VALUES
(115, 2, NULL, '27.58.56.99', 'gws123', '2016-12-03 17:21:51'),
(116, 2, NULL, '117.222.47.187', 'gws123', '2016-12-04 08:37:37'),
(117, 2, NULL, '117.222.47.187', 'gws123', '2016-12-04 08:40:24'),
(118, 2, NULL, '117.222.47.187', 'gws123', '2016-12-04 08:54:36'),
(119, 2, NULL, '27.58.50.175', 'gws123', '2016-12-04 09:03:34'),
(120, 2, NULL, '27.58.50.175', 'gws123', '2016-12-04 10:24:34'),
(121, 6, NULL, '27.58.50.175', 'WebKart', '2016-12-04 12:12:56'),
(122, 2, NULL, '27.58.50.175', 'gws123', '2016-12-04 12:16:44'),
(123, 5, NULL, '27.58.50.175', 'chtnghgr8', '2016-12-04 12:19:21'),
(124, 6, NULL, '27.58.50.175', 'payments@webkart.xyz', '2016-12-04 12:20:16'),
(125, 2, NULL, '27.58.50.175', 'gws123', '2016-12-04 14:02:44'),
(126, 2, NULL, '117.222.47.187', 'gws123', '2016-12-04 15:29:05'),
(127, 2, NULL, '117.222.47.187', 'gws123', '2016-12-04 15:34:36'),
(128, 2, NULL, '117.222.47.187', 'gws123', '2016-12-04 15:53:05'),
(129, 2, NULL, '27.58.44.210', 'gws123', '2016-12-04 17:57:12'),
(130, 2, NULL, '27.58.44.210', 'gws123', '2016-12-04 18:11:01'),
(131, 2, NULL, '117.222.47.187', 'gws123', '2016-12-05 02:41:47'),
(132, 2, NULL, '117.247.52.137', 'gws123', '2016-12-05 03:53:56'),
(133, 2, NULL, '117.247.52.137', 'gws123', '2016-12-05 03:56:38'),
(134, 2, NULL, '117.247.52.137', 'gws123', '2016-12-05 07:07:20'),
(135, 2, NULL, '106.221.150.15', 'gws123', '2016-12-05 07:32:16'),
(136, 2, NULL, '117.198.74.13', 'gws123', '2016-12-05 09:27:32'),
(137, 2, NULL, '117.247.52.137', 'gws123', '2016-12-05 10:52:58'),
(138, 2, NULL, '117.198.74.13', 'gws123', '2016-12-05 18:36:57'),
(139, 2, NULL, '27.58.38.60', 'gws123', '2016-12-05 18:49:57'),
(140, 2, NULL, '117.198.74.13', 'gws123', '2016-12-05 19:31:24'),
(141, 2, NULL, '117.198.74.13', 'gws123', '2016-12-06 03:41:26'),
(142, 2, NULL, '117.198.73.200', 'gws123', '2016-12-06 03:48:39'),
(143, 2, NULL, '117.247.52.137', 'gws123', '2016-12-06 04:26:28'),
(144, 2, NULL, '117.247.52.137', 'gws123', '2016-12-06 09:38:59'),
(145, 2, NULL, '103.252.168.5', 'gws123', '2016-12-06 09:58:25'),
(146, 2, NULL, '117.247.52.137', 'gws123', '2016-12-06 10:27:33'),
(147, 2, NULL, '103.252.168.5', 'gws123', '2016-12-06 12:12:46'),
(148, 2, NULL, '103.252.168.5', 'gws123', '2016-12-06 12:32:15'),
(149, 2, NULL, '27.58.52.233', 'gws123', '2016-12-06 17:58:44'),
(150, 2, NULL, '27.58.52.233', 'gws123', '2016-12-06 18:00:56'),
(151, 2, NULL, '117.198.73.200', 'gws123', '2016-12-06 19:03:12'),
(152, 2, NULL, '27.58.61.233', 'gws123', '2016-12-06 20:54:56'),
(153, 2, NULL, '117.247.52.137', 'gws123', '2016-12-07 04:09:05'),
(154, 2, NULL, '59.90.37.208', 'gws123', '2016-12-07 06:46:55'),
(155, 2, NULL, '103.252.168.5', 'gws123', '2016-12-07 08:24:13'),
(156, 2, NULL, '103.252.168.5', 'gws123', '2016-12-07 10:00:56'),
(157, 2, NULL, '103.208.58.51', 'gws123', '2016-12-07 17:12:15'),
(158, 2, NULL, '59.90.37.208', 'gws123', '2016-12-08 06:36:41'),
(159, 2, NULL, '103.252.168.5', 'gws123', '2016-12-08 13:43:59'),
(160, 2, NULL, '103.252.168.5', 'gws123', '2016-12-08 13:53:16'),
(161, 2, NULL, '117.203.121.114', 'gws123', '2016-12-08 16:46:07'),
(162, 2, NULL, '27.58.24.207', 'gws123', '2016-12-08 18:12:51'),
(163, 2, NULL, '27.58.24.207', 'gws123', '2016-12-08 18:19:05'),
(164, 2, NULL, '117.203.121.114', 'gws123', '2016-12-08 18:19:18'),
(165, 2, NULL, '117.203.121.114', 'gws123', '2016-12-08 18:37:34'),
(166, 2, NULL, '27.58.24.207', 'gws123', '2016-12-08 18:38:15'),
(167, 2, NULL, '103.252.168.5', 'gws123', '2016-12-09 05:39:05'),
(168, 2, NULL, '103.252.168.5', 'gws123', '2016-12-09 05:39:37'),
(169, 2, NULL, '59.90.37.208', 'gws123', '2016-12-09 09:19:24'),
(170, 2, NULL, '103.252.168.5', 'gws123', '2016-12-09 09:29:26'),
(171, 2, NULL, '59.90.37.208', 'gws123', '2016-12-09 10:15:25'),
(172, 2, NULL, '103.252.168.5', 'gws123', '2016-12-09 10:44:31'),
(173, 2, NULL, '103.252.168.5', 'gws123', '2016-12-09 11:01:26'),
(174, 2, NULL, '103.252.168.5', 'gws123', '2016-12-09 12:55:20'),
(175, 2, NULL, '27.58.25.80', 'gws123', '2016-12-09 18:11:05'),
(176, 2, NULL, '117.198.75.29', 'gws123', '2016-12-09 18:29:38'),
(177, 2, NULL, '59.90.37.208', 'gws123', '2016-12-10 04:20:58'),
(178, 2, NULL, '59.90.37.208', 'gws123', '2016-12-10 04:32:38'),
(179, 2, NULL, '103.252.168.5', 'gws123', '2016-12-10 05:22:46'),
(180, 2, NULL, '103.252.168.5', 'gws123', '2016-12-10 05:23:30'),
(181, 2, NULL, '103.252.168.5', 'gws123', '2016-12-10 05:40:05'),
(182, 2, NULL, '103.252.168.5', 'gws123', '2016-12-10 07:11:21'),
(183, 2, NULL, '103.252.168.5', 'gws123', '2016-12-10 09:50:17'),
(184, 2, NULL, '103.252.168.5', 'gws123', '2016-12-10 10:21:20'),
(185, 2, NULL, '106.221.156.79', 'gws123', '2016-12-10 10:31:23'),
(186, 7, NULL, '71.142.6.63', 'sunil@simplysafe.in', '2016-12-10 13:25:27'),
(187, 2, NULL, '106.221.156.79', 'gws123', '2016-12-10 14:23:24'),
(188, 2, NULL, '71.142.6.63', 'gws123', '2016-12-10 14:28:39'),
(189, 2, NULL, '70.63.162.90', 'gws123', '2016-12-11 00:18:40'),
(190, 2, NULL, '106.221.134.252', 'gws123', '2016-12-11 09:47:12'),
(191, 2, NULL, '117.198.80.157', 'gws123', '2016-12-11 09:47:16'),
(192, 2, NULL, '70.63.162.90', 'gws123', '2016-12-11 16:53:26'),
(193, 2, NULL, '59.90.37.181', 'gws123', '2016-12-12 06:33:36'),
(194, 2, NULL, '103.252.168.5', 'gws123', '2016-12-12 06:45:27'),
(195, 2, NULL, '103.252.168.5', 'gws123', '2016-12-12 07:35:45'),
(196, 2, NULL, '106.221.144.204', 'gws123', '2016-12-12 09:28:53'),
(197, 2, NULL, '106.221.144.204', 'gws123', '2016-12-12 09:31:33'),
(198, 2, NULL, '103.252.168.5', 'gws123', '2016-12-12 10:37:56'),
(199, 2, NULL, '106.221.144.204', 'gws123', '2016-12-12 10:41:12'),
(200, 2, NULL, '106.221.144.204', 'gws123', '2016-12-12 11:16:29'),
(201, 2, NULL, '106.221.144.204', 'gws123', '2016-12-12 11:46:16'),
(202, 2, NULL, '70.63.162.90', 'gws123', '2016-12-12 13:00:25'),
(203, 2, NULL, '70.63.162.90', 'gws123', '2016-12-12 13:03:07'),
(204, 2, NULL, '106.221.144.204', 'gws123', '2016-12-12 13:03:10'),
(205, 2, NULL, '70.63.162.90', 'gws123', '2016-12-12 13:09:16'),
(206, 2, NULL, '70.63.162.90', 'gws123', '2016-12-12 13:26:40'),
(207, 2, NULL, '70.63.162.90', 'gws123', '2016-12-12 15:55:42'),
(208, 2, NULL, '64.102.249.13', 'gws123', '2016-12-12 17:04:04'),
(209, 2, NULL, '70.63.162.90', 'gws123', '2016-12-12 21:44:29'),
(210, 2, NULL, '103.252.168.5', 'gws123', '2016-12-13 05:35:27'),
(211, 2, NULL, '103.252.168.5', 'gws123', '2016-12-13 05:47:32'),
(212, 2, NULL, '27.58.58.187', 'gws123', '2016-12-13 06:05:19'),
(213, 2, NULL, '27.58.58.187', 'gws123', '2016-12-13 06:20:27'),
(214, 2, NULL, '27.58.58.187', 'gws123', '2016-12-13 06:30:45'),
(215, 2, NULL, '27.58.58.187', 'gws123', '2016-12-13 06:36:11'),
(216, 2, NULL, '27.58.58.187', 'gws123', '2016-12-13 06:46:46'),
(217, 2, NULL, '103.252.168.5', 'gws123', '2016-12-13 06:53:02'),
(218, 2, NULL, '103.252.168.5', 'gws123', '2016-12-13 07:35:28'),
(219, 2, NULL, '27.58.58.187', 'gws123', '2016-12-13 09:54:41'),
(220, 2, NULL, '59.90.36.80', 'gws123', '2016-12-13 11:48:06'),
(221, 2, NULL, '27.58.58.187', 'gws123', '2016-12-13 13:25:34'),
(222, 2, NULL, '27.58.58.187', 'gws123', '2016-12-13 13:27:29'),
(223, 2, NULL, '70.63.162.90', 'gws123', '2016-12-13 15:46:48'),
(224, 2, NULL, '117.203.123.214', 'gws123', '2016-12-13 16:34:24'),
(225, 2, NULL, '117.203.123.214', 'gws123', '2016-12-13 18:34:30'),
(226, 2, NULL, '27.58.53.119', 'gws123', '2016-12-13 19:24:54'),
(227, 2, NULL, '59.90.37.28', 'gws123', '2016-12-14 04:54:15'),
(228, 2, NULL, '103.252.168.5', 'gws123', '2016-12-14 05:20:50'),
(229, 2, NULL, '103.252.168.5', 'gws123', '2016-12-14 05:39:20'),
(230, 2, NULL, '59.90.37.28', 'gws123', '2016-12-14 06:55:57'),
(231, 2, NULL, '59.90.37.28', 'gws123', '2016-12-14 06:59:54'),
(232, 2, NULL, '103.252.168.5', 'gws123', '2016-12-14 07:42:07'),
(233, 2, NULL, '103.252.168.5', 'gws123', '2016-12-14 08:25:03'),
(234, 2, NULL, '59.90.37.28', 'Gws123', '2016-12-14 09:46:16'),
(235, 2, NULL, '59.90.37.28', 'gws123', '2016-12-14 11:04:47'),
(236, 2, NULL, '106.221.157.18', 'gws123', '2016-12-14 11:14:46'),
(237, 2, NULL, '103.252.168.5', 'gws123', '2016-12-14 12:03:36'),
(238, 2, NULL, '103.252.168.5', 'gws123', '2016-12-14 12:47:11'),
(239, 2, NULL, '117.222.46.16', 'gws123', '2016-12-14 15:33:06'),
(240, 2, NULL, '70.63.162.90', 'gws123', '2016-12-14 15:44:59'),
(241, 2, NULL, '106.221.152.154', 'gws123', '2016-12-14 15:47:45'),
(242, 2, NULL, '117.222.46.16', 'gws123', '2016-12-14 18:02:55'),
(243, 2, NULL, '117.222.46.16', 'gws123', '2016-12-14 18:06:41'),
(244, 2, NULL, '117.222.46.16', 'gws123', '2016-12-14 18:09:27'),
(245, 2, NULL, '117.222.46.16', 'gws123', '2016-12-14 18:22:08'),
(246, 2, NULL, '106.221.152.154', 'gws123', '2016-12-14 18:23:08'),
(247, 2, NULL, '106.221.152.154', 'gws123', '2016-12-14 18:41:33'),
(248, 2, NULL, '117.222.46.16', 'gws123', '2016-12-15 02:55:13'),
(249, 2, NULL, '59.90.37.28', 'gws123', '2016-12-15 04:26:14'),
(250, 2, NULL, '59.90.37.28', 'gws123', '2016-12-15 04:49:54'),
(251, 2, NULL, '103.252.168.5', 'gws123', '2016-12-15 05:38:08'),
(252, 2, NULL, '117.198.73.205', 'gws123', '2016-12-15 08:48:06'),
(253, 2, NULL, '117.198.73.205', 'gws123', '2016-12-15 08:48:44'),
(254, 2, NULL, '117.198.73.205', 'gws123', '2016-12-15 08:57:32'),
(255, 2, NULL, '103.252.168.5', 'gws123', '2016-12-15 09:00:39'),
(256, 2, NULL, '117.198.73.205', 'gws123', '2016-12-15 09:05:12'),
(257, 2, NULL, '117.198.73.205', 'gws123', '2016-12-15 09:07:05'),
(258, 2, NULL, '103.252.168.5', 'gws123', '2016-12-15 09:20:10'),
(259, 2, NULL, '103.252.168.5', 'gws123', '2016-12-15 09:37:08'),
(260, 2, NULL, '103.252.168.5', 'gws123', '2016-12-15 09:37:16'),
(261, 2, NULL, '59.90.37.28', 'gws123', '2016-12-15 10:28:38'),
(262, 2, NULL, '103.252.168.5', 'gws123', '2016-12-15 12:47:56'),
(263, 2, NULL, '106.221.154.203', 'gws123', '2016-12-15 14:56:47'),
(264, 2, NULL, '70.63.162.90', 'gws123', '2016-12-15 15:34:07'),
(265, 2, NULL, '117.198.73.205', 'gws123', '2016-12-15 16:02:02'),
(266, 2, NULL, '117.198.73.205', 'gws123', '2016-12-15 16:02:36'),
(267, 2, NULL, '117.198.73.205', 'gws123', '2016-12-15 16:09:01'),
(268, 2, NULL, '106.221.154.203', 'gws123', '2016-12-15 16:13:17'),
(269, 2, NULL, '103.252.168.5', 'gws123', '2016-12-16 06:45:26'),
(270, 2, NULL, '103.252.168.5', 'gws123', '2016-12-16 06:45:54'),
(271, 2, NULL, '117.217.72.53', 'gws123', '2016-12-16 17:01:05'),
(272, 2, NULL, '117.212.190.255', 'gws123', '2016-12-17 15:57:18'),
(273, 2, NULL, '106.221.157.139', 'gws123', '2016-12-17 16:00:56'),
(274, 2, NULL, '117.212.190.255', 'gws123', '2016-12-17 17:55:18'),
(275, 2, NULL, '27.58.60.176', 'gws123', '2016-12-18 10:14:15'),
(276, 2, NULL, '117.247.53.40', 'gws123', '2016-12-19 04:43:18'),
(277, 2, NULL, '117.247.53.40', 'gws123', '2016-12-19 04:53:53'),
(278, 2, NULL, '117.247.53.40', 'gws123', '2016-12-19 07:33:07'),
(279, 2, NULL, '103.252.168.5', 'gws123', '2016-12-19 08:40:50'),
(280, 2, NULL, '103.252.168.5', 'gws123', '2016-12-19 09:59:32'),
(281, 2, NULL, '103.252.168.5', 'gws123', '2016-12-19 10:47:43'),
(282, 2, NULL, '103.252.168.5', 'gws123', '2016-12-19 11:21:13'),
(283, 2, NULL, '103.252.168.5', 'gws123', '2016-12-19 11:44:56'),
(284, 2, NULL, '103.252.168.5', 'gws123', '2016-12-19 12:18:56'),
(285, 2, NULL, '103.252.168.5', 'gws123', '2016-12-19 12:24:45'),
(286, 2, NULL, '103.252.168.5', 'gws123', '2016-12-19 12:41:50'),
(287, 2, NULL, '103.252.168.5', 'gws123', '2016-12-19 12:44:00'),
(288, 2, NULL, '103.252.168.5', 'gws123', '2016-12-19 12:46:42'),
(289, 2, NULL, '103.252.168.5', 'gws123', '2016-12-19 13:25:51'),
(290, 2, NULL, '103.252.168.5', 'gws123', '2016-12-19 13:58:40'),
(291, 2, NULL, '103.252.168.5', 'gws123', '2016-12-19 14:02:00'),
(292, 2, NULL, '103.252.168.5', 'gws123', '2016-12-19 14:03:38'),
(293, 2, NULL, '106.221.143.71', 'gws123', '2016-12-19 17:38:00'),
(294, 2, NULL, '117.247.53.40', 'gws123', '2016-12-20 04:27:33'),
(295, 2, NULL, '117.248.236.114', 'gws123', '2016-12-20 04:44:17'),
(296, 2, NULL, '103.252.168.5', 'gws123', '2016-12-20 05:26:32'),
(297, 2, NULL, '103.252.168.5', 'gws123', '2016-12-20 06:02:53'),
(298, 2, NULL, '103.252.168.5', 'gws123', '2016-12-20 06:19:08'),
(299, 2, NULL, '103.252.168.5', 'gws123', '2016-12-20 09:45:47'),
(300, 2, NULL, '103.252.168.5', 'gws123', '2016-12-20 12:27:50'),
(301, 2, NULL, '59.94.244.202', 'gws123', '2016-12-20 15:11:16'),
(302, 2, NULL, '59.94.244.202', 'gws123', '2016-12-20 17:45:58'),
(303, 2, NULL, '27.58.37.230', 'gws123', '2016-12-20 18:24:40'),
(304, 2, NULL, '59.94.244.202', 'gws123', '2016-12-20 18:25:12'),
(305, 2, NULL, '27.58.37.230', 'gws123', '2016-12-20 18:25:44'),
(306, 2, NULL, '27.58.37.230', 'gws123', '2016-12-20 18:26:35'),
(307, 2, NULL, '59.94.244.202', 'gws123', '2016-12-20 18:36:26'),
(308, 2, NULL, '27.58.37.230', 'gws123', '2016-12-20 18:36:53'),
(309, 2, NULL, '59.94.244.202', 'gws123', '2016-12-20 18:39:09'),
(310, 2, NULL, '27.58.37.230', 'gws123', '2016-12-20 18:54:15'),
(311, 2, NULL, '59.94.244.202', 'gws123', '2016-12-20 18:59:26'),
(312, 2, NULL, '59.94.244.202', 'gws123', '2016-12-20 19:16:28'),
(313, 2, NULL, '59.94.244.202', 'gws123', '2016-12-20 19:19:30'),
(314, 2, NULL, '59.94.244.202', 'gws123', '2016-12-20 19:20:55'),
(315, 2, NULL, '71.142.6.63', 'gws123', '2016-12-21 03:05:31'),
(316, 2, NULL, '103.252.168.5', 'gws123', '2016-12-21 05:34:34'),
(317, 2, NULL, '103.252.168.5', 'gws123', '2016-12-21 07:47:30'),
(318, 2, NULL, '103.252.168.5', 'gws123', '2016-12-21 08:30:58'),
(319, 2, NULL, '103.252.168.5', 'gws123', '2016-12-21 09:25:08'),
(320, 2, NULL, '103.252.168.5', 'gws123', '2016-12-21 12:22:37'),
(321, 2, NULL, '103.252.168.5', 'gws123', '2016-12-21 13:32:14'),
(322, 2, NULL, '27.58.60.95', 'gws123', '2016-12-21 17:56:43'),
(323, 2, NULL, '103.252.168.5', 'gws123', '2016-12-22 05:36:20'),
(324, 2, NULL, '117.247.53.40', 'gws123', '2016-12-22 06:15:42'),
(325, 2, NULL, '117.247.53.40', 'gws123', '2016-12-22 06:21:41'),
(326, 2, NULL, '117.247.53.40', 'gws123', '2016-12-22 06:24:50'),
(327, 2, NULL, '117.247.53.40', 'gws123', '2016-12-22 06:27:07'),
(328, 2, NULL, '117.247.53.40', 'gws123', '2016-12-22 06:28:25'),
(329, 2, NULL, '117.247.53.40', 'gws123', '2016-12-22 06:43:34'),
(330, 2, NULL, '117.247.53.40', 'gws123', '2016-12-22 06:53:04'),
(331, 2, NULL, '103.252.168.5', 'gws123', '2016-12-22 07:27:53'),
(332, 2, NULL, '103.252.168.5', 'gws123', '2016-12-22 10:06:34'),
(333, 2, NULL, '103.252.168.5', 'gws123', '2016-12-22 10:17:47'),
(334, 2, NULL, '103.252.168.5', 'gws123', '2016-12-22 13:22:23'),
(335, 2, NULL, '103.252.168.5', 'gws123', '2016-12-22 13:22:48'),
(336, 2, NULL, '117.198.83.167', 'gws123', '2016-12-22 17:36:48'),
(337, 2, NULL, '27.58.60.204', 'gws123', '2016-12-22 20:52:52'),
(338, 2, NULL, '103.252.168.5', 'gws123', '2016-12-23 05:40:34'),
(339, 2, NULL, '103.252.168.5', 'gws123', '2016-12-23 05:53:37'),
(340, 2, NULL, '103.252.168.5', 'gws123', '2016-12-23 06:36:18'),
(341, 2, NULL, '59.90.38.128', 'gws123', '2016-12-23 06:43:52'),
(342, 2, NULL, '59.90.38.128', 'gws123', '2016-12-23 07:07:24'),
(343, 2, NULL, '103.252.168.5', 'gws123', '2016-12-23 07:30:15'),
(344, 2, NULL, '103.252.168.5', 'gws123', '2016-12-23 07:34:36'),
(345, 2, NULL, '103.252.168.5', 'gws123', '2016-12-23 09:24:46'),
(346, 2, NULL, '103.252.168.5', 'gws123', '2016-12-23 09:30:47'),
(347, 2, NULL, '103.252.168.5', 'gws123', '2016-12-23 09:52:55'),
(348, 2, NULL, '103.252.168.5', 'gws123', '2016-12-23 09:55:12'),
(349, 2, NULL, '103.252.168.5', 'gws123', '2016-12-23 09:57:52'),
(350, 2, NULL, '103.252.168.5', 'gws123', '2016-12-23 09:58:20'),
(351, 2, NULL, '103.252.168.5', 'gws123', '2016-12-23 10:05:46'),
(352, 2, NULL, '103.252.168.5', 'gws123', '2016-12-23 10:58:27'),
(353, 2, NULL, '103.252.168.5', 'gws123', '2016-12-23 12:54:42'),
(354, 2, NULL, '27.58.50.201', 'gws123', '2016-12-23 18:04:15'),
(355, 2, NULL, '59.95.139.226', 'gws123', '2016-12-23 18:04:25'),
(356, 2, NULL, '27.58.50.201', 'gws123', '2016-12-23 18:08:59'),
(357, 2, NULL, '59.95.139.226', 'gws123', '2016-12-23 18:26:51'),
(358, 2, NULL, '27.58.50.201', 'gws123', '2016-12-23 18:28:00'),
(359, 2, NULL, '27.58.50.201', 'gws123', '2016-12-23 18:31:39'),
(360, 2, NULL, '27.58.50.201', 'gws123', '2016-12-23 18:32:48'),
(361, 2, NULL, '27.58.50.201', 'gws123', '2016-12-23 18:33:55'),
(362, 2, NULL, '27.58.50.201', 'gws123', '2016-12-23 18:35:55'),
(363, 2, NULL, '59.95.139.226', 'gws123', '2016-12-23 18:39:55'),
(364, 2, NULL, '27.58.50.201', 'gws123', '2016-12-23 18:41:34'),
(365, 2, NULL, '202.43.122.146', 'gws123', '2016-12-24 04:19:12'),
(366, 2, NULL, '103.252.168.5', 'gws123', '2016-12-24 05:18:34'),
(367, 2, NULL, '59.90.36.116', 'gws123', '2016-12-24 06:23:30'),
(368, 2, NULL, '103.252.168.5', 'gws123', '2016-12-24 10:14:29'),
(369, 2, NULL, '202.43.122.146', 'gws123', '2016-12-24 11:08:06'),
(370, 2, NULL, '202.43.122.146', 'gws123', '2016-12-24 12:49:00'),
(371, 2, NULL, '117.222.46.173', 'gws123', '2016-12-24 18:25:04'),
(372, 2, NULL, '103.252.168.5', 'gws123', '2016-12-26 06:42:11'),
(373, 2, NULL, '103.252.168.5', 'gws123', '2016-12-26 09:02:49'),
(374, 2, NULL, '103.252.168.5', 'gws123', '2016-12-26 12:49:39'),
(375, 2, NULL, '103.252.168.5', 'gws123', '2016-12-26 12:52:59'),
(376, 2, NULL, '103.252.168.5', 'gws123', '2016-12-27 05:26:20'),
(377, 2, NULL, '103.252.168.5', 'gws123', '2016-12-27 10:25:34'),
(378, 2, NULL, '103.252.168.5', 'gws123', '2016-12-27 12:27:54'),
(379, 2, NULL, '103.252.168.5', 'gws123', '2016-12-27 13:01:02'),
(380, 2, NULL, '27.58.28.34', 'gws123', '2016-12-29 06:30:30'),
(381, 2, NULL, '27.58.28.34', 'gws123', '2016-12-29 11:48:43'),
(382, 2, NULL, '103.252.168.5', 'gws123', '2016-12-29 12:32:13'),
(383, 2, NULL, '103.252.168.5', 'gws123', '2016-12-30 06:02:37'),
(384, 2, NULL, '59.90.38.237', 'gws123', '2016-12-30 07:03:47'),
(385, 2, NULL, '103.252.168.5', 'gws123', '2016-12-30 11:18:04'),
(386, 2, NULL, '106.221.141.150', 'gws123', '2016-12-30 16:31:14'),
(387, 2, NULL, '70.63.162.90', 'gws123', '2016-12-30 16:32:12'),
(388, 2, NULL, '106.221.141.150', 'gws123', '2016-12-30 16:32:35'),
(389, 2, NULL, '27.58.24.37', 'gws123', '2016-12-31 09:51:41'),
(390, 2, NULL, '27.58.59.200', 'gws123', '2017-01-01 18:49:31'),
(391, 2, NULL, '103.252.168.5', 'gws123', '2017-01-02 14:09:04'),
(392, 2, NULL, '117.248.238.118', 'gws123', '2017-01-02 14:14:32'),
(393, 2, NULL, '117.248.238.118', 'gws123', '2017-01-02 14:15:01'),
(394, 2, NULL, '103.252.168.5', 'gws123', '2017-01-02 14:16:54'),
(395, 2, NULL, '117.248.238.118', 'gws123', '2017-01-02 18:34:22'),
(396, 2, NULL, '27.58.41.163', 'gws123', '2017-01-02 18:38:30'),
(397, 2, NULL, '117.248.238.118', 'gws123', '2017-01-02 18:39:02'),
(398, 2, NULL, '27.58.41.163', 'gws123', '2017-01-02 18:41:35'),
(399, 2, NULL, '117.248.238.118', 'gws123', '2017-01-02 18:42:41'),
(400, 2, NULL, '27.58.41.163', 'gws123', '2017-01-02 18:52:37'),
(401, 2, NULL, '64.102.249.7', 'gws123', '2017-01-02 20:38:03'),
(402, 2, NULL, '70.63.162.90', 'gws123', '2017-01-03 00:47:20'),
(403, 2, NULL, '64.102.249.7', 'gws123', '2017-01-03 01:13:50'),
(404, 2, NULL, '59.90.37.27', 'gws123', '2017-01-03 05:14:04'),
(405, 2, NULL, '103.252.168.5', 'gws123', '2017-01-03 07:10:15'),
(406, 2, NULL, '70.63.162.90', 'gws123', '2017-01-03 15:25:58'),
(407, 2, NULL, '27.58.22.233', 'gws123', '2017-01-03 17:03:12'),
(408, 2, NULL, '103.61.64.69', 'gws123', '2017-01-03 17:06:39'),
(409, 2, NULL, '70.63.162.90', 'gws123', '2017-01-03 18:07:26'),
(410, 2, NULL, '27.58.22.233', 'gws123', '2017-01-03 18:24:26'),
(411, 2, NULL, '103.61.64.69', 'gws123', '2017-01-03 18:28:21'),
(412, 2, NULL, '103.61.64.69', 'gws123', '2017-01-03 18:30:44'),
(413, 2, NULL, '70.63.162.90', 'gws123', '2017-01-03 21:00:44'),
(414, 2, NULL, '64.102.249.9', 'gws123', '2017-01-03 21:13:33'),
(415, 2, NULL, '106.193.146.27', 'gws123', '2017-01-03 21:13:40'),
(416, 2, NULL, '59.90.37.90', 'gws123', '2017-01-04 07:06:49'),
(417, 2, NULL, '59.90.37.90', 'gws123', '2017-01-04 07:54:20'),
(418, 2, NULL, '103.252.168.5', 'gws123', '2017-01-04 10:46:18'),
(419, 2, NULL, '106.221.128.38', 'gws123', '2017-01-04 11:29:42'),
(420, 2, NULL, '106.221.128.38', 'gws123', '2017-01-04 11:49:31'),
(421, 2, NULL, '103.252.168.5', 'gws123', '2017-01-05 11:33:26'),
(422, 2, NULL, '103.252.168.5', 'gws123', '2017-01-05 11:54:52'),
(423, 2, NULL, '117.198.82.29', 'gws123', '2017-01-05 17:03:33'),
(424, 2, NULL, '117.198.82.29', 'gws123', '2017-01-05 17:53:46'),
(425, 2, NULL, '106.210.140.247', 'gws123', '2017-01-05 18:02:41'),
(426, 2, NULL, '70.63.162.90', 'gws123', '2017-01-05 21:12:19'),
(427, 2, NULL, '106.210.140.247', 'gws123', '2017-01-05 21:16:14'),
(428, 2, NULL, '59.90.37.90', 'gws123', '2017-01-06 07:14:07'),
(429, 2, NULL, '59.90.37.90', 'gws123', '2017-01-06 07:15:35'),
(430, 2, NULL, '117.247.52.249', 'gws123', '2017-01-07 05:38:10'),
(431, 2, NULL, '117.247.52.249', 'gws123', '2017-01-07 05:45:09'),
(432, 2, NULL, '117.247.52.249', 'gws123', '2017-01-07 05:58:20'),
(433, 2, NULL, '103.252.168.5', 'gws123', '2017-01-07 06:32:36'),
(434, 2, NULL, '103.252.168.5', 'gws123', '2017-01-07 12:46:36'),
(435, 2, NULL, '106.210.194.67', 'gws123', '2017-01-07 12:46:38'),
(436, 2, NULL, '49.35.2.199', 'gws123', '2017-01-07 18:07:04'),
(437, 2, NULL, '107.77.105.36', 'gws123', '2017-01-08 05:12:40'),
(438, 2, NULL, '117.247.52.236', 'gws123', '2017-01-09 03:30:49'),
(439, 2, NULL, '106.210.147.92', 'gws123', '2017-01-09 06:53:59'),
(440, 2, NULL, '117.247.52.236', 'gws123', '2017-01-09 09:18:39'),
(441, 2, NULL, '117.247.52.236', 'gws123', '2017-01-09 09:51:57'),
(442, 2, NULL, '106.210.147.92', 'gws123', '2017-01-09 09:56:13'),
(443, 2, NULL, '117.247.52.236', 'gws123', '2017-01-09 10:18:21'),
(444, 2, NULL, '117.247.52.236', 'gws123', '2017-01-09 11:51:50'),
(445, 2, NULL, '117.247.52.236', 'gws123', '2017-01-09 12:17:54'),
(446, 2, NULL, '106.221.132.24', 'gws123', '2017-01-10 05:42:42'),
(447, 2, NULL, '106.221.132.24', 'gws123', '2017-01-10 05:47:02'),
(448, 2, NULL, '106.221.132.24', 'gws123', '2017-01-10 06:01:20'),
(449, 2, NULL, '106.221.132.24', 'gws123', '2017-01-10 06:03:08'),
(450, 2, NULL, '106.221.132.24', 'gws123', '2017-01-10 06:04:51'),
(451, 2, NULL, '106.221.132.24', 'gws123', '2017-01-10 06:09:05'),
(452, 2, NULL, '117.247.52.204', 'gws123', '2017-01-10 07:08:30'),
(453, 2, NULL, '117.247.52.204', 'gws123', '2017-01-10 07:09:21'),
(454, 2, NULL, '117.247.52.204', 'gws123', '2017-01-10 07:14:04'),
(455, 2, NULL, '117.247.52.204', 'gws123', '2017-01-10 08:21:05'),
(456, 2, NULL, '117.247.52.204', 'gws123', '2017-01-10 08:21:59'),
(457, 2, NULL, '117.247.52.204', 'gws123', '2017-01-10 08:29:07'),
(458, 2, NULL, '117.247.52.204', 'gws123', '2017-01-10 09:33:27'),
(459, 2, NULL, '117.247.52.204', 'gws123', '2017-01-10 11:35:21'),
(460, 2, NULL, '49.35.207.61', 'gws123', '2017-01-10 12:34:02'),
(461, 2, NULL, '117.247.52.204', 'gws123', '2017-01-10 13:10:57'),
(462, 2, NULL, '103.252.168.5', 'gws123', '2017-01-11 05:46:34'),
(463, 2, NULL, '103.252.168.5', 'gws123', '2017-01-11 06:10:36'),
(464, 2, NULL, '103.252.168.5', 'gws123', '2017-01-11 06:26:26'),
(465, 2, NULL, '103.252.168.5', 'gws123', '2017-01-11 06:54:32'),
(466, 2, NULL, '103.252.168.5', 'gws123', '2017-01-11 07:16:01'),
(467, 2, NULL, '103.252.168.5', 'gws123', '2017-01-11 08:35:22'),
(468, 2, NULL, '103.252.168.5', 'gws123', '2017-01-11 08:51:08'),
(469, 2, NULL, '106.210.220.177', 'gws123', '2017-01-11 08:56:22'),
(470, 2, NULL, '106.210.220.177', 'gws123', '2017-01-11 08:59:12'),
(471, 2, NULL, '106.210.220.177', 'gws123', '2017-01-11 09:08:07'),
(472, 2, NULL, '106.210.220.177', 'gws123', '2017-01-11 09:48:22'),
(473, 2, NULL, '106.210.220.177', 'gws123', '2017-01-11 10:54:53'),
(474, 2, NULL, '106.210.220.177', 'gws123', '2017-01-11 11:01:30'),
(475, 2, NULL, '106.210.220.177', 'gws123', '2017-01-11 11:42:37'),
(476, 2, NULL, '117.247.52.204', 'gws123', '2017-01-11 11:59:45'),
(477, 2, NULL, '117.247.52.204', 'gws123', '2017-01-11 12:03:44'),
(478, 2, NULL, '117.247.52.204', 'gws123', '2017-01-11 12:07:23'),
(479, 2, NULL, '117.247.52.204', 'gws123', '2017-01-11 12:29:46'),
(480, 2, NULL, '117.247.52.204', 'gws123', '2017-01-11 12:52:14'),
(481, 2, NULL, '106.210.220.177', 'gws123', '2017-01-11 13:55:16'),
(482, 2, NULL, '103.252.168.5', 'gws123', '2017-01-11 13:57:54'),
(483, 2, NULL, '103.252.168.5', 'gws123', '2017-01-11 14:10:26'),
(484, 2, NULL, '103.252.168.5', 'gws123', '2017-01-11 14:18:21'),
(485, 2, NULL, '103.252.168.5', 'gws123', '2017-01-11 14:19:08'),
(486, 2, NULL, '103.252.168.5', 'gws123', '2017-01-12 04:58:54'),
(487, 2, NULL, '103.252.168.5', 'gws123', '2017-01-12 04:59:07'),
(488, 2, NULL, '106.210.219.108', 'gws123', '2017-01-12 05:24:15'),
(489, 2, NULL, '117.247.52.204', 'gws123', '2017-01-12 05:43:48'),
(490, 2, NULL, '117.247.52.204', 'gws123', '2017-01-12 06:43:57'),
(491, 2, NULL, '117.247.52.204', 'gws123', '2017-01-12 07:01:24'),
(492, 2, NULL, '117.247.52.204', 'gws123', '2017-01-12 08:07:07'),
(493, 2, NULL, '103.252.168.5', 'gws123', '2017-01-12 08:26:43'),
(494, 2, NULL, '106.210.219.108', 'gws123', '2017-01-12 10:00:02'),
(495, 2, NULL, '117.247.52.204', 'gws123', '2017-01-12 10:09:44'),
(496, 2, NULL, '117.247.52.204', 'gws123', '2017-01-12 11:46:12'),
(497, 2, NULL, '117.247.52.204', 'gws123', '2017-01-12 12:04:09'),
(498, 2, NULL, '117.247.52.204', 'gws123', '2017-01-12 12:23:01'),
(499, 2, NULL, '117.247.52.204', 'gws123', '2017-01-12 12:34:01'),
(500, 2, NULL, '103.252.168.5', 'gws123', '2017-01-12 13:52:04'),
(501, 2, NULL, '117.198.92.192', 'Gws123', '2017-01-12 15:53:20'),
(502, 2, NULL, '106.193.217.89', 'gws123', '2017-01-12 17:42:24'),
(503, 2, NULL, '117.198.92.192', 'gws123', '2017-01-12 18:30:48'),
(504, 2, NULL, '117.198.92.192', 'gws123', '2017-01-12 18:36:30'),
(505, 2, NULL, '117.198.92.192', 'gws123', '2017-01-12 18:39:36'),
(506, 2, NULL, '117.198.92.192', 'gws123', '2017-01-12 18:43:38'),
(507, 2, NULL, '117.198.92.192', 'gws123', '2017-01-12 18:52:30'),
(508, 2, NULL, '117.198.92.192', 'gws123', '2017-01-12 18:54:55'),
(509, 2, NULL, '117.247.52.204', 'gws123', '2017-01-13 04:19:24'),
(510, 2, NULL, '47.247.215.250', 'Gws123', '2017-01-13 09:18:16'),
(511, 2, NULL, '47.247.215.250', 'Gws123', '2017-01-13 09:21:14'),
(512, 2, NULL, '117.247.52.204', 'gws123', '2017-01-13 09:26:12'),
(513, 2, NULL, '117.247.52.204', 'gws123', '2017-01-13 09:29:18'),
(514, 2, NULL, '117.247.52.204', 'gws123', '2017-01-13 09:35:09'),
(515, 2, NULL, '47.247.141.176', 'Gws123', '2017-01-13 09:46:20'),
(516, 2, NULL, '106.193.156.106', 'gws123', '2017-01-13 10:10:01'),
(517, 2, NULL, '117.247.52.204', 'gws123', '2017-01-13 10:15:23'),
(518, 2, NULL, '47.247.215.93', 'Gws123', '2017-01-13 10:28:15'),
(519, 2, NULL, '47.247.215.93', 'Gws123', '2017-01-13 10:37:28'),
(520, 2, NULL, '117.247.52.204', 'gws123', '2017-01-13 10:38:39'),
(521, 2, NULL, '117.247.52.204', 'gws123', '2017-01-13 11:11:30'),
(522, 2, NULL, '103.252.168.5', 'gws123', '2017-01-13 12:23:01'),
(523, 2, NULL, '106.193.156.106', 'gws123', '2017-01-13 14:38:59'),
(524, 2, NULL, '117.248.239.171', 'GWS123', '2017-01-13 16:55:03'),
(525, 2, NULL, '117.248.239.171', 'GWS123 ', '2017-01-13 16:58:28'),
(526, 2, NULL, '117.248.239.171', 'GWS123 ', '2017-01-13 17:34:46'),
(527, 2, NULL, '117.248.239.171', 'GWS123 ', '2017-01-13 17:47:06'),
(528, 2, NULL, '117.198.87.55', 'GWS123 ', '2017-01-14 03:33:21'),
(529, 2, NULL, '117.247.52.204', 'gws123', '2017-01-14 04:19:25'),
(530, 2, NULL, '103.252.168.5', 'gws123', '2017-01-14 09:15:22'),
(531, 2, NULL, '106.210.217.158', 'gws123', '2017-01-14 09:25:17'),
(532, 2, NULL, '103.252.168.5', 'gws123', '2017-01-14 11:00:12'),
(533, 2, NULL, '106.210.217.158', 'gws123', '2017-01-14 11:04:29'),
(534, 2, NULL, '106.193.198.227', 'gws123', '2017-01-14 11:04:54'),
(535, 2, NULL, '117.247.52.204', 'gws123', '2017-01-14 11:14:22'),
(536, 2, NULL, '117.247.52.204', 'gws123', '2017-01-14 11:29:04'),
(537, 2, NULL, '117.247.52.204', 'Gws123', '2017-01-14 11:37:14'),
(538, 2, NULL, '117.247.52.204', 'gws123', '2017-01-14 12:00:20'),
(539, 2, NULL, '122.168.148.139', 'gws123', '2017-01-15 14:48:32'),
(540, 2, NULL, '59.90.37.232', 'Gws123', '2017-01-16 04:57:04'),
(541, 2, NULL, '106.193.132.130', 'gws123', '2017-01-16 05:24:07'),
(542, 2, NULL, '106.193.132.130', 'gws123', '2017-01-16 06:14:01'),
(543, 2, NULL, '106.193.132.130', 'gws123', '2017-01-16 06:14:03'),
(544, 2, NULL, '106.193.132.130', 'gws123', '2017-01-16 06:20:36'),
(545, 2, NULL, '59.90.37.232', 'gws123', '2017-01-16 06:33:58'),
(546, 2, NULL, '106.193.132.130', 'gws123', '2017-01-16 07:05:31'),
(547, 2, NULL, '59.90.37.232', 'gws123', '2017-01-16 08:13:04'),
(548, 2, NULL, '59.90.37.232', 'gws123', '2017-01-16 09:03:50'),
(549, 2, NULL, '59.90.37.232', 'gws123', '2017-01-16 09:06:46'),
(550, 2, NULL, '106.193.132.130', 'gws123', '2017-01-16 09:13:08'),
(551, 2, NULL, '106.193.132.130', 'gws123', '2017-01-16 09:19:11'),
(552, 2, NULL, '59.90.36.151', 'gws123', '2017-01-17 06:34:10'),
(553, 2, NULL, '103.252.168.5', 'gws123', '2017-01-17 07:10:04'),
(554, 2, NULL, '103.252.168.5', 'gws123', '2017-01-17 07:41:31'),
(555, 2, NULL, '59.90.36.151', 'gws123', '2017-01-17 07:43:22'),
(556, 2, NULL, '103.252.168.5', 'gws123', '2017-01-17 07:43:40'),
(557, 2, NULL, '59.90.36.151', 'Gws123', '2017-01-17 07:46:09'),
(558, 2, NULL, '103.252.168.5', 'gws123', '2017-01-17 08:16:37'),
(559, 2, NULL, '59.94.246.17', 'gws123', '2017-01-17 17:26:22'),
(560, 2, NULL, '59.94.246.17', 'gws123', '2017-01-17 17:30:33'),
(561, 2, NULL, '117.247.52.22', 'Gws123', '2017-01-18 04:53:21'),
(562, 2, NULL, '103.252.168.5', 'gws123', '2017-01-18 05:43:36'),
(563, 2, NULL, '112.133.251.55', 'gws123', '2017-01-18 06:36:10'),
(564, 2, NULL, '103.252.168.5', 'gws123', '2017-01-18 07:13:32'),
(565, 2, NULL, '103.252.168.5', 'gws123', '2017-01-18 07:14:25'),
(566, 2, NULL, '103.252.168.5', 'gws123', '2017-01-18 07:15:07'),
(567, 2, NULL, '103.252.168.5', 'gws123', '2017-01-18 07:16:54'),
(568, 2, NULL, '103.252.168.5', 'gws123', '2017-01-18 07:29:17');

-- --------------------------------------------------------

--
-- Table structure for table `sma_variants`
--

CREATE TABLE IF NOT EXISTS `sma_variants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(55) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `sma_variants`
--

INSERT INTO `sma_variants` (`id`, `name`) VALUES
(1, 'test variant'),
(2, 'abc');

-- --------------------------------------------------------

--
-- Table structure for table `sma_warehouses`
--

CREATE TABLE IF NOT EXISTS `sma_warehouses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `map` varchar(255) DEFAULT NULL,
  `phone` varchar(55) DEFAULT NULL,
  `email` varchar(55) DEFAULT NULL,
  `price_group_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `sma_warehouses`
--

INSERT INTO `sma_warehouses` (`id`, `code`, `name`, `address`, `map`, `phone`, `email`, `price_group_id`) VALUES
(1, 'Ware house 1-1', 'Warehouse 1', '<p>Address, City</p>', '3ac5c17193d28938af8dccb19dc84256.jpeg', '012345678', 'whi@tecdiary.com', 2),
(2, 'WHII', 'Warehouse 2', '<p>Warehouse 2, Jalan Sultan Ismail, 54000, Kuala Lumpur</p>', NULL, '0105292122', 'whii@tecdiary.com', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_warehouses_products`
--

CREATE TABLE IF NOT EXISTS `sma_warehouses_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `rack` varchar(55) DEFAULT NULL,
  `avg_cost` decimal(25,4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  KEY `warehouse_id` (`warehouse_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=56 ;

--
-- Dumping data for table `sma_warehouses_products`
--

INSERT INTO `sma_warehouses_products` (`id`, `product_id`, `warehouse_id`, `quantity`, `rack`, `avg_cost`) VALUES
(3, 2, 1, '93.0000', NULL, '36.0000'),
(4, 2, 2, '0.0000', NULL, '36.0000'),
(5, 3, 2, '2.0000', NULL, '25.0000'),
(6, 3, 1, '1042.0000', NULL, '25.0000'),
(7, 4, 1, '994.0000', '12', '90.0000'),
(8, 4, 2, '1000.0000', '50', '90.0000'),
(17, 9, 1, '0.0000', NULL, '0.0000'),
(18, 9, 2, '0.0000', NULL, '0.0000'),
(19, 10, 1, '0.0000', NULL, '0.0000'),
(20, 10, 2, '0.0000', NULL, '0.0000'),
(23, 12, 1, '159.0000', NULL, '80.0000'),
(24, 12, 2, '30.0000', NULL, '80.0000'),
(27, 16, 1, '849.9930', NULL, '50.0000'),
(28, 14, 1, '-2.0000', NULL, '34.0000'),
(33, 19, 1, '10.0000', '5', '270.0000'),
(34, 19, 2, '10.0000', '5', '270.0000'),
(35, 20, 1, '14.0000', '8', '100.0000'),
(36, 20, 2, '10.0000', '2', '100.0000'),
(37, 22, 1, '-2.0000', NULL, '500.0000'),
(38, 22, 2, '1.0000', NULL, '500.0000'),
(43, 25, 1, '5.0000', NULL, '150.0000'),
(44, 26, 1, '9.0000', NULL, '180.0000'),
(47, 28, 1, '30.0000', NULL, '20.0000'),
(51, 31, 1, '2.0000', NULL, '50.0000'),
(53, 16, 2, '0.0000', NULL, '50.0000'),
(54, 15, 1, '-41.0000', NULL, '50.0000'),
(55, 15, 2, '0.0000', NULL, '50.0000');

-- --------------------------------------------------------

--
-- Table structure for table `sma_warehouses_products_variants`
--

CREATE TABLE IF NOT EXISTS `sma_warehouses_products_variants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `option_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `rack` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `option_id` (`option_id`),
  KEY `product_id` (`product_id`),
  KEY `warehouse_id` (`warehouse_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
