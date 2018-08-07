-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 07, 2018 at 10:01 AM
-- Server version: 5.6.39-cll-lve
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cealm`
--

-- --------------------------------------------------------

--
-- Table structure for table `administratives`
--

CREATE TABLE `administratives` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `administratives`
--

INSERT INTO `administratives` (`id`, `user_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, '2017-08-08 14:01:43', '2017-08-08 14:01:43', NULL),
(2, 2, '2018-03-24 16:07:08', '2018-03-24 16:07:08', NULL),
(3, 4, '2018-03-24 16:28:45', '2018-03-24 16:28:45', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `administrators`
--

CREATE TABLE `administrators` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `administrators`
--

INSERT INTO `administrators` (`id`, `user_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, '2017-08-08 14:01:43', '2017-08-08 14:01:43', NULL),
(2, 2, '2018-03-24 16:06:30', '2018-03-24 16:06:30', NULL),
(3, 4, '2018-03-24 16:29:12', '2018-03-24 16:29:12', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `attendances`
--

CREATE TABLE `attendances` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `record_date` date NOT NULL,
  `record_time` time NOT NULL,
  `record_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `attendances`
--

INSERT INTO `attendances` (`id`, `user_id`, `record_date`, `record_time`, `record_type`, `created_at`, `updated_at`) VALUES
(1, 2, '2018-03-24', '10:07:20', 'entrada', '2018-03-24 17:07:20', '2018-03-24 17:07:20'),
(2, 2, '2018-03-24', '10:08:01', 'salida', '2018-03-24 17:08:01', '2018-03-24 17:08:01'),
(3, 1, '2018-08-04', '10:16:39', 'entrada', '2018-08-04 17:16:39', '2018-08-04 17:16:39');

-- --------------------------------------------------------

--
-- Table structure for table `balances`
--

CREATE TABLE `balances` (
  `id` int(10) UNSIGNED NOT NULL,
  `opening_balance` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `closing_balance` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `month` int(10) UNSIGNED NOT NULL,
  `year` int(10) UNSIGNED NOT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `balances`
--

INSERT INTO `balances` (`id`, `opening_balance`, `closing_balance`, `month`, `year`, `status`, `created_at`, `updated_at`) VALUES
(1, '0', '0', 5, 2018, 'abierto', '2018-05-13 21:18:12', '2018-05-13 21:18:12');

-- --------------------------------------------------------

--
-- Table structure for table `bimesters`
--

CREATE TABLE `bimesters` (
  `id` int(10) UNSIGNED NOT NULL,
  `year_id` int(10) UNSIGNED NOT NULL,
  `num_bimester` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `progress` tinyint(1) NOT NULL DEFAULT '0',
  `from` date NOT NULL,
  `to` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `bimesters`
--

INSERT INTO `bimesters` (`id`, `year_id`, `num_bimester`, `name`, `progress`, `from`, `to`, `created_at`, `updated_at`) VALUES
(1, 1, 'I', 'I / 2018', 0, '2018-02-05', '2018-03-30', '2018-03-24 16:22:41', '2018-07-11 19:01:29'),
(2, 1, 'II', 'II / 2018', 0, '2018-04-02', '2018-05-25', '2018-03-24 16:34:59', '2018-07-12 22:21:21'),
(3, 1, 'III', 'III / 2018', 1, '2018-05-28', '2018-07-20', '2018-05-19 19:04:36', '2018-07-28 17:46:36');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `language_id` int(10) UNSIGNED NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `acronym` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `language_id`, `description`, `acronym`, `created_at`, `updated_at`) VALUES
(3, 2, 'SPEAKING', 'S', '2018-03-24 16:17:08', '2018-03-24 16:17:08'),
(4, 2, 'LISTENING', 'L', '2018-03-24 16:17:10', '2018-03-24 16:17:10'),
(5, 2, 'READING', 'R', '2018-03-24 16:17:11', '2018-03-24 16:17:11'),
(6, 2, 'USE OF ENGLISH', 'U', '2018-03-24 16:17:22', '2018-03-24 16:17:22'),
(7, 2, 'GRAMMAR', 'G', '2018-03-24 16:17:25', '2018-03-24 16:17:25'),
(8, 2, 'WRITING', 'W', '2018-03-24 17:18:06', '2018-03-24 17:18:06');

-- --------------------------------------------------------

--
-- Table structure for table `category_marks`
--

CREATE TABLE `category_marks` (
  `id` int(10) UNSIGNED NOT NULL,
  `exam_type_id` int(10) UNSIGNED NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `percentage` int(11) NOT NULL,
  `acronym` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `controls`
--

CREATE TABLE `controls` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `controls`
--

INSERT INTO `controls` (`id`, `user_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, '2017-08-08 14:01:43', '2017-08-08 14:01:43', NULL),
(2, 2, '2018-03-24 16:07:09', '2018-03-24 16:07:09', NULL),
(3, 4, '2018-03-24 16:29:15', '2018-03-24 16:29:15', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cover_images`
--

CREATE TABLE `cover_images` (
  `id` int(10) UNSIGNED NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cover_images`
--

INSERT INTO `cover_images` (`id`, `description`, `url`, `created_at`, `updated_at`) VALUES
(2, 'Graduación de Técnico Superior en Inglés 2017', '/images/cover_images/3JOoV7dkfYpbuo24.jpg', '2018-02-07 04:29:34', '2018-02-07 04:29:34'),
(4, 'Centro de Enseñana-Aprendizaje de Lenguas Modernas CEALM S.R.L', '/images/cover_images/zhfZpgbsR11X9fXEjpeg', '2018-02-07 04:44:29', '2018-02-07 04:44:29'),
(5, 'Centro de Enseñana-Aprendizaje de Lenguas Modernas CEALM S.R.L', '/images/cover_images/jxVpOvgVmLqS1Vnwjpeg', '2018-02-07 04:44:30', '2018-02-07 04:44:30'),
(6, 'Centro de Enseñana-Aprendizaje de Lenguas Modernas CEALM S.R.L', '/images/cover_images/egHPtx0Or9aL5iuUjpeg', '2018-02-07 04:44:30', '2018-02-07 04:44:30'),
(7, 'Speaking Club Centro de Enseñana-Aprendizaje de Lenguas Modernas CEALM S.R.L', '/images/cover_images/RLbsDkXGYl08aOZ9jpeg', '2018-02-07 04:44:30', '2018-03-24 16:09:56'),
(8, 'Centro de Enseñana-Aprendizaje de Lenguas Modernas CEALM S.R.L', '/images/cover_images/g2oxzX57DWctN0H8jpeg', '2018-02-07 04:44:30', '2018-02-07 04:44:30'),
(9, 'Centro de Enseñana-Aprendizaje de Lenguas Modernas CEALM S.R.L', '/images/cover_images/noKkQq0FAYoipIchjpeg', '2018-02-07 04:44:30', '2018-02-07 04:44:30'),
(10, 'Centro de Enseñana-Aprendizaje de Lenguas Modernas CEALM S.R.L', '/images/cover_images/aFCWX9TGmN3jN6Qyjpeg', '2018-02-07 04:44:30', '2018-02-07 04:44:30'),
(11, 'Centro de Enseñana-Aprendizaje de Lenguas Modernas CEALM S.R.L', '/images/cover_images/MO7zkR76rVAnnRKZjpeg', '2018-02-07 04:44:30', '2018-02-07 04:44:30'),
(12, 'Centro de Enseñana-Aprendizaje de Lenguas Modernas CEALM S.R.L', '/images/cover_images/RiPYonb6t7yjyMmrjpeg', '2018-02-07 04:44:32', '2018-02-07 04:44:32'),
(13, 'Centro de Enseñana-Aprendizaje de Lenguas Modernas CEALM S.R.L', '/images/cover_images/IsFChHpSVL5vrov5jpeg', '2018-02-07 04:44:32', '2018-02-07 04:44:32'),
(14, 'Centro de Enseñana-Aprendizaje de Lenguas Modernas CEALM S.R.L', '/images/cover_images/xmRO6UiR3YNBQQK1jpeg', '2018-02-07 04:44:32', '2018-02-07 04:44:32'),
(15, 'Planta Docente Centro de Enseñana-Aprendizaje de Lenguas Modernas CEALM S.R.L', '/images/cover_images/lGVHdHjPORepVDgAjpeg', '2018-02-07 04:44:32', '2018-03-24 16:09:29'),
(16, 'Centro de Enseñana-Aprendizaje de Lenguas Modernas CEALM S.R.L', '/images/cover_images/OEZTyUzQEHulEEQujpeg', '2018-02-07 04:44:32', '2018-02-07 04:44:32'),
(17, 'Centro de Enseñana-Aprendizaje de Lenguas Modernas CEALM S.R.L', '/images/cover_images/R2FshcOrN6qGTYxPjpeg', '2018-02-07 04:44:32', '2018-02-07 04:44:32'),
(18, 'Instituto Técnico CEALM S.R.L con Resolución Ministerial 2507/2017', '/images/cover_images/29Ga5OSDRgYN7lwm.jpg', '2018-02-07 04:54:12', '2018-02-07 04:54:12');

-- --------------------------------------------------------

--
-- Table structure for table `deposits`
--

CREATE TABLE `deposits` (
  `id` int(10) UNSIGNED NOT NULL,
  `balance_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `amount` float(8,2) NOT NULL,
  `student_id` int(10) UNSIGNED NOT NULL,
  `deposit_date` date NOT NULL,
  `client` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `client_identity_card` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `deposits`
--

INSERT INTO `deposits` (`id`, `balance_id`, `user_id`, `amount`, `student_id`, `deposit_date`, `client`, `client_identity_card`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 250.00, 1, '2018-05-13', 'Bascon Flores Nashira Belen', '7275475', '2018-05-13 23:00:50', '2018-05-13 23:00:50'),
(2, 1, 1, 50.00, 2, '2018-07-11', 'nombre del cliente', '123456', '2018-07-11 14:10:53', '2018-07-11 14:10:53'),
(3, 1, 1, 350.00, 1, '2018-07-11', 'BASCON FLORES', '123456789', '2018-07-11 18:12:26', '2018-07-11 18:12:26'),
(4, 1, 1, 270.00, 3, '2018-07-11', 'VIGABRIEL ARANCIBIA IVAN', '12358782', '2018-07-11 18:18:42', '2018-07-11 18:18:42'),
(6, 1, 1, 270.00, 3, '2018-07-11', 'VIGABRIEL ARANCIBIA IVAN', '123456', '2018-07-11 18:20:18', '2018-07-11 18:20:18'),
(7, 1, 1, 540.00, 3, '2018-07-11', 'VIGABRIEL ARANCIBIA IVAN', '123456', '2018-07-11 18:21:08', '2018-07-11 18:21:08'),
(8, 1, 1, 270.00, 101, '2018-07-19', 'BECERRA VILLCA DANIELA', '75428963', '2018-07-20 00:13:40', '2018-07-20 00:13:40');

-- --------------------------------------------------------

--
-- Table structure for table `deposit_items`
--

CREATE TABLE `deposit_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `deposit_id` int(10) UNSIGNED NOT NULL,
  `deposit_type_id` int(10) UNSIGNED NOT NULL,
  `month` int(11) NOT NULL,
  `year` int(11) NOT NULL,
  `amount` float(8,2) NOT NULL,
  `additional_information` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `deposit_items`
--

INSERT INTO `deposit_items` (`id`, `deposit_id`, `deposit_type_id`, `month`, `year`, `amount`, `additional_information`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 1, 2018, 25.00, 'matricula', '2018-07-11 14:13:07', '2018-07-11 14:13:07'),
(2, 2, 3, 1, 2018, 25.00, 'Libro ingles modulo 1', '2018-07-11 14:13:31', '2018-07-11 14:13:31'),
(3, 3, 7, 6, 2018, 100.00, 'EXAMEN DE UBICACION', '2018-07-11 18:15:47', '2018-07-11 18:15:47'),
(4, 3, 3, 6, 2018, 250.00, 'detalle', '2018-07-11 18:16:23', '2018-07-11 18:16:47'),
(5, 4, 2, 4, 2018, 270.00, 'PAGO DE PENSION MENSUAL DE ABRIL DEL 2018', '2018-07-11 18:19:16', '2018-07-11 18:19:16'),
(6, 7, 2, 6, 2018, 270.00, 'PAGO DEL MES DE JUNIO', '2018-07-11 18:21:43', '2018-07-11 18:21:43'),
(7, 7, 2, 7, 2018, 270.00, 'PAGO DEL MES DE JULIO', '2018-07-11 18:21:58', '2018-07-11 18:21:58'),
(8, 8, 2, 7, 2018, 270.00, '', '2018-07-20 00:16:25', '2018-07-20 00:17:06');

-- --------------------------------------------------------

--
-- Table structure for table `deposit_types`
--

CREATE TABLE `deposit_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `deposit_types`
--

INSERT INTO `deposit_types` (`id`, `description`, `created_at`, `updated_at`) VALUES
(1, 'MATRICULA', '2018-03-24 16:58:27', '2018-03-24 16:58:27'),
(2, 'PENSION MENSUAL', '2018-03-24 16:58:41', '2018-03-24 16:58:41'),
(3, 'TEXTO', '2018-03-24 16:58:47', '2018-03-24 16:58:47'),
(4, 'TALLER DE CAPACITACIÓN A DOCENTES', '2018-05-14 02:58:58', '2018-05-14 02:58:58'),
(5, 'PENSIÓN BIMESTRAL', '2018-05-14 02:59:25', '2018-05-14 02:59:25'),
(6, 'PENSIÓN SEMESTRAL', '2018-05-14 03:00:51', '2018-05-14 03:00:51'),
(7, 'EXAMEN DE UBICACIÓN', '2018-07-11 18:14:22', '2018-07-11 18:14:22');

-- --------------------------------------------------------

--
-- Table structure for table `documents`
--

CREATE TABLE `documents` (
  `id` int(10) UNSIGNED NOT NULL,
  `document_reception_id` int(10) UNSIGNED NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `documents_reception`
--

CREATE TABLE `documents_reception` (
  `id` int(10) UNSIGNED NOT NULL,
  `student_id` int(10) UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `documents_reception`
--

INSERT INTO `documents_reception` (`id`, `student_id`, `code`, `created_at`, `updated_at`) VALUES
(1, 1, '2018-72332671-OR', '2018-03-24 17:57:40', '2018-03-24 17:57:40'),
(2, 1, '2018-72332671-OR', '2018-03-24 17:57:45', '2018-03-24 17:57:45'),
(3, 3, '2018-undefined-undef', '2018-07-14 04:11:43', '2018-07-14 04:11:43'),
(4, 3, '2018-undefined-undef', '2018-07-14 04:11:46', '2018-07-14 04:11:46'),
(5, 3, '2018-undefined-undef', '2018-07-14 04:12:25', '2018-07-14 04:12:25'),
(6, 3, '2018-undefined-undef', '2018-07-14 04:12:27', '2018-07-14 04:12:27'),
(7, 3, '2018-undefined-undef', '2018-07-14 04:12:28', '2018-07-14 04:12:28'),
(8, 3, '2018-undefined-undef', '2018-07-14 04:12:34', '2018-07-14 04:12:34'),
(9, 3, '2018-undefined-undef', '2018-07-14 04:12:43', '2018-07-14 04:12:43'),
(10, 3, '2018-undefined-undef', '2018-07-14 04:13:35', '2018-07-14 04:13:35'),
(11, 3, '2018-undefined-undef', '2018-07-14 04:13:36', '2018-07-14 04:13:36'),
(12, 3, '2018-undefined-undef', '2018-07-14 04:13:36', '2018-07-14 04:13:36'),
(13, 3, '2018-undefined-undef', '2018-07-14 04:13:36', '2018-07-14 04:13:36'),
(14, 3, '2018-undefined-undef', '2018-07-14 04:13:43', '2018-07-14 04:13:43'),
(15, 3, '2018-undefined-undef', '2018-07-14 04:13:46', '2018-07-14 04:13:46'),
(16, 3, '2018-undefined-undef', '2018-07-14 04:13:52', '2018-07-14 04:13:52'),
(17, 3, '2018-undefined-undef', '2018-07-14 04:13:55', '2018-07-14 04:13:55'),
(18, 3, '2018-undefined-undef', '2018-07-14 04:14:00', '2018-07-14 04:14:00'),
(19, 3, '2018-undefined-undef', '2018-07-14 04:14:03', '2018-07-14 04:14:03'),
(20, 3, '2018-undefined-undef', '2018-07-14 04:14:15', '2018-07-14 04:14:15'),
(21, 3, '2018-undefined-undef', '2018-07-14 04:14:30', '2018-07-14 04:14:30'),
(22, 3, '2018-undefined-undef', '2018-07-14 04:14:31', '2018-07-14 04:14:31'),
(23, 3, '2018-undefined-undef', '2018-07-14 04:14:31', '2018-07-14 04:14:31'),
(24, 3, '2018-undefined-undef', '2018-07-14 04:14:31', '2018-07-14 04:14:31'),
(25, 3, '2018-undefined-undef', '2018-07-14 04:15:27', '2018-07-14 04:15:27');

-- --------------------------------------------------------

--
-- Table structure for table `exam_types`
--

CREATE TABLE `exam_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `group_id` int(10) UNSIGNED NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `percentage` int(11) NOT NULL,
  `acronym` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `teacher_id` int(10) UNSIGNED NOT NULL,
  `subject_id` int(10) UNSIGNED NOT NULL,
  `bimester_id` int(10) UNSIGNED NOT NULL,
  `room_id` int(10) UNSIGNED NOT NULL,
  `parallel` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `from` time NOT NULL,
  `to` time NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `teacher_id`, `subject_id`, `bimester_id`, `room_id`, `parallel`, `name`, `from`, `to`, `created_at`, `updated_at`) VALUES
(4, 1, 19, 1, 3, 'A', 'FRA 1-A', '07:00:00', '08:00:00', '2018-03-24 16:49:21', '2018-03-24 16:49:21'),
(6, 1, 31, 2, 3, 'A', 'ENG 8-A', '18:30:00', '20:00:00', '2018-07-11 19:12:42', '2018-07-11 19:12:42'),
(7, 8, 26, 2, 1, 'D', 'ENG 3-D', '20:00:00', '21:30:00', '2018-07-12 02:44:21', '2018-07-12 02:44:21'),
(8, 11, 26, 2, 2, 'E', 'ENG 3-E', '17:00:00', '18:30:00', '2018-07-12 22:18:28', '2018-07-12 22:18:28'),
(9, 5, 31, 3, 3, 'A', 'ENG 8-A', '18:30:00', '20:00:00', '2018-07-14 04:24:54', '2018-07-14 04:24:54'),
(10, 5, 50, 3, 3, 'A', 'ENG 8-A', '18:30:00', '20:00:00', '2018-07-14 04:25:37', '2018-07-14 04:25:37'),
(11, 5, 61, 3, 3, 'A', 'ENG 8-A', '18:30:00', '20:00:00', '2018-07-14 04:26:38', '2018-07-14 04:26:38'),
(13, 12, 29, 3, 1, 'A', 'ENG 5-A', '18:30:00', '20:00:00', '2018-07-14 04:32:05', '2018-07-14 04:32:05'),
(14, 12, 44, 3, 1, 'A', 'ENG 5-A', '18:30:00', '20:00:00', '2018-07-14 04:32:29', '2018-07-14 04:32:29'),
(15, 12, 57, 3, 1, 'A', 'ENG 5-A', '18:30:00', '20:00:00', '2018-07-14 04:32:53', '2018-07-14 04:32:53'),
(41, 6, 26, 3, 4, 'C', 'ENG 3-C', '17:00:00', '18:30:00', '2018-07-21 17:58:38', '2018-07-21 17:58:38'),
(42, 6, 45, 3, 4, 'C', 'ENG 3-C', '17:00:00', '18:30:00', '2018-07-21 17:59:00', '2018-07-21 17:59:00'),
(43, 6, 45, 3, 4, 'C', 'ENG 3-C', '17:00:00', '18:30:00', '2018-07-21 17:59:20', '2018-07-21 17:59:20'),
(44, 7, 24, 3, 2, 'A', 'ENG 1-A', '18:30:00', '20:00:00', '2018-07-21 18:01:09', '2018-07-21 18:01:09'),
(45, 7, 42, 3, 2, 'A', 'ENG 1-A', '18:30:00', '20:00:00', '2018-07-21 18:01:19', '2018-07-21 18:01:19'),
(46, 7, 54, 3, 2, 'A', 'ENG 1-A', '18:30:00', '20:00:00', '2018-07-21 18:01:37', '2018-07-21 18:01:37'),
(47, 4, 24, 3, 1, 'B', 'ENG 1-B', '08:30:00', '10:00:00', '2018-07-21 18:02:54', '2018-07-21 18:02:54'),
(48, 4, 42, 3, 1, 'B', 'ENG 1-B', '08:30:00', '10:00:00', '2018-07-21 18:03:06', '2018-07-21 18:03:06'),
(49, 4, 54, 3, 1, 'B', 'ENG 1-B', '08:30:00', '10:00:00', '2018-07-21 18:03:14', '2018-07-21 18:03:14'),
(50, 4, 28, 3, 6, 'A', 'ENG 2-A', '18:30:00', '20:00:00', '2018-07-21 18:05:13', '2018-07-21 18:05:13'),
(51, 4, 43, 3, 6, 'A', 'ENG 2-A', '18:30:00', '20:00:00', '2018-07-21 18:05:24', '2018-07-21 18:05:24'),
(52, 4, 55, 3, 6, 'A', 'ENG 2-A', '18:30:00', '20:00:00', '2018-07-21 18:05:32', '2018-07-21 18:05:32'),
(53, 7, 26, 3, 2, 'F', 'ENG 3-F', '08:30:00', '10:00:00', '2018-07-21 18:06:49', '2018-07-21 18:06:49'),
(54, 7, 45, 3, 2, 'F', 'ENG 3-F', '08:30:00', '10:00:00', '2018-07-21 18:07:05', '2018-07-21 18:07:05'),
(55, 7, 59, 3, 2, 'F', 'ENG 3-F', '08:30:00', '10:00:00', '2018-07-21 18:07:11', '2018-07-21 18:07:11'),
(56, 4, 26, 3, 1, 'B', 'ENG 3-B', '10:30:00', '12:00:00', '2018-07-21 18:08:15', '2018-07-21 18:08:15'),
(57, 4, 45, 3, 1, 'B', 'ENG 3-B', '10:30:00', '12:00:00', '2018-07-21 18:08:25', '2018-07-21 18:08:25'),
(58, 4, 59, 3, 1, 'B', 'ENG 3-B', '10:30:00', '12:00:00', '2018-07-21 18:08:33', '2018-07-21 18:08:33'),
(59, 4, 26, 3, 6, 'A', 'ENG 3-A', '20:00:00', '21:30:00', '2018-07-21 18:10:56', '2018-07-21 18:10:56'),
(60, 4, 45, 3, 6, 'A', 'ENG 3-A', '20:00:00', '21:30:00', '2018-07-21 18:11:06', '2018-07-21 18:11:06'),
(61, 4, 59, 3, 6, 'A', 'ENG 3-A', '20:00:00', '21:30:00', '2018-07-21 18:11:14', '2018-07-21 18:11:14'),
(62, 8, 26, 3, 1, 'D', 'ENG 3-D', '20:00:00', '21:30:00', '2018-07-21 18:12:32', '2018-07-21 18:12:32'),
(63, 8, 45, 3, 1, 'D', 'ENG 3-D', '20:00:00', '21:30:00', '2018-07-21 18:12:41', '2018-07-21 18:12:41'),
(64, 8, 59, 3, 1, 'D', 'ENG 3-D', '20:00:00', '21:30:00', '2018-07-21 18:12:48', '2018-07-21 18:12:48'),
(65, 11, 26, 3, 1, 'E', 'ENG 3-E', '17:00:00', '18:30:00', '2018-07-21 18:15:16', '2018-07-21 18:15:16'),
(67, 11, 45, 3, 1, 'E', 'ENG 3-E', '17:00:00', '18:30:00', '2018-07-21 18:16:02', '2018-07-21 18:16:02'),
(68, 11, 59, 3, 1, 'E', 'ENG 3-E', '17:00:00', '18:30:00', '2018-07-21 18:16:09', '2018-07-21 18:16:09'),
(69, 3, 25, 3, 4, 'A', 'ENG 4-A', '20:00:00', '21:30:00', '2018-07-21 18:19:16', '2018-07-21 18:19:16'),
(70, 3, 47, 3, 4, 'A', 'ENG 4-A', '20:00:00', '21:30:00', '2018-07-21 18:19:23', '2018-07-21 18:19:23'),
(71, 3, 58, 3, 4, 'A', 'ENG 4-A', '20:00:00', '21:30:00', '2018-07-21 18:19:29', '2018-07-21 18:19:29'),
(72, 10, 27, 3, 3, 'A', 'ENG 7-A', '17:00:00', '18:30:00', '2018-07-21 18:21:09', '2018-07-21 18:21:09'),
(73, 10, 48, 3, 3, 'A', 'ENG 7-A', '17:00:00', '18:30:00', '2018-07-21 18:21:18', '2018-07-21 18:21:18'),
(74, 10, 56, 3, 3, 'A', 'ENG 7-A', '17:00:00', '18:30:00', '2018-07-21 18:21:25', '2018-07-21 18:21:25'),
(75, 10, 33, 3, 2, 'A', 'ENG 9-A', '20:00:00', '21:30:00', '2018-07-21 18:22:55', '2018-07-21 18:22:55'),
(76, 10, 49, 3, 2, 'A', 'ENG 9-A', '20:00:00', '21:30:00', '2018-07-21 18:23:06', '2018-07-21 18:23:06'),
(77, 10, 62, 3, 2, 'A', 'ENG 9-A', '20:00:00', '21:30:00', '2018-07-21 18:23:14', '2018-07-21 18:23:14'),
(78, 14, 36, 3, 5, 'A', 'ENG 13-A', '20:00:00', '21:30:00', '2018-07-21 18:24:14', '2018-07-30 02:50:40'),
(84, 1, 20, 3, 3, 'A', 'FRA 2-A', '07:30:00', '08:30:00', '2018-07-21 18:27:36', '2018-07-21 18:27:36'),
(85, 7, 83, 3, 2, 'A', 'ENG 2-A', '16:30:00', '17:30:00', '2018-07-21 18:32:46', '2018-07-30 03:18:10'),
(86, 7, 83, 3, 2, 'B', 'ENG 2-B', '17:30:00', '18:30:00', '2018-07-21 18:33:38', '2018-07-30 03:19:10'),
(87, 14, 35, 3, 1, 'A', 'ENG 11-A', '18:30:00', '20:00:00', '2018-07-23 01:35:41', '2018-08-07 04:14:17'),
(94, 3, 30, 3, 4, 'A', 'ENG 6-A', '18:30:00', '20:00:00', '2018-07-27 02:43:39', '2018-07-27 02:43:39'),
(95, 3, 46, 3, 4, 'A', 'ENG 6-A', '18:30:00', '20:00:00', '2018-07-27 02:43:52', '2018-07-27 02:43:52'),
(96, 3, 60, 3, 4, 'A', 'ENG 6-A', '18:30:00', '20:00:00', '2018-07-27 02:43:59', '2018-07-27 02:43:59'),
(97, 10, 54, 3, 3, 'A', 'ENG 1-A', '08:30:00', '10:00:00', '2018-07-28 19:28:07', '2018-07-28 19:28:07'),
(98, 10, 42, 3, 3, 'A', 'ENG 1-A', '08:30:00', '10:00:00', '2018-07-28 19:29:09', '2018-07-28 19:29:09'),
(99, 10, 24, 3, 3, 'A', 'ENG 1-A', '08:30:00', '10:00:00', '2018-07-28 19:29:42', '2018-07-28 19:29:42'),
(101, 8, 47, 3, 5, 'B', 'ENG 4-B', '11:00:00', '12:30:00', '2018-07-30 01:53:55', '2018-07-30 01:53:55');

-- --------------------------------------------------------

--
-- Table structure for table `information_marks`
--

CREATE TABLE `information_marks` (
  `id` int(10) UNSIGNED NOT NULL,
  `group_id` int(10) UNSIGNED NOT NULL,
  `category_mark_id` int(10) UNSIGNED NOT NULL,
  `exam_type_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `item_marks`
--

CREATE TABLE `item_marks` (
  `id` int(10) UNSIGNED NOT NULL,
  `record_id` int(10) UNSIGNED NOT NULL,
  `information_mark_id` int(10) UNSIGNED NOT NULL,
  `observation` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `score` float(8,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `spanish_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `acronym` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `name`, `spanish_name`, `acronym`, `created_at`, `updated_at`) VALUES
(2, 'INGLES', 'INGLES', 'ENG', '2018-03-24 16:17:02', '2018-03-24 16:17:02'),
(3, 'FRANCES', 'FRANCES', 'FRA', '2018-03-24 16:44:41', '2018-03-24 16:44:41'),
(4, 'PORTUGUÉS', 'PORTUGUÉS', 'PORT', '2018-07-12 00:36:12', '2018-07-12 00:36:12'),
(5, 'QUECHUA', 'QUECHUA', 'QUE', '2018-07-12 00:36:34', '2018-07-12 00:36:34'),
(6, 'ALEMÁN', 'ALEMÁN', 'ALEM', '2018-07-12 00:45:22', '2018-07-12 00:45:22');

-- --------------------------------------------------------

--
-- Table structure for table `levels`
--

CREATE TABLE `levels` (
  `id` int(10) UNSIGNED NOT NULL,
  `subject_id` int(10) UNSIGNED NOT NULL,
  `level_code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `level_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `levels`
--

INSERT INTO `levels` (`id`, `subject_id`, `level_code`, `level_name`, `created_at`, `updated_at`) VALUES
(37, 19, 'A1 I', 'FRANCES Básico I', '2018-03-24 16:47:22', '2018-03-24 16:47:22'),
(38, 19, 'A1 II', 'FRANCES Básico II', '2018-03-24 16:47:22', '2018-03-24 16:47:22'),
(39, 20, 'A1 III', 'FRANCES Básico III', '2018-03-24 16:47:23', '2018-03-24 16:47:23'),
(40, 22, 'A2 I', 'FRANCES Elemental I', '2018-03-24 16:47:23', '2018-03-24 16:47:23'),
(41, 20, 'A1 IV', 'FRANCES Básico IV', '2018-03-24 16:47:23', '2018-03-24 16:47:23'),
(42, 21, 'B1 III', 'FRANCES Pre-Intermedio III', '2018-03-24 16:47:23', '2018-03-24 16:47:23'),
(43, 22, 'A2 II', 'FRANCES Elemental II', '2018-03-24 16:47:23', '2018-03-24 16:47:23'),
(44, 21, 'B1 IV', 'FRANCES Pre-Intermedio IV', '2018-03-24 16:47:23', '2018-03-24 16:47:23'),
(45, 23, 'B2 I', 'FRANCES Elemental I', '2018-03-24 16:47:23', '2018-03-24 16:47:23'),
(46, 23, 'B2 II', 'FRANCES Elemental II', '2018-03-24 16:47:23', '2018-03-24 16:47:23'),
(47, 26, 'A2 III', 'INGLES Elemental III', '2018-07-11 19:10:01', '2018-07-11 19:10:01'),
(48, 24, 'A1 I', 'INGLES Básico I', '2018-07-11 19:10:02', '2018-07-11 19:10:02'),
(49, 26, 'A2 IV', 'INGLES Elemental IV', '2018-07-11 19:10:02', '2018-07-11 19:10:02'),
(50, 24, 'A1 II', 'INGLES Básico II', '2018-07-11 19:10:02', '2018-07-11 19:10:02'),
(51, 27, 'A2 I', 'INGLES Intermedio I', '2018-07-11 19:10:02', '2018-07-11 19:10:02'),
(52, 27, 'A2 II', 'INGLES Intermedio II', '2018-07-11 19:10:02', '2018-07-11 19:10:02'),
(53, 25, 'A2 III', 'INGLES Elemental III', '2018-07-11 19:10:02', '2018-07-11 19:10:02'),
(54, 25, 'A2 IV', 'INGLES Elemental IV', '2018-07-11 19:10:02', '2018-07-11 19:10:02'),
(55, 29, 'B1 I', 'INGLES Pre-Intermedio I', '2018-07-11 19:10:02', '2018-07-11 19:10:02'),
(56, 29, 'B1 II', 'INGLES Pre-Intermedio II', '2018-07-11 19:10:02', '2018-07-11 19:10:02'),
(57, 28, 'A1 III', 'INGLES Básico III', '2018-07-11 19:10:02', '2018-07-11 19:10:02'),
(58, 28, 'A1 IV', 'INGLES Básico IV', '2018-07-11 19:10:02', '2018-07-11 19:10:02'),
(59, 30, 'B1 I', 'INGLES Pre-Intermedio I', '2018-07-11 19:10:02', '2018-07-11 19:10:02'),
(60, 30, 'B1 II', 'INGLES Pre-Intermedio II', '2018-07-11 19:10:02', '2018-07-11 19:10:02'),
(61, 31, 'B2 III', 'INGLES Intermedio III', '2018-07-11 19:10:02', '2018-07-11 19:10:02'),
(62, 32, 'C1 V', 'INGLES Intermedio Alto V', '2018-07-11 19:10:03', '2018-07-11 19:10:03'),
(63, 33, 'C2 VII', 'INGLES Intermedio VII', '2018-07-11 19:10:03', '2018-07-11 19:10:03'),
(64, 32, 'C1 VI', 'INGLES Intermedio Alto VI', '2018-07-11 19:10:03', '2018-07-11 19:10:03'),
(65, 31, 'B2 IV', 'INGLES Intermedio IV', '2018-07-11 19:10:03', '2018-07-11 19:10:03'),
(66, 33, 'C2 VIII', 'INGLES Intermedio VIII', '2018-07-11 19:10:03', '2018-07-11 19:10:03'),
(67, 34, 'C2 I', 'INGLES Intermedio I', '2018-07-11 19:10:03', '2018-07-11 19:10:03'),
(68, 34, 'C2 II', 'INGLES Intermedio II', '2018-07-11 19:10:03', '2018-07-11 19:10:03'),
(69, 35, 'C1 IV', 'INGLES Intermedio Alto IV', '2018-07-11 19:10:03', '2018-07-11 19:10:03'),
(70, 36, 'C1 V', 'INGLES Intermedio Alto V', '2018-07-11 19:10:03', '2018-07-11 19:10:03'),
(71, 35, 'C1 III', 'INGLES Intermedio Alto III', '2018-07-11 19:10:03', '2018-07-11 19:10:03'),
(72, 36, 'C1 VI', 'INGLES Intermedio Alto VI', '2018-07-11 19:10:03', '2018-07-11 19:10:03'),
(73, 37, 'C2 VII', 'INGLES Avanzado VII', '2018-07-11 19:10:03', '2018-07-11 19:10:03'),
(74, 37, 'C2 VIII', 'INGLES Avanzado VIII', '2018-07-11 19:10:04', '2018-07-11 19:10:04'),
(75, 38, 'C2 I', 'INGLES Avanzado I', '2018-07-11 19:10:04', '2018-07-11 19:10:04'),
(76, 39, 'C1 III', 'INGLES Intermedio Alto III', '2018-07-11 19:10:04', '2018-07-11 19:10:04'),
(77, 38, 'C2 II', 'INGLES Avanzado II', '2018-07-11 19:10:04', '2018-07-11 19:10:04'),
(78, 39, 'C1 IV', 'INGLES Intermedio Alto IV', '2018-07-11 19:10:04', '2018-07-11 19:10:04'),
(79, 40, 'C2 V', 'INGLES Super Avanzado V', '2018-07-11 19:10:04', '2018-07-11 19:10:04'),
(80, 40, 'C2 VI', 'INGLES Super Avanzado VI', '2018-07-11 19:10:04', '2018-07-11 19:10:04'),
(81, 41, 'C2 VIII', 'INGLES Super Avanzado VIII', '2018-07-11 19:10:04', '2018-07-11 19:10:04'),
(82, 41, 'C2 VII', 'INGLES Super Avanzado VII', '2018-07-11 19:10:04', '2018-07-11 19:10:04'),
(83, 42, 'A1 II', 'INGLES Básico II', '2018-07-11 19:10:25', '2018-07-11 19:10:25'),
(84, 42, 'A1 I', 'INGLES Básico I', '2018-07-11 19:10:25', '2018-07-11 19:10:25'),
(85, 43, 'A1 III', 'INGLES Básico III', '2018-07-11 19:10:25', '2018-07-11 19:10:25'),
(86, 43, 'A1 IV', 'INGLES Básico IV', '2018-07-11 19:10:25', '2018-07-11 19:10:25'),
(87, 44, 'B1 I', 'INGLES Pre-Intermedio I', '2018-07-11 19:10:25', '2018-07-11 19:10:25'),
(88, 44, 'B1 II', 'INGLES Pre-Intermedio II', '2018-07-11 19:10:25', '2018-07-11 19:10:25'),
(89, 46, 'B1 III', 'INGLES Pre-Intermedio III', '2018-07-11 19:10:25', '2018-07-11 19:10:25'),
(90, 46, 'B1 IV', 'INGLES Pre-Intermedio IV', '2018-07-11 19:10:25', '2018-07-11 19:10:25'),
(91, 45, 'B2 I', 'INGLES Elemental I', '2018-07-11 19:10:25', '2018-07-11 19:10:25'),
(92, 45, 'B2 II', 'INGLES Elemental II', '2018-07-11 19:10:25', '2018-07-11 19:10:25'),
(93, 47, 'B2 III', 'INGLES Elemental III', '2018-07-11 19:10:25', '2018-07-11 19:10:25'),
(94, 47, 'B2 IV', 'INGLES Elemental IV', '2018-07-11 19:10:26', '2018-07-11 19:10:26'),
(95, 49, 'B2 IV', 'INGLES Intermedio IV', '2018-07-11 19:10:26', '2018-07-11 19:10:26'),
(96, 49, 'B2 III', 'INGLES Intermedio III', '2018-07-11 19:10:26', '2018-07-11 19:10:26'),
(97, 48, 'B2 II', 'INGLES Intermedio II', '2018-07-11 19:10:26', '2018-07-11 19:10:26'),
(98, 50, 'B2 V', 'INGLES Intermedio V', '2018-07-11 19:10:26', '2018-07-11 19:10:26'),
(99, 48, 'B2 I', 'INGLES Intermedio I', '2018-07-11 19:10:26', '2018-07-11 19:10:26'),
(100, 50, 'B2 VI', 'INGLES Intermedio VI', '2018-07-11 19:10:26', '2018-07-11 19:10:26'),
(101, 51, 'B2 VII', 'INGLES Intermedio VII', '2018-07-11 19:10:26', '2018-07-11 19:10:26'),
(102, 52, 'C1 I', 'INGLES Intermedio Alto I', '2018-07-11 19:10:26', '2018-07-11 19:10:26'),
(103, 51, 'B2 VIII', 'INGLES Intermedio VIII', '2018-07-11 19:10:26', '2018-07-11 19:10:26'),
(104, 52, 'C1 II', 'INGLES Intermedio Alto II', '2018-07-11 19:10:26', '2018-07-11 19:10:26'),
(105, 53, 'C1 III', 'INGLES Intermedio Alto III', '2018-07-11 19:10:26', '2018-07-11 19:10:26'),
(106, 53, 'C1 IV', 'INGLES Intermedio Alto IV', '2018-07-11 19:10:26', '2018-07-11 19:10:26'),
(107, 54, 'A1 I', 'INGLES Básico I', '2018-07-11 19:10:58', '2018-07-11 19:10:58'),
(108, 56, 'A2 I', 'INGLES Intermedio I', '2018-07-11 19:10:58', '2018-07-11 19:10:58'),
(109, 55, 'A1 IV', 'INGLES Básico IV', '2018-07-11 19:10:58', '2018-07-11 19:10:58'),
(110, 54, 'A1 II', 'INGLES Básico II', '2018-07-11 19:10:58', '2018-07-11 19:10:58'),
(111, 56, 'A2 II', 'INGLES Intermedio II', '2018-07-11 19:10:59', '2018-07-11 19:10:59'),
(112, 55, 'A1 III', 'INGLES Básico III', '2018-07-11 19:10:59', '2018-07-11 19:10:59'),
(113, 57, 'B1 III', 'INGLES Pre-Intermedio III', '2018-07-11 19:10:59', '2018-07-11 19:10:59'),
(114, 57, 'B1 IV', 'INGLES Pre-Intermedio IV', '2018-07-11 19:10:59', '2018-07-11 19:10:59'),
(115, 60, 'B1 I', 'INGLES Pre-Intermedio I', '2018-07-11 19:10:59', '2018-07-11 19:10:59'),
(116, 60, 'B1 II', 'INGLES Pre-Intermedio II', '2018-07-11 19:10:59', '2018-07-11 19:10:59'),
(117, 59, 'B2 III', 'INGLES Elemental III', '2018-07-11 19:10:59', '2018-07-11 19:10:59'),
(118, 59, 'B2 IV', 'INGLES Elemental IV', '2018-07-11 19:10:59', '2018-07-11 19:10:59'),
(119, 58, 'B2 I', 'INGLES Elemental I', '2018-07-11 19:10:59', '2018-07-11 19:10:59'),
(120, 58, 'B2 II', 'INGLES Elemental II', '2018-07-11 19:10:59', '2018-07-11 19:10:59'),
(121, 61, 'B2 III', 'INGLES Intermedio III', '2018-07-11 19:10:59', '2018-07-11 19:10:59'),
(122, 61, 'B2 IV', 'INGLES Intermedio IV', '2018-07-11 19:10:59', '2018-07-11 19:10:59'),
(123, 62, 'B2 V', 'INGLES Intermedio V', '2018-07-11 19:10:59', '2018-07-11 19:10:59'),
(124, 62, 'B2 VI', 'INGLES Intermedio VI', '2018-07-11 19:10:59', '2018-07-11 19:10:59'),
(125, 63, 'B2 VII', 'INGLES Intermedio VII', '2018-07-11 19:10:59', '2018-07-11 19:10:59'),
(126, 63, 'B2 VIII', 'INGLES Intermedio VIII', '2018-07-11 19:11:00', '2018-07-11 19:11:00'),
(127, 65, 'C1 II', 'INGLES Intermedio Alto II', '2018-07-11 19:11:00', '2018-07-11 19:11:00'),
(128, 65, 'C1 I', 'INGLES Intermedio Alto I', '2018-07-11 19:11:00', '2018-07-11 19:11:00'),
(129, 64, 'C1 III', 'INGLES Intermedio Alto III', '2018-07-11 19:11:00', '2018-07-11 19:11:00'),
(130, 64, 'C1 IV', 'INGLES Intermedio Alto IV', '2018-07-11 19:11:00', '2018-07-11 19:11:00'),
(131, 66, 'A1 I', 'ALEMÁN Básico I', '2018-07-12 02:29:30', '2018-07-12 02:29:30'),
(132, 66, 'A1 II', 'ALEMÁN Básico II', '2018-07-12 02:29:30', '2018-07-12 02:29:30'),
(133, 67, 'A1 III', 'ALEMÁN Básico III', '2018-07-12 02:29:30', '2018-07-12 02:29:30'),
(134, 67, 'A1 IV', 'ALEMÁN Básico IV', '2018-07-12 02:29:30', '2018-07-12 02:29:30'),
(135, 68, 'A2 I', 'ALEMÁN Elemental I', '2018-07-12 02:29:30', '2018-07-12 02:29:30'),
(136, 68, 'A2 II', 'ALEMÁN Elemental II', '2018-07-12 02:29:30', '2018-07-12 02:29:30'),
(137, 69, 'A2 III', 'ALEMÁN Elemental III', '2018-07-12 02:29:30', '2018-07-12 02:29:30'),
(138, 69, 'A2 IV', 'ALEMÁN Elemental IV', '2018-07-12 02:29:30', '2018-07-12 02:29:30'),
(139, 70, 'B1 I', 'ALEMÁN Pre-Intermedio I', '2018-07-12 02:29:30', '2018-07-12 02:29:30'),
(140, 70, 'B1 II', 'ALEMÁN Pre-Intermedio II', '2018-07-12 02:29:30', '2018-07-12 02:29:30'),
(141, 71, 'A1 I', 'PORTUGUÉS Básico I', '2018-07-12 02:29:45', '2018-07-12 02:29:45'),
(142, 71, 'A1 II', 'PORTUGUÉS Básico II', '2018-07-12 02:29:45', '2018-07-12 02:29:45'),
(143, 72, 'A2 III', 'PORTUGUÉS Elemental III', '2018-07-12 02:29:45', '2018-07-12 02:29:45'),
(144, 75, 'A1 I', 'PORTUGUÉS Básico I', '2018-07-12 02:29:45', '2018-07-12 02:29:45'),
(145, 72, 'A2 IV', 'PORTUGUÉS Elemental IV', '2018-07-12 02:29:45', '2018-07-12 02:29:45'),
(146, 75, 'A1 II', 'PORTUGUÉS Básico II', '2018-07-12 02:29:45', '2018-07-12 02:29:45'),
(147, 73, 'A2 III', 'PORTUGUÉS Elemental III', '2018-07-12 02:29:45', '2018-07-12 02:29:45'),
(148, 73, 'A2 IV', 'PORTUGUÉS Elemental IV', '2018-07-12 02:29:45', '2018-07-12 02:29:45'),
(149, 74, 'B1 I', 'PORTUGUÉS Pre-Intermedio I', '2018-07-12 02:29:46', '2018-07-12 02:29:46'),
(150, 74, 'B1 II', 'PORTUGUÉS Pre-Intermedio II', '2018-07-12 02:29:46', '2018-07-12 02:29:46'),
(151, 76, 'A1 I', 'QUECHUA Básico I', '2018-07-12 02:29:52', '2018-07-12 02:29:52'),
(152, 76, 'A1 II', 'QUECHUA Básico II', '2018-07-12 02:29:53', '2018-07-12 02:29:53'),
(153, 80, 'A2 IV', 'QUECHUA Elemental IV', '2018-07-12 02:29:53', '2018-07-12 02:29:53'),
(154, 79, 'A1 III', 'QUECHUA Básico III', '2018-07-12 02:29:53', '2018-07-12 02:29:53'),
(155, 80, 'A2 III', 'QUECHUA Elemental III', '2018-07-12 02:29:53', '2018-07-12 02:29:53'),
(156, 77, 'B1 II', 'QUECHUA Pre-Intermedio II', '2018-07-12 02:29:53', '2018-07-12 02:29:53'),
(157, 77, 'B1 I', 'QUECHUA Pre-Intermedio I', '2018-07-12 02:29:53', '2018-07-12 02:29:53'),
(158, 79, 'A1 IV', 'QUECHUA Básico IV', '2018-07-12 02:29:53', '2018-07-12 02:29:53'),
(159, 78, 'A2 II', 'QUECHUA Elemental II', '2018-07-12 02:29:53', '2018-07-12 02:29:53'),
(160, 78, 'A2 I', 'QUECHUA Elemental I', '2018-07-12 02:29:53', '2018-07-12 02:29:53'),
(161, 81, 'A1 I', 'INGLES Básico I', '2018-07-30 03:17:25', '2018-07-30 03:17:25'),
(162, 81, 'A1 II', 'INGLES Básico II', '2018-07-30 03:17:25', '2018-07-30 03:17:25'),
(163, 82, 'A2 III', 'INGLES Intermedio III', '2018-07-30 03:17:25', '2018-07-30 03:17:25'),
(164, 82, 'A2 IV', 'INGLES Intermedio IV', '2018-07-30 03:17:25', '2018-07-30 03:17:25'),
(165, 83, 'A1 VI', 'INGLES Básico VI', '2018-07-30 03:17:25', '2018-07-30 03:17:25'),
(166, 83, 'A1 V', 'INGLES Básico V', '2018-07-30 03:17:25', '2018-07-30 03:17:25'),
(167, 84, 'A2 VII', 'INGLES Elemental VII', '2018-07-30 03:17:25', '2018-07-30 03:17:25'),
(168, 84, 'A2 VIII', 'INGLES Elemental VIII', '2018-07-30 03:17:26', '2018-07-30 03:17:26'),
(169, 86, 'A2 II', 'INGLES Elemental II', '2018-07-30 03:17:26', '2018-07-30 03:17:26'),
(170, 86, 'A2 I', 'INGLES Elemental I', '2018-07-30 03:17:26', '2018-07-30 03:17:26'),
(171, 85, 'B1 III', 'INGLES Pre-Intermedio III', '2018-07-30 03:17:26', '2018-07-30 03:17:26'),
(172, 85, 'B1 IV', 'INGLES Pre-Intermedio IV', '2018-07-30 03:17:26', '2018-07-30 03:17:26'),
(173, 87, 'B1 I', 'INGLES Pre-Intermedio I', '2018-07-30 03:17:26', '2018-07-30 03:17:26'),
(174, 87, 'B1 II', 'INGLES Pre-Intermedio II', '2018-07-30 03:17:26', '2018-07-30 03:17:26'),
(175, 88, 'B2 III', 'INGLES Intermedio III', '2018-07-30 03:17:26', '2018-07-30 03:17:26'),
(176, 88, 'B2 IV', 'INGLES Intermedio IV', '2018-07-30 03:17:26', '2018-07-30 03:17:26'),
(177, 89, 'B2 VI', 'INGLES Intermedio VI', '2018-07-30 03:17:26', '2018-07-30 03:17:26'),
(178, 90, 'C1 VIII', 'INGLES Intermedio Alto VIII', '2018-07-30 03:17:26', '2018-07-30 03:17:26'),
(179, 90, 'C1 VII', 'INGLES Intermedio Alto VII', '2018-07-30 03:17:26', '2018-07-30 03:17:26'),
(180, 89, 'B2 V', 'INGLES Intermedio V', '2018-07-30 03:17:26', '2018-07-30 03:17:26'),
(181, 91, 'C1 I', 'INGLES Intermedio Alto I', '2018-07-30 03:17:26', '2018-07-30 03:17:26'),
(182, 91, 'C1 II', 'INGLES Intermedio Alto II', '2018-07-30 03:17:27', '2018-07-30 03:17:27'),
(183, 92, 'C2 III', 'INGLES Intermedio III', '2018-07-30 03:17:27', '2018-07-30 03:17:27'),
(184, 92, 'C2 IV', 'INGLES Intermedio IV', '2018-07-30 03:17:27', '2018-07-30 03:17:27');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`migration`, `batch`) VALUES
('2015_04_18_122244_create_users_table', 1),
('2015_05_01_155241_create_teachers_table', 1),
('2015_05_10_153102_create_languages_table', 1),
('2015_06_24_134048_create_pensums_table', 1),
('2015_06_29_132524_create_planes_table', 1),
('2015_07_01_141548_create_subjects_table', 1),
('2015_07_07_235758_create_students_table', 1),
('2015_07_30_091853_create_cover_images_table', 1),
('2015_07_30_193246_create_years_table', 1),
('2015_07_31_150856_create_rooms_table', 1),
('2015_07_31_155058_create_bimesters_table', 1),
('2015_07_31_163202_create_groups_table', 1),
('2015_08_06_195503_create_administratives_table', 1),
('2015_08_06_195840_create_administrators_table', 1),
('2015_08_07_155513_create_controls_table', 1),
('2015_08_18_150449_create_exam_type_table', 1),
('2015_08_20_142040_create_category_marks_table', 1),
('2015_08_22_153505_create_pensum_records_table', 1),
('2015_08_23_152540_create_information_marks_table', 1),
('2015_08_23_162437_create_records_table', 1),
('2015_08_23_172600_create_item_marks_table', 1),
('2015_08_26_143006_create_levels_table', 1),
('2015_09_11_160057_create_categories_table', 1),
('2015_09_23_141921_create_prices_table', 1),
('2015_10_03_092302_create_tuition_table', 1),
('2015_10_24_095250_create_balances_table', 1),
('2015_10_25_105624_create_payment_type', 1),
('2015_11_21_121056_create_deposits_table', 1),
('2015_11_23_102520_create_deposit_types_table', 1),
('2015_11_24_132950_create_deposit_items_table', 1),
('2015_11_25_103820_create_payments_table', 1),
('2015_11_25_110907_create_payment_items_table', 1),
('2015_12_21_091451_create_table_attendance', 1),
('2016_02_04_131329_create_documents_reception_table', 1),
('2016_02_15_121914_create_documents_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `balance_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `amount` float(8,2) NOT NULL,
  `payment_date` date NOT NULL,
  `creditor` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `creditor_ci` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `balance_id`, `user_id`, `amount`, `payment_date`, `creditor`, `creditor_ci`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 23.00, '2018-05-13', 'MISITERIO DE TRABAJO', '524561', '2018-05-14 03:25:06', '2018-05-14 03:25:06'),
(2, 1, 1, 23.00, '2018-07-11', 'MINISTERIO DE TRABAJO', '123456789', '2018-07-11 18:29:18', '2018-07-11 18:29:18'),
(3, 1, 1, 20.00, '2018-07-11', 'SOR JUANA INES DE LA CRUZ', '123456', '2018-07-11 18:33:23', '2018-07-11 18:33:23'),
(5, 1, 1, 100.00, '2018-07-14', 'servicio de luz', '34rede32', '2018-07-14 03:55:57', '2018-07-14 03:55:57');

-- --------------------------------------------------------

--
-- Table structure for table `payment_items`
--

CREATE TABLE `payment_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `payment_id` int(10) UNSIGNED NOT NULL,
  `payment_type_id` int(10) UNSIGNED NOT NULL,
  `month` int(11) NOT NULL,
  `year` int(11) NOT NULL,
  `amount` float(8,2) NOT NULL,
  `additional_information` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `payment_items`
--

INSERT INTO `payment_items` (`id`, `payment_id`, `payment_type_id`, `month`, `year`, `amount`, `additional_information`, `created_at`, `updated_at`) VALUES
(1, 2, 6, 6, 2018, 23.00, 'PLANILLA MENSUAL DEL MES DE JUNIO', '2018-07-11 18:30:34', '2018-07-11 18:30:34'),
(2, 3, 11, 6, 2018, 20.00, 'DONACION MENSUAL DEL MES DE JUNIO', '2018-07-11 18:33:58', '2018-07-11 18:33:58');

-- --------------------------------------------------------

--
-- Table structure for table `payment_types`
--

CREATE TABLE `payment_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `payment_types`
--

INSERT INTO `payment_types` (`id`, `description`, `created_at`, `updated_at`) VALUES
(1, 'AFP', '2018-03-24 17:04:30', '2018-03-24 17:04:30'),
(2, 'SSU', '2018-03-24 17:04:35', '2018-03-24 17:04:35'),
(3, 'RENTA', '2018-03-24 17:04:45', '2018-03-24 17:04:45'),
(4, 'TEXTOS', '2018-03-24 17:04:54', '2018-03-24 17:04:54'),
(5, 'SUELDOS', '2018-03-24 17:05:09', '2018-03-24 17:05:09'),
(6, 'MINISTERIO DE TRABAJO', '2018-05-14 02:57:29', '2018-05-14 02:57:29'),
(7, 'CONTADOR', '2018-05-14 02:57:49', '2018-05-14 02:57:49'),
(8, 'SERVICIO DE AGUA', '2018-07-11 18:24:23', '2018-07-11 18:24:35'),
(9, 'SERVICIO DE LUZ', '2018-07-11 18:24:39', '2018-07-11 18:24:39'),
(10, 'SERVICIO DE INTERNET', '2018-07-11 18:24:50', '2018-07-11 18:24:50'),
(11, 'ALDEAS SOS', '2018-07-11 18:32:05', '2018-07-11 18:32:05'),
(12, 'SAGRADA FAMILIA', '2018-07-11 18:32:11', '2018-07-11 18:32:11'),
(13, 'LACTANCIA', '2018-07-12 00:28:31', '2018-07-12 00:28:31');

-- --------------------------------------------------------

--
-- Table structure for table `pensums`
--

CREATE TABLE `pensums` (
  `id` int(10) UNSIGNED NOT NULL,
  `language_id` int(10) UNSIGNED NOT NULL,
  `year` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `empty` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `pensums`
--

INSERT INTO `pensums` (`id`, `language_id`, `year`, `name`, `empty`, `created_at`, `updated_at`) VALUES
(3, 3, 2018, 'PENSUM ACADÉMICO FRANCES CAPACITACIÓN 2018', 0, '2018-03-24 16:47:04', '2018-03-24 16:47:23'),
(5, 2, 2018, 'PENSUM ACADÉMICO INGLÉS TÉCNICO MEDIO 2018', 0, '2018-07-11 19:08:29', '2018-07-11 19:10:27'),
(6, 2, 2018, 'PENSUM ACADÉMICO INGLÉS TÉCNICO SUPERIOR 2018', 0, '2018-07-11 19:08:44', '2018-07-11 19:10:04'),
(7, 2, 2018, 'PENSUM ACADEMICO INGLES CAPACITACION 2018', 0, '2018-07-11 19:08:58', '2018-07-11 19:11:00'),
(8, 6, 2018, 'PENSUM ACADÉMICO ALEMÁN CAPACITACIÓN 2018', 0, '2018-07-12 02:28:20', '2018-07-12 02:29:30'),
(9, 5, 2018, 'PENSUM ACADÉMICO QUECHUA CAPACITACIÓN 2018\r\n', 0, '2018-07-12 02:28:52', '2018-07-12 02:29:53'),
(10, 4, 2018, 'PENSUM ACADÉMICO PORTUGUÉS CAPACITACIÓN 2018', 0, '2018-07-12 02:29:12', '2018-07-12 02:29:46'),
(12, 2, 2018, 'PENSUM ACADÉMICO INGLÉS CAPACITACIÓN NIÑOS 2018', 0, '2018-07-30 03:17:06', '2018-07-30 03:17:27');

-- --------------------------------------------------------

--
-- Table structure for table `pensum_records`
--

CREATE TABLE `pensum_records` (
  `id` int(10) UNSIGNED NOT NULL,
  `student_id` int(10) UNSIGNED NOT NULL,
  `pensum_id` int(10) UNSIGNED NOT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `pensum_records`
--

INSERT INTO `pensum_records` (`id`, `student_id`, `pensum_id`, `status`, `created_at`, `updated_at`) VALUES
(2, 2, 3, 'nuevo', '2018-03-24 16:56:37', '2018-03-24 16:56:37'),
(5, 3, 6, 'nuevo', '2018-07-11 19:11:49', '2018-07-11 19:11:49'),
(6, 30, 6, 'nuevo', '2018-07-12 22:14:17', '2018-07-12 22:14:17'),
(7, 23, 6, 'nuevo', '2018-07-12 22:16:32', '2018-07-12 22:16:32'),
(8, 35, 6, 'nuevo', '2018-07-13 00:17:54', '2018-07-13 00:17:54'),
(9, 148, 7, 'nuevo', '2018-07-16 16:39:30', '2018-07-16 16:39:30'),
(10, 216, 7, 'nuevo', '2018-07-19 22:31:12', '2018-07-19 22:31:12'),
(11, 37, 6, 'nuevo', '2018-07-19 22:32:30', '2018-07-19 22:32:30'),
(12, 178, 7, 'nuevo', '2018-07-19 22:40:09', '2018-07-19 22:40:09'),
(13, 220, 7, 'nuevo', '2018-07-19 22:40:56', '2018-07-19 22:40:56'),
(14, 220, 3, 'nuevo', '2018-07-19 22:41:07', '2018-07-19 22:41:07'),
(15, 135, 6, 'nuevo', '2018-07-19 22:41:43', '2018-07-19 22:41:43'),
(16, 19, 5, 'nuevo', '2018-07-19 22:42:47', '2018-07-19 22:42:47'),
(17, 90, 6, 'nuevo', '2018-07-19 22:43:20', '2018-07-19 22:43:20'),
(18, 12, 5, 'nuevo', '2018-07-19 22:43:51', '2018-07-19 22:43:51'),
(19, 62, 6, 'nuevo', '2018-07-19 22:45:17', '2018-07-19 22:45:17'),
(20, 174, 7, 'nuevo', '2018-07-19 22:45:46', '2018-07-19 22:45:46'),
(21, 173, 7, 'nuevo', '2018-07-19 22:46:05', '2018-07-19 22:46:05'),
(22, 137, 6, 'nuevo', '2018-07-19 22:46:50', '2018-07-19 22:46:50'),
(23, 147, 7, 'nuevo', '2018-07-19 22:47:10', '2018-07-19 22:47:10'),
(24, 65, 6, 'nuevo', '2018-07-19 22:49:07', '2018-07-19 22:49:07'),
(25, 97, 6, 'nuevo', '2018-07-19 22:51:31', '2018-07-19 22:51:31'),
(26, 116, 6, 'nuevo', '2018-07-19 22:53:35', '2018-07-19 22:53:35'),
(27, 93, 6, 'nuevo', '2018-07-19 22:54:02', '2018-07-19 22:54:02'),
(28, 22, 6, 'nuevo', '2018-07-19 22:54:34', '2018-07-19 22:54:34'),
(29, 202, 7, 'nuevo', '2018-07-19 22:55:28', '2018-07-19 22:55:28'),
(30, 1, 6, 'nuevo', '2018-07-19 22:56:00', '2018-07-19 22:56:00'),
(31, 101, 6, 'nuevo', '2018-07-19 22:56:41', '2018-07-19 22:56:41'),
(32, 108, 6, 'nuevo', '2018-07-19 22:57:05', '2018-07-19 22:57:05'),
(33, 168, 7, 'nuevo', '2018-07-19 22:57:55', '2018-07-19 22:57:55'),
(34, 197, 6, 'nuevo', '2018-07-19 22:58:40', '2018-07-19 22:58:40'),
(36, 181, 6, 'nuevo', '2018-07-19 23:03:44', '2018-07-19 23:03:44'),
(37, 43, 6, 'nuevo', '2018-07-19 23:10:07', '2018-07-19 23:10:07'),
(38, 144, 7, 'nuevo', '2018-07-19 23:50:28', '2018-07-19 23:50:28'),
(40, 75, 6, 'nuevo', '2018-07-19 23:51:18', '2018-07-19 23:51:18'),
(41, 96, 6, 'nuevo', '2018-07-19 23:52:36', '2018-07-19 23:52:36'),
(42, 69, 6, 'nuevo', '2018-07-19 23:53:05', '2018-07-19 23:53:05'),
(43, 205, 7, 'nuevo', '2018-07-19 23:54:57', '2018-07-19 23:54:57'),
(44, 124, 5, 'nuevo', '2018-07-19 23:55:25', '2018-07-19 23:55:25'),
(45, 233, 7, 'nuevo', '2018-07-20 00:00:23', '2018-07-20 00:00:23'),
(46, 196, 6, 'nuevo', '2018-07-20 00:00:57', '2018-07-20 00:00:57'),
(47, 109, 6, 'nuevo', '2018-07-20 00:01:22', '2018-07-20 00:01:22'),
(48, 41, 6, 'nuevo', '2018-07-20 00:01:44', '2018-07-20 00:01:44'),
(49, 152, 5, 'nuevo', '2018-07-20 00:04:56', '2018-07-20 00:04:56'),
(50, 25, 6, 'nuevo', '2018-07-20 00:05:39', '2018-07-20 00:05:39'),
(51, 112, 6, 'nuevo', '2018-07-20 00:06:30', '2018-07-20 00:06:30'),
(52, 149, 3, 'nuevo', '2018-07-20 00:07:17', '2018-07-20 00:07:17'),
(53, 9, 5, 'nuevo', '2018-07-20 00:21:16', '2018-07-20 00:21:16'),
(54, 157, 6, 'nuevo', '2018-07-20 00:21:52', '2018-07-20 00:21:52'),
(55, 79, 6, 'nuevo', '2018-07-20 00:22:16', '2018-07-20 00:22:16'),
(56, 55, 6, 'nuevo', '2018-07-20 00:23:12', '2018-07-20 00:23:12'),
(57, 204, 7, 'nuevo', '2018-07-20 00:23:38', '2018-07-20 00:23:38'),
(60, 18, 5, 'nuevo', '2018-07-20 00:26:02', '2018-07-20 00:26:02'),
(61, 203, 7, 'nuevo', '2018-07-20 00:26:33', '2018-07-20 00:26:33'),
(62, 226, 6, 'nuevo', '2018-07-20 00:27:00', '2018-07-20 00:27:00'),
(63, 31, 6, 'nuevo', '2018-07-20 00:28:12', '2018-07-20 00:28:12'),
(65, 89, 6, 'nuevo', '2018-07-20 00:31:03', '2018-07-20 00:31:03'),
(66, 188, 10, 'nuevo', '2018-07-20 00:31:44', '2018-07-20 00:31:44'),
(67, 28, 6, 'nuevo', '2018-07-20 00:32:08', '2018-07-20 00:32:08'),
(68, 103, 6, 'nuevo', '2018-07-20 00:32:35', '2018-07-20 00:32:35'),
(69, 88, 6, 'nuevo', '2018-07-20 00:33:34', '2018-07-20 00:33:34'),
(70, 104, 6, 'nuevo', '2018-07-20 00:33:52', '2018-07-20 00:33:52'),
(71, 91, 6, 'nuevo', '2018-07-20 00:35:34', '2018-07-20 00:35:34'),
(72, 92, 6, 'nuevo', '2018-07-20 00:35:48', '2018-07-20 00:35:48'),
(73, 107, 6, 'nuevo', '2018-07-20 00:36:05', '2018-07-20 00:36:05'),
(74, 21, 6, 'nuevo', '2018-07-20 00:36:42', '2018-07-20 00:36:42'),
(76, 212, 7, 'nuevo', '2018-07-20 00:37:43', '2018-07-20 00:37:43'),
(77, 8, 5, 'nuevo', '2018-07-20 00:38:14', '2018-07-20 00:38:14'),
(78, 94, 6, 'nuevo', '2018-07-20 00:38:50', '2018-07-20 00:38:50'),
(79, 213, 7, 'nuevo', '2018-07-20 00:39:09', '2018-07-20 00:39:09'),
(80, 113, 6, 'nuevo', '2018-07-20 00:39:25', '2018-07-20 00:39:25'),
(81, 80, 6, 'nuevo', '2018-07-20 00:40:15', '2018-07-20 00:40:15'),
(82, 155, 6, 'nuevo', '2018-07-20 00:41:33', '2018-07-20 00:41:33'),
(83, 114, 6, 'nuevo', '2018-07-20 00:41:49', '2018-07-20 00:41:49'),
(84, 64, 6, 'nuevo', '2018-07-20 00:42:25', '2018-07-20 00:42:25'),
(85, 224, 7, 'nuevo', '2018-07-20 00:42:52', '2018-07-20 00:42:52'),
(86, 38, 6, 'nuevo', '2018-07-20 00:43:16', '2018-07-20 00:43:16'),
(87, 165, 6, 'nuevo', '2018-07-20 00:43:37', '2018-07-20 00:43:37'),
(89, 5, 5, 'nuevo', '2018-07-20 00:44:32', '2018-07-20 00:44:32'),
(90, 209, 7, 'nuevo', '2018-07-20 00:45:03', '2018-07-20 00:45:03'),
(91, 210, 7, 'nuevo', '2018-07-20 00:45:20', '2018-07-20 00:45:20'),
(92, 66, 6, 'nuevo', '2018-07-20 00:45:39', '2018-07-20 00:45:39'),
(93, 61, 6, 'nuevo', '2018-07-20 00:48:56', '2018-07-20 00:48:56'),
(94, 232, 7, 'nuevo', '2018-07-20 00:49:51', '2018-07-20 00:49:51'),
(95, 221, 7, 'nuevo', '2018-07-20 00:50:12', '2018-07-20 00:50:12'),
(96, 235, 7, 'nuevo', '2018-07-20 00:50:42', '2018-07-20 00:50:42'),
(97, 24, 6, 'nuevo', '2018-07-20 00:50:59', '2018-07-20 00:50:59'),
(99, 189, 7, 'nuevo', '2018-07-20 00:52:36', '2018-07-20 00:52:36'),
(101, 6, 5, 'nuevo', '2018-07-20 00:53:18', '2018-07-20 00:53:18'),
(102, 70, 6, 'nuevo', '2018-07-20 00:54:11', '2018-07-20 00:54:11'),
(103, 222, 7, 'nuevo', '2018-07-20 00:55:41', '2018-07-20 00:55:41'),
(104, 231, 7, 'nuevo', '2018-07-20 00:56:44', '2018-07-20 00:56:44'),
(105, 194, 6, 'nuevo', '2018-07-20 00:58:09', '2018-07-20 00:58:09'),
(106, 32, 6, 'nuevo', '2018-07-20 00:58:35', '2018-07-20 00:58:35'),
(108, 47, 6, 'nuevo', '2018-07-20 00:59:49', '2018-07-20 00:59:49'),
(109, 171, 6, 'nuevo', '2018-07-20 01:00:19', '2018-07-20 01:00:19'),
(110, 123, 6, 'nuevo', '2018-07-20 01:00:50', '2018-07-20 01:00:50'),
(111, 33, 6, 'nuevo', '2018-07-20 01:01:29', '2018-07-20 01:01:29'),
(112, 120, 6, 'nuevo', '2018-07-20 01:01:47', '2018-07-20 01:01:47'),
(113, 217, 7, 'nuevo', '2018-07-20 01:03:10', '2018-07-20 01:03:10'),
(114, 100, 6, 'nuevo', '2018-07-20 01:03:32', '2018-07-20 01:03:32'),
(115, 150, 3, 'nuevo', '2018-07-20 01:04:40', '2018-07-20 01:04:40'),
(116, 20, 6, 'nuevo', '2018-07-20 01:05:44', '2018-07-20 01:05:44'),
(117, 73, 6, 'nuevo', '2018-07-20 01:06:07', '2018-07-20 01:06:07'),
(118, 151, 3, 'nuevo', '2018-07-20 01:06:24', '2018-07-20 01:06:24'),
(119, 180, 6, 'nuevo', '2018-07-20 01:06:52', '2018-07-20 01:06:52'),
(120, 82, 6, 'nuevo', '2018-07-20 01:09:03', '2018-07-20 01:09:03'),
(121, 128, 6, 'nuevo', '2018-07-20 01:18:21', '2018-07-20 01:18:21'),
(124, 34, 6, 'nuevo', '2018-07-20 01:19:38', '2018-07-20 01:19:38'),
(125, 77, 6, 'nuevo', '2018-07-20 01:20:05', '2018-07-20 01:20:05'),
(126, 56, 6, 'nuevo', '2018-07-20 01:20:43', '2018-07-20 01:20:43'),
(127, 60, 6, 'nuevo', '2018-07-20 01:22:18', '2018-07-20 01:22:18'),
(128, 57, 6, 'nuevo', '2018-07-20 01:22:49', '2018-07-20 01:22:49'),
(129, 156, 6, 'nuevo', '2018-07-20 01:24:47', '2018-07-20 01:24:47'),
(130, 11, 5, 'nuevo', '2018-07-20 01:26:01', '2018-07-20 01:26:01'),
(131, 134, 6, 'nuevo', '2018-07-20 01:26:28', '2018-07-20 01:26:28'),
(132, 136, 6, 'nuevo', '2018-07-20 01:26:46', '2018-07-20 01:26:46'),
(133, 54, 6, 'nuevo', '2018-07-20 01:27:18', '2018-07-20 01:27:18'),
(134, 121, 6, 'nuevo', '2018-07-20 01:27:48', '2018-07-20 01:27:48'),
(135, 163, 5, 'nuevo', '2018-07-20 01:28:28', '2018-07-20 01:28:28'),
(136, 162, 6, 'nuevo', '2018-07-20 01:28:53', '2018-07-20 01:28:53'),
(137, 36, 6, 'nuevo', '2018-07-20 01:29:13', '2018-07-20 01:29:13'),
(138, 14, 5, 'nuevo', '2018-07-20 01:29:30', '2018-07-20 01:29:30'),
(139, 16, 5, 'nuevo', '2018-07-20 01:29:55', '2018-07-20 01:29:55'),
(140, 27, 6, 'nuevo', '2018-07-20 01:30:13', '2018-07-20 01:30:13'),
(141, 219, 7, 'nuevo', '2018-07-20 01:31:28', '2018-07-20 01:31:28'),
(142, 201, 7, 'nuevo', '2018-07-20 01:32:56', '2018-07-20 01:32:56'),
(143, 145, 7, 'nuevo', '2018-07-20 01:33:46', '2018-07-20 01:33:46'),
(144, 193, 6, 'nuevo', '2018-07-20 01:34:05', '2018-07-20 01:34:05'),
(145, 179, 6, 'nuevo', '2018-07-20 01:34:52', '2018-07-20 01:34:52'),
(146, 7, 5, 'nuevo', '2018-07-20 01:35:17', '2018-07-20 01:35:17'),
(147, 122, 6, 'nuevo', '2018-07-20 01:35:42', '2018-07-20 01:35:42'),
(148, 29, 6, 'nuevo', '2018-07-20 01:36:24', '2018-07-20 01:36:24'),
(149, 177, 5, 'nuevo', '2018-07-20 01:36:43', '2018-07-20 01:36:43'),
(151, 186, 6, 'nuevo', '2018-07-20 01:37:34', '2018-07-20 01:37:34'),
(152, 170, 6, 'nuevo', '2018-07-20 01:37:59', '2018-07-20 01:37:59'),
(154, 72, 6, 'nuevo', '2018-07-20 01:38:58', '2018-07-20 01:38:58'),
(155, 234, 7, 'nuevo', '2018-07-20 01:39:23', '2018-07-20 01:39:23'),
(156, 98, 6, 'nuevo', '2018-07-20 01:39:42', '2018-07-20 01:39:42'),
(157, 133, 6, 'nuevo', '2018-07-20 01:39:57', '2018-07-20 01:39:57'),
(158, 127, 6, 'nuevo', '2018-07-20 01:40:14', '2018-07-20 01:40:14'),
(159, 207, 7, 'nuevo', '2018-07-20 01:40:30', '2018-07-20 01:40:30'),
(160, 110, 6, 'nuevo', '2018-07-20 01:40:47', '2018-07-20 01:40:47'),
(161, 183, 6, 'nuevo', '2018-07-20 01:41:03', '2018-07-20 01:41:03'),
(162, 146, 7, 'nuevo', '2018-07-20 01:41:35', '2018-07-20 01:41:35'),
(163, 153, 5, 'nuevo', '2018-07-20 01:41:56', '2018-07-20 01:41:56'),
(164, 10, 5, 'nuevo', '2018-07-20 01:42:12', '2018-07-20 01:42:12'),
(165, 58, 6, 'nuevo', '2018-07-20 01:42:33', '2018-07-20 01:42:33'),
(166, 191, 6, 'nuevo', '2018-07-20 01:43:03', '2018-07-20 01:43:03'),
(167, 86, 6, 'nuevo', '2018-07-20 01:43:59', '2018-07-20 01:43:59'),
(168, 106, 6, 'nuevo', '2018-07-20 01:44:42', '2018-07-20 01:44:42'),
(169, 63, 6, 'nuevo', '2018-07-20 01:45:13', '2018-07-20 01:45:13'),
(170, 68, 6, 'nuevo', '2018-07-20 01:45:53', '2018-07-20 01:45:53'),
(171, 111, 6, 'nuevo', '2018-07-20 01:46:25', '2018-07-20 01:46:25'),
(172, 67, 6, 'nuevo', '2018-07-20 01:46:46', '2018-07-20 01:46:46'),
(173, 236, 7, 'nuevo', '2018-07-20 01:47:35', '2018-07-20 01:47:35'),
(174, 154, 6, 'nuevo', '2018-07-20 01:47:56', '2018-07-20 01:47:56'),
(175, 132, 5, 'nuevo', '2018-07-20 01:48:14', '2018-07-20 01:48:14'),
(176, 83, 6, 'nuevo', '2018-07-20 01:48:36', '2018-07-20 01:48:36'),
(177, 95, 6, 'nuevo', '2018-07-20 01:48:55', '2018-07-20 01:48:55'),
(179, 51, 6, 'nuevo', '2018-07-20 01:49:51', '2018-07-20 01:49:51'),
(180, 125, 7, 'nuevo', '2018-07-20 01:50:14', '2018-07-20 01:50:14'),
(181, 126, 7, 'nuevo', '2018-07-20 01:50:23', '2018-07-20 01:50:23'),
(182, 208, 7, 'nuevo', '2018-07-20 01:50:49', '2018-07-20 01:50:49'),
(183, 215, 7, 'nuevo', '2018-07-20 01:51:02', '2018-07-20 01:51:02'),
(184, 4, 5, 'nuevo', '2018-07-20 01:51:20', '2018-07-20 01:51:20'),
(185, 26, 6, 'nuevo', '2018-07-20 01:51:39', '2018-07-20 01:51:39'),
(186, 102, 6, 'nuevo', '2018-07-20 01:51:59', '2018-07-20 01:51:59'),
(187, 190, 6, 'nuevo', '2018-07-20 01:52:42', '2018-07-20 01:52:42'),
(188, 143, 7, 'nuevo', '2018-07-20 01:53:03', '2018-07-20 01:53:03'),
(189, 159, 3, 'nuevo', '2018-07-20 01:53:35', '2018-07-20 01:53:35'),
(191, 138, 6, 'nuevo', '2018-07-20 01:54:14', '2018-07-20 01:54:14'),
(192, 228, 7, 'nuevo', '2018-07-20 01:55:18', '2018-07-20 01:55:18'),
(193, 172, 7, 'nuevo', '2018-07-20 01:55:32', '2018-07-20 01:55:32'),
(194, 17, 5, 'nuevo', '2018-07-20 01:55:58', '2018-07-20 01:55:58'),
(195, 71, 6, 'nuevo', '2018-07-20 01:56:24', '2018-07-20 01:56:24'),
(196, 105, 6, 'nuevo', '2018-07-20 01:57:19', '2018-07-20 01:57:19'),
(197, 131, 6, 'nuevo', '2018-07-20 01:57:34', '2018-07-20 01:57:34'),
(198, 211, 7, 'nuevo', '2018-07-20 01:57:52', '2018-07-20 01:57:52'),
(199, 117, 5, 'nuevo', '2018-07-20 01:58:46', '2018-07-20 01:58:46'),
(200, 118, 6, 'nuevo', '2018-07-20 01:59:03', '2018-07-20 01:59:03'),
(201, 185, 5, 'nuevo', '2018-07-20 01:59:20', '2018-07-20 01:59:20'),
(202, 129, 6, 'nuevo', '2018-07-20 01:59:51', '2018-07-20 01:59:51'),
(203, 119, 5, 'nuevo', '2018-07-20 02:06:54', '2018-07-20 02:06:54'),
(205, 13, 6, 'nuevo', '2018-07-20 02:08:06', '2018-07-20 02:08:06'),
(206, 15, 5, 'nuevo', '2018-07-20 02:08:33', '2018-07-20 02:08:33'),
(207, 99, 6, 'nuevo', '2018-07-20 02:09:10', '2018-07-20 02:09:10'),
(208, 176, 6, 'nuevo', '2018-07-20 02:09:29', '2018-07-20 02:09:29'),
(209, 200, 7, 'nuevo', '2018-07-20 02:09:43', '2018-07-20 02:09:43'),
(211, 218, 7, 'nuevo', '2018-07-20 02:10:27', '2018-07-20 02:10:27'),
(212, 223, 7, 'nuevo', '2018-07-20 02:10:56', '2018-07-20 02:10:56'),
(213, 115, 6, 'nuevo', '2018-07-20 02:11:17', '2018-07-20 02:11:17'),
(214, 175, 7, 'nuevo', '2018-07-20 02:12:01', '2018-07-20 02:12:01'),
(215, 160, 3, 'nuevo', '2018-07-20 02:12:30', '2018-07-20 02:12:30'),
(216, 160, 6, 'nuevo', '2018-07-20 02:12:37', '2018-07-20 02:12:37'),
(217, 130, 6, 'nuevo', '2018-07-20 02:13:00', '2018-07-20 02:13:00'),
(218, 85, 6, 'nuevo', '2018-07-20 02:13:18', '2018-07-20 02:13:18'),
(219, 81, 6, 'nuevo', '2018-07-20 02:13:33', '2018-07-20 02:13:33'),
(221, 84, 6, 'nuevo', '2018-07-20 02:14:24', '2018-07-20 02:14:24'),
(222, 158, 6, 'nuevo', '2018-07-20 02:14:47', '2018-07-20 02:14:47'),
(223, 76, 6, 'nuevo', '2018-07-20 02:15:03', '2018-07-20 02:15:03'),
(224, 195, 6, 'nuevo', '2018-07-20 02:16:00', '2018-07-20 02:16:00'),
(225, 187, 10, 'nuevo', '2018-07-20 02:16:32', '2018-07-20 02:16:32'),
(226, 182, 6, 'nuevo', '2018-07-20 02:16:49', '2018-07-20 02:16:49'),
(227, 225, 7, 'nuevo', '2018-07-20 02:17:21', '2018-07-20 02:17:21'),
(228, 39, 6, 'nuevo', '2018-07-20 02:17:44', '2018-07-20 02:17:44'),
(229, 166, 5, 'nuevo', '2018-07-20 02:18:08', '2018-07-20 02:18:08'),
(230, 78, 6, 'nuevo', '2018-07-20 02:18:24', '2018-07-20 02:18:24'),
(231, 169, 6, 'nuevo', '2018-07-20 02:19:03', '2018-07-20 02:19:03'),
(232, 87, 6, 'nuevo', '2018-07-20 02:19:27', '2018-07-20 02:19:27'),
(234, 229, 7, 'nuevo', '2018-07-20 02:20:28', '2018-07-20 02:20:28'),
(235, 161, 7, 'nuevo', '2018-07-20 02:20:47', '2018-07-20 02:20:47'),
(236, 59, 6, 'nuevo', '2018-07-20 02:21:16', '2018-07-20 02:21:16'),
(237, 230, 7, 'nuevo', '2018-07-20 02:21:53', '2018-07-20 02:21:53'),
(238, 259, 6, 'nuevo', '2018-07-24 23:13:23', '2018-07-24 23:13:23'),
(239, 268, 6, 'nuevo', '2018-07-24 23:13:34', '2018-07-24 23:13:34'),
(240, 254, 6, 'nuevo', '2018-07-24 23:14:06', '2018-07-24 23:14:06'),
(241, 289, 7, 'nuevo', '2018-07-24 23:14:51', '2018-07-24 23:14:51'),
(242, 262, 6, 'nuevo', '2018-07-24 23:15:08', '2018-07-24 23:15:08'),
(243, 274, 6, 'nuevo', '2018-07-24 23:15:43', '2018-07-24 23:15:43'),
(244, 251, 6, 'nuevo', '2018-07-24 23:16:02', '2018-07-24 23:16:02'),
(245, 299, 7, 'nuevo', '2018-07-24 23:16:56', '2018-07-24 23:16:56'),
(246, 275, 5, 'nuevo', '2018-07-24 23:17:21', '2018-07-24 23:17:21'),
(247, 293, 7, 'nuevo', '2018-07-24 23:20:35', '2018-07-24 23:20:35'),
(248, 281, 7, 'nuevo', '2018-07-24 23:21:06', '2018-07-24 23:21:06'),
(249, 270, 5, 'nuevo', '2018-07-24 23:21:31', '2018-07-24 23:21:31'),
(250, 280, 7, 'nuevo', '2018-07-24 23:21:57', '2018-07-24 23:21:57'),
(252, 255, 6, 'nuevo', '2018-07-24 23:23:01', '2018-07-24 23:23:01'),
(253, 294, 7, 'nuevo', '2018-07-24 23:23:49', '2018-07-24 23:23:49'),
(254, 285, 7, 'nuevo', '2018-07-24 23:24:14', '2018-07-24 23:24:14'),
(255, 261, 5, 'nuevo', '2018-07-24 23:24:41', '2018-07-24 23:24:41'),
(256, 284, 7, 'nuevo', '2018-07-24 23:25:05', '2018-07-24 23:25:05'),
(257, 292, 7, 'nuevo', '2018-07-24 23:25:31', '2018-07-24 23:25:31'),
(258, 286, 7, 'nuevo', '2018-07-24 23:25:58', '2018-07-24 23:25:58'),
(259, 287, 7, 'nuevo', '2018-07-24 23:26:19', '2018-07-24 23:26:19'),
(260, 264, 6, 'nuevo', '2018-07-24 23:26:48', '2018-07-24 23:26:48'),
(261, 276, 6, 'nuevo', '2018-07-24 23:27:12', '2018-07-24 23:27:12'),
(262, 283, 7, 'nuevo', '2018-07-24 23:27:48', '2018-07-24 23:27:48'),
(263, 266, 6, 'nuevo', '2018-07-24 23:44:11', '2018-07-24 23:44:11'),
(264, 250, 5, 'nuevo', '2018-07-24 23:44:37', '2018-07-24 23:44:37'),
(265, 249, 6, 'nuevo', '2018-07-24 23:45:05', '2018-07-24 23:45:05'),
(266, 267, 6, 'nuevo', '2018-07-24 23:45:21', '2018-07-24 23:45:21'),
(267, 257, 6, 'nuevo', '2018-07-24 23:45:46', '2018-07-24 23:45:46'),
(268, 296, 7, 'nuevo', '2018-07-24 23:46:15', '2018-07-24 23:46:15'),
(269, 291, 6, 'nuevo', '2018-07-24 23:46:48', '2018-07-24 23:46:48'),
(270, 252, 6, 'nuevo', '2018-07-24 23:47:07', '2018-07-24 23:47:07'),
(271, 258, 6, 'nuevo', '2018-07-24 23:47:22', '2018-07-24 23:47:22'),
(272, 290, 7, 'nuevo', '2018-07-24 23:47:53', '2018-07-24 23:47:53'),
(273, 273, 6, 'nuevo', '2018-07-24 23:49:16', '2018-07-24 23:49:16'),
(274, 277, 6, 'nuevo', '2018-07-24 23:50:12', '2018-07-24 23:50:12'),
(275, 279, 7, 'nuevo', '2018-07-24 23:50:28', '2018-07-24 23:50:28'),
(276, 263, 6, 'nuevo', '2018-07-24 23:51:21', '2018-07-24 23:51:21'),
(277, 295, 6, 'nuevo', '2018-07-24 23:51:50', '2018-07-24 23:51:50'),
(278, 269, 6, 'nuevo', '2018-07-24 23:52:27', '2018-07-24 23:52:27'),
(279, 256, 6, 'nuevo', '2018-07-24 23:52:43', '2018-07-24 23:52:43'),
(280, 297, 7, 'nuevo', '2018-07-24 23:53:21', '2018-07-24 23:53:21'),
(281, 260, 6, 'nuevo', '2018-07-24 23:53:42', '2018-07-24 23:53:42'),
(282, 265, 6, 'nuevo', '2018-07-24 23:54:03', '2018-07-24 23:54:03'),
(283, 300, 7, 'nuevo', '2018-07-24 23:54:24', '2018-07-24 23:54:24'),
(284, 271, 6, 'nuevo', '2018-07-24 23:54:54', '2018-07-24 23:54:54'),
(285, 282, 7, 'nuevo', '2018-07-24 23:55:15', '2018-07-24 23:55:15'),
(286, 272, 6, 'nuevo', '2018-07-24 23:55:38', '2018-07-24 23:55:38'),
(287, 253, 5, 'nuevo', '2018-07-24 23:57:11', '2018-07-24 23:57:11'),
(288, 288, 7, 'nuevo', '2018-07-24 23:57:39', '2018-07-24 23:57:39'),
(289, 301, 6, 'nuevo', '2018-07-25 00:13:33', '2018-07-25 00:13:33'),
(290, 302, 6, 'nuevo', '2018-07-25 00:20:50', '2018-07-25 00:20:50');

-- --------------------------------------------------------

--
-- Table structure for table `planes`
--

CREATE TABLE `planes` (
  `id` int(10) UNSIGNED NOT NULL,
  `teacher_id` int(10) UNSIGNED NOT NULL,
  `student_id` int(10) UNSIGNED DEFAULT '0',
  `subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `send_date` datetime NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `planes`
--

INSERT INTO `planes` (`id`, `teacher_id`, `student_id`, `subject`, `url`, `send_date`, `created_at`, `updated_at`) VALUES
(1, 47, 17, 'TRABAJO 1', 'uploads/wnXe3FylOOjAR6yE.pdf', '2018-07-28 12:17:41', '2018-07-28 19:17:41', '2018-07-28 19:17:41');

-- --------------------------------------------------------

--
-- Table structure for table `prices`
--

CREATE TABLE `prices` (
  `id` int(10) UNSIGNED NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `price` float(8,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `prices`
--

INSERT INTO `prices` (`id`, `description`, `price`, `created_at`, `updated_at`) VALUES
(1, 'MATRICULA', 250.00, '2018-03-24 17:55:32', '2018-03-24 17:55:32'),
(2, 'PENSION MENSUAL', 270.00, '2018-03-24 17:55:50', '2018-03-24 17:55:50'),
(3, 'TEXTO', 90.00, '2018-03-24 17:56:08', '2018-03-24 17:56:08'),
(4, 'EXAMEN DE UBICACIÓN', 100.00, '2018-07-11 16:30:59', '2018-07-11 16:31:35'),
(5, 'CURSO INTENSIVO', 1664.00, '2018-07-14 05:32:51', '2018-07-14 05:32:51'),
(6, 'CURSO DE NIVELACION', 85.00, '2018-07-14 05:33:44', '2018-07-14 05:33:44'),
(7, 'TEXTO NIÑOS', 35.00, '2018-07-21 18:44:49', '2018-07-21 18:44:49'),
(8, 'TEXTO IELTS', 45.00, '2018-07-21 18:46:08', '2018-07-21 18:46:08');

-- --------------------------------------------------------

--
-- Table structure for table `records`
--

CREATE TABLE `records` (
  `id` int(10) UNSIGNED NOT NULL,
  `bimester_id` int(10) UNSIGNED NOT NULL,
  `pensum_record_id` int(10) UNSIGNED NOT NULL,
  `group_id` int(10) UNSIGNED NOT NULL,
  `student_id` int(10) UNSIGNED NOT NULL,
  `final_score` float(8,2) NOT NULL,
  `observations` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `records`
--

INSERT INTO `records` (`id`, `bimester_id`, `pensum_record_id`, `group_id`, `student_id`, `final_score`, `observations`, `created_at`, `updated_at`) VALUES
(2, 1, 2, 4, 2, 0.00, 'cursando', '2018-03-24 16:57:09', '2018-03-24 16:57:09'),
(4, 2, 5, 6, 3, 0.00, 'cursando', '2018-07-11 19:13:17', '2018-07-11 19:13:17'),
(5, 2, 7, 8, 23, 0.00, 'cursando', '2018-07-12 22:19:24', '2018-07-12 22:19:24'),
(6, 3, 111, 78, 33, 0.00, 'cursando', '2018-07-21 18:40:13', '2018-07-21 18:40:13'),
(7, 3, 12, 46, 178, 0.00, 'cursando', '2018-07-26 17:01:49', '2018-07-26 17:01:49'),
(8, 3, 15, 44, 135, 0.00, 'cursando', '2018-07-26 17:02:49', '2018-07-26 17:02:49'),
(9, 3, 20, 46, 174, 0.00, 'cursando', '2018-07-26 17:03:48', '2018-07-26 17:03:48'),
(10, 3, 21, 46, 173, 0.00, 'cursando', '2018-07-26 17:04:12', '2018-07-26 17:04:12'),
(11, 3, 33, 46, 168, 0.00, 'cursando', '2018-07-26 17:05:07', '2018-07-26 17:05:07'),
(12, 3, 36, 44, 181, 0.00, 'cursando', '2018-07-26 17:07:29', '2018-07-26 17:07:29'),
(13, 3, 86, 44, 38, 0.00, 'cursando', '2018-07-26 17:11:00', '2018-07-26 17:11:00'),
(14, 3, 99, 46, 189, 0.00, 'cursando', '2018-07-26 17:12:12', '2018-07-26 17:12:12'),
(15, 3, 135, 45, 163, 0.00, 'cursando', '2018-07-26 17:13:20', '2018-07-26 17:13:20'),
(16, 3, 149, 45, 177, 0.00, 'cursando', '2018-07-26 17:42:44', '2018-07-26 17:42:44'),
(17, 3, 161, 44, 183, 0.00, 'cursando', '2018-07-26 17:43:27', '2018-07-26 17:43:27'),
(18, 3, 193, 46, 172, 0.00, 'cursando', '2018-07-26 17:44:53', '2018-07-26 17:44:53'),
(19, 3, 214, 46, 175, 0.00, 'cursando', '2018-07-26 17:45:59', '2018-07-26 17:45:59'),
(20, 3, 234, 46, 229, 0.00, 'cursando', '2018-07-26 17:46:44', '2018-07-26 17:46:44'),
(21, 3, 49, 45, 152, 0.00, 'cursando', '2018-07-26 17:48:25', '2018-07-26 17:48:25'),
(22, 3, 54, 44, 157, 0.00, 'cursando', '2018-07-26 17:49:00', '2018-07-26 17:49:00'),
(23, 3, 54, 47, 157, 0.00, 'cursando', '2018-07-26 17:49:40', '2018-07-26 17:49:40'),
(24, 3, 49, 48, 152, 0.00, 'cursando', '2018-07-26 17:50:09', '2018-07-26 17:50:09'),
(25, 3, 76, 49, 212, 0.00, 'cursando', '2018-07-26 17:50:32', '2018-07-26 17:50:32'),
(26, 3, 82, 47, 155, 0.00, 'cursando', '2018-07-26 17:51:03', '2018-07-26 17:51:03'),
(27, 3, 87, 47, 165, 0.00, 'cursando', '2018-07-26 17:51:49', '2018-07-26 17:51:49'),
(28, 3, 109, 47, 171, 0.00, 'cursando', '2018-07-26 17:52:41', '2018-07-26 17:52:41'),
(29, 3, 119, 47, 180, 0.00, 'cursando', '2018-07-26 17:53:29', '2018-07-26 17:53:29'),
(30, 3, 132, 47, 136, 0.00, 'cursando', '2018-07-26 17:54:09', '2018-07-26 17:54:09'),
(31, 3, 145, 47, 179, 0.00, 'cursando', '2018-07-26 17:54:49', '2018-07-26 17:54:49'),
(32, 3, 151, 47, 186, 0.00, 'cursando', '2018-07-26 17:55:16', '2018-07-26 17:55:16'),
(33, 3, 152, 47, 170, 0.00, 'cursando', '2018-07-26 17:55:45', '2018-07-26 17:55:45'),
(34, 3, 163, 48, 153, 0.00, 'cursando', '2018-07-26 17:56:16', '2018-07-26 17:56:16'),
(35, 3, 187, 47, 190, 0.00, 'cursando', '2018-07-26 17:57:03', '2018-07-26 17:57:03'),
(36, 3, 191, 47, 138, 0.00, 'cursando', '2018-07-26 17:57:41', '2018-07-26 17:57:41'),
(37, 3, 222, 47, 158, 0.00, 'cursando', '2018-07-26 17:58:34', '2018-07-26 17:58:34'),
(38, 3, 229, 48, 166, 0.00, 'cursando', '2018-07-26 17:59:08', '2018-07-26 17:59:08'),
(39, 3, 231, 47, 169, 0.00, 'cursando', '2018-07-26 17:59:43', '2018-07-26 17:59:43'),
(40, 3, 154, 47, 72, 0.00, 'cursando', '2018-07-26 18:00:37', '2018-07-26 18:00:37'),
(41, 3, 11, 50, 37, 0.00, 'cursando', '2018-07-26 18:02:27', '2018-07-26 18:02:27'),
(42, 3, 22, 50, 137, 0.00, 'cursando', '2018-07-26 18:03:23', '2018-07-26 18:03:23'),
(43, 3, 38, 52, 144, 0.00, 'cursando', '2018-07-26 18:04:02', '2018-07-26 18:04:02'),
(44, 3, 44, 51, 124, 0.00, 'cursando', '2018-07-26 18:04:59', '2018-07-26 18:04:59'),
(45, 3, 48, 50, 41, 0.00, 'cursando', '2018-07-26 18:05:47', '2018-07-26 18:05:47'),
(46, 3, 60, 51, 18, 0.00, 'cursando', '2018-07-26 18:06:19', '2018-07-26 18:06:19'),
(47, 3, 79, 52, 213, 0.00, 'cursando', '2018-07-26 18:06:52', '2018-07-26 18:06:52'),
(48, 3, 95, 52, 221, 0.00, 'cursando', '2018-07-26 18:07:21', '2018-07-26 18:07:21'),
(49, 3, 9, 52, 148, 0.00, 'cursando', '2018-07-26 18:08:04', '2018-07-26 18:08:04'),
(50, 3, 112, 50, 120, 0.00, 'cursando', '2018-07-26 18:08:46', '2018-07-26 18:08:46'),
(51, 3, 131, 50, 134, 0.00, 'cursando', '2018-07-26 18:09:26', '2018-07-26 18:09:26'),
(52, 3, 134, 50, 121, 0.00, 'cursando', '2018-07-26 18:10:07', '2018-07-26 18:10:07'),
(53, 3, 269, 50, 291, 0.00, 'cursando', '2018-07-26 18:11:38', '2018-07-26 18:11:38'),
(54, 3, 143, 52, 145, 0.00, 'cursando', '2018-07-26 18:14:16', '2018-07-26 18:14:16'),
(55, 3, 146, 51, 7, 0.00, 'cursando', '2018-07-26 18:15:13', '2018-07-26 18:15:13'),
(56, 3, 147, 50, 122, 0.00, 'cursando', '2018-07-26 18:15:51', '2018-07-26 18:15:51'),
(57, 3, 158, 50, 127, 0.00, 'cursando', '2018-07-26 18:17:18', '2018-07-26 18:17:18'),
(58, 3, 162, 52, 146, 0.00, 'cursando', '2018-07-26 18:17:57', '2018-07-26 18:17:57'),
(59, 3, 164, 51, 10, 0.00, 'cursando', '2018-07-26 18:18:34', '2018-07-26 18:18:34'),
(60, 3, 169, 50, 63, 0.00, 'cursando', '2018-07-26 18:19:19', '2018-07-26 18:19:19'),
(61, 3, 175, 51, 132, 0.00, 'cursando', '2018-07-26 18:22:00', '2018-07-26 18:22:00'),
(62, 3, 194, 51, 17, 0.00, 'cursando', '2018-07-26 18:22:24', '2018-07-26 18:22:24'),
(63, 3, 197, 50, 131, 0.00, 'cursando', '2018-07-26 18:22:56', '2018-07-26 18:22:56'),
(64, 3, 198, 52, 211, 0.00, 'cursando', '2018-07-26 18:23:51', '2018-07-26 18:23:51'),
(65, 3, 202, 50, 129, 0.00, 'cursando', '2018-07-26 18:25:22', '2018-07-26 18:25:22'),
(66, 3, 217, 50, 130, 0.00, 'cursando', '2018-07-26 18:25:49', '2018-07-26 18:25:49'),
(67, 3, 219, 50, 81, 0.00, 'cursando', '2018-07-26 18:26:25', '2018-07-26 18:26:25'),
(68, 3, 7, 59, 23, 0.00, 'cursando', '2018-07-26 18:32:31', '2018-07-26 18:32:31'),
(69, 3, 16, 60, 19, 0.00, 'cursando', '2018-07-26 18:32:59', '2018-07-26 18:32:59'),
(70, 3, 243, 59, 274, 0.00, 'cursando', '2018-07-26 18:33:30', '2018-07-26 18:33:30'),
(71, 3, 74, 59, 21, 0.00, 'cursando', '2018-07-26 18:34:36', '2018-07-26 18:34:36'),
(72, 3, 93, 59, 61, 0.00, 'cursando', '2018-07-26 18:35:15', '2018-07-26 18:35:15'),
(73, 3, 108, 59, 47, 0.00, 'cursando', '2018-07-26 18:36:02', '2018-07-26 18:36:02'),
(74, 3, 124, 59, 34, 0.00, 'cursando', '2018-07-26 18:39:16', '2018-07-26 18:39:16'),
(75, 3, 179, 59, 51, 0.00, 'cursando', '2018-07-26 18:39:58', '2018-07-26 18:39:58'),
(76, 3, 42, 56, 69, 0.00, 'cursando', '2018-07-26 18:40:34', '2018-07-26 18:40:34'),
(77, 3, 50, 56, 25, 0.00, 'cursando', '2018-07-26 18:41:05', '2018-07-26 18:41:05'),
(78, 3, 127, 56, 60, 0.00, 'cursando', '2018-07-26 18:41:29', '2018-07-26 18:41:29'),
(79, 3, 172, 56, 67, 0.00, 'cursando', '2018-07-26 18:46:22', '2018-07-26 18:46:22'),
(80, 3, 185, 56, 26, 0.00, 'cursando', '2018-07-26 18:46:53', '2018-07-26 18:46:53'),
(81, 3, 195, 56, 71, 0.00, 'cursando', '2018-07-26 18:47:37', '2018-07-26 18:47:37'),
(82, 3, 27, 41, 93, 0.00, 'cursando', '2018-07-27 00:20:08', '2018-07-27 00:20:08'),
(83, 3, 62, 41, 226, 0.00, 'cursando', '2018-07-27 00:21:01', '2018-07-27 00:21:01'),
(84, 3, 102, 41, 70, 0.00, 'cursando', '2018-07-27 00:22:19', '2018-07-27 00:22:19'),
(85, 3, 103, 41, 222, 0.00, 'cursando', '2018-07-27 00:24:16', '2018-07-27 00:24:16'),
(86, 3, 117, 41, 73, 0.00, 'cursando', '2018-07-27 00:26:06', '2018-07-27 00:26:06'),
(87, 3, 125, 41, 77, 0.00, 'cursando', '2018-07-27 00:27:18', '2018-07-27 00:27:18'),
(88, 3, 126, 41, 56, 0.00, 'cursando', '2018-07-27 00:27:57', '2018-07-27 00:27:57'),
(89, 3, 128, 41, 57, 0.00, 'cursando', '2018-07-27 00:29:47', '2018-07-27 00:29:47'),
(90, 3, 130, 43, 11, 0.00, 'cursando', '2018-07-27 00:34:57', '2018-07-27 00:34:57'),
(91, 3, 140, 41, 27, 0.00, 'cursando', '2018-07-27 00:35:44', '2018-07-27 00:35:44'),
(92, 3, 155, 41, 234, 0.00, 'cursando', '2018-07-27 00:36:35', '2018-07-27 00:36:35'),
(93, 3, 170, 41, 68, 0.00, 'cursando', '2018-07-27 00:38:07', '2018-07-27 00:38:07'),
(94, 3, 173, 41, 236, 0.00, 'cursando', '2018-07-27 00:38:38', '2018-07-27 00:38:38'),
(95, 3, 30, 62, 1, 0.00, 'cursando', '2018-07-27 00:45:30', '2018-07-27 00:45:30'),
(96, 3, 70, 62, 104, 0.00, 'cursando', '2018-07-27 00:47:54', '2018-07-27 00:47:54'),
(97, 3, 77, 63, 8, 0.00, 'cursando', '2018-07-27 00:49:02', '2018-07-27 00:49:02'),
(98, 3, 89, 63, 5, 0.00, 'cursando', '2018-07-27 00:49:58', '2018-07-27 00:49:58'),
(99, 3, 101, 63, 6, 0.00, 'cursando', '2018-07-27 00:50:57', '2018-07-27 00:50:57'),
(100, 3, 120, 62, 82, 0.00, 'cursando', '2018-07-27 00:51:35', '2018-07-27 00:51:35'),
(101, 3, 168, 62, 106, 0.00, 'cursando', '2018-07-27 00:52:49', '2018-07-27 00:52:49'),
(102, 3, 196, 62, 105, 0.00, 'cursando', '2018-07-27 00:53:29', '2018-07-27 00:53:29'),
(103, 3, 209, 64, 200, 0.00, 'cursando', '2018-07-27 00:54:11', '2018-07-27 00:54:11'),
(104, 3, 31, 65, 101, 0.00, 'cursando', '2018-07-27 00:54:50', '2018-07-27 00:54:50'),
(105, 3, 68, 65, 103, 0.00, 'cursando', '2018-07-27 00:55:15', '2018-07-27 00:55:15'),
(106, 3, 90, 68, 209, 0.00, 'cursando', '2018-07-27 00:56:13', '2018-07-27 00:56:13'),
(107, 3, 91, 68, 210, 0.00, 'cursando', '2018-07-27 00:57:33', '2018-07-27 00:57:33'),
(108, 3, 142, 68, 201, 0.00, 'cursando', '2018-07-27 00:57:54', '2018-07-27 00:57:54'),
(109, 3, 167, 65, 86, 0.00, 'cursando', '2018-07-27 01:00:51', '2018-07-27 01:00:51'),
(110, 3, 176, 65, 83, 0.00, 'cursando', '2018-07-27 01:01:34', '2018-07-27 01:01:34'),
(111, 3, 26, 53, 116, 0.00, 'cursando', '2018-07-27 01:15:37', '2018-07-27 01:15:37'),
(112, 3, 73, 53, 107, 0.00, 'cursando', '2018-07-27 01:19:33', '2018-07-27 01:19:33'),
(113, 3, 80, 53, 113, 0.00, 'cursando', '2018-07-27 01:22:11', '2018-07-27 01:22:11'),
(114, 3, 116, 53, 20, 0.00, 'cursando', '2018-07-27 01:22:41', '2018-07-27 01:22:41'),
(115, 3, 160, 53, 110, 0.00, 'cursando', '2018-07-27 01:23:16', '2018-07-27 01:23:16'),
(116, 3, 171, 53, 111, 0.00, 'cursando', '2018-07-27 01:23:59', '2018-07-27 01:23:59'),
(117, 3, 184, 54, 4, 0.00, 'cursando', '2018-07-27 01:24:33', '2018-07-27 01:24:33'),
(118, 3, 186, 53, 102, 0.00, 'cursando', '2018-07-27 01:25:19', '2018-07-27 01:25:19'),
(119, 3, 200, 53, 118, 0.00, 'cursando', '2018-07-27 01:31:11', '2018-07-27 01:31:11'),
(120, 3, 213, 53, 115, 0.00, 'cursando', '2018-07-27 01:33:08', '2018-07-27 01:33:08'),
(121, 3, 232, 53, 87, 0.00, 'cursando', '2018-07-27 02:11:12', '2018-07-27 02:11:12'),
(122, 3, 242, 69, 262, 0.00, 'cursando', '2018-07-27 02:12:28', '2018-07-27 02:12:28'),
(123, 3, 51, 69, 112, 0.00, 'cursando', '2018-07-27 02:21:56', '2018-07-27 02:21:56'),
(124, 3, 274, 69, 277, 0.00, 'cursando', '2018-07-27 02:22:28', '2018-07-27 02:22:28'),
(125, 3, 275, 71, 279, 0.00, 'cursando', '2018-07-27 02:23:15', '2018-07-27 02:23:15'),
(126, 3, 247, 71, 293, 0.00, 'cursando', '2018-07-27 02:24:02', '2018-07-27 02:24:02'),
(127, 3, 208, 69, 176, 0.00, 'cursando', '2018-07-27 02:25:47', '2018-07-27 02:25:47'),
(128, 3, 239, 13, 268, 0.00, 'cursando', '2018-07-27 02:26:56', '2018-07-27 02:26:56'),
(129, 3, 249, 14, 270, 0.00, 'cursando', '2018-07-27 02:28:05', '2018-07-27 02:28:05'),
(130, 3, 253, 15, 294, 0.00, 'cursando', '2018-07-27 02:29:10', '2018-07-27 02:29:10'),
(131, 3, 257, 15, 292, 0.00, 'cursando', '2018-07-27 02:29:32', '2018-07-27 02:29:32'),
(132, 3, 104, 15, 231, 0.00, 'cursando', '2018-07-27 02:30:01', '2018-07-27 02:30:01'),
(133, 3, 266, 13, 267, 0.00, 'cursando', '2018-07-27 02:30:23', '2018-07-27 02:30:23'),
(134, 3, 136, 13, 162, 0.00, 'cursando', '2018-07-27 02:31:12', '2018-07-27 02:31:12'),
(135, 3, 272, 15, 290, 0.00, 'cursando', '2018-07-27 02:31:50', '2018-07-27 02:31:50'),
(136, 3, 278, 13, 269, 0.00, 'cursando', '2018-07-27 02:33:11', '2018-07-27 02:33:11'),
(137, 3, 216, 13, 160, 0.00, 'cursando', '2018-07-27 02:33:35', '2018-07-27 02:33:35'),
(138, 3, 226, 13, 182, 0.00, 'cursando', '2018-07-27 02:34:09', '2018-07-27 02:34:09'),
(139, 3, 238, 94, 259, 0.00, 'cursando', '2018-07-27 02:44:48', '2018-07-27 02:44:48'),
(140, 3, 240, 94, 254, 0.00, 'cursando', '2018-07-27 02:45:21', '2018-07-27 02:45:21'),
(141, 3, 55, 94, 79, 0.00, 'cursando', '2018-07-27 02:57:26', '2018-07-27 02:57:26'),
(142, 3, 263, 94, 266, 0.00, 'cursando', '2018-07-27 02:59:21', '2018-07-27 02:59:21'),
(143, 3, 180, 96, 125, 0.00, 'cursando', '2018-07-27 03:02:12', '2018-07-27 03:02:12'),
(144, 3, 181, 96, 126, 0.00, 'cursando', '2018-07-27 03:02:25', '2018-07-27 03:02:25'),
(145, 3, 279, 94, 256, 0.00, 'cursando', '2018-07-27 03:14:44', '2018-07-27 03:14:44'),
(146, 3, 282, 94, 265, 0.00, 'cursando', '2018-07-27 03:16:17', '2018-07-27 03:16:17'),
(147, 3, 205, 94, 13, 0.00, 'cursando', '2018-07-27 03:17:10', '2018-07-27 03:17:10'),
(148, 3, 256, 74, 284, 0.00, 'cursando', '2018-07-27 03:53:27', '2018-07-27 03:53:27'),
(149, 3, 25, 72, 97, 0.00, 'cursando', '2018-07-27 03:54:35', '2018-07-27 03:54:35'),
(150, 3, 5, 9, 3, 0.00, 'cursando', '2018-07-27 03:56:53', '2018-07-27 03:56:53'),
(151, 3, 248, 11, 281, 0.00, 'cursando', '2018-07-27 03:57:47', '2018-07-27 03:57:47'),
(152, 3, 259, 11, 287, 0.00, 'cursando', '2018-07-27 03:58:19', '2018-07-27 03:58:19'),
(153, 3, 258, 11, 286, 0.00, 'cursando', '2018-07-27 03:58:38', '2018-07-27 03:58:38'),
(154, 3, 283, 11, 300, 0.00, 'cursando', '2018-07-27 03:59:33', '2018-07-27 03:59:33'),
(155, 3, 287, 10, 253, 0.00, 'cursando', '2018-07-27 04:00:41', '2018-07-27 04:00:41'),
(156, 3, 17, 75, 90, 0.00, 'cursando', '2018-07-27 16:10:00', '2018-07-27 16:10:00'),
(157, 3, 83, 75, 114, 0.00, 'cursando', '2018-07-27 16:13:52', '2018-07-27 16:13:52'),
(158, 3, 262, 77, 283, 0.00, 'cursando', '2018-07-27 16:18:42', '2018-07-27 16:18:42'),
(159, 3, 207, 75, 99, 0.00, 'cursando', '2018-07-27 16:21:53', '2018-07-27 16:21:53'),
(160, 3, 288, 77, 288, 0.00, 'cursando', '2018-07-27 16:23:28', '2018-07-27 16:23:28'),
(161, 3, 235, 77, 161, 0.00, 'cursando', '2018-07-27 16:24:09', '2018-07-27 16:24:09'),
(162, 3, 47, 78, 109, 0.00, 'cursando', '2018-07-27 16:26:20', '2018-07-27 16:26:20'),
(163, 3, 285, 78, 282, 0.00, 'cursando', '2018-07-27 16:30:10', '2018-07-27 16:30:10'),
(164, 3, 244, 87, 251, 0.00, 'cursando', '2018-07-27 16:32:38', '2018-07-27 16:32:38'),
(165, 3, 250, 87, 280, 0.00, 'cursando', '2018-07-27 16:34:19', '2018-07-27 16:34:19'),
(166, 3, 14, 84, 220, 0.00, 'cursando', '2018-07-27 16:57:18', '2018-07-27 16:57:18'),
(167, 3, 115, 84, 150, 0.00, 'cursando', '2018-07-27 16:58:29', '2018-07-27 16:58:29'),
(168, 3, 52, 84, 149, 0.00, 'cursando', '2018-07-27 16:59:07', '2018-07-27 16:59:07'),
(169, 3, 118, 84, 151, 0.00, 'cursando', '2018-07-27 16:59:38', '2018-07-27 16:59:38'),
(170, 3, 215, 85, 160, 0.00, 'cursando', '2018-07-27 17:00:38', '2018-07-27 17:00:38'),
(171, 3, 189, 84, 159, 0.00, 'cursando', '2018-07-27 17:01:35', '2018-07-27 17:01:35');

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `capacity` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`id`, `name`, `capacity`, `created_at`, `updated_at`) VALUES
(1, 'AULA 1', 30, '2018-03-24 16:20:52', '2018-05-13 20:28:41'),
(2, 'AULA 2', 30, '2018-03-24 16:20:54', '2018-03-24 16:20:54'),
(3, 'AULA 3', 30, '2018-03-24 16:20:58', '2018-03-24 16:20:58'),
(4, 'AULA 4', 30, '2018-03-24 16:21:02', '2018-03-24 16:21:02'),
(5, 'AULA 5', 30, '2018-03-24 16:21:06', '2018-03-24 16:21:06'),
(6, 'AULA 6', 30, '2018-03-24 16:21:09', '2018-03-24 16:21:09');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `level` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `user_id`, `type`, `level`, `created_at`, `updated_at`) VALUES
(1, 3, 'regular', 'tecnico_superior', '2018-03-24 16:16:00', '2018-03-24 16:16:00'),
(2, 6, 'regular', 'capacitacion', '2018-03-24 16:55:51', '2018-03-24 16:55:51'),
(3, 7, 'regular', 'tecnico_superior', '2018-07-11 17:39:04', '2018-07-11 17:39:04'),
(4, 8, 'regular', 'tecnico_medio', '2018-07-11 18:04:19', '2018-07-11 18:04:19'),
(5, 9, 'regular', 'tecnico_medio', '2018-07-11 18:09:35', '2018-07-11 18:09:35'),
(6, 10, 'regular', 'tecnico_medio', '2018-07-11 18:18:57', '2018-07-11 18:18:57'),
(7, 11, 'regular', 'tecnico_medio', '2018-07-11 18:24:59', '2018-07-11 18:24:59'),
(8, 12, 'becario', 'tecnico_medio', '2018-07-11 18:30:10', '2018-07-11 18:30:10'),
(9, 13, 'becario', 'tecnico_medio', '2018-07-11 18:33:54', '2018-07-11 18:33:54'),
(10, 14, 'regular', 'tecnico_medio', '2018-07-11 18:38:01', '2018-07-11 18:38:01'),
(11, 15, 'regular', 'tecnico_medio', '2018-07-11 18:45:12', '2018-07-11 18:45:12'),
(12, 16, 'regular', 'tecnico_medio', '2018-07-11 18:48:24', '2018-07-11 18:48:24'),
(13, 17, 'regular', 'tecnico_superior', '2018-07-11 18:52:06', '2018-07-11 18:52:06'),
(14, 18, 'regular', 'tecnico_medio', '2018-07-11 18:56:11', '2018-07-11 18:56:11'),
(15, 19, 'regular', 'tecnico_medio', '2018-07-11 19:01:30', '2018-07-11 19:01:30'),
(16, 20, 'regular', 'tecnico_medio', '2018-07-11 19:06:12', '2018-07-11 19:06:12'),
(17, 21, 'regular', 'tecnico_medio', '2018-07-11 19:09:25', '2018-07-11 19:09:25'),
(18, 22, 'regular', 'tecnico_medio', '2018-07-11 19:13:20', '2018-07-11 19:13:20'),
(19, 23, 'regular', 'tecnico_medio', '2018-07-11 19:17:02', '2018-07-11 19:17:02'),
(20, 24, 'regular', 'tecnico_superior', '2018-07-11 23:26:40', '2018-07-11 23:26:40'),
(21, 25, 'regular', 'tecnico_superior', '2018-07-11 23:29:43', '2018-07-11 23:29:43'),
(22, 26, 'regular', 'tecnico_superior', '2018-07-11 23:34:15', '2018-07-11 23:34:15'),
(23, 27, 'regular', 'tecnico_superior', '2018-07-11 23:39:11', '2018-07-11 23:39:11'),
(24, 29, 'regular', 'tecnico_superior', '2018-07-12 00:07:10', '2018-07-12 00:07:10'),
(25, 30, 'regular', 'tecnico_superior', '2018-07-12 00:11:21', '2018-07-12 00:11:21'),
(26, 31, 'regular', 'tecnico_superior', '2018-07-12 00:15:21', '2018-07-12 00:15:21'),
(27, 32, 'regular', 'tecnico_superior', '2018-07-12 00:21:04', '2018-07-12 00:21:04'),
(28, 33, 'regular', 'tecnico_superior', '2018-07-12 00:25:03', '2018-07-12 00:25:03'),
(29, 34, 'regular', 'tecnico_superior', '2018-07-12 00:36:04', '2018-07-12 00:36:04'),
(30, 35, 'regular', 'tecnico_superior', '2018-07-12 00:39:47', '2018-07-12 00:39:47'),
(31, 36, 'regular', 'tecnico_superior', '2018-07-12 00:43:53', '2018-07-12 00:43:53'),
(32, 37, 'regular', 'tecnico_superior', '2018-07-12 01:00:57', '2018-07-12 01:00:57'),
(33, 50, 'regular', 'tecnico_superior', '2018-07-12 16:27:14', '2018-07-12 16:27:14'),
(34, 51, 'regular', 'tecnico_superior', '2018-07-12 16:33:34', '2018-07-12 16:33:34'),
(35, 52, 'regular', 'tecnico_superior', '2018-07-12 16:42:39', '2018-07-12 16:42:39'),
(36, 53, 'regular', 'tecnico_superior', '2018-07-12 16:46:25', '2018-07-12 16:46:25'),
(37, 54, 'regular', 'tecnico_superior', '2018-07-12 16:53:28', '2018-07-12 16:53:28'),
(38, 55, 'regular', 'tecnico_superior', '2018-07-12 16:57:37', '2018-07-12 16:57:37'),
(39, 58, 'regular', 'tecnico_superior', '2018-07-12 17:29:22', '2018-07-12 17:29:22'),
(41, 60, 'regular', 'tecnico_superior', '2018-07-12 17:36:58', '2018-07-12 17:36:58'),
(43, 62, 'regular', 'tecnico_superior', '2018-07-12 17:41:00', '2018-07-12 17:41:00'),
(47, 66, 'regular', 'tecnico_superior', '2018-07-12 17:47:37', '2018-07-12 17:47:37'),
(51, 70, 'regular', 'tecnico_superior', '2018-07-12 17:54:35', '2018-07-12 17:54:35'),
(54, 73, 'regular', 'tecnico_superior', '2018-07-12 17:57:29', '2018-07-12 17:57:29'),
(55, 74, 'regular', 'tecnico_superior', '2018-07-12 18:00:03', '2018-07-12 18:00:03'),
(56, 75, 'regular', 'tecnico_superior', '2018-07-12 18:02:12', '2018-07-12 18:02:12'),
(57, 76, 'regular', 'tecnico_superior', '2018-07-12 18:05:01', '2018-07-12 18:05:01'),
(58, 77, 'regular', 'tecnico_superior', '2018-07-12 18:10:52', '2018-07-12 18:10:52'),
(59, 78, 'regular', 'tecnico_superior', '2018-07-12 18:23:25', '2018-07-12 18:23:25'),
(60, 79, 'regular', 'tecnico_superior', '2018-07-12 18:31:27', '2018-07-12 18:31:27'),
(61, 80, 'regular', 'tecnico_superior', '2018-07-12 18:34:14', '2018-07-12 18:34:14'),
(62, 81, 'regular', 'tecnico_superior', '2018-07-12 18:37:16', '2018-07-12 18:37:16'),
(63, 82, 'regular', 'tecnico_superior', '2018-07-12 18:40:07', '2018-07-12 18:40:07'),
(64, 83, 'regular', 'tecnico_superior', '2018-07-12 18:42:36', '2018-07-12 18:42:36'),
(65, 84, 'regular', 'tecnico_superior', '2018-07-12 18:45:30', '2018-07-12 18:45:30'),
(66, 85, 'regular', 'tecnico_superior', '2018-07-12 18:48:47', '2018-07-12 18:48:47'),
(67, 86, 'regular', 'tecnico_superior', '2018-07-12 18:51:13', '2018-07-12 18:51:13'),
(68, 87, 'regular', 'tecnico_superior', '2018-07-12 18:53:42', '2018-07-12 18:53:42'),
(69, 88, 'regular', 'tecnico_superior', '2018-07-12 18:57:37', '2018-07-12 18:57:37'),
(70, 89, 'regular', 'tecnico_superior', '2018-07-12 19:00:33', '2018-07-12 19:00:33'),
(71, 90, 'regular', 'tecnico_superior', '2018-07-12 19:02:55', '2018-07-12 19:02:55'),
(72, 91, 'regular', 'tecnico_superior', '2018-07-12 19:05:25', '2018-07-12 19:05:25'),
(73, 92, 'regular', 'tecnico_superior', '2018-07-12 19:08:12', '2018-07-12 19:08:12'),
(75, 94, 'regular', 'tecnico_superior', '2018-07-12 21:50:20', '2018-07-12 21:50:20'),
(76, 95, 'regular', 'tecnico_superior', '2018-07-12 21:53:45', '2018-07-12 21:53:45'),
(77, 96, 'regular', 'tecnico_superior', '2018-07-12 21:57:04', '2018-07-12 21:57:04'),
(78, 97, 'regular', 'tecnico_superior', '2018-07-12 21:59:57', '2018-07-12 21:59:57'),
(79, 98, 'regular', 'tecnico_superior', '2018-07-12 22:06:23', '2018-07-12 22:06:23'),
(80, 99, 'regular', 'tecnico_superior', '2018-07-12 22:09:07', '2018-07-12 22:09:07'),
(81, 100, 'regular', 'tecnico_superior', '2018-07-12 22:27:57', '2018-07-12 22:27:57'),
(82, 101, 'regular', 'tecnico_superior', '2018-07-12 22:37:26', '2018-07-12 22:37:26'),
(83, 102, 'regular', 'tecnico_superior', '2018-07-12 22:48:36', '2018-07-12 22:48:36'),
(84, 104, 'regular', 'tecnico_superior', '2018-07-12 23:08:09', '2018-07-12 23:08:09'),
(85, 105, 'regular', 'tecnico_superior', '2018-07-12 23:12:04', '2018-07-12 23:12:04'),
(86, 106, 'regular', 'tecnico_superior', '2018-07-12 23:14:56', '2018-07-12 23:14:56'),
(87, 107, 'regular', 'tecnico_superior', '2018-07-12 23:17:38', '2018-07-12 23:17:38'),
(88, 108, 'regular', 'tecnico_superior', '2018-07-12 23:23:27', '2018-07-12 23:23:27'),
(89, 109, 'regular', 'tecnico_superior', '2018-07-12 23:28:21', '2018-07-12 23:28:21'),
(90, 110, 'regular', 'tecnico_superior', '2018-07-12 23:30:52', '2018-07-12 23:30:52'),
(91, 111, 'regular', 'tecnico_superior', '2018-07-12 23:34:49', '2018-07-12 23:34:49'),
(92, 112, 'regular', 'tecnico_superior', '2018-07-12 23:37:45', '2018-07-12 23:37:45'),
(93, 113, 'regular', 'tecnico_superior', '2018-07-12 23:41:11', '2018-07-12 23:41:11'),
(94, 114, 'regular', 'tecnico_superior', '2018-07-12 23:43:34', '2018-07-12 23:43:34'),
(95, 115, 'regular', 'tecnico_superior', '2018-07-12 23:47:14', '2018-07-12 23:47:14'),
(96, 116, 'becario', 'tecnico_superior', '2018-07-12 23:49:23', '2018-07-12 23:49:23'),
(97, 117, 'regular', 'tecnico_superior', '2018-07-12 23:53:12', '2018-07-12 23:53:12'),
(98, 118, 'regular', 'tecnico_superior', '2018-07-12 23:56:05', '2018-07-12 23:56:05'),
(99, 119, 'regular', 'tecnico_superior', '2018-07-12 23:59:50', '2018-07-12 23:59:50'),
(100, 120, 'regular', 'tecnico_superior', '2018-07-13 00:03:27', '2018-07-13 00:03:27'),
(101, 121, 'regular', 'tecnico_superior', '2018-07-13 00:06:40', '2018-07-13 00:06:40'),
(102, 122, 'regular', 'tecnico_superior', '2018-07-13 00:10:12', '2018-07-13 00:10:12'),
(103, 123, 'regular', 'tecnico_superior', '2018-07-13 00:13:44', '2018-07-13 00:13:44'),
(104, 124, 'regular', 'tecnico_superior', '2018-07-13 00:16:46', '2018-07-13 00:16:46'),
(105, 125, 'regular', 'tecnico_superior', '2018-07-13 00:25:46', '2018-07-13 00:25:46'),
(106, 126, 'regular', 'tecnico_superior', '2018-07-13 00:32:00', '2018-07-13 00:32:00'),
(107, 127, 'regular', 'tecnico_superior', '2018-07-13 00:35:46', '2018-07-13 00:35:46'),
(108, 128, 'regular', 'tecnico_superior', '2018-07-13 01:22:58', '2018-07-13 01:22:58'),
(109, 129, 'regular', 'tecnico_superior', '2018-07-13 01:34:31', '2018-07-13 01:34:31'),
(110, 130, 'regular', 'tecnico_superior', '2018-07-13 01:48:36', '2018-07-13 01:48:36'),
(111, 131, 'becario', 'tecnico_superior', '2018-07-13 01:54:49', '2018-07-13 01:54:49'),
(112, 132, 'regular', 'tecnico_superior', '2018-07-13 16:57:05', '2018-07-13 16:57:05'),
(113, 133, 'regular', 'tecnico_superior', '2018-07-13 16:59:27', '2018-07-13 16:59:27'),
(114, 134, 'regular', 'tecnico_superior', '2018-07-13 17:02:41', '2018-07-13 17:02:41'),
(115, 135, 'regular', 'tecnico_superior', '2018-07-13 17:06:54', '2018-07-13 17:06:54'),
(116, 136, 'regular', 'tecnico_superior', '2018-07-13 17:09:49', '2018-07-13 17:09:49'),
(117, 137, 'regular', 'tecnico_medio', '2018-07-13 17:29:29', '2018-07-13 17:29:29'),
(118, 138, 'regular', 'tecnico_superior', '2018-07-13 18:11:03', '2018-07-13 18:11:03'),
(119, 139, 'regular', 'tecnico_medio', '2018-07-13 18:22:21', '2018-07-13 18:22:21'),
(120, 140, 'regular', 'tecnico_superior', '2018-07-13 18:35:06', '2018-07-13 18:35:06'),
(121, 141, 'regular', 'tecnico_superior', '2018-07-13 18:44:11', '2018-07-13 18:44:11'),
(122, 142, 'regular', 'tecnico_superior', '2018-07-13 18:51:26', '2018-07-13 18:51:26'),
(123, 143, 'regular', 'tecnico_superior', '2018-07-13 18:58:14', '2018-07-13 18:58:14'),
(124, 144, 'regular', 'tecnico_medio', '2018-07-14 18:02:39', '2018-07-14 18:02:39'),
(125, 145, 'regular', 'capacitacion', '2018-07-14 18:09:58', '2018-07-14 18:09:58'),
(126, 146, 'regular', 'capacitacion', '2018-07-14 18:13:03', '2018-07-14 18:13:03'),
(127, 147, 'regular', 'tecnico_superior', '2018-07-14 18:16:09', '2018-07-14 18:16:09'),
(128, 148, 'regular', 'tecnico_superior', '2018-07-14 18:20:39', '2018-07-14 18:20:39'),
(129, 149, 'regular', 'tecnico_superior', '2018-07-14 18:25:34', '2018-07-14 18:25:34'),
(130, 150, 'regular', 'tecnico_superior', '2018-07-14 18:33:05', '2018-07-14 18:33:05'),
(131, 151, 'regular', 'tecnico_superior', '2018-07-14 18:35:44', '2018-07-14 18:35:44'),
(132, 152, 'regular', 'tecnico_medio', '2018-07-14 18:38:41', '2018-07-14 18:38:41'),
(133, 153, 'regular', 'tecnico_superior', '2018-07-14 18:43:52', '2018-07-14 18:43:52'),
(134, 154, 'regular', 'tecnico_superior', '2018-07-14 18:47:41', '2018-07-14 18:47:41'),
(135, 155, 'regular', 'tecnico_superior', '2018-07-14 18:50:11', '2018-07-14 18:50:11'),
(136, 156, 'regular', 'tecnico_superior', '2018-07-14 18:52:16', '2018-07-14 18:52:16'),
(137, 157, 'regular', 'tecnico_superior', '2018-07-14 18:55:08', '2018-07-14 18:55:08'),
(138, 158, 'regular', 'tecnico_superior', '2018-07-14 18:59:00', '2018-07-14 18:59:00'),
(139, 159, 'regular', 'capacitacion', '2018-07-14 19:01:12', '2018-07-14 19:01:12'),
(140, 160, 'regular', 'capacitacion', '2018-07-14 19:03:54', '2018-07-14 19:03:54'),
(141, 161, 'regular', 'capacitacion', '2018-07-14 19:09:02', '2018-07-14 19:09:02'),
(142, 162, 'regular', 'capacitacion', '2018-07-14 19:11:34', '2018-07-14 19:11:34'),
(143, 163, 'regular', 'capacitacion', '2018-07-14 19:14:57', '2018-07-14 19:14:57'),
(144, 164, 'regular', 'capacitacion', '2018-07-16 16:18:54', '2018-07-16 16:18:54'),
(145, 165, 'regular', 'capacitacion', '2018-07-16 16:23:16', '2018-07-16 16:23:16'),
(146, 166, 'regular', 'capacitacion', '2018-07-16 16:26:42', '2018-07-16 16:26:42'),
(147, 167, 'regular', 'capacitacion', '2018-07-16 16:29:33', '2018-07-16 16:29:33'),
(148, 168, 'regular', 'capacitacion', '2018-07-16 16:37:18', '2018-07-16 16:37:18'),
(149, 169, 'regular', 'capacitacion', '2018-07-16 16:54:41', '2018-07-16 16:54:41'),
(150, 170, 'regular', 'capacitacion', '2018-07-16 16:58:51', '2018-07-16 16:58:51'),
(151, 171, 'regular', 'capacitacion', '2018-07-16 17:03:28', '2018-07-16 17:03:28'),
(152, 172, 'regular', 'tecnico_medio', '2018-07-16 17:08:13', '2018-07-16 17:08:13'),
(153, 173, 'regular', 'tecnico_medio', '2018-07-16 17:12:37', '2018-07-16 17:12:37'),
(154, 174, 'regular', 'tecnico_superior', '2018-07-16 17:16:33', '2018-07-16 17:16:33'),
(155, 175, 'regular', 'tecnico_superior', '2018-07-16 17:19:31', '2018-07-16 17:19:31'),
(156, 176, 'regular', 'tecnico_superior', '2018-07-16 17:23:15', '2018-07-16 17:23:15'),
(157, 177, 'regular', 'tecnico_superior', '2018-07-16 17:26:30', '2018-07-16 17:26:30'),
(158, 178, 'regular', 'tecnico_superior', '2018-07-16 17:30:07', '2018-07-16 17:30:07'),
(159, 179, 'regular', 'capacitacion', '2018-07-16 17:33:04', '2018-07-16 17:33:04'),
(160, 180, 'regular', 'capacitacion', '2018-07-16 17:35:48', '2018-07-16 17:35:48'),
(161, 181, 'regular', 'capacitacion', '2018-07-16 17:38:13', '2018-07-16 17:38:13'),
(162, 182, 'regular', 'tecnico_superior', '2018-07-16 17:40:35', '2018-07-16 17:40:35'),
(163, 183, 'regular', 'tecnico_medio', '2018-07-16 17:43:48', '2018-07-16 17:43:48'),
(164, 184, 'regular', 'capacitacion', '2018-07-16 17:46:45', '2018-07-16 17:46:45'),
(165, 185, 'regular', 'tecnico_superior', '2018-07-16 17:50:31', '2018-07-16 17:50:31'),
(166, 186, 'regular', 'tecnico_medio', '2018-07-16 17:53:47', '2018-07-16 17:53:47'),
(167, 187, 'regular', 'capacitacion', '2018-07-16 17:56:45', '2018-07-16 17:56:45'),
(168, 188, 'regular', 'capacitacion', '2018-07-16 18:00:33', '2018-07-16 18:00:33'),
(169, 189, 'regular', 'tecnico_superior', '2018-07-16 18:03:25', '2018-07-16 18:03:25'),
(170, 190, 'regular', 'tecnico_superior', '2018-07-16 18:07:04', '2018-07-16 18:07:04'),
(171, 191, 'regular', 'tecnico_superior', '2018-07-16 18:12:33', '2018-07-16 18:12:33'),
(172, 192, 'regular', 'capacitacion', '2018-07-16 18:17:50', '2018-07-16 18:17:50'),
(173, 193, 'regular', 'capacitacion', '2018-07-16 18:20:13', '2018-07-16 18:20:13'),
(174, 194, 'regular', 'capacitacion', '2018-07-16 18:22:16', '2018-07-16 18:22:16'),
(175, 195, 'regular', 'capacitacion', '2018-07-16 18:24:21', '2018-07-16 18:24:21'),
(176, 196, 'regular', 'tecnico_superior', '2018-07-16 18:26:23', '2018-07-16 18:26:23'),
(177, 197, 'regular', 'tecnico_medio', '2018-07-16 18:29:09', '2018-07-16 18:29:09'),
(178, 198, 'regular', 'capacitacion', '2018-07-16 18:31:44', '2018-07-16 18:31:44'),
(179, 199, 'regular', 'tecnico_superior', '2018-07-16 18:34:21', '2018-07-16 18:34:21'),
(180, 200, 'regular', 'tecnico_superior', '2018-07-16 18:36:46', '2018-07-16 18:36:46'),
(181, 201, 'regular', 'tecnico_superior', '2018-07-16 18:39:28', '2018-07-16 18:39:28'),
(182, 202, 'regular', 'tecnico_superior', '2018-07-16 18:42:20', '2018-07-16 18:42:20'),
(183, 203, 'regular', 'tecnico_superior', '2018-07-16 18:44:48', '2018-07-16 18:44:48'),
(184, 204, 'regular', 'capacitacion', '2018-07-16 18:47:01', '2018-07-16 18:47:01'),
(185, 205, 'regular', 'tecnico_medio', '2018-07-16 18:50:26', '2018-07-16 18:50:26'),
(186, 206, 'regular', 'tecnico_superior', '2018-07-16 18:58:45', '2018-07-16 18:58:45'),
(187, 207, 'regular', 'capacitacion', '2018-07-16 19:02:36', '2018-07-16 19:02:36'),
(188, 208, 'regular', 'capacitacion', '2018-07-16 19:06:38', '2018-07-16 19:06:38'),
(189, 209, 'regular', 'capacitacion', '2018-07-16 19:09:40', '2018-07-16 19:09:40'),
(190, 210, 'regular', 'tecnico_superior', '2018-07-16 19:11:45', '2018-07-16 19:11:45'),
(191, 211, 'regular', 'tecnico_superior', '2018-07-17 16:19:35', '2018-07-17 16:19:35'),
(192, 212, 'regular', 'capacitacion', '2018-07-17 16:24:45', '2018-07-17 16:24:45'),
(193, 213, 'regular', 'tecnico_superior', '2018-07-17 16:27:34', '2018-07-17 16:27:34'),
(194, 214, 'regular', 'tecnico_superior', '2018-07-17 16:36:09', '2018-07-17 16:36:09'),
(195, 215, 'regular', 'tecnico_superior', '2018-07-17 16:40:30', '2018-07-17 16:40:30'),
(196, 216, 'regular', 'tecnico_superior', '2018-07-17 16:42:32', '2018-07-17 16:42:32'),
(197, 217, 'regular', 'tecnico_superior', '2018-07-17 16:46:41', '2018-07-17 16:46:41'),
(198, 218, 'regular', 'capacitacion', '2018-07-17 16:57:08', '2018-07-17 16:57:08'),
(199, 219, 'regular', 'capacitacion', '2018-07-17 17:00:21', '2018-07-17 17:00:21'),
(200, 220, 'regular', 'capacitacion', '2018-07-17 17:06:22', '2018-07-17 17:06:22'),
(201, 221, 'regular', 'capacitacion', '2018-07-17 17:09:25', '2018-07-17 17:09:25'),
(202, 222, 'regular', 'capacitacion', '2018-07-17 17:12:18', '2018-07-17 17:12:18'),
(203, 223, 'regular', 'capacitacion', '2018-07-17 17:16:45', '2018-07-17 17:16:45'),
(204, 224, 'regular', 'capacitacion', '2018-07-17 17:19:53', '2018-07-17 17:19:53'),
(205, 225, 'regular', 'capacitacion', '2018-07-17 17:27:01', '2018-07-17 17:27:01'),
(207, 227, 'becario', 'capacitacion', '2018-07-17 17:50:19', '2018-07-17 17:50:19'),
(208, 228, 'becario', 'capacitacion', '2018-07-17 17:52:28', '2018-07-17 17:52:28'),
(209, 229, 'regular', 'capacitacion', '2018-07-17 17:57:56', '2018-07-17 17:57:56'),
(210, 230, 'regular', 'capacitacion', '2018-07-17 17:59:54', '2018-07-17 17:59:54'),
(211, 231, 'regular', 'capacitacion', '2018-07-17 18:02:21', '2018-07-17 18:02:21'),
(212, 232, 'regular', 'capacitacion', '2018-07-17 18:04:18', '2018-07-17 18:04:18'),
(213, 233, 'regular', 'capacitacion', '2018-07-17 18:06:20', '2018-07-17 18:06:20'),
(214, 234, 'regular', 'capacitacion', '2018-07-17 18:08:28', '2018-07-17 18:08:28'),
(215, 235, 'becario', 'capacitacion', '2018-07-17 18:12:24', '2018-07-17 18:12:24'),
(216, 236, 'becario', 'capacitacion', '2018-07-17 18:15:00', '2018-07-17 18:15:00'),
(217, 237, 'becario', 'capacitacion', '2018-07-17 18:16:59', '2018-07-17 18:16:59'),
(218, 238, 'regular', 'capacitacion', '2018-07-17 18:20:12', '2018-07-17 18:20:12'),
(219, 239, 'regular', 'capacitacion', '2018-07-17 18:22:30', '2018-07-17 18:22:30'),
(220, 240, 'regular', 'capacitacion', '2018-07-17 18:25:12', '2018-07-17 18:25:12'),
(221, 241, 'regular', 'capacitacion', '2018-07-17 18:27:47', '2018-07-17 18:27:47'),
(222, 242, 'regular', 'capacitacion', '2018-07-17 18:30:26', '2018-07-17 18:30:26'),
(223, 243, 'regular', 'capacitacion', '2018-07-17 18:33:13', '2018-07-17 18:33:13'),
(224, 244, 'regular', 'capacitacion', '2018-07-17 18:41:11', '2018-07-17 18:41:11'),
(225, 245, 'regular', 'capacitacion', '2018-07-17 18:43:29', '2018-07-17 18:43:29'),
(226, 246, 'regular', 'tecnico_superior', '2018-07-17 18:46:19', '2018-07-17 18:46:19'),
(227, 247, 'regular', 'capacitacion', '2018-07-17 18:49:42', '2018-07-17 18:49:42'),
(228, 248, 'regular', 'capacitacion', '2018-07-17 18:53:55', '2018-07-17 18:53:55'),
(229, 249, 'regular', 'capacitacion', '2018-07-17 18:56:19', '2018-07-17 18:56:19'),
(230, 250, 'regular', 'capacitacion', '2018-07-17 18:59:48', '2018-07-17 18:59:48'),
(231, 251, 'regular', 'capacitacion', '2018-07-17 21:46:23', '2018-07-17 21:46:23'),
(232, 252, 'intensivo', 'capacitacion', '2018-07-17 21:49:49', '2018-07-17 21:49:49'),
(233, 253, 'intensivo', 'capacitacion', '2018-07-17 21:51:51', '2018-07-17 21:51:51'),
(234, 254, 'regular', 'capacitacion', '2018-07-17 21:54:15', '2018-07-17 21:54:15'),
(235, 255, 'regular', 'capacitacion', '2018-07-17 21:59:24', '2018-07-17 21:59:24'),
(236, 256, 'regular', 'capacitacion', '2018-07-17 22:03:49', '2018-07-17 22:03:49'),
(237, 257, 'regular', 'capacitacion', '2018-07-17 22:10:06', '2018-07-17 22:10:06'),
(238, 258, 'regular', 'capacitacion', '2018-07-17 22:11:44', '2018-07-17 22:11:44'),
(239, 259, 'regular', 'capacitacion', '2018-07-17 22:27:56', '2018-07-17 22:27:56'),
(240, 260, 'regular', 'capacitacion', '2018-07-17 22:31:10', '2018-07-17 22:31:10'),
(241, 261, 'regular', 'capacitacion', '2018-07-17 22:54:38', '2018-07-17 22:54:38'),
(242, 262, 'regular', 'capacitacion', '2018-07-17 23:03:17', '2018-07-17 23:03:17'),
(243, 263, 'regular', 'capacitacion', '2018-07-17 23:18:22', '2018-07-17 23:18:22'),
(244, 264, 'regular', 'capacitacion', '2018-07-17 23:21:14', '2018-07-17 23:21:14'),
(245, 265, 'regular', 'capacitacion', '2018-07-17 23:24:06', '2018-07-17 23:24:06'),
(246, 266, 'regular', 'capacitacion', '2018-07-17 23:26:12', '2018-07-17 23:26:12'),
(247, 267, 'regular', 'capacitacion', '2018-07-17 23:28:43', '2018-07-17 23:28:43'),
(248, 268, 'regular', 'capacitacion', '2018-07-19 22:17:05', '2018-07-19 22:17:05'),
(249, 269, 'regular', 'tecnico_superior', '2018-07-24 00:16:54', '2018-07-24 00:16:54'),
(250, 270, 'regular', 'tecnico_medio', '2018-07-24 00:21:21', '2018-07-24 00:21:21'),
(251, 271, 'regular', 'tecnico_superior', '2018-07-24 00:25:56', '2018-07-24 00:25:56'),
(252, 272, 'regular', 'tecnico_superior', '2018-07-24 00:37:00', '2018-07-24 00:37:00'),
(253, 273, 'regular', 'tecnico_medio', '2018-07-24 00:48:44', '2018-07-24 00:48:44'),
(254, 274, 'regular', 'tecnico_superior', '2018-07-24 00:54:49', '2018-07-24 00:54:49'),
(255, 275, 'regular', 'tecnico_superior', '2018-07-24 01:02:23', '2018-07-24 01:02:23'),
(256, 276, 'regular', 'tecnico_superior', '2018-07-24 01:06:38', '2018-07-24 01:06:38'),
(257, 277, 'regular', 'tecnico_superior', '2018-07-24 01:09:40', '2018-07-24 01:09:40'),
(258, 278, 'regular', 'tecnico_superior', '2018-07-24 01:41:47', '2018-07-24 01:41:47'),
(259, 279, 'regular', 'tecnico_superior', '2018-07-24 01:48:18', '2018-07-24 01:48:18'),
(260, 280, 'regular', 'tecnico_superior', '2018-07-24 01:52:25', '2018-07-24 01:52:25'),
(261, 281, 'regular', 'tecnico_medio', '2018-07-24 01:55:51', '2018-07-24 01:55:51'),
(262, 282, 'regular', 'tecnico_superior', '2018-07-24 02:00:36', '2018-07-24 02:00:36'),
(263, 283, 'regular', 'tecnico_superior', '2018-07-24 02:04:41', '2018-07-24 02:04:41'),
(264, 284, 'regular', 'tecnico_superior', '2018-07-24 02:15:26', '2018-07-24 02:15:26'),
(265, 285, 'regular', 'tecnico_superior', '2018-07-24 02:21:04', '2018-07-24 02:21:04'),
(266, 286, 'regular', 'tecnico_superior', '2018-07-24 02:25:52', '2018-07-24 02:25:52'),
(267, 287, 'regular', 'tecnico_superior', '2018-07-24 02:29:12', '2018-07-24 02:29:12'),
(268, 288, 'regular', 'tecnico_superior', '2018-07-24 02:37:40', '2018-07-24 02:37:40'),
(269, 289, 'regular', 'tecnico_superior', '2018-07-24 02:41:33', '2018-07-24 02:41:33'),
(270, 290, 'regular', 'tecnico_medio', '2018-07-24 02:49:17', '2018-07-24 02:49:17'),
(271, 291, 'regular', 'tecnico_superior', '2018-07-24 02:53:40', '2018-07-24 02:53:40'),
(272, 292, 'regular', 'tecnico_superior', '2018-07-24 02:59:04', '2018-07-24 02:59:04'),
(273, 293, 'regular', 'tecnico_superior', '2018-07-24 03:18:16', '2018-07-24 03:18:16'),
(274, 294, 'regular', 'tecnico_superior', '2018-07-24 03:25:20', '2018-07-24 03:25:20'),
(275, 295, 'regular', 'tecnico_medio', '2018-07-24 03:27:34', '2018-07-24 03:27:34'),
(276, 296, 'regular', 'tecnico_superior', '2018-07-24 03:31:29', '2018-07-24 03:31:29'),
(277, 297, 'regular', 'tecnico_superior', '2018-07-24 03:35:30', '2018-07-24 03:35:30'),
(278, 298, 'regular', 'capacitacion', '2018-07-24 03:56:45', '2018-07-24 03:56:45'),
(279, 299, 'regular', 'capacitacion', '2018-07-24 03:59:36', '2018-07-24 03:59:36'),
(280, 300, 'regular', 'capacitacion', '2018-07-24 16:34:00', '2018-07-24 16:34:00'),
(281, 301, 'regular', 'capacitacion', '2018-07-24 16:37:50', '2018-07-24 16:37:50'),
(282, 302, 'regular', 'capacitacion', '2018-07-24 16:43:11', '2018-07-24 16:43:11'),
(283, 303, 'regular', 'capacitacion', '2018-07-24 16:48:28', '2018-07-24 16:48:28'),
(284, 304, 'regular', 'capacitacion', '2018-07-24 17:03:18', '2018-07-24 17:03:18'),
(285, 305, 'regular', 'capacitacion', '2018-07-24 17:08:31', '2018-07-24 17:08:31'),
(286, 306, 'regular', 'capacitacion', '2018-07-24 17:22:15', '2018-07-24 17:22:15'),
(287, 307, 'regular', 'capacitacion', '2018-07-24 17:25:59', '2018-07-24 17:25:59'),
(288, 308, 'regular', 'capacitacion', '2018-07-24 17:29:09', '2018-07-24 17:29:09'),
(289, 309, 'regular', 'capacitacion', '2018-07-24 17:38:35', '2018-07-24 17:38:35'),
(290, 310, 'regular', 'capacitacion', '2018-07-24 17:55:08', '2018-07-24 17:55:08'),
(291, 311, 'regular', 'tecnico_superior', '2018-07-24 18:00:19', '2018-07-24 18:00:19'),
(292, 312, 'regular', 'capacitacion', '2018-07-24 18:03:43', '2018-07-24 18:03:43'),
(293, 313, 'regular', 'capacitacion', '2018-07-24 18:06:10', '2018-07-24 18:06:10'),
(294, 314, 'regular', 'capacitacion', '2018-07-24 18:12:42', '2018-07-24 18:12:42'),
(295, 315, 'regular', 'tecnico_superior', '2018-07-24 18:16:21', '2018-07-24 18:16:21'),
(296, 316, 'regular', 'capacitacion', '2018-07-24 18:21:42', '2018-07-24 18:21:42'),
(297, 317, 'regular', 'capacitacion', '2018-07-24 18:24:24', '2018-07-24 18:24:24'),
(298, 318, 'intensivo', 'capacitacion', '2018-07-24 18:30:01', '2018-07-24 18:30:01'),
(299, 319, 'regular', 'capacitacion', '2018-07-24 18:33:09', '2018-07-24 18:33:09'),
(300, 320, 'regular', 'capacitacion', '2018-07-24 18:37:03', '2018-07-24 18:37:03'),
(301, 321, 'regular', 'tecnico_superior', '2018-07-25 00:12:37', '2018-07-25 00:12:37'),
(302, 322, 'regular', 'tecnico_superior', '2018-07-25 00:20:30', '2018-07-25 00:20:30'),
(303, 323, 'regular', 'capacitacion', '2018-07-25 01:30:20', '2018-07-25 01:30:20');

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `id` int(10) UNSIGNED NOT NULL,
  `pensum_id` int(10) UNSIGNED NOT NULL,
  `bimester` int(10) UNSIGNED NOT NULL,
  `subject_code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `subject_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`id`, `pensum_id`, `bimester`, `subject_code`, `subject_name`, `created_at`, `updated_at`) VALUES
(19, 3, 1, 'FRA 1', 'FRANCES Bimestre 1', '2018-03-24 16:47:22', '2018-03-24 16:47:22'),
(20, 3, 2, 'FRA 2', 'FRANCES Bimestre 2', '2018-03-24 16:47:22', '2018-03-24 16:47:22'),
(21, 3, 5, 'FRA 5', 'FRANCES Bimestre 5', '2018-03-24 16:47:22', '2018-03-24 16:47:22'),
(22, 3, 3, 'FRA 3', 'FRANCES Bimestre 3', '2018-03-24 16:47:22', '2018-03-24 16:47:22'),
(23, 3, 4, 'FRA 4', 'FRANCES Bimestre 4', '2018-03-24 16:47:22', '2018-03-24 16:47:22'),
(24, 6, 1, 'ENG 1', 'INGLES Bimestre 1', '2018-07-11 19:09:59', '2018-07-11 19:09:59'),
(25, 6, 4, 'ENG 4', 'INGLES Bimestre 4', '2018-07-11 19:10:00', '2018-07-11 19:10:00'),
(26, 6, 3, 'ENG 3', 'INGLES Bimestre 3', '2018-07-11 19:10:00', '2018-07-11 19:10:00'),
(27, 6, 7, 'ENG 7', 'INGLES Bimestre 7', '2018-07-11 19:10:00', '2018-07-11 19:10:00'),
(28, 6, 2, 'ENG 2', 'INGLES Bimestre 2', '2018-07-11 19:10:00', '2018-07-11 19:10:00'),
(29, 6, 5, 'ENG 5', 'INGLES Bimestre 5', '2018-07-11 19:10:00', '2018-07-11 19:10:00'),
(30, 6, 6, 'ENG 6', 'INGLES Bimestre 6', '2018-07-11 19:10:00', '2018-07-11 19:10:00'),
(31, 6, 8, 'ENG 8', 'INGLES Bimestre 8', '2018-07-11 19:10:00', '2018-07-11 19:10:00'),
(32, 6, 12, 'ENG 12', 'INGLES Bimestre 12', '2018-07-11 19:10:00', '2018-07-11 19:10:00'),
(33, 6, 9, 'ENG 9', 'INGLES Bimestre 9', '2018-07-11 19:10:00', '2018-07-11 19:10:00'),
(34, 6, 10, 'ENG 10', 'INGLES Bimestre 10', '2018-07-11 19:10:00', '2018-07-11 19:10:00'),
(35, 6, 11, 'ENG 11', 'INGLES Bimestre 11', '2018-07-11 19:10:00', '2018-07-11 19:10:00'),
(36, 6, 13, 'ENG 13', 'INGLES Bimestre 13', '2018-07-11 19:10:01', '2018-07-11 19:10:01'),
(37, 6, 16, 'ENG 16', 'INGLES Bimestre 16', '2018-07-11 19:10:01', '2018-07-11 19:10:01'),
(38, 6, 15, 'ENG 15', 'INGLES Bimestre 15', '2018-07-11 19:10:01', '2018-07-11 19:10:01'),
(39, 6, 14, 'ENG 14', 'INGLES Bimestre 14', '2018-07-11 19:10:01', '2018-07-11 19:10:01'),
(40, 6, 17, 'ENG 17', 'INGLES Bimestre 17', '2018-07-11 19:10:01', '2018-07-11 19:10:01'),
(41, 6, 18, 'ENG 18', 'INGLES Bimestre 18', '2018-07-11 19:10:01', '2018-07-11 19:10:01'),
(42, 5, 1, 'ENG 1', 'INGLES Bimestre 1', '2018-07-11 19:10:24', '2018-07-11 19:10:24'),
(43, 5, 2, 'ENG 2', 'INGLES Bimestre 2', '2018-07-11 19:10:24', '2018-07-11 19:10:24'),
(44, 5, 5, 'ENG 5', 'INGLES Bimestre 5', '2018-07-11 19:10:24', '2018-07-11 19:10:24'),
(45, 5, 3, 'ENG 3', 'INGLES Bimestre 3', '2018-07-11 19:10:24', '2018-07-11 19:10:24'),
(46, 5, 6, 'ENG 6', 'INGLES Bimestre 6', '2018-07-11 19:10:24', '2018-07-11 19:10:24'),
(47, 5, 4, 'ENG 4', 'INGLES Bimestre 4', '2018-07-11 19:10:24', '2018-07-11 19:10:24'),
(48, 5, 7, 'ENG 7', 'INGLES Bimestre 7', '2018-07-11 19:10:24', '2018-07-11 19:10:24'),
(49, 5, 9, 'ENG 9', 'INGLES Bimestre 9', '2018-07-11 19:10:24', '2018-07-11 19:10:24'),
(50, 5, 8, 'ENG 8', 'INGLES Bimestre 8', '2018-07-11 19:10:24', '2018-07-11 19:10:24'),
(51, 5, 10, 'ENG 10', 'INGLES Bimestre 10', '2018-07-11 19:10:25', '2018-07-11 19:10:25'),
(52, 5, 11, 'ENG 11', 'INGLES Bimestre 11', '2018-07-11 19:10:25', '2018-07-11 19:10:25'),
(53, 5, 12, 'ENG 12', 'INGLES Bimestre 12', '2018-07-11 19:10:25', '2018-07-11 19:10:25'),
(54, 7, 1, 'ENG 1', 'INGLES Bimestre 1', '2018-07-11 19:10:57', '2018-07-11 19:10:57'),
(55, 7, 2, 'ENG 2', 'INGLES Bimestre 2', '2018-07-11 19:10:57', '2018-07-11 19:10:57'),
(56, 7, 7, 'ENG 7', 'INGLES Bimestre 7', '2018-07-11 19:10:57', '2018-07-11 19:10:57'),
(57, 7, 5, 'ENG 5', 'INGLES Bimestre 5', '2018-07-11 19:10:57', '2018-07-11 19:10:57'),
(58, 7, 4, 'ENG 4', 'INGLES Bimestre 4', '2018-07-11 19:10:57', '2018-07-11 19:10:57'),
(59, 7, 3, 'ENG 3', 'INGLES Bimestre 3', '2018-07-11 19:10:57', '2018-07-11 19:10:57'),
(60, 7, 6, 'ENG 6', 'INGLES Bimestre 6', '2018-07-11 19:10:57', '2018-07-11 19:10:57'),
(61, 7, 8, 'ENG 8', 'INGLES Bimestre 8', '2018-07-11 19:10:58', '2018-07-11 19:10:58'),
(62, 7, 9, 'ENG 9', 'INGLES Bimestre 9', '2018-07-11 19:10:58', '2018-07-11 19:10:58'),
(63, 7, 10, 'ENG 10', 'INGLES Bimestre 10', '2018-07-11 19:10:58', '2018-07-11 19:10:58'),
(64, 7, 11, 'ENG 11', 'INGLES Bimestre 11', '2018-07-11 19:10:58', '2018-07-11 19:10:58'),
(65, 7, 12, 'ENG 12', 'INGLES Bimestre 12', '2018-07-11 19:10:58', '2018-07-11 19:10:58'),
(66, 8, 1, 'ALEM 1', 'ALEMÁN Bimestre 1', '2018-07-12 02:29:29', '2018-07-12 02:29:29'),
(67, 8, 2, 'ALEM 2', 'ALEMÁN Bimestre 2', '2018-07-12 02:29:29', '2018-07-12 02:29:29'),
(68, 8, 3, 'ALEM 3', 'ALEMÁN Bimestre 3', '2018-07-12 02:29:30', '2018-07-12 02:29:30'),
(69, 8, 4, 'ALEM 4', 'ALEMÁN Bimestre 4', '2018-07-12 02:29:30', '2018-07-12 02:29:30'),
(70, 8, 5, 'ALEM 5', 'ALEMÁN Bimestre 5', '2018-07-12 02:29:30', '2018-07-12 02:29:30'),
(71, 10, 1, 'PORT 1', 'PORTUGUÉS Bimestre 1', '2018-07-12 02:29:44', '2018-07-12 02:29:44'),
(72, 10, 4, 'PORT 4', 'PORTUGUÉS Bimestre 4', '2018-07-12 02:29:45', '2018-07-12 02:29:45'),
(73, 10, 3, 'PORT 3', 'PORTUGUÉS Bimestre 3', '2018-07-12 02:29:45', '2018-07-12 02:29:45'),
(74, 10, 5, 'PORT 5', 'PORTUGUÉS Bimestre 5', '2018-07-12 02:29:45', '2018-07-12 02:29:45'),
(75, 10, 2, 'PORT 2', 'PORTUGUÉS Bimestre 2', '2018-07-12 02:29:45', '2018-07-12 02:29:45'),
(76, 9, 1, 'QUE 1', 'QUECHUA Bimestre 1', '2018-07-12 02:29:52', '2018-07-12 02:29:52'),
(77, 9, 5, 'QUE 5', 'QUECHUA Bimestre 5', '2018-07-12 02:29:52', '2018-07-12 02:29:52'),
(78, 9, 3, 'QUE 3', 'QUECHUA Bimestre 3', '2018-07-12 02:29:52', '2018-07-12 02:29:52'),
(79, 9, 2, 'QUE 2', 'QUECHUA Bimestre 2', '2018-07-12 02:29:52', '2018-07-12 02:29:52'),
(80, 9, 4, 'QUE 4', 'QUECHUA Bimestre 4', '2018-07-12 02:29:52', '2018-07-12 02:29:52'),
(81, 12, 1, 'ENG 1', 'INGLES Bimestre 1', '2018-07-30 03:17:24', '2018-07-30 03:17:24'),
(82, 12, 7, 'ENG 7', 'INGLES Bimestre 7', '2018-07-30 03:17:24', '2018-07-30 03:17:24'),
(83, 12, 2, 'ENG 2', 'INGLES Bimestre 2', '2018-07-30 03:17:24', '2018-07-30 03:17:24'),
(84, 12, 4, 'ENG 4', 'INGLES Bimestre 4', '2018-07-30 03:17:24', '2018-07-30 03:17:24'),
(85, 12, 6, 'ENG 6', 'INGLES Bimestre 6', '2018-07-30 03:17:24', '2018-07-30 03:17:24'),
(86, 12, 3, 'ENG 3', 'INGLES Bimestre 3', '2018-07-30 03:17:24', '2018-07-30 03:17:24'),
(87, 12, 5, 'ENG 5', 'INGLES Bimestre 5', '2018-07-30 03:17:24', '2018-07-30 03:17:24'),
(88, 12, 8, 'ENG 8', 'INGLES Bimestre 8', '2018-07-30 03:17:25', '2018-07-30 03:17:25'),
(89, 12, 9, 'ENG 9', 'INGLES Bimestre 9', '2018-07-30 03:17:25', '2018-07-30 03:17:25'),
(90, 12, 11, 'ENG 11', 'INGLES Bimestre 11', '2018-07-30 03:17:25', '2018-07-30 03:17:25'),
(91, 12, 12, 'ENG 12', 'INGLES Bimestre 12', '2018-07-30 03:17:25', '2018-07-30 03:17:25'),
(92, 12, 10, 'ENG 10', 'INGLES Bimestre 10', '2018-07-30 03:17:25', '2018-07-30 03:17:25');

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

CREATE TABLE `teachers` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `field_of_study` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `teachers`
--

INSERT INTO `teachers` (`id`, `user_id`, `type`, `field_of_study`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, 'maestría', '', '2018-03-24 16:06:48', '2018-03-24 16:06:48', NULL),
(2, 5, 'maestría', '', '2018-03-24 16:41:26', '2018-03-24 16:41:26', NULL),
(3, 38, 'licenciatura', 'IDIOMA INGLES', '2018-07-12 01:29:05', '2018-07-12 01:29:05', NULL),
(4, 39, 'tecnico_superior', 'IDIOMA INGLES', '2018-07-12 01:35:38', '2018-07-12 01:35:38', NULL),
(5, 40, 'tecnico_superior', 'IDIOMA INGLES', '2018-07-12 01:39:36', '2018-07-12 01:39:36', NULL),
(6, 41, 'tecnico_superior', 'IDIOMA INGLES', '2018-07-12 01:43:25', '2018-07-12 01:43:25', NULL),
(7, 42, 'tecnico_superior', 'IDIOMA INGLES', '2018-07-12 01:52:09', '2018-07-12 01:52:09', NULL),
(8, 43, 'licenciatura', 'IDIOMA INGLES', '2018-07-12 01:58:46', '2018-07-12 01:58:46', NULL),
(9, 44, 'tecnico_superior', 'IDIOMA INGLES', '2018-07-12 02:02:12', '2018-07-12 02:02:12', NULL),
(10, 45, 'capacitacion', 'IDIOMA INGLES', '2018-07-12 02:05:55', '2018-07-12 02:05:55', NULL),
(11, 46, 'tecnico_medio', 'IDIOMA INGLES', '2018-07-12 02:13:45', '2018-07-12 02:13:45', NULL),
(12, 47, 'tecnico_superior', 'IDIOMA INGLES', '2018-07-12 02:25:26', '2018-07-12 02:25:26', NULL),
(13, 48, 'licenciatura', 'IDIOMA INGLES', '2018-07-12 02:36:09', '2018-07-12 02:36:09', NULL),
(14, 49, 'capacitacion', 'IDIOMA INGLES', '2018-07-12 02:50:40', '2018-07-12 02:50:40', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tuitions`
--

CREATE TABLE `tuitions` (
  `id` int(10) UNSIGNED NOT NULL,
  `year_id` int(10) UNSIGNED NOT NULL,
  `pensum_record_id` int(10) UNSIGNED NOT NULL,
  `price` float(8,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `firstname` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `lastname` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(320) COLLATE utf8_unicode_ci DEFAULT NULL,
  `birthday` date NOT NULL,
  `gender` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cellphone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `identity_card` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `occupation` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `contact_person` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `contact_person_phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact_person_cellphone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `birthday`, `gender`, `phone`, `cellphone`, `address`, `identity_card`, `occupation`, `contact_person`, `contact_person_phone`, `contact_person_cellphone`, `username`, `password`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Franco Jesus', 'Mamani Pozo', 'administrador@gmail.com', '1990-05-31', 'varon', '', '76137653', 'Hugo Bohero Street', '7275047 OR', 'Web Developer', 'Maria Cristina Pozo Adia', '7276789', '7878976', 'administrador', '$2y$10$fUiburY3LyLuh9SVdO89kO7LgJjLnkDkTHTurFhJWBBviY9.SfXd6', 'r2I1g144hniSlX54Q1TTAT4uTudEuAc0Ma8g8ajR1hx8Z5tgY3UnHwug05WR', '2017-08-08 14:01:43', '2018-08-04 17:18:52', NULL),
(2, 'Milenka Lorna', 'Mercado Morales', 'milenka_mercado@hotmail.com', '1968-07-06', 'mujer', '', '72473030', 'Pisagua 1015', '3104691-OR', 'Licenciada en Idiomas', '', '', '', 'milenka.mercado', '$2y$10$VQlz8X3z/44Nx1oeNOppbeHCMgtJ8L.3ASgr1kujEIk42CrwPnhLy', '2is2n7Gi8IRppuIF0p2cf811AGtiJS1gwBhcMtazw2HtoyxtMpQ236rF0NLN', '2018-03-24 16:06:17', '2018-08-04 17:21:19', NULL),
(3, 'Nashira Belen', 'Bascon Flores', 'nashira.12354@gmail.com', '1988-07-28', 'mujer', '', '72332671', 'Arica N.1600 Y Santa Barbara', '72332671-OR', 'Universitario', 'Alison Bascon Flores', '', '72309914', 'nashira.bascon', '$2y$10$xVnU4hxUhCY70Tyif44vKOeh/jMEAStg9EBg0zl7vtIVHk0suIpmm', 'UJhlBofUKGvia8inWIhKwJp1FqSD5zbIIc2A4H109VyarmtQZtAbMqtdp33b', '2018-03-24 16:15:25', '2018-05-25 03:39:15', NULL),
(4, 'Dayana Yessica', 'Mercado Rodriguez', '', '1993-04-01', 'mujer', '', '75420838', 'Leon N. 414 Potosi y 6 de Octubre', '7404062-OR', 'Secretaria Ejecutiva', '', '', '', 'dayana.mercado', '$2y$10$dAp65Jf2zjW2l25RsaUVJOXobHaYG9Cx63qA5RzBoDvoW9nAd0hni', 'UY1KA7ULTPWBnmNKF77c31PWvySXBLmVNVBBvgGeczwnvFhztFygXJ5YGh9U', '2018-03-24 16:28:28', '2018-03-24 18:05:51', NULL),
(5, 'ROBERT DAVID', 'MILLIE', '', '1969-06-19', 'varon', '', '60319684', 'BOLIVAR', '534793002- IN', 'DOCENTE', '', '', '', 'robert.millie', '$2y$10$EG3.NH1O4J8Mg6yE7IixK..UcwcTRFgr60ocfs8qp1U9Nnc3hbBEW', NULL, '2018-03-24 16:40:46', '2018-03-24 16:42:47', NULL),
(6, 'VLADIMIR', 'CAYOJA CHURA', '', '1995-12-01', 'varon', '52-55691', '69576958', 'AV. ESPAÑA # 7236 Y SORIA GALVARRO', '7404783-OR', 'UNIVERSITARIO', 'MAMA', '', '71108803-71847122', 'VLADIMIR.CAYOJA', '$2y$10$IlV5ESs5k6Frkm4dl4qA6.q02QMQQB.9T8GfvQw8ZdLvcK08Pmw7G', NULL, '2018-03-24 16:55:15', '2018-07-14 04:05:57', NULL),
(7, 'IVAN', 'VIGABRIEL ARANCIBIA', NULL, '1986-10-11', 'varon', '52-45510', '72375602', 'AV.TACNA S/N \"E\" Y CAMPO JORDAN', 'undefined-undef', 'ESTUDIANTE', 'IVAN VIGABRIEL ARANCIBIA', NULL, NULL, 'ivan.vigabriel', '$2y$10$AKXr0ZosvW7mbVU4wHbPVevCvdymem6aR1unyNSFY.hXMfPmbiOLe', NULL, '2018-07-11 17:39:04', '2018-07-11 17:39:04', NULL),
(8, 'AMILCAR JAIME', 'ROCHA ROCHA', 'amilcarrocha@hotmail.com', '1993-07-05', 'varon', '52-12508', '76130491', 'wasington belzu # 325', '123456789-OR', 'UNIVERSITARIO', 'ABUELA', '52-12508', '76139570', 'amilcar.rocha', '$2y$10$N9Fq/QPxqUKzBsx86KSOnepVrUaVO8VHHW62RIAHKPlzlG4bAffe6', NULL, '2018-07-11 18:04:19', '2018-07-12 19:21:42', NULL),
(9, 'ROCIO', 'FLORES COSSIO', 'rocio.cossio31@hotmail.com', '1988-08-31', 'mujer', '52-76378', '70424058', 'PAGADOR # 941 MONTESINOS', 'undefined-undef', 'PROFESIONAL', 'JOSE ORTUÑO', NULL, '61834241', 'rocio.flores', '$2y$10$y.quAfPYfSpKNEQ.xjUKqODhzIzF1eavcZyBUSkTKLu9Wp6Kn/TVW', NULL, '2018-07-11 18:09:35', '2018-07-11 18:09:35', NULL),
(10, 'JULIA ALEJANDRA', 'GONZALES CHAVEZ', 'alezsam92@gmail.com', '1996-05-02', 'mujer', '52-81821', '76133828', 'jaen # 830 iquique pisagua', 'undefined-undef', 'UNIVERSITARIA', 'JULIA MARGARITA CHAVEZ R.', NULL, '65494992', 'julia.gonzales', '$2y$10$A42.dmJiPfqg3rbLsQ0zyuEDs9O8.qa3vUdesvbKvBvEi2vFi7R4a', NULL, '2018-07-11 18:18:57', '2018-07-11 18:18:57', NULL),
(11, 'MAILYN ESTHER', 'MOLLO FLORES', 'mailynmolloflores@hotmail.com', '1998-08-27', 'mujer', '52-47778', '69604363', 'CAMPO JORDAN # 9', 'undefined-undef', 'ESTUDIANTE', 'ZENOVIA FLORES', NULL, '68335053', 'mailyn.mollo', '$2y$10$tYE6jpiolVdZHecrijDJlu7vaNxPSJ5oA92PlqcmEg9Y2cLu4/Uni', NULL, '2018-07-11 18:24:59', '2018-07-11 18:24:59', NULL),
(12, 'DAVEYBA INGRID', 'DELGADO CALLE', 'ingridaveyba@hotmail', '1993-08-21', 'mujer', '52-42696', '63638653', 'URB.LA AURORA', 'undefined-undef', 'UNIVERSITARIA', 'MAXIMA CALLE', '', '72310335', 'daveyba.delgado', '$2y$10$Heg0quaclvKsalX3RJZJUO8L9/03KLC23xX.Rbix/ul3rdFH9g19K', NULL, '2018-07-11 18:30:10', '2018-07-11 18:30:10', NULL),
(13, 'JUAN PABLO', 'CHAMBI COCA', 'jampol@hotmail.com', '1995-07-29', 'varon', '52-72077', '65410169', '12 DE OCTUBRE Y CATACORA', 'undefined-undef', 'UNIVERSITARIO', 'PABLO CHAMBI', NULL, '79404708', 'juan.chambi', '$2y$10$6ZAiG8OFkci2upsUYSgzfO9LV/JXqDLsN7mrujbjxd/TvbNUoeNIC', NULL, '2018-07-11 18:33:54', '2018-07-11 18:33:54', NULL),
(14, 'ALISSON ALEJANDRA', 'PACO VELASQUEZ', 'pacoalisson.98@gmail.com', '1998-10-27', 'mujer', '52-45253', '65408895', 'TENIENTE VILLA Y 6 DE OCTUBRE', 'undefined-undef', 'UNIVERSITARIA', 'WILSON PACO', NULL, '71858855', 'alisson.paco', '$2y$10$2TtaPW4dm7/HuaIOWFDZKOeyuwv8/VghXZft6PJw48RWfo31chyp2', NULL, '2018-07-11 18:38:01', '2018-07-11 18:38:01', NULL),
(15, 'PAOLA SANDIBEL', 'LUNA BLANCO', 'paolas.lbll@gmail.com', '1994-07-11', 'mujer', '52-42404', '69596523', 'URB. SIERRAMIER', 'undefined-undef', 'UNIVERSITARIA', 'SANDALIO LUNA', '', '65405466', 'paola.luna', '$2y$10$OajHCPnfEMN8fsSwLowKv.eGRMpbSH9/ficA8O.dLcSOR3bwYQ7mK', NULL, '2018-07-11 18:45:12', '2018-07-11 18:45:12', NULL),
(16, 'MAURICIO GONZALO', 'ALIENDRE PEREZ', 'galiendre@hotmail.com', '1997-01-05', 'varon', '52-50864', '60408425', 'SUCRE # 1089 Y PETOT', 'undefined-undef', 'UNIVERSITARIO', 'KEVIN ALIENDRE', NULL, '79411557', 'mauricio.aliendre', '$2y$10$sfat76LZ5P7Nt2eeB6P0DuXpmHoufcNqNghJryh2EeLtzy3IQJWdO', NULL, '2018-07-11 18:48:24', '2018-07-11 18:48:24', NULL),
(17, 'ANGELA NAHIR', 'TINTARES CHOQUE', 'nahir9919@gmail.com', '1995-01-23', 'mujer', '52-55949', '69583487', 'JAEN # 756 ARICA IQUIQUE', 'undefined-undef', 'PROFESIONAL', 'AUREA CHOQUE', NULL, '79412748', 'angela.tintares', '$2y$10$tzJd0oHjzBqCV7ns7eOU9umVvqisTp1Keq1SWrgoK0Gqw66gEix7G', NULL, '2018-07-11 18:52:06', '2018-07-11 18:52:06', NULL),
(18, 'DIEGO OLIVER', 'MAMANI CRUZ', NULL, '1998-06-15', 'varon', NULL, '69503231', 'TENIENTE LEON AV. AL MAESTRO', 'undefined-undef', 'universitario', 'PAPA', NULL, '73835112', 'diego.mamani', '$2y$10$v4qMvD8JmNQ7VdvEiBkUvu9L3t6lwiI4EC/WFzWuuWj/RJDIckxHC', NULL, '2018-07-11 18:56:11', '2018-07-11 18:56:11', NULL),
(19, 'TATIANA ELIZABETH', 'TOCO', NULL, '1989-06-21', 'mujer', '52-59705', '72483175', 'HERRERA ENTRE TACNA Y ARCE', 'undefined-undef', 'PROFESIONAL', 'MONICA CAMACHO', '52-59705', '72476840', 'tatiana.toco', '$2y$10$nKD/y7psitpXbLlNYjkceuu6DQk4sVOcMmA5rcOLpY8incdoTs4R.', NULL, '2018-07-11 19:01:30', '2018-07-11 19:01:30', NULL),
(20, 'MARCO ANTONIO', 'MAMANI MAMANI', 'molinosmundial@gmail', '1980-09-27', 'varon', NULL, '73814406', 'AV. VILLARROEL ESQ. BALLON', 'undefined-undef', 'OTRO', 'JAVIER ALCON', NULL, '76130882', 'marco.mamani', '$2y$10$YdWSRT3u2.olouF0PnSgVeBv.Nc.22StANp4VEfkeTosTBkHhyUdS', NULL, '2018-07-11 19:06:12', '2018-07-11 19:06:12', NULL),
(21, 'WILSON JORGE', 'SANCHEZ SALGADO', NULL, '1970-04-05', 'varon', NULL, '76153884', 'MONTECINOS PASAJE IQUIQUE', 'undefined-undef', 'PROFESIONAL', 'ANABEL ESCOBAR', NULL, '76153884', 'wilson.sanchez', '$2y$10$v5T1mo8oxa7hxPkX0ZA4K.vvG5ngUf0g4.OuFGlgly1HbFpWVFN0K', NULL, '2018-07-11 19:09:25', '2018-07-11 19:09:25', NULL),
(22, 'ELIANA', 'CHOQUE LEON', NULL, '1995-02-06', 'mujer', '52-60451', '77471924', 'AV.DEHENE Y 12 DE OCTUBRE', 'undefined-undef', 'UNIVERSITARIA', 'BETTY LEON', NULL, '74148507', 'eliana.choque', '$2y$10$GYiOj6ZlTJESwvZfWtzO2edcX.nxELaQUoV42cSPN3E6tLAfqBeHO', NULL, '2018-07-11 19:13:20', '2018-07-11 19:13:20', NULL),
(23, 'CLAUDIA MILAGROS', 'ALCON ROCHA', 'yunsu1990@hotmail.com', '1990-04-15', 'mujer', '52-75668', '60415652', 'PAGADOR # 6771 ARCE Y STA. BARBARA', 'undefined-undef', 'PROFESIONAL', 'WALTER NICOLAS ALCON', '', '79410896', 'claudia.alcon', '$2y$10$Y5.rRbUzGX5YpAJpS4Vz/.YevU5EaxIsNnu1roaAMw9P5sfwhcMf.', NULL, '2018-07-11 19:17:02', '2018-07-11 19:17:02', NULL),
(24, 'JESUS ALEJANDRO', 'LARREA MIRANDA', NULL, '2000-06-03', 'varon', '52-12187', '78611200', 'TACNA # 1355 AYACUCHO Y JUNIN', 'undefined-undef', 'UNIVERSITARIO', 'ZAIDA MIRANDA SILES', NULL, '71851329', 'jesus.larrea', '$2y$10$iKiFUho1Iq7jwdGscwAFC.V3hLcHrFK3sZbFUhz81sqRabW7GVnQy', NULL, '2018-07-11 23:26:40', '2018-07-11 23:26:40', NULL),
(25, 'YUVER AMILCAR', 'CRUZ MAMANI', NULL, '1990-04-17', 'varon', NULL, '61815437', 'VILLA FATIMA ENTRE 1º DE NOVIEMBRE Y 1º DE MAYO', 'undefined-undef', 'PROFESIONAL', 'JUAN CRUZ NUÑEZ', NULL, '69586665', 'yuver.cruz', '$2y$10$UqiU62igMzVBGK2/zuZpaOoIGWEzkRME2XF5zBkiOmM3cQ2zwI6kC', NULL, '2018-07-11 23:29:43', '2018-07-21 16:24:24', NULL),
(26, 'RENE BRAYAN', 'ARUQUIPA LOPEZ', NULL, '1991-07-28', 'varon', NULL, '72490909', 'AV. AL VALLE CALLE 7', 'undefined-undef', 'UNIVERSITARIO', 'MARCELA', NULL, '72347378', 'rene.aruquipa', '$2y$10$ajGUsBv0tOtT3fJjX7b3OekDK9rSL475WlDCbevk8X0rnB/dQcpIe', NULL, '2018-07-11 23:34:15', '2018-07-11 23:34:15', NULL),
(27, 'GERALDINE FABIOLA', 'ALCANTARA TRONCOSO', 'gerxlpika@gmail.com', '1997-01-27', 'mujer', '52-62131', '61665551', 'SALAMANCA # 260 ESPAÑA Y TOMAS FRIAS', 'undefined-undef', 'UNIVERSITARIA', 'ISIDORO ALCANTARA', NULL, '72300421', 'geraldine.alcantara', '$2y$10$nIwlBmkapfWsyYZ9mwjT8uK9k/suWLc76B/SCq6pQ.1Kuu.CjQgCe', NULL, '2018-07-11 23:39:11', '2018-07-11 23:39:11', NULL),
(28, 'ANGELICA JESSICA', 'LAIME AYLLON', NULL, '1999-10-18', 'mujer', NULL, '64598373', 'PASAJE PERALTA SORUCO', 'undefined-undef', 'OTRO', 'ALFREDO LAIME', NULL, '72390814', 'angelica.laime', '$2y$10$YBOuNvsshiKlE3wQMvElWe/QUupCC4WpCJ8pgTJf/dDxUrFzRSUwq', NULL, '2018-07-11 23:59:50', '2018-07-11 23:59:50', NULL),
(29, 'KAREM WANDA', 'GARCIA SOLIZ', NULL, '1999-11-13', 'mujer', '52-33904', '75704516', 'AV. HEROES DEL CHACO Y RAFAEL PABON', 'undefined-undef', 'UNIVERSITARIA', 'JANNET SOLIZ AMAYA', NULL, '69570720', 'karem.garcia', '$2y$10$cc8drCOfwRINvQg6NSVcGO9EIIvmV2z5QeAeUO0q3BgnlEJTcIdFm', NULL, '2018-07-12 00:07:10', '2018-07-12 00:07:10', NULL),
(30, 'MARIANGELA', 'CARTAGENA OQUENDO', 'mariangelcartagenaoquendo@gmail.com', '1991-09-20', 'mujer', '52-86050', '65440119', 'ARCE ENTRE BACOVICK Y BRAZIL', 'undefined-undef', 'PROFESIONAL', 'BLANCA OQUENDO', NULL, '70414212', 'mariangela.cartagena', '$2y$10$lYi3AKVkk9aFPR7JDR0XueRUGUbscn9g6n7zqQN/kHUyMVHLcAcwy', NULL, '2018-07-12 00:11:21', '2018-07-12 00:11:21', NULL),
(31, 'JOSSELIN LETICIA', 'RODRIGUEZ CHUGAR', 'leticia.727@hotmail.com', '1993-02-14', 'mujer', '52-87500', '75427983', 'PAGADOR # 6062 BOLIVAR Y ADOLFO MIER', 'undefined-undef', 'UNIVERSITARIA', 'JUAN A. RODRIGUEZ', '52-78430', '71100845', 'josselin.rodriguez', '$2y$10$OjLgBPeaBZpQe1ncpKHMdOwSzCEr/CTb/3IuN2dJ2upe2ME6BCAc2', NULL, '2018-07-12 00:15:21', '2018-07-12 00:15:21', NULL),
(32, 'GIOVANA', 'MAMANI PEREZ', 'g.mamaniperez@hotmail.com', '1993-02-23', 'mujer', NULL, '67245970', 'AV. GENOVEVA RIOS ENTRE JUAN MINOR', 'undefined-undef', 'PROFESIONAL', 'BASILIA MAMANI', NULL, '60412218', 'giovana.mamani', '$2y$10$3BK4GFfePOJf2VAWJEo9IOMZjzlMUXqibEwAIjb2udRiInru2.OD.', NULL, '2018-07-12 00:21:04', '2018-07-12 00:21:04', NULL),
(33, 'JUANA', 'COLQUE CHOQUE', NULL, '1988-05-27', 'mujer', '52-61331', '73847024', '12 DE OCTUBRE 1º DE MAYO E ILLAMPU', 'undefined-undef', 'UNIVERSITARIA', 'MAGDALENA', NULL, '71889342', 'juana.colque', '$2y$10$EGtlTrzLDC6JqOy5ampyKONkIuXFGjn1jm/lqaiEMxDf.t3bXTfLi', NULL, '2018-07-12 00:25:03', '2018-07-12 00:25:03', NULL),
(34, 'STEFANI ESCARLETH', 'MOLLO MOLLO', 'escarletmollo@gmail.com', '2000-01-17', 'mujer', '52-12181', '60409808', 'ALDANA Y PERALTA SORUCO # 81', 'undefined-undef', 'UNIVERSITARIA', 'VILLMA MOLLO', NULL, '60405142', 'stefani.mollo', '$2y$10$21QZbTn3jdzqDsKsaH36keopIih7iwUDsBtCRWCHcNs9w1HMOYQJG', NULL, '2018-07-12 00:36:04', '2018-07-12 00:36:04', NULL),
(35, 'JAVIER', 'ALCON COLQUEHUANCA', 'jalcon1278@gmail.com', '1978-12-14', 'varon', '52-15049', '76130882', 'URB.PEDRO FERRARI', 'undefined-undef', 'OTRO', 'YOLANDA CHUCAMANI', NULL, '72464554', 'javier.alcon', '$2y$10$vobD2UZpCuEMMVDzfQ/16OqsSEHcIgjXF3pTFDtOtx4DuFRHT2vx2', NULL, '2018-07-12 00:39:47', '2018-07-12 01:07:09', NULL),
(36, 'YOLANDA', 'CHUCAMANI CHIRI', NULL, '1977-05-11', 'mujer', '52-15049', '72464554', 'URB. PEDRO FERRARI', 'undefined-undef', 'PROFESIONAL', 'JAVIER ALCON', NULL, '76130882', 'yolanda.chucamani', '$2y$10$fjAomYbIClWAWS.sIEVfw.2433pS5XAndVOPJQYKSImWjQLEEYMdO', NULL, '2018-07-12 00:43:53', '2018-07-12 00:43:53', NULL),
(37, 'BETZA ROMARIA', 'HERRERA MACHICADO', NULL, '1999-04-05', 'mujer', NULL, '63636741', 'URB. LA COLONIA', 'undefined-undef', 'UNIVERSITARIA', 'ESPERANZA MACHICADO', NULL, '72325201', 'betza.herrera', '$2y$10$IoFIKXSMEUTZwhnRyJpVF.xfwzF.2b.G7jD7b9bbXKcWyVbLS8yTO', NULL, '2018-07-12 01:00:57', '2018-07-12 01:00:57', NULL),
(38, 'NIKSA ROSSANA', 'RODRÍGUEZ KRAVAROVIC', NULL, '1974-06-10', 'mujer', '52-79658', '72453143', 'ADOLFO MIER # 320 ESQ. BRAZIL', 'undefined-undef', 'DOCENTE', 'NIKSA', '52-79658', '72453143', 'niksa.rodriguez', '$2y$10$Z8tZG61o1EmoX.TKWrDnUOO2frM01paUPXGIYgHO0SPtkVnGNm92e', NULL, '2018-07-12 01:29:05', '2018-07-12 01:29:05', NULL),
(39, 'SINTHIA JASMIN', 'LEMUS LUNA', 'jasmin_lemus@hotmail.com', '1988-04-13', 'mujer', '52-47520', '72479662', 'CALLE MENACHO # 181 ENTRE TENIENTE LEON Y FORTIN BOQUERON', 'undefined-undef', 'DOCENTE', 'SINTHIA', '52-47520', NULL, 'sinthia.lemus', '$2y$10$TlXFkQMp2LyqhbQ85qZqTenxLaQlDUElaWPO8J8y93JD8ULG/ot5S', NULL, '2018-07-12 01:35:38', '2018-07-12 01:35:38', NULL),
(40, 'CUELLAR ENRIQUEZ', 'NOELIA CAROLINA', 'vaquita_linda33@hotmail.com', '1984-03-03', 'mujer', '52-54891', '70431728', 'calle 1º de noviembre 626 y la paz', 'undefined-undef', 'DOCENTE', 'NOELIA', '52-54891', '70431728', 'noelia.cuellar', '$2y$10$pnGadjreHkHNXp1ClDGglu0uZijGIHF4UoDkhm5lYPtlIc20hwu5O', NULL, '2018-07-12 01:39:36', '2018-07-12 01:39:36', NULL),
(41, 'MONICA DOLLY', 'MOLINA MOLINA DE CHAVARRIA', 'monidolly@hotmail.com', '1976-10-09', 'mujer', '52-79760', '72479878', 'RODRIGUEZ ENTRE 6 DE OCTUBRE Y LA PAZ', 'undefined-undef', 'DOCENTE', 'MONICA', '52-79760', '72479878', 'monica.molina', '$2y$10$rE4/ux/uTkjbGgFJ5PZdDu/DVXFefr//gs.Km15XzGCw/LnBEWIK6', NULL, '2018-07-12 01:43:25', '2018-07-12 01:43:25', NULL),
(42, 'GALIA LIZ', 'FLORES SANTOS', 'lizgal55@hotmail.com', '1986-11-12', 'mujer', '52-60883', '78619616', 'CALLE ILLAMPU # 404 VILLAZON Y VICUÑA', 'undefined-undef', 'DOCENTE', 'GALIA', '52-60883', '78619616', 'galia.flores', '$2y$10$ITKLYk6SuiHxCEkQVkwPDOWrDuHtznM2zatBeMwMQfi5dOLpNiira', NULL, '2018-07-12 01:52:09', '2018-07-12 01:52:09', NULL),
(43, 'PAOLA TERESA', 'CALANI NOYA', 'thebest_paito@hotmail.com', '1992-10-01', 'mujer', '52-80687', '78613535', 'calle tarija # 360 esq. 12 de octubre', 'undefined-undef', 'DOCENTE', 'PAOLA', '52-80687', '78613535', 'paola.calani', '$2y$10$8zeBiMbRKfUS8DaMj7ivweav.mErr5D0DCxS35mUkE5Cs4PhA0snK', NULL, '2018-07-12 01:58:46', '2018-07-12 01:58:46', NULL),
(44, 'IGOR MIRKO LOAYZA CADIMA', 'LOAYZA CADIMA', 'igui_lo@hotmail.com', '1975-11-09', 'varon', '52-77012', '70420049', '1º de noviembre # 550 entre la paz y 6 de octubre', 'undefined-undef', 'DOCENTE', 'IGOR', '52-77012', '70420049', 'igor.loayza', '$2y$10$stVyTQ1Fro78k2mx6Nk.R.X7ibOAB9kagl6m.w3AoMu5WBlfi/r2u', NULL, '2018-07-12 02:02:12', '2018-07-12 02:02:12', NULL),
(45, 'RODRIGO ADRIÁN', 'CEREZO ELÍAS', 'rodri.cerezo@hotmail.com', '1991-12-25', 'varon', '', '67226408', 'PAGADOR ENTRE SOTO MAYOR Y SANTA CRUZ # 4450', 'undefined-undef', 'DOCENTE', 'RODRIGO', NULL, '67226408', 'rodrigo.cerezo', '$2y$10$zYnVab2vN8A8Ambav9EnHewZt4DMUOR.2BW0.RdMbT0JCw0pv4Y..', NULL, '2018-07-12 02:05:55', '2018-07-12 02:05:55', NULL),
(46, 'CLAUDIA CARMIÑA', 'MANCILLA MORALES', 'clauditamancilla@gmail.com', '1976-09-05', 'mujer', NULL, '70427211', 'BRAZIL # 1554 BOLIVAR Y ADOLFO MIER', 'undefined-undef', 'DOCENTE', 'CLAUDIA', NULL, '70427211', 'claudia.mancilla', '$2y$10$TvtzhB.tmm72GJePzXTsMeNu4WgAGuTU/3v6EtRGgtmf0U0G6mEZu', NULL, '2018-07-12 02:13:45', '2018-07-12 02:21:16', NULL),
(47, 'CAROL DIANA', 'SALINAS DE UGARTE', 'salinasdeugarte@hotmail.es', '1986-12-08', 'mujer', '52-76853', '69600896', 'sucre brazil # 267', '5764442-OR', 'DOCENTE', 'DIANA', '52-76853', '69600896', 'carol.salinas', '$2y$10$PT.HZJ12zfBLxFlP8LiWg.aAtKJ8fFrCOFTs.FTr3w/0.ESRc55Pa', 'DVRQPgNz7EKISS7d9qlq2Bg3XtEXqZOcLQaXQinBbIRkHMWtpIdPjJY5cciZ', '2018-07-12 02:25:26', '2018-07-28 19:21:29', NULL),
(48, 'ROSAURA', 'CHAMBI VASQUEZ', 'rchvasquez@yahoo.com', '1964-08-31', 'mujer', '52-74192', '73846487', 'TOMAS FRIAS # 361 PAGADOR Y VELASCO', 'undefined-undef', 'DOCENTE', 'ROSAURA', '52-74192', '73846487', 'rosaura.chambi', '$2y$10$Y899ZN3HwOBMzINOb1jgFuKI99Lt9pRv7ZzqQUv6bpsl.p18c16dS', NULL, '2018-07-12 02:36:09', '2018-07-12 02:36:09', NULL),
(49, 'CYNTIA LILIANA', 'BEJARANO RIVERA', 'cyntia_bejarano@yahoo.es', '1982-02-05', 'mujer', '52-52007', '72455309', 'ADOLFO MIER # 998 Y CAMACHO', 'undefined-undef', 'DOCENTE', 'CYNTIA', '52-52007', '72455309', 'cyntia.bejarano', '$2y$10$xotmAouwNZC52yCVlIoPMueElH4.aX/YVc7lOXd5M2nOTyyU5F1xG', NULL, '2018-07-12 02:50:40', '2018-07-12 02:50:40', NULL),
(50, 'LUIS ALBERTO', 'HUARACHI MAMANI', 'luishuarachi@hotmail.co.uk', '1976-01-18', 'varon', '52-44876', '75713932', 'AV. AL VALLE CALLE 1', 'undefined-undef', 'OTRO', 'ALBINO HUARACHI', '52-44876', NULL, 'luis.huarachi', '$2y$10$9MAYjRbhLX7MGj49lcxNSOJu8hJ2y/fRz5xNunmYxnzhRWBJDHoWW', NULL, '2018-07-12 16:27:14', '2018-07-12 16:27:14', NULL),
(51, 'FERNANDO MILAN', 'LIZARAZU ALDAPIZ', NULL, '1997-05-03', 'varon', '52-83080', '70411892', 'CALLE POTOSI # 5168 LEON Y RODRIGUEZ', 'undefined-undef', 'UNIVERSITARIO', 'CAROLINA ALDAPIZ', NULL, '72455045', 'fernando.lizarazu', '$2y$10$4N95LdSj338Qn.EMwce5TeqjBeI4SVGqvlI4YjxM1.0UMUR5fJqqq', NULL, '2018-07-12 16:33:34', '2018-07-12 16:33:34', NULL),
(52, 'KARLA PATRICIA', 'CALLIZAYA MAMANI', NULL, '1996-05-08', 'mujer', NULL, '65437733', 'ALTO CARACOLLO CALLE TARIJA Y SOLEDAD', 'undefined-undef', 'UNIVERSITARIA', 'ANTONIA MAMANI', NULL, '76130664', 'karla.callizaya', '$2y$10$TfVbCJzdU0D/fVSD59Dxtu/dp5Qi9FIwSnxX/bmXTto8uFCW4vWf.', NULL, '2018-07-12 16:42:39', '2018-07-12 16:42:39', NULL),
(53, 'JONATHAN RODRIGO', 'MAMANI CONTRERAS', NULL, '1996-12-07', 'varon', '52-43663', '61663308', 'URB. SAN LUIS M. 4 L. 30', 'undefined-undef', 'OTRO', 'HILDA CONTRERAS PINTO', NULL, '72326264', 'jonathan.mamani', '$2y$10$oCy20O.LOYOSifbz1G9O6uwRFNRVhhN9k5dyrc.lVfNWG1B0XpQQq', NULL, '2018-07-12 16:46:25', '2018-07-12 16:46:25', NULL),
(54, 'WENDY', 'AGUILAR CHOQUE', 'wendyaguilar1995@hotmail.com', '1995-11-14', 'mujer', '', '77154311', 'SANTA BARBARA TACNA Y ARICA', 'undefined-undef', 'UNIVERSITARIA', 'WENDY', NULL, '77154311', 'wendy.aguilar', '$2y$10$vQHdjRes6.PjYjGYqQBRduUwn3cspwNJib5WzT0Qs1VJeiSR.xVMK', NULL, '2018-07-12 16:53:28', '2018-07-12 16:53:28', NULL),
(55, 'JHADIN RICARDO', 'FLORES AGUIRRE', NULL, '1998-04-23', 'varon', '52-50706', '73804678', 'HUAJARA 2 M. 13 # 3', 'undefined-undef', 'UNIVERSITARIO', 'ESTHER AGUIRRE', NULL, '73804678', 'jhadin.flores', '$2y$10$cJLJnwosOdR/Dscrose6KeCud4yruQMUUzlfJHaMgdR29mcAZRKua', NULL, '2018-07-12 16:57:37', '2018-07-12 16:57:37', NULL),
(56, 'example', 'example', 'example@gmail.com', '1987-02-01', 'varon', '52-87555', '123456', 'example', 'undefined-undef', 'example', 'example', 'example', NULL, 'example', '$2y$10$ztCUAU26rimhHsQFa0b6Ku5oqUpI8qZ2rxpDy8I40Z2TcccZodz4O', NULL, '2018-07-12 17:00:59', '2018-07-12 17:00:59', NULL),
(57, 'nuevo', 'nuevo', 'nuevo@gmail.com', '1974-02-02', 'varon', '123456', '123456789', 'nuevo', 'undefined-undef', 'asdfasdf', 'asdfasdf', 'asdf', NULL, 'nuevo', '$2y$10$L8sWpLsu49jIU156U7nBluSQssy2bQgFc78uN55fAlQCyx0tFsaCW', NULL, '2018-07-12 17:23:44', '2018-07-12 17:23:44', NULL),
(58, 'JEANETTE RAQUEL', 'VILLCA IZQUIERDO', NULL, '1999-04-04', 'mujer', NULL, '76144765', 'TARIJA VICUÑA # 615', 'undefined-undef', 'OTRO', 'BETTY IZQUIERDO CHAMBI', NULL, '73818797', 'jeanette.villca', '$2y$10$g/OPDXbybctIL9l/WXw3CevJIFADZkN0urLlN1F8WFoVZVFdIxPte', NULL, '2018-07-12 17:29:22', '2018-07-12 17:29:22', NULL),
(59, 'hlkjashdflkjh', 'lkjhasdlfkjh', 'lashdlakjsdf@gmail.com', '1984-02-02', 'varon', '769876987689', '1234564', 'expedition.acronym', 'undefined-undef', 'hasdfhasdlkfjh', 'kasjgfkhkjadshfkjh', 'jhgsakdjfgasdh', 'kjghaskdjgh', 'nuevokalsjdhflkj', '$2y$10$0m78H3AYkkRETGjGqWN4PeT6zAC.V7KfWhu8VUkO0Fk75LgN8HxEG', NULL, '2018-07-12 17:32:35', '2018-07-12 17:32:35', NULL),
(60, 'SERGIO LUIS', 'CARITAS CHOQUE', 'sergiocaritas001@gmail.com', '1985-06-27', 'varon', '52-61797', '73838383', 'ILLAMPU # 183 Y ESPAÑA', 'undefined-undef', 'UNIVERSITARIO', 'ROSA CHOQUE', NULL, '72329900', 'sergio.caritas', '$2y$10$XnfXbxDce6RclfZdfdYoKuyXrpnbmFSRIxj5FY0B1IshA8NB5AKY.', NULL, '2018-07-12 17:36:58', '2018-07-12 17:36:58', NULL),
(61, 'tres', 'tres', 'tres@gmail.com', '2016-03-03', 'mujer', '980709870987', '69689876', 'tres', '769876987-undef', '769876897', '9876987', '698769', '876987', 'tres', '$2y$10$IuBHoHgZWYQJZz1kjXfiXuYa/8yJdVDNIu1bXfPqS1AwV/HGGwMD.', NULL, '2018-07-12 17:37:44', '2018-07-12 17:37:44', NULL),
(62, 'CARLA MARIA', 'CABRERA QUISPE', NULL, '1999-01-16', 'mujer', NULL, '60424404', 'SANTA ANA 2', 'undefined-undef', 'UNIVERSITARIA', 'CARLA', NULL, '60424404', 'carla.cabrera', '$2y$10$Zn2mFukx/6ebswx0dkJXi.DyHbrMRuT1089qZhDlX98bzUQrCr9aC', NULL, '2018-07-12 17:41:00', '2018-07-12 17:41:00', NULL),
(63, 'cinco', 'cinco', 'cinco@gmai.com', '2017-05-02', 'varon', '76908', '70987', '09870987', '09870987-undefi', 'cinco', 'cinco', 'cinco', 'cinco', 'cinco', '$2y$10$gRbt/U5kW.0AiT0YjwTwf.qoP7fa1ZEl8YIesxJAIVgH89qYkiH9i', NULL, '2018-07-12 17:42:43', '2018-07-12 17:42:43', NULL),
(64, 'seis', 'seis', 'seis@gmail.com', '2017-03-04', 'mujer', '7869876', 'seis', 'seis', '123132-undefine', 'seis', 'seis', NULL, NULL, 'seis', '$2y$10$u2PsNDbIjVjXjrFY5Yfknu4YiZAvNVhCavj4mUWOnBmBenO/hsVAq', NULL, '2018-07-12 17:44:13', '2018-07-12 17:44:13', NULL),
(65, 'siete', 'siete', 'siete@gmail.com', '1990-06-03', 'varon', '123321', 'siete', '132', '132123-undefine', 'asdfasdf', 'asdfas', 'asdf', 'asf', 'siete', '$2y$10$WT6TaXuHs9EZrqiVI.CwOe4yha6hMrK2xrt01.eNu4.rzGCrign1G', NULL, '2018-07-12 17:47:14', '2018-07-12 17:47:14', NULL),
(66, 'DANITZA NORMA', 'HUANCA GUAYGUA', 'danitza_hg@hotmail.com', '1978-01-12', 'mujer', '52-60632', '72312958', 'AMERICA ENTRE CIRCUNVALACION Y CALLE A', 'undefined-undef', 'PROFESIONAL', 'LIZETH HUANCA GUAYGUA', '52-60632', NULL, 'danitza.huanca', '$2y$10$/8BQPSGLoxGwjvLxzDcSXe2dhhbXiidq8dly3ibxRVahr.BpD2EKa', NULL, '2018-07-12 17:47:37', '2018-07-12 17:47:37', NULL),
(67, 'ocho', 'ocho', 'ocho@gmail.com', '2017-02-02', 'varon', '708970987', '087098', '709870987', '09870987-undefi', 'asdfg', 'kjghaksjgfk', 'hkjadshfkjh', NULL, 'ocho', '$2y$10$65hJJT/QaAVAgnsIqtLP0.RnVrPa62v7hxjbFRhlyHe4RFaJ0OtLi', NULL, '2018-07-12 17:48:27', '2018-07-12 17:48:27', NULL),
(68, 'nueve', 'nueve', 'nueve@gmail.com', '2015-04-04', 'mujer', '87987', '70987908', '70987', '09870987-undefi', 'asjdghkj', 'ghjkadsf', 'h', NULL, 'nueve', '$2y$10$klgXv9SqeQzWjsHcHiu7K.EZIBeruXAYAYH43cR6SvkwXpyMUg22m', NULL, '2018-07-12 17:51:25', '2018-07-12 17:51:25', NULL),
(69, 'diez', 'diez', 'diez@gmail.com', '2016-02-02', 'varon', '8700987980', '8709', '870987', '9087-undefined', '70987098', '98709870', '9087', '09870', 'diez', '$2y$10$3kXjfmHuBQc2IcdlyiYHXuC3a3cg3J1wf9PhieLQfg44pO/AkZKHO', NULL, '2018-07-12 17:52:01', '2018-07-12 17:52:01', NULL),
(70, 'ADHEMAR GUSTAVO', 'REQUENA PEREZ', 'adgurepe@gmail.com', '1996-10-01', 'varon', '52-11045', '72487509', 'DIEGO DE OJEDA # 3 Y H. DE LA INDEPENDENCIA', 'undefined-undef', 'UNIVERSITARIO', 'NORAH PEREZ ROMERO', NULL, '72479336', 'adhemar.requena', '$2y$10$yZI8JwrgJmLlMZIiT3zT7.ye9I3GqdXHHWGf6ZQUty9ZOnPzPClNq', NULL, '2018-07-12 17:54:35', '2018-07-12 17:54:35', NULL),
(71, 'doce', 'doce', 'doce@gmail.com', '2017-02-02', 'mujer', '8970987', 'doce', 'doce', '9088709879-OR', '9769876', '9876987', '89769876', NULL, 'doce', '$2y$10$Ucl0Zzk7Y7EJnmKZ6w8MDeHaUreV1K7cQwSyWoSq4hUEoe3jcapJC', NULL, '2018-07-12 17:55:19', '2018-07-12 17:55:19', NULL),
(72, 'trece', 'trece', 'trece@gmail.com', '2017-02-02', 'varon', 'trece', 'trece', 'trece', '123456-OR', 'trece', 'fjgjgh', NULL, NULL, 'trece', '$2y$10$xuIqjVYTHZFTaajoML8W3eQrXsK73rx7t2sqO6tlKs9EPjYd9HowK', NULL, '2018-07-12 17:56:17', '2018-07-12 17:56:17', NULL),
(73, 'SILVIA', 'MAGNE JOANIQUINA', NULL, '1970-02-03', 'mujer', '52-77909', '72455881', 'TACNA DIAGONAL LEON # 225', 'undefined-undef', 'PROFESIONAL', 'ORLANDO ARCE', NULL, '72327822', 'silvia.magne', '$2y$10$pE/myE6Cf8r6urmjmqKDDuI0bMJa2VZcN5FpJ3AvX5ZTmUHC58eue', NULL, '2018-07-12 17:57:29', '2018-07-12 17:57:29', NULL),
(74, 'DAYANA VIVIANA', 'CHILA ROJAS', NULL, '1997-08-04', 'mujer', NULL, '68330207', 'QUINTANA Y MURGUIA', 'undefined-undef', 'UNIVERSITARIA', 'ISADORA ROJAS', NULL, '73742151', 'dayana.chila', '$2y$10$tC/MJ/F.7Ec6NOcDS3zh1uKoGsJXcDUMoiwU6xTmtYwYWhLoN0a..', NULL, '2018-07-12 18:00:03', '2018-07-12 18:00:03', NULL),
(75, 'TELMA', 'LLAMPA QUIÑONES', 'telfer_ist@hotmail.com', '1994-09-24', 'mujer', '52-65785', '75410167', 'GASPAR DE LA CUEVA Y HAITI', 'undefined-undef', 'UNIVERSITARIA', 'VIVIANA QUIÑONES', NULL, '72302409', 'telma.llampa', '$2y$10$zT0v4DYF0lRf84poSZLoLOheeKhW5xSuLMZm6dhbROWsjn/7Rm7L2', NULL, '2018-07-12 18:02:12', '2018-07-12 18:02:12', NULL),
(76, 'ISAAC ALBERTO', 'LOAYZA ROMERO', NULL, '1990-01-18', 'varon', '52-41249', '75427293', 'PAGADOR Y LEON # 203', 'undefined-undef', 'UNIVERSITARIO', 'ALEJANDRA LOAYZA', NULL, '72485408', 'isaac.loayza', '$2y$10$Ml93aIe6VsWNnmhW1yVikeCX/ijho1/tFzo2qarBZJv.X.lcZjADu', NULL, '2018-07-12 18:05:01', '2018-07-12 18:05:01', NULL),
(77, 'NAYRA MARCELA', 'PADILLA OROPEZA', 'nayrapadillaoropeza@gmail.com', '1985-10-08', 'mujer', NULL, '76146138', 'BARRIO SAN JOSE # 337', 'undefined-undef', 'PROFESIONAL', 'VIRGINIA OROPEZA', NULL, '70416613', 'nayra.padilla', '$2y$10$WY64SctypbWwR3nCnyVmi.FLgUhIOexGWVef2YEtGR0zdlV4vJjga', NULL, '2018-07-12 18:10:52', '2018-07-12 18:10:52', NULL),
(78, 'PAULO ALBERTO', 'ZEGARRA ROMERO', 'paulozegarra@hotmail.com', '1978-07-11', 'varon', '52-86097', '75410025', 'JUNIN POTOSI Y 6 DE OCTUBRE', 'undefined-undef', 'PROFESIONAL', 'MALIA ZEGARRA', '', '71849587', 'paulo.zegarra', '$2y$10$JaasYtB5C/oeGUZ7J..V5.FJwAEfac1EMSzTQS19nCsNXp9dia4.W', NULL, '2018-07-12 18:23:25', '2018-07-12 18:23:25', NULL),
(79, 'DALSY DAYANNA', 'LLANQUE MIRANDA', NULL, '1999-04-12', 'mujer', NULL, '67223106', 'ZONA AEROPUERTO', 'undefined-undef', 'UNIVERSITARIA', 'ESTHER MIRANDA', NULL, '67223106', 'dalsy.llanque', '$2y$10$8sfeeMp/VveNhU5DoQQBNuY/ctkz6xl/Di.U3gBTfcjyX9NcYoUxO', NULL, '2018-07-12 18:31:27', '2018-07-12 18:31:27', NULL),
(80, 'ROLANDO', 'FLORES YAÑEZ', 'rolandofloresfnf@gmail.com', '1988-02-10', 'varon', NULL, '71888595', 'BARRIO CALAMA C Y D', 'undefined-undef', 'PROFESIONAL', 'SANDRA', NULL, '73831809', 'rolando.flores', '$2y$10$JCKoTx5cXAkV0kRMMN.i3uqDz5d5TvHopqXv20Cb3JEZ9O3QrCO6u', NULL, '2018-07-12 18:34:14', '2018-07-12 18:34:14', NULL),
(81, 'DANIELA SILVIA', 'ANCASI VINO', 'danny-princess7@hotmail.com', '1999-09-07', 'mujer', NULL, '78602055', 'JAEN Y QUINTANA', 'undefined-undef', 'UNIVERSITARIA', 'SILVERIA VINO', NULL, '71852600', 'daniela.ancasi', '$2y$10$/lR5ztS1DsUIrjjiwagOK.V1C3p/CcW6aCyC.bhHuSUQDXNzYu59e', NULL, '2018-07-12 18:37:16', '2018-07-12 18:37:16', NULL),
(82, 'ZENAIDA', 'PILLCO VARGAS', NULL, '1980-12-14', 'mujer', NULL, '68306843', 'HUANUNI', 'undefined-undef', 'PROFESIONAL', 'ZENAIDA', NULL, '68306843', 'zenaida.pillco', '$2y$10$mBGXXlevuDqlRytnItwfyu9DA/CCl2c/Z/66YeeFktxfhEOyTfXEG', NULL, '2018-07-12 18:40:07', '2018-07-12 18:40:07', NULL),
(83, 'SAMANTA LUCERO', 'FERNANDEZ GUTIERREZ', NULL, '1999-12-29', 'mujer', '52-85246', '65413061', 'SAN FELIPE BRASIL Y TEJERINA # 345', 'undefined-undef', 'OTRO', 'MELINA GUTIERREZ', NULL, '79418033', 'samanta.fernandez', '$2y$10$3tZY7lHKU.AC0ZgCxC2DPuz6u5sQkeyE0xffJLOcvacv0BtzVUcUu', NULL, '2018-07-12 18:42:36', '2018-07-21 16:25:57', NULL),
(84, 'WILLY HENRY', 'AQUINO FERNANDEZ', 'henrry-aquino12@hotmail.com', '1993-12-17', 'varon', '52-59328', '65950072', 'SAN FELIPE Y MAGALLANES', 'undefined-undef', 'UNIVERSITARIO', 'PAPA', NULL, '72492120', 'willy.aquino', '$2y$10$OYPNcKI/HYxXG9u/.fnmve5xqai9asSiEzHW5rFD2awbpuqa.0VWq', NULL, '2018-07-12 18:45:30', '2018-07-12 18:45:30', NULL),
(85, 'JOSE ALFREDO', 'FLORES MACIAS', NULL, '1998-08-31', 'varon', '52-89961', '', 'TACNA REYNALDO VASQUEZ', 'undefined-undef', 'UNIVERSITARIO', 'FELIPE FLORES', NULL, '76138373', 'jose.flores', '$2y$10$X8nf1PM2jrYh0N9WagwNYefkzTEOM5WnyMjhWXFnHxKXRgURAKrVG', NULL, '2018-07-12 18:48:47', '2018-07-12 18:48:47', NULL),
(86, 'ABIGAIL MERY', 'QUENA QUISPE', NULL, '2001-07-20', 'mujer', NULL, '67224170', 'MONTEAGUDO ENTRE LUIS TELLEZ 34B', 'undefined-undef', 'UNIVERSITARIA', 'ROSS MERY QUISPE', NULL, '67218956', 'abigail.quena', '$2y$10$vCrnXa/IAdBk9ZjU613x0ekRofhRTu8ZuM04CsIIEd8JANt6qnYJO', NULL, '2018-07-12 18:51:13', '2018-07-12 18:51:13', NULL),
(87, 'BRUNO DARKO', 'PORREZ ACHÁ', NULL, '2000-06-03', 'varon', '52-75508', '72479648', 'PAGADOR LIZARRAGA # 7219', 'undefined-undef', 'UNIVERSITARIO', 'GROVER PORREZ', NULL, '75422337', 'bruno.porrez', '$2y$10$m6xw/MEcD6VbFGcm8qT.b.om9r/9B4U1gxJM6TZuFMsbT66sZEcF6', NULL, '2018-07-12 18:53:42', '2018-07-12 18:53:42', NULL),
(88, 'ANDREY MAURICIO', 'CALIZAYA CARTAGENA', 'and-drey@hotmail.com', '1997-10-01', 'varon', '52-40706', '61812177', 'URB. AURORA', 'undefined-undef', 'UNIVERSITARIO', 'GUSTAVO ADOLFO CALIZAYA', NULL, '76153717', 'andrey.calizaya', '$2y$10$K6zwW40.KiV.6XtrD.spz.08A8fYk2h5B0KmNZV0tdLyzxxkofD4S', NULL, '2018-07-12 18:57:37', '2018-07-12 18:57:37', NULL),
(89, 'GILDO JAVIER', 'GONZALES LAZO', 'gildo_mssi@hotmail.com', '1999-10-30', 'varon', '52-48125', '75705110', '6 DE AGOSTO AROMA Y VILLARROEL', 'undefined-undef', 'UNIVERSITARIO', 'JAVIER LAZO', NULL, '73838855', 'gildo.gonzales', '$2y$10$UTgGJRK2SQ98JnPzac4xDuMd7qkyHCGfnfXOpnI.3BS6qN4LoiFbe', NULL, '2018-07-12 19:00:33', '2018-07-12 19:00:33', NULL),
(90, 'VANESSA', 'SANDOVAL CHOQUE', NULL, '2000-05-10', 'mujer', NULL, '73838185', 'KOLOSQUI ENTRE GREGORIO PACHECO', 'undefined-undef', 'OTRO', 'JOSE SANDOVAL CONDE', NULL, '67222728', 'vanessa.sandoval', '$2y$10$eFzWEBu6mzaAG.6bCbI2pO/DnNfm9hE71th3m9/IFDHmGuVRBNabO', NULL, '2018-07-12 19:02:55', '2018-07-12 19:02:55', NULL),
(91, 'MIGUEL ANGEL', 'NICOLAS MEJIA', NULL, '1995-10-02', 'varon', NULL, '75425419', 'JOSE ZAMPA # 63 BARRIO INCAPOSO', 'undefined-undef', 'UNIVERSITARIO', 'MABEL MEJIA', NULL, '79417234', 'miguel.nicolas', '$2y$10$yol3pnWSZ1QszzF.7jqWYu9DOPKJkxdvqfzYWw7GUcPlWRZSXrvVS', NULL, '2018-07-12 19:05:25', '2018-07-12 19:05:25', NULL),
(92, 'VLADIMIR', 'LEON AGUILAR', 'sonyvias_11@hotmail.es', '1993-06-03', 'varon', NULL, '65263992', 'CALLE CALAMA Y JJ. PEREZ', 'undefined-undef', 'UNIVERSITARIO', 'AGUSTINA AGUILAR', NULL, '76150465', 'vladimir.leon', '$2y$10$rHvsP9WU9l/mHrhuhIyuReSha365matQRjozkoEvKgzDFrtB7J9r.', NULL, '2018-07-12 19:08:12', '2018-07-12 19:08:12', NULL),
(93, 'Andrea Megan', 'Lafuente Rocha', 'megan@gmail.com', '1997-07-31', 'mujer', '52-789456', '123456789', 'pagadore', '12456789-OR', 'estudiantes', 'docente', 'asjdfkasjdf', 'lkjhsaldkfjhasdfklj', 'megan', '$2y$10$dJ6g09Ig/gooXAJNvZbwzuJnHYpcmmfaYgEgKzSZSun/8VBQ/80u6', 'xeGCo9xSbigZxjObqwiy9dx6Awsqr3nMgCPqLUjTxK4NV1Djt5LHncXYo9fD', '2018-07-12 19:23:41', '2018-07-12 19:28:12', NULL),
(94, 'ALVARO MARCELO', 'CADIMA CHOQUE', NULL, '1998-07-05', 'varon', '52-49678', '52-49678', 'HUAJARA 3 LOTE 9 MANZANO 45', 'undefined-undef', 'OTRO', 'FRANCISCA CHOQUE', NULL, '71949837', 'alvaro.cadima', '$2y$10$4qnFHuVXejD7OsIZFbHoreApFHaHJ2sjf2YNM1wRbXBSP8ZjkcdxG', NULL, '2018-07-12 21:50:20', '2018-07-12 21:50:20', NULL),
(95, 'NICOLE JHESSENIA', 'VICENTE CORREA', NULL, '1996-08-14', 'mujer', NULL, '72472708', 'AV. DEHENE # 79', 'undefined-undef', 'UNIVERSITARIA', 'FERNANDO VICENTE PACO', NULL, '69583266', 'nicole.vicente', '$2y$10$0/PVYHPggxm58qMBVpnYpunQtwatpyQK2aOmmW6gTTNJVHm33tcEe', NULL, '2018-07-12 21:53:45', '2018-07-12 21:53:45', NULL),
(96, 'ADRIANA JESSICA', 'LLAMPA PACHECO', 'adrianajessica98@gmail.com', '1998-10-01', 'mujer', '52-78329', '60439137', 'VELASCO ESQ. RENGEL', 'undefined-undef', 'UNIVERSITARIA', 'OSCAR COLQUE', NULL, '71100000', 'adriana.llampa', '$2y$10$6QQ8bKc.AlckGnDuBIzq5uMNQGGRYxCdXUKUlcsBUCJzTYVS1ytPa', NULL, '2018-07-12 21:57:04', '2018-07-12 21:57:04', NULL),
(97, 'ARIEL', 'VILLCA TICONA', 'arielvillca@hotmail.es', '1996-09-16', 'varon', NULL, '75419925', 'CALLE TABLADA # 5 ENTRE SANTA BARBARA', 'undefined-undef', 'UNIVERSITARIO', 'JEYNER VILLCA', NULL, '72460462', 'ariel.villca', '$2y$10$nM1aCUIY1ba570MxDvJc3.8.kJmDSZdF1yXJzNdwJwYKv.ioj7G6q', NULL, '2018-07-12 21:59:57', '2018-07-12 21:59:57', NULL),
(98, 'ESTEFANIA', 'CHEVALIER MORATO', 'estefichev@hotmail.com', '1998-07-03', 'mujer', '', '69582679', '6 DE OCTUBRE Y HERRERA', 'undefined-undef', 'UNIVERSITARIA', 'CHRISTIAN CHEVALIER', '', '79549190', 'estefania.chevalier', '$2y$10$SUj8suNIGMG.4LFpMZgOm.s9pitvLviMn9suUypiTozZc4.I.lVMC', NULL, '2018-07-12 22:06:23', '2018-07-12 22:06:23', NULL),
(99, 'MARCO MISAEL', 'ESCALIER ARRAYARAN', NULL, '2001-07-05', 'varon', '52-88943', '75412038', 'PISAGUA EJERCITO', 'undefined-undef', 'UNIVERSITARIO', 'HAYDEE ARRAYARAN SUAREZ', NULL, '74124087', 'marco.escalier', '$2y$10$IWJlTtnizXg6F0jc1NPgB.qF7Gk1ZP596aO8rWPOkRC40TjhuthbO', NULL, '2018-07-12 22:09:07', '2018-07-12 22:09:07', NULL),
(100, 'ALISON ALEJANDRA', 'VELASQUEZ HUANCA', NULL, '1998-02-06', 'mujer', '52-63909', '76130741', 'GRAL. ACHA VILLAZON', '7333123-OR', 'UNIVERSITARIA', 'CAROL MARIA JOSE VELASQUEZ HUANCA', NULL, '69727277', 'alison.velasquez', '$2y$10$Se5JSdr7mpzdcP7kDOrdAuTdRKM6sscSqvet0xwL2c/l7dtDYAAqe', NULL, '2018-07-12 22:27:57', '2018-07-12 22:27:57', NULL),
(101, 'AMALIA VERONICA', 'LIMA MALDONADO', 'veritopianomed@gmail.com', '1989-07-29', 'mujer', '52-41057', '67215324', 'SANTA CRUZ # 273 Y 6 DE OCTUBRE', '7270370-OR', 'PROFESIONAL', 'GRISELDDA MALDONADO', NULL, '67231091', 'amalia.lima', '$2y$10$0eHk8CATykHXzK5GhbOmDe8GDYBVx05kOGLPyIMMvvmMbdIqNNoNW', NULL, '2018-07-12 22:37:26', '2018-07-12 22:37:26', NULL),
(102, 'JHEYMAR FELIX', 'RAFAEL FLORES', 'jovenjheymarpitoto@gmail.com', '1993-06-21', 'varon', NULL, '78600438', 'POTOSI Y ANDAMARCA', '7343486-OR', 'UNIVERSITARIO', 'CLAUDINA FLORES', NULL, '74132931', 'jheymar.flores', '$2y$10$GUPSImnZ8ueMCEqH//2MEud4xj83TanUWK5PV7Iyqg/EWMWzEDgb.', NULL, '2018-07-12 22:48:36', '2018-07-12 22:48:36', NULL),
(103, 'LISBETH MONICA', 'MARTINEZ CRUZ', '', '1994-05-04', 'mujer', NULL, '78656202', 'FINAL LIRA Y ANTOFAGASTA', '10525466-PT', 'UNIVERSITARIA', 'ALVERT MARTINEZ CRUZ', NULL, NULL, 'lisbeth.martinez', '$2y$10$Z6RecdJcOqdXf8bpZMGZReg/ULVnKffLrUOpx8eapREL5085J0c32', NULL, '2018-07-12 22:51:49', '2018-07-12 22:51:49', NULL),
(104, 'PATRICIA JAEL', 'VERA ARRAYA', NULL, '2000-05-09', 'mujer', '52-31960', '79417776', 'BENI # 30 ENTRE GRAN CHACO Y LA PAZ', '7323718-OR', 'OTRO', 'DELMIRA ARRAYA MANZANEDA', NULL, '79412326', 'patricia.vera', '$2y$10$EGX3ig6tygUPkb0FgbqPHeipzOIOJIk01iQjoqUdBQVjIEbojIIum', NULL, '2018-07-12 23:08:09', '2018-07-12 23:08:09', NULL),
(105, 'JUVITA EMILIANA', 'VELASQUEZ CORREA', 'jovitavelasquez1@hotmail.com', '1969-01-10', 'mujer', '52-45490', '73800401', 'TENIENTE LEON Y CAPITAN USTARIZ', '3109451-OR', 'PROFESIONAL', 'JUVITA', '52-45490', '73800401', 'juvita.velasquez', '$2y$10$pm3AEsZ95/AFZfoPoKFJBefbFMKxHUNGOc//U.TmhzmhhC.RVjgJa', NULL, '2018-07-12 23:12:04', '2018-07-12 23:12:04', NULL),
(106, 'MARIEL JHOVANA', 'PATTON AYMA MARIEL JHOVANA', NULL, '2000-07-08', 'mujer', NULL, '76150609', 'HEROES DEL CHACO # 15 ENTRE ZENON Q.', '7267851-OR', 'UNIVERSITARIA', 'MARCELINO PATTON', NULL, '72461035', 'mariel.patton', '$2y$10$XnqiNMuxUjNTHW7kPKVS2eDUesTJ8vVAZ2Jr2OqQGhmNv9sFtFvCO', NULL, '2018-07-12 23:14:56', '2018-07-12 23:14:56', NULL),
(107, 'ALEJANDRA', 'YUJRA CONDORI', 'alejandra_ok77@hotmail.com', '1997-09-16', 'mujer', NULL, '69583661', 'URB DIOS ES AMOR # 9', '7458820-OR', 'UNIVERSITARIA', 'RENE YUJRA CONDORI', NULL, '73820239', 'alejandra.yujra', '$2y$10$MX8/3SMy6oMn7VaFSPZVQewXoIWnJThpNoe72DHyK4/7r2y8rDA8i', NULL, '2018-07-12 23:17:38', '2018-07-12 23:17:38', NULL),
(108, 'REBECA', 'CONDORI MAMANI', NULL, '1996-01-05', 'mujer', NULL, '73830855', 'URB. PUMAS ANDINOS M. 175 L.5', '7354650-OR', 'UNIVERSITARIA', 'PASTORA MAMANI', NULL, '79540051', 'rebeca.condori', '$2y$10$iG0b8ibm2N7oI23gomb5mer5NZsh35yIleyaY6LhynsbuEErT2fyG', NULL, '2018-07-12 23:23:27', '2018-07-12 23:23:27', NULL),
(109, 'JORGE', 'CHUQUIMIA LOPEZ', 'jorgechuquimiaz@gmail.com', '1988-09-10', 'varon', '52-40207', '72772852', 'HEROES DEL CHACO ENTRE JORDAN', '5770463-OR', 'UNIVERSITARIO', 'ALBINA LOPEZ PARRA', '52-40207', '72480099', 'jorge.chuquimia', '$2y$10$gmiGmxH09IShWF.zzaKgOeYz0k3SIZ6pPzsByN.QxJMv5Zhq7u4P2', NULL, '2018-07-12 23:28:21', '2018-07-12 23:28:21', NULL),
(110, 'SALVADOR YASSER', 'ALI FLORES', NULL, '2000-03-28', 'varon', NULL, '67263327', 'AV. VILLARROEL Y AV. TACNA', '7372592-OR', 'UNIVERSITARIO', 'REYNALDO ALI', NULL, '73815834', 'salvador.ali', '$2y$10$XmZZnGlk2KeiLaoJsHQFbuKeLE3.SrTT/pcB3rJK2ajZA/BY4nGse', NULL, '2018-07-12 23:30:52', '2018-07-12 23:30:52', NULL),
(111, 'JHAMIL CRISTIAN', 'CORTEZ MIRANDA', 'jhamilf0202@gmail.com', '1997-10-25', 'varon', NULL, '70431956', 'AV. TOMAS BARRON PASAJE SAPO # 115', '7310321-OR', 'UNIVERSITARIO', 'AMELIA MIRANDA', NULL, '72359510', 'jhamil.cortez', '$2y$10$1Rnf00x3VCi/xpNILY04fel0pFiJB0G6hysh9MiT/Rp1oc1oLIU9u', NULL, '2018-07-12 23:34:49', '2018-07-12 23:34:49', NULL),
(112, 'MICHELLE', 'CORTEZ PINAYA', NULL, '1996-08-18', 'mujer', '52-41107', '76145393', 'AV. HEROES DEL CHACO', '7419912-OR', 'UNIVERSITARIA', 'ZULEMA PINAYA', NULL, '72456746', 'michelle.cortez', '$2y$10$jFwEEpRkbNHH4DMehYGu.uVWzBypBkMJsEFDM2dPTNqaXp1pvybmG', NULL, '2018-07-12 23:37:45', '2018-07-12 23:37:45', NULL),
(113, 'GLORIA LINA', 'ARIAS VILLEGAS', 'gloria43_hp@yahoo.es', '1990-02-13', 'mujer', '52-37101', '73153778', 'CORNETA MAMANI Y PETOP', '7270022-OR', 'UNIVERSITARIA', 'ALINA VILLEGAS', '52-37101', NULL, 'gloria.arias', '$2y$10$7nvBoSz0dmCtCqJeF4ee3eP6utbjXUG9yISFRnHGKlMyh2Rv/pgsS', NULL, '2018-07-12 23:41:11', '2018-07-12 23:41:11', NULL),
(114, 'DANIELA ALEXANDRA', 'DURAN FIGUEROA', NULL, '1999-09-20', 'mujer', NULL, '69604619', 'MAGALLANES Y ADOLFO MIER', '12709817-OR', 'UNIVERSITARIA', 'KAREN FIGUEROA', NULL, '79413716', 'daniela.duran', '$2y$10$GpMmm6FD9euoF1zJRHX0w.vQoywIKTN2nVuucXzIzfq9QnGmACuVa', NULL, '2018-07-12 23:43:34', '2018-07-12 23:43:34', NULL),
(115, 'JORGE RONALDO', 'RAMIREZ QUISPE', NULL, '1998-04-18', 'varon', '52-85966', '76135979', 'ARCE # 10 Y CIRCUNVALACION', '7368720-OR', 'UNIVERSITARIO', 'ROMAN RAMIREZ ZARATE', NULL, '73569504', 'jorge.ramirez', '$2y$10$51U7cLY3MSoyZX0Gazfe4uXZVjj07hIpgyUXGWf9V.nr7J8xMhspm', NULL, '2018-07-12 23:47:14', '2018-07-12 23:47:14', NULL),
(116, 'BEATRIZ VIVIANA', 'CALIZAYA AJHUACHO', NULL, '2000-07-29', 'mujer', NULL, '72312683', 'CHALLACOLLO', '7326832-OR', 'UNIVERSITARIA', 'JUANA CALIZAYA AJHUACHO', NULL, '72451030', 'beatriz.calizaya', '$2y$10$XSR/0l.mquAQ.n0q2ASghOg9w1ZvwrZSQyWcgYJPZeW94.zYrAaGW', NULL, '2018-07-12 23:49:23', '2018-07-12 23:49:23', NULL),
(117, 'SEBASTIAN ANDRES', 'ARCE LEDEZMA', 'andreslelluzarce@gmail.com', '2000-11-08', 'varon', '52-42608', '68353436', 'LEON # 513 6 DE OCTUBRE Y LA PAZ', '7404300-OR', 'UNIVERSITARIO', 'CARLA LEDEZMA VARGAS', NULL, '60421237', 'sebastian.arce', '$2y$10$k.HoizT9pIbkZ1jS0sRyL.Q.hPXjnloF0qtaflhWkSNKlMV4ia2/S', NULL, '2018-07-12 23:53:12', '2018-07-12 23:53:12', NULL),
(118, 'CARLA GABRIELA', 'NINAJA ZABALA', 'carlita.12.gabi@gmail.com', '1999-10-12', 'mujer', NULL, '65435647', 'TOMAS FRIAS Y TARIJA', '7319614-OR', 'UNIVERSITARIA', 'BORIS NINAJA', NULL, '68541412', 'carla.ninaja', '$2y$10$fn3pSnGGwdvnbBcL0EFSTOmW5/I.9HIFFToEgKFinbzJwNfn3dM8G', NULL, '2018-07-12 23:56:05', '2018-07-12 23:56:05', NULL),
(119, 'CARLA ADRIANA', 'TORREZ CASTAÑARES', 'adri.smrtace@gmail.com', '1995-03-31', 'mujer', '52-47738', '79413111', 'SOTOMAYOR #13 PAGADOR Y POTOSI', '7295945-OR', 'UNIVERSITARIA', 'LOURDES CASTAÑARES', NULL, '794064444', 'carla.torrez', '$2y$10$XkFQLGZUmlQ03JjIGek20en/dlWWdWnJKXAtotUbUSrGtKJHzCXe.', NULL, '2018-07-12 23:59:50', '2018-07-12 23:59:50', NULL),
(120, 'PAOLA SOLEDAD', 'JIMENEZ CHAVEZ', 'pao_sway@hotmail.com', '1990-04-24', 'mujer', NULL, '65423639', 'PASAJE JUAN DE LA CRUZ Y OBLITAS', '7275552-OR', 'PROFESIONAL', 'SOLEDAD QUIROGA', NULL, '65428184', 'paola.jimenez', '$2y$10$OFXcLVXTxFOwJhR5av6CGu/X/kBabBlSAJU5xqeK11z/W.vzD3Zey', NULL, '2018-07-13 00:03:27', '2018-07-13 00:03:27', NULL),
(121, 'DANIELA', 'BECERRA VILLCA', NULL, '2000-01-17', 'mujer', '52-48499', '72306727', 'AV. DEL MAESTRO Y WASHINTON', '7360287-OR', 'UNIVERSITARIA', 'VIOLETA', NULL, '72319941', 'daniela.becerra', '$2y$10$MiG6lUMGOYR6OOd/AZdMAOn2ls96Du1Mk0i25a5zP1ir7uXeS2JgS', NULL, '2018-07-13 00:06:40', '2018-07-13 00:06:40', NULL),
(122, 'MONICA CARLA', 'RODRIGUEZ ROCHA', 'antonellamcrr.19@gmail.com.bo', '1995-09-29', 'mujer', '52-50593', '60419182', 'COCHABAMBA # 1070 PETOT', '7402352-OR', 'PROFESIONAL', 'CARLOS RODRIGUEZ', NULL, '67101485', 'monica.rodriguez', '$2y$10$cfztdfZthaWcJ/lqHSN/L.JzC5Qql.zEPrT.aWNL1M.Y2uVhny0Oe', NULL, '2018-07-13 00:10:12', '2018-07-13 00:10:12', NULL),
(123, 'KATERIN MIRNA', 'CONDARCO SALAS', 'katerinlovejk@gmail.com', '1994-02-25', 'mujer', NULL, '73817927', 'BARRIO SIERRA MIER # 6', '7377504-OR', 'UNIVERSITARIA', 'GLADIS CONDARCO SALAS', '', '73835185', 'katerin.condarco', '$2y$10$5Qr2GoyyUnfi2Msty7XPRuX/tL2RqIcKr6FopBv.bqkmCM1OtCTf6', NULL, '2018-07-13 00:13:44', '2018-07-13 00:13:44', NULL),
(124, 'JORGE LUIS', 'CONDORI MASSI', 'jnco7777777@gmail.com', '1985-08-10', 'varon', '52-52773', '72484187', 'CALLE ARCE # 5', '5741298-OR', 'UNIVERSITARIO', 'DANIELA', NULL, '73848960', 'jorge.condori', '$2y$10$0zHc0kBxHlEc/gm3C03CQuimcz9tj/klHj5jihgJowFuDoPkR1Ffq', NULL, '2018-07-13 00:16:46', '2018-07-13 00:16:46', NULL),
(125, 'JUAN ADAN', 'SEQUEIROS FERNANDEZ', 'j.adan.sf.jasf@GMAIL.COM', '1980-11-18', 'varon', NULL, '77145488', 'TEJARINA # 338 HERRERA Y 1º DE NOVIEMBRE', '4056706-OR', 'OTRO', 'PAOLA TOLEDO', NULL, '75424309', 'juan.sequeiros', '$2y$10$FpHTulJxf56tTx6JvUGCxeVzZrKzMRcKRK7OlCNFbdmMf0pVNw8zK', NULL, '2018-07-13 00:25:46', '2018-07-13 00:25:46', NULL),
(126, 'BRIAN PERCY', 'PEÑAFIEL PLATA', 'kobby-4@hotmail.com', '1989-10-12', 'varon', '52-11488', '72475759', 'AV. ESPAÑA # 1575 ENTRE MADRID Y BULLAIN', '5771485-OR', 'UNIVERSITARIO', 'GUERALDINE PEÑAFIEL', NULL, '72345882', 'brian.peñafiel', '$2y$10$8g8vmxjRhW..cIe0SOPPQOeJlemowquMzvAqEwM98H2PDmn6WrjeK', NULL, '2018-07-13 00:32:00', '2018-07-13 00:32:00', NULL),
(127, 'JHOSELYN MYRIAM', 'CRUZ HUARACHI', 'myriamcita281794_@hotmail.com', '1994-07-28', 'mujer', '52-39885', '76152788', 'URB. AURORA', '7324759-OR', 'UNIVERSITARIA', 'JHOSELYN', NULL, '76152788', 'jhoselyn.cruz', '$2y$10$FWTVTYHGJBg0j9y403eUyeYzM7fSBIu8ygOnIJFNxRCNLTYAuNGQy', NULL, '2018-07-13 00:35:46', '2018-07-13 00:35:46', NULL),
(128, 'ISAMAR MELISSA', 'BELTRAN FLORES', NULL, '1989-01-31', 'mujer', NULL, '72341517', 'FINAL SAN FELIPE # 30', '7269352-OR', 'UNIVERSITARIA', 'MARIA FLORES', NULL, '71854321', 'isamar.beltran', '$2y$10$tmeh8j4VSU15V3sKNPdeJ.RxwE9O.z8tBMloW3.Asbe.IXVgbwwiC', NULL, '2018-07-13 01:22:58', '2018-07-13 01:22:58', NULL),
(129, 'MAYRA ALEJANDRA', 'CARDENAS HUANCA', 'alecita66.maura@gmail.com', '2000-01-18', 'mujer', '52-79596', '72495714', '6 DE AGOSTO Y COCHABAMBA # 1210', '7424202-OR', 'UNIVERSITARIA', 'JORGE VICENTE CARDENAS', NULL, '71882489', 'mayra.cardenas', '$2y$10$hma7TddMdcn1zBOtQ75vH.yQEP6F9t9hTocoqp1/mi99jsRf2ecOu', NULL, '2018-07-13 01:34:31', '2018-07-13 01:34:31', NULL),
(130, 'MELISA JESSICA', 'OROS ALCOCER', 'melvinaoros@gmail.com', '1999-11-07', 'mujer', '52-43090', '75719672', 'AV. HEROES DEL CHACO FINAL POTOSI # 24', '7407283-OR', 'UNIVERSITARIA', 'PADRE', NULL, '73846391', 'melisa.oros', '$2y$10$2cK3yLjkSjvuVJYKfexEUeORpNgqyiExkkLsDJPk.aq2oI5xZNxHa', NULL, '2018-07-13 01:48:36', '2018-07-13 01:48:36', NULL),
(131, 'ROGER DONATO', 'PUÑA CALLE', NULL, '2000-05-28', 'mujer', '52-44218', '6828802', 'CRISTO REY ESQ.SANTOS VARGAS', '7422048-OR', 'UNIVERSITARIO', 'JULIA CALLE', NULL, '68288802', 'roger.puña', '$2y$10$1Jg9ooD7wMKMlBm.j5GaLul75Mg5iGCCw.o4DP5z.UyuLFWkM1YUa', NULL, '2018-07-13 01:54:49', '2018-07-13 01:54:49', NULL),
(132, 'PABLO FELIPE', 'CARVAJAL VIDAURRE', 'pafecavistense@hotmail.com', '1987-02-05', 'varon', '52-33805', '67222042', 'URB. VILLA DORINA M.3 L. 1', '5744522-OR', 'PROFESIONAL', 'FERNANDO CARVAJAL', NULL, '72340466', 'pablo.carvajal', '$2y$10$tqAJTFlMy9C5oxwf/v2lbuABGoR3sSVU/5qQjHwgD6gyR2YDxaN2q', NULL, '2018-07-13 16:57:05', '2018-07-13 16:57:05', NULL),
(133, 'CHRISTIAN ALVARO', 'ENCINAS ENCINAS', NULL, '1994-07-01', 'varon', '52-43317', '70412882', 'BARRIO SENAC # 75', '4048104-OR', 'UNIVERSITARIO', 'ELIZABETH ENCINAS', NULL, '60416087', 'christian.encinas', '$2y$10$UVgTsKU/.o9qSyHDwTA9W.MBPI.TXy215Y8oLTBd2KgcnwTivUml.', NULL, '2018-07-13 16:59:27', '2018-07-13 16:59:27', NULL),
(134, 'KAREN LUCIA', 'FELIPEZ ROJAS', 'karen_lucia82@hotmail.com', '1991-04-25', 'mujer', NULL, '77195977', 'CARO CAMACHO Y WASHINGTON', '7214555-TJ', 'UNIVERSITARIA', 'KAREN', NULL, '77195977', 'karen.felipez', '$2y$10$ra8kwrkuBVpV/qaOtSROXuB9H3nkBtd1wOxpiPr2ZBVOZBzg5.OOa', NULL, '2018-07-13 17:02:41', '2018-07-13 17:02:41', NULL),
(135, 'JANIRA ANDREA', 'VARGAS GRANDON', 'janigrand@hotmail.com', '1993-12-15', 'mujer', '52-44945', '67212178', 'SARGENTO', '5720267-OR', 'PROFESIONAL', 'JOSE VARGAS QUEVEDO', NULL, '72487279', 'janira.vargas', '$2y$10$Gh2wV696X/75mXVC9v0lSeHQTGcScliux8jD0FoNiJ2If0Poi69/S', NULL, '2018-07-13 17:06:54', '2018-07-13 17:06:54', NULL),
(136, 'GINA', 'ARGUELLEZ RODRIGUEZ', NULL, '1962-12-03', 'mujer', '52-72250', '76159171', 'VELASCO # 5727 AYACUCHO COCHABAMBA', '3068758-OR', 'OTRO', 'GINA', '52-72250', '76159171', 'gina.arguellez', '$2y$10$SQSe1OHzjD4UPgYS7pUUCOrLK0BrGmQ2JO2./fD4fBLuAnc5K5kVW', NULL, '2018-07-13 17:09:49', '2018-07-13 17:09:49', NULL),
(137, 'GUERY IOJHAN', 'SOLIZ CALLE', NULL, '1995-01-01', 'varon', NULL, '65407245', 'POTOSI # 7292 Y 12 DE OCTUBRE', '7291860-', 'UNIVERSITARIO', 'GUERY', NULL, '65407245', 'guery.soliz', '$2y$10$lKK9n8Q/ZvPGK28.yIbmBugenpZTKWAU4UOWrcA4QUCXgJE3nO5k.', NULL, '2018-07-13 17:29:29', '2018-07-13 17:29:29', NULL),
(138, 'SOL ANGELES', 'SOLIZ CAYOJA', NULL, '1998-08-26', 'mujer', NULL, '61816998', 'PLAN 500 CALLE SAJAMA # 205', '12399086-OR', 'UNIVERSITARIA', 'NILDA CAYOJA', NULL, '60431296', 'sol.soliz', '$2y$10$AF4KV4ymQIIuH9JJlZdZ4uafgNaSyYmuBITDXOfK4joj3Yw2/hWvm', NULL, '2018-07-13 18:11:03', '2018-07-13 18:11:03', NULL),
(139, 'KEVIN MARLON', 'SOZA MAMANI', 'elmarlonsegundo@gmail.com', '1996-11-30', 'varon', '52-80930', '79425108', 'BRASIL Y RODRIGUEZ # 67', '12488668-OR', 'UNIVERSITARIO', 'KEVIN', '52-80930', NULL, 'kevin.soza', '$2y$10$RP/E/n4N3WlDhNDOmZDDL.u9XDxz/is4kWKnpRhA9Gfix8Rs4RW12', NULL, '2018-07-13 18:22:21', '2018-07-13 18:22:21', NULL),
(140, 'VILMA', 'HUARAYO CABRERA', 'vivly@yahoo.com', '1992-02-12', 'mujer', NULL, '77145118', 'ARICA MONTESINOS Y CARO', '7377667-OR', 'UNIVERSITARIA', 'CRISTINA CABRERA', NULL, '7243848', 'vilma.huarayo', '$2y$10$99e2NGBefh9JjsFuyrZ/eeRztJiPRnWfzdmR5e7AIvYmf7R6HSQv2', NULL, '2018-07-13 18:35:06', '2018-07-13 18:35:06', NULL),
(141, 'WENDY MELINA', 'MAMANI ALCONZ', 'wendy_melina@hotmail.com', '1992-06-18', 'mujer', '52-61825', '68294013', 'TOMAS FRIAS Y TOLEDO', '7265969-OR', 'UNIVERSITARIA', 'ELSA ALCONZ', NULL, '74122980', 'wendy.mamani', '$2y$10$HrnMnS5Xz28YoAcLyvKE4OB.9X6KqiEFlZ3s7tjMFvB27n5nzRNIC', NULL, '2018-07-13 18:44:11', '2018-07-13 18:44:11', NULL),
(142, 'FRANKLIN VIDAL', 'MOLLO IQUISE', 'vidaliel_20@hotmail.com', '1995-10-26', 'varon', NULL, '68299354', 'CAMACHO # 3 Y WASHINGTON', '7456210-OR', 'UNIVERSITARIO', 'REYNALDO MOLLO', NULL, '72313897', 'franklin.mollo', '$2y$10$v6N1JxPnwRtUTTTyY7tT/e6OsqglpDhb8cWi7NmqZxkhiyCplAX6m', NULL, '2018-07-13 18:51:26', '2018-07-13 18:51:26', NULL),
(143, 'MERY LUZ', 'HUAQUINA JAVIER', 'mlhuaquina-es@udabol.edu.bo', '1999-06-12', 'mujer', NULL, '79411657', 'URB. 10 DE FEBRERO', '7322892-OR', 'UNIVERSITARIA', 'GLADYS', NULL, '72372273', 'mery.huaquina', '$2y$10$6taU6Fsy.GbfY5zItjCHs.ll3SNCjuQ80dIc8ODJydNSMfs6g9p/K', NULL, '2018-07-13 18:58:14', '2018-07-13 18:58:14', NULL),
(144, 'RUBEN', 'CANAVIRI CALLE', NULL, '1994-12-22', 'varon', NULL, '68326170', 'URB. CORDEOR', '7360635-OR', 'UNIVERSITARIO', 'NIEVES CALLE MOROCHI', NULL, '72488511', 'ruben.canaviri', '$2y$10$P1WqPELv6disGURMINTHKe4Y4QtycfOsN/BAzzZbllfarSpsgbc4O', NULL, '2018-07-14 18:02:39', '2018-07-14 18:02:39', NULL),
(145, 'ISMAEL', 'RIVERA ZEGARRA', NULL, '2002-06-12', 'varon', '52-85984', '72314157', 'PAGADOR # 5156 Y LEON', '5754495-OR', 'ESCOLAR', 'MARIA ZEGARRA', NULL, '71849587', 'ismael.rivera', '$2y$10$S.eU3idwwuXxkEKLY0AYF.LMy6irk7XKyOlqdKXr12y6VybYj0H2K', NULL, '2018-07-14 18:09:58', '2018-07-14 18:09:58', NULL),
(146, 'JOAQUIN', 'RIVERA ZEGARRA', NULL, '2002-06-12', 'varon', '52-85984', '75418990', 'PAGADOR # 5166 Y LEON', '5754494-OR', 'ESCOLAR', 'MARIA ZEGARRA', NULL, '71849587', 'joaquin.rivera', '$2y$10$uvc9BErVEzPcfk.deHY2WOG3.TjoVxho3FWjVX882Gxf6jahLDgOO', NULL, '2018-07-14 18:13:03', '2018-07-14 18:13:03', NULL),
(147, 'RONNY JOSHUA', 'OJEDA CHOQUE', 'rom_josy@hotmail.com', '1993-01-02', 'varon', '52-78960', '72461538', 'BOLIVAR TEJERINA Y TARAPACA', '7417908-OR', 'UNIVERSITARIO', 'ROBERTO OJEDA', NULL, '75406976', 'ronny.ojeda', '$2y$10$kGVbbBlFY0kLufHJFC5aFuEcOFwajRslGMf18L8fQBAQvt66MyFYK', NULL, '2018-07-14 18:16:09', '2018-07-14 18:16:09', NULL);
INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `birthday`, `gender`, `phone`, `cellphone`, `address`, `identity_card`, `occupation`, `contact_person`, `contact_person_phone`, `contact_person_cellphone`, `username`, `password`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(148, 'SHIRLEY ANDREA', 'LIMA MALDONADO', 'shirley.lima.maldonado@gmail.com', '0000-00-00', 'mujer', '52-41057', '72465687', 'SANTA CRUZ 6 DE OCTUBRE Y POTOSI', '7391225-OR', 'UNIVERSITARIA', 'GRISELDA MALDONADO', NULL, '67231091', 'shirley.lima', '$2y$10$J0PrZXS56Cxa/EJw8bqWj.28Y70izH64S.uIR50ndpPwoeVeVGhH2', NULL, '2018-07-14 18:20:39', '2018-07-14 18:20:39', NULL),
(149, 'IBETH HELEN', 'SONKO TORREZ', 'helenibeth4@gmail.com', '1995-08-04', 'mujer', NULL, '77149073', '1º DE MAYO E ILLAMPU', '7389854-OR', 'UNIVERSITARIA', 'JUANA TORREZ', NULL, '70430643', 'ibeth.sonko', '$2y$10$HxZtiboTmkc/Gr3UuxSa..48hBsDeG4R5DdtKvyzM1YYBKM74Le26', NULL, '2018-07-14 18:25:34', '2018-07-14 18:25:34', NULL),
(150, 'DEYMAR HUGO', 'VEIZAN MIRANDA', 'veizandeymar@gmail.com', '1996-09-16', 'varon', '52-11701', '61838903', 'AV. TOMAS BARRON CHUQUISACA INGAVI', '7372954-OR', 'UNIVERSITARIO', 'MARITZA MIRANDA', NULL, '72463164', 'deymar.veizan', '$2y$10$oT5yEv8qvHFb2j/gXKPfYu2nFfY3DTyAj3s1jFinrpJ91Wkifwe7C', NULL, '2018-07-14 18:33:05', '2018-07-14 18:33:05', NULL),
(151, 'MARCIO ELIECER', 'SILES VARGAS', 'marciosilesv@gmail.com', '1975-06-01', 'varon', '52-76571', '77142247', 'MURGUIA # 750 ARICA IQUIQUE', '7323510-OR', 'OTRO', 'MARCIO', '52-76571', NULL, 'marcio.siles', '$2y$10$l6LzC9bcuRFGZgpID.Y2OOoJ79uAcHpLI3ng6EjQ7bZnRdntb0bBe', NULL, '2018-07-14 18:35:44', '2018-07-14 18:35:44', NULL),
(152, 'VIVIANA', 'QUISPE GUTIERREZ', 'metalurgia2017@hotmail.com', '1989-11-01', 'mujer', NULL, '78618068', 'VILLARROEL Y ANTOFAGASTA', '7271689-OR', 'UNIVERSITARIA', 'FRANCISCO QUISPE FLORES', NULL, '71108085', 'viviana.quispe', '$2y$10$ecNMO/EK/CsyfqEXidnK.OLjGR/Hrvxmkv1HsmJp6TtkYkDdZCULS', NULL, '2018-07-14 18:38:41', '2018-07-14 18:38:41', NULL),
(153, 'NELLY ARLYNES', 'NOLASCO FLORES', NULL, '1999-10-30', 'mujer', '52-61763', '72309960', 'GENERAL ACHA Nº 222 ENTRE VILLAZON', '8525079-PT', 'UNIVERSITARIA', 'LUORDES VARGAS NOLASCO', NULL, '72486356', 'nelly.nolasco', '$2y$10$4jOgRLwhP2Qjl5bXNBfN8OFykIGnwygQsKn1xDE92.rHFsHXgQRZW', NULL, '2018-07-14 18:43:52', '2018-07-14 18:43:52', NULL),
(154, 'PAOLA ANDREA', 'MACEDO VILLCA', 'paolamacedo77@yahoo.com', '1997-06-03', 'mujer', '52-65689', '75426076', 'VILLA LOS OLIVOS FINAL LUIS ESPINAL # 25', '7419262-OR', 'UNIVERSITARIA', 'TERESA VILLCA', NULL, '72343696', 'paola.macedo', '$2y$10$rWqZZm58M7wGVvXnxXz0WeJ1k8/GrxbhCqSFp5lSW7qA4892wl99q', NULL, '2018-07-14 18:47:41', '2018-07-14 18:47:41', NULL),
(155, 'FRANCO ROBERT', 'ALARCON FLORES', NULL, '1999-05-22', 'varon', '52-65915', '71887273', 'PASAJE A ENTRE VICUÑA # 3', '7299282-OR', 'UNIVERSITARIO', 'MARIO ALARCON', NULL, '71887273', 'franco.alarcon', '$2y$10$Lmy2w7NZnHx/Id63V80xTuByLYBM96eDIcix5OSv5.jUXmuI08b96', NULL, '2018-07-14 18:50:11', '2018-07-14 18:50:11', NULL),
(156, 'YURI LUCERO', 'MACHACA VALLEJOS YURI LUCERO', NULL, '1998-02-18', 'mujer', '52-47907', '61844322', 'AV. ARGENTINA Y A. ZAMUDIO # 11', '7384316-OR', 'UNIVERSITARIA', 'CESAR MACHACA', NULL, '72462688', 'yuri.machaca', '$2y$10$bQGnGNNBDi3iELj6bw9YTOD3HE4sI6dzUxn3bYkxRRibJYwLDxlwu', NULL, '2018-07-14 18:52:16', '2018-07-14 18:52:16', NULL),
(157, 'JAQUELINE FIDELIA', 'APAZA NINA', 'jaqui_apaza_10@hotmail.com', '1995-09-21', 'mujer', NULL, '69581857', 'URBANIZACION 7 DE MARZO', '7423504-OR', 'UNIVERSITARIA', 'FERNANDO APAZA PADILLA', NULL, '63923822', 'jaqueline.apaza', '$2y$10$xfmUdFVI3b5em./e4/JJbu593vsqAsU9.bN6.L6tl7abyKY.8QWQe', NULL, '2018-07-14 18:55:08', '2018-07-14 18:55:08', NULL),
(158, 'ERICK', 'SALGUERO CALIZAYA', 'ericksalguero903@gmail.com', '1996-07-22', 'varon', NULL, '76151186', '1º DE MAYO Y JAEN', '12580528-OR', 'UNIVERSITARIO', 'RAUL SALGUERO', NULL, '73805306', 'erick.salguero', '$2y$10$uqPqCypZv7EiM/uidZBw4enruX8lNWksxWpkcf7r9ZylhM1Z6pmpi', NULL, '2018-07-14 18:59:00', '2018-07-14 18:59:00', NULL),
(159, 'JHULISA', 'CABEZAS LAZARTE', NULL, '2006-06-11', 'varon', NULL, '72353004', 'AV. AL VALLE ENTRE C/9 # 25', '12900853-OR', 'ESCOLAR', 'ELIZABETH LAZARTE', NULL, '72353004', 'jhulisa.cabezas', '$2y$10$3t3WznvTmkylku.2KjOdLep8hHBJWZ0hL3poLbJyV385vnuBb8uhK', NULL, '2018-07-14 19:01:12', '2018-07-14 19:01:12', NULL),
(160, 'SEBASTIAN', 'GARNICA KAUHT', NULL, '2005-10-25', 'varon', NULL, '67226742', '6 DE OCTUBRE SANTA CRUZ Y VASQUEZ', '7413466-OR', 'ESCOLAR', 'IVAN GARNICA', NULL, '72459008', 'sebastian.garnica', '$2y$10$upM9KtXkA12pGSj9czPOP.3aoneAjRTYxzn3MWflv1PcWdpJ2a6zy', NULL, '2018-07-14 19:03:54', '2018-07-14 19:03:54', NULL),
(161, 'ANGIE CELESTE', 'ZACONETA HUACARA', NULL, '2006-08-09', 'mujer', NULL, '69569754', 'SAN JOSE # 1 AV. DEL MINERO', '13857109-OR', 'ESCOLAR', 'NERY ZACONETA', NULL, '78611302', 'angie.zaconeta', '$2y$10$xiXJhfoLsaYwM1UknKHCQuaEUgidp6PVLUQyymGloCxOj3Ibn/mBS', NULL, '2018-07-14 19:09:02', '2018-07-14 19:09:02', NULL),
(162, 'BENJAMIN LUCAS', 'RAMOS MEDINA', NULL, '2007-11-11', 'varon', NULL, '79415408', 'AV. AMERICA # 2', '13188837-OR', 'ESCOLAR', 'LINA DE RAMOS', NULL, '72478414', 'benjamin.ramos', '$2y$10$2ncocmnBgs6/IRJdfX/2TOF5QKP49BzC/.zAvhJA5dd7vldUz2UG6', NULL, '2018-07-14 19:11:34', '2018-07-14 19:11:34', NULL),
(163, 'ROMMEL', 'ROJAS IRIARTE', 'ladi.cito@hotmail.com', '2001-08-11', 'varon', NULL, '68313510', 'LA PLATA Nº 5166 LEON', '7332403-OR', 'ESCOLAR', 'CARMEN IRIARTE', NULL, '68313510', 'rommel.rojas', '$2y$10$CCs59faEzeNkBQYRcpIJmuA8/2sP.pNQeoqUs6UQD2bh/up.baecG', NULL, '2018-07-14 19:14:57', '2018-07-14 19:14:57', NULL),
(164, 'ADRIANA BELEN', 'CACERES COLQUE', NULL, '2003-07-16', 'mujer', '52-61892', '72477166', 'AV. ESPAÑA Nº 1517', '7336263-OR', 'ESCOLAR', 'EVA CASTRO', NULL, '72477166', 'adriana.caceres', '$2y$10$g2tn53yuIq7Hzhiefq5ZkO8ZYljkeJBVPeihJSOCKFU/o1wKBHsGK', NULL, '2018-07-16 16:18:54', '2018-07-16 16:18:54', NULL),
(165, 'ROBERT ANDRES', 'MIRANDA ARIAS', 'robbymiranda401@gmail.com', '2002-04-19', 'varon', '52-56122', '69587727', 'TOMAS FRIAS IQUIQUE Nº 572', '13157086-OR', 'ESCOLAR', 'ROBERT MIRANDA', NULL, '77154366', 'robert.miranda', '$2y$10$Oia/f1vMt6zgwhFMMFowS.NA9l7JZVk38EHDT7juqDUA7.tPhwjgC', NULL, '2018-07-16 16:23:16', '2018-07-16 16:23:16', NULL),
(166, 'ANDREA KAREN', 'ORTIZ DIAZ', NULL, '2001-06-23', 'mujer', '52-77525', '60406302', 'PDTE. MONTES # 6375 Y MURGUIA', '12900851-OR', 'ESCOLAR', 'ANTONIETA DIAZ', NULL, '7383500', 'andrea.ortiz', '$2y$10$Ucq4re8q5LpFuUiQwvl8QuYOJTbLVDg.QaYJwJfFcZ3F1Esh4rtFK', NULL, '2018-07-16 16:26:42', '2018-07-16 16:26:42', NULL),
(167, 'JOSUE RODRIGO', 'APAZA PARDO', NULL, '2001-07-25', 'varon', '52-80527', '68317152', 'LIZARAZU # 125 VELASCO Y CATACORA', '7404807-OR', 'ESCOLAR', 'LUZ PARDO', NULL, '71100355', 'josue.apaza', '$2y$10$IncOsa/9hplGT3c9ktty/O1wjpmG79k8bAnSN3z4Si5SgY6fvePwS', NULL, '2018-07-16 16:29:33', '2018-07-16 16:29:33', NULL),
(168, 'LAURA IVON', 'GARNICA KAUHT', NULL, '2003-05-29', 'mujer', NULL, '72462885', '6 DE OCTUBRE SANTA CRUZ Y VASQUEZ', '7413467-OR', 'ESCOLAR', 'IVAN GARNICA', NULL, '72459008', 'laura.garnica', '$2y$10$PwMnW5RI0txXELMycRZn/eYXLxjN975EbnNQSwAToHiveZ4w13m72', NULL, '2018-07-16 16:37:18', '2018-07-16 16:37:18', NULL),
(169, 'VLADIMIR', 'CAYOJA CHURA', NULL, '1995-12-01', 'varon', '52-55691', '69576958', 'AV. ESPAÑA # 7236 Y SORIA GALVARRO', '7404783-OR', 'UNIVERSITARIO', 'MAMA', NULL, '71108803', 'cayoja.chura', '$2y$10$njRXncjSUlXlZvrbRONpPOMwYWCj/HgeaUOA6yRJyhNDoVuUSQyAu', NULL, '2018-07-16 16:54:41', '2018-07-16 16:54:41', NULL),
(170, 'DIANA ALEJANDRA', 'LAFUENTE JAUREGUI', 'di_lafuente@hotmail.com', '1997-05-18', 'mujer', '52-51387', '71843331', 'PETOT # 1197 CBBA. Y CARO', '4079697-OR', 'UNIVERSITARIA', 'MONICA JAUREGUI', NULL, '72327993', 'diana.lafuente', '$2y$10$yapphI9flaQG6ChOqjGh4OyA3A18Axh9gGms5ZFPEtWuGzAXSR1QW', NULL, '2018-07-16 16:58:51', '2018-07-16 16:58:51', NULL),
(171, 'BELEN', 'LEYTON SILES', 'belencita.4leyton@gmail.com', '1998-03-03', 'mujer', '52-81749', '65432032', 'ALDANA POTOSI Y PAGADOR', '7293883-OR', 'UNIVERSITARIA', 'ANGEL MORANTE', NULL, '67211445', 'belen.leyton', '$2y$10$Rkjz4czIELWOiwgSNgTZ6exXBZT//29Dke/iDj/PRN6I0HlZQutRC', NULL, '2018-07-16 17:03:28', '2018-07-16 17:03:28', NULL),
(172, 'CLAUDIA ESTEFANI', 'CARREÑO CALLE', 'carreclaud@gmail.com', '1996-04-22', 'mujer', '52-56680', '75718028', 'PAGADOR # 2214 Y ARCE', '7405759-OR', 'UNIVERSITARIA', 'ANGELICA CALLE LOPEZ', NULL, '71884249', 'claudia.carreño', '$2y$10$2pZY3MxJ3qgRjqpgcxj48uF3wqzrmyTf512CRfOykiiaXKoUah7Aq', NULL, '2018-07-16 17:08:13', '2018-07-16 17:08:13', NULL),
(173, 'ALIZON ASLEY', 'ORTIZ ZUBIETA', 'alizonasleyortizzubieta@gmail.com', '1995-09-07', 'mujer', '52-10417', '60422301', 'CAP. BARRIGA KENEDY Y VICUÑA', '12399628-OR', 'UNIVERSITARIA', 'MIRIAM ZUBIETA VIZA', NULL, '77145880', 'alizon.ortiz', '$2y$10$iZqV27fjmL7w/hZVB.eOJusmp.bZjSBbBJIAQYqUqfT6U9VkBiVam', NULL, '2018-07-16 17:12:37', '2018-07-16 17:12:37', NULL),
(174, 'DIEGO EDGAR', 'QUISPE GIL', 'bimax.tugefa@gmail.com', '1999-10-22', 'varon', '52-61540', '70417720', 'PEDRO FERRARI Y PASAJE ACHA', '5720718-OR', 'UNIVERSITARIO', 'DANITZA QUISPE', NULL, '70432047', 'diego.quispe', '$2y$10$az9nJ0V6P4E38ob9dr15du4RJMqbrR..gQkfHcME5dxOjmsvSpKTK', NULL, '2018-07-16 17:16:33', '2018-07-16 17:16:33', NULL),
(175, 'ANDREA', 'FELIPE GERONIMO', 'andreitaf459@gmail.com', '1993-06-23', 'mujer', '52-47306', '76147404', 'AV. AL VALLE CALLE 2', '7290567-OR', 'UNIVERSITARIA', 'MARGARITA GERONIMO', NULL, '72491108', 'andrea.felipe', '$2y$10$kuIRrdZPpl0zs4a8eeFcG.kwub8PzhyOV1eAMFr4ie2ql3oYLBbBq', NULL, '2018-07-16 17:19:31', '2018-07-16 17:19:31', NULL),
(176, 'ROMINA ALEJANDRA', 'LOPEZ CONDORI', 'romicielo07@gmail.com', '1998-05-21', 'mujer', '52-12239', '75409274', 'TACNA AROMA B', '5568261-PT', 'UNIVERSITARIA', 'JUDITH', NULL, '71853912', 'romina.lopez', '$2y$10$6avw8cV4JyyWTUDdZUu8ZO4tVaZPUfIPvOiy75h2LGNSXICiiOxT.', NULL, '2018-07-16 17:23:15', '2018-07-16 17:23:15', NULL),
(177, 'MARILUZ', 'CHAVEZ GUZMAN', 'luz.17cg@gmail.com', '1993-05-23', 'mujer', '52-73841', '76159424', 'PSAJE. JAEN # 227', '7289199-OR', 'PROFESIONAL', 'ALEJANDRINA GUZMAN', NULL, '71182712', 'mariluz.chavez', '$2y$10$8nfe0Gqrfmd8YxXOHA1fJu/KNf9dPCP.h1yTiZLnZGnqyBh9Buvd6', NULL, '2018-07-16 17:26:30', '2018-07-16 17:26:30', NULL),
(178, 'JHOSELIN SDENKA', 'VERA RAMIREZ', NULL, '1999-10-08', 'mujer', '52-87663', '69586571', 'AV. CIRCUNVALACION Y JUANCITO PINTO', '12773163-OR', 'UNIVERSITARIA', 'ERIKA RAMIREZ', NULL, '61824327', 'jhoselin.vera', '$2y$10$f4NMXazLsuW7HLrYZoefEOPeXJF2dALmTpamyaR7Bs.9Bf/y6D/NG', NULL, '2018-07-16 17:30:07', '2018-07-16 17:30:07', NULL),
(179, 'VERONICA', 'ROSALES DEL CALLEJO', NULL, '1981-08-03', 'mujer', '52-87610', '72497890', 'CAMACHO # 1525 Y AYACUCHO', '4052170-OR', 'PROFESIONAL', 'NICOLE CALDERON', NULL, '69593515', 'veronica.rosales', '$2y$10$T9m86wOPthb6GNP2Z.1TeuZVaqK8.zJBHg.kW3EiLnE.9whDTtMYm', NULL, '2018-07-16 17:33:04', '2018-07-16 17:33:04', NULL),
(180, 'JACQUELINE ROMANE', 'VEGA MARDONES', NULL, '1979-05-25', 'mujer', '52-46059', '72457778', 'SORIA GALVARRO Nº 4921 BELZU Y AROMA', '3520394-OR', 'PROFESIONAL', 'GRACIELA VEGA MARDONES', NULL, '69586770', 'jacqueline.vega', '$2y$10$JWviSoCevy9bow071srq3.6C6XKbZtiY3cMDovmVKyWuekcOTBQRG', NULL, '2018-07-16 17:35:48', '2018-07-16 17:35:48', NULL),
(181, 'LUIS ANDRES', 'ZAMORA BARRIENTOS', NULL, '1998-03-26', 'varon', '52-55501', '79427639', 'RODRIGUEZ LAPAZ Y 6 DE OCTUBRE', '5068391-OR', 'UNIVERSITARIO', 'INGRID BARRIENTOS', NULL, '69848303', 'luis.zamora', '$2y$10$mASykxZvM1/l4WaT3fS.fO6VmL5ssdKU7Qeo6Idd9zUcWhbWfrxpq', NULL, '2018-07-16 17:38:13', '2018-07-16 17:38:13', NULL),
(182, 'WARA SOFIA', 'MAMANI CONDORI', NULL, '1995-04-26', 'mujer', NULL, '79320402', 'JUNIN 6 DE AGOSTO Y BACKOVIC', '10572388-PT', 'UNIVERSITARIA', 'LEONARDA CONDORI', NULL, '71157715', 'wara.mamani', '$2y$10$kc8v0vMJnFirZSx1dde2IeYBkfzw2ge5CQsPrw8/eD7wXNEST6SOi', NULL, '2018-07-16 17:40:35', '2018-07-16 17:40:35', NULL),
(183, 'LUIS MIGUEL', 'MAMANI CHOQUE', 'miguel-luis-miguel@hotmail.com', '1995-11-03', 'varon', NULL, '70427729', 'BARRIO ENAF ZONA NORTE ZACONETA # 20', '7361824-OR', 'otro', 'JUANA CHOQUE', NULL, '76144156', 'luis.mamani', '$2y$10$xihJreMS2Z7g96/BakL9qeut5sL3pnRbd5IApIIcX7HGuczdVGw0.', NULL, '2018-07-16 17:43:48', '2018-07-16 17:43:48', NULL),
(184, 'ABDEL ROLANDO', 'CHUGAR PEREZ', 'jchugar@hotmail.com', '2011-08-27', 'varon', '52-30618', '72331843', 'CORNETA MAMANI # 2314 BARRIENTOS', '14670273-OR', 'ESCOLAR', 'KARINA PEREZ', NULL, '72487360', 'abdel.chugar', '$2y$10$Xzx9xhrkejpP42j83HbgiOeNnJmp5hezZgxikgElDJjSJb2uvnsw.', NULL, '2018-07-16 17:46:45', '2018-07-16 17:46:45', NULL),
(185, 'LEONEL REYNALDO', 'FLORES CALLE', NULL, '1999-04-13', 'varon', NULL, '71883883', 'AV. TUPAK KATARI Y AUGUSTO BELTRAN # 3900', '7383271-OR', 'otro', 'IRENE CALLE BAUTISTA', NULL, '73597575', 'leonel.flores', '$2y$10$TJ6pylGCQoAkz/S4KfHYU.hGflRcHX1O8HdBn5R0yiLi6fa0NxGRq', NULL, '2018-07-16 17:50:31', '2018-07-16 17:50:31', NULL),
(186, 'ROSEMARY', 'VILLCA MAMANI', 'rous_villca@gmail.com', '1992-10-02', 'mujer', NULL, '75705319', 'AROMA B Y TEJERINA', '7294339-OR', 'UNIVERSITARIA', 'JHAQUELIN VILLCA', NULL, '72320868', 'rosemary.villca', '$2y$10$k9KVr.2ml4P.lOc8nntk8.1JE.dYId173pmunbApzdIi1YbR.zZYm', NULL, '2018-07-16 17:53:47', '2018-07-16 17:53:47', NULL),
(187, 'DARROW CRISTHIAN', 'VELIZ VASQUEZ', NULL, '2007-04-22', 'varon', '52-35574', '75424467', 'ZONA KANTUTA CALLE 9 ENTRE B Y C', '7345780-OR', 'ESCOLAR', 'ROSALIA VASQUEZ', NULL, '75424467', 'darrow.veliz', '$2y$10$Cd/0wfFZAGSaQ1dRA09UXe1KAVWtkG.HnxSqUa2BSqL1y0cQxQSF6', NULL, '2018-07-16 17:56:45', '2018-07-16 17:56:45', NULL),
(188, 'HUGO ARIEL', 'BILBAO MAMANI', NULL, '2001-09-05', 'varon', '52-77741', '61835500', 'AV. EJERCITO ESQ. MAGALLANES # 1090', '7384915-OR', 'ESCOLAR', 'MARIA MAMANI', NULL, '71105241', 'hugo.bilbao', '$2y$10$p3boA9w5jvzkPI943HdWZevxmqpEpCbTOffyK5UUcawInvcqagXQm', NULL, '2018-07-16 18:00:33', '2018-07-16 18:00:33', NULL),
(189, 'IBETH IBERIA', 'VIZA MAMANI', NULL, '1992-12-17', 'mujer', NULL, '68316841', 'CALLE SAN CRISTOBAL # 18 ZONA SUD', '9944394-LPZ', 'OTRO', 'FRUCTUOSO VIZA', NULL, '68111878', 'ibeth.viza', '$2y$10$vxx9ju0IqmBWFPoVaDxuju8ZBeYtQX0Z7OF0yAhD5layJwnim9.Xe', NULL, '2018-07-16 18:03:25', '2018-07-16 18:03:25', NULL),
(190, 'KATTERIN JHOSSET', 'MUÑOZ RAMOS', NULL, '1994-11-07', 'mujer', '52-54584', '61819081', 'AV. VELASCO GALVARRO  AMERICA Y COLON # 7433', '7263716-OR', 'UNIVERSITARIA', 'SONIA RAMOS', NULL, '77142255', 'katterin.muñoz', '$2y$10$LckpKi4Ca8E06CcUD5xcTObkBazAlctJjUNFxYXJuIto1JVPpxMca', NULL, '2018-07-16 18:07:04', '2018-07-16 18:07:04', NULL),
(191, 'LUIS FERNANDO', 'HUANCA MACEDO', NULL, '1995-10-09', 'varon', '52-45934', '70432201', 'CHANCADORA # 3', '7451963-OR', 'UNIVERSITARIO', 'SANDRA MACEDO', NULL, '70420728', 'luis.huanca', '$2y$10$7X5CDTltyFYdFpyR18c45OJKMJ8qB5NyIATZzaYNrb3u504FWANia', NULL, '2018-07-16 18:12:33', '2018-07-16 18:12:33', NULL),
(192, 'ADOLFO JUAN', 'SANCHEZ PEÑAFIEL', NULL, '2003-12-24', 'varon', '52-81878', '78610287', 'PAGADOR JUNIN Y AYACUCHO # 1841', '7268176-OR', 'ESCOLAR', 'MARLEN PEÑAFIEL', NULL, '72470473', 'adolfo.sanchez', '$2y$10$AVps0nxFEDVRR7UNygWAmO.aC919x6vBINU.O6wHnte8aCwdhzxRW', NULL, '2018-07-16 18:17:50', '2018-07-16 18:17:50', NULL),
(193, 'IVANA', 'ANTEZANA ROCABADO', NULL, '2002-11-08', 'mujer', '52-78822', '72345976', 'COCHABAMBA # 152', '7362560-OR', 'ESCOLAR', 'ZULEMA ROCABADO', NULL, '72492028', 'ivana.antezana', '$2y$10$LR1ldMwnr.8rCBTibDv7YucyKYuEAI6cc6bWP03E0aaZt1NU6pdrO', NULL, '2018-07-16 18:20:13', '2018-07-16 18:20:13', NULL),
(194, 'ENRIQUE', 'ANTEZANA ROCABADO', NULL, '2004-06-22', 'varon', '52-78822', '72303642', 'COCHABAMBA # 152', '7362561-OR', 'ESCOLAR', 'ZULEMA ROCABADO', NULL, '72492028', 'enrique.antezana', '$2y$10$tA70JbRVd.HgsmsjDHAVgOA323SresZL3QF22gJN4FHoJ3HcfxJgm', NULL, '2018-07-16 18:22:16', '2018-07-16 18:22:16', NULL),
(195, 'ALEXANDER', 'VASQUEZ MACIAS', NULL, '2003-07-22', 'varon', '52-12659', '74250115', 'TARAPACA ENTRE G Y H', '7367860-OR', 'ESCOLAR', 'LOURDES MACIAS', NULL, '74250115', 'alexander.vasquez', '$2y$10$ksOj1z4lEjhOiD5k/X/k7OdKUKUcjm02Mx9QdxjH2yzAxiKX2mCtm', NULL, '2018-07-16 18:24:21', '2018-07-16 18:24:21', NULL),
(196, 'DANIEL JONATHAN', 'TORREZ CENTELLAS', NULL, '1990-01-15', 'varon', '52-34187', '78606116', 'AV. VILLARROEL F. BALLON # 17', '7288732-OR', 'UNIVERSITARIO', 'ADELAIDA CENTELLAS', NULL, '73844277', 'daniel.torrez', '$2y$10$gIGgbACnEYcDAhAvN0FLp.l/OLLr5Uzqsx5q8XRYvAHsj24yQ3d/y', NULL, '2018-07-16 18:26:23', '2018-07-16 18:26:23', NULL),
(197, 'GIOVANNA KARINA', 'MORALES VENEROS', 'gmoralesv@gmail.com', '1975-07-10', 'mujer', '52-40288', '72488802', 'BARRIO SAN JOSE # 139', '3531102-OR', 'PROFESIONAL', 'REINA MORALES', '52-40288', NULL, 'giovanna.morales', '$2y$10$1cpTJU7U76BTvcdvSRgv1eupq1mQOHMyjzyU4kKuxQdSUS4ktbflG', NULL, '2018-07-16 18:29:09', '2018-07-16 18:29:09', NULL),
(198, 'MARIA RENEE', 'ALANIZ ALANIZ', NULL, '2005-07-10', 'mujer', '52-45995', '77728567', 'BARRIO JARDIN C-2', '12645379-OR', 'ESCOLAR', 'SIMONE ALANIS', NULL, '77728567', 'maria.alaniz', '$2y$10$hIj5AulFPTXhiVuu.oXoVe8HGC3GrbHrRqGeYxeg3McfCCry.8WYW', NULL, '2018-07-16 18:31:44', '2018-07-16 18:31:44', NULL),
(199, 'PAOLA ANDREA', 'MOLLINEDO RODRIGUEZ', NULL, '1984-11-29', 'mujer', NULL, '60411937', 'SAN FELIPE # 418 TARIJA', '3526105-OR', 'OTRO', 'LUZ RODRIGUEZ', NULL, '72305070', 'paola.mollinedo', '$2y$10$lzi8vzm9Z0Rkstl/O.cCCOtY/YU1TyB.lwABijjD18nI9W/SzkZ8u', NULL, '2018-07-16 18:34:21', '2018-07-16 18:34:21', NULL),
(200, 'JORGE JOSE', 'LIA HUAYLLAS', NULL, '1976-10-31', 'varon', NULL, '67107755', 'JAEN # 153 Y BRASIL', '3541758-OR', 'PROFESIONAL', 'PAOLA LIA', NULL, '60429599', 'jorge.lia', '$2y$10$0/IWCrLax.P5o91yxkbLz.mAfI4a58dd64k6kQf6L8fdwCQgY.1Zu', NULL, '2018-07-16 18:36:46', '2018-07-16 18:36:46', NULL),
(201, 'VANIA LIZZETH', 'CABRERA CAYO', NULL, '1997-06-07', 'mujer', NULL, '74108411', 'BACOVICK LIRA Y OBLITAS', '7266305-OR', 'UNIVERSITARIA', 'MARIA CAYO', NULL, '72300081', 'vania.cabrera', '$2y$10$UbV2losNJ4qEkkKDyC4o7.oD7pKjyNizFQznbdz9ehV/lCK2HJHrm', NULL, '2018-07-16 18:39:28', '2018-07-16 18:39:28', NULL),
(202, 'JORGE ANDRES', 'VILLARROEL PADILLA', 'jorge.avp.97@gmail.com', '0000-00-00', 'varon', '52-52008', '68517300', 'LA PLATA ADOLFO MIER Y JUNIN', '7341659-OR', 'UNIVERSITARIO', 'JORGE VILLARROEL', NULL, '72450300', 'jorge.villarroel', '$2y$10$yWaXtAzWC5Ni8I6UtG9.n.xjbwQ4z7tASuTTB2lCje3ECsIt/xC6u', NULL, '2018-07-16 18:42:20', '2018-07-16 18:42:20', NULL),
(203, 'CARLOS MARTIN', 'OROSCO FLORES', NULL, '1996-10-28', 'varon', '52-35297', '65434967', 'FRANCISCO FAJARDO # 90 ZONA NORTE', '12429759-OR', 'UNIVERSITARIO', 'MARTIN OROSCO', NULL, '71888755', 'carlos.orosco', '$2y$10$udIYCdT9qpmp7p6V4Cf4o.iJj5Q1Y1EugARN0CD5eRc5bFNSCBeCO', NULL, '2018-07-16 18:44:48', '2018-07-16 18:44:48', NULL),
(204, 'JOSE LUIS', 'TAPIA RAMIREZ', NULL, '2010-04-29', 'varon', NULL, '74673973', 'CARO # 169 BACKOVIC Y 6 DE AGOSTO', '13061461-OR', 'ESCOLAR', 'PAPA', NULL, '70023792', 'jose.tapia', '$2y$10$1sHalJMWrTQ.mJKMeSAwz.0sN5EbD2y68cAzyI.AUqPnAuydefyfW', NULL, '2018-07-16 18:47:01', '2018-07-16 18:47:01', NULL),
(205, 'JONATHAN CIRO', 'SOLIZ FLORES', 'raiojana_1@icloud.com', '1991-12-09', 'varon', '52-43934', '60418964', 'LA PAZ GRAL. CARRASCO', '3522870-OR', 'OTRO', 'PAOLA SOLIZ FLORES', NULL, '6721798', 'jonathan.soliz', '$2y$10$7LmGlaNn/zHpp1OwGNp.P.sQVTpje8tZTQwMUXJ0uEzceTHy78FK.', NULL, '2018-07-16 18:50:26', '2018-07-16 18:50:26', NULL),
(206, 'MABEL LEONOR', 'MOYA JUANIQUINA', 'mabelodessa@hotmail.com', '1969-09-11', 'mujer', '52-57111', '72481010', 'URB. CORDEOR', '3109677-OR', 'PROFESIONAL', 'OSCAR', NULL, '71100000', 'mabel.moya', '$2y$10$ow13lpBlCL0pWgWegymShOfos601CVCIT7mCUKivUGT/2kl/vAgVi', NULL, '2018-07-16 18:58:45', '2018-07-16 18:58:45', NULL),
(207, 'SHARON ALEXANDRA', 'VILLARROEL GUARACHI', 'shaelex.777@gmail.com', '1992-11-10', 'mujer', '52-71391', '71181731', 'HERRERA # 128 6 DE AGOSTO', '7314568-OR', 'PROFESIOANAL', 'RAMIRO VILLARROEL', NULL, '71103793', 'sharon.villarroel', '$2y$10$/fEOxGdAVTKvmlm4JK8h1.xCzvXAsEKuBVhHMlEuy6OY7ybFXUfvW', NULL, '2018-07-16 19:02:36', '2018-07-16 19:02:36', NULL),
(208, 'YHAMIL VICTOR HUGO', 'COCA AGUILERA', '', '1994-07-06', 'varon', '52-87803', '79410118', 'ALDANA # 1909 LA PLATA', '7408894-OR', 'PROFESIONAL', 'PATRICIA AGUILERA', NULL, '72463043', 'yhamil.coca', '$2y$10$hSCk/a7MxfM.rkf.YqyQR.oTCXNfaoFYmQFOPjwWacwVdczwn6FLe', NULL, '2018-07-16 19:06:38', '2018-07-16 19:06:38', NULL),
(209, 'GREGORITH WASKAR', 'GOMEZ ROCHA', NULL, '2002-01-17', 'varon', '52-35535', '78600716', 'PRESIDENTE MONTES LEON Y RODRIGUEZ', '5763599-OR', 'ESCOLAR', 'CLAUDIA ROCHA', NULL, '73713708', 'gregorith.gomez', '$2y$10$Y957jpiP2Ng21dhoKU4M0uv644YtageCbTKg7NZrHehSujchchnS6', NULL, '2018-07-16 19:09:40', '2018-07-16 19:09:40', NULL),
(210, 'ROSA DIANA', 'ROMERO GALARZA', NULL, '2000-06-10', 'mujer', NULL, '69590998', 'PAGADOR RODRIGUEZ Y LEON', '7406126-OR', 'UNIVERSITARIA', 'MAYRA ROMERO', NULL, '72355801', 'rosa.romero', '$2y$10$eGirGg8jYeBGv1xwMLMjEuVwtE/eqC0gRFanQsa1rBoliiegHFh/O', NULL, '2018-07-16 19:11:45', '2018-07-16 19:11:45', NULL),
(211, 'WENDY JHULITZA', 'PAÑUNI MAMANI', NULL, '2000-02-12', 'mujer', NULL, '68357926', 'PLAN 500 ZONA F', '7354541-OR', 'UNIVERSITARIA', 'PEDRO PAÑUNI', NULL, '72399334', 'wendy.pañuni', '$2y$10$3imQC1C4xQPKFfjQRJxs9Oa9MspmqiIF2.SG5PONm3wAQCDSOfOxm', NULL, '2018-07-17 16:19:35', '2018-07-17 16:19:35', NULL),
(212, 'ALVARO DIEGO', 'FLORES CHAVEZ', NULL, '2008-08-22', 'varon', '52-73193', '72312027', 'CALLE PSJE. 1 # 65 LIRA Y 6 DE AGOSTO', '12709077-OR', 'ESCOLAR', 'DIEGO', NULL, '72312027', 'alvaro.flores', '$2y$10$HyFqNaax76PYBdw8va9hZ.Dc36D7Z8q6tS99k9.mZWfe6xmxI4Era', NULL, '2018-07-17 16:24:45', '2018-07-17 16:24:45', NULL),
(213, 'REBECA SARA', 'MIRANDA PEÑA', 'rebeca_15992@hotmail.com', '1990-03-14', 'mujer', NULL, '73818507', 'BRASIL Y TOMAS FRIAS', '8018407-CBBA', 'UNIVERSITARIA', 'GODOFREDO MIRANDA', NULL, '72340286', 'rebeca.miranda', '$2y$10$T5VQmV2/HYRGL.8X4/FJsOI2V4kPEdiuUnL9lDCh1rvH7Fz0ByKHy', NULL, '2018-07-17 16:27:34', '2018-07-17 16:27:34', NULL),
(214, 'CRISTINA', 'HERBAS CHOQUE', '', '1980-11-10', 'mujer', NULL, '78600657', 'AV. VILLARROEL # 4', '5350714-SCZ', 'OTRO', 'PAOLA ANDREA KUSSY HERBAS', NULL, '76229469', 'cristina.herbas', '$2y$10$.hqYC0GgOmTPwixJR6EPZ.mXl0YzS0.QSEX41wLw49MjjhzzHYuCW', NULL, '2018-07-17 16:36:09', '2018-07-17 16:36:09', NULL),
(215, 'JUAN JOSE', 'VILLALOBOS SANCHEZ', 'lobo-juanjo2010@hotmail.com', '1998-11-18', 'varon', NULL, '74107003', 'AV. MARIA NUÑEZ DEL PRADO ENTRE PSJE. 2', '7314815-OR', 'OTRO', 'JUANA SANCHEZ', NULL, '68304690', 'juan.villalobos', '$2y$10$sRviQfsLWYHiY61UbA.tre7w8CIL8JfGNvFOVa0t1UJrFbm2tdjiO', NULL, '2018-07-17 16:40:30', '2018-07-17 16:40:30', NULL),
(216, 'JONATHAN', 'CARATA OROPEZA', NULL, '1990-11-13', 'varon', NULL, '60439426', 'FINAL 6 DE AGOSTO CALLE F', '5728864-OR', 'OTRO', 'RONALD', NULL, '78603046', 'jonathan.carata', '$2y$10$KCT58K/pfczFGsrV3bngHOy2CC1rjsJm5dMByeEQDiRPcAWZtLe.e', NULL, '2018-07-17 16:42:32', '2018-07-17 16:42:32', NULL),
(217, 'RAUL', 'BLANCO DIEGO', NULL, '1988-01-30', 'varon', NULL, '74242245', 'BARRIO SEBASTIAN PAGADOR', '5746807-OR', 'UNIVERSITARIO', 'VILMA CASTILLO', NULL, '71848685', 'raul.blanco', '$2y$10$l43I9yDCzLACAmyuXJ0v0.1ObuSFa1BOHyqgif/tHzb6ho95jNmCG', NULL, '2018-07-17 16:46:41', '2018-07-17 16:46:41', NULL),
(218, 'LEONARDO JOSUE', 'GOMEZ TICONA', NULL, '2008-10-05', 'varon', '52-56038', '70438804', 'HERRERA', '13858811-OR', 'ESCOLAR', 'MAMA', NULL, '70438804', 'leonardo.gomez', '$2y$10$oNyAXRP5AKPbjuPDM67QDeYYkW78MGauVGm7K2Grb1rCdRL6uBWxi', NULL, '2018-07-17 16:57:08', '2018-07-17 16:57:08', NULL),
(219, 'ALEJANDRO', 'DAGA CÁMARA', NULL, '2010-01-11', 'varon', '52-11247', '71103672', 'VILLARROEL # 176 Y BACKOVIC', '7450691-OR', 'ESCOLAR', 'MERCEDES CAMARA', NULL, '71103672', 'alejandro.daga', '$2y$10$IXlQWpHXCW5JwBct/9IO6.G6mK8ClRHeJCFjjBY0iHuQ94ZK.0gsi', NULL, '2018-07-17 17:00:21', '2018-07-17 17:00:21', NULL),
(220, 'NATALIA', 'TORREZ ORDOÑEZ', 'isajho.97@gmail.com', '2003-01-28', 'mujer', NULL, '68452482', 'LA PLATA CBBA Y CARO', '10465280-PT', 'ESCOLAR', 'JHOSSELYN TORREZ', NULL, '68452482', 'natalia.torrez', '$2y$10$aTzaaYDQjT4fzIbYhV7/PuFm4PUdMEm5w4KYKoEfq57GIED/f.WpG', NULL, '2018-07-17 17:06:22', '2018-07-17 17:06:22', NULL),
(221, 'YADIRA FERNANDA', 'MIMOR BUENO', NULL, '2004-12-30', 'mujer', '52-78513', '76200150', 'TEJERINA HERRERA Y 1º DE NOVIEMBRE', '14963769-OR', 'ESCOLAR', 'MARLENY BUENO PEREZ', NULL, '70419639', 'yadira.mimor', '$2y$10$FJiBuIynv0PqiV1Ut2N58evgAv6gy0z9PtfrbKIDe7UNLKktcBk8.', NULL, '2018-07-17 17:09:25', '2018-07-17 17:09:25', NULL),
(222, 'MANFRED LEONARDO', 'BAPTISTA OPORTO', NULL, '2004-01-19', 'varon', NULL, '71512008', 'BRASIL Y AYACUCHO # 344', '13284626-OR', 'ESCOLAR', 'DORA OPORTO', NULL, '74149291', 'manfred.baptista', '$2y$10$Kfit6/7gGdW9M/nIbn592.G25rab7XPfEgaVocez4vE4hN1ns5hLa', NULL, '2018-07-17 17:12:18', '2018-07-17 17:12:18', NULL),
(223, 'YANINA TATIANA', 'CHOQUE MENDEZ', NULL, '2002-01-14', 'mujer', NULL, '74474946', 'SAN FELIPE # 280', '12901024-OR', 'ESCOLAR', 'TATIANA MENDEZ', NULL, '67262284', 'yanina.choque', '$2y$10$7pfqRuAdrDQ4JNRt3N0fM.t/gtmF2BPvGoXuq0zkfTQ4WBTe.tHQO', NULL, '2018-07-17 17:16:45', '2018-07-17 17:16:45', NULL),
(224, 'CHINGERLLY HELEN', 'CHIRI COPA', NULL, '2003-10-15', 'mujer', '52-70376', '72497497', 'CALLE 8 ENTRE W Y V', '7346337-OR', 'ESCOLAR', 'REBECA COPA', NULL, '68286777', 'chingerlly.chiri', '$2y$10$6oGs8P/6uMbo8JvQK6/0HOHSTiqS6emQaj2s3k2/PDOEt/i9dC41m', NULL, '2018-07-17 17:19:53', '2018-07-17 17:19:53', NULL),
(225, 'ERIKA ANGELICA', 'CAMPOS FLORES', NULL, '2001-01-27', 'mujer', NULL, '60402251', 'CALLE 6 ENTRE CAMPO JORDAN Y E', '7312007-OR', 'ESCOLAR', 'ANA MARIA CAMPOS FLORES', NULL, '71033459', 'erika.campos', '$2y$10$edN620zTZvw556dAIZB/tOz4lrYVjJGRN/m2DBwjr4o9FpMENb.NC', NULL, '2018-07-17 17:27:01', '2018-07-17 17:27:01', NULL),
(226, 'NICOL ALEXANDRA', 'ESPINOZA VEGA', NULL, '2002-07-27', 'mujer', '52-48424', '79413936', 'URB. LA AURORA', '7348082-OR', 'ESCOLAR', 'MAMA', NULL, '71187593', 'nicol.espinoza', '$2y$10$Kua0/SIY88S07hAiFkd1..NrUbYt3qRMlB91NXLl.coTnsdLaxrKG', NULL, '2018-07-17 17:35:36', '2018-07-17 17:35:36', NULL),
(227, 'DANIELA', 'ONOFRE PACO', NULL, '1999-11-11', 'mujer', NULL, '63637721', 'VILLARROEL ENTRE CIRCUNVALACION', '7317718-OR', 'UNIVERSITARIA', 'LUIS ONOFRE PACO', NULL, '63637721', 'daniela.onofre', '$2y$10$nTMWbSUu60.McedJI03koOHJxqOnTdL.SgPbcVWFbvnCjgaPCrG7O', NULL, '2018-07-17 17:50:19', '2018-07-17 17:50:19', NULL),
(228, 'KAREN MELISA', 'ROCHA ALARCON', NULL, '2002-01-08', 'mujer', '52-30348', '69574563', 'GENOVEVA RIOS Y CALATAYUT # 1050', '7322514-OR', 'ESCOLAR', 'CRISTOBAL ROCHA ANCASI', NULL, '71109103', 'karen.rocha', '$2y$10$eFvOYv7UFV0AyMo5OomiPeBPjyS5Clf/kR8NS5WpODI1ghDHE0CQO', NULL, '2018-07-17 17:52:28', '2018-07-17 17:52:28', NULL),
(229, 'JUAN MARCELO', 'FLORES FLORES', NULL, '2002-01-03', 'varon', NULL, '60409998', 'CALLE 8 Y AV. AL VALLE', '7409733-OR', 'ESCOLAR', 'JUAN FLORES BLANCO', NULL, '75703523', 'juan.flores', '$2y$10$nfnMNFB3lPtnZr.Q1uXBG.wEeZ4NvFNbAJb5NMq/eP7d3C709pWxC', NULL, '2018-07-17 17:57:56', '2018-07-17 17:57:56', NULL),
(230, 'LIMBERT EDILSON', 'FLORES FLORES', NULL, '2003-10-19', 'varon', NULL, '75407521', 'CALLE 8 Y AV. AL VALLE', '7409734-OR', 'ESCOLAR', 'JUAN FLORES BLANCO', NULL, '60409998', 'limbert.flores', '$2y$10$yGOGsm/0FR9suRX/6puCzeUxstta7kkJ9LnW5exmWVHu4c02yMIOW', NULL, '2018-07-17 17:59:54', '2018-07-17 17:59:54', NULL),
(231, 'ALEIDA SOFIA', 'SILVA LEDEZMA', 'asofiasilva@hotmail.com', '2002-06-19', 'mujer', '52-84036', '75406682', 'CAMACHO # 1235 AYACUCHO Y COCHABAMBA', '12869233-OR', 'ESCOLAR', 'MAMA', NULL, '60400641', 'aleida.silva', '$2y$10$Dm2KPnLMfcaBmS2iwA2t1uVLrQUYlA6louARnUzOhoCuUtieBxBEq', NULL, '2018-07-17 18:02:21', '2018-07-17 18:02:21', NULL),
(232, 'ANDRES RAMIRO', 'DAGA CAMARA', NULL, '2004-04-14', 'varon', '52-11247', '71103672', 'VILLARROEL # 176 Y BACKOVIC', '7390017-OR', 'ESCOLAR', 'MERCEDES CAMARA', NULL, '71103672', 'andres.daga', '$2y$10$b2kiwl3UWTQ7kjIq3XZq6OfeSIk3jVK4wwYNOBPF6XKO5uKjdgYZe', NULL, '2018-07-17 18:04:18', '2018-07-17 18:04:18', NULL),
(233, 'AYLIN REBECA', 'ENCINAS ENCINAS', NULL, '2001-09-16', 'mujer', NULL, '60401602', 'BARRIO SENAC # 75', '7356796-OR', 'ESCOLAR', 'ELIZABETH ENCINAS', NULL, '60416087', 'aylin.encinas', '$2y$10$93X.1HikiooYwonGgrZ8Ke4VqGSQMOTLSRqm3AxRXtXupvioS9WhS', NULL, '2018-07-17 18:06:20', '2018-07-17 18:06:20', NULL),
(234, 'RUBEN JRTHZEEL', 'CHIRI COPA', NULL, '2009-07-10', 'varon', '52-70376', '72497497', 'CALLE 8 ENTRE W Y V', '13252823-OR', 'ESCOLAR', 'REBECA COPA', NULL, '68286777', 'ruben.chiri', '$2y$10$91qoM1RAQaHOW04kIq02D.iJfwgV6SCmkm/2oQrRSIxiuM67plyHS', NULL, '2018-07-17 18:08:28', '2018-07-17 18:08:28', NULL),
(235, 'ALVARO STIVEN', 'ROCHA CHAMBI', 'cralvarostiven@hotmail.com', '1998-12-30', 'varon', '52-71304', '76125387', 'POTOSI Y 12 DE OCTUBRE', '9076653-LPZ', 'UNIVERSITARIO', 'WILFREDO ROCHA', NULL, '73508702', 'alvaro.rocha', '$2y$10$Sk6rTmZs9H1V24iHfTKbEON9aPSOvxh4kymxo.YTV1ygjD.jAAOYO', NULL, '2018-07-17 18:12:24', '2018-07-17 18:12:24', NULL),
(236, 'ALEX SANDRO', 'ACOSTA', 'axlmorfi@gmail.com', '1978-10-27', 'varon', NULL, '69580555', 'LEON Y TACNA', '5759701-OR', 'PROFESIONAL', 'LIA ACOSTA', NULL, '72305969', 'alex.acosta', '$2y$10$o/nX7xJqBvf3H7DPyxB.1ubSjaj2CI0oND2K92v4ifuZGpsWv9KzK', NULL, '2018-07-17 18:15:00', '2018-07-17 18:15:00', NULL),
(237, 'DEYMAR', 'JANCO CHOQUE', NULL, '2000-11-09', 'varon', NULL, '78609617', 'URB. SANTA ROSA CARRETERA VINTO', '7355478-OR', 'ESCOLAR', 'ZAIDA CHOQUE TUMIRI', NULL, '73841159', 'deymar.janco', '$2y$10$MzohB7PZ8yJBK6wJPkzDJeJEC2O6Kj5Jt9QF7KewvGFCVnu93GxVK', NULL, '2018-07-17 18:16:59', '2018-07-17 18:16:59', NULL),
(238, 'KENIA STEFANY', 'VALDEZ QUIQUE', NULL, '2004-06-30', 'mujer', NULL, '76157511', 'CALLE TARIJA #345 Y 12 DE OCTUBRE', '7855191-SCZ', 'ESCOLAR', 'FELIX', NULL, '76157511', 'kenia.valdez', '$2y$10$weOV2wgPMa7cUoqJKYmw0Ov5NIXYy2WiKMzes/GNtF7SMatAR.CtG', NULL, '2018-07-17 18:20:12', '2018-07-17 18:20:12', NULL),
(239, 'CECILIA DE LOS ANGELES', 'MENDOZA LEDEZMA', NULL, '2004-09-24', 'mujer', '52-75689', '75427206', 'JUNIN Y TEJERINA', '12965038-OR', 'ESCOLAR', 'EVELIN LEDEZMA', NULL, '69600659', 'cecilia.mendoza', '$2y$10$6DS84y0Oj60xLrVJrO/aTuC27SO/sBcirohgx3M2qnjTEPm4UeRXa', NULL, '2018-07-17 18:22:30', '2018-07-17 18:22:30', NULL),
(240, 'IGOR CARLOS', 'ALARCON AYALA', 'igor.alarcon.ayala@gmail.com', '1988-08-05', 'varon', '52-42420', '69583230', 'OBLITAS # 771', '4069872-OR', 'PROFESIONAL', 'VERONICA VALDA', NULL, '70435938', 'igor.alarcon', '$2y$10$VLXkBZR/zBLhdxausN75fe9uGvx5Auj869ZF7kSD29Ii76wDy14JW', NULL, '2018-07-17 18:25:12', '2018-07-17 18:25:12', NULL),
(241, 'DARIO GABRIEL', 'GANTIER ROMANO', NULL, '2004-04-20', 'varon', '52-55936', '72349394', 'SORIA GALVARRO # 5544 CARO Y MONTECINOS', '7351901-OR', 'ESCOLAR', 'GILMA GOMEZ', NULL, '72349394', 'dario.gantier', '$2y$10$6b7fzxg.Nyo/3sMEff/PhuGbsPx/mxDySH5IOJbdUIczZRGSIjJLm', NULL, '2018-07-17 18:27:47', '2018-07-17 18:27:47', NULL),
(242, 'ALEXIA BARBARA', 'GUERRA ESCOBAR', NULL, '2004-09-19', 'mujer', '52-76006', '69592737', 'AV. VILLAZON ENTRE 6 DE AGOSTO', '7263631-OR', 'ESCOLAR', 'ISABEL ESCOBAR', NULL, '73845846', 'alexia.guerra', '$2y$10$6d.HkUx2STYivJyP/I0Pvu12swMlbchB3Z1.5KrWsAICDBX6RuaIu', NULL, '2018-07-17 18:30:26', '2018-07-17 18:30:26', NULL),
(243, 'ALEJANDRO MIGUEL', 'VARGAS AHERN', NULL, '2004-02-10', 'varon', '52-57351', '60408283', 'TARAPACA # 249 LEON', '7358903-OR', 'ESCOLAR', 'LIVIA AHERN', NULL, '60434033', 'alejandro.vargas', '$2y$10$dBmztNGmz5X7ejCOkka6YOkoNc2TEUwEFdo7fitowJ4TOQtYvWWC2', NULL, '2018-07-17 18:33:13', '2018-07-17 18:33:13', NULL),
(244, 'VALERIA ALEJANDRA', 'FERRUFINO MANRIQUE', NULL, '2001-06-25', 'mujer', '52-72173', '69586553', '6 DE OCTUBRE 5625 Y CARO', '7392898-OR', 'ESCOLAR', 'CARMEN MANRIQUE', NULL, '75710073', 'valeria.ferrufino', '$2y$10$NHDvzdWvRzrbMDTQ38jLOubO7ncO7IgBdB3CEOdm5TDCgdnGCYfgy', NULL, '2018-07-17 18:41:11', '2018-07-17 18:41:11', NULL),
(245, 'RAQUEL CAROLINA', 'VILLCA ALARCON', NULL, '1999-12-19', 'mujer', '52-61071', '71109342', 'AV. ESPAÑA ENTRE TOLEDO Y SALAMANCA', '7355076-OR', 'UNIVERSITARIA', 'TORIBIO VILLCA', NULL, '72477614', 'raquel.villca', '$2y$10$Zk4t23OpitNHkxeqNcyhhe/MwKpBClSLamycfhKMjcFR3oKf09OXu', NULL, '2018-07-17 18:43:29', '2018-07-17 18:43:29', NULL),
(246, 'MARIA CRISTINA', 'CHOQUE POCOMANI', NULL, '1985-09-11', 'mujer', '52-62325', '70421941', 'ECUADOR Y COLOMBIA # 70', '3555241-OR', 'UNIVERSITARIA', 'JULIA POCOMANI', NULL, '70434642', 'maria.choque', '$2y$10$L7/L0RUdPYOc8TzeXOO/m.AbnIpI7tjQ.QjES42L80wOsiJe/c/kC', NULL, '2018-07-17 18:46:19', '2018-07-17 18:46:19', NULL),
(247, 'LORINE DARLEM', 'SALAZAR MONTAN', NULL, '2000-12-03', 'mujer', NULL, '78616028', 'FINAL LIRA Y CAMACHO', '6665639-OR', 'OTRO', 'ALAIN SALAZAR', NULL, '75400494', 'lorine.salazar', '$2y$10$XgyhFc3CTCqOmmS7ECVVTewg1Du51zuHnLqJtC34OdrNoUVjOP/Fi', NULL, '2018-07-17 18:49:42', '2018-07-17 18:49:42', NULL),
(248, 'SERGIO', 'SANCHEZ MAMANI', NULL, '2000-03-30', 'varon', '52-58048', '71103687', 'CARO BACKOVIK Y MONTECINOS', '7286906-OR', 'OTRO', 'FLORINDA MAMANI', NULL, '71107046', 'sergio.sanchez', '$2y$10$Ua/uOkyDCWbTXJl88U7nOeckAc4oOdvnCYM0EBCjVZwSrFr5TWDry', NULL, '2018-07-17 18:53:55', '2018-07-17 18:53:55', NULL),
(249, 'JUAN SEBASTIAN', 'ZAMBRANA SANGUEZA', NULL, '2002-08-03', 'varon', '52-49373', '72496310', 'SORIA GALVARRO # 4916 BELZU', '7296216-OR', 'ESCOLAR', 'SANDRA SANGUEZA', NULL, '72496310', 'juan.zambrana', '$2y$10$nCPTWXnjHPxXWaOCqkovn.UTwzd6peiY1TpDoWAY7N9qREoLeCJt6', NULL, '2018-07-17 18:56:19', '2018-07-17 18:56:19', NULL),
(250, 'JHOSEP BRANDON', 'ZOLA RODRIGUEZ', NULL, '2000-10-05', 'varon', '52-73090', '73841245', 'TOCOPILLA # 39 SANTA BARBARA Y JAEN', '7352455-OR', 'ESCOLAR', 'EDDY ZOLA', NULL, '73841245', 'jhosep.zola', '$2y$10$HWpL5wn64QcnDYmstgjHo.nh0lpEZiDtLB3wyTXv/J1ulYgPpqL0u', NULL, '2018-07-17 18:59:48', '2018-07-17 18:59:48', NULL),
(251, 'IVANA MIREYA', 'GUTIERREZ PEÑA', 'mireyitaguti@hotmail.com', '2003-06-18', 'mujer', '52-75971', '67211165', 'LA PAZ ENTRE 1º DE NOVIEMBRE Y TUPIZA', '7287720-OR', 'ESCOLAR', 'WILSON GUTIERREZ', NULL, '71856687', 'ivana.gutierrez', '$2y$10$PblMdiD1JY..W1.EXklWp.yO5bBlSefKNtwYRSL1VamTwh0qv3g6q', NULL, '2018-07-17 21:46:23', '2018-07-17 21:46:23', NULL),
(252, 'GABRIELA MICHELLE', 'CAPURATA AQUINO', NULL, '2000-07-06', 'mujer', '52-71783', '67244439', 'ADOLFO MIER # 1500 Y PERALTA SORUCO', '7377381-OR', 'UNIVERSITARIA', 'JHAQUELINE AQUINO', NULL, '72471600', 'gabriela.capurata', '$2y$10$.GsB9DKJYVE6bUQ2qRHVFOCxFdFAC9VeWC2FIYwdlR/.2ORBDpsoy', NULL, '2018-07-17 21:49:49', '2018-07-17 21:49:49', NULL),
(253, 'NICOLE ARIEL', 'CAPURATA AQUINO', NULL, '1999-01-18', 'mujer', '52-71783', '67217128', 'ADOLFO MIER # 1500 Y PERALTA SORUCO', '7377380-OR', 'UNIVERSITARIA', 'JHAQUELINE AQUINO', NULL, '72471600', 'nicole.capurata', '$2y$10$YgN1OfuDkolKCkOk/E0mBuXPD4jZZSAPqkGdViPiCvbQjC9q0kvwu', NULL, '2018-07-17 21:51:51', '2018-07-17 21:51:51', NULL),
(254, 'NAYELI ITZEL', 'NINA PANIAGUA', NULL, '2004-06-13', 'mujer', '52-32334', '65421471', 'FORTIN BOQUERON Y AV. DEL MAESTRO', '7367494-OR', 'ESCOLAR', 'GUADALUPE PANIAGUA', NULL, '65421471', 'nayeli.nina', '$2y$10$.uEs.PAj6Qwq8ebYzO.bnOoqgz2klWhUI3UxRkSj804BWKAh869lW', NULL, '2018-07-17 21:54:15', '2018-07-17 21:54:15', NULL),
(255, 'MAURA KASSANDRA', 'GARCIA RIOS', NULL, '2003-10-08', 'mujer', '52-58599', '72337927', 'AV. BRASIL # 1951 Y SAN FELIPE', '7362420-OR', 'ESCOLAR', 'YESINA RIOS', NULL, '72327303', 'maura.garcia', '$2y$10$Uy1DDQ8kRWXeZI/BrCbO5eW4wt8av6EhXmddMPJucQarcSEEbXKA2', NULL, '2018-07-17 21:59:24', '2018-07-17 21:59:24', NULL),
(256, 'MAGALY', 'QUISPAYA CONDORI', 'magaly.quispaya@gmail.com', '1994-05-13', 'mujer', '52-60026', '72363081', 'AV. DEHENE # 134 COLON Y VILLAZON', '7288264-OR', 'PROFESIONAL', 'MARIA CONDORI', NULL, '72363081', 'magaly.quispaya', '$2y$10$WBWg8iRlvsP8bVKf0Bg4LeUR8yyE.MN54St0r2FHE1xMmkJKarLA6', NULL, '2018-07-17 22:03:49', '2018-07-17 22:03:49', NULL),
(257, 'ROSARIO', 'LISIDRO QUISPE', NULL, '2009-03-06', 'mujer', '52-49719', '72374421', 'BARRIO JARDIN E-4', '12369918-OR', 'ESCOLAR', 'SOFIA QUISPE', NULL, '72374421', 'rosario.lisidro', '$2y$10$6n9P4a7r4AKXPW.3mkolYe5r5FN5PItCwtNrPI4ZLpiEcJjlEoS5u', NULL, '2018-07-17 22:10:06', '2018-07-17 22:10:06', NULL),
(258, 'DANIEL', 'LISIDRO QUISPE', NULL, '2009-03-06', 'varon', '52-49719', '72374421', 'BARRIO JARDIN E-4', '12369912-OR', 'ESCOLAR', 'SOFIA QUISPE', NULL, '72374421', 'daniel.lisidro', '$2y$10$LLs825pzTEhMeSI2qocU.ez7cpDsmuF1AvT8P/9PcpYzRETSpytmi', NULL, '2018-07-17 22:11:44', '2018-07-17 22:11:44', NULL),
(259, 'FRANCO EZEQUIEL', 'MURILLO MANCILLA', NULL, '2008-05-01', 'varon', '52-42375', '74121090', 'BACKOVIC # 466', '13984360-OR', 'ESCOLAR', 'VERONICA MANCILLA', NULL, '74121090', 'franco.murillo', '$2y$10$/IZFdcrpekTsFz5xcWBuj.aOvjEnernxXFbBqzJQUu2OOnFNAb1UO', NULL, '2018-07-17 22:27:56', '2018-07-17 22:27:56', NULL),
(260, 'ALEXANDER OVIDIO', 'CAPURATA AQUINO', NULL, '2007-02-28', 'varon', '52-717783', '72471600', 'ADOLFO MIER # 1500 Y PERALTA SORUCO', '7404317-OR', 'ESCOLAR', 'MAMA', NULL, '72471600', 'alexander.capurata', '$2y$10$/I2oHFeoekQPMrTXAy3kz.3X.kbzLdp351NYiUgOJ36xb2s0RdOc6', NULL, '2018-07-17 22:31:10', '2018-07-17 22:31:10', NULL),
(261, 'REBECA BELEN', 'CHIRI COPA', NULL, '2007-04-26', 'mujer', '52-70376', '72497497', 'CALLE 8 ENTRE W Y V', '7346336-OR', 'ESCOLAR', 'REBECA COPA', NULL, '68286777', 'rebeca.chiri', '$2y$10$rP1I1PCc5frMQXGMrT7LpO82qidA1WsPhrRkXzO76Q65XqqGn9U0y', NULL, '2018-07-17 22:54:38', '2018-07-17 22:54:38', NULL),
(262, 'ABRIL ADRIANA', 'HUANCA GONZALES', NULL, '2010-04-12', 'mujer', '52-31999', '68055606', 'URB. HUAJARA M 67 L1', '1490957-LPZ', 'ESCOLAR', 'SACARIAS GONZALES', NULL, '68055606', 'abril.huanca', '$2y$10$YN4YKHvHjFzV/DSMoJA8k.e9DZiueFbd2CwI4zRHY6Qdm/fAWOhAa', NULL, '2018-07-17 23:03:17', '2018-07-17 23:03:17', NULL),
(263, 'SEBASTIAN', 'MOROCHI PARRADO', NULL, '2008-10-30', 'varon', '52-47475', '72348901', 'FINAL BENI Nº 641', '13221363-OR', 'ESCOLAR', 'TEREZA PARRADO', NULL, '72348901', 'sebastian.morochi', '$2y$10$vzxE/M0pEEh9A7B0aFtece3kE8erPehFjyuv43tyKmZsN3eq/Cg9y', NULL, '2018-07-17 23:18:22', '2018-07-17 23:18:22', NULL),
(264, 'NAYA ALEJANDRA', 'TRUJILLO GONZALES', NULL, '2005-03-18', 'mujer', '52-31999', '68055606', 'URB. HUAJARA M # 64 L# 1', '14413411-LPZ', 'ESCOLAR', 'ELIZABETH COLQUE', NULL, '73836291', 'naya.trujillo', '$2y$10$ZBTHZBbvR5ett0/ALwGPQO1ZzvyiY4pcRg7YxOmtBA2z0LBIfA9T.', NULL, '2018-07-17 23:21:14', '2018-07-17 23:21:14', NULL),
(265, 'KEVIN', 'MENDOZA CONDORI', NULL, '2004-08-20', 'varon', '52-87981', '71701355', 'ANTOFAGASTA Y SEMPERTEGUI', '7333175-OR', 'ESCOLAR', 'EDSON MENDOZA', NULL, '71701355', 'kevin.mendoza', '$2y$10$J.P905JSdTnjTOCNrNc.R.rST0YGQVCX/Su.aKRNpzwc8PQaatFqq', NULL, '2018-07-17 23:24:06', '2018-07-17 23:24:06', NULL),
(266, 'MATHIAS NAHUEL', 'CACERES TANGARA', NULL, '2011-02-16', 'varon', NULL, '72480440', 'ZONA ALTO ORURO # 1350', '14078364-OR', 'ESCOLAR', 'TRIFONIA TANGARA', NULL, '72480440', 'mathias.caceres', '$2y$10$Uz9foml/zweWbXbs.8AzEOtWZ9XIswk2ZqFeVNvoLSi2USDR7mDTu', NULL, '2018-07-17 23:26:12', '2018-07-17 23:26:12', NULL),
(267, 'RODRIGO DAVID', 'ABASTO CANAZA', NULL, '2007-11-07', 'varon', '52-37082', '71856081', 'CARO # 152', '7407111-OR', 'ESCOLAR', 'CECILIA DE ABASTO', NULL, '72499998', 'rodrigo.abasto', '$2y$10$wyxJE6NFYQUDJU3g9kd7a.s.7Yf9VoLYppxBOQHFK7spyPPUOAWLu', NULL, '2018-07-17 23:28:43', '2018-07-17 23:28:43', NULL),
(268, 'CESAR TRISTAN', 'MAMANI ARIAS', NULL, '2006-10-29', 'varon', NULL, '75412900', 'C/J.M.DALENCE ENTRE ZEBALLOS TOVAR # 4', '12677842-OR', 'ESCOLAR', 'VILMA ARIAS', NULL, '67250900', 'cesar.mamani', '$2y$10$JWat1TI6s1qZnJcLVvP89OnCDs9rOkTi5zobmdEwNZ/pLb0uaWCW6', NULL, '2018-07-19 22:17:05', '2018-07-19 22:17:05', NULL),
(269, 'NORMA', 'JORGE BUSTAMANTE', NULL, '1998-12-21', 'mujer', '52-70219', '60420701', 'TARAPACA Nº 1240 AV. EJERCITO', '7614637-OR', 'UNIVERSITARIO', 'NORMA BUSTAMANTE', NULL, '72495894', 'norma.jorge', '$2y$10$4SMnwTD/I9NaE9u015nB../UHabDFchWkA1LvMa3MtoOMPMuARcma', NULL, '2018-07-24 00:16:54', '2018-07-24 00:16:54', NULL),
(270, 'NICOLE KATHERINE', 'HUARITA ADRIAN', NULL, '2000-05-19', 'mujer', '52-84591', '61657321', 'ANTOFAGASTA EJERCITO 1240 AYACUCHO', '13906251-OR', 'OTRO', 'GLADIS ADRIAN MARZE', NULL, NULL, 'nicole.huarita', '$2y$10$ePxJujifTY5YtSZCv1BUyeWxXflLG0FydlF3aKIOHy2fHUuYIoMS2', NULL, '2018-07-24 00:21:21', '2018-07-24 00:21:21', NULL),
(271, 'JORGE LUIS', 'BLACUTT FERNANDEZ', 'jblacutt41@hotmail.com', '1990-05-11', 'varon', '52-77965', '71103131', 'TARAPACA LEON Y 1RO NOVIMBRE', '3520044-OR', 'PROFESIONAL', 'ROSARIO QUINTANA BLACUTT', '52-34087', '71103131', 'jorge.blacutt', '$2y$10$3fqEpXYu.3SKtoqVkyLxV.2v1KMlDKFmSUPp20c.UwdhdQdEgrU3a', NULL, '2018-07-24 00:25:56', '2018-07-24 00:25:56', NULL),
(272, 'ALEXIS ANDRES', 'MENDIVIL MOLINA', 'aandresmendivilm@gmail.com', '1997-02-19', 'varon', '52-81136', '75418100', 'SAN FELIPE Nº 735', '9191577-LPZ', 'UNIVERSITARIO', 'MARIA', NULL, '75418100', 'alexis.mendivil', '$2y$10$koDk4EZNVgU6eLs1CBpPYeoeTCfUw9wSMJ.W5h7QmjscX.s7XtE0i', NULL, '2018-07-24 00:37:00', '2018-07-24 00:37:00', NULL),
(273, 'MONICA ANDREA', 'ZAMORANO SALINAS', 'monizamosal@gmail.com', '1993-05-22', 'mujer', '52-46665', '72495980', 'PROLONG. VELASCO GALVARRO Nº 9', '5736567-OR', 'PROFESIONAL', 'JOSE LUIS ZAMORANO', NULL, '71843041', 'monica.zamorano', '$2y$10$TBbxkcRsXo7fQIzydz2EE.NKYwA3KDGQ48Ph1lGiF5zjq5KGaURYa', NULL, '2018-07-24 00:48:44', '2018-07-24 00:48:44', NULL),
(274, 'LUZ FABIOLA', 'ARANCIBIA RAMIREZ', NULL, '1998-05-24', 'mujer', '52-61961', '75705781', 'MANUEL ASANAO PADILLA-PILCOMAYO', '7275550-OR', 'UNIVERSITARIA', 'CRISTINA RAMIREZ', NULL, '67256013', 'luz.arancibia', '$2y$10$cW7Hhe98tVgx373ABjJXpuiAApuRupLUO.VL5haFdj1L.pi4rXC2i', NULL, '2018-07-24 00:54:49', '2018-07-24 00:54:49', NULL),
(275, 'MAGDALENA', 'CUIZARA LUQUE', NULL, '1990-03-29', 'mujer', '52-88973', '68353810', 'URB. PEDRO FERRARI', '7304756-OR', 'UNIVERSITARIO', 'MAMA', NULL, '68353810', 'magdalena.cuizara', '$2y$10$orKNTeIa27rFqld7.jhQAu1ZIuUtyhSL016P.dcgHfDO4daCJCwRO', NULL, '2018-07-24 01:02:23', '2018-07-24 01:02:23', NULL),
(276, 'RENE RICKY', 'SANGUEZA GUTIERREZ', 'rickynaix_12@hotmail.com', '1999-03-04', 'varon', '52-83031', '70430365', 'LA PLATA ENTRE ALDANA Y MUGUIA', '7392069-OR', 'UNIVERSITARIO', 'NANCY GUTIERREZ NOGALES', NULL, '70420492', 'rene.sangueza', '$2y$10$dMdW6aUEcrbMQQUMAs3EXODftKWQNpDL1y3yLpsoyMu1YsPfnlKm6', NULL, '2018-07-24 01:06:38', '2018-07-24 01:06:38', NULL),
(277, 'CRISTIAN FERNANDO', 'JUAREZ FLORES', 'cristianfernando2009@hotmail.es', '1998-06-08', 'varon', '52-38495', '78611190', 'RODRIGUEZ Nº 535 LA PAZ Y 6  DE OCT.', '7362593-OR', 'UNIVERSITARIO', 'IRMA FLORES', NULL, '72489898', 'cristian.juarez', '$2y$10$iqF6Ah.qDPmndZ0fgziZWed03jwpZ0Naa567aUJ07NpsqukazYXrG', NULL, '2018-07-24 01:09:40', '2018-07-24 01:09:40', NULL),
(278, 'DANIEL', 'MICHEL LEDEZMA', NULL, '1997-04-04', 'varon', '52-38104', '61836909', 'AV. TACNA CALLE G', '7364774-OR', 'UNIVERSITARIO', 'VLADIMIR MICHEL ROJAS', '68320818', '72473547', 'daniel.michel', '$2y$10$Y1aE7zmGRJbWN5NH30vJzOIHUYKGfkldxiN5QQA7Gx.xN.2PY7CGe', NULL, '2018-07-24 01:41:47', '2018-07-24 01:41:47', NULL),
(279, 'SANDRA DENISE', 'AGUILAR MATEO', NULL, '1994-07-12', 'mujer', NULL, '67252974', 'ARGENTINA ENTRE PANAMA Nº 464', '7314943-OR', 'UNIVERSITARIO', 'OMARA VOLLARROEL OLIVERA', NULL, '67252974', 'sandra.aguilar', '$2y$10$sTPvdL6Nrme.qa6n75FEWuPHpscsMzF7yyCWEdipHi5U0Vwuhm3om', NULL, '2018-07-24 01:48:18', '2018-07-24 01:48:18', NULL),
(280, 'ALEX JHOSSEP', 'SIMONS MOYA', 'alex123desami@gmail.com', '1999-10-17', 'varon', NULL, '76182626', 'CALLE FORTIN BOQUERON 252', '12436270-TJ', 'UNIVERSITARIO', 'MILTON SIMONS CUAQUIRA', NULL, '72348444', 'alex.simons', '$2y$10$yod8Y7MeZxUgmnrraaTh2OJRgPcTB1wHCs9Eb9vF/yx6WJrl8zb4C', NULL, '2018-07-24 01:52:25', '2018-07-24 01:52:25', NULL),
(281, 'GONZALO', 'GARCIA LOPEZ', 'c.j.r.v.2011@hotmail.com', '1991-05-22', 'varon', NULL, '65411155', 'CALLE PAGADOR  Nº 6062 Y BOLIVAR', '6592617-PT', 'UNIVERSITARIO', 'PATRICIA LOPEZ', NULL, '72432368', 'gonzalo.garcia', '$2y$10$j15WdSgccEgyd1P622emhOdvbfW4PDQmEDWhFHRPsYdTY5moWXEXq', NULL, '2018-07-24 01:55:51', '2018-07-24 01:55:51', NULL),
(282, 'VANEZA', 'ARCE CHOQUE', '', '1999-09-02', 'mujer', NULL, '68319780', 'VELASCO GALVARRO ENTRE CALLE V', '7383815-OR', 'UNIVERSITARIO', 'SEFERINA ARCE', NULL, '72492398', 'vaneza.arce', '$2y$10$FAHPG5/Dd9r493/madeaqeCbmX2KFS5jWFVlSE6af7YatUM8wcVPy', NULL, '2018-07-24 02:00:36', '2018-07-24 02:00:36', NULL),
(283, 'ABIGAIL', 'RAMOS GUZMAN', NULL, '1995-06-16', 'mujer', NULL, '60435874', 'URB. SAN AGUSTIN', '7368196-OR', 'UNIVERSITARIA', 'MARIA GUZMAN', NULL, '65428170', 'abigail.ramos', '$2y$10$DzvUVITLMSWZr8j/CTIq6uW2EbAy.WwDsD7Y3dU3mYMcotaj1qJ1C', NULL, '2018-07-24 02:04:41', '2018-07-24 02:04:41', NULL),
(284, 'JOHNN ERNESTO', 'GOMEZ CLAROS', 'johncitonk@hotmail.com', '1990-03-10', 'varon', '52-52933', '72339353', 'ADOLFO MIER Nº 1289 LINARES', '7299484-OR', 'PROFESIONAL', 'MYRNA CLAROS', NULL, '72339353', 'johnn.gomez', '$2y$10$.E2ZD3Wu68Z/OS8op0L/CeysS2VJ/Q7Bmp1OJmMLK5Z3iGhE/XjAm', NULL, '2018-07-24 02:15:26', '2018-07-24 02:15:26', NULL),
(285, 'PAOLA CAROL', 'SOTELO FORONDA', 'pao_jaro28@hotmail.com', '1992-06-28', 'mujer', '52-58732', '69602868', 'POTOSI ENTRE LEON Y RODRIGUEZ', '7271572-OR', 'UNIVERSITATIA', 'AMALIA FORONDA', '52-58732', '69602868', 'paola.sotelo', '$2y$10$qD7Mdfeb1rXjdhvikBOQ3ef1CqybPzfrXwaFFmCmmNkWZKTDwQlb2', NULL, '2018-07-24 02:21:04', '2018-07-24 02:21:04', NULL),
(286, 'JOSE BRAYAN', 'HUANCA VILLARROEL', NULL, '1987-05-13', 'varon', '52-59944', '75418716', 'SORIA GALVARRO ESQ. JAEN', '7321497-OR', 'UNIVERSITARIO', 'MARLENE VILLARROEL', NULL, '73838160', 'jose.huanca', '$2y$10$LjtV25vVRV4wdEN3XhuKXuO7c177QMP2JOLV9niuEl9QiRd5hsJiW', NULL, '2018-07-24 02:25:52', '2018-07-24 02:25:52', NULL),
(287, 'MARCELO', 'JORGE CUEVAS', 'mjorge-es@udabol.edu.bo', '1994-10-25', 'varon', NULL, '79414692', 'URB. AURORA PLAN JUZTO JUEZ', '6717766-PT', 'UNIVERSITARIO', 'MAMA', NULL, '73898931', 'marcelo.jorge', '$2y$10$VmEUh0pLdFvG1PNHofJWNOTieQkRMXPtXwVaws8YFUsDNp6qA5z52', NULL, '2018-07-24 02:29:12', '2018-07-24 02:29:12', NULL),
(288, 'GERSON JAMIN', 'AGUILAR MANZANO', 'linyegerol@gmail.com', '1988-08-10', 'varon', '52-42026', '75411661', 'POTOSI Nº 4336', '5767127-OR', 'UNIVERSITARIO', 'RENE AGUILAR', NULL, '74132512', 'gerson.aguilar', '$2y$10$lSlSKd58dsxL6Ii2.09ftOLj7.EZ6UmP3YIH4oXbVYkDN.droh6o2', NULL, '2018-07-24 02:37:40', '2018-07-24 02:37:40', NULL),
(289, 'NELSON ANDRES', 'SANCHEZ VERA', 'nasu672321013011@gmail.com', '1994-11-30', 'varon', '52-85074', '75410453', 'BACOBICK Nº 1262 EJERCITO Y AYACUCHO', '4926303-LPZ', 'UNIVERSITARIO', 'JHOSSELY GABRIELA', NULL, '79410982', 'nelson.sanchez', '$2y$10$oQJqdU2QAViIHJ75a/UFlezm17.m/00LAOkgRkjPvK46X0R7fJOOe', NULL, '2018-07-24 02:41:33', '2018-07-24 02:41:33', NULL),
(290, 'NAZARET', 'CONDORI MONTAÑO', 'nazh-ret95@hotmail.com', '1995-04-30', 'mujer', '52-70299', '75412303', 'TARAPACA 2193 SANTA BARBARA', '7347108-OR', 'UNIVERSITARIO', 'NORMA MONTAÑO', NULL, '68310513', 'nazaret.condori', '$2y$10$qzDClzU6hbKaqhKZ0UcriOe/HwmJT7OzDTXPlsjgzYtpKhuMnQJoS', NULL, '2018-07-24 02:49:17', '2018-07-24 02:49:17', NULL),
(291, 'JOSELIN', 'TORO QUIROGA', 'joselin9505@GMAIL.COM', '1995-12-05', 'mujer', '52-78523', '78605605', 'AV. 24 DE JUNIO', '7318305-OR', 'UNIVERSITARIO', 'CELIA QUIROGA', NULL, '72472475', 'joselin.toro', '$2y$10$gnIHFHa0YaEsxcrhcvgoTOpEfXXqIrXvKdcsXp/6Ab1fg/XIdPpXi', NULL, '2018-07-24 02:53:40', '2018-07-24 02:53:40', NULL),
(292, 'ANA ROSA', 'VEGA NAVARRO', 'ana.rositavega@gmail.com', '1982-07-02', 'mujer', '52-84726', '70414578', '6 DE OCTUBRE MONTESINOS', '4063842-OR', 'PROFESIONAL', 'ESTHER NAVARRO', NULL, '65430530', 'ana.vega', '$2y$10$k0/jdLo/GvWJJuATBBaFDuY5KhX3XAIHta4YO0n60o0GOXjv6PCC2', NULL, '2018-07-24 02:59:04', '2018-07-24 02:59:04', NULL),
(293, 'TATIANA', 'PADILLA POMA', 'tatianachecapadilla@hotmail.com', '1991-09-12', 'varon', NULL, '71849783', 'URB. CORDEOR Nº 4', '3559660-OR', 'PROFESIONAL', 'ANTONIA POMA', NULL, '71887907', 'tatiana.padilla', '$2y$10$/QxLXDx4tq8ciluZU3jsKeSbE9VkcgMzh1P3Tis9df/DzRMIqPUXG', NULL, '2018-07-24 03:18:16', '2018-07-24 03:18:16', NULL),
(294, 'ADRIANA VALERIA', 'AYLLON TORRICO', 'adrianaayllontop@gmail.com', '1998-01-08', 'mujer', '52-52984', '69597651', 'PETOT Nº 1817 MURGUIA ALDANA', '4098766-OR', 'UNIVERSITARIA', 'MAMA', NULL, '61666165', 'adriana.ayllon', '$2y$10$FTevwomSws/YlAsS/z0X7eA.E1hzhEQtdGXrxYZ8CXPUEHDz0tizS', NULL, '2018-07-24 03:25:20', '2018-07-24 03:25:20', NULL),
(295, 'JOSE LUIS', 'CALIZAYA  PRADO', NULL, '1991-01-29', 'varon', NULL, '76740496', 'AV. ESPAÑA ENTRE AV. DEHENE Nº 2', '7378305-OR', 'PROFESIONAL', 'ZACARIAS CALIZAYA', NULL, '71182066', 'jose.calizaya', '$2y$10$.a3QVcXu9ME1J.BDciM0JeyjMZVWgmovUUD3.UjN.k.UcCsxjdzay', NULL, '2018-07-24 03:27:34', '2018-07-24 03:27:34', NULL),
(296, 'SARA', 'GONZALES QUISPE', 'princess_sad-12@hotmail.com', '1993-06-08', 'mujer', NULL, '65434201', 'MURGUIA Y QUINTANA', '7359543-OR', 'UNIVERSITARIO', 'SOFIA GONZALES QUISPE', NULL, '69600351', 'sara.gonzales', '$2y$10$FsuxpJAAZxv5vcBxseS3bugzFOQ31iZHkp.ZaxX3TAxzJ5pUPAZc6', NULL, '2018-07-24 03:31:29', '2018-07-24 03:31:29', NULL),
(297, 'FABIAN DIEGO', 'PAREJA ESPINOZA', 'efabian160@gmail.com', '2000-08-16', 'varon', '52-79754', '71108615', 'TARAPACA Nº 402 HERRERA Y 1RO DE NOV.', '5772105-OR', 'UNIVERSITARIO', 'ELGA GUADALUPE ESPINOZA RODRIGUEZ', NULL, '73839036', 'fabian.pareja', '$2y$10$dyIFCTmtwaAXKcXs6Pn61OJYecdnzfVM7iGXgpR1vYaLPCNX8nrpO', NULL, '2018-07-24 03:35:30', '2018-07-24 03:35:30', NULL);
INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `birthday`, `gender`, `phone`, `cellphone`, `address`, `identity_card`, `occupation`, `contact_person`, `contact_person_phone`, `contact_person_cellphone`, `username`, `password`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(298, 'NATALIA NICOL', 'CORREA PATIÑO', 'patricia43769@gmail.com', '2012-03-29', 'mujer', '52-30349', '75705221', 'AV. AL VALLE CALLE 6 Nº37', '14080874-OR', 'ESCOLAR', 'JHOSELIN PATIÑO CADIZ', NULL, '75718099', 'natalia.correa', '$2y$10$jAm4yMlAVia01LczAP0f0.oHx2gYLPKbt9QjU.QU5f.js1gy/Y9J2', NULL, '2018-07-24 03:56:45', '2018-07-24 03:56:45', NULL),
(299, 'FIORELLA ANGELICA', 'PAREJA ESPINOZA', NULL, '2002-02-13', 'mujer', '52-79754', '68319031', 'TARAPACA Nº 402 HERRERA Y 1RO DE NOV.', '5772104-OR', 'ESCOLAR', 'ELGA ESPINOZA', NULL, '73839036', 'fiorella.pareja', '$2y$10$nZ9ac2eWjznGJnWQH.tTQOHqW4QnuvS8aWvA0uMiH6kgFfNFXLiku', NULL, '2018-07-24 03:59:36', '2018-07-24 03:59:36', NULL),
(300, 'ALISON TANIA', 'COPA BLANCO', NULL, '2000-03-06', 'mujer', '52-35403', '61822198', 'TUPIZA No 109 WASINGTON', '7390884-OR', 'ESCOLAR', 'CELIA BLANCO CACERES', NULL, '61822198', 'alison.copa', '$2y$10$vh855ySTjhgZtf3yllHnp.etmO.mmoo.1yVI.vxK25jAYL8IVGbYW', NULL, '2018-07-24 16:34:00', '2018-07-24 16:34:00', NULL),
(301, 'JAIRO IGOR', 'COLQUE MOYA', NULL, '2003-09-25', 'varon', '52-57111', '67201603', 'URB. CORDEOR', '5768081-OR', 'ESCOLAR', 'OSCAR COLQUE', NULL, '71100000', 'jairo.colque', '$2y$10$ZxplWITbyoXok/i2e02y7eKYnTwO.WB1ZhXmL8EKhpb6TINdiY1Yy', NULL, '2018-07-24 16:37:50', '2018-07-24 16:37:50', NULL),
(302, 'PABLO JAVIER', 'UGARTE UGARTE', NULL, '2004-02-20', 'varon', '52-55239', '79401282', 'TEJERINA Nº 135 LEON RODRIGUEZ', '7284969-OR', 'ESCOLAR', 'OLGA UGARTE', NULL, '79407735', 'javier.ugarte', '$2y$10$9hy9pCRavAsg7SjiewIeVOD2TlcrYUsaChNZ4XPGXsctnsBePUBNi', NULL, '2018-07-24 16:43:11', '2018-07-24 16:43:11', NULL),
(303, 'IVANNA JHOSELINNE', 'GUTIERREZ MASSY', NULL, '2002-06-23', 'mujer', '52-31245', '73829441', 'LEON Nº 32, TACNA Y TARAPACA', '13858306-OR', 'ESCOLAR', 'GIMENA MASSY QUIROGA', '52-31245', '72342343', 'ivanna.gutierrez', '$2y$10$8iSBzMdRwQ/I.TdWSIkXEOCthhH3KZVrm.Tq3Cs9RxQSd3CnglyDe', NULL, '2018-07-24 16:48:28', '2018-07-24 16:48:28', NULL),
(304, 'ARIANA ESTEFANY', 'GARCIA QUISPE', 'estvandia@hotmail.com', '2004-06-06', 'mujer', '52-60599', '60425748', 'MAITI Nº 205 COLOMBIA', '7370637-OR', 'ESCOLAR', 'MAMA', NULL, '79400099', 'ariana.garcia', '$2y$10$.rBRNL2rpUrO5nkT3e3AgeiBRzSXn7slYLv6/7VVvsjfU9f83ST6O', NULL, '2018-07-24 17:03:18', '2018-07-24 17:03:18', NULL),
(305, 'ESTEFANIA FERNANDA', 'FLORES PEREYRA', NULL, '2001-10-16', 'mujer', '52-74114', '61833420', 'BACKOVIC 2164', '7453641-', 'ESCOLAR', 'JULIO FLORES', NULL, '72312777', 'estefania.flores', '$2y$10$0cJZZVJ952ds60seSJvUR.4K9nMhU3OKWKon1YvkCcQ0oMOqUZkrG', NULL, '2018-07-24 17:08:31', '2018-07-24 17:08:31', NULL),
(306, 'JUAN JOSE JR.', 'GOITIA PACO', NULL, '2001-01-16', 'varon', '52-73753', '72312872', 'LA PAZ TUPIZA 1RO DE NOVIEMBRE', '7359465-OR', 'ESCOLAR', 'MARIA TERESA PACO', NULL, '72312872', 'juan.goitia', '$2y$10$TOElxY5NScyACF./lr5nJunj6.Z07I4QxtbbA5ftUzHBEFUc3zeia', NULL, '2018-07-24 17:22:15', '2018-07-24 17:22:15', NULL),
(307, 'VALERIA ALEJANDRA', 'GOITIA PACO', NULL, '2003-01-27', 'mujer', '52-73753', '72312872', 'LA PAZ TUPIZA 1RO DE NOVIEMBRE', '7359464-OR', 'ESCOLAR', 'MARIA TERESA PACO', NULL, '72312872', 'valeria.goitia', '$2y$10$ET3uwhzfv8xa6dMGJGFESeL6K1wIYCme7OW9fghzGczp.vSBDBuYK', NULL, '2018-07-24 17:25:59', '2018-07-24 17:25:59', NULL),
(308, 'RONALD ALEKSEI', 'ZEPITA IQUIZE', NULL, '2002-03-12', 'varon', '52-83598', '68298098', 'CATACORA ESQ. KENEDY Nº 1000', '7388296-', 'ESCOLAR', 'MAMA', NULL, '61813538', 'ronald.zepita', '$2y$10$Uxm2VpolJyyAACf264YcEubAdZ9gkbYsLL2L0/VZpnwPnTFnXgm6.', NULL, '2018-07-24 17:29:09', '2018-07-24 17:29:09', NULL),
(309, 'ORLANDO NICOLAS', 'ARCE CABRERA', NULL, '0000-00-00', 'varon', '52-77909', '72327822', 'TACNA DIAGONAL LEON Nº 225', '3069969-', 'ESCOLAR', 'ROSA ARCE', NULL, '72327822', 'orlando.arce', '$2y$10$4Rr2szqtg5OGr427O7Yvmu4w4kKIJrUg/wWlJ.qfuNeCMonv97956', NULL, '2018-07-24 17:38:35', '2018-07-24 17:38:35', NULL),
(310, 'GABRIELA ALEJANDRA', 'MIRANDA ARIAS', NULL, '2001-04-04', 'mujer', '52-56122', '75401790', 'TOMAS FRIAS  Nº 572 IQUIQUE', '7404257-OR', 'ESCOLAR', 'PATRICIA ARIAS', NULL, '75422176', 'gabriela.miranda', '$2y$10$r3Ov3d9Uvv05VKAEcProm.scX9muqyVr5Nvg.A0NMDRdqcI0QzmsW', NULL, '2018-07-24 17:55:08', '2018-07-24 17:55:08', NULL),
(311, 'RICARDO PAUL', 'MARTINEZ BENAVIDES', NULL, '1998-08-14', 'varon', '52-44828', '72288096', 'MINCHIN ALBARRACION', '7310978-OR', 'UNIVERSITARIO', 'FIDELIA BENAVIDES', NULL, '74118233', 'ricardo.martinez', '$2y$10$TWkTH9rKljQQamQUc8MzI.viXgoEm5.sQ1qlVPlEuU/MBJ0qEe79G', NULL, '2018-07-24 18:00:19', '2018-07-24 18:00:19', NULL),
(312, 'ANDRES MICHAEL', 'GILBERT GANDARILLAS', 'soveida.gandarillas@gmail.com', '2002-06-05', 'varon', '52-76122', '76138338', 'BRASIL Nº 908 ESQ HERRERA', '7403996-OR', 'ESCOLAR', 'SOVEIDA GANDARILLAS', NULL, '76138338', 'andres.gilbert', '$2y$10$Si7/5VogePWAwfkcEBnP2uFUqjRX1kFVK246ok77F7IERogYM1F66', NULL, '2018-07-24 18:03:43', '2018-07-24 18:03:43', NULL),
(313, 'EDWIN ADHEMAR', 'CHIRINOS QUISPE', NULL, '2001-07-09', 'varon', '52-45249', '52-45249', 'BARRIO KANTUTA C/A Nº 13', '5730923-', 'ESCOLAR', 'MAMA', '52-45249', '', 'edwin.chirinos', '$2y$10$ePsUvgZrbHowOHPsoncFVOA1m959TtCVKYzTb785qAFC80AgCAbg.', NULL, '2018-07-24 18:06:10', '2018-07-24 18:06:10', NULL),
(314, 'MARVIN DANIEL', 'FLORES NOYA', NULL, '2002-12-06', 'varon', '52-37708', '78607850', 'LA PAZ AROMA BELZU Nº 494', '7314540-OR', 'ESCOLAR', 'JENNY NOYA', NULL, '76135919', 'marvin.flores', '$2y$10$.dF6INW1opuLwoDcdYJEE.HThuXEkdp17.F1VGFI27J/nqgqdfCSS', NULL, '2018-07-24 18:12:42', '2018-07-24 18:12:42', NULL),
(315, 'GASTON', 'SALINAS SOLIZ', 'gsalinas989@hotmail.com', '1980-03-01', 'varon', NULL, '70428206', 'BARRIO SAN JOSE Nº 573 - A', '3556315-OR', 'PROFESIONAL', 'GASTON SALINAS', NULL, '72330895', 'gaston.salinas', '$2y$10$gh0DHd4bG/lr7YEkOWRf4.TC8y5aFAAmLk8PSmCbGcCMKUtTMJAsq', NULL, '2018-07-24 18:16:21', '2018-07-24 18:16:21', NULL),
(316, 'MARIA EUGENIA', 'LAMAS MENDOZA', NULL, '2000-12-29', 'mujer', '52-12249', '70428454', 'PAGADOR ESQ RODRIGUEZ Nº 5090', '5766153-OR', 'ESCOLAR', 'GISELA MENDOZA', NULL, '72474221', 'maria.lamas', '$2y$10$Fqr.3EM/Cra2irZW/TlGCeMMaGNSkJQuzCk77z9/4yyafgLBHgvCS', NULL, '2018-07-24 18:21:42', '2018-07-24 18:21:42', NULL),
(317, 'RODNY JHONATAN', 'SEHUENCA FERNANDEZ', NULL, '2001-09-26', 'varon', NULL, '68309771', 'HUAJARA Nº 438', '12548681-OR', 'ESCOLAR', 'WILSON SEHUENCA', NULL, '71184528', 'rodny.sehuenca', '$2y$10$nexXhRh9TAFSo2BcinHnp.ji14BP1oVYGJ.eE02th2hEX/o6O3e66', NULL, '2018-07-24 18:24:24', '2018-07-24 18:24:24', NULL),
(318, 'MARCELO DIEGO', 'REQUENA UREÑA', NULL, '1992-12-27', 'varon', '52-59961', '72300055', 'POTOSI Nº 5431 ENTRE HERRARA Y MONTESINOS', '7336759-OR', 'PROFESIONAL', 'ABIGAIL UREÑA', NULL, '74141747', 'marcelo.requena', '$2y$10$O9zHKlZesDKmtHLF01BiROjweTS6rVzC7ikLotfCKQhYlAIALa7ZG', NULL, '2018-07-24 18:30:01', '2018-07-24 18:30:01', NULL),
(319, 'MELBY YHAMELY', 'CABALLERO QUISPE', NULL, '2002-02-06', 'mujer', '52-73014', '70434644', 'RODRIGUEZ Y TEJERINA Nº 121', '7317749-OR', 'ESCOLAR', 'ANGEL CABALLERO', NULL, '72462893', 'melby.caballero', '$2y$10$kX05rDxrbiLtyX4puABr9eCUFCF2j5RomS7.jNLwnPtnYGq1/5oKK', NULL, '2018-07-24 18:33:09', '2018-07-24 18:33:09', NULL),
(320, 'DIEGO LEONARDO', 'SOTO CHAMBY', NULL, '2003-01-14', 'varon', '52-54481', '72450683', 'AYACUCHO NNº 352 PAG. Y POTOSI', '7372174-OR', 'ESCOLAR', 'GRISELDA CHAMBI', NULL, '72454098', 'diego.soto', '$2y$10$e8qAatW5V64W9lrOqtYWmeaQnv6bjyJb4KZUDT1dDyusOWmNGvMSW', NULL, '2018-07-24 18:37:03', '2018-07-24 18:37:03', NULL),
(321, 'VIRGINIA', 'HUANCA LOPEZ', NULL, '1971-03-12', 'mujer', '52-63909', '71881488', 'AV. ESPAÑA ESQ. GRAL. ACHA # 165', '4044894-OR', 'OTRO', 'CAROL VELASQUEZ', NULL, '69727277', 'virginia.huanca', '$2y$10$0Yu5OKVeB1/Cr706LWw59uSkA8RMzXLSSy62KMHYlouhBe4G4Ub0K', NULL, '2018-07-25 00:12:37', '2018-07-25 00:12:37', NULL),
(322, 'ALEJANDRO RUBEN', 'VILLARROEL CALDERON', NULL, '2000-03-27', 'varon', '52-75152', '68326689', 'RODRIGUEZ BACOVICK Y BRASIL', '7344580-OR', 'UNIVERSITARIO', 'MILTON VILLARROEL CALDERON', NULL, '73880351', 'alejandro.villarroel', '$2y$10$aL8vPiT/GFZPF9EGOvN9fuZZtKo/SVA86PsRyuP5mHSV4qYEO28.C', NULL, '2018-07-25 00:20:30', '2018-07-25 00:20:30', NULL),
(323, 'JOSUE JAIRO', 'COPA CONDORI', NULL, '2000-04-15', 'varon', NULL, '69570415', 'AV. TOMAS BARRON # 250 Y CALLE 6', '7369127-OR', 'UNIVERSITARIO', 'mama', NULL, '69570415', 'josue.copa', '$2y$10$WsWSOjLpRq68bHORouUG6Oc/BoIWJs2paj64xJLPaKTMFxVthwK7m', NULL, '2018-07-25 01:30:20', '2018-07-25 01:30:20', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `years`
--

CREATE TABLE `years` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` int(10) UNSIGNED NOT NULL,
  `start` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `years`
--

INSERT INTO `years` (`id`, `name`, `start`, `created_at`, `updated_at`) VALUES
(1, 2018, '2018-02-05', '2018-03-24 16:21:41', '2018-03-24 16:21:41');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `administratives`
--
ALTER TABLE `administratives`
  ADD PRIMARY KEY (`id`),
  ADD KEY `administratives_user_id_foreign` (`user_id`);

--
-- Indexes for table `administrators`
--
ALTER TABLE `administrators`
  ADD PRIMARY KEY (`id`),
  ADD KEY `administrators_user_id_foreign` (`user_id`);

--
-- Indexes for table `attendances`
--
ALTER TABLE `attendances`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `balances`
--
ALTER TABLE `balances`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bimesters`
--
ALTER TABLE `bimesters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bimesters_year_id_foreign` (`year_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_language_id_foreign` (`language_id`);

--
-- Indexes for table `category_marks`
--
ALTER TABLE `category_marks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_marks_exam_type_id_foreign` (`exam_type_id`);

--
-- Indexes for table `controls`
--
ALTER TABLE `controls`
  ADD PRIMARY KEY (`id`),
  ADD KEY `controls_user_id_foreign` (`user_id`);

--
-- Indexes for table `cover_images`
--
ALTER TABLE `cover_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deposits`
--
ALTER TABLE `deposits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deposits_balance_id_foreign` (`balance_id`),
  ADD KEY `deposits_user_id_foreign` (`user_id`);

--
-- Indexes for table `deposit_items`
--
ALTER TABLE `deposit_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deposit_items_deposit_id_foreign` (`deposit_id`),
  ADD KEY `deposit_items_deposit_type_id_foreign` (`deposit_type_id`);

--
-- Indexes for table `deposit_types`
--
ALTER TABLE `deposit_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `documents_reception`
--
ALTER TABLE `documents_reception`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exam_types`
--
ALTER TABLE `exam_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exam_types_group_id_foreign` (`group_id`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `groups_teacher_id_foreign` (`teacher_id`),
  ADD KEY `groups_subject_id_foreign` (`subject_id`),
  ADD KEY `groups_bimester_id_foreign` (`bimester_id`),
  ADD KEY `groups_room_id_foreign` (`room_id`);

--
-- Indexes for table `information_marks`
--
ALTER TABLE `information_marks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `information_marks_group_id_foreign` (`group_id`),
  ADD KEY `information_marks_category_mark_id_foreign` (`category_mark_id`);

--
-- Indexes for table `item_marks`
--
ALTER TABLE `item_marks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_marks_record_id_foreign` (`record_id`),
  ADD KEY `item_marks_information_mark_id_foreign` (`information_mark_id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `levels`
--
ALTER TABLE `levels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `levels_subject_id_foreign` (`subject_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payments_balance_id_foreign` (`balance_id`),
  ADD KEY `payments_user_id_foreign` (`user_id`);

--
-- Indexes for table `payment_items`
--
ALTER TABLE `payment_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payment_items_payment_id_foreign` (`payment_id`),
  ADD KEY `payment_items_payment_type_id_foreign` (`payment_type_id`);

--
-- Indexes for table `payment_types`
--
ALTER TABLE `payment_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pensums`
--
ALTER TABLE `pensums`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pensums_language_id_foreign` (`language_id`);

--
-- Indexes for table `pensum_records`
--
ALTER TABLE `pensum_records`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pensum_records_student_id_foreign` (`student_id`),
  ADD KEY `pensum_records_pensum_id_foreign` (`pensum_id`);

--
-- Indexes for table `planes`
--
ALTER TABLE `planes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `prices`
--
ALTER TABLE `prices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `records`
--
ALTER TABLE `records`
  ADD PRIMARY KEY (`id`),
  ADD KEY `records_bimester_id_foreign` (`bimester_id`),
  ADD KEY `records_pensum_record_id_foreign` (`pensum_record_id`),
  ADD KEY `records_group_id_foreign` (`group_id`),
  ADD KEY `records_student_id_foreign` (`student_id`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subjects_pensum_id_foreign` (`pensum_id`);

--
-- Indexes for table `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `teachers_user_id_foreign` (`user_id`);

--
-- Indexes for table `tuitions`
--
ALTER TABLE `tuitions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tuitions_year_id_foreign` (`year_id`),
  ADD KEY `tuitions_pensum_record_id_foreign` (`pensum_record_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `years`
--
ALTER TABLE `years`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `administratives`
--
ALTER TABLE `administratives`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `administrators`
--
ALTER TABLE `administrators`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `attendances`
--
ALTER TABLE `attendances`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `balances`
--
ALTER TABLE `balances`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `bimesters`
--
ALTER TABLE `bimesters`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `category_marks`
--
ALTER TABLE `category_marks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `controls`
--
ALTER TABLE `controls`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `cover_images`
--
ALTER TABLE `cover_images`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `deposits`
--
ALTER TABLE `deposits`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `deposit_items`
--
ALTER TABLE `deposit_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `deposit_types`
--
ALTER TABLE `deposit_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `documents`
--
ALTER TABLE `documents`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `documents_reception`
--
ALTER TABLE `documents_reception`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `exam_types`
--
ALTER TABLE `exam_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115;

--
-- AUTO_INCREMENT for table `information_marks`
--
ALTER TABLE `information_marks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `item_marks`
--
ALTER TABLE `item_marks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `levels`
--
ALTER TABLE `levels`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=185;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `payment_items`
--
ALTER TABLE `payment_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `payment_types`
--
ALTER TABLE `payment_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `pensums`
--
ALTER TABLE `pensums`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `pensum_records`
--
ALTER TABLE `pensum_records`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=291;

--
-- AUTO_INCREMENT for table `planes`
--
ALTER TABLE `planes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `prices`
--
ALTER TABLE `prices`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `records`
--
ALTER TABLE `records`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=172;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=304;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT for table `teachers`
--
ALTER TABLE `teachers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tuitions`
--
ALTER TABLE `tuitions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=324;

--
-- AUTO_INCREMENT for table `years`
--
ALTER TABLE `years`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `administratives`
--
ALTER TABLE `administratives`
  ADD CONSTRAINT `administratives_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `administrators`
--
ALTER TABLE `administrators`
  ADD CONSTRAINT `administrators_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `bimesters`
--
ALTER TABLE `bimesters`
  ADD CONSTRAINT `bimesters_year_id_foreign` FOREIGN KEY (`year_id`) REFERENCES `years` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `category_marks`
--
ALTER TABLE `category_marks`
  ADD CONSTRAINT `category_marks_exam_type_id_foreign` FOREIGN KEY (`exam_type_id`) REFERENCES `exam_types` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `controls`
--
ALTER TABLE `controls`
  ADD CONSTRAINT `controls_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `deposits`
--
ALTER TABLE `deposits`
  ADD CONSTRAINT `deposits_balance_id_foreign` FOREIGN KEY (`balance_id`) REFERENCES `balances` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `deposits_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `deposit_items`
--
ALTER TABLE `deposit_items`
  ADD CONSTRAINT `deposit_items_deposit_id_foreign` FOREIGN KEY (`deposit_id`) REFERENCES `deposits` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `deposit_items_deposit_type_id_foreign` FOREIGN KEY (`deposit_type_id`) REFERENCES `deposit_types` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `exam_types`
--
ALTER TABLE `exam_types`
  ADD CONSTRAINT `exam_types_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `groups`
--
ALTER TABLE `groups`
  ADD CONSTRAINT `groups_bimester_id_foreign` FOREIGN KEY (`bimester_id`) REFERENCES `bimesters` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `groups_room_id_foreign` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `groups_subject_id_foreign` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `groups_teacher_id_foreign` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `information_marks`
--
ALTER TABLE `information_marks`
  ADD CONSTRAINT `information_marks_category_mark_id_foreign` FOREIGN KEY (`category_mark_id`) REFERENCES `category_marks` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `information_marks_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `item_marks`
--
ALTER TABLE `item_marks`
  ADD CONSTRAINT `item_marks_information_mark_id_foreign` FOREIGN KEY (`information_mark_id`) REFERENCES `information_marks` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `item_marks_record_id_foreign` FOREIGN KEY (`record_id`) REFERENCES `records` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `levels`
--
ALTER TABLE `levels`
  ADD CONSTRAINT `levels_subject_id_foreign` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_balance_id_foreign` FOREIGN KEY (`balance_id`) REFERENCES `balances` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `payments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `payment_items`
--
ALTER TABLE `payment_items`
  ADD CONSTRAINT `payment_items_payment_id_foreign` FOREIGN KEY (`payment_id`) REFERENCES `payments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `payment_items_payment_type_id_foreign` FOREIGN KEY (`payment_type_id`) REFERENCES `payment_types` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `pensums`
--
ALTER TABLE `pensums`
  ADD CONSTRAINT `pensums_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `pensum_records`
--
ALTER TABLE `pensum_records`
  ADD CONSTRAINT `pensum_records_pensum_id_foreign` FOREIGN KEY (`pensum_id`) REFERENCES `pensums` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pensum_records_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `records`
--
ALTER TABLE `records`
  ADD CONSTRAINT `records_bimester_id_foreign` FOREIGN KEY (`bimester_id`) REFERENCES `bimesters` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `records_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `records_pensum_record_id_foreign` FOREIGN KEY (`pensum_record_id`) REFERENCES `pensum_records` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `records_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `subjects`
--
ALTER TABLE `subjects`
  ADD CONSTRAINT `subjects_pensum_id_foreign` FOREIGN KEY (`pensum_id`) REFERENCES `pensums` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `teachers`
--
ALTER TABLE `teachers`
  ADD CONSTRAINT `teachers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tuitions`
--
ALTER TABLE `tuitions`
  ADD CONSTRAINT `tuitions_pensum_record_id_foreign` FOREIGN KEY (`pensum_record_id`) REFERENCES `pensum_records` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tuitions_year_id_foreign` FOREIGN KEY (`year_id`) REFERENCES `years` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
